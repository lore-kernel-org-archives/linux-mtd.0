Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHjFM-0007lg-8f
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 10:37:54 -0400
Date: Tue, 20 Sep 2005 16:36:22 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20050920143622.GD4634@wohnheim.fh-wedel.de>
References: <4329251C.7050102@mw-itcon.de> <4329288B.8050909@yandex.ru>
	<43292AC6.40809@mw-itcon.de> <43292E16.70401@yandex.ru>
	<43292F91.9010302@mw-itcon.de> <432FE1EF.9000807@yandex.ru>
	<432FEF55.5090700@mw-itcon.de> <433006D8.4010502@yandex.ru>
	<20050920133244.GC4634@wohnheim.fh-wedel.de>
	<43301877.3040306@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43301877.3040306@yandex.ru>
Cc: linux-mtd@lists.infradead.org, Peter Menzebach <pm-mtd@mw-itcon.de>
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 September 2005 18:11:03 +0400, Artem B. Bityutskiy wrote:
> Jörn Engel wrote:
> >Still can't.  Block devices have the attribute that writing AAA... to
> >a block containing BBB... gives you one of three possible results in
> >case of power failure:
> >
> >1. BBB...BBB all written
> >2. AAA...AAA nothing written
> >3. AAA...BBB partially written.
> >
> >Flash doesn't have 3, but two more cases:
> >4. FFF...FFF erased, nothing written
> >5. AAA...FFF erased, partially written
> >
> >Plus the really obnoxious
> >6. FFF...FFF partially erased.  Looks fine but some bits may flip
> >   randomly, writes may not stick, etc.
> >
> >Now try finding a filesystem that is robust if 4-6 happens. ;)
> Don't underastand this. If you mean the atomicity, CRC may help here. 
> And no problems. Or may be you missed the the fact that we have 
> eraseblock size = writeblock size?

Image this block contains the used block bitmap of ext2.  All blocks
handled with this bitmap are free, so the complete block contains
zeroes.  Now we allocate a single block, writing a single one to the
bitmap.  When writing, a power failure happens right after the erase:

Before:
00000000000

After:
FFFFFFFFFF

Gee, every single block is used now.  Good thing this happened to the
block bitmap, so we only lost some space on the fs.  Somewhere else,
we'd have data corruption.

Any hard disk filesystem will suffer some kind of corruption in such a
case.  They heavily depend on the non-existance of 4-6.

> >>JFFS2 orients to "classical" flashes. They have no "write page with 
> >>built-in erase" operation.
> >What does this thing do?
> It erases individual page, then writes there. To put it differently, in 
> your terminology, eraseblock size = writeblock size.

Neat.

> P.S. I actually missed the mailing list, this should have gone to the 
> MTD ML. So let's move there please.

As always.  You fuck it up, I get to fix it. ;)

Jörn

-- 
Homo Sapiens is a goal, not a description.
-- unknown
