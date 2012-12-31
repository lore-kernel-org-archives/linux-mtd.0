Received: from moutng.kundenserver.de ([212.227.126.186])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TpbEC-0004mR-G9
 for linux-mtd@lists.infradead.org; Mon, 31 Dec 2012 09:00:13 +0000
Date: Mon, 31 Dec 2012 09:57:30 +0100 (CET)
From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: fix uninitialised mtd map name
Message-ID: <Pine.LNX.4.64.1212310952190.23808@axis700.grange>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A recent commit "mtd: physmap_of: allow to specify the mtd name for retro
compatiblity" introduced a regression: if no linux,mtd-name DT property is
provided, the local mtd_name variable remains uninitialised and usually
it's != NULL, which leads to a random garbage in MTD map name. Fix this by
initialising the variable to NULL.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
---

Please, push to 3.8, unless already fixed.

 drivers/mtd/maps/physmap_of.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 37cdc20..6fb2bd8 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -170,7 +170,7 @@ static int of_flash_probe(struct platform_device *dev)
 	resource_size_t res_size;
 	struct mtd_part_parser_data ppdata;
 	bool map_indirect;
-	const char *mtd_name;
+	const char *mtd_name = NULL;
 
 	match = of_match_device(of_flash_match, &dev->dev);
 	if (!match)
-- 
1.7.2.5
