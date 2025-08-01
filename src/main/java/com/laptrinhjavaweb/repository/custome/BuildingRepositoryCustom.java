package com.laptrinhjavaweb.repository.custome;

import com.laptrinhjavaweb.entity.BuildingEntity;

import java.util.List;
import java.util.Map;

public interface BuildingRepositoryCustom {
    List<BuildingEntity> findAll(Map<String, Object> params);
}
