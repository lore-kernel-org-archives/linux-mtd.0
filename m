Received: from mu-out-0910.google.com ([209.85.134.185])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LRDqD-000540-4Z
	for linux-mtd@lists.infradead.org; Sun, 25 Jan 2009 22:52:35 +0000
Received: by mu-out-0910.google.com with SMTP id w1so3764761mue.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 25 Jan 2009 14:52:30 -0800 (PST)
Subject: mtd: struct device - replace bus_id with dev_name(), dev_set_name()
From: Kay Sievers <kay.sievers@vrfy.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Sun, 25 Jan 2009 23:51:40 +0100
Message-Id: <1232923900.2924.15.camel@nga>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: gregkh <gregkh@suse.de>, linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kay Sievers <kay.sievers@vrfy.org>
Subject: mtd: struct device - replace bus_id with dev_name(), dev_set_name()

Cc: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org
Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
---
 drivers/mtd/nand/ndfc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -187,7 +187,7 @@ static int ndfc_chip_init(struct ndfc_co
 		return -ENODEV;
 
 	ndfc->mtd.name = kasprintf(GFP_KERNEL, "%s.%s",
-				   ndfc->ofdev->dev.bus_id, flash_np->name);
+			dev_name(&ndfc->ofdev->dev), flash_np->name);
 	if (!ndfc->mtd.name) {
 		ret = -ENOMEM;
 		goto err;
