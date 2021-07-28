using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using Test_MMT.Database;
using Test_Mmt.Models;
using Microsoft.Extensions.Configuration;

namespace Test_MMT.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class AvailableCategoryController : ControllerBase
    {

        [HttpGet]
        public IEnumerable<AvailableCategory> Get()
        {
            IMMTShopDb mMTShop = new MMTShopDb();

            var result = mMTShop.GetCategories("available");

            if(result.Any())
            {
                return (IEnumerable<AvailableCategory>)result;
            }
            else
            {
                throw new System.Exception("Data not found!");
            }
        }
    }
}
