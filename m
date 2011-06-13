Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QWBoK-0003qs-Bd
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2011 18:24:29 +0000
Received: by wwb39 with SMTP id 39so3995384wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Jun 2011 11:24:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307635412.7374.128.camel@localhost>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307605456.7374.35.camel@localhost>
	<BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
	<1307635412.7374.128.camel@localhost>
Date: Mon, 13 Jun 2011 11:24:23 -0700
Message-ID: <BANLkTimh12AhqfE+Yx3Yi_m=NyUb34JoXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Igor Grinberg <grinberg@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 9, 2011 at 9:03 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2011-06-09 at 09:00 -0700, Brian Norris wrote:
>> On Thu, Jun 9, 2011 at 12:44 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> > Wait, and why are we using pr_* while it is better to use dbg_* ? :-)
>>
>> Just so we're on the same page...did you say "dbg_*" when you really
>> meant "dev_*"?
>
> Yes, I meant dev_*
>
>> Anyway, the answer is: I'm mostly trying to do as little shakeup as
>> possible, so "printk" could translate pretty directly to the "pr_*"
>> with shorter code, etc. If it makes as much (or more) sense to have
>> the device name on all the prints, then I can just as well do it that
>> way.
>
> Yes, I think it makes much more sense to specify for which device (out
> of possibly many!) this message belongs.

I've been testing some of the "dev_*" printing, and it seems as if our
mtd_info structs never have fully initialized "device" fields (i.e.,
mtd->dev.driver, mtd->dev.bus, mtd->dev.class, mtd->dev.init_name,
etc. are never filled in with anything meaningful). That means that
our dev_* messages do not have anything to work from and simply print
" (null): " references before our strings instead of device
driver/name information, for example:

 (null): ONFI flash detected

I'm a little new to the Linux device model, so I'm not sure if it's
safe and sensible to add lines to a driver's nand_probe function,
like, for plat_nand.c:
data->mtd.dev.driver = pdev->dev.driver;
data->mtd.dev.init_name = dev_name(&pdev->dev);

Is there some better way to initialize these device values? Or should
we scrap the whole dev_* thing since MTD doesn't match the device
model well enough?

Brian
