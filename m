Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaI-00076i-2b
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:35 +0000
Received: by wggy19 with SMTP id y19so42754961wgg.10
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:12 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 35/60] mtd: nand: gpmi-nand: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:19 +0100
Message-Id: <1425418844-25177-36-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a bug where devices aren't shown in sysfs.

While at it, make use of the default owner set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 33f3c3c..f287690 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1897,7 +1897,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	/* init the MTD data structures */
 	mtd->priv		= chip;
 	mtd->name		= "gpmi-nand";
-	mtd->owner		= THIS_MODULE;
+	mtd->dev.parent		= this->dev;
 
 	/* init the nand_chip{}, we don't support a 16-bit NAND Flash bus. */
 	chip->priv		= this;
-- 
2.2.2
