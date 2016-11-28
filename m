Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBHDl-0001SK-CO
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2016 08:23:30 +0000
Subject: Re: [PATCH] mtd: spi-nor: Add at25df321 spi-nor flash support
To: <Wenyou.Yang@microchip.com>, <jteki@openedev.com>,
 <linux-mtd@lists.infradead.org>
References: <1469522274-10478-1-git-send-email-jteki@openedev.com>
 <F9F4555C4E01D7469D37975B62D0EFBB38C872@CHN-SV-EXMX07.mchp-main.com>
CC: <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <linux-kernel@vger.kernel.org>, <wenyou.yang@atmel.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <cf93fe51-cd85-4328-e537-a741a96e8879@atmel.com>
Date: Mon, 28 Nov 2016 09:23:05 +0100
MIME-Version: 1.0
In-Reply-To: <F9F4555C4E01D7469D37975B62D0EFBB38C872@CHN-SV-EXMX07.mchp-main.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 29/07/2016 ¨¤ 02:34, Wenyou.Yang@microchip.com a ¨¦crit :
> 
> 
>> -----Original Message-----
>> From: Jagan Teki [mailto:jteki@openedev.com]
>> Sent: 2016Äê7ÔÂ26ÈÕ 16:38
>> To: linux-mtd@lists.infradead.org
>> Cc: David Woodhouse <dwmw2@infradead.org>; linux-kernel@vger.kernel.org;
>> Jagan Teki <jteki@openedev.com>; Brian Norris
>> <computersforpeace@gmail.com>; Wenyou Yang <wenyou.yang@atmel.com>
>> Subject: [PATCH] mtd: spi-nor: Add at25df321 spi-nor flash support
>>
>> Add Atmel at25df321 spi-nor flash to the list of spi_nor_ids.
>>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Cc: Wenyou Yang <wenyou.yang@atmel.com>
>> Signed-off-by: Jagan Teki <jteki@openedev.com>
> 
> Acked-by Wenyou Yang <wenyou.yang@atmel.com>
> 

 Applied to git://github.com/spi-nor/linux.git

Thanks!

Wenyou, I've fixed your "Acked-by:" tag when merging the patch :)

>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c index
>> d0fc165..ec47451 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -799,6 +799,7 @@ static const struct flash_info spi_nor_ids[] = {
>>  	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K) },
>>
>>  	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K) },
>> +	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K) },
>>  	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K) },
>>  	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K) },
>>
>> --
>> 2.7.4
> 
> 
> Best Regards,
> Wenyou Yang
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
