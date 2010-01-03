Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NRWtR-0003bO-3e
	for linux-mtd@lists.infradead.org; Sun, 03 Jan 2010 20:17:45 +0000
Received: by ewy21 with SMTP id 21so6803861ewy.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 03 Jan 2010 12:17:39 -0800 (PST)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Sun, 3 Jan 2010 21:17:37 +0100
Subject: [PATCH 4/4] MTD: include ar7part in the list of partitions parsers
MIME-Version: 1.0
To: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201001032117.37459.florian@openwrt.org>
Cc: ralf@linux-mips.org
Reply-To: Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch modifies the physmap-flash driver to include
the ar7part partition parser in the list of parsers to
use when a physmap-flash driver is registered. This is
required for AR7 to create partitions correctly.

Signed-off-by: Florian Fainelli <florian@openwrt.org>
---
diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index d9603f7..0e65ee7 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -79,7 +79,7 @@ static const char *rom_probe_types[] = {
 					"map_rom",
 					NULL };
 #ifdef CONFIG_MTD_PARTITIONS
-static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
+static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", "ar7part", NULL };
 #endif
 
 static int physmap_flash_probe(struct platform_device *dev)
