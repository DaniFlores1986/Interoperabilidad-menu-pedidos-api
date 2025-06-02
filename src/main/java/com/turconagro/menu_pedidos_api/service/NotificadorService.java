package com.turconagro.menu_pedidos_api.service;

import com.turconagro.menu_pedidos_api.model.Pedido;
import com.turconagro.menu_pedidos_api.repository.PedidoRepository;
import org.springframework.stereotype.Service;

@Service
public class NotificadorService {

    public void notificarPedido(Pedido pedido) {
        // Notificación mock (se puede reemplazar por envío de email, SMS, etc.)
        System.out.println("?? Notificación: Se ha creado un nuevo pedido para " + pedido.getCliente());
    }
}

