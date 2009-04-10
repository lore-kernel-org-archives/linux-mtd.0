Received: from ti-out-0910.google.com ([209.85.142.184])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LsG5Z-0006Gr-UY
	for linux-mtd@lists.infradead.org; Fri, 10 Apr 2009 12:44:27 +0000
Received: by ti-out-0910.google.com with SMTP id a20so1950570tia.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Apr 2009 05:44:04 -0700 (PDT)
Date: Fri, 10 Apr 2009 20:42:43 +0800
From: Zhenwen Xu <helight.xu@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH]fix a warning on drivers/mtd/nand/cafe_nand.c
Message-ID: <20090410124243.GA9852@helight>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: kyungmin.park@samsung.com, linux-mtd@lists.infradead.org
Reply-To: Zhenwen Xu <helight.xu@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fix this warning:

drivers/mtd/nand/cafe_nand.c: In function ‘cafe_nand_probe’:
drivers/mtd/nand/cafe_nand.c:730: warning: passing argument 2 of ‘request_irq’ from incompatible pointer type


>From 8f877dd15fedd434e2f5d95a1bc5f4e528dc4528 Mon Sep 17 00:00:00 2001
From: Zhenwen Xu <Helight.Xu@gmail.com>
Date: Fri, 10 Apr 2009 20:35:30 +0800
Subject: [PATCH] fix a warning on drivers/mtd/nand/cafe_nand.c

Signed-off-by: Zhenwen Xu <helight.xu@gmail.com>
---
 drivers/mtd/nand/cafe_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 7c5b257..29acd06 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -332,7 +332,7 @@ static void cafe_select_chip(struct mtd_info *mtd, int chipnr)
 		cafe->ctl1 &= ~CTRL1_CHIPSELECT;
 }
 
-static int cafe_nand_interrupt(int irq, void *id)
+static irqreturn_t cafe_nand_interrupt(int irq, void *id)
 {
 	struct mtd_info *mtd = id;
 	struct cafe_priv *cafe = mtd->priv;
-- 
1.5.6.5

-- 
---------------------------------
Zhenwen Xu - Open and Free
Home Page:	http://zhwen.org
My Studio:	http://dim4.cn
