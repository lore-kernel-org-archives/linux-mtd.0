Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MIftk-00020f-FW
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 09:33:15 +0000
Received: by ewy7 with SMTP id 7so7974519ewy.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Jun 2009 02:33:07 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Mon, 22 Jun 2009 11:27:06 +0200
Subject: [PATCH] MTD: enable partition parser in the default list when selected
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200906221127.06461.florian@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes the physmap driver use the partition parsers that
we enable in the kernel configuration as the list of partition parsers
to use when probing the flash chip.

Signed-off-by: Florian Fainelli <florian@openwrt.org>
---
diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 29a9011..2095b60 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -80,7 +80,16 @@ static const char *rom_probe_types[] = {
 					"map_rom",
 					NULL };
 #ifdef CONFIG_MTD_PARTITIONS
-static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
+static const char *part_probe_types[] = {
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	"cmdlinepart",
+#elif defined CONFIG_MTD_REDBOOT_PARTS
+	"RedBoot",
+#elif defined CONFIG_MTD_AR7_PARTS
+	"ar7part",
+#endif
+	NULL
+};
 #endif
 
 static int physmap_flash_probe(struct platform_device *dev)
