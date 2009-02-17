Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZMIu-000492-BW
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 09:31:51 +0000
Subject: Re: [UBIFS] Filesystem capacity
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20090217091633.GB26354@shareable.org>
References: <49997BBF.7080906@wb.com.pl> <49998C2D.7000505@nokia.com>
	<1234850859.17790.213.camel@localhost.localdomain>
	<499A69BA.6080005@wb.com.pl>
	<1234857466.17790.227.camel@localhost.localdomain>
	<20090217091633.GB26354@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Feb 2009 11:31:23 +0200
Message-Id: <1234863083.17790.241.camel@localhost.localdomain>
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

On Tue, 2009-02-17 at 09:16 +0000, Jamie Lokier wrote:
> Artem Bityutskiy wrote:
> > OK, then indeed Adrian wrote exactly the right thing. You have huge
> > 4144-byte uncompressible nodes. You fit 3 of them to each eraseblock,
> > and you waste 3440 bytes in each eraseblock. JFFS2 would jam a little
> > more data, because it can split big blocks on parts.
> > 
> > In real life you will likely have compressible data, and many small
> > files, so you will have small data nodes and many inode nodes, which
> > are 160 bytes in size, so you will fit more.
> 
> Also, in real life, JFFS2 will behave badly when the filesystem is
> completely full.  Its garbage collector can use 100% CPU for minutes
> even on a small NOR flash, if the filesystem fills up too much.  It
> happens because it's difficult to reorganise the data when there's no
> spare room.
> 
> I wonder if the "lost" space in UBIFS is helpful to prevent long
> garbage collection cycles?

In JFFS2 GC is random, which means it may:
1. Pick an full EB to GC, this is how JFFS2 does wear-levelling
2. Pick a non-optimal EB to GC, which means that instead of picking EB
with largest amount of dirty space, JFFS2 picks an EB with not so much
dirty space

In UBIFS, we always try pick the most optimal LEB, with most of dirty
space. We have hashtables for this, where we keep track of such LEBs.
This makes UBIFS GC work faster.

And yes, in a way the wasted space helps. And in UBIFS the GC will not
even try GC-ing an LEB if the amount of dirty+free space in it is less
than NAND page size.

However, UBIFS may be optimized and one may teach the GC to try putting
small nodes to the wasted areas at the ends of eraseblocks. We just did
not do this. This is one more way to improve UBIFS.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
