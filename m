Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QfDZf-0003XC-LH
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2011 16:06:47 +0000
Received: by wyf23 with SMTP id 23so1808108wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Jul 2011 09:06:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1310068588.7411.19.camel@koala>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307605456.7374.35.camel@localhost>
	<BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
	<1307635412.7374.128.camel@localhost>
	<BANLkTimh12AhqfE+Yx3Yi_m=NyUb34JoXA@mail.gmail.com>
	<1308717655.18119.19.camel@sauron> <itsbm4$d29$1@dough.gmane.org>
	<CAN8TOE_DOEUoqOnoX4D3KQz07C43ktJzSL+xuJgvCkDqrWAoPw@mail.gmail.com>
	<1310021892.3149.121.camel@sauron>
	<CAN8TOE8Qwdc-pjVbucZJD9qNJ3O4n6WVERNK6_QXbqs06pA+kg@mail.gmail.com>
	<1310068588.7411.19.camel@koala>
Date: Fri, 8 Jul 2011 09:06:34 -0700
Message-ID: <CAN8TOE9y4VUgZ4-Z_crUvvhormRC3v7_MJXuUaY0i5TWV5XLnQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now I'm not sure I entirely understand all your comments :)

On Thu, Jul 7, 2011 at 12:56 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Well, ok, indeed, in the driver level we have no idea about partitions,
> we deal with the flash chip, by design...

What exactly are you referring to? That the inability for drivers to
distinguish between partitions and the master MTD prevents them from
handling our device structure correctly? I thought we're talking
mostly about the NAND layer, not the driver layer.

> Probably we should better use pr_* series of functions instead, I guess,
> as dev_* functions seem to not be really suitable for us. That's what
> you have originally done, sorry for bad suggestion.

OK, I can do that, but first, what about the code I posted earlier for
finding the correct device corresponding to mtd_info?

static inline struct device *mtd_to_dev(struct mtd_info *mtd)
{
       if (device_is_registered(&mtd->dev))
               return &mtd->dev;
       return mtd->dev.parent;
}

I think this would work for any NAND or MTD code, so that we can do
something like this:
     dev_info(mtd_to_dev(mtd), "ONFI flash detected\n");
In NAND/MTD code, we basically have two cases for the current mtd_info:
1) corresponds to the master device, which is not registered. Its
parent should be set to the physical device, so use mtd->dev.parent.
2) corresponds to a partition, which is registered. Use the partition
device &mtd->dev.
There's kind of a third case for non-partitioned flash:
3) corresponds to the master device, which is registered. Use &mtd->dev

These cases should all be covered, and I think the dev_* could would
be just fine. If that's not good enough though, then I'll just go back
to the pr_* code.

> On the other hand, why we cannot pass the partition struct mtd_info down
> to the driver instead? Well, ideally, drivers should not use struct
> mtd_info at all. But this is probably a different story...

Not quite sure where this is coming from. I don't believe I asked
about passing mtd_info to the driver (which happens all the time
anyway, AFAICT...). To be clear, what are the exact layers as you're
seeing them? It doesn't seem like we strictly follow them, but I see
something like this:
Filesystems
MTD
NAND
Driver
(Hardware)

Anyway, this thread has managed to diverge into several different
topics by now, and it all came from some simple printk stuff... maybe
it's worth wrapping up the printk's and handling any device issues
separately.

Brian
