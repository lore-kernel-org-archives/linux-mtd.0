Received: from pu90.internetdsl.tpnet.pl ([80.55.20.90]
	helo=evo.evopolska.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q2jv-0003jP-UY
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 11:22:00 +0100
Date: Wed, 11 Jun 2003 12:24:15 +0200 (CEST)
From: angainor@evo.evopolska.com
To: Pantelis Antoniou <panto@intracom.gr>
In-Reply-To: <3EE6FC72.10107@intracom.gr>
Message-ID: <Pine.LNX.4.44.0306111222000.7730-100000@evo.evopolska.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: Cram FS on NAND - How to do this?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > 3)  What about wear-levelling?
> >
> > Flash blocks do not last indefinitely.  Every erase brings the Flash
> > block you are erasing closer to the end of its lifespan.  Obviously
> > this is less of a concern on a static filesystem like cramfs.
> >
> > Why not put a cramfs filesystem into a file on a YAFFS or JFFS2
> > filesystem and use a loopback to mount it?
> >
> > -Jas.
> >
> >
> >
> Again, no need for that on a read-only filesystem. The number of erases
> I expect during the life of the device is lower than 100.
> 
> And using the loopback trick is impossible for the root filesystem.
> 

Not so impossible ;) You could load the kernel and do the mount
within initrd, then pivot_root / chroot.

Cheers

Marcin
