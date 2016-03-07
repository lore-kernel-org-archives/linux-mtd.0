Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ad4wy-0000Al-C4
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2016 23:52:32 +0000
Received: by mail-pa0-x232.google.com with SMTP id fy10so86905475pac.1
 for <linux-mtd@lists.infradead.org>; Mon, 07 Mar 2016 15:52:11 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: physmap_of: fix set but unused warning
Date: Mon,  7 Mar 2016 15:52:05 -0800
Message-Id: <1457394725-64477-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

drivers/mtd/maps/physmap_of.c: In function ‘of_flash_probe’:
drivers/mtd/maps/physmap_of.c:165:16: warning: variable ‘p’ set but not used [-Wunused-but-set-variable]

This could be a problem if the 'reg' property is not set, since that
means 'count' will be uninitialized.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Compile tested only

 drivers/mtd/maps/physmap_of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 70c453144f00..eb569f61f5e7 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -185,7 +185,7 @@ static int of_flash_probe(struct platform_device *dev)
 	 * consists internally of 2 non-identical NOR chips on one die.
 	 */
 	p = of_get_property(dp, "reg", &count);
-	if (count % reg_tuple_size != 0) {
+	if (!p || count % reg_tuple_size != 0) {
 		dev_err(&dev->dev, "Malformed reg property on %s\n",
 				dev->dev.of_node->full_name);
 		err = -EINVAL;
-- 
2.7.0.rc3.207.g0ac5344
