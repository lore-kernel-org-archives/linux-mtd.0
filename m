Received: from 13.mo6.mail-out.ovh.net ([188.165.56.124])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNRWB-0000az-4A
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 22:21:05 +0000
Received: from player774.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 7A4EFED35E
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2017 00:20:40 +0200 (CEST)
Subject: Re: [PATCH 2/2] mtd: spi-nor: add Dual and Quad read mode support to
 some flash devices
To: Marek Vasut <marek.vasut@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
References: <1492610420-12397-1-git-send-email-clg@kaod.org>
 <1492610420-12397-3-git-send-email-clg@kaod.org>
 <ab889dad-bd43-9e8b-d3c9-cf6d4be64a23@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <8fdc155e-ab20-51f5-9200-f41731c90f45@wedev4u.fr>
Date: Wed, 21 Jun 2017 00:20:32 +0200
MIME-Version: 1.0
In-Reply-To: <ab889dad-bd43-9e8b-d3c9-cf6d4be64a23@gmail.com>
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

Le 19/04/2017 à 16:05, Marek Vasut a écrit :
> On 04/19/2017 04:00 PM, Cédric Le Goater wrote:
>> These devices are used on OpenPOWER systems. The SPI_NOR_DUAL_READ
>> flags is added for the Aspeed SoCs which do not support QUAD reads.
> 
> It's added more like because the chip supports it ;-)
> 
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
>

Applied to the spi-nor/next branch of l2-mtd

Thanks!


>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>  The lines are over 80 characters but it looks better.
>>
>>  drivers/mtd/spi-nor/spi-nor.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index ee777df4466c..f029fb7a3edc 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1016,10 +1016,10 @@ static const struct flash_info spi_nor_ids[] = {
>>  	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
>>  	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>> -	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
>> +	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>  	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K) },
>>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>> -	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
>> +	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>  	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
>>  
>> @@ -1031,7 +1031,7 @@ static const struct flash_info spi_nor_ids[] = {
>>  	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
>>  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>> -	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>> +	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>>  	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>>  	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>> @@ -1150,7 +1150,7 @@ static const struct flash_info spi_nor_ids[] = {
>>  	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
>>  	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
>>  	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
>> -	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K) },
>> +	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>  
>>  	/* Catalyst / On Semiconductor -- non-JEDEC */
>>  	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>>
> 
> 
