Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CQTxg-0000BE-62
	for linux-mtd@lists.infradead.org; Sat, 06 Nov 2004 12:02:49 -0500
Date: Sat, 6 Nov 2004 12:02:47 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Dan Post <postster@gmail.com>
In-Reply-To: <Pine.LNX.4.61.0411061031070.5250@xanadu.home>
Message-ID: <Pine.LNX.4.61.0411061155480.5250@xanadu.home>
References: <Pine.LNX.4.61.0411052041230.5250@xanadu.home>
	<9f920bdf04110522596551a0a4@mail.gmail.com>
	<Pine.LNX.4.61.0411061031070.5250@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD and XIP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 6 Nov 2004, Nicolas Pitre wrote:

> On Fri, 5 Nov 2004, Dan Post wrote:
> 
> > Do you have a specific reason to always disable write suspend on XIP
> > kernels?  That's a pretty big latency hit, and I don't think we need
> > to disable it for XIP systems.
> > I saw your comment that "the XIP system config appears to have
> > problems using write suspend at the moment".  Any specifics?
> 
> It was causing me jffs2 corruption problems and I couldn't figure out 
> why.  So after two days of bug chasing I gave up and disabled write 
> suspend, blaming the hardware.  I measured the IRQ latency hit to be in 
> the 400 usec range in that case.
> 
> If you want to have a look please be my guest. To reproduce the problem, 
> simply comment out the clearing of the write suspend bit and do:
> 
> 	eraseall /dev/mtd2
> 	mount -t jffs2 /dev/mtdblock2 /mnt
> 	cd /mnt
> 	tar -cvf test.tar /sbin
> 	tar -xvf test.tar
> 
> This was enough for jffs2 to complain about node totlen mismatch errors 
> and occasional CRC errors.

Oh and BTW you don't need to have your kernel actually XIP to test this.
A standard kernel but with CONFIG_MTD_XIP enabled will show the problem 
as well, and it makes the loading of new test kernels quicker (unless 
you do everything modular).


Nicolas
