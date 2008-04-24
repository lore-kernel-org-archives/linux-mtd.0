Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jp1dl-00020Y-4K
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 13:37:34 +0000
Date: Thu, 24 Apr 2008 22:38:30 +0900 (JST)
Message-Id: <20080424.223830.27953792.anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] physmap: do not probe absent modules
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For example, if MTD_CFI was not enabled, probing it does nothing other
than just produces an error message.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
 drivers/mtd/maps/physmap.c |   24 ++++++++++++++++++++++--
 1 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index bc4649a..7f8f3bd 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -85,9 +85,29 @@ static int physmap_flash_remove(struct platform_device *dev)
 	return 0;
 }
 
-static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", NULL };
+static const char *rom_probe_types[] = {
+#if defined(CONFIG_MTD_CFI) || defined(CONFIG_MTD_CFI_MODULE)
+	"cfi_probe",
+#endif
+#if defined(CONFIG_MTD_JEDECPROBE) || defined(CONFIG_MTD_JEDECPROBE_MODULE)
+	"jedec_probe",
+#endif
+#if defined(CONFIG_MTD_ROM) || defined(CONFIG_MTD_ROM_MODULE)
+	"map_rom",
+#endif
+	NULL
+};
 #ifdef CONFIG_MTD_PARTITIONS
-static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
+static const char *part_probe_types[] = {
+#if defined(CONFIG_MTD_CMDLINE_PARTS)
+	"cmdlinepart",
+#endif
+#if defined(CONFIG_MTD_REDBOOT_PARTS) || \
+	defined(CONFIG_MTD_REDBOOT_PARTS_MODULE)
+	"RedBoot",
+#endif
+	NULL
+};
 #endif
 
 static int physmap_flash_probe(struct platform_device *dev)
