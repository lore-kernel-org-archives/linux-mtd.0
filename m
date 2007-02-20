Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJTYn-0000ZM-NH
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 06:53:32 -0500
Date: Tue, 20 Feb 2007 10:53:07 +0000
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Felix Fietkau <nbd@openwrt.org>
Subject: Re: [PATCH] block2mtd oops in erase function.
Message-ID: <20070220105306.GC10455@lazybastard.org>
References: <1171920579.4996.8.camel@celeron>
	<20070219222041.GE7813@lazybastard.org>
	<20070219223023.GF7813@lazybastard.org>
	<1171938429.2859.2.camel@NF.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1171938429.2859.2.camel@NF.local>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 February 2007 03:27:09 +0100, Felix Fietkau wrote:
> On Mon, 2007-02-19 at 22:30 +0000, Jörn Engel wrote:
> > On December 21st 2004 by none other than me.  How embarrassing!
> > http://lists.infradead.org/pipermail/linux-mtd/2004-December/011236.html
> > 
> > Can you test this patch?
> > 
> > diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
> > [...]
> 
> Works :)

Cool!  Would you mind also trying two more patches?  One of them just
removes a compile warning if CONFIG_MODULE=n, the other rips out the
readahead code, which should give a nice performance boost on USB
sticks, MMC/SD, etc.  Mounting JFFS2 in particular should be faster.

Jörn

-- 
It does not matter how slowly you go, so long as you do not stop.
-- Confucius
