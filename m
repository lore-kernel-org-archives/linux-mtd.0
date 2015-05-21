Message-ID: <555D8002.4050006@windriver.com>
Date: Thu, 21 May 2015 14:49:38 +0800
From: Wenlin Kang <wenlin.kang@windriver.com>
MIME-Version: 1.0
To: nick <xerofoify@gmail.com>, Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: blktrans: change blktrans_getgeo rerurn value
References: <1431498556-21275-1-git-send-email-wenlin.kang@windriver.com>
 <20150520193325.GK11598@ld-irv-0074> <555CE4BF.8020506@gmail.com>
In-Reply-To: <555CE4BF.8020506@gmail.com>
Content-Type: multipart/mixed; boundary="------------030906060205020803000208"
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

--------------030906060205020803000208
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年05月21日 03:47, nick wrote:
>
> On 2015-05-20 03:33 PM, Brian Norris wrote:
>> Hi Wenlin,
>>
>> In the subject:
>>
>> s/rerurn/return/

    Thanks for pointing out this, I will modify it.

>>
>> On Wed, May 13, 2015 at 02:29:16PM +0800, Wenlin Kang wrote:
>>> Modify function blktrans_getgeo()'s return value to -ENXIO when
>>> dev->tr->getgeo == NULL.
>>>
>>> We shouldn't make the return value to 0 when dev->tr->getgeo == NULL,
>>> because the function blktrans_getgeo() has an output value "hd_geometry"
>>> which is usually used by some application, if return 0, it will make some
>>> application get the wrong information.
>>>
>>> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>>> ---
>>>   drivers/mtd/mtd_blkdevs.c |    2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
>>> index 2b0c5287..f8bb16e 100644
>>> --- a/drivers/mtd/mtd_blkdevs.c
>>> +++ b/drivers/mtd/mtd_blkdevs.c
>>> @@ -273,7 +273,7 @@ static int blktrans_getgeo(struct block_device *bdev, struct hd_geometry *geo)
>>>   	if (!dev->mtd)
>>>   		goto unlock;
>>>   
>>> -	ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : 0;
>>> +	ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : -ENXIO;
>> Good catch. I don't think ENXIO is correct in this case, though. Maybe
>> -EOPNOTSUPP or -ENOSYS? The latter might make more sense I guess.
>>
> I would recommend -EOPNOTSUPP as this as nothing to do with unimplemented
> functions or hardware support. This is just unsupported due to the value
> being NULL and therefore the hardware support is not there.
> Just My Option,
> Nick

As you said, -EOPNOTSUPP might be better,thanks.


Hi Brian

I have remade the patch and attached it, would you please check it 
again? thanks.


>>>   unlock:
>>>   	mutex_unlock(&dev->lock);
>>>   	blktrans_dev_put(dev);
>> Thanks,
>> Brian
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>


-- 
Thanks,
Wenlin Kang


--------------030906060205020803000208
Content-Type: text/x-diff;
	name="0001-mtd-blktrans-change-blktrans_getgeo-return-value.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-mtd-blktrans-change-blktrans_getgeo-return-value.patch"

>From d8fa6589438a6992ed13b91c0124ed6cd8114eff Mon Sep 17 00:00:00 2001
From: Wenlin Kang <wenlin.kang@windriver.com>
Date: Thu, 21 May 2015 14:11:58 +0800
Subject: [PATCH] mtd: blktrans: change blktrans_getgeo return value

Modify function blktrans_getgeo()'s return value to -EOPNOTSUPP when
dev->tr->getgeo == NULL.

We shouldn't make the return value to 0 when dev->tr->getgeo == NULL,
because the function blktrans_getgeo() has an output value "hd_geometry"
which is usually used by some application, if return 0, it will make some
application get the wrong information.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 drivers/mtd/mtd_blkdevs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 2b0c5287..2012216 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -273,7 +273,7 @@ static int blktrans_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 	if (!dev->mtd)
 		goto unlock;
 
-	ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : 0;
+	ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : -EOPNOTSUPP;
 unlock:
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
-- 
1.7.9.5


--------------030906060205020803000208--
