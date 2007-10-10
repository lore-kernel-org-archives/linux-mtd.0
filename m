Date: Wed, 10 Oct 2007 13:48:14 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: OneNAND: Fix typo related with recent commit
Message-ID: <20071010044814.GA4974@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD: OneNAND: Fix typo related with recent commit

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 85a9719..b2c40f6 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2065,7 +2065,7 @@ static int do_otp_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	ops.len = len;
 	ops.ooblen = 0;
-	ops.databuf = pbuf;
+	ops.datbuf = pbuf;
 	ops.oobbuf = NULL;
 	ret = onenand_write_ops_nolock(mtd, to, &ops);
 	*retlen = ops.retlen;
