Received: from mail-bl2lp0205.outbound.protection.outlook.com
 ([207.46.163.205] helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFEhY-0008RL-Ue
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 03:49:17 +0000
From: Aaron Wu <Aaron.wu@analog.com>
To: <linux-mtd@lists.infradead.org>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>, <sonic.zhang@analog.com>, <aaron.wu@analog.com>
Subject: [PATCH] [mtd] gpio_flash: fix the bug in handling gpio flash
 read/write when offset + len from mtd exceeds the window size
Date: Thu, 7 Aug 2014 11:43:49 +0800
Message-ID: <1407383029-24290-1-git-send-email-Aaron.wu@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Aaron Wu <Aaron.wu@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Aaron Wu <Aaron.wu@analog.com>

fix the bug in handling gpio flash read/write when offset + len
from mtd exceeds the window size
---
 drivers/mtd/maps/gpio-addr-flash.c |   43 ++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index a4c477b..947631a 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -99,22 +99,29 @@ static map_word gf_read(struct map_info *map, unsigned long ofs)
  *	@from: flash offset to copy from
  *	@len:  how much to copy
  *
- * We rely on the MTD layer to chunk up copies such that a single request here
- * will not cross a window size.  This allows us to only wiggle the GPIOs once
- * before falling back to a normal memcpy.  Reading the higher layer code shows
- * that this is indeed the case, but add a BUG_ON() to future proof.
+ *Toggle the correct GPIO according to @from to enable the right flash bank,
+ *still the read offset plus len may execceds the actual Window size,when
+ *this happnes, reverts the value for multiple read until all data is read.
  */
 static void gf_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
 {
 	struct async_state *state = gf_map_info_to_state(map);
 
-	gf_set_gpios(state, from);
+	int this_len;
 
-	/* BUG if operation crosses the win_size */
-	BUG_ON(!((from + len) % state->win_size <= (from + len)));
+	while (len) {
+		if ((from % state->win_size) + len > state->win_size)
+			this_len = state->win_size - (from % state->win_size);
+		else
+			this_len = len;
 
-	/* operation does not cross the win_size, so one shot it */
-	memcpy_fromio(to, map->virt + (from % state->win_size), len);
+		gf_set_gpios(state, from);
+		memcpy_fromio(to, map->virt + (from % state->win_size),
+			 this_len);
+		len -= this_len;
+		from += this_len;
+		to += this_len;
+	}
 }
 
 /**
@@ -147,13 +154,21 @@ static void gf_copy_to(struct map_info *map, unsigned long to,
 {
 	struct async_state *state = gf_map_info_to_state(map);
 
-	gf_set_gpios(state, to);
+	int this_len;
+
+	while (len) {
+		if ((to % state->win_size) + len > state->win_size)
+			this_len = state->win_size - (to % state->win_size);
+		else
+			this_len = len;
 
-	/* BUG if operation crosses the win_size */
-	BUG_ON(!((to + len) % state->win_size <= (to + len)));
+		gf_set_gpios(state, to);
+		memcpy_toio(map->virt + (to % state->win_size), from, len);
 
-	/* operation does not cross the win_size, so one shot it */
-	memcpy_toio(map->virt + (to % state->win_size), from, len);
+		len -= this_len;
+		to += this_len;
+		from += this_len;
+	}
 }
 
 static const char * const part_probe_types[] = {
-- 
1.7.9.5
