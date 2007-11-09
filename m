Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqY2k-00035m-AZ
	for linux-mtd@lists.infradead.org; Fri, 09 Nov 2007 12:53:29 -0500
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JR900G4A2ZTR890@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 09 Nov 2007 12:52:41 -0500 (EST)
Date: Fri, 09 Nov 2007 12:52:41 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on power
	up
In-reply-to: <845838.39111.qm@web43144.mail.sp1.yahoo.com>
Message-id: <alpine.LFD.0.9999.0711091248130.21255@xanadu.home>
References: <845838.39111.qm@web43144.mail.sp1.yahoo.com>
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
> > > Adding the ability to unlocking all Intel flash that is locked on power up. 
> > > Currently only Intel P30 flash is unlocked.  All Intel flash is locked on power
> > up.
> > 
> > What if you wanted for some of your flash partitions to remain locked?
> > 
> 
> It will not unlock any partitions that are listed are read only in your map.  
> 
> I prefer to use the command line partitioning so if I have
> "mtdparts=M18:0x80000(blob)ro,0x280000(kernel)," mtd0, the boot loader, will remain
> locked and mtd1, the kernel, will be unlocked.  

That might be your preference.  But locked flash blocks are more likely 
to be immune against software bugs for example.  Unconditionally 
unlocking all blocks without regards for the wish of the user is a bad 
idea.  This is policy that is better decided elsewhere.

I think that adding a mount flag to jffs2 to unlock the concerned 
partition when it is about to be mounted read-write would be a much 
better solution.  This has been discussed on the list long ago IIRC, but 
no one came forward with a patch.


Nicolas
