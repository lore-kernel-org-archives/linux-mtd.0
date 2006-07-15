Received: from tim.rpsys.net ([194.106.48.114])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G1itn-0004UF-Id
	for linux-mtd@lists.infradead.org; Sat, 15 Jul 2006 08:05:40 -0400
Subject: [PATCH] MTD: [NAND] Fix the sharpsl driver after breakage from a
	core conversion
From: Richard Purdie <rpurdie@rpsys.net>
To: tglx@linutronix.de, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Sat, 15 Jul 2006 13:05:24 +0100
Message-Id: <1152965125.13315.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Steven Newbury <s_j_newbury@yahoo.co.uk>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD: [NAND] Fix the sharpsl driver after breakage from a core conversion

The CNE bits are inverted on the device and writeb function is missing a
NOT operation.

Signed-off-by: Richard Purdie <rpurdie@rpsys.net>

Index: git/drivers/mtd/nand/sharpsl.c
===================================================================
--- git.orig/drivers/mtd/nand/sharpsl.c	2006-07-15 12:47:53.000000000 +0100
+++ git/drivers/mtd/nand/sharpsl.c	2006-07-15 12:06:31.000000000 +0100
@@ -78,7 +78,7 @@
 /*
  *	hardware specific access to control-lines
  *	ctrl:
- *	NAND_CNE: bit 0 -> bit 0 & 4
+ *	NAND_CNE: bit 0 -> ! bit 0 & 4
  *	NAND_CLE: bit 1 -> bit 1
  *	NAND_ALE: bit 2 -> bit 2
  *
@@ -92,7 +92,10 @@
 		unsigned char bits = ctrl & 0x07;
 
 		bits |= (ctrl & 0x01) << 4;
-		writeb((readb(FLASHCTL) & 0x17) | bits, FLASHCTL);
+		
+		bits ^= 0x11;
+		
+		writeb((readb(FLASHCTL) & ~0x17) | bits, FLASHCTL);
 	}
 
 	if (cmd != NAND_CMD_NONE)
