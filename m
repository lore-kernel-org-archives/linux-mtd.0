Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QawUK-0007az-48
	for linux-mtd@lists.infradead.org; Sun, 26 Jun 2011 21:03:29 +0000
Received: by bwf12 with SMTP id 12so1305900bwf.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 14:03:13 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: make ofpart buildable as a separate module
Date: Mon, 27 Jun 2011 01:02:59 +0400
Message-Id: <1309122180-12838-2-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1309122180-12838-1-git-send-email-dbaryshkov@gmail.com>
References: <1309122180-12838-1-git-send-email-dbaryshkov@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, dedekind1@gmail.com,
	linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>,
	linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As ofpart now uses a standard mtd partitions parser interface, make it
buildable as a separate module. Also provide MODULE_DESCRIPTION and
MODULE_AUTHOR for this module.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/Kconfig  |    3 ++-
 drivers/mtd/Makefile |    2 +-
 drivers/mtd/ofpart.c |    2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 4be8373..cc02e21 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -137,7 +137,8 @@ config MTD_AFS_PARTS
 	  'physmap' map driver (CONFIG_MTD_PHYSMAP) does this, for example.
 
 config MTD_OF_PARTS
-	def_bool y
+	tristate "OpenFirmware partitioning information support"
+	default Y
 	depends on OF
 	help
 	  This provides a partition parsing function which derives
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 39664c4..9aaac3a 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -5,8 +5,8 @@
 # Core functionality.
 obj-$(CONFIG_MTD)		+= mtd.o
 mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o
-mtd-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
 
+obj-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
 obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
 obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
 obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 41c4518..aa33b8a 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -174,3 +174,5 @@ out:
 module_init(ofpart_parser_init);
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Parser for MTD partitioning information in device tree");
+MODULE_AUTHOR("Vitaly Wool, David Gibson");
-- 
1.7.5.4
