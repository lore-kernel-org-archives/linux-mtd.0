Received: from mail-bn1blp0181.outbound.protection.outlook.com
 ([207.46.163.181] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2cD9-0007SO-9b
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 08:17:44 +0000
From: Aaron Wu <Aaron.wu@analog.com>
To: <linux-mtd@lists.infradead.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <sonic.zhang@analog.com>
Subject: [PATCH] gpio_flash: fix the CPLB miss bug for gpio expanded flash
Date: Thu, 3 Jul 2014 16:13:34 +0800
Message-ID: <1404375214-3736-1-git-send-email-Aaron.wu@analog.com>
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

In this bug, the address operation range may exceed the
window size defined by gpio expanded flash MTD partition.

Signed-off-by: Aaron Wu <Aaron.wu@analog.com>
---
 drivers/mtd/maps/gpio-addr-flash.c |   34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index a4c477b..ca9282f 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -108,13 +108,24 @@ static void gf_copy_from(struct map_info *map, void *to, unsigned long from, ssi
 {
 	struct async_state *state = gf_map_info_to_state(map);
 
-	gf_set_gpios(state, from);
+	int this_len;
 
 	/* BUG if operation crosses the win_size */
 	BUG_ON(!((from + len) % state->win_size <= (from + len)));
 
-	/* operation does not cross the win_size, so one shot it */
-	memcpy_fromio(to, map->virt + (from % state->win_size), len);
+	while (len) {
+		if ((from % state->win_size) + len > state->win_size)
+			this_len = state->win_size - (from % state->win_size);
+		else
+			this_len = len;
+
+		gf_set_gpios(state, from);
+		memcpy_fromio(to, map->virt + (from % state->win_size)
+			, this_len);
+		len -= this_len;
+		from += this_len;
+		to += this_len;
+	}
 }
 
 /**
@@ -147,13 +158,24 @@ static void gf_copy_to(struct map_info *map, unsigned long to,
 {
 	struct async_state *state = gf_map_info_to_state(map);
 
-	gf_set_gpios(state, to);
+	int this_len;
 
 	/* BUG if operation crosses the win_size */
 	BUG_ON(!((to + len) % state->win_size <= (to + len)));
 
-	/* operation does not cross the win_size, so one shot it */
-	memcpy_toio(map->virt + (to % state->win_size), from, len);
+	while (len) {
+		if ((to % state->win_size) + len > state->win_size)
+			this_len = state->win_size - (to % state->win_size);
+		else
+			this_len = len;
+
+		gf_set_gpios(state, to);
+		memcpy_toio(map->virt + (to % state->win_size), from, len);
+
+		len -= this_len;
+		to += this_len;
+		from += this_len;
+	}
 }
 
 static const char * const part_probe_types[] = {
-- 
1.7.9.5
