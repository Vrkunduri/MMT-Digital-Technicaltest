using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using Test_Mmt.Models;
using Test_MMT.Database;

namespace Test_MMT.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class CategoreisController : ControllerBase
    {
        [HttpGet]
        public IEnumerable<AvailableCategory> Get()
        {
            IMMTShopDb mMTShop = new MMTShopDb();
         
            var result = mMTShop.GetCategories("ALL");

            if (result.Any())
            {
                return result;
            }
            else
            {
                throw new System.Exception("Data not found!");
            }
        }
    }
}
