Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PccTy-0001tq-Sm
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2011 11:33:47 +0000
Received: by fxm19 with SMTP id 19so19231221fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Jan 2011 03:33:44 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/5] MTD: make MTD_CONCAT support mandatory
Date: Tue, 11 Jan 2011 14:33:35 +0300
Message-Id: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move mtdconcat to be an integral part of the mtd core. It's a tiny bit
of code, which bears 'say Y if you don't know what to do' note in the
Kconfig. OTOH there are several ugly ifdefs depending on the MTD_CONCAT.
So, making MTD_CONCAT support mandatory will allow us to clean up code a
lot.

Kconfig entry is changed to be a bool defaulting to Y, so all code
pieces depending on it, will have MTD_CONCAT Kconfig symbol and
CONFIG_MTD_CONCAT define. This will be removed in one of next patches.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Stefan Roese <sr@denx.de>
---
 drivers/mtd/Kconfig  |    3 ++-
 drivers/mtd/Makefile |    3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 1e2cbf5..38ca5f2 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -34,7 +34,8 @@ config MTD_TESTS
 	  various checks and verifications when loaded.
 
 config MTD_CONCAT
-	tristate "MTD concatenating support"
+	bool
+	default y
 	help
 	  Support for concatenating several MTD devices into a single
 	  (virtual) one. This allows you to have -for example- a JFFS(2)
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 760abc5..a166b71 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -4,10 +4,9 @@
 
 # Core functionality.
 obj-$(CONFIG_MTD)		+= mtd.o
-mtd-y				:= mtdcore.o mtdsuper.o
+mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o
 mtd-$(CONFIG_MTD_PARTITIONS)	+= mtdpart.o
 
-obj-$(CONFIG_MTD_CONCAT)	+= mtdconcat.o
 obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
 obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
 obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
-- 
1.7.2.3
