using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using Test_MMT.Database;
using Test_Mmt.Models;

namespace Test_MMT.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductsByCategoryController
    {
        [HttpGet("{category}")]
        public IEnumerable<ProductsByCategory> Get(string category)
        {
            if (string.IsNullOrEmpty(category))
            {
                throw new System.ArgumentException("Invalid input");
            }
            IMMTShopDb result = new MMTShopDb();
            var res = result.GetProductByCategories(category);

            if (res.Count != 0) { 
                return res;
            }
            else
            {
                throw new System.Exception($"Products not found for category {category}");
            }

        }
    }
}
