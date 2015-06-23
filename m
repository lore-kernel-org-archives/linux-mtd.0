Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7Hgm-0007bJ-D3
 for linux-mtd@lists.infradead.org; Tue, 23 Jun 2015 06:28:09 +0000
Message-ID: <5588FC61.5070202@nod.at>
Date: Tue, 23 Jun 2015 08:27:45 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 6/6] mtd: docg3: Don't do ERR_PTR(0)
References: <1433193054-26865-1-git-send-email-richard@nod.at>
 <1433193054-26865-7-git-send-email-richard@nod.at>
 <20150617184144.GH4917@ld-irv-0074>
In-Reply-To: <20150617184144.GH4917@ld-irv-0074>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, maximlevitsky@gmail.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 17.06.2015 um 20:41 schrieb Brian Norris:
> On Mon, Jun 01, 2015 at 11:10:54PM +0200, Richard Weinberger wrote:
>> Don't return a obfuscated null pointer using ERR_PTR(0).
>> If the no device is found clearly return -ENODEV.
>> This makes the code more clear and matches the comment
>> of doc_probe_device().
>>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
> 
> Have you tested this patch?

nah, I don't own such a device.

>>  drivers/mtd/devices/docg3.c | 16 ++++++----------
>>  1 file changed, 6 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
>> index 5e67b4a..630e29a 100644
>> --- a/drivers/mtd/devices/docg3.c
>> +++ b/drivers/mtd/devices/docg3.c
>> @@ -1902,7 +1902,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
>>  	chip_id = doc_register_readw(docg3, DOC_CHIPID);
>>  	chip_id_inv = doc_register_readw(docg3, DOC_CHIPID_INV);
>>  
>> -	ret = 0;
>> +	ret = -ENODEV;
>>  	if (chip_id != (u16)(~chip_id_inv)) {
>>  		goto nomem4;
>>  	}
>> @@ -2068,13 +2068,10 @@ static int __init docg3_probe(struct platform_device *pdev)
>>  		mtd = doc_probe_device(cascade, floor, dev);
>>  		if (IS_ERR(mtd)) {
>>  			ret = PTR_ERR(mtd);
>> -			goto err_probe;
>> -		}
>> -		if (!mtd) {
>> -			if (floor == 0)
>> -				goto notfound;
>> -			else
>> +			if (ret == -ENODEV && floor == 0)
> 
> I think you might have changed the logic when refactoring here. I think
> the right refactoring would be the following, no?
> 
> 			if (ret == -ENODEV && floor != 0)
> 				continue;
> 			else
> 				goto err_probe;
> 

You are right, the logic changed. ;-\
Please drop this patch, I'll resend it for 4.3.

Thanks,
//richard
