Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HgIaU-0000U4-0B
	for linux-mtd@lists.infradead.org; Tue, 24 Apr 2007 06:49:45 -0400
Date: Tue, 24 Apr 2007 12:49:30 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
Subject: Re: [PATCH] NAND Flash support for Intel IXP4xx platform
Message-ID: <20070424104930.GD1748@xi.wantstofly.org>
References: <46274486.9030609@ru.mvista.com> <462878F9.2090603@ru.mvista.com>
	<462DDD04.5020405@ru.mvista.com>
	<20070424103827.GC1748@xi.wantstofly.org>
	<462DDFEF.4070604@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <462DDFEF.4070604@ru.mvista.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 24, 2007 at 02:46:07PM +0400, Ruslan V. Sushko wrote:

> >>The patch adds glue logic to support MTD for NAND flash devices on
> >>Intel IXP4xx based platform
> >
> >Hmm, the IXP4xx doesn't have an on-chip NAND controller, does it?
> >Is this for NAND flashes connected to the expansion bus?  Maybe we
> >need something a la physmap for NAND flashes..
> 
> Yes, It's true the NAND flash is connected to expansion bus. The driver 
> has two parts: The common glue logic submitted here and the platform 
> specific (evaluation board) definition submitted to 
> http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=4323/2
> All maps defined in last patch

I wonder how much sense it makes to call this mtd driver "the
ixp4xx NAND flash driver" if there's hardly anything ixp4xx-specific
in it.

For that matter, I wonder how much sense it makes to submit a
separate NAND driver for every ARM SoC.  For NOR flashes we have
physmap, we should have something similar for NAND.
