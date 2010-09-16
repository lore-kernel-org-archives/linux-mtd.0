Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ow9j0-0000eu-CA
	for linux-mtd@lists.infradead.org; Thu, 16 Sep 2010 08:21:47 +0000
Received: by eye22 with SMTP id 22so590986eye.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Sep 2010 01:21:45 -0700 (PDT)
Date: Thu, 16 Sep 2010 12:21:41 +0400
From: Anton Vorontsov <cbouatmailru@gmail.com>
To: Roy Zang <tie-fei.zang@freescale.com>
Subject: Re: [PATCH 2/3 v3] P4080/mtd: Only make elbc nand driver detect
	nand flash partitions
Message-ID: <20100916082141.GA10978@oksana.dev.rtsoft.ru>
References: <1284619284-23614-1-git-send-email-tie-fei.zang@freescale.com>
	<1284619284-23614-2-git-send-email-tie-fei.zang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1284619284-23614-2-git-send-email-tie-fei.zang@freescale.com>
Cc: B07421@freescale.com, dedekind1@gmail.com, B25806@freescale.com,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, dwmw2@infradead.org, B11780@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 16, 2010 at 02:41:23PM +0800, Roy Zang wrote:
[...]
> -static int __devinit fsl_elbc_chip_probe(struct fsl_elbc_ctrl *ctrl,
> -                                      struct device_node *node)
> +/*
> + * Currently only one elbc probe is supported.
> + */
> +static int __devinit fsl_elbc_nand_probe(struct platform_device *dev)
>  {
> -     struct fsl_lbc_regs __iomem *lbc = ctrl->regs;
> +     struct fsl_lbc_regs __iomem *lbc;
>       struct fsl_elbc_mtd *priv;
>       struct resource res;
> +     struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = NULL;
[...]
> -     ctrl->chips[bank] = priv;
> +     if (fsl_lbc_ctrl_dev->nand == NULL) {
> +             elbc_fcm_ctrl = kzalloc(sizeof(*elbc_fcm_ctrl), GFP_KERNEL);
> +             if (!elbc_fcm_ctrl) {
[...]
> +                     goto err;
> +             }
> +             fsl_lbc_ctrl_dev->nand = elbc_fcm_ctrl;
> +     }
> +
> +     elbc_fcm_ctrl->chips[bank] = priv;

Again, this will oops on the second probe. And you still don't
lock fsl_lbc_ctrl_dev->nand during check-then-assignment, so
with parallel probing there will be a race. :-(

We do have boards with several NAND chips (e.g.
arch/powerpc/boot/dts/mpc8610_hpcd.dts), so these issues
are all legitimate.

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
