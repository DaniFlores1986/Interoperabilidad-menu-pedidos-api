package com.turconagro.menu_pedidos_api.service;

import com.turconagro.menu_pedidos_api.model.Pedido;
import com.turconagro.menu_pedidos_api.repository.PedidoRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PedidoService {
	private final PedidoRepository pedidoRepository;

	public PedidoService(PedidoRepository pedidoRepository) {
		this.pedidoRepository = pedidoRepository;
	}

	public List<Pedido> obtenerPedidos() {
		return pedidoRepository.findAll();
	}

	public Optional<Pedido> obtenerPedidoPorId(Long id) {
		return pedidoRepository.findById(id);
	}

	public Pedido crearPedido(Pedido pedido) {
		return pedidoRepository.save(pedido);
	}

	public Optional<Pedido> actualizarEstado(Long id, String nuevoEstado) {
		return pedidoRepository.findById(id).map(pedido -> {
			pedido.setEstado(nuevoEstado);
			return pedidoRepository.save(pedido);
		});
	}

	public boolean eliminarPedido(Long id) {
		if (pedidoRepository.existsById(id)) {
			pedidoRepository.deleteById(id);
			return true;
		}
		return false;
	}
}