Received: from mail2.racnet.net ([213.144.11.11])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DVmXT-000145-1e
	for linux-mtd@lists.infradead.org; Wed, 11 May 2005 04:25:55 -0400
Received: from mikobook.office.rac.de ([10.0.0.84])
	by mail2.racnet.net with asmtp (Exim (Debian)) id 1DVmXW-0000jI-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 May 2005 10:25:58 +0200
Message-ID: <4281C196.2010806@rac.de>
Date: Wed, 11 May 2005 10:25:58 +0200
From: Marcus Mikolaiczyk <m.mikolaiczyk@rac.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Subject: Patching only NAND specific stuff possible?
Reply-To: m.mikolaiczyk@rac.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So again me with my SAMSUNG NAND.
Is it a possibility to patch only the NAND related stuff
driver/mtd/nand/*
include/linux/mtd/nand*
??*
to support new NAND features...
Considering the four Layers (jffs2,mtd,nand,hardware-drivers) it should
be possible onloy to 'update' the nand and hardware-drivers stuff.
Any objections to this?

A secondary short question, if you don't mind.
Where takes the 'addressing' of the NAND takes place (write Col,Row to ALE)?

On the Samsung K9F2G08... there are 5 Cycles for the address resolution
nescessary. And two for the command. Example Read page..
Command=0x00
Address=Col_addr(BIT 0-7)
Address=Col_addr(BIT 8-11)
Address=Row_addr(BIT 0-7)
Address=Row_addr(BIT 8-15)
Address=Row_addr(BIT 16)
CLE=0x30
Then read Data...
I saw some NAND chips which only have 4 Address Cycles.

Kind Regards Marcus
