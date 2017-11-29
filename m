Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eK0BF-0000Pf-52
 for linux-mtd@lists.infradead.org; Wed, 29 Nov 2017 11:05:32 +0000
Subject: Re: [PATCH v3] mtd: spi-nor: add support for ISSI is25lp128
To: Angelo Dureghello <angelo@sysam.it>, linux-mtd@lists.infradead.org,
 boris.brezillon@free-electrons.com
References: <20171118234822.ijchd2cmvc6elerq@jerusalem>
 <3d1c7e75-21c8-ad00-58b4-ba2647bcc91e@wedev4u.fr>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <47a46fe3-36cd-1168-b0c9-14d2ad858d50@wedev4u.fr>
Date: Wed, 29 Nov 2017 12:05:01 +0100
MIME-Version: 1.0
In-Reply-To: <3d1c7e75-21c8-ad00-58b4-ba2647bcc91e@wedev4u.fr>
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

Le 29/11/2017 à 11:58, Cyrille Pitchen a écrit :
> Hi Angelo,
> 
> Le 19/11/2017 à 00:48, Angelo Dureghello a écrit :
>> Add support for ISSI is25lp128 spi nor flash.
>>
>> Signed-off-by: Angelo Dureghello <angelo@sysam.it>

Applied to the spi-nor/next branch of l2-mtd

Thanks
>> ---
>> Changes for v2:
>>    - add commit message.
>> Changes for v3:
>>    - add SPI_NOR_DUAL_READ flag.
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 19c000722cbc..b987353440ea 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1005,6 +1005,8 @@ static const struct flash_info spi_nor_ids[] = {
>>  
>>  	/* ISSI */
>>  	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
>> +	{ "is25lp128", INFO(0x9d6018, 0, 64 * 1024,   256,
> 
> If you don't mind, I will align figures in the column for the number of
> sectors before applying your patch.
> 
> Otherwise, it looks good.
> 
> Best regards,
> 
> Cyrille
>> +			SECT_4K | SPI_NOR_DUAL_READ) },
>>  
>>  	/* Macronix */
>>  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
>>
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
