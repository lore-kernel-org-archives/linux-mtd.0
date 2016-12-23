Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cKV6U-0002nH-Rw
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2016 19:02:08 +0000
Received: by mail-wm0-x241.google.com with SMTP id l2so17513654wml.2
 for <linux-mtd@lists.infradead.org>; Fri, 23 Dec 2016 11:01:46 -0800 (PST)
Subject: Re: [PATCH v2 2/3] mtd: m25p80: consider max message size in
 m25p80_read
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Mark Brown <broonie@kernel.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <6c95366c-7fcc-ef4c-033a-f9f6e152a669@gmail.com>
 <20160816164204.GV9347@sirena.org.uk>
 <b65240ff-7e28-5ecb-0670-abfca871246b@gmail.com>
 <2e31fbe7-bbc7-8fed-ccbf-dd9ae4d220e1@atmel.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e7513817-c6d1-948d-19ff-617debfa1399@gmail.com>
Date: Fri, 23 Dec 2016 19:53:50 +0100
MIME-Version: 1.0
In-Reply-To: <2e31fbe7-bbc7-8fed-ccbf-dd9ae4d220e1@atmel.com>
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

On 12/23/2016 04:33 PM, Cyrille Pitchen wrote:
> Le 17/08/2016 à 21:09, Heiner Kallweit a écrit :
>> Consider a message size limit when calculating the maximum amount
>> of data that can be read.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Applied to git://github.com/spi-nor/linux.git

Is that the concensus now that we should fix controller crappiness on
driver level ? Or did I miss the point of this patch ?

> Thanks!
> 
>> ---
>> v2:
>> - use the new function spi_max_message_size
>> ---
>>  drivers/mtd/devices/m25p80.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 9cf7fcd..16a7df2 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -172,7 +172,8 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>>  
>>  	t[1].rx_buf = buf;
>>  	t[1].rx_nbits = m25p80_rx_nbits(nor);
>> -	t[1].len = min(len, spi_max_transfer_size(spi));
>> +	t[1].len = min3(len, spi_max_transfer_size(spi),
>> +			spi_max_message_size(spi) - t[0].len);
>>  	spi_message_add_tail(&t[1], &m);
>>  
>>  	ret = spi_sync(spi, &m);
>>
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-spi" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
Best regards,
Marek Vasut
