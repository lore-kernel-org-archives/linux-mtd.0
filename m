Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e4LYI-0003ym-Rv
 for linux-mtd@lists.infradead.org; Tue, 17 Oct 2017 06:40:36 +0000
Subject: Re: [PATCH] mtd: spi-nor: add support for is25lp032
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>
References: <20170830193323.14478-1-sean.nyekjaer@prevas.dk>
 <076fe56a-381c-591e-f5a8-c2438af8cceb@wedev4u.fr>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <c34a4120-727a-182f-73f6-c8b0a1954b3c@prevas.dk>
Date: Tue, 17 Oct 2017 08:40:05 +0200
MIME-Version: 1.0
In-Reply-To: <076fe56a-381c-591e-f5a8-c2438af8cceb@wedev4u.fr>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

On 2017-10-16 23:58, Cyrille Pitchen wrote:
> Hi Sean,
>
> Le 30/08/2017 à 21:33, Sean Nyekjaer a écrit :
>> Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
>> ---
>>   drivers/mtd/spi-nor/spi-nor.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index cf1d4a15e10a..a764fe67b59c 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1005,6 +1005,7 @@ static const struct flash_info spi_nor_ids[] = {
>>   
>>   	/* ISSI */
>>   	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
>> +	{ "is25lp032", INFO(0x9d4013, 0, 64 * 1024,  64, SECT_4K) },
> I'm reading the IS25LP032 datasheet:
> http://www.issi.com/WW/pdf/IS25LP032-064-128.pdf
>
> Table 8.3 Product Identification states that the JEDEC ID should be
> 0x9d6016. Is the datasheet wrong or did you make a mistake on the memory
> name ?
>
> Best regards,
>
> Cyrille
I did a mistake in the memory name :-) The device with that ID is 
IS25LQ040B. I'll resubmit a patch with the correct name.

BR
/Sean
>
>
>>   
>>   	/* Macronix */
>>   	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
>>
