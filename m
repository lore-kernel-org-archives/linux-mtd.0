Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K0JVG-00070J-4e
	for linux-mtd@lists.infradead.org; Sun, 25 May 2008 16:55:26 +0000
Date: Sun, 25 May 2008 18:55:16 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
Message-ID: <20080525165515.GC14741@logfs.org>
References: <20080524175647.GA7366@logfs.org>
	<346401.5675.qm@web36705.mail.mud.yahoo.com>
	<20080525072501.GA13140@logfs.org>
	<20080525133029.GA3599@shareable.org>
	<20080525162426.GA14741@logfs.org>
	<20080525163555.GA7112@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080525163555.GA7112@shareable.org>
Cc: linux-mtd@lists.infradead.org, Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 25 May 2008 17:35:56 +0100, Jamie Lokier wrote:
> 
> I mean that progressive writing may cause more wear towards the
> beginning of _each_ eraseblock, because you'll write more often at the
> start of each eraseblock than the end.  That's if wear is at all a
> function of writes, and not solely erase operations.

I don't have any numbers on that.  Iirc on NOR flash, erase voltage is
significantly higher than write voltage, so erase likely dominate the
wear.  NAND flash may behave differently.

> There's another curious thought: do individual flash bit cells wear
> out more quickly when written to "0" or left at "1"?  I doubt it, but
> if it did make a difference, it would make a case for xoring data with
> predictable pseudo-random bits.

Might make a nice article for the April edition of some magazine. ;)

Jörn

-- 
Anything that can go wrong, will.
-- Finagle's Law
