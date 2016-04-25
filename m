Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auhjn-0007Up-1k
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 14:43:47 +0000
Date: Mon, 25 Apr 2016 16:43:14 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Scott Wood <scottwood@freescale.com>
Cc: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, Marek Vasut
 <marex@denx.de>, Alexander Kaplan <alex@nextthing.co>, Brian Norris
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>, Hans
 de Goede <hdegoede@redhat.com>, "linux-sunxi@googlegroups.com"
 <linux-sunxi@googlegroups.com>, Maxime Ripard
 <maxime.ripard@free-electrons.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>
Subject: Porting Linux's MTD/NAND changes into U-Boot
Message-ID: <20160425164314.15c3fc94@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Scott,

I've recently contributed a lot of MTD/NAND related patches (and intend
to continue doing so). Some of them are transversal changes touching the
MTD and NAND framework internals, which implies patching all NAND
drivers along with the core changes.

All those changes are required to properly handle modern NANDs (MLC/TLC
NANDs), and I need them to add proper NAND support to the sunxi
platform (and more particularly to the C.H.I.P from NextThing Co.).

So my question is, how should I port those changes to U-Boot? I see
that your doing "synchronization commits", but in my case this mean
including a bunch of driver specific changes into this "sync commit".

I think it's also worth mentioning that I plan to heavily rework the
Linux NAND framework to improve NAND performances on modern NAND
controllers and clarify the NAND chip / NAND controller concepts, and
other people are also working on merging the BBT code of the NAND and
OneNAND framework. Which unfortunately means that we're not done porting
invasive changes to U-Boot :-/.

Any advice is welcome.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
