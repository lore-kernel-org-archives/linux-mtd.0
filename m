Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K0AbT-0003o3-1Y
	for linux-mtd@lists.infradead.org; Sun, 25 May 2008 07:25:15 +0000
Date: Sun, 25 May 2008 09:25:02 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
Message-ID: <20080525072501.GA13140@logfs.org>
References: <20080524175647.GA7366@logfs.org>
	<346401.5675.qm@web36705.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <346401.5675.qm@web36705.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 24 May 2008 20:41:17 -0700, Alex Dubov wrote:
> --- Jörn Engel <joern@logfs.org> wrote:
> 
> > Writes happen in multiples of mtd->writesize.  Which for NAND is
> > pagesize.  There are also special cases with subpage writes.  AFAIK only
> > UBI exploits that feature.
> 
> Most xd cards can only be written a whole PEB in a time (can be handled with
> appropriate writesize, I suppose).

Up to 256M writing pages at a time worked for me.  1G didn't work
anymore.  Whether this was due to your requirement above or something
else I didn't work out.

> Memorystick cards can be written page at a time, but only in progressive
> fashion - only if all pages at lower offsets to the current page were written
> before. This can be made to work as a useful optimization.

The same limitation is true for some raw NAND chips as well.  Afaik all
of current MTD honors that limitation.

> Are there any special tricks with subpage writes or it all amounts to "read
> block" -> "merge changes" -> "write block"?

Subpage writes are special.  On some chips less than a page can be
written at once, e.g. 512 bytes for a 2k page chip.  But there are
additional limitations on the numbers of writes.  The 2k chip may limit
you to 3 writes.  So you have to do something like 512, 512, 1k.

Unless you really really need this, you'd better forget about it.

Jörn

-- 
I can say that I spend most of my time fixing bugs even if I have lots
of new features to implement in mind, but I give bugs more priority.
-- Andrea Arcangeli, 2000
