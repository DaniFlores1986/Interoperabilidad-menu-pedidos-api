package com.turconagro.menu_pedidos_api.service;

import com.turconagro.menu_pedidos_api.model.Pedido;
import com.turconagro.menu_pedidos_api.repository.PedidoRepository;
import org.springframework.stereotype.Service;

@Service
public class NotificadorService {

    public void notificarPedido(Pedido pedido) {
        // Notificaci�n mock (se puede reemplazar por env�o de email, SMS, etc.)
        System.out.println("?? Notificaci�n: Se ha creado un nuevo pedido para " + pedido.getCliente());
    }
}

