Received: from web43145.mail.sp1.yahoo.com ([216.252.121.75])
	by bombadil.infradead.org with smtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqYVS-0005ul-VN
	for linux-mtd@lists.infradead.org; Fri, 09 Nov 2007 13:23:10 -0500
Date: Fri, 9 Nov 2007 10:23:00 -0800 (PST)
From: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on
	power up
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <alpine.LFD.0.9999.0711091248130.21255@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <461814.66132.qm@web43145.mail.sp1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > > > Adding the ability to unlocking all Intel flash that is locked on power up. 
> > > > Currently only Intel P30 flash is unlocked.  All Intel flash is locked on
> power
> > > up.
> > > 
> > > What if you wanted for some of your flash partitions to remain locked?
> > > 
> > 
> > It will not unlock any partitions that are listed are read only in your map.  
> > 
> > I prefer to use the command line partitioning so if I have
> > "mtdparts=M18:0x80000(blob)ro,0x280000(kernel)," mtd0, the boot loader, will
> remain
> > locked and mtd1, the kernel, will be unlocked.  
> 
> That might be your preference.  But locked flash blocks are more likely 
> to be immune against software bugs for example.  Unconditionally 
> unlocking all blocks without regards for the wish of the user is a bad 
> idea.  This is policy that is better decided elsewhere.

Setting an MTD partition to read only can be done in the maps files as will as in
the command line.  Those wishing to protect a partition should always set it to read
only for the very same reasons you mentioned.

> 
> I think that adding a mount flag to jffs2 to unlock the concerned 
> partition when it is about to be mounted read-write would be a much 
> better solution.  This has been discussed on the list long ago IIRC, but 
> no one came forward with a patch.
> 

Adding the ability to unlock a partition on mount is not a bad idea, but it should
not be the only way.  I often write to an mtd block device without mounting it and I
do not always use jffs2 as my writable filing system.

Justin

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
