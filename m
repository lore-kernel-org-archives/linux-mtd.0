Subject: Re: [PATCH v2] mtd: atmel-quadspi: add suspend/resume hooks
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <1528101993-4772-1-git-send-email-claudiu.beznea@microchip.com>
 <20180618114920.654647c0@bbrezillon>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8474a744-5552-932f-7ba8-85b7d95368ea@gmail.com>
Date: Mon, 18 Jun 2018 11:53:59 +0200
MIME-Version: 1.0
In-Reply-To: <20180618114920.654647c0@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/18/2018 11:49 AM, Boris Brezillon wrote:
> Hi Claudiu,
> 
> The subject prefix should be "mtd: spi-nor: atmel-quadspi: ". No need
> to send a new version just for that, I'll fix it when applying the
> patch.
> 
> Looks good otherwise. Marek, any objection? If not, can you add your
> Acked-by?

Will this work if you have ie. ubifs mounted on that QSPI NOR and you
suspect and resume during IO ? I think it would, but just curious if
there could be some problem.

> Thanks,
> 
> Boris
> 
> On Mon, 4 Jun 2018 11:46:33 +0300
> Claudiu Beznea <claudiu.beznea@microchip.com> wrote:
> 
>> Implement suspend/resume hooks.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>> ---
>>
>> Changes in v2:
>> - use __maybe_unused instead of #ifdef CONFIG_PM_SLEEP
>>
>>  drivers/mtd/spi-nor/atmel-quadspi.c | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/atmel-quadspi.c b/drivers/mtd/spi-nor/atmel-quadspi.c
>> index 6c5708bacad8..ceaaef47f02e 100644
>> --- a/drivers/mtd/spi-nor/atmel-quadspi.c
>> +++ b/drivers/mtd/spi-nor/atmel-quadspi.c
>> @@ -737,6 +737,26 @@ static int atmel_qspi_remove(struct platform_device *pdev)
>>  	return 0;
>>  }
>>  
>> +static int __maybe_unused atmel_qspi_suspend(struct device *dev)
>> +{
>> +	struct atmel_qspi *aq = dev_get_drvdata(dev);
>> +
>> +	clk_disable_unprepare(aq->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused atmel_qspi_resume(struct device *dev)
>> +{
>> +	struct atmel_qspi *aq = dev_get_drvdata(dev);
>> +
>> +	clk_prepare_enable(aq->clk);
>> +
>> +	return atmel_qspi_init(aq);
>> +}
>> +
>> +static SIMPLE_DEV_PM_OPS(atmel_qspi_pm_ops, atmel_qspi_suspend,
>> +			 atmel_qspi_resume);
>>  
>>  static const struct of_device_id atmel_qspi_dt_ids[] = {
>>  	{ .compatible = "atmel,sama5d2-qspi" },
>> @@ -749,6 +769,7 @@ static struct platform_driver atmel_qspi_driver = {
>>  	.driver = {
>>  		.name	= "atmel_qspi",
>>  		.of_match_table	= atmel_qspi_dt_ids,
>> +		.pm	= &atmel_qspi_pm_ops,
>>  	},
>>  	.probe		= atmel_qspi_probe,
>>  	.remove		= atmel_qspi_remove,


-- 
Best regards,
Marek Vasut
