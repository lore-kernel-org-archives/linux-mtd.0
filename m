Received: from 5.mo3.mail-out.ovh.net ([87.98.178.36])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEOnt-0007Bx-BV
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 23:05:42 +0000
Received: from player693.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 4087C637EF
 for <linux-mtd@lists.infradead.org>; Wed,  7 Dec 2016 00:05:09 +0100 (CET)
Subject: Re: [PATCH 1/1] mtd: spi-nor: improve macronix_quad_enable()
To: Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <5b7ad2367d9b6a4e3a766ce6cadf16c313a03a26.1481039788.git.cyrille.pitchen@atmel.com>
 <5962912d-b5de-f0d0-077b-af3b9ff2a77c@gmail.com>
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, richard@nod.at
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <c5bf49e1-fd4b-7d33-3d15-3ad4ac1174fa@wedev4u.fr>
Date: Wed, 7 Dec 2016 00:05:01 +0100
MIME-Version: 1.0
In-Reply-To: <5962912d-b5de-f0d0-077b-af3b9ff2a77c@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 06/12/2016 à 20:01, Marek Vasut a écrit :
> On 12/06/2016 05:01 PM, Cyrille Pitchen wrote:
>> The patch checks whether the Quad Enable bit is already set in the Status
>> Register. If so, the function exits immediately with a successful return
>> code.
> 
> Performance optimization I presume ?

Performance optimization is one benefit but this real purpose of the
patch is to avoid writing over and over a non-volatile bit at each boot,
actually each time spi_nor_scan() is called.

To be honest, I don't know whether internally the SPI memory is clever
enough not to perform the actual write when it sees the bit value has
not changed. I wanted to improve the memory lifetime by avoiding the
update of the bit from software just to be sure :)

Anyway, thanks for your review!

> 
> Acked-by: Marek Vasut <marek.vasut@gmail.com>
> 
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> Reviewed-by: Jagan Teki <jagan@openedev.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index da7cd69d4857..1fd32b991eb7 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1216,6 +1216,9 @@ static int macronix_quad_enable(struct spi_nor *nor)
>>  	val = read_sr(nor);
>>  	if (val < 0)
>>  		return val;
>> +	if (val & SR_QUAD_EN_MX)
>> +		return 0;
>> +
>>  	write_enable(nor);
>>  
>>  	write_sr(nor, val | SR_QUAD_EN_MX);
>>
> 
> 
