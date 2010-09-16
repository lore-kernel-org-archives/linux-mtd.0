Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OwCbl-0002BR-6p
	for linux-mtd@lists.infradead.org; Thu, 16 Sep 2010 11:26:30 +0000
Received: by ewy9 with SMTP id 9so623368ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Sep 2010 04:26:28 -0700 (PDT)
Date: Thu, 16 Sep 2010 15:26:24 +0400
From: Anton Vorontsov <cbouatmailru@gmail.com>
To: Zang Roy-R61911 <r61911@freescale.com>
Subject: Re: [PATCH 2/3 v3] P4080/mtd: Only make elbc nand driver detect
	nand flash partitions
Message-ID: <20100916112624.GA32074@oksana.dev.rtsoft.ru>
References: <1284619284-23614-1-git-send-email-tie-fei.zang@freescale.com>
	<1284619284-23614-2-git-send-email-tie-fei.zang@freescale.com>
	<20100916082141.GA10978@oksana.dev.rtsoft.ru>
	<3850A844E6A3854C827AC5C0BEC7B60A1FC6B8@zch01exm23.fsl.freescale.net>
	<20100916092551.GA17548@oksana.dev.rtsoft.ru>
	<3850A844E6A3854C827AC5C0BEC7B60A1FC6DB@zch01exm23.fsl.freescale.net>
	<20100916101429.GA27393@oksana.dev.rtsoft.ru>
	<3850A844E6A3854C827AC5C0BEC7B60A1FC6E1@zch01exm23.fsl.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3850A844E6A3854C827AC5C0BEC7B60A1FC6E1@zch01exm23.fsl.freescale.net>
Cc: Wood Scott-B07421 <B07421@freescale.com>, dedekind1@gmail.com,
	Lan Chunhe-B25806 <B25806@freescale.com>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, dwmw2@infradead.org,
	Gala Kumar-B11780 <B11780@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 16, 2010 at 06:39:40PM +0800, Zang Roy-R61911 wrote:
[...]
> But my code has some assignment for "foo" instead of a simple
> allocation, how about this way for my code:

This will surely work, and all the rest is just a matter of
taste. So, I'm fine with it. But see below, I think I found
some new, quite serious issues.

> DEFINE_MUTEX(fsl_elbc_mutex);

I'd place the mutex inside the fsl_lbc_ctrl_dev,
i.e. fsl_lbc_ctrl_dev->nand_lock. This is to avoid more
global variables.

> ...
> static int __devinit fsl_elbc_nand_probe(struct platform_device *dev)
> {
> ...
>         mutex_lock(&fsl_lbc_mutex);
>         if (!fsl_lbc_ctrl_dev->nand) {
>                 elbc_fcm_ctrl = kzalloc(sizeof(*elbc_fcm_ctrl), GFP_KERNEL);
>                 if (!elbc_fcm_ctrl) {
>                         dev_err(fsl_lbc_ctrl_dev->dev, "failed to allocate "
>                                         "memory\n");
>                         ret = -ENOMEM;
>                         goto err;
>                 }
> 
>                 elbc_fcm_ctrl->read_bytes = 0;
>                 elbc_fcm_ctrl->index = 0;
>                 elbc_fcm_ctrl->addr = NULL;

I guess these variables should be per chip select, as
otherwise there will be tons of races when somebody try
to access two or more NAND chips simultaneously.

(Plus, you don't need these = 0 and = NULL as you used
 kzalloc() for allocation.)

> 
>                 spin_lock_init(&elbc_fcm_ctrl->controller.lock);
>                 init_waitqueue_head(&elbc_fcm_ctrl->controller.wq);

Some of these may need to be per chip select too.

So, I'd suggest to redo the whole thing this way: don't allocate
elbc_fcm_ctrl in this driver, but make an array inside the
fsl_lbc_ctrl_dev. I.e.
fsl_lbc_ctrl_dev->nand_ctrl[MAX_CHIP_SELECTS]
or something like that.

Btw, even before this patch, it seems that the driver had
all these bugs/races, i.e. ctrl->controller.lock was not
used at all. Ugh.

>                 fsl_lbc_ctrl_dev->nand = elbc_fcm_ctrl;
>         } else
>                 elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;

Per coding style this should be

} else {
	elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
}

>         mutex_unlock(&fsl_lbc_mutex);
> 
>         elbc_fcm_ctrl->chips[bank] = priv;
> ...
> }

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
