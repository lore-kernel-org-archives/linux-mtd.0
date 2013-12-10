Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqQsb-00070B-QL
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 17:13:54 +0000
Message-ID: <52A74BB1.20504@ti.com>
Date: Tue, 10 Dec 2013 22:43:21 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCHv2 04/10] spi/qspi: configure set up register for memory
 map.
References: <1386339891-32717-1-git-send-email-sourav.poddar@ti.com>
 <1386339891-32717-5-git-send-email-sourav.poddar@ti.com>
 <201312101357.54874.marex@denx.de>
In-Reply-To: <201312101357.54874.marex@denx.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, balbi@ti.com,
 linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 10 December 2013 06:27 PM, Marek Vasut wrote:
> On Friday, December 06, 2013 at 03:24:45 PM, Sourav Poddar wrote:
>> These add api to configure set up registers which will be used
>> for memory mapped operations.
>>
>> These was provided as a pointer in the earlier patch and can be
>> used by the slave devices to configure the master controller as an
>> when required according to the usecases.
>>
>> Signed-off-by: Sourav Poddar<sourav.poddar@ti.com>
>> ---
>>   drivers/spi/spi-ti-qspi.c |   29 +++++++++++++++++++++++++++++
>>   1 files changed, 29 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
>> index 48294d1..e4a8afc 100644
>> --- a/drivers/spi/spi-ti-qspi.c
>> +++ b/drivers/spi/spi-ti-qspi.c
>> @@ -117,6 +117,10 @@ struct ti_qspi {
>>   #define MEM_CS		(1<<  8)
>>   #define MEM_CS_DIS	(0<<  8)
>>
>> +#define QSPI_SETUP0_RD_NORMAL   (0x0<<  12)
>> +#define QSPI_SETUP0_RD_DUAL     (0x1<<  12)
>> +#define QSPI_SETUP0_RD_QUAD     (0x3<<  12)
>> +
>>   #define	QSPI_FRAME			4096
>>
>>   #define QSPI_AUTOSUSPEND_TIMEOUT         2000
>> @@ -220,6 +224,30 @@ static int ti_qspi_setup(struct spi_device *spi)
>>   	return 0;
>>   }
>>
>> +static void ti_qspi_configure_from_slave(struct spi_device *spi)
>> +{
>> +	struct ti_qspi  *qspi = spi_master_get_devdata(spi->master);
>> +	struct slave_info info = spi->info;
>> +	u32 memval, mode;
>> +
>> +	mode = spi->mode&  (SPI_RX_DUAL | SPI_RX_QUAD);
>> +	memval =  (info.read_opcode<<  0) | (info.program_opcode<<  16) |
>> +		((info.addr_width - 1)<<  8) | (info.dummy_cycles<<  10);
>> +
>> +	switch (mode) {
>> +	case SPI_RX_DUAL:
>> +		memval |= QSPI_SETUP0_RD_DUAL;
>> +		break;
>> +	case SPI_RX_QUAD:
>> +		memval |= QSPI_SETUP0_RD_QUAD;
>> +		break;
>> +	default:
> You want to catch invalid/unsupported mode here instead, so please add 'case 0:'
> for 1-bit transfer and treat default: as an error .
>
Ok. make sense. will change that in v3.
>> +		memval |= QSPI_SETUP0_RD_NORMAL;
>> +		break;
>> +	}
>> +	ti_qspi_write(qspi, memval, QSPI_SPI_SETUP0_REG);
>> +}
>> +
>>   static void ti_qspi_restore_ctx(struct ti_qspi *qspi)
>>   {
>>   	struct ti_qspi_regs *ctx_reg =&qspi->ctx_reg;
>> @@ -488,6 +516,7 @@ static int ti_qspi_probe(struct platform_device *pdev)
>>   	master->dev.of_node = pdev->dev.of_node;
>>   	master->bits_per_word_mask = BIT(32 - 1) | BIT(16 - 1) | BIT(8 - 1);
>>   	master->mmap = true;
>> +	master->configure_from_slave = ti_qspi_configure_from_slave;
>>
>>   	if (!of_property_read_u32(np, "num-cs",&num_cs))
>>   		master->num_chipselect = num_cs;
> Best regards,
> Marek Vasut
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
