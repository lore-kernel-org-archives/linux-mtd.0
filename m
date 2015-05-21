Received: from mail-vn0-x22f.google.com ([2607:f8b0:400c:c0f::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvLLR-0001dM-Or
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 07:56:48 +0000
Received: by vnbf129 with SMTP id f129so5380533vnb.10
 for <linux-mtd@lists.infradead.org>; Thu, 21 May 2015 00:56:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150520193325.GK11598@ld-irv-0074>
References: <1431498556-21275-1-git-send-email-wenlin.kang@windriver.com>
 <20150520193325.GK11598@ld-irv-0074>
Date: Thu, 21 May 2015 09:56:21 +0200
Message-ID: <CAFLxGvyy4UZWAZ9FaNCnF6-L664x3t72R_Kg_zEmD-HfkJqxrA@mail.gmail.com>
Subject: Re: [PATCH] mtd: blktrans: change blktrans_getgeo rerurn value
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Wenlin Kang <wenlin.kang@windriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 20, 2015 at 9:33 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
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
>>       if (!dev->mtd)
>>               goto unlock;
>>
>> -     ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : 0;
>> +     ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : -ENXIO;
>
> Good catch. I don't think ENXIO is correct in this case, though. Maybe
> -EOPNOTSUPP or -ENOSYS? The latter might make more sense I guess.

I'd vote for -ENOTTY as this is what HDIO_GETGEIO returns
if the function is not implemented and blktrans_getgeo()
is only a wrapper around that.

See https://www.kernel.org/doc/Documentation/ioctl/hdio.txt
and block/ioctl.c.

-- 
Thanks,
//richard
