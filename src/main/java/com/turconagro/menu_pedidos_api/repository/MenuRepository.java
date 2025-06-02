package com.turconagro.menu_pedidos_api.repository;

import com.turconagro.menu_pedidos_api.model.Menu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MenuRepository extends JpaRepository<Menu, Long> {
}