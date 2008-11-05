Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KxjYJ-0004vO-5z
	for linux-mtd@lists.infradead.org; Wed, 05 Nov 2008 14:40:23 +0000
Date: Wed, 05 Nov 2008 23:40:18 +0900 (JST)
Message-Id: <20081105.234018.26100329.anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] physmap: Make map_info customizable
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a hook to physmap_flash_data for map_info initialization.
This makes platform code can customize map operations.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
Background: I wrote this patch to support RBTX4939 board, which
requires custom map->{read,write,copy_from} function.  I think
extending the physmap driver is better than adding a new map driver.

 drivers/mtd/maps/physmap.c  |    5 ++++-
 include/linux/mtd/physmap.h |    1 +
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index dfbf3f2..7ca048d 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -128,7 +128,10 @@ static int physmap_flash_probe(struct platform_device *dev)
 			goto err_out;
 		}
 
-		simple_map_init(&info->map[i]);
+		if (physmap_data->map_init)
+			(*physmap_data->map_init)(&info->map[i]);
+		else
+			simple_map_init(&info->map[i]);
 
 		probe_type = rom_probe_types;
 		for (; info->mtd[i] == NULL && *probe_type != NULL; probe_type++)
diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index c8e63a5..bf51a63 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -25,6 +25,7 @@ struct physmap_flash_data {
 	void			(*set_vpp)(struct map_info *, int);
 	unsigned int		nr_parts;
 	struct mtd_partition	*parts;
+	void			(*map_init)(struct map_info *map);
 };
 
 /*
-- 
1.5.6.3
