Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNQ0L-0004Hj-Df
 for linux-mtd@lists.infradead.org; Fri, 08 Dec 2017 21:16:24 +0000
Subject: Re: [PATCH] mtd: onenand: Fix an error handling path in
 's3c_onenand_probe(()'
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20171118132723.24785-1-christophe.jaillet@wanadoo.fr>
 <20171207175552.4825e642@bbrezillon>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <50688cb3-ae7a-5a15-4989-9933593ff11d@wanadoo.fr>
Date: Fri, 8 Dec 2017 22:15:58 +0100
MIME-Version: 1.0
In-Reply-To: <20171207175552.4825e642@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 07/12/2017 à 17:55, Boris Brezillon a écrit :
> On Sat, 18 Nov 2017 14:27:23 +0100
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
>
>> If 'platform_get_resource()' fails, we have to go through the error
>> handling path to release some resources.
>>
>> The unreachable 'goto ahb_resource_failed' is also wrong here and we should
>> go to 'resource_failed' instead.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/mtd/onenand/samsung.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
>> index af0ac1a7bf8f..164ebe2b1137 100644
>> --- a/drivers/mtd/onenand/samsung.c
>> +++ b/drivers/mtd/onenand/samsung.c
>> @@ -872,8 +872,8 @@ static int s3c_onenand_probe(struct platform_device *pdev)
>>   	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>   	if (!r) {
>>   		dev_err(&pdev->dev, "no memory resource defined\n");
>> -		return -ENOENT;
>> -		goto ahb_resource_failed;
>> +		err = -ENOENT;
>> +		goto resource_failed;
>>   	}
>>   
> Sorry but I'd really prefer to convert the driver to use devm_
> functions instead of fixing a single error path.

Thanks for your comment. devm_ functions greatly simplify the code.
I've proposed an update for that.

If I'm correct, this also helped to find two other bugs (un-balanced 
request_irq() and un-handled error code)

CJ
