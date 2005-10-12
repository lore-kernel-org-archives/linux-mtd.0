Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EPkgy-0002Xg-At
	for linux-mtd@lists.infradead.org; Wed, 12 Oct 2005 13:47:09 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IO900BBWDEDEL20@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 12 Oct 2005 13:47:01 -0400 (EDT)
Date: Wed, 12 Oct 2005 13:47:01 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <87r7aqvf4s.wl%kletschke@synertronixx.de>
To: Konstantin Kletschke <lists@ku-gbr.de>
Message-id: <Pine.LNX.4.64.0510121312410.23357@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <87slv6vgt2.wl%kletschke@synertronixx.de>
	<Pine.LNX.4.64.0510121248520.23357@localhost.localdomain>
	<87r7aqvf4s.wl%kletschke@synertronixx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: XIP issues introduced between 2.6.12 and 2.6.13
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 Oct 2005, Konstantin Kletschke wrote:

> At Wed, 12 Oct 2005 12:52:49 -0400 (EDT),
> Nicolas Pitre <nico@cam.org> wrote:
> 
> > OK....  Let me resume that:
> > 
> > 1) you have an XIP kernel
> 
> Yes.
> 
> > 2) if you use NFS everything is fine
> 
> NFS used in both cases as root file system.

What both cases?

> > 3) if you use JFFS2 built as a module everything _appears_ fine
> 
> Yes.
> 
> > 4) if you use JFFS2 built-in it crashes.
> 
> Yes.

Does it crash when JFFS2 is built-in but _not_ used as root?
I mean, does it not crash up to the point you mount it and try to access 
it?

> > When JFFS2 is modular, are MTD drivers modular as well?
> 
> In both cases built in.
> Only difference a "jffs2" in lsmod output or not :-)

If so something is really weird.

CAn you try with and without CONFIG_JFFS2_FS_WRITEBUFFER?

Looking at the changelog between v2.6.12 and v2.6.13 for fs/jffs2/ I 
don't see anything that could obviously explain the above.

Can you try the 2.6.12 code for JFFS2 in your 2.6.13 kernel?


Nicolas
