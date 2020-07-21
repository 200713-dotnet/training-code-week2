using System;
using System.Collections.Generic;

namespace PizzaStore.Domain.Models
{
  public class Order
  {
    public List<Pizza> Pizzas { get; set; }
    public DateTime DateOrdered { get; set; }

    public void CreatePizza()
    {
      Pizzas.Add(new Pizza());
    }
  }
}