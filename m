Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGGq9-0007aX-Gt
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 02:59:47 +0000
Received: by mail-pf0-x241.google.com with SMTP id 144so3609591pfv.0
 for <linux-mtd@lists.infradead.org>; Sun, 11 Dec 2016 18:59:24 -0800 (PST)
Subject: Re: [V1] mtd: devices: docg3:- Handle return value of devm_ioremap.
To: Marek Vasut <marek.vasut@gmail.com>, robert.jarzmik@free.fr,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@atmel.com
References: <1481479310-2698-1-git-send-email-arvind.yadav.cs@gmail.com>
 <a09b8dbc-ca4b-000e-e5c2-5039119e99ba@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: arvind Yadav <arvind.yadav.cs@gmail.com>
Message-ID: <ff59950b-de9e-a177-43ba-c543bf98df28@gmail.com>
Date: Mon, 12 Dec 2016 08:29:19 +0530
MIME-Version: 1.0
In-Reply-To: <a09b8dbc-ca4b-000e-e5c2-5039119e99ba@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes, We are returning -ENOMEM, ret is initialized to -ENOMEM.
As per your concern, I have added dev_err failure message.

Thanks
-Arvind

On Monday 12 December 2016 12:45 AM, Marek Vasut wrote:
> On 12/11/2016 07:01 PM, Arvind Yadav wrote:
>> Here, If devm_ioremap will fail. It will return NULL.
>> Kernel can run into a NULL-pointer dereference.
>>
>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
>> ---
>>   drivers/mtd/devices/docg3.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
>> index b833e6c..013b5b9 100644
>> --- a/drivers/mtd/devices/docg3.c
>> +++ b/drivers/mtd/devices/docg3.c
>> @@ -2083,9 +2083,12 @@ static int __init docg3_probe(struct platform_device *pdev)
>>   		dev_err(dev, "No I/O memory resource defined\n");
>>   		return ret;
>>   	}
>> -	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
>>   
>>   	ret = -ENOMEM;
>> +	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
>> +	if (!base)
>> +		return ret;
> I think return -ENOMEM right away won't hurt here. Also, dev_err()
> explaining the failure would be nice to add.
>
> Thanks!
>
>>   	cascade = devm_kzalloc(dev, sizeof(*cascade) * DOC_MAX_NBFLOORS,
>>   			       GFP_KERNEL);
>>   	if (!cascade)
>>
>
