Received: from web14812.mail.yahoo.com ([66.163.172.96])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18AmN0-0006O1-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2002 07:18:58 +0000
Message-ID: <20021110074920.4607.qmail@web14812.mail.yahoo.com>
Date: Sat, 9 Nov 2002 23:49:20 -0800 (PST)
From: Kevin Kaichuan He <hek_u5@yahoo.com>
Subject: Re: Q on MTD support for NOR flash
To: "Jörn" Engel <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20021109205730.GB16704@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Jorn,

Thank you very much !

One Further question is : how do I configure MTD driver to support
my NOR flash ? For example, the AMD29LV800 flash has two width: 8bits
or 16bits, how do I let the driver know which width of word I choose ?
Or can the MTD magically figure out the configuration of my NOR 
flash ?

thanks!

Kevin

--- Jörn Engel <joern@wohnheim.fh-wedel.de> wrote:
> On Sat, 9 November 2002 12:36:50 -0800, Kevin Kaichuan He wrote:
> > 
> > We are considering to use NOR flash in a embedded linux
> > system. But it seems that NAND flash support was mentioned
> > a lot in MTD instead of NOR flash. I'm wondering if there
> > is intensive NOR flash support in MTD, specifically if
> > AMD's boot sector NOR flash
> >
>
(AM29LV800B,http://www.amd.com/us-en/FlashMemory/ProductInformation/0,,37_1447_1623_1468%5E1532,00.html)
> > is supported.
> 
> Yupp.
> Nand flash support is not too old and thus is getting a lot more
> development now. Nor, in almost all cases, simply works.
> 
> > Also can we partition the AM29LV800B into multiple partitions and
> > mount different filesystem on it (e.g. JFFS on RW partiton and Cramfs
> > on RO partition) ?
> 
> Yupp.
> 
> > How about the boot sector of NOR flash, is it supported too ?
> 
> Kinda. If you have to access the small fragments seperately, you might
> run into problems. But that is usually only done from a bootloader,
> not from linux.
> For all practical purposes, yupp.
> 
> Jörn
> 
> -- 
> Fancy algorithms are slow when n is small, and n is usually small.
> Fancy algorithms have big constants. Until you know that n is
> frequently going to be big, don't get fancy.
> -- Rob Pike


__________________________________________________
Do you Yahoo!?
U2 on LAUNCH - Exclusive greatest hits videos
http://launch.yahoo.com/u2
