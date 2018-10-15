Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBybq-0005Dx-T8
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2018 08:52:20 +0000
Received: by mail-ed1-x541.google.com with SMTP id y19-v6so17064664edd.2
 for <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2018 01:52:07 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH] mtd: maps: code style: Invert logic on if/else branch
Date: Mon, 15 Oct 2018 10:52:02 +0200
Message-Id: <20181015085202.23921-1-ricardo.ribalda@gmail.com>
In-Reply-To: <20181014092638.75cda7ad@bbrezillon>
References: <20181014092638.75cda7ad@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is preferred to have the positive statement on an if/else. While we
are at it we replace the way we access rom_probe_types.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/mtd/maps/physmap-core.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 85ef1142c134..cd443c1dd947 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -435,7 +435,6 @@ static int physmap_flash_pdata_init(struct platform_device *dev)
 static int physmap_flash_probe(struct platform_device *dev)
 {
 	struct physmap_flash_info *info;
-	const char * const *probe_type;
 	int err = 0;
 	int i;
 
@@ -516,14 +515,19 @@ static int physmap_flash_probe(struct platform_device *dev)
 			simple_map_init(&info->maps[i]);
 		}
 
-		probe_type = rom_probe_types;
-		if (!info->probe_type) {
-			for (; !info->mtds[i] && *probe_type; probe_type++)
-				info->mtds[i] = do_map_probe(*probe_type,
-							     &info->maps[i]);
-		} else {
+		if (info->probe_type) {
 			info->mtds[i] = do_map_probe(info->probe_type,
 						     &info->maps[i]);
+		} else {
+			int j;
+
+			for (j = 0; ARRAY_SIZE(rom_probe_types); j++) {
+				info->mtds[i] = do_map_probe(
+							rom_probe_types[j],
+							&info->maps[i]);
+				if (info->mtds[i])
+					break;
+			}
 		}
 
 		if (!info->mtds[i]) {
-- 
2.19.1
