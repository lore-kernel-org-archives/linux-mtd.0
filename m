Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1esWve-0004zH-JH
 for linux-mtd@lists.infradead.org; Sun, 04 Mar 2018 16:56:08 +0000
Subject: Re: [PATCH] mtd: spi-nor: Remove unneeded driver.bus assignment
To: Han Xu <han.xu@nxp.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <20180214124625.30765-1-boris.brezillon@bootlin.com>
 <d5224efa-bea9-66f7-689d-534607a4cb3b@nxp.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <c9eadf9d-acde-18ca-9a0d-bffef33d4d91@wedev4u.fr>
Date: Sun, 4 Mar 2018 17:55:32 +0100
MIME-Version: 1.0
In-Reply-To: <d5224efa-bea9-66f7-689d-534607a4cb3b@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 14/02/2018 à 17:09, Han Xu a écrit :
> 
> 
> On 02/14/2018 06:46 AM, Boris Brezillon wrote:
>> platform_driver_register() takes care of assigning driver->bus
>> to &platform_bus_type, no need to explicitly assign it in the driver.
>>
>> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Applied to the spi-nor/next branch of linux-mtd

Thanks!

>> ---
>>   drivers/mtd/spi-nor/fsl-quadspi.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
>> index 2901c7bd9e30..dc9914fce296 100644
>> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
>> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
>> @@ -1174,7 +1174,6 @@ static int fsl_qspi_resume(struct platform_device *pdev)
>>   static struct platform_driver fsl_qspi_driver = {
>>   	.driver = {
>>   		.name	= "fsl-quadspi",
>> -		.bus	= &platform_bus_type,
>>   		.of_match_table = fsl_qspi_dt_ids,
>>   	},
>>   	.probe          = fsl_qspi_probe,
> Acked-by: Han Xu <han.xu@nxp.com>
> 
