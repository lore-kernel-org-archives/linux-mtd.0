Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EPjqX-0001mJ-5Q
	for linux-mtd@lists.infradead.org; Wed, 12 Oct 2005 12:52:59 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IO900DO7AW1M7H0@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 12 Oct 2005 12:52:49 -0400 (EDT)
Date: Wed, 12 Oct 2005 12:52:49 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <87slv6vgt2.wl%kletschke@synertronixx.de>
To: Konstantin Kletschke <lists@ku-gbr.de>
Message-id: <Pine.LNX.4.64.0510121248520.23357@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <87slv6vgt2.wl%kletschke@synertronixx.de>
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

> 
> Well, as two other guys also I experience Problems getting XIP
> functional on 2.6.13.
> In order to debug this I set up a nfs root to play from there.
> 
> The funny thing I relize now, is the following:
> 
> With jffs2 build into the kernel image the system freezes reproducable
> when touching a file.
> 
> When build and load as a module I can do anything with the mounted
> jffs2 partition, everything works fine.
> 
> Now I am puzzled. The not being a module or being a module is the only
> difference and I testet both situations a dozen of times.
> Another sidenote: I once had an XIP Kernel today running, root over
> nfs and used /dev/mtdblock4 as a swap device with no problems. How
> comes that :) ?

OK....  Let me resume that:

1) you have an XIP kernel

2) if you use NFS everything is fine

3) if you use JFFS2 built as a module everything _appears_ fine

4) if you use JFFS2 built-in it crashes.

Is the above right?

When JFFS2 is modular, are MTD drivers modular as well?


Nicolas
