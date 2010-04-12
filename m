Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1F8C-0005HU-G1
	for linux-mtd@lists.infradead.org; Mon, 12 Apr 2010 08:36:33 +0000
Received: by pvc30 with SMTP id 30so2685200pvc.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Apr 2010 01:36:28 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 12 Apr 2010 14:06:28 +0530
Message-ID: <n2u6b5362aa1004120136sced49f64x55bd57f11245d130@mail.gmail.com>
Subject: PATCH 6/7] ubi: logging feature for ubi
From: Brijesh Singh <brijesh.s.singh@gmail.com>
To: Artem.Bityutskiy@nokia.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, rohitvdongre@gmail.com,
	David Woodhouse <dwmw2@infradead.org>, rohit.dongre@samsung.com,
	brijesh.s.singh@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Note: kconfig for logging feature

Signed-off-by: Rohit Dongre <rohit.dongre@samsung.com>
---
--- ubi_old/drivers/mtd/ubi/Kconfig	2010-04-09 21:54:13.955581334 +0530
+++ ubi_new/drivers/mtd/ubi/Kconfig	2010-04-09 21:54:02.635580892 +0530
@@ -57,6 +57,26 @@
 	   volume. This is handy to make MTD-oriented software (like JFFS2)
 	   work on top of UBI. Do not enable this unless you use legacy
 	   software.
+menu "UBI with Log (UBIL)"
+config MTD_UBI_LOGGED
+	bool "UBI with logging (UBIL)"
+	default n
+	depends on MTD_UBI
+	help
+	   This option enables logging in UBI. This is in development stage.
+	   UBI log is maintained on device to reduce attach time of UBI.
+	   It includeds super block, commit, eba log sub-modules.
+
+config MTD_UBIL_COMPR
+	bool "UBIL Meta-data compression in Log"
+	default n
+	depends on MTD_UBI_LOGGED
+	select CRYPTO
+	select CRYPTO_LZO
+	help
+	   This option enables compression of meta-data in UBIL.
+
+endmenu

 source "drivers/mtd/ubi/Kconfig.debug"
 endmenu
--- ubi_old/drivers/mtd/ubi/Kconfig.debug	2010-04-09 21:54:13.955581334 +0530
+++ ubi_new/drivers/mtd/ubi/Kconfig.debug	2010-04-09 21:54:02.635580892 +0530
@@ -91,4 +91,31 @@
 	help
 	  This option enables debugging messages from the UBI input/output unit.

+config MTD_UBI_DEBUG_MSG_SB
+	bool "UBI with log sb messages"
+	default n
+	depends on MTD_UBI_DEBUG
+	depends on MTD_UBI_LOGGED
+	help
+	  This option enables debugging messages from sn modules of the UBI
+	  with log.
+
+config MTD_UBI_DEBUG_MSG_CMT
+	bool "UBI with log commit messages"
+	default n
+	depends on MTD_UBI_DEBUG
+	depends on MTD_UBI_LOGGED
+	help
+	  This option enables debugging messages from commit modules of the UBI
+	  with log.
+
+config MTD_UBI_DEBUG_MSG_EL
+	bool "UBI with log el messages"
+	default n
+	depends on MTD_UBI_DEBUG
+	depends on MTD_UBI_LOGGED
+	help
+	  This option enables debugging messages from el modules of the UBI
+	  with log.
+
 endmenu # UBI debugging messages
--- ubi_old/drivers/mtd/ubi/Makefile	2010-04-09 21:54:13.955581334 +0530
+++ ubi_new/drivers/mtd/ubi/Makefile	2010-04-09 21:54:02.645580870 +0530
@@ -1,7 +1,7 @@
 obj-$(CONFIG_MTD_UBI) += ubi.o

 ubi-y += vtbl.o vmt.o upd.o build.o cdev.o kapi.o eba.o io.o wl.o scan.o
-ubi-y += misc.o
+ubi-y += misc.o sb.o el.o commit.o

 ubi-$(CONFIG_MTD_UBI_DEBUG) += debug.o
 obj-$(CONFIG_MTD_UBI_GLUEBI) += gluebi.o
