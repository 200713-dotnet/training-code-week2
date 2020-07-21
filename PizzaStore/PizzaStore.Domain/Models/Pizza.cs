using System.Collections.Generic;

namespace PizzaStore.Domain.Models
{
  public class Pizza
  {
    public List<Topping> Toppings { get; set; }
    public Crust Crust { get; set; }
    public Size Size { get; set; }
  }
}