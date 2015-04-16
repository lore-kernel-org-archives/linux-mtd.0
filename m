Message-ID: <552FB4DF.1030403@free-electrons.com>
Date: Thu, 16 Apr 2015 10:10:55 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 dwmw2@infradead.org, computersforpeace@gmail.com
Subject: Re: [PATCH v4 04/10] mtd: pxa3xx_nand: rework flash detection and
 timing setup
References: <1429118648-19416-1-git-send-email-antoine.tenart@free-electrons.com>
 <1429118648-19416-5-git-send-email-antoine.tenart@free-electrons.com>
 <552EB7F0.2090106@gmail.com>
In-Reply-To: <552EB7F0.2090106@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: zmxu@marvell.com, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/15/2015 04:11 PM, Sebastian Hesselbarth wrote:
> On 15.04.2015 19:24, Antoine Tenart wrote:
>> Rework the pxa3xx_nand driver to allow using functions exported by the
>> nand framework to detect the flash and to configure the timings.
>>
>> Because this driver supports some non-ONFI devices, we also keep the
>> custom timing setup of this driver so these devices won't break.
>>
>> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
>> ---
> [...]
> 
> Antoine,
> 
> there are some issues with this patch.
> 
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c
>> b/drivers/mtd/nand/pxa3xx_nand.c
>> index dc0edbc406bb..438770c56bd3 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -251,15 +251,14 @@ static struct pxa3xx_nand_timing timing[] = {
>>   };
>>
>>   static struct pxa3xx_nand_flash builtin_flash_types[] = {
>> -{ "DEFAULT FLASH",      0,   0, 2048,  8,  8,    0, &timing[0] },
>> -{ "64MiB 16-bit",  0x46ec,  32,  512, 16, 16, 4096, &timing[1] },
>> -{ "256MiB 8-bit",  0xdaec,  64, 2048,  8,  8, 2048, &timing[1] },
>> -{ "4GiB 8-bit",    0xd7ec, 128, 4096,  8,  8, 8192, &timing[1] },
>> -{ "128MiB 8-bit",  0xa12c,  64, 2048,  8,  8, 1024, &timing[2] },
>> -{ "128MiB 16-bit", 0xb12c,  64, 2048, 16, 16, 1024, &timing[2] },
>> -{ "512MiB 8-bit",  0xdc2c,  64, 2048,  8,  8, 4096, &timing[2] },
>> -{ "512MiB 16-bit", 0xcc2c,  64, 2048, 16, 16, 4096, &timing[2] },
>> -{ "256MiB 16-bit", 0xba20,  64, 2048, 16, 16, 2048, &timing[3] },
>> +    { 0x46ec, 16, 16, &timing[1] },
>> +    { 0xdaec,  8,  8, &timing[1] },
>> +    { 0xd7ec,  8,  8, &timing[1] },
>> +    { 0xa12c,  8,  8, &timing[2] },
>> +    { 0xb12c, 16, 16, &timing[2] },
>> +    { 0xdc2c,  8,  8, &timing[2] },
>> +    { 0xcc2c, 16, 16, &timing[2] },
>> +    { 0xba20, 16, 16, &timing[3] },
> 
> How about we get rid of the driver specific timings completely
> and pick up the best onfi timing match instead? The nand_ids table
> allows for a default_onfi_timing parameter even if onfi itself is
> not supported.
> 
> For generic flash, i.e. no specific entry in the nand_ids table,
> we either choose onfi mode 0 (most conservative) or an even slower
> one.
> 

I think Robert mentioned [1] that using "ONFI default timings" on
non-ONFI devices didn't work for him.

[1] https://lkml.org/lkml/2015/3/8/124
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
