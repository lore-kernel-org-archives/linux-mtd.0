Received: from 39.208-78-194.adsl-fix.skynet.be ([194.78.208.39]
	helo=mail.macqel.be)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BW9zZ-0003ea-5w
	for linux-mtd@lists.infradead.org; Fri, 04 Jun 2004 04:24:08 -0400
Received: (from phdm@localhost)
	by mail.macqel.be (8.11.0/8.11.0/SuSE Linux 8.11.0-0.4) id i548NQL23277
	for linux-mtd@lists.infradead.org; Fri, 4 Jun 2004 10:23:26 +0200
Message-Id: <200406040823.i548NQL23277@mail.macqel.be>
To: uclinux-dev@uclinux.org
Date: Thu, 3 Jun 2004 11:05:33 +0200 (CEST)
From: "Philippe De Muyter" <phdm@macqel.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: phdm@macqel.be
Cc: 
Subject: PATCH : 2.6/mtd/Kconfig help
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here is a small patch that IMHO enhances the help for the CFI command set
choices.

Philippe

Index: linux-2.6.x/drivers/mtd/chips/Kconfig
===================================================================
RCS file: /newdev6/cvsrepos/uClinux-dist/linux-2.6.x/drivers/mtd/chips/Kconfig,v
retrieving revision 1.1.1.1
diff -u -r1.1.1.1 Kconfig
--- linux-2.6.x/drivers/mtd/chips/Kconfig	2004/05/07 08:38:48	1.1.1.1
+++ linux-2.6.x/drivers/mtd/chips/Kconfig	2004/06/03 08:59:03
@@ -143,30 +143,30 @@
 	  flash chips addressed by each bus cycle, then say 'Y'.
 
 config MTD_CFI_INTELEXT
-	tristate "Support for Intel/Sharp flash chips"
+	tristate "Support for CFI command set 0001 (Intel/Sharp chips)"
 	depends on MTD_GEN_PROBE
 	help
 	  The Common Flash Interface defines a number of different command
 	  sets which a CFI-compliant chip may claim to implement. This code
-	  provides support for one of those command sets, used on Intel
-	  StrataFlash and other parts.
+	  provides support for command set 0001, used on Intel StrataFlash
+	  and other parts.
 
 config MTD_CFI_AMDSTD
-	tristate "Support for AMD/Fujitsu flash chips"
+	tristate "Support for CFI command set 0002 (AMD/Fujitsu chips)"
 	depends on MTD_GEN_PROBE
 	help
 	  The Common Flash Interface defines a number of different command
 	  sets which a CFI-compliant chip may claim to implement. This code
-	  provides support for one of those command sets, used on chips 
-	  including the AMD Am29LV320.
+	  provides support for command set 0002, used on chips including
+	  the AMD Am29LV320.
 
 config MTD_CFI_STAA
-	tristate "Support for ST (Advanced Architecture) flash chips"
+	tristate "Support for CFI command set 0020 (ST (Advanced Architecture) chips)"
 	depends on MTD_GEN_PROBE
 	help
 	  The Common Flash Interface defines a number of different command
 	  sets which a CFI-compliant chip may claim to implement. This code
-	  provides support for one of those command sets.
+	  provides support for command set 0020.
 
 config MTD_RAM
 	tristate "Support for RAM chips in bus mapping"
