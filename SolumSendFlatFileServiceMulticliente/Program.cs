using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.EventLog;

namespace SolumSendFlatFileServiceMulticliente
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args).UseWindowsService()
                .ConfigureLogging(options => options.AddFilter<EventLogLoggerProvider>(level => level >= LogLevel.Information))
                .ConfigureServices((hostContext, services) =>
                {
                    // services.AddHostedService<Worker>();
                    services.AddHostedService<Worker>()
                    .Configure<EventLogSettings>(config => 
                    { 
                            config.LogName = "ServicioSendFlatFileMulticliente"; 
                            config.SourceName = "Servicio SendFlatFile Multicliente"; 
                    });
                });
    }
}
