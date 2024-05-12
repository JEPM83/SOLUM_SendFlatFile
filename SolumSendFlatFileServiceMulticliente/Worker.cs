using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;


namespace SolumSendFlatFileServiceMulticliente
{
    public class Worker : BackgroundService
    {
        private readonly ILogger<Worker> _logger;

        public Worker(ILogger<Worker> logger)
        {
            _logger = logger;
        }
        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                SolumSendFlatFileService.Program Tracking = new SolumSendFlatFileService.Program();
                Tracking.Servicio();
                _logger.LogInformation($"{nameof(ExecuteAsync)} running at: {DateTimeOffset.Now}");
                await Task.Delay(1000, stoppingToken);
            }
        }
        public override async Task StartAsync(CancellationToken cancellationToken)
        {
            // DO YOUR STUFF HERE
            await base.StartAsync(cancellationToken);
        }
        public override async Task StopAsync(CancellationToken cancellationToken)
        {
            // DO YOUR STUFF HERE
            await base.StopAsync(cancellationToken);
        }
        public override void Dispose()
        {
            // DO YOUR STUFF HERE
        }
    }
}
