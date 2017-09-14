Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsXGH-0005gJ-Kd
 for linux-mtd@lists.infradead.org; Thu, 14 Sep 2017 16:45:12 +0000
Subject: Re: [DEBUG] mtd: spi-nor: dump DWORDs of the Basic Flash Parameter
 Table
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CAMuHMdXKpheF5whZi2Ot2Pm8t3Lu+ramNV==sXBo87u_HerZxQ@mail.gmail.com>
 <20170907185456.4631-1-cyrille.pitchen@wedev4u.fr>
 <e9e925ab-e543-23fd-a738-a9ce433de713@wedev4u.fr>
 <CAMuHMdVgdLt5yhgJnDamcMDUv+-JhLEuO9Gj3trmXZwPhhP2tg@mail.gmail.com>
 <20170912151236.33c5ad8f@bbrezillon>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <80dd3940-c09d-f246-fbe7-c5533c2640c8@wedev4u.fr>
Date: Thu, 14 Sep 2017 18:44:31 +0200
MIME-Version: 1.0
In-Reply-To: <20170912151236.33c5ad8f@bbrezillon>
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

Le 12/09/2017 à 15:12, Boris Brezillon a écrit :
> Hi Geert,
> 
> On Mon, 11 Sep 2017 10:58:36 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
>> Hi Cyrille,
>>
>> On Thu, Sep 7, 2017 at 9:28 PM, Cyrille Pitchen
>> <cyrille.pitchen@wedev4u.fr> wrote:
>>>> Can you apply this patch on your tree then report me what was printed, please?
>>>> I have an idea of the root cause of your issue then a potential work-around
>>>> but I first need to validate my assumption to confirm that the work-around
>>>> would actually work.  
>>
>> +m25p80 spi0.0: DWORD1 = 0xffffffff
>> +m25p80 spi0.0: DWORD2 = 0xffffffff
>> +m25p80 spi0.0: DWORD3 = 0xffffffff
>> +m25p80 spi0.0: DWORD4 = 0xffffffff
>> +m25p80 spi0.0: DWORD5 = 0xffffffff
>> +m25p80 spi0.0: DWORD6 = 0xffffffff
>> +m25p80 spi0.0: DWORD7 = 0xffffffff
>> +m25p80 spi0.0: DWORD8 = 0xffffffff
>> +m25p80 spi0.0: DWORD9 = 0xffffffff
>> +m25p80 spi0.0: DWORD10 = 0x00000000
>> +m25p80 spi0.0: DWORD11 = 0x00000000
>> +m25p80 spi0.0: DWORD12 = 0x00000000
>> +m25p80 spi0.0: DWORD13 = 0x00000000
>> +m25p80 spi0.0: DWORD14 = 0x00000000
>> +m25p80 spi0.0: DWORD15 = 0x00000000
>> +m25p80 spi0.0: DWORD16 = 0x00000000
>> +m25p80 spi0.0: BFPT version 1.0 (length = 9)
>>
>>> If you could also dump the value of the 'addr' argument of
>>> spi_nor_read_sfdp_dma_unsafe() just before the for () loop below in the
>>> very same function. Actually, I suspect the SFDP tables of your SPI NOR  
>>
>> +m25p80 spi0.0: addr = 0x448
>>
>>> memory sample to have been programmed with invalid values, neither
>>> compliant with the JEDEC JESD216 specification nor with the Cypress
>>> datasheet for this memory part.  
>>
>> Sounds plausible.
>> I get the same values when disabling DMA, so it's not due to bad DMA handling.
>> All Renesas boards I have local or remote access to have spansion,s25fl512s.
> 
> Can you try with the following patch?
> 
> Thanks,
> 
> Boris
> 
> --->8---
> From 000ff63fdb149d87d755483f5edc0aba010da6b4 Mon Sep 17 00:00:00 2001
> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> Date: Tue, 12 Sep 2017 15:10:35 +0200
> Subject: [PATCH] mtd: spi-nor: Check consistency of the memory size extracted
>  from the SFDP
> 
> One field of the flash parameter table contains information about the
> flash device size.
> Most of the time the data extracted from this field is valid, but
> sometimes the BFPT section of the SFDP table is corrupted or invalid and
> this field is set to 0xffffffff, thus resulting in an integer overflow
> when setting params->size.
> 
> Since NOR devices are anayway always smaller than 2^64 bytes, we can
> easily stop the BFPT parsing if the size reported in this table is
> invalid.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.com>

with few comments below:
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index cf1d4a15e10a..665ccae1d090 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2127,6 +2127,15 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	params->size = bfpt.dwords[BFPT_DWORD(2)];
>  	if (params->size & BIT(31)) {
>  		params->size &= ~BIT(31);
> +
> +		/*
> +		 * Prevent overflows on params->size. Anyway, a NOR of 1^64
typo: should be 2^64
> +		 * bytes is unlikely to exist so this error probably means

Here the size is still expressed in bits, not yet in byte, the
conversion is done right after this chunk.
> +		 * the BFPT we are reading is corrupted/wrong.
> +		 */
> +		if (params->size > 63)
> +			return -EINVAL;
> +
>  		params->size = 1ULL << params->size;
>  	} else {
>  		params->size++;
> 
