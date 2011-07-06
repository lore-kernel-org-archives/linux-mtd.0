Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeXCn-0006KJ-3a
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2011 18:52:14 +0000
Received: by wwf22 with SMTP id 22so158374wwf.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jul 2011 11:51:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <itsbm4$d29$1@dough.gmane.org>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307605456.7374.35.camel@localhost>
	<BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
	<1307635412.7374.128.camel@localhost>
	<BANLkTimh12AhqfE+Yx3Yi_m=NyUb34JoXA@mail.gmail.com>
	<1308717655.18119.19.camel@sauron> <itsbm4$d29$1@dough.gmane.org>
Date: Wed, 6 Jul 2011 11:51:19 -0700
Message-ID: <CAN8TOE_DOEUoqOnoX4D3KQz07C43ktJzSL+xuJgvCkDqrWAoPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Brian Norris <computersforpeace@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 22, 2011 at 2:12 AM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> Artem Bityutskiy wrote:
>
>> On Mon, 2011-06-13 at 11:24 -0700, Brian Norris wrote:
>>> I'm a little new to the Linux device model, so I'm not sure if it's
>>> safe and sensible to add lines to a driver's nand_probe function,
>>> like, for plat_nand.c:
>>> data->mtd.dev.driver = pdev->dev.driver;
>
> IIUC, we should not set driver, but it might be better to consult with
> more experienced DM hackers (like Greg Kroah-Hartman).
>
>>> data->mtd.dev.init_name = dev_name(&pdev->dev);
>>
>> I think so, I believe struct device was added to mtd by some non-MTD guy
>> to just make it complaint with one of interface changes which required
>> struct device. So please, go ahead and improve that a bit.

I've dug a little more on this, especially in the RFC + mailing list
conversation that led to adding the "mtd_info.dev" field. See here:
http://lists.infradead.org/pipermail/linux-mtd/2009-April/025142.html

It seems that, according to the following comment, the master MTD node
(which is passed to most of our functions) is never registered and so
does not have valid information for printing dev_* information:
     /* NOTE:  we don't arrange MTDs as a tree; it'd be error-prone
      * to have the same data be in two different partitions.
      */

So it seems that, by "design," mtd->dev will never be suitable for a
dev_* message (at least when "mtd" is the master node), so instead of:
   dev_info(&mtd->dev, "informational message\n");
we should do:
   dev_info(mtd->dev.parent, "informational message\n");
This utilizes the physical device instead of the MTD device for debug messages.

Unfortunately, this kinda makes some of our code longer, rather than
more concise (not a huge deal, I guess). Also, it relies on a
specific, potentially-flawed device tree layout. Perhaps there should
be a "mtd_to_dev" helper (accompanying "dev_to_mtd") to abstract this
a little and leave room for future tree changes? For example:

static inline struct device *mtd_to_dev(struct mtd_info *mtd)
{
	return mtd ? mtd->dev.parent : NULL;
}

That makes the previous example into:
   dev_info(mtd_to_dev(mtd), "informational message\n");

I'll send out a patch set if any of this makes sense.

Brian
