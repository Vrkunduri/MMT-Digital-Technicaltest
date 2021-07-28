using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Test_Mmt.Models;

namespace Test_MMT.Database
{
    public class MMTShopDb : IMMTShopDb
    {
        string MyConnStr = Startup.MyCon;

       
        public List<ProductsByCategory> GetProductByCategories(string category)
        {
            List<ProductsByCategory> categories = new List<ProductsByCategory>();
          
            try
            {
                using (SqlConnection con = new SqlConnection(MyConnStr))
                {
                    using (SqlCommand cmd = new SqlCommand("Test_ProductByCategories", con))
                    {
                        con.Open();
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("@category", System.Data.SqlDbType.VarChar, 20).Value = category;


                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                categories.Add(new ProductsByCategory { Name = reader["Name"].ToString(),
                               Description = reader["DESCRIPTION"].ToString(),
                                Price = (float)Convert.ToDecimal(reader["PRICE"].ToString()) });
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }

            return categories;
        }

        public List<AvailableCategory> GetCategories(string category)
        {
            List<AvailableCategory> categories = new List<AvailableCategory>();
           
            try
            {
                using (SqlConnection con = new SqlConnection(MyConnStr))
                {
                    using (SqlCommand cmd = new SqlCommand("Test_AvailableCategories", con))
                    {
                        con.Open();
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("@category", System.Data.SqlDbType.VarChar, 20).Value = category;

                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                categories.Add(new AvailableCategory { Category = reader["Category"].ToString() });
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }

            return categories;
        }
    }

    public interface IMMTShopDb
    {
        public List<ProductsByCategory> GetProductByCategories(string category);

        public List<AvailableCategory> GetCategories(string category);
    }
}
