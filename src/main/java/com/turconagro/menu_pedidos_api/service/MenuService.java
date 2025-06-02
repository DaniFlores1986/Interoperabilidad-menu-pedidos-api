package com.turconagro.menu_pedidos_api.service;

import com.turconagro.menu_pedidos_api.model.Menu;
import com.turconagro.menu_pedidos_api.repository.MenuRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MenuService {

    private final MenuRepository menuRepository;

    public MenuService(MenuRepository menuRepository) {
        this.menuRepository = menuRepository;
    }

    public List<Menu> obtenerTodos() {
        return menuRepository.findAll();
    }

    public Optional<Menu> obtenerPorId(Long id) {
        return menuRepository.findById(id);
    }

    public Menu guardar(Menu menu) {
        return menuRepository.save(menu);
    }

    public void eliminar(Long id) {
        menuRepository.deleteById(id);
    }
}