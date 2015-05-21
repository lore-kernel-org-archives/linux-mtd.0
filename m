Received: from mail-ig0-x22b.google.com ([2607:f8b0:4001:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvL3S-0007cb-GF
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 07:38:11 +0000
Received: by igbpi8 with SMTP id pi8so3201656igb.1
 for <linux-mtd@lists.infradead.org>; Thu, 21 May 2015 00:37:49 -0700 (PDT)
Date: Thu, 21 May 2015 00:37:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Wenlin Kang <wenlin.kang@windriver.com>
Subject: Re: [PATCH] mtd: blktrans: change blktrans_getgeo rerurn value
Message-ID: <20150521073741.GE11112@norris-Latitude-E6410>
References: <1431498556-21275-1-git-send-email-wenlin.kang@windriver.com>
 <20150520193325.GK11598@ld-irv-0074> <555CE4BF.8020506@gmail.com>
 <555D8002.4050006@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <555D8002.4050006@windriver.com>
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

On Thu, May 21, 2015 at 02:49:38PM +0800, Wenlin Kang wrote:
> On 2015年05月21日 03:47, nick wrote:
> >On 2015-05-20 03:33 PM, Brian Norris wrote:
> >>On Wed, May 13, 2015 at 02:29:16PM +0800, Wenlin Kang wrote:
> >>>Modify function blktrans_getgeo()'s return value to -ENXIO when
> >>>dev->tr->getgeo == NULL.
> >>>
> >>>We shouldn't make the return value to 0 when dev->tr->getgeo == NULL,
> >>>because the function blktrans_getgeo() has an output value "hd_geometry"
> >>>which is usually used by some application, if return 0, it will make some
> >>>application get the wrong information.
> >>>
> >>>Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> >>>---
> >>>  drivers/mtd/mtd_blkdevs.c |    2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>>diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> >>>index 2b0c5287..f8bb16e 100644
> >>>--- a/drivers/mtd/mtd_blkdevs.c
> >>>+++ b/drivers/mtd/mtd_blkdevs.c
> >>>@@ -273,7 +273,7 @@ static int blktrans_getgeo(struct block_device *bdev, struct hd_geometry *geo)
> >>>  	if (!dev->mtd)
> >>>  		goto unlock;
> >>>-	ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : 0;
> >>>+	ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : -ENXIO;
> >>Good catch. I don't think ENXIO is correct in this case, though. Maybe
> >>-EOPNOTSUPP or -ENOSYS? The latter might make more sense I guess.
> >>
> >I would recommend -EOPNOTSUPP as this as nothing to do with unimplemented
> >functions or hardware support. This is just unsupported due to the value
> >being NULL and therefore the hardware support is not there.
> >Just My Option,
> >Nick
> 
> As you said, -EOPNOTSUPP might be better,thanks.

Nick's opinion is irrelevant here:

https://lkml.org/lkml/2014/8/4/206

> I have remade the patch and attached it, would you please check it
> again? thanks.

Please send patches inline (e.g., via git-send-email), not as
attachments. But this is pretty trivial, and it's what I already tested.

So, applied to l2-mtd.git.

Brian
