Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5LJp-0001uH-2B
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 00:05:32 +0000
Received: by mail-pg0-x243.google.com with SMTP id v1so18196147pgv.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 17:05:09 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Simon Baatz <gmbnomis@gmail.com>
Subject: [PATCH] mtd: nand: orion: don't complain for probe deferral
Date: Mon,  1 May 2017 17:04:54 -0700
Message-Id: <20170502000455.13240-5-computersforpeace@gmail.com>
In-Reply-To: <20170502000455.13240-1-computersforpeace@gmail.com>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Recent patches to this driver changed the error handling for missing
clocks. Now we'll print an error if the clock causes us to defer
probing. Let's not do that.

Cc: Simon Baatz <gmbnomis@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Compile tested only

 drivers/mtd/nand/orion_nand.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index f8e463a97b9e..e2bfb37f11df 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -161,7 +161,8 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		if (ret == -ENOENT) {
 			info->clk = NULL;
 		} else {
-			dev_err(&pdev->dev, "failed to get clock!\n");
+			if (ret != -EPROBE_DEFER)
+				dev_err(&pdev->dev, "failed to get clock!\n");
 			return ret;
 		}
 	}
-- 
2.13.0.rc1.294.g07d810a77f-goog
