Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRkN7-0007rP-22
 for linux-mtd@lists.infradead.org; Tue, 27 Nov 2018 20:54:18 +0000
Received: by mail-lj1-x243.google.com with SMTP id k19-v6so21338051lji.11
 for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2018 12:54:05 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2 v3] mtd: maps: Leave assigned complex mappings
Date: Tue, 27 Nov 2018 21:53:57 +0100
Message-Id: <20181127205358.32502-1-linus.walleij@linaro.org>
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

The simple_map_init() may need to be called with some
function pointers already assigned for complex mappings,
just bail out if complex handlers have already been
assigned.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Move check for pre-initialized simple map into
  physmap-core.c
ChangeLog v1->v2:
- Rebase on latest MTD development branch
- Use a new approach as the code changed under me
---
 drivers/mtd/maps/physmap-core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index e8c3b250d842..ecca7784de06 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -514,10 +514,16 @@ static int physmap_flash_probe(struct platform_device *dev)
 			err = physmap_addr_gpios_map_init(&info->maps[i]);
 			if (err)
 				goto err_out;
-		} else {
-			simple_map_init(&info->maps[i]);
 		}
 
+		/*
+		 * Only use the simple_map implementation if map hooks are not
+		 * implemented. Since map->read() is mandatory checking for its
+		 * presence is enough.
+		 */
+		if (!info->maps[i].read)
+			simple_map_init(&info->maps[i]);
+
 		if (info->probe_type) {
 			info->mtds[i] = do_map_probe(info->probe_type,
 						     &info->maps[i]);
-- 
2.19.1
