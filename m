Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CQG0K-0006Gv-MD
	for linux-mtd@lists.infradead.org; Fri, 05 Nov 2004 21:08:37 -0500
Received: from localhost (nico@localhost)
	by xanadu.home (8.11.6/8.11.6) with ESMTP id iA628ZU17410
	for <linux-mtd@lists.infradead.org>; Fri, 5 Nov 2004 21:08:35 -0500
Date: Fri, 5 Nov 2004 21:08:35 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.61.0411052041230.5250@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: MTD and XIP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Just to let you all know that I committed to CVS my work on making MTD 
deal with flash used for XIP purpose.  At the moment it only supports 
Intel compatible flash on a SA11x0 or PXA2xx based system, but it should 
be easy to extend to other configurations as well.

Also for those interested in making their kernel XIP on ARM, you can 
look at the following patches against Linux-2.6.9:

http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=2154/1
http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=2160/1

Enjoy!


Nicolas
