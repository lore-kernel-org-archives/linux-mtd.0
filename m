Received: from mail3.aracnet.com ([216.99.193.38])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 176GfH-0001Ey-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 May 2002 21:06:55 +0100
Message-Id: <200205102006.g4AK6kP01710@tinman.seitzassoc.com>
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org
Subject: patch to correct time units in printk of erase time (cfi_probe.c)
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 May 2002 13:06:46 -0700
From: Galen Seitz <galens@seitzassoc.com>
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

This patch changes the time units in the printk statements which display
the erase timeouts from microseconds to milliseconds.  This is in
drivers/mtd/chips/.

galen

--- cfi_probe.c.orig	Thu Oct  4 15:14:59 2001
+++ cfi_probe.c	Fri May 10 12:39:59 2002
@@ -250,11 +250,11 @@
 	else
 		printk("Full buffer write not supported\n");
 	=

-	printk("Typical block erase timeout: %d =B5s\n", 1<<cfip->BlockEraseTim=
eoutTyp);
-	printk("Maximum block erase timeout: %d =B5s\n", (1<<cfip->BlockEraseTi=
meoutMax) * (1<<cfip->BlockEraseTimeoutTyp));
+	printk("Typical block erase timeout: %d ms\n", 1<<cfip->BlockEraseTimeo=
utTyp);
+	printk("Maximum block erase timeout: %d ms\n", (1<<cfip->BlockEraseTime=
outMax) * (1<<cfip->BlockEraseTimeoutTyp));
 	if (cfip->ChipEraseTimeoutTyp || cfip->ChipEraseTimeoutMax) {
-		printk("Typical chip erase timeout: %d =B5s\n", 1<<cfip->ChipEraseTime=
outTyp); =

-		printk("Maximum chip erase timeout: %d =B5s\n", (1<<cfip->ChipEraseTim=
eoutMax) * (1<<cfip->ChipEraseTimeoutTyp));
+		printk("Typical chip erase timeout: %d ms\n", 1<<cfip->ChipEraseTimeou=
tTyp); =

+		printk("Maximum chip erase timeout: %d ms\n", (1<<cfip->ChipEraseTimeo=
utMax) * (1<<cfip->ChipEraseTimeoutTyp));
 	}
 	else
 		printk("Chip erase not supported\n");
