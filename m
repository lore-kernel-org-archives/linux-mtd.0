Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEgA9-0003pA-7z
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 02:34:21 +0000
Date: Tue, 28 Oct 2003 18:33:06 -0800
From: Jun Sun <jsun@mvista.com>
To: Holger Schurig <h.schurig@mn-logistik.de>
Message-ID: <20031028183306.E30683@mvista.com>
References: <20031022182558.U19834@mvista.com>
	<20031023153307.GA11669@wohnheim.fh-wedel.de>
	<20031023100304.B1070@mvista.com>
	<20031023173148.GC16160@wohnheim.fh-wedel.de>
	<20031023104320.A1345@mvista.com>
	<20031023181541.GE16160@wohnheim.fh-wedel.de>
	<20031023130406.D1345@mvista.com> <20031023165726.J1345@mvista.com>
	<bnl90c$iae$1@sea.gmane.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bnl90c$iae$1@sea.gmane.org>;
	from h.schurig@mn-logistik.de on Tue, Oct 28, 2003 at 09:22:36AM +0100
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] extend physmap.c to support run-time adding partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 28, 2003 at 09:22:36AM +0100, Holger Schurig wrote:
> > Meanwhile, we sadly announce the loss of drivers/mtd/maps/jmr3927-flash.c
> > file and the death of CONFIG_MTD_JMR3927 (not in MTD tree yet).  :0
> 
> First: I like a unified approach. I think that, when it makes sense, board
> specifica should be in board specific files at one place. This doesn't
> prevent copy&past, e.g. I can copy arch/arm/mach-pxa/accelent.c and paste
> stuff into arch/arm/mach-pxa/ramses.c. It's actually easier now, because
> there is only one place to look for board specifics.
> 

Exactly!  This is another unspoken benefit of this patch (it had too many
benefits. :0).  Now a lot of board-specific mtd code is moved
into board directory instead of mtd directory.  One would appreciate it
even more when the support for a board is dropped - guess what? No
mtd code change.  Not the case today.

> For example, on linux-2.6 people are trying to have an almost #ifdef-less
> drivers/video/pxafb.c and have all in arm/arm/mach-pxa/*.c files.
> 
> 
> But just one note: you don't need CONFIG_MTD_JMR3927 if JMR3927 is your
> board. At least not in arm/xscale kernels (not sure about other platforms).
> You already have CONFIG_ARCH_<board>, e.g. I have CONFIG_ARCH_RAMSES. And I
> can re-use this config var in drivers/mtd/maps.
>

That is true.  It just happened that JMR3927 chose to create a new
config for MTD.

Jun
