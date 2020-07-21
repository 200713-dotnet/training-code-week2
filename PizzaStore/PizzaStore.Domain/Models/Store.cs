using System.Collections.Generic;

namespace PizzaStore.Domain.Models
{
  public class Store
  {
    public List<Order> Orders { get; set; }
    public string Name { get; set; }

    public Order CreateOrder()
    {
      return new Order();
    }
  }
}