Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXaAE-0006s9-Fi
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 15:09:08 +0000
Received: by bkcje16 with SMTP id je16so4360364bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2011 07:09:05 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/7] MTD: MAPS: physmap: allow partition parsers for
 physmap_flash_data
Date: Mon,  5 Dec 2011 16:08:09 +0100
Message-Id: <1323097691-16414-6-git-send-email-jonas.gorski@gmail.com>
In-Reply-To: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
References: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>,
 Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Arch setup code might want to use their own partition parsers, but still
use the generic physmap flash driver.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/maps/physmap.c  |    5 ++++-
 include/linux/mtd/physmap.h |    1 +
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 66e8200..1f749d58 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -85,6 +85,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 	struct physmap_flash_data *physmap_data;
 	struct physmap_flash_info *info;
 	const char **probe_type;
+	const char **part_types;
 	int err = 0;
 	int i;
 	int devices_found = 0;
@@ -171,7 +172,9 @@ static int physmap_flash_probe(struct platform_device *dev)
 	if (err)
 		goto err_out;
 
-	mtd_device_parse_register(info->cmtd, part_probe_types, 0,
+	part_types = physmap_data->part_probe_types ? : part_probe_types;
+
+	mtd_device_parse_register(info->cmtd, part_types, 0,
 				  physmap_data->parts, physmap_data->nr_parts);
 	return 0;
 
diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index 04e0181..d2887e7 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -30,6 +30,7 @@ struct physmap_flash_data {
 	unsigned int		pfow_base;
 	char                    *probe_type;
 	struct mtd_partition	*parts;
+	const char		**part_probe_types;
 };
 
 #endif /* __LINUX_MTD_PHYSMAP__ */
-- 
1.7.2.5
