using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net;
using System.Text;
using Test_Mmt.Models;
using System.Web;

namespace Test_MMTConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("1.Get Available Categories");
            Console.WriteLine("2.Get Products");
            var input = Console.ReadLine();

            string apiUrl = "http://localhost:4756/";

            WebClient client = new WebClient();
            client.Headers["Content-type"] = "application/json";
            client.Encoding = Encoding.UTF8;

            switch (input)
                {
                case "1":
                    string json = client.DownloadString(apiUrl + "AvailableCategory");

                    var categories = JsonConvert.DeserializeObject<List<AvailableCategory>>(json);

                    Console.WriteLine($"Available Categories:");
                    foreach (AvailableCategory category in categories)
                    {
                        Console.WriteLine(category.Category);
                    }
                    break;
                case "2":
                    Console.WriteLine("Please enter the Category: ");
                        var input1 = Console.ReadLine();
                    try
                    {
                        string json2 = client.DownloadString(apiUrl + "productsbycategory/" + input1);

                        var products = JsonConvert.DeserializeObject<List<ProductsByCategory>>(json2);

                        Console.WriteLine($"Available Products:");
                        foreach (var product in products)
                        {
                            Console.WriteLine($"Name: {product.Name}, Description: {product.Description}, Price: {product.Price}");
                        }
                    }
                    catch(Exception ex)
                    {
                        Console.WriteLine($"No available products found for given category: {input1}");
                    }
                    break;
                default:
                    Console.WriteLine("Invalid input");
                    break;

            }

            Console.ReadLine();
        }
    }
}