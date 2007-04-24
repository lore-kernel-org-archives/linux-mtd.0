Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HgImD-00014g-LK
	for linux-mtd@lists.infradead.org; Tue, 24 Apr 2007 07:01:42 -0400
Date: Tue, 24 Apr 2007 13:01:39 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Vitaly Wool <vitalywool@gmail.com>
Subject: Re: [PATCH] NAND Flash support for Intel IXP4xx platform
Message-ID: <20070424110139.GE1748@xi.wantstofly.org>
References: <46274486.9030609@ru.mvista.com> <462878F9.2090603@ru.mvista.com>
	<462DDD04.5020405@ru.mvista.com>
	<20070424103827.GC1748@xi.wantstofly.org>
	<462DDFEF.4070604@ru.mvista.com>
	<20070424104930.GD1748@xi.wantstofly.org>
	<acd2a5930704240353w58ac0cb5m8d7c2af35b7badc7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acd2a5930704240353w58ac0cb5m8d7c2af35b7badc7@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, "Ruslan V. Sushko" <rsushko@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 24, 2007 at 02:53:41PM +0400, Vitaly Wool wrote:

> >I wonder how much sense it makes to call this mtd driver "the
> >ixp4xx NAND flash driver" if there's hardly anything ixp4xx-specific
> >in it.
> >
> >For that matter, I wonder how much sense it makes to submit a
> >separate NAND driver for every ARM SoC.  For NOR flashes we have
> >physmap, we should have something similar for NAND.
> 
> It won't do for all the cases, but for the drivers where only cmd_ctrl
> differs that might really make sense.

Yes, exactly.  For a unified NAND driver, you can just assume that the
data register will be memory-mapped.  This is probably true in 99% of
the cases.  In cases where this isn't true, people can still write their
own driver.
