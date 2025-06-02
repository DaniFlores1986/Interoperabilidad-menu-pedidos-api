package com.turconagro.menu_pedidos_api.controller;

import com.turconagro.menu_pedidos_api.model.Menu;
import com.turconagro.menu_pedidos_api.repository.MenuRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/admin")
public class AdminController {
    private final MenuRepository menuRepository;

    public AdminController(MenuRepository menuRepository) {
        this.menuRepository = menuRepository;
    }

    @GetMapping("/menus")
    public List<Menu> listarMenus() {
        return menuRepository.findAll();
    }

    @PostMapping("/menus")
    public Menu nuevoMenu(@RequestBody Menu menu) {
        return menuRepository.save(menu);
    }
}