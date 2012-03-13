Received: from eu1sys200aog105.obsmtp.com ([207.126.144.119])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7RHw-0000dd-5X
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 12:57:18 +0000
From: Linus Walleij <linus.walleij@stericsson.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: fsmc_nand: restore platform data partition support
Date: Tue, 13 Mar 2012 13:56:45 +0100
Message-ID: <1331643405-759-1-git-send-email-linus.walleij@stericsson.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Armando Visconti <armando.visconti@st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Vipin Kumar <vipin.kumar@st.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, stable@kernel.org,
 Vincenzo Frascino <vincenzo.frascino@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Linus Walleij <linus.walleij@linaro.org>

Commit 0d04eda1430e9a796214bee644b7e05d99cfe613
"mtd: fsmc_nand.c: use mtd_device_parse_register"
accidentally broke the platform data partition supply
capability in the FSMC driver, this make it work again.
Tested on the U300 that use this scheme.

Cc: stable@kernel.org
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/nand/fsmc_nand.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index e53b760..fd9f94f 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -713,7 +713,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	 * Check for partition info passed
 	 */
 	host->mtd.name = "nand";
-	ret = mtd_device_parse_register(&host->mtd, NULL, 0,
+	if (pdata->partitions)
+		ret = mtd_device_parse_register(&host->mtd, NULL, 0,
+						pdata->partitions,
+						pdata->nr_partitions);
+	else
+		ret = mtd_device_parse_register(&host->mtd, NULL, 0,
 			host->mtd.size <= 0x04000000 ?
 				partition_info_16KB_blk :
 				partition_info_128KB_blk,
-- 
1.7.8
