Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Ffy8M-0002kz-R4
	for linux-mtd@lists.infradead.org; Tue, 16 May 2006 07:54:52 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060516083302.GC18958@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701F9F027@NNSMSX401>
	<20060515122535.GA26656@wohnheim.fh-wedel.de>
	<44697264.8040509@intel.com>
	<20060516083302.GC18958@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Tue, 16 May 2006 15:54:05 +0400
Message-Id: <1147780446.20604.19.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alexander Belyakov <alexander.belyakov@intel.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support (revised)
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-05-16 at 10:33 +0200, Jörn Engel wrote:

> Not generic enough.  You would need a similar, but not identical check
> for dataflash, another one for ecc nor, one for sibley.  And if
> someone merges yet another weird chip...
> 
> What I'm currently doing in my tree (that dwmw2 still didn't look at)
> is remove some of the special cases in existing code.  Basically, I
> start with the lowest common denominator of all devices:
> 1. Device has one erasesize.
> 2. Device has one writesize.
> 3. Erasesize is a multiple of writesize.
> 4. At least <writesize> aligned bytes must be written in one go.
> 5. Writes to any eraseblock must happen in order, from lowest offset to
>    highest.
> 6. Any number of eraseblocks can be written to in any order, providing
>    that rule 5 is followed.
> 7. Neither writesize nor erasesize must be a power of 2.

Good list. I have a comment for 5. For NOR flash it is possible to clear
individual bits and JFFS2 exploits this feature (to mark nodes
obsolete). So, it may sometimes write out-of-order. Thus, I'd
re-formulate item 5 to take this into account.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
