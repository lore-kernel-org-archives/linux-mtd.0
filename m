Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1984qx-0000BG-LH
	for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2003 21:58:59 +0100
Date: Tue, 22 Apr 2003 22:59:05 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Alex Samoutin <samoutin@hotbox.ru>
Message-ID: <20030422205905.GD662@wohnheim.fh-wedel.de>
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
	<20030422202627.GB662@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030422202627.GB662@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: paul.wong@digitalview.com
cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 April 2003 22:26:27 +0200, Jörn Engel wrote:
> 
> Agreed. But this problem should be handled in kernel. In other words,
> the writing process has to trigger GC and continue writing, if GC
> managed to free more space. It would make sense to tell GC, how much
> space is needed, so it won't work over the whole device, locking the
> NAND for a long time.
> 
> Anything else is very unintuitive to the user and a plain bug, at
> least in my book.

BTW: See the thread "Does jffs2 garbage collection include erasing"

jffs2 does just this. And I didn't even know the code until a few
minutes ago. :)

Jörn

-- 
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra
