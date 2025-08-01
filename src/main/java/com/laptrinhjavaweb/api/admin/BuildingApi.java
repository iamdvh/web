package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.StaffDTO;
import com.laptrinhjavaweb.service.IBuildingService;
import com.laptrinhjavaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController("buildingApiOfAdmin")
@RequestMapping("/api/building")
public class BuildingApi {
    @Autowired
    private IBuildingService buildingService;
    @Autowired
    private IUserService userService;

    @PostMapping()
    public BuildingDTO createBuilding(@RequestBody BuildingDTO buildingDTO) {
        return buildingService.create(buildingDTO);
    }

    @GetMapping("/{buildingId}/staff")
    public List<StaffDTO> findStaff(@PathVariable(value = "buildingId") String buidingId) {
        return userService.findStaffs(buidingId);
    }


}
