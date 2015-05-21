Message-ID: <555D95C0.10104@windriver.com>
Date: Thu, 21 May 2015 16:22:24 +0800
From: Wenlin Kang <wenlin.kang@windriver.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard.weinberger@gmail.com>
Subject: Re: [PATCH] mtd: blktrans: change blktrans_getgeo rerurn value
References: <1431498556-21275-1-git-send-email-wenlin.kang@windriver.com>
 <20150520193325.GK11598@ld-irv-0074>
 <CAFLxGvyy4UZWAZ9FaNCnF6-L664x3t72R_Kg_zEmD-HfkJqxrA@mail.gmail.com>
 <20150521080511.GF11112@norris-Latitude-E6410>
In-Reply-To: <20150521080511.GF11112@norris-Latitude-E6410>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015年05月21日 16:05, Brian Norris wrote:
> On Thu, May 21, 2015 at 09:56:21AM +0200, Richard Weinberger wrote:
>> On Wed, May 20, 2015 at 9:33 PM, Brian Norris
>> <computersforpeace@gmail.com> wrote:
>>> On Wed, May 13, 2015 at 02:29:16PM +0800, Wenlin Kang wrote:
>>>> Modify function blktrans_getgeo()'s return value to -ENXIO when
>>>> dev->tr->getgeo == NULL.
>>>>
>>>> We shouldn't make the return value to 0 when dev->tr->getgeo == NULL,
>>>> because the function blktrans_getgeo() has an output value "hd_geometry"
>>>> which is usually used by some application, if return 0, it will make some
>>>> application get the wrong information.
>>>>
>>>> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>>>> ---
>>>>   drivers/mtd/mtd_blkdevs.c |    2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
>>>> index 2b0c5287..f8bb16e 100644
>>>> --- a/drivers/mtd/mtd_blkdevs.c
>>>> +++ b/drivers/mtd/mtd_blkdevs.c
>>>> @@ -273,7 +273,7 @@ static int blktrans_getgeo(struct block_device *bdev, struct hd_geometry *geo)
>>>>        if (!dev->mtd)
>>>>                goto unlock;
>>>>
>>>> -     ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : 0;
>>>> +     ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : -ENXIO;
>>> Good catch. I don't think ENXIO is correct in this case, though. Maybe
>>> -EOPNOTSUPP or -ENOSYS? The latter might make more sense I guess.
>> I'd vote for -ENOTTY as this is what HDIO_GETGEIO returns
>> if the function is not implemented and blktrans_getgeo()
>> is only a wrapper around that.
> I suppose that makes more sense.
>
>> See https://www.kernel.org/doc/Documentation/ioctl/hdio.txt
> But this only mentions EINVAL...
>
>> and block/ioctl.c.
> Anyway, I pushed EOPNOTSUPP, but I can fix that up if we agree.
>
> Brian
>
>

Hi  Brian

I just read block/compat_ioctl.c, in that I found the follow,

  51 static int compat_hdio_getgeo(struct gendisk *disk, struct 
block_device *bdev,
  52             struct compat_hd_geometry __user *ugeo)
  53 {
  54     struct hd_geometry geo;
  55     int ret;
  56
  57     if (!ugeo)
  58         return -EINVAL;
  59     if (!disk->fops->getgeo)
  60         return -ENOTTY;

So, as Richard said, -ENOTTY should also be OK, and before last
commit(048d87199566663e4edc4880df3703c04bcf41d9), it's  -ENOTTY, so I 
think you can modify it,
or let know whether I need to resent it again.




-- 
Thanks,
Wenlin Kang
