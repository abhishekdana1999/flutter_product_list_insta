import 'package:flutter_bloc/flutter_bloc.dart';

class CartEvent {}

class AddToCartEvent extends CartEvent {
  final Map item;
  AddToCartEvent(this.item);
}

class RemoveFromCartEvent extends CartEvent {
  final Map item;
  RemoveFromCartEvent(this.item);
}

class ClearCartEvent extends CartEvent {}

class CartState {
  final Map<Map, int> items; // Store items and their quantities

  CartState(this.items);

  // Create a copy of the state with updated items
  CartState copyWith(Map<Map, int> updatedItems) {
    return CartState(updatedItems);
  }
}

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState({})) {
    // Register handlers for events
    on<AddToCartEvent>(_onAddToCart);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
    on<ClearCartEvent>(_onClearCart); // Correct type handling for ClearCartEvent
  }

  // Handle adding an item to the cart
  void _onAddToCart(AddToCartEvent event, Emitter<CartState> emit) {
    final updatedItems = Map<Map, int>.from(state.items);
    updatedItems[event.item] = (updatedItems[event.item] ?? 0) + 1;
    emit(state.copyWith(updatedItems));
  }

  // Handle removing an item from the cart
  void _onRemoveFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    final updatedItems = Map<Map, int>.from(state.items);
    if (updatedItems.containsKey(event.item) && updatedItems[event.item]! > 1) {
      updatedItems[event.item] = updatedItems[event.item]! - 1;
    } else {
      updatedItems.remove(event.item);
    }
    emit(state.copyWith(updatedItems));
  }

  // Handle clearing the cart
  void _onClearCart(ClearCartEvent event, Emitter<CartState> emit) {
    // Clear all items from the cart
    emit(state.copyWith({}));
  }
}
