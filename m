Received: from auucp0.ams.ops.eu.uu.net ([195.129.70.39])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16SdRi-0005sX-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2002 12:21:06 +0000
Received: from pc374 ([172.17.100.163])
	by enterprise.chess.nl (8.8.8+Sun/8.8.8) with SMTP id MAA19110
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2002 12:37:36 +0100 (MET)
Message-Id: <200201211137.MAA19110@enterprise.chess.nl>
Date: Mon, 21 Jan 2002 12:37:06 +0100
To: linux-mtd@lists.infradead.org
From: Jeroen Roose <Jeroen.Roose@chess.nl>
Subject: Intel C3 chips
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello,

We've got a board based on the CDB89712 but using C3 (TE28F320/C3BC90) in
stead of the B3 version. The C3 chip locks all blocks on chip reset. I've
patched the bootloader (hermit) to unlock all blocks on boot.
I've got MTD/JFFS2 working on the board, with the bootloader patch, but I
think MTD should unlock the blocks.
I'm not familiar with the MTD architecture, so I don't no how/where to
implement this, can You help me to point this out ?

Thanks,

Jeroen Roose

chess eT

http://www.chess.nl
