Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12z60s-0002e2-00
	for mtd-list@infradead.org; Tue, 06 Jun 2000 00:10:30 +0100
Date: Tue, 6 Jun 2000 01:10:02 +0200 (CEST)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: JFFS - ready for submission into 2.[34]? 
In-Reply-To: <28127.959934103@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.1000606010429.10303G-100000@fafner.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 2 Jun 2000, David Woodhouse wrote:
> I saw the dicussion about this, and was wondering why mkfs.jffs actually 
> populates the filesystem at all. Is it because it's more space-efficient to 
> do it all at once than it would be to mkfs, mount and populate it?

It's because when you build an embedded product, you typically don't build
it on the target, so you have no way of mounting and populating it. You
should see mkfs.jffs more as a "filesystem cross compiler" than an mkfs
tool (as Finn wrote, there is no need for a "real" mkfs.jffs - an empty
flash will do).

So if you don't like the mkfs stage, you can skip it.

One drawback code-wise is that there is redundancy between code in
mkfs.jffs and in the filesystem itself of course. But the on-flash
node-structure of JFFS is so simple that mkfs.jffs is simple enough to
warrant it I think.

Regarding NAND-flashes and bad blocks - that works even with a pre-made
image. You just make sure the program that does the flashing knows to skip
the bad blocks. You obviously need to have a smaller image than the flash
size minus bad blocks as well :) 

-Bjorn




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
