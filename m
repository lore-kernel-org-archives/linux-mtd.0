Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yv9xn-0004Rf-0f
 for linux-mtd@lists.infradead.org; Wed, 20 May 2015 19:47:35 +0000
Received: by iepj10 with SMTP id j10so47508439iep.3
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 12:47:14 -0700 (PDT)
Message-ID: <555CE4BF.8020506@gmail.com>
Date: Wed, 20 May 2015 15:47:11 -0400
From: nick <xerofoify@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>,
 Wenlin Kang <wenlin.kang@windriver.com>
Subject: Re: [PATCH] mtd: blktrans: change blktrans_getgeo rerurn value
References: <1431498556-21275-1-git-send-email-wenlin.kang@windriver.com>
 <20150520193325.GK11598@ld-irv-0074>
In-Reply-To: <20150520193325.GK11598@ld-irv-0074>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2015-05-20 03:33 PM, Brian Norris wrote:
> Hi Wenlin,
> 
> In the subject:
> 
> s/rerurn/return/
> 
> On Wed, May 13, 2015 at 02:29:16PM +0800, Wenlin Kang wrote:
>> Modify function blktrans_getgeo()'s return value to -ENXIO when
>> dev->tr->getgeo == NULL.
>>
>> We shouldn't make the return value to 0 when dev->tr->getgeo == NULL,
>> because the function blktrans_getgeo() has an output value "hd_geometry"
>> which is usually used by some application, if return 0, it will make some
>> application get the wrong information.
>>
>> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>> ---
>>  drivers/mtd/mtd_blkdevs.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
>> index 2b0c5287..f8bb16e 100644
>> --- a/drivers/mtd/mtd_blkdevs.c
>> +++ b/drivers/mtd/mtd_blkdevs.c
>> @@ -273,7 +273,7 @@ static int blktrans_getgeo(struct block_device *bdev, struct hd_geometry *geo)
>>  	if (!dev->mtd)
>>  		goto unlock;
>>  
>> -	ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : 0;
>> +	ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : -ENXIO;
> 
> Good catch. I don't think ENXIO is correct in this case, though. Maybe
> -EOPNOTSUPP or -ENOSYS? The latter might make more sense I guess.
> 
I would recommend -EOPNOTSUPP as this as nothing to do with unimplemented 
functions or hardware support. This is just unsupported due to the value
being NULL and therefore the hardware support is not there.
Just My Option,
Nick
>>  unlock:
>>  	mutex_unlock(&dev->lock);
>>  	blktrans_dev_put(dev);
> 
> Thanks,
> Brian
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
