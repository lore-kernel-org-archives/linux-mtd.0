Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeiWN-0005lr-Ca
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 06:57:12 +0000
Received: by pwi3 with SMTP id 3so593151pwi.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jul 2011 23:57:05 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 07 Jul 2011 09:58:07 +0300
In-Reply-To: <CAN8TOE_DOEUoqOnoX4D3KQz07C43ktJzSL+xuJgvCkDqrWAoPw@mail.gmail.com>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307605456.7374.35.camel@localhost>
	<BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
	<1307635412.7374.128.camel@localhost>
	<BANLkTimh12AhqfE+Yx3Yi_m=NyUb34JoXA@mail.gmail.com>
	<1308717655.18119.19.camel@sauron> <itsbm4$d29$1@dough.gmane.org>
	<CAN8TOE_DOEUoqOnoX4D3KQz07C43ktJzSL+xuJgvCkDqrWAoPw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1310021892.3149.121.camel@sauron>
Mime-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-07-06 at 11:51 -0700, Brian Norris wrote:
> On Wed, Jun 22, 2011 at 2:12 AM, Dmitry Eremin-Solenikov
> <dbaryshkov@gmail.com> wrote:
> > Artem Bityutskiy wrote:
> >
> >> On Mon, 2011-06-13 at 11:24 -0700, Brian Norris wrote:
> >>> I'm a little new to the Linux device model, so I'm not sure if it's
> >>> safe and sensible to add lines to a driver's nand_probe function,
> >>> like, for plat_nand.c:
> >>> data->mtd.dev.driver = pdev->dev.driver;
> >
> > IIUC, we should not set driver, but it might be better to consult with
> > more experienced DM hackers (like Greg Kroah-Hartman).
> >
> >>> data->mtd.dev.init_name = dev_name(&pdev->dev);
> >>
> >> I think so, I believe struct device was added to mtd by some non-MTD guy
> >> to just make it complaint with one of interface changes which required
> >> struct device. So please, go ahead and improve that a bit.
> 
> I've dug a little more on this, especially in the RFC + mailing list
> conversation that led to adding the "mtd_info.dev" field. See here:
> http://lists.infradead.org/pipermail/linux-mtd/2009-April/025142.html
> 
> It seems that, according to the following comment, the master MTD node
> (which is passed to most of our functions) is never registered and so
> does not have valid information for printing dev_* information:
>      /* NOTE:  we don't arrange MTDs as a tree; it'd be error-prone
>       * to have the same data be in two different partitions.
>       */

Sorry, I still don't get it, why mtd partitions do not have names. The
discussion above is about who will be the parent, while we care about
making dev_dbg(mtd->dev, ...) print names.

if we look at 'add_mtd_device()' in mtdcore.c, we see something like
full initialization:

        /* Caller should have set dev.parent to match the
         * physical device.
         */
        mtd->dev.type = &mtd_devtype;
        mtd->dev.class = &mtd_class;
        mtd->dev.devt = MTD_DEVT(i);
        dev_set_name(&mtd->dev, "mtd%d", i);
        dev_set_drvdata(&mtd->dev, mtd);
        if (device_register(&mtd->dev) != 0)
                goto fail_added;

        if (MTD_DEVT(i))
                device_create(&mtd_class, mtd->dev.parent,
                              MTD_DEVT(i) + 1,
                              NULL, "mtd%dro", i);

And if we look at 'mtd_add_partition()', we see that 'add_mtd_device()'
is also called, so mtd->dev should be initialized.

What exactly is the problem?

-- 
Best Regards,
Artem Bityutskiy
