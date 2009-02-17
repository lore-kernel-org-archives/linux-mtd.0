Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZDzj-0001XF-IC
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 00:39:30 +0000
Date: Tue, 17 Feb 2009 00:39:22 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Subject: Re: [UBIFS] Filesystem capacity
Message-ID: <20090217003921.GB20713@shareable.org>
References: <49997BBF.7080906@wb.com.pl> <49998C2D.7000505@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49998C2D.7000505@nokia.com>
Cc: "Adam S. Turowski" <a.turowski@wb.com.pl>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian Hunter wrote:
> Adam S. Turowski wrote:
> > jffs2:
> > nor: 28361 kB
> > nand: 31200 kB
> > 
> > [ubifs]:
> > nor: 26960 kB (I can live with that)
> > nand: 23552 kB (With that I cannot)
> 
> It is because the LEB size is relatively small, and UBIFS does not
> fit data into the ends of eraseblocks the way JFFS2 does.  Your options
> are:
> 	1. use JFFS2
> 	2. amend your NAND driver to pretend that eraseblocks are bigger
> than they really are, by treating 2 (or 4 or 8 etc) as one eraseblock
> 	3. create another MTD driver that sits on top of the NAND driver
> and does the same as 2
> 
> The disadvantage of 2 or 3 is that it also multiples the effective number
> of bad blocks.

Is this a major flaw of UBIFS?  I was thinking of using UBIFS for a
project but this makes me wonder if it's a good idea.

What does "UBIFS does not fit data into the ends of eraseblocks the
way JFFS2 does" mean?

Thanks,
-- Jamie
