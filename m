Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AET0d-0001cS-PM
	for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2003 12:31:39 +0000
Received: from root by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1AESzT-0003qA-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2003 13:30:27 +0100
To: linux-mtd@lists.infradead.org
From: Holger Schurig <h.schurig@mn-logistik.de>
Date: Tue, 28 Oct 2003 09:22:36 +0100
Message-ID: <bnl90c$iae$1@sea.gmane.org>
References: <20031022182558.U19834@mvista.com>
	<20031023153307.GA11669@wohnheim.fh-wedel.de>
	<20031023100304.B1070@mvista.com>
	<20031023173148.GC16160@wohnheim.fh-wedel.de>
	<20031023104320.A1345@mvista.com>
	<20031023181541.GE16160@wohnheim.fh-wedel.de>
	<20031023130406.D1345@mvista.com> <20031023165726.J1345@mvista.com>
Mime-Version: 1.0
Sender: news <news@sea.gmane.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Subject: Re: [PATCH] extend physmap.c to support run-time adding partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Meanwhile, we sadly announce the loss of drivers/mtd/maps/jmr3927-flash.c
> file and the death of CONFIG_MTD_JMR3927 (not in MTD tree yet).  :0

First: I like a unified approach. I think that, when it makes sense, board
specifica should be in board specific files at one place. This doesn't
prevent copy&past, e.g. I can copy arch/arm/mach-pxa/accelent.c and paste
stuff into arch/arm/mach-pxa/ramses.c. It's actually easier now, because
there is only one place to look for board specifics.

For example, on linux-2.6 people are trying to have an almost #ifdef-less
drivers/video/pxafb.c and have all in arm/arm/mach-pxa/*.c files.


But just one note: you don't need CONFIG_MTD_JMR3927 if JMR3927 is your
board. At least not in arm/xscale kernels (not sure about other platforms).
You already have CONFIG_ARCH_<board>, e.g. I have CONFIG_ARCH_RAMSES. And I
can re-use this config var in drivers/mtd/maps.

-- 
Try Linux 2.6 from BitKeeper for PXA2x0 CPUs at
http://www.mn-logistik.de/unsupported/linux-2.6/
