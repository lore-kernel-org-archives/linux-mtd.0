Received: from mail-lf0-x229.google.com ([2a00:1450:4010:c07::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dfkSB-00060E-7Q
 for linux-mtd@lists.infradead.org; Thu, 10 Aug 2017 10:12:36 +0000
Received: by mail-lf0-x229.google.com with SMTP id t128so1345097lff.2
 for <linux-mtd@lists.infradead.org>; Thu, 10 Aug 2017 03:12:13 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: atmel: fix of_irq_get() error check
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
References: <20170805211436.181653483@cogentembedded.com>
 <20170810115920.7cbb16f2@bbrezillon>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5be5f380-1117-3dec-9fe4-d3520a8f0e60@cogentembedded.com>
Date: Thu, 10 Aug 2017 13:12:09 +0300
MIME-Version: 1.0
In-Reply-To: <20170810115920.7cbb16f2@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/10/2017 12:59 PM, Boris Brezillon wrote:

>> of_irq_get() may return 0 as well as negative error number on failure,
>> while the driver only checks for the negative values.  The driver would
>> then call devm_request_irq() for IRQ0  in its probe method and never get
>> a valid interrupt.
>>
>> Check for 'nc->irq <= 0' instead and return -ENXIO from the driver's probe
>> iff of_irq_get() returned 0.
>>
>> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> The patch is against the 'master' branch of the 'linux-mtd.git' repo --
>> the 'nand/fixes'  branch seems too old...
>>
>>   drivers/mtd/nand/atmel/nand-controller.c |   12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> Index: linux-mtd/drivers/mtd/nand/atmel/nand-controller.c
>> ===================================================================
>> --- linux-mtd.orig/drivers/mtd/nand/atmel/nand-controller.c
>> +++ linux-mtd/drivers/mtd/nand/atmel/nand-controller.c
>> @@ -2078,11 +2078,11 @@ atmel_hsmc_nand_controller_legacy_init(s
>>   	}
>>   
>>   	nc->irq = of_irq_get(nand_np, 0);
>> -	if (nc->irq < 0) {
>> -		ret = nc->irq;
>> -		if (ret != -EPROBE_DEFER)
>> +	if (nc->irq <= 0) {
>> +		if (nc->irq != -EPROBE_DEFER)
>>   			dev_err(dev, "Failed to get IRQ number (err = %d)\n",
>> -				ret);
>> +				nc->irq);
> 
> nc->irq can be 0 here which doesn't make any sense for an error return
> code, so I'd suggest to still use ret and move the 'ret = nc->irq ?:
> -ENXIO' line before doing the != -EPROBE_DEFER test.

    I tried to keep reporting the original of_irq_get() result. Can change it 
if you prefer it another way...

>> +		ret = nc->irq ?: -ENXIO;
> 
> Why ENXIO and not EINVAL?

    That's what platform_get_irq() (another of_irq_get() user) returns if it 
doesn't find the IRQ resource.

>>   		goto out;
>>   	}
>>   
[...]
MBR, Sergei
