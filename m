Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGtuI-0004ZL-1C
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 15:52:25 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/10] UBI: Wire-up fastmap
Date: Wed, 26 Sep 2012 17:51:50 +0200
Message-Id: <1348674710-102885-11-git-send-email-richard@nod.at>
In-Reply-To: <1348674710-102885-1-git-send-email-richard@nod.at>
References: <1348674710-102885-1-git-send-email-richard@nod.at>
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, tim.bird@am.sony.com,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make fastmap known to Kconfig, UBI Makefile and MAINTAINERS.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 MAINTAINERS              |    6 ++++++
 drivers/mtd/ubi/Kconfig  |   20 ++++++++++++++++++++
 drivers/mtd/ubi/Makefile |    1 +
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fdc0119..7bcade0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7075,6 +7075,12 @@ F:	drivers/mtd/ubi/
 F:	include/linux/mtd/ubi.h
 F:	include/mtd/ubi-user.h
 
+UNSORTED BLOCK IMAGES (UBI) Fastmap
+M:	Richard Weinberger <richard@nod.at>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	drivers/mtd/ubi/fastmap.c
+
 USB ACM DRIVER
 M:	Oliver Neukum <oliver@neukum.org>
 L:	linux-usb@vger.kernel.org
diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 271a842..3620f91 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -56,6 +56,26 @@ config MTD_UBI_BEB_LIMIT
 
 	  Leave the default value if unsure.
 
+config MTD_UBI_FASTMAP
+	bool "UBI Fastmap (EXPERIMENTAL)"
+	depends on EXPERIMENTAL
+	default n
+	help
+	   Fastmap is a mechanism which allows attaching an UBI device
+	   in nearly constant time.
+	   Instead of scanning the whole MTD device it only has to locate
+	   a checkpoint (called fastmap) on the device.
+	   The on-flash fastmap contains all information needed to attach
+	   the device. Using fastmap makes only sense on large devices where
+	   attaching by scanning takes long. UBI will not automatically install
+	   a fastmap on old images, but you can set the UBI module parameter
+	   fm_autoconvert to 1 if you want so. Please note that fastmap-enabled
+	   images are still usable with UBI implementations without
+	   fastmap support. On typical flash devices the whole fastmap fits
+	   into one PEB. UBI will reserve PEBs to hold two fastmaps.
+
+	   If in doubt, say "N".
+
 config MTD_UBI_GLUEBI
 	tristate "MTD devices emulation driver (gluebi)"
 	help
diff --git a/drivers/mtd/ubi/Makefile b/drivers/mtd/ubi/Makefile
index a0803ac..7ab19ac 100644
--- a/drivers/mtd/ubi/Makefile
+++ b/drivers/mtd/ubi/Makefile
@@ -4,3 +4,4 @@ ubi-y += vtbl.o vmt.o upd.o build.o cdev.o kapi.o eba.o io.o wl.o attach.o
 ubi-y += misc.o debug.o
 
 obj-$(CONFIG_MTD_UBI_GLUEBI) += gluebi.o
+obj-$(CONFIG_MTD_UBI_FASTMAP) += fastmap.o
-- 
1.7.6.5
