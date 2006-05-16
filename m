Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FfyZW-0003qt-6q
	for linux-mtd@lists.infradead.org; Tue, 16 May 2006 08:22:59 -0400
Date: Tue, 16 May 2006 14:22:22 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-ID: <20060516122222.GA11656@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701F9F027@NNSMSX401>
	<20060515122535.GA26656@wohnheim.fh-wedel.de>
	<44697264.8040509@intel.com>
	<20060516083302.GC18958@wohnheim.fh-wedel.de>
	<1147780446.20604.19.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1147780446.20604.19.camel@sauron.oktetlabs.ru>
Cc: Alexander Belyakov <alexander.belyakov@intel.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support (revised)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 16 May 2006 15:54:05 +0400, Artem B. Bityutskiy wrote:
> On Tue, 2006-05-16 at 10:33 +0200, Jörn Engel wrote:
> 
> > Not generic enough.  You would need a similar, but not identical check
> > for dataflash, another one for ecc nor, one for sibley.  And if
> > someone merges yet another weird chip...
> > 
> > What I'm currently doing in my tree (that dwmw2 still didn't look at)
> > is remove some of the special cases in existing code.  Basically, I
> > start with the lowest common denominator of all devices:
> > 1. Device has one erasesize.
> > 2. Device has one writesize.
> > 3. Erasesize is a multiple of writesize.
> > 4. At least <writesize> aligned bytes must be written in one go.
> > 5. Writes to any eraseblock must happen in order, from lowest offset to
> >    highest.
> > 6. Any number of eraseblocks can be written to in any order, providing
> >    that rule 5 is followed.
> > 7. Neither writesize nor erasesize must be a power of 2.
> 
> Good list. I have a comment for 5. For NOR flash it is possible to clear
> individual bits and JFFS2 exploits this feature (to mark nodes
> obsolete). So, it may sometimes write out-of-order. Thus, I'd
> re-formulate item 5 to take this into account.

The list is the lowest common denominator.  Any flash chip will work
for you as long as you stick to the list.

We could have a second list of optional additional features.

Jörn

-- 
Linux [...] existed just for discussion between people who wanted
to show off how geeky they were.
-- Rob Enderle
