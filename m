Received: from 213-229-28-240.static.adsl-line.inode.at ([213.229.28.240]
	helo=contec-int.at)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CIAMI-0005SE-NW
	for linux-mtd@lists.infradead.org; Thu, 14 Oct 2004 14:29:52 -0400
From: Manfred Gruber <gruber.m@utanet.at>
To: linux-mtd@lists.infradead.org
Date: Thu, 14 Oct 2004 19:08:55 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200410141908.55561.gruber.m@utanet.at>
Subject: phram/slram
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi !

I have a 2MB nvram on my ARM board.
slram and phram driver is possible to load and nvram works.

but phram driver is very slow (needs 20 seconds to load on insmod), slram is 
fast. does anyone know why ?

another question is i have changed in this drivers for a default erase size to 
get a jffs2 fs running on this. i know that it is not the right way to use a 
flash fs on ram but another fs was not possible to run (ext2).

is it correct to use a fs on ram chips? i will do this because then i have not 
to change my application :-)

thanks for comments regards  

manfred


 
