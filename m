Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZKtQ-0001ka-6U
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 08:01:27 +0000
Subject: Re: [UBIFS] Filesystem capacity
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20090217003921.GB20713@shareable.org>
References: <49997BBF.7080906@wb.com.pl> <49998C2D.7000505@nokia.com>
	<20090217003921.GB20713@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Feb 2009 10:01:13 +0200
Message-Id: <1234857673.17790.231.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Adam S. Turowski" <a.turowski@wb.com.pl>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-02-17 at 00:39 +0000, Jamie Lokier wrote:
> Adrian Hunter wrote:
> > Adam S. Turowski wrote:
> > > jffs2:
> > > nor: 28361 kB
> > > nand: 31200 kB
> > > 
> > > [ubifs]:
> > > nor: 26960 kB (I can live with that)
> > > nand: 23552 kB (With that I cannot)
> > 
> > It is because the LEB size is relatively small, and UBIFS does not
> > fit data into the ends of eraseblocks the way JFFS2 does.  Your options
> > are:
> > 	1. use JFFS2
> > 	2. amend your NAND driver to pretend that eraseblocks are bigger
> > than they really are, by treating 2 (or 4 or 8 etc) as one eraseblock
> > 	3. create another MTD driver that sits on top of the NAND driver
> > and does the same as 2
> > 
> > The disadvantage of 2 or 3 is that it also multiples the effective number
> > of bad blocks.
> 
> Is this a major flaw of UBIFS?  I was thinking of using UBIFS for a

I'd call this a drawback. We mostly desinged UBIFS for modern NANDs,
which have larger eraseblocks (128KiB or more). 16KiB eraseblocks are
very small so UBIFS wastes more space than JFFS2. Adrian pointed the
ways how one can make UBIFS waste less for flashes like this. We just
did not do this.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
