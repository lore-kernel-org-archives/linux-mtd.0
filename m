Received: from simmts1-srv.bellnexxia.net ([206.47.199.10])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q9Uu-0006M5-9n
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 18:34:56 +0100
Received: from there ([65.92.150.195]) by simmts1-srv.bellnexxia.net
          (InterMail vM.5.01.05.32 201-253-122-126-132-20030307) with SMTP
          id <20030611173522.NAUK12016.simmts1-srv.bellnexxia.net@there>
          for <linux-mtd@lists.infradead.org>;
          Wed, 11 Jun 2003 13:35:22 -0400
From: Chris Marston <chris@wirewerks.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 11 Jun 2003 13:35:24 -0400
MIME-Version: 1.0
Message-Id: <20030611173522.NAUK12016.simmts1-srv.bellnexxia.net@there>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: blkmtd.o, JumpTec Dimm-PC woes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

I'm working on a project using embedded linux on a JumpTec Dimm-PC (the Elan 
SC520 model). The JumpTec (supposedly) emulates a full PC with IDE, etc, so 
up till now, we've been able to get by quite happily with a homegrown 
slack-based distro with a minix FS (the final product will be mostly ro, so 
wear levelling is unnecessary).  Recently, however, we noticed that our 
development units were beginning to corrupt data on writes, well before the 
MTBF of their flash. It turns out that the DIMM-PC carries out a good chunk 
of its IDE-emulating chicanery in the BIOS. Any OS can happily talk to the 
fictitious hard drive on its own, but, without the help of the BIOS, it won't 
properly erase sectors before using them. Thus, because Linux cold-shoulders 
the BIOS, sectors on the (SanDisk NAND) flash aren't getting erased properly, 
and, over time, the boards become unusable.

I'm thinking that the best way to handle this is to use blkmtd.o and then use 
JFFS2, eraseall, etc. Unfortunately, I can't figure out how or where to talk 
to the mtd device created by blkmtd.o. I've tried utils/MAKEDEV and 
/dev/ftla0, and /dev/nftla0, but (eg. eraseall /dev/ftla0) complains that 
there's no such device or address. I know blkmtd.o loaded correctly, because 
it shows an mtd0 in /proc/mtd. Am I having trouble because I'm using devfs? 
How can I make this work?   Is using blkmtd.o even the right approach? Kernel 
hangs at startup when SC520 support is enabled. 
