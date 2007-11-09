Received: from web43144.mail.sp1.yahoo.com ([216.252.121.74])
	by bombadil.infradead.org with smtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqXhf-0005IC-5Y
	for linux-mtd@lists.infradead.org; Fri, 09 Nov 2007 12:31:42 -0500
Date: Fri, 9 Nov 2007 09:31:27 -0800 (PST)
From: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on
	power up
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <alpine.LFD.0.9999.0711081950250.21255@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <845838.39111.qm@web43144.mail.sp1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > Adding the ability to unlocking all Intel flash that is locked on power up. 
> > Currently only Intel P30 flash is unlocked.  All Intel flash is locked on power
> up.
> 
> What if you wanted for some of your flash partitions to remain locked?
> 

It will not unlock any partitions that are listed are read only in your map.  

I prefer to use the command line partitioning so if I have
"mtdparts=M18:0x80000(blob)ro,0x280000(kernel)," mtd0, the boot loader, will remain
locked and mtd1, the kernel, will be unlocked.  

Justin  

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
