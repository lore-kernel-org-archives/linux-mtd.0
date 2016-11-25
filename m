Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAHpf-0007m5-3b
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 14:50:36 +0000
Subject: Re: [PATCH v3] mtd: spi-nor: fix spansion quad enable
To: Marek Vasut <marek.vasut@gmail.com>, =?UTF-8?Q?Jo=c3=abl_Esponde?=
 <joel.esponde@honeywell.com>, <linux-mtd@lists.infradead.org>
References: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
 <1479901660-124876-1-git-send-email-joel.esponde@honeywell.com>
 <4c1b8cc9-3f1b-fa43-8ebc-eb6c3481abcc@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <d08bf4d1-7667-1888-f9fa-ec63e4c9b249@atmel.com>
Date: Fri, 25 Nov 2016 15:50:07 +0100
MIME-Version: 1.0
In-Reply-To: <4c1b8cc9-3f1b-fa43-8ebc-eb6c3481abcc@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

Le 25/11/2016 à 15:17, Marek Vasut a écrit :
> On 11/23/2016 12:47 PM, Joël Esponde wrote:
>> With the S25FL127S nor flash part, each writing to the configuration
>> register takes hundreds of ms. During that  time, no more accesses to
>> the flash should be done (even reads).
>>
>> This commit adds a wait loop after the register writing until the flash
>> finishes its work.
>>
>> This issue could make rootfs mounting fail when the latter was done too
>> much closely to this quad enable bit setting step. And in this case, a
>> driver as UBIFS may try to recover the filesystem and may broke it
>> completely.
> 
> Does this apply to all spansion chips or only to selected few ?
>

I've recently faced the very same issue with Winbond memories, which use
the same procedure as Spansion to set the Quad Enable bit.
More precisely, in my case it was some bare metal (bootloader) code but the
issue was the same, there was no polling of busy bit from the Status
Register after having set the QE bit in the Status Register 2 / Control
Register 1. Then the next SPI command came too early and failed because the
memory was actually still busy.

I faced this issue with Winbond W25Q256 and W25M512.

Best regards,

Cyrille

>> Signed-off-by: Joël Esponde <joel.esponde@honeywell.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index d0fc165..21dde52 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1255,6 +1255,13 @@ static int spansion_quad_enable(struct spi_nor *nor)
>>  		return -EINVAL;
>>  	}
>>  
>> +	ret = spi_nor_wait_till_ready(nor);
>> +	if (ret) {
>> +		dev_err(nor->dev,
>> +			"timeout while writing configuration register\n");
>> +		return ret;
>> +	}
>> +
>>  	/* read back and check it */
>>  	ret = read_cr(nor);
>>  	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
>>
> 
> 
