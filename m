Received: from ey-out-1920.google.com ([74.125.78.144])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MR1Sa-0007Ty-3Z
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 10:11:42 +0000
Received: by ey-out-1920.google.com with SMTP id 5so828808eyb.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Jul 2009 03:11:34 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Wed, 15 Jul 2009 12:11:30 +0200
Subject: [PATCH] physmap: probe for partitions parsers that we enable
MIME-Version: 1.0
To: dwmw2@infradead.org
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907151211.31062.florian@openwrt.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes the physmap driver probe for partitions
parsers that we configured in the kernel configuration
instead of a hard-coded partition parser list (cmdlinepart,
RedBoot).

Signed-off-by: Florian Fainelli <florian@openwrt.org>
---
diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 29a9011..e314f0d 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -80,7 +80,17 @@ static const char *rom_probe_types[] = {
 					"map_rom",
 					NULL };
 #ifdef CONFIG_MTD_PARTITIONS
-static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
+static const char *part_probe_types[] = {
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	"cmdlinepart",
+#endif
+#ifdef CONFIG_MTD_REDBOOT_PARTS
+	"RedBoot",
+#endif
+#ifdef CONFIG_MTD_AR7_PARTS
+	"ar7part",
+#endif
+	NULL };
 #endif
 
 static int physmap_flash_probe(struct platform_device *dev)
