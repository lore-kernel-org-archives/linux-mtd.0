Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fK1zZ-00034C-En
 for linux-mtd@lists.infradead.org; Sat, 19 May 2018 13:33:51 +0000
Received: by mail-pf0-x241.google.com with SMTP id a22-v6so5028049pfn.6
 for <linux-mtd@lists.infradead.org>; Sat, 19 May 2018 06:33:38 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: Add support for EN25QH32
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-mtd@lists.infradead.org
References: <1526524384-30303-1-git-send-email-tochiro.srchack@gmail.com>
 <1526524827-30380-1-git-send-email-tochiro.srchack@gmail.com>
 <20180518220809.14071539@bbrezillon>
From: =?UTF-8?B?77ygU1JDSEFDSy5PUkc=?= <tochiro.srchack@gmail.com>
Message-ID: <24dc78d7-9779-4169-17fd-7bbcca69cea4@gmail.com>
Date: Sat, 19 May 2018 22:33:41 +0900
MIME-Version: 1.0
In-Reply-To: <20180518220809.14071539@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Dear, Boris

Thanks,
Yes, I will.


On 2018/05/19 5:08, Boris Brezillon wrote:
> On Thu, 17 May 2018 11:40:27 +0900
> YuheiOKAWA <tochiro.srchack@gmail.com> wrote:
> 
>> Add support for Eon en25qh32 spi nor flash.
>>
>> Sorry, very sorry.
>> I had misspelled it. chip name is en25qh32, non en25ph32.
> 
> Queued to spi-nor/next after removing this sentence :-).
> 
> Next time you want to add extra information that you don't want
> to appear in the commit, just put it after the "---" separator ;-).
> 
> Also, you should prefix your patch with "[PATCH v2]" and add a
> changelog after the "---". Something like:
> 
> "
> ---
> Changes in v2:
> - blablabla
> "
> 
> Thanks,
> 
> Boris
> 
>>
>> Signed-off-by: YuheiOKAWA <tochiro.srchack@gmail.com>
>> ---
>>   drivers/mtd/spi-nor/spi-nor.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 5bfa36e..7bc556c 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -980,6 +980,7 @@ static const struct flash_info spi_nor_ids[] = {
>>   	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
>>   	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
>>   	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
>> +	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64, 0) },
>>   	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
>>   	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
>>   	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128, SECT_4K) },
> 
> 


-- 
------------------------------------------------------
＠SRCHACK.ORG
tochiro.srchack@gmail.com
http://www.srchack.org/
------------------------------------------------------
