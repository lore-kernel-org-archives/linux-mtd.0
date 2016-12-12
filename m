Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGT4q-0004RW-3G
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 16:03:45 +0000
Received: by mail-pf0-x243.google.com with SMTP id 144so4590999pfv.0
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2016 08:03:23 -0800 (PST)
Subject: Re: [V2] mtd: devices: docg3:- Handle return value of devm_ioremap.
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1481511604-6116-1-git-send-email-arvind.yadav.cs@gmail.com>
 <20161212094218.2d29b34a@bbrezillon>
Cc: robert.jarzmik@free.fr, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: arvind Yadav <arvind.yadav.cs@gmail.com>
Message-ID: <80fc935a-39aa-eaca-e75c-02078c3dab05@gmail.com>
Date: Mon, 12 Dec 2016 21:33:05 +0530
MIME-Version: 1.0
In-Reply-To: <20161212094218.2d29b34a@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is problem, if you will use devm_ioremap_resource instead of 
devm_ioremap,
than devm_ioremap_resource will call request_mem_region().
request_mem_region() allows to tell the kernel that this driver is going 
to use
this range of I/O addresses, which will prevent other drivers to make an
overlapping call to request_mem_region If other driver want to use same 
address
space to access then it will not allow. Means we can not share same 
address space
between two driver.

Thanks
-Arvind

On Monday 12 December 2016 02:12 PM, Boris Brezillon wrote:
> On Mon, 12 Dec 2016 08:30:04 +0530
> Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:
>
>> Here, If devm_ioremap will fail. It will return NULL.
>> Kernel can run into a NULL-pointer dereference.
>>
>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
>> ---
>>   drivers/mtd/devices/docg3.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
>> index b833e6c..ffe3db0 100644
>> --- a/drivers/mtd/devices/docg3.c
>> +++ b/drivers/mtd/devices/docg3.c
>> @@ -2083,9 +2083,14 @@ static int __init docg3_probe(struct platform_device *pdev)
>>   		dev_err(dev, "No I/O memory resource defined\n");
>>   		return ret;
>>   	}
>> -	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
>>   
>>   	ret = -ENOMEM;
>> +	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
>> +	if (!base) {
>> +		dev_err(dev, "failed to map I/O memory\n");
>> +		return ret;
>> +	}
>> +
>>   	cascade = devm_kzalloc(dev, sizeof(*cascade) * DOC_MAX_NBFLOORS,
>>   			       GFP_KERNEL);
>>   	if (!cascade)
> How about going even further and doing the following?
> This way you can drop the test on rres (it's done for you in
> devm_ioremap_resource()), and you can directly return the error
> returned by devm_ioremap_resource().
>
> --->8---
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index b833e6cc684c..c59b91734344 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -2077,13 +2077,10 @@ static int __init docg3_probe(struct
> platform_device *pdev) int ret, floor;
>          struct docg3_cascade *cascade;
>   
> -       ret = -ENXIO;
>          ress = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!ress) {
> -               dev_err(dev, "No I/O memory resource defined\n");
> -               return ret;
> -       }
> -       base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
> +       base = devm_ioremap_resource(dev, ress);
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
>   
>          ret = -ENOMEM;
>          cascade = devm_kzalloc(dev, sizeof(*cascade) * DOC_MAX_NBFLOORS,
