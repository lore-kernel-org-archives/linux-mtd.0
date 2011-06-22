Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZFEe-0000Ew-Un
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 04:40:18 +0000
Received: by pvg20 with SMTP id 20so269436pvg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jun 2011 21:40:08 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 22 Jun 2011 07:40:50 +0300
In-Reply-To: <BANLkTimh12AhqfE+Yx3Yi_m=NyUb34JoXA@mail.gmail.com>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307605456.7374.35.camel@localhost>
	<BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
	<1307635412.7374.128.camel@localhost>
	<BANLkTimh12AhqfE+Yx3Yi_m=NyUb34JoXA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308717655.18119.19.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
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

On Mon, 2011-06-13 at 11:24 -0700, Brian Norris wrote:
> On Thu, Jun 9, 2011 at 9:03 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Thu, 2011-06-09 at 09:00 -0700, Brian Norris wrote:
> >> On Thu, Jun 9, 2011 at 12:44 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> > Wait, and why are we using pr_* while it is better to use dbg_* ? :-)
> >>
> >> Just so we're on the same page...did you say "dbg_*" when you really
> >> meant "dev_*"?
> >
> > Yes, I meant dev_*
> >
> >> Anyway, the answer is: I'm mostly trying to do as little shakeup as
> >> possible, so "printk" could translate pretty directly to the "pr_*"
> >> with shorter code, etc. If it makes as much (or more) sense to have
> >> the device name on all the prints, then I can just as well do it that
> >> way.
> >
> > Yes, I think it makes much more sense to specify for which device (out
> > of possibly many!) this message belongs.
> 
> I've been testing some of the "dev_*" printing, and it seems as if our
> mtd_info structs never have fully initialized "device" fields (i.e.,
> mtd->dev.driver, mtd->dev.bus, mtd->dev.class, mtd->dev.init_name,
> etc. are never filled in with anything meaningful). That means that
> our dev_* messages do not have anything to work from and simply print
> " (null): " references before our strings instead of device
> driver/name information, for example:
> 
>  (null): ONFI flash detected

Ouch, good finding.

> I'm a little new to the Linux device model, so I'm not sure if it's
> safe and sensible to add lines to a driver's nand_probe function,
> like, for plat_nand.c:
> data->mtd.dev.driver = pdev->dev.driver;
> data->mtd.dev.init_name = dev_name(&pdev->dev);

I think so, I believe struct device was added to mtd by some non-MTD guy
to just make it complaint with one of interface changes which required
struct device. So please, go ahead and improve that a bit.

> Is there some better way to initialize these device values? Or should
> we scrap the whole dev_* thing since MTD doesn't match the device
> model well enough?

I think there is no reason why it would not match the model, so of
course fixing this is preferable...

-- 
Best Regards,
Artem Bityutskiy
