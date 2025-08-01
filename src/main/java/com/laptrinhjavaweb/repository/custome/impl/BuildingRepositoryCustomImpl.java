package com.laptrinhjavaweb.repository.custome.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.repository.custome.BuildingRepositoryCustom;
import com.laptrinhjavaweb.utils.CheckUtils;
import com.laptrinhjavaweb.utils.MapUtils;
import com.laptrinhjavaweb.utils.NumberUtils;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Repository
public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<BuildingEntity> findAll(Map<String, Object> params) {
        StringBuilder sql = new StringBuilder("SELECT * FROM building b ");
        sql = buildingJoining(params, sql);
        sql.append(SystemConstant.ONE_EQUAL_ONE);
        sql = buildingCommon(params, sql);
        sql = buidingSpeciel(params, sql);
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }


    private StringBuilder buildingJoining(Map<String, Object> params, StringBuilder sql) {
        Long staffId = MapUtils.getObject(params, "staffid", Long.class);
        if (!CheckUtils.isNull(staffId)) {
            sql.append(" join assignmentbuilding ab on ab.buildingid = b.id join user u on u.id = ab.staffid");
        }
        return sql;
    }

    private StringBuilder buildingCommon(Map<String, Object> params, StringBuilder sql) {
        for (Map.Entry<String, Object> item : params.entrySet()) {
            if (!item.getKey().equals("types")
                    && !item.getKey().equals("districtcode")
                    && !item.getKey().equals("staffid")
                    && !item.getKey().startsWith("rentarea")
                    && !item.getKey().startsWith("rentprice")
            ) {
                String value = item.getValue().toString();
                if (NumberUtils.isInteger(value)) {
                    sql.append(" and b." + item.getKey().toLowerCase() + " = " + Integer.parseInt(value) + "");
                } else {
                    if (!CheckUtils.isNullOrEmpty(value)) {
                        sql.append(" and b." + item.getKey().toLowerCase() + " like '%" + value + "%'");
                    }

                }
            }
        }
        return sql;
    }

    private StringBuilder buidingSpeciel(Map<String, Object> params, StringBuilder sql) {
        String districtCode = MapUtils.getObject(params, "districtcode", String.class);
        String type = MapUtils.getObject(params, "type", String.class);
        Long staffId = MapUtils.getObject(params, "staffid", Long.class);
        Integer rentPriceFrom = MapUtils.getObject(params, "rentpricefrom", Integer.class);
        Integer rentPriceTo = MapUtils.getObject(params, "rentpriceto", Integer.class);
        Integer rentAreaFrom = MapUtils.getObject(params, "rentareafrom", Integer.class);
        Integer rentAreaTo = MapUtils.getObject(params, "rentareato", Integer.class);

        if (!CheckUtils.isNullOrEmpty(districtCode)) {
            sql.append(" and b.district = '" +districtCode+"'");
        }

        if(!CheckUtils.isNullOrEmpty(type)) {
            List<String> types = Arrays.asList(type.split(","));
            types.stream().map(t ->  sql.append(" and b.type like %'"+t.toUpperCase())+"'%");
        }



        if (!CheckUtils.isNull(staffId)) {
            sql.append(" and ab.staffid = "+staffId);
        }
        if (!CheckUtils.isNull(rentPriceFrom)) {
            sql.append(" and b.rentprice >= " + rentPriceFrom);
        }
        if (!CheckUtils.isNull(rentPriceTo)) {
            sql.append(" and b.rentprice <= " + rentPriceTo);
        }

        if (!CheckUtils.isNull(rentAreaFrom) || !CheckUtils.isNull(rentAreaTo)) {
            sql.append(" and exists ( select value from rentarea ra where b.id = ra.buildingid");
            if (!CheckUtils.isNull(rentAreaFrom)) {
                sql.append(" and ra.value >= " + rentAreaFrom);
            }
            if (!CheckUtils.isNull(rentAreaTo)) {
                sql.append(" and ra.value <= " + rentAreaTo);
            }
            sql.append(")");
        }
        return sql;
    }
}
