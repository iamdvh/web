package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class BuildingService implements IBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private BuildingConverter buildingConverter;

    @Override
    public List<BuildingDTO> findAll(Map<String, Object> params) {
        return buildingRepository.findAll(params).stream().map(
                b -> buildingConverter.convertToDto(b)
        ).collect(Collectors.toList());
    }

    @Override
    public BuildingDTO create(BuildingDTO request) {
        BuildingEntity entity = buildingConverter.convertToEntity(request);
        return buildingConverter.convertToDto(buildingRepository.save(entity));
    }
}
