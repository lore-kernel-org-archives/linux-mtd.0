Received: from 14.mo6.mail-out.ovh.net ([46.105.56.113])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNRGz-0000r6-9c
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 22:05:23 +0000
Received: from player774.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id BB1CDED233
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2017 00:04:57 +0200 (CEST)
Subject: Re: [PATCH 1/2] mtd: spi-nor: Add support for Macronix mx66l1g45g spi
 flash
To: Marek Vasut <marek.vasut@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
References: <1492610420-12397-1-git-send-email-clg@kaod.org>
 <1492610420-12397-2-git-send-email-clg@kaod.org>
 <6a7e7585-5989-8feb-cec1-3e4e78787d5e@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <433d4e5b-069b-d942-62d3-59d62c1999d2@wedev4u.fr>
Date: Wed, 21 Jun 2017 00:04:49 +0200
MIME-Version: 1.0
In-Reply-To: <6a7e7585-5989-8feb-cec1-3e4e78787d5e@gmail.com>
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

Le 19/04/2017 à 16:04, Marek Vasut a écrit :
> On 04/19/2017 04:00 PM, Cédric Le Goater wrote:
>> These modules are used on the OpenPOWER Witherspoon systems to hold
>> the POWER9 host firmware image. The SPI_NOR_DUAL_READ flags is added
>> for the Aspeed SoCs which do not support QUAD reads.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
>

Applied to the spi-nor/next branch of l2-mtd

Thanks!

>> ---
>>
>>  The line is over 80 characters but it looks better.
>>
>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 747645c74134..ee777df4466c 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1020,6 +1020,7 @@ static const struct flash_info spi_nor_ids[] = {
>>  	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K) },
>>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>>  	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
>> +	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
>>  
>>  	/* Micron */
>>
> 
> 
