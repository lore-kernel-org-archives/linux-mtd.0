Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqaIG-0006Ld-F7
	for linux-mtd@lists.infradead.org; Fri, 09 Nov 2007 15:17:39 -0500
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JR9005ZD9OVJI90@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 09 Nov 2007 15:17:19 -0500 (EST)
Date: Fri, 09 Nov 2007 15:17:19 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on power
	up
In-reply-to: <901761.25711.qm@web43144.mail.sp1.yahoo.com>
Message-id: <alpine.LFD.0.9999.0711091515040.21255@xanadu.home>
References: <901761.25711.qm@web43144.mail.sp1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 9 Nov 2007, Justin Treon wrote:

> 
> > > Adding the ability to unlock a partition on mount is not a bad idea, but it
> > should
> > > not be the only way.  I often write to an mtd block device without mounting it
> > and I
> > > do not always use jffs2 as my writable filing system.
> > 
> > Never heard of the MTD flash-unlock user space utility?
> > 
> 
> That does not help me on boot up.  I already have filing sytems that run that
> through scripts on startup for some of my test images.

What about a new partition flag then?  When set the unlock method would 
be called on the corresponding partition if the partition is not already 
marked read-only.


Nicolas
