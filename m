Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEPSH-0001Of-7J
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 23:47:26 +0000
Received: by mail-wm0-x242.google.com with SMTP id g23so24633197wme.1
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2016 15:47:02 -0800 (PST)
Subject: Re: [PATCH 1/1] mtd: spi-nor: improve macronix_quad_enable()
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <5b7ad2367d9b6a4e3a766ce6cadf16c313a03a26.1481039788.git.cyrille.pitchen@atmel.com>
 <5962912d-b5de-f0d0-077b-af3b9ff2a77c@gmail.com>
 <c5bf49e1-fd4b-7d33-3d15-3ad4ac1174fa@wedev4u.fr>
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, richard@nod.at
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <6fbb8128-3583-ee9b-a623-9d2649db6860@gmail.com>
Date: Wed, 7 Dec 2016 00:46:59 +0100
MIME-Version: 1.0
In-Reply-To: <c5bf49e1-fd4b-7d33-3d15-3ad4ac1174fa@wedev4u.fr>
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

On 12/07/2016 12:05 AM, Cyrille Pitchen wrote:
> Le 06/12/2016 à 20:01, Marek Vasut a écrit :
>> On 12/06/2016 05:01 PM, Cyrille Pitchen wrote:
>>> The patch checks whether the Quad Enable bit is already set in the Status
>>> Register. If so, the function exits immediately with a successful return
>>> code.
>>
>> Performance optimization I presume ?
> 
> Performance optimization is one benefit but this real purpose of the
> patch is to avoid writing over and over a non-volatile bit at each boot,
> actually each time spi_nor_scan() is called.
> 
> To be honest, I don't know whether internally the SPI memory is clever
> enough not to perform the actual write when it sees the bit value has
> not changed. I wanted to improve the memory lifetime by avoiding the
> update of the bit from software just to be sure :)

Well the bit is in some sort of internal SRAM or silicon register , no?

> Anyway, thanks for your review!

np

>> Acked-by: Marek Vasut <marek.vasut@gmail.com>
>>
>>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>>> Reviewed-by: Jagan Teki <jagan@openedev.com>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index da7cd69d4857..1fd32b991eb7 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -1216,6 +1216,9 @@ static int macronix_quad_enable(struct spi_nor *nor)
>>>  	val = read_sr(nor);
>>>  	if (val < 0)
>>>  		return val;
>>> +	if (val & SR_QUAD_EN_MX)
>>> +		return 0;
>>> +
>>>  	write_enable(nor);
>>>  
>>>  	write_sr(nor, val | SR_QUAD_EN_MX);
>>>
>>
>>
> 


-- 
Best regards,
Marek Vasut
