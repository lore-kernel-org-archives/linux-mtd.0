Received: from zeus.bridgeport.edu ([216.87.96.66])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DoTCL-0004rt-Ao
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2005 17:37:22 -0400
Received: from [192.168.1.118] (ool-4578a014.dyn.optonline.net [69.120.160.20])
	(authenticated bits=0)
	by zeus.bridgeport.edu (8.12.10/8.12.10/UBNet-AUTH-TLS) with ESMTP id
	j61LM26R011345 for <linux-mtd@lists.infradead.org>;
	Fri, 1 Jul 2005 17:22:03 -0400 (EDT)
From: itche <itche@bridgeport.edu>
To: linux-mtd@lists.infradead.org
Date: Fri, 1 Jul 2005 17:18:33 -0400
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200507011718.33121.itche@bridgeport.edu>
Subject: samsung nand flash
Reply-To: itche@bridgeport.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,
i have a board based on the 5272 with two different Flash devices on it.
one NOR on CS0 at 0xFF000000 and one NAND on CS6 at 0x30000000.
I have managed to MTD the NOR flash, put a bootloader (COLILO) and the kernel.
i have also managed to create 2 partitions and mount JFFS2 on that NOR.
My problem is with the NAND, i just cant make uclinux to "See" it.
Is there a tutorial/howto or something else that can show me the necessary 
steps to acheeve my goal.

Thanks a bunch in advance
Isack
