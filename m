Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qeugb-0003zE-Ml
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 19:56:35 +0000
Received: by bwf12 with SMTP id 12so1429045bwf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jul 2011 12:56:30 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 07 Jul 2011 22:56:26 +0300
In-Reply-To: <CAN8TOE8Qwdc-pjVbucZJD9qNJ3O4n6WVERNK6_QXbqs06pA+kg@mail.gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1310068588.7411.19.camel@koala>
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

On Thu, 2011-07-07 at 10:00 -0700, Brian Norris wrote:
> I believe the problem is simply that partitions are named and
> registered, whereas the master is not. During initialization, all
> debug messages, etc. are run through the master MTD, not the named
> partitions. This gives the "(null):" dev_* messages I saw on bootup.
> I'm not sure if the master device causes much trouble after
> initialization...I think it kinda fades away and leaves the partitions
> for interaction with the user.
> 
> FYI, I'm looking mostly at cases where there *is* a partition layout.
> In cases where there are no partitions, the driver will usually just
> call "add_mtd_device" on the master MTD, and so this device be named
> and registered properly. This isn't so much an issue, except that it
> provides inconsistency between setups that use partitions and those
> that don't. (Couldn't we just force everyone to use partitions? Users
> who don't need them could just form a single partition for the whole
> device...)

Well, ok, indeed, in the driver level we have no idea about partitions,
we deal with the flash chip, by design...

Probably we should better use pr_* series of functions instead, I guess,
as dev_* functions seem to not be really suitable for us. That's what
you have originally done, sorry for bad suggestion.

On the other hand, why we cannot pass the partition struct mtd_info down
to the driver instead? Well, ideally, drivers should not use struct
mtd_info at all. But this is probably a different story...

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
