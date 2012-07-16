Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sqibr-0000wS-Pg
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 10:33:00 +0000
Received: by pbbrq13 with SMTP id rq13so11152299pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 03:32:58 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/6] mtd: s3c2410: Use pr_* instead of printk
Date: Mon, 16 Jul 2012 16:02:23 +0530
Message-Id: <1342434747-27622-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
References: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, dwmw2@infradead.org, David.Woodhouse@intel.com,
 ben-linux@fluff.org, patches@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use pr_* instead of printk.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/s3c2410.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 8f9267f..2383940 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -21,6 +21,8 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
+#define pr_fmt(fmt) "nand-s3c2410: " fmt
+
 #ifdef CONFIG_MTD_NAND_S3C2410_DEBUG
 #define DEBUG
 #endif
@@ -215,7 +217,8 @@ static int s3c_nand_calc_rate(int wanted, unsigned long clk, int max)
 	pr_debug("result %d from %ld, %d\n", result, clk, wanted);
 
 	if (result > max) {
-		printk("%d ns is too big for current clock rate %ld\n", wanted, clk);
+		pr_err("%d ns is too big for current clock rate %ld\n",
+								wanted, clk);
 		return -1;
 	}
 
-- 
1.7.4.1
