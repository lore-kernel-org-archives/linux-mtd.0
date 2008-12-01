Message-Id: <200812012223.mB1MNbjl014522@imap1.linux-foundation.org>
Subject: [patch 1/6] physmap: make map_info customizable
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Mon, 01 Dec 2008 14:23:37 -0800
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	anemo@mba.ocn.ne.jp
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>

Add a hook to physmap_flash_data for map_info initialization.  This makes
platform code can customize map operations.

Background: I wrote this patch to support RBTX4939 board, which requires
custom map->{read,write,copy_from} function.  I think extending the
physmap driver is better than adding a new map driver.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/maps/physmap.c  |    5 ++++-
 include/linux/mtd/physmap.h |    1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff -puN drivers/mtd/maps/physmap.c~physmap-make-map_info-customizable drivers/mtd/maps/physmap.c
--- a/drivers/mtd/maps/physmap.c~physmap-make-map_info-customizable
+++ a/drivers/mtd/maps/physmap.c
@@ -128,7 +128,10 @@ static int physmap_flash_probe(struct pl
 			goto err_out;
 		}
 
-		simple_map_init(&info->map[i]);
+		if (physmap_data->map_init)
+			(*physmap_data->map_init)(&info->map[i]);
+		else
+			simple_map_init(&info->map[i]);
 
 		probe_type = rom_probe_types;
 		for (; info->mtd[i] == NULL && *probe_type != NULL; probe_type++)
diff -puN include/linux/mtd/physmap.h~physmap-make-map_info-customizable include/linux/mtd/physmap.h
--- a/include/linux/mtd/physmap.h~physmap-make-map_info-customizable
+++ a/include/linux/mtd/physmap.h
@@ -25,6 +25,7 @@ struct physmap_flash_data {
 	void			(*set_vpp)(struct map_info *, int);
 	unsigned int		nr_parts;
 	struct mtd_partition	*parts;
+	void			(*map_init)(struct map_info *map);
 };
 
 /*
_
