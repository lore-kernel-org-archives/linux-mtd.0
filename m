Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh5Hq-0003P5-F7
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 00:30:23 +0000
Received: by pablk4 with SMTP id lk4so20458954pab.3
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2015 17:30:01 -0700 (PDT)
Date: Tue, 29 Sep 2015 17:29:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [l2-mtd:master 149/149] ERROR: "__umoddi3"
 [drivers/mtd/devices/mtdram.ko] undefined!
Message-ID: <20150930002958.GC143959@google.com>
References: <201509300759.Ipr62suj%fengguang.wu@intel.com>
 <560B293B.2060001@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <560B293B.2060001@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ linux-mtd

On Wed, Sep 30, 2015 at 08:13:47AM +0800, Dongsheng Yang wrote:
> On 09/30/2015 07:36 AM, kbuild test robot wrote:
> >tree:   git://git.infradead.org/users/dedekind/l2-mtd.git master
> >head:   7827e3acad2df1c6537e5fe7211d216dabc60399
> >commit: 7827e3acad2df1c6537e5fe7211d216dabc60399 [149/149] mtd: mtdram: check offs and len in mtdram->erase
> >config: i386-randconfig-i0-201539 (attached as .config)
> >reproduce:
> >   git checkout 7827e3acad2df1c6537e5fe7211d216dabc60399
> >   # save the attached .config to linux build tree
> >   make ARCH=i386
> >
> >All error/warnings (new ones prefixed by >>):
> >
> >>>ERROR: "__umoddi3" [drivers/mtd/devices/mtdram.ko] undefined!
> >>>ERROR: "__moddi3" [drivers/mtd/devices/mtdram.ko] undefined!
> 
> Hi Brian,
> 	It seems i386 does not support mod operation. Please help
> to squash the patch attached. Thanx a lot.

It's not just i386.

> >
> >---
> >0-DAY kernel test infrastructure                Open Source Technology Center
> >https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> >
> 

> From 4034d05f22e46430ac90fa67a2eff059f7fdc7a3 Mon Sep 17 00:00:00 2001
> From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> Date: Wed, 30 Sep 2015 05:02:39 -0400
> Subject: [PATCH] mtdram: use mtd->erasesize_mask rather than mod function.
> 
> kbuild test robot complain that on i386:
> ERROR: "__umoddi3" [drivers/mtd/devices/mtdram.ko] undefined!
> 
> So, fix it by replace '% mtd->erasesize' with '& mtd->erasesize_mask';
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  drivers/mtd/devices/mtdram.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
> index 73fa297..8124fc4 100644
> --- a/drivers/mtd/devices/mtdram.c
> +++ b/drivers/mtd/devices/mtdram.c
> @@ -37,13 +37,13 @@ static int check_offs_len(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	int ret = 0;
>  
>  	/* Start address must align on block boundary */
> -	if (ofs % mtd->erasesize) {
> +	if (ofs & mtd->erasesize_mask) {

Hmm, but that only works if it's a power-of-two erasesize. Right now,
mtdram technically allows odd sizes. You'll have to add more
checks/restrictions to this driver before I can take this patch.

I've just reverted the patch for now. You can send a better one that
addresses all problems.

Brian

>  		pr_debug("%s: unaligned address\n", __func__);
>  		ret = -EINVAL;
>  	}
>  
>  	/* Length must align on block boundary */
> -	if (len % mtd->erasesize) {
> +	if (len & mtd->erasesize_mask) {
>  		pr_debug("%s: length not block aligned\n", __func__);
>  		ret = -EINVAL;
>  	}
> -- 
> 1.8.4.2
> 
