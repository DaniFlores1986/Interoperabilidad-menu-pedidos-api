package com.turconagro.menu_pedidos_api.repository;

import com.turconagro.menu_pedidos_api.model.Pedido;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PedidoRepository extends JpaRepository<Pedido, Long> {
}
