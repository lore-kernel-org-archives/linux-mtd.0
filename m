Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19MpQB-0003ue-W3
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 14:32:20 +0100
Date: Mon, 2 Jun 2003 15:32:06 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Message-ID: <20030602133206.GA21902@wohnheim.fh-wedel.de>
References: <20030602122631.GB20423@wohnheim.fh-wedel.de>
	<IGEFJKJNHJDCBKALBJLLMEBAFNAA.joakim.tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IGEFJKJNHJDCBKALBJLLMEBAFNAA.joakim.tjernlund@lumentis.se>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2 June 2003 15:03:52 +0200, Joakim Tjernlund wrote:
> >
> > The kernel workspace #defines MAX_MEM_LEVEL to 9, while the zlib
> > default is 8.  That translates to 256k instead of 128k is is likely
> > pointless for JFFS2 style of compression.  Another 50k come from the
> > seperate workspaces for inflate and deflate.  So JFFS2 should be able
> > to work with 280k, roughly.
> 
> hmm, won't the mem level in zlib_deflateInit() influence the needed workspace? I always
> figured that the memory reuirements listed in zconf.h was worst case.
> Since JFFS2 uses mem level 3, is it not possible that JFFS2 needs less memory?

Yes, that makes sense.  Seems a bit hard to exploit that in a clean
way, but not impossible.

> > Have you ever seen/done benchmarks that test zlib compression
> > efficiency?
> no, sorry.

Then someone will have to do those and figure out who actually profits
from the larger mem level.  Depending on the results, we could #define
the value back to 8, make it an option under CONFIG_EMBEDDED or
something similar.

Jörn

-- 
A surrounded army must be given a way out.
-- Sun Tzu
