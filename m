Received: from ns.penguin.cz ([212.47.7.226])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Ir0Pj-00063g-Aq
	for linux-mtd@lists.infradead.org; Sat, 10 Nov 2007 19:11:05 -0500
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id E9F8F306D575
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Nov 2007 01:10:56 +0100 (CET)
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (penguin [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28719-03 for <linux-mtd@lists.infradead.org>;
	Sun, 11 Nov 2007 01:10:56 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id A5255306D568
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Nov 2007 01:10:56 +0100 (CET)
Subject: [PATCH] fix CONFIG_MTD_SHARP_SL if CONFIG_MTD=m
From: Stanislav Brabec <utx@penguin.cz>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Sun, 11 Nov 2007 01:10:54 +0100
Message-Id: <1194739854.4486.45.camel@utx.utx.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sharp Zaurus SL-C3200 with CONFIG_MTD=m and CONFIG_MTD_SHARP_SL=y (as it
is bool) lost support for the ROM flash. With CONFIG_MTD=y it has no
problems.

It is caused by losing of compiled code of
drivers/mtd/maps/sharpsl-flash.o.
It was linked to drivers/mtd/maps/built-in.o and drivers/mtd/built-in.o,
but lost and not linked to drivers/built-in.o (because CONFIG_MTD!=y).

Patch below fixes this problem by creating sharpsl-flash.ko (and the
code works correctly as a module).

Signed-off-by: Stanislav Brabec <utx@penguin.cz>

Index: linux-2.6.23/drivers/mtd/maps/Kconfig
===================================================================
--- linux-2.6.23/drivers/mtd/maps/Kconfig
+++ linux-2.6.23/drivers/mtd/maps/Kconfig
@@ -600,7 +600,7 @@
 	default "4"
 
 config MTD_SHARP_SL
-	bool "ROM mapped on Sharp SL Series"
+	tristate "ROM mapped on Sharp SL Series"
 	depends on ARCH_PXA
 	help
 	  This enables access to the flash chip on the Sharp SL Series of PDAs.


Command to ensure, that CONFIG_MTD_SHARP_SL is the only problematic part
of MTD.
for i in $(find -name Makefile | xargs grep CONFIG_MTD_ | sed 's/.*obj-\$(\([^)]*\).*/\1/') ; do grep -A1 -w "config ${i#CONFIG_}" $(find -name Kconfig) ; done | grep -B1 bool


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx
