Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19zBaz-00009S-BA
	for <linux-mtd@lists.infradead.org>; Tue, 16 Sep 2003 09:54:01 +0100
Date: Tue, 16 Sep 2003 10:51:28 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Yu Chen <dychen@stanford.edu>
Message-ID: <20030916085128.GC27703@wohnheim.fh-wedel.de>
References: <200309160435.h8G4ZkQM009953@elaine4.Stanford.EDU>
	<20030916065553.GA12329@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030916065553.GA12329@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: mc@cs.stanford.edu
cc: David Woodhouse <dwmw2@infradead.org>
cc: linux-kernel@vger.kernel.org
cc: Wade <neroz@ii.net>
Subject: Re: [CHECKER] 32 Memory Leaks on Error Paths
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 16 September 2003 08:55:53 +0200, Jörn Engel wrote:
> On Mon, 15 September 2003 21:35:46 -0700, David Yu Chen wrote:
> > 
> > looks like checking for mtdblks instead of mtdblk
> > [FILE:  2.6.0-test5/drivers/mtd/mtdblock.c]
> > [FUNC:  mtdblock_open]
> > [LINES: 277-279]
> > [VAR:   mtdblk]
> >  272:		mtdblks[dev]->count++;
> >  273:		return 0;
> >  274:	}
> >  275:	
> >  276:	/* OK, it's not open. Create cache info for it */
> > START -->
> >  277:	mtdblk = kmalloc(sizeof(struct mtdblk_dev), GFP_KERNEL);
> >  278:	if (!mtdblks)
> > END -->
> >  279:		return -ENOMEM;
> >  280:
> >  281:	memset(mtdblk, 0, sizeof(*mtdblk));
> >  282:	mtdblk->count = 1;
> >  283:	mtdblk->mtd = mtd;
> >  284:
> 
> Invalid.  This is quite an obvious false positive, at least if your
> algorithm checks for possible value ranges.

Actually, it *is* valid, as Wade pointed out to me.

David, please apply!

Jörn

-- 
Mundie uses a textbook tactic of manipulation: start with some
reasonable talk, and lead the audience to an unreasonable conclusion.
-- Bruce Perens

--- linux-2.6.0-test3/drivers/mtd/mtdblock.c~mtdblock_leak	2003-07-05 23:59:30.000000000 +0200
+++ linux-2.6.0-test3/drivers/mtd/mtdblock.c	2003-09-16 10:47:58.000000000 +0200
@@ -275,7 +275,7 @@
 	
 	/* OK, it's not open. Create cache info for it */
 	mtdblk = kmalloc(sizeof(struct mtdblk_dev), GFP_KERNEL);
-	if (!mtdblks)
+	if (!mtdblk)
 		return -ENOMEM;
 
 	memset(mtdblk, 0, sizeof(*mtdblk));
