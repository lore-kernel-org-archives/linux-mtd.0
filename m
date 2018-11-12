Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMJQx-00053s-CR
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2018 21:07:48 +0000
Received: by mail-lf1-x142.google.com with SMTP id p86so7223954lfg.5
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2018 13:07:36 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2 v2] mtd: maps: Leave assigned complex mappings
Date: Mon, 12 Nov 2018 22:07:28 +0100
Message-Id: <20181112210729.23580-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Rebase on latest MTD development branch
- Use a new approach as the code changed under me
---
 drivers/mtd/maps/map_funcs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/maps/map_funcs.c b/drivers/mtd/maps/map_funcs.c
index 3f268370eeca..60e132293e1c 100644
--- a/drivers/mtd/maps/map_funcs.c
+++ b/drivers/mtd/maps/map_funcs.c
@@ -31,6 +31,10 @@ static void __xipram simple_map_copy_to(struct map_info *map, unsigned long to,
 
 void simple_map_init(struct map_info *map)
 {
+	/* Complex map functions already assigned */
+	if (map->read)
+		return;
+
 	BUG_ON(!map_bankwidth_supported(map->bankwidth));
 
 	map->read = simple_map_read;
-- 
2.19.1
