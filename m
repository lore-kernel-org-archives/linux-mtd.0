Received: from mail-fx0-f166.google.com ([209.85.220.166])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LuUQG-00015e-Fc
	for linux-mtd@lists.infradead.org; Thu, 16 Apr 2009 16:26:54 +0000
Received: by fxm10 with SMTP id 10so589013fxm.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Apr 2009 09:26:40 -0700 (PDT)
Subject: mtd: remove driver-core BUS_ID_SIZE
From: Kay Sievers <kay.sievers@vrfy.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Thu, 16 Apr 2009 18:26:36 +0200
Message-Id: <1239899196.17211.11.camel@poy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Greg Kroah-Hartman <gregkh@suse.de>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kay Sievers <kay.sievers@vrfy.org>
Subject: mtd: remove driver-core BUS_ID_SIZE

The name size limit is gone from the driver-core, the BUS_ID_SIZE
value will be removed.

Cc: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org
Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
---
 drivers/mtd/nand/txx9ndfmc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -64,7 +64,7 @@ struct txx9ndfmc_priv {
 	struct nand_chip chip;
 	struct mtd_info mtd;
 	int cs;
-	char mtdname[BUS_ID_SIZE + 2];
+	char mtdname[20 + 2];
 };
 
 #define MAX_TXX9NDFMC_DEV	4
