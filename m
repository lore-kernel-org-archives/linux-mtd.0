Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FjuNv-00045O-4I
	for linux-mtd@lists.infradead.org; Sat, 27 May 2006 09:42:59 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: Simon Vogl <vogl@soft.uni-linz.ac.at>
In-Reply-To: <446ED4ED.80704@soft.uni-linz.ac.at>
References: <E76D631A87C2874E895D1639A1CEDB962AF95B@aae-exchange.aaesys.com>
	<1147822363.30771.10.camel@shinybook.infradead.org>
	<c0c067900605171450u3bbd5292sf61341527d5040e3@mail.gmail.com>
	<446ED4ED.80704@soft.uni-linz.ac.at>
Content-Type: text/plain
Date: Sat, 27 May 2006 10:43:05 +0200
Message-Id: <1148719386.5239.125.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Dan Merillat <harik.attar@gmail.com>, Jayasri Sangu <JayasriS@aaesys.com>
Subject: Re: Intel P30 flash support MTD 2.4.16 kernel
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-05-20 at 10:35 +0200, Simon Vogl wrote:
> > If it fails, turn on DEBUG_CFI_FEATURES in
> > drivers/mtd/chips/cfi_cmdset_0001.c and check
> > for Simultaneous Operations.  Some P30 versions erroniously set that
> > bit and fail horribly as a result.   I spent a week trying to figure
> > that out.
> 
> 
> I found out this minute that this could apply to my pxa271 core (with 
> on-chip p30 flash!)
> as well - it reports the sim.op. bit, while the data sheet says no. 
> Could you tell me what your
> symptoms were, and your cure (a code snippet, preferrably)?

The real cure is to replace the chips by working ones. The hack is to
mask out the simultaneous ops bit when reading the CFI features.

	tglx
