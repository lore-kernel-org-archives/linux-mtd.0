Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NWXQi-0001xP-3i
	for linux-mtd@lists.infradead.org; Sun, 17 Jan 2010 15:52:48 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: maps: Blackfin async: rename local funcs to avoid common
	clashes
Date: Sun, 17 Jan 2010 10:52:46 -0500
Message-Id: <1263743566-26986-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are new Blackfin MMR helper functions that use the same name as some
of the local functions in this driver, so have the driver use more specific
names to avoid the issue.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/maps/bfin-async-flash.c |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/maps/bfin-async-flash.c b/drivers/mtd/maps/bfin-async-flash.c
index a7c808b..2cb7421 100644
--- a/drivers/mtd/maps/bfin-async-flash.c
+++ b/drivers/mtd/maps/bfin-async-flash.c
@@ -69,7 +69,7 @@ static void switch_back(struct async_state *state)
 	local_irq_restore(state->irq_flags);
 }
 
-static map_word bfin_read(struct map_info *map, unsigned long ofs)
+static map_word bfin_flash_read(struct map_info *map, unsigned long ofs)
 {
 	struct async_state *state = (struct async_state *)map->map_priv_1;
 	uint16_t word;
@@ -85,7 +85,7 @@ static map_word bfin_read(struct map_info *map, unsigned long ofs)
 	return test;
 }
 
-static void bfin_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
+static void bfin_flash_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
 {
 	struct async_state *state = (struct async_state *)map->map_priv_1;
 
@@ -96,7 +96,7 @@ static void bfin_copy_from(struct map_info *map, void *to, unsigned long from, s
 	switch_back(state);
 }
 
-static void bfin_write(struct map_info *map, map_word d1, unsigned long ofs)
+static void bfin_flash_write(struct map_info *map, map_word d1, unsigned long ofs)
 {
 	struct async_state *state = (struct async_state *)map->map_priv_1;
 	uint16_t d;
@@ -111,7 +111,7 @@ static void bfin_write(struct map_info *map, map_word d1, unsigned long ofs)
 	switch_back(state);
 }
 
-static void bfin_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
+static void bfin_flash_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
 {
 	struct async_state *state = (struct async_state *)map->map_priv_1;
 
@@ -140,10 +140,12 @@ static int __devinit bfin_flash_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	state->map.name       = DRIVER_NAME;
-	state->map.read       = bfin_read;
-	state->map.copy_from  = bfin_copy_from;
-	state->map.write      = bfin_write;
-	state->map.copy_to    = bfin_copy_to;
+#ifdef CONFIG_MTD_COMPLEX_MAPPINGS
+	state->map.read       = bfin_flash_read;
+	state->map.copy_from  = bfin_flash_copy_from;
+	state->map.write      = bfin_flash_write;
+	state->map.copy_to    = bfin_flash_copy_to;
+#endif
 	state->map.bankwidth  = pdata->width;
 	state->map.size       = memory->end - memory->start + 1;
 	state->map.virt       = (void __iomem *)memory->start;
-- 
1.6.6
