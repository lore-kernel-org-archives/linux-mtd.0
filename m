Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3kG2-0008LJ-J4
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 08:56:19 +0000
Received: by pbbrq8 with SMTP id rq8so8744651pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2012 01:56:17 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: s3c2410: Fix compiler warnings
Date: Tue, 21 Aug 2012 14:24:10 +0530
Message-Id: <1345539250-4509-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1345539250-4509-1-git-send-email-sachin.kamat@linaro.org>
References: <1345539250-4509-1-git-send-email-sachin.kamat@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: sachin.kamat@linaro.org, patches@linaro.org, dwmw2@infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes the following warnings:
‘s3c2410_nand_correct_data’ defined but not used [-Wunused-function]
‘s3c2410_nand_enable_hwecc’ defined but not used [-Wunused-function]
‘s3c2412_nand_enable_hwecc’ defined but not used [-Wunused-function]
‘s3c2440_nand_enable_hwecc’ defined but not used [-Wunused-function]
‘s3c2410_nand_calculate_ecc’ defined but not used [-Wunused-function]
‘s3c2412_nand_calculate_ecc’ defined but not used [-Wunused-function]
‘s3c2440_nand_calculate_ecc’ defined but not used [-Wunused-function]

The above functions are called only when CONFIG_MTD_NAND_S3C2410_HWECC
is defined. Thus making them conditional.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/s3c2410.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index b8a556e..18e8046 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -442,6 +442,7 @@ static int s3c2412_nand_devready(struct mtd_info *mtd)
 
 /* ECC handling functions */
 
+#ifdef CONFIG_MTD_NAND_S3C2410_HWECC
 static int s3c2410_nand_correct_data(struct mtd_info *mtd, u_char *dat,
 				     u_char *read_ecc, u_char *calc_ecc)
 {
@@ -596,6 +597,7 @@ static int s3c2440_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
 
 	return 0;
 }
+#endif
 
 /* over-ride the standard functions for a little more speed. We can
  * use read/write block to move the data buffers to/from the controller
-- 
1.7.4.1
