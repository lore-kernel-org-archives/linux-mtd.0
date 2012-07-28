From: Dirk Behme <dirk.behme@googlemail.com>
To: shijie8@gmail.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org
Subject: [PATCH] mtd: mxc_nand: Fix compiler warnings
Date: Sat, 28 Jul 2012 11:05:10 +0200
Message-Id: <1343466310-14584-1-git-send-email-dirk.behme@gmail.com>
Cc: Dirk Behme <dirk.behme@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Dirk Behme <dirk.behme@googlemail.com>

Fix the compiler warnings

drivers/mtd/nand/mxc_nand.c:1267: warning: initialization discards qualifiers from pointer target type
drivers/mtd/nand/mxc_nand.c:1270: warning: initialization discards qualifiers from pointer target type
drivers/mtd/nand/mxc_nand.c:1273: warning: initialization discards qualifiers from pointer target type
drivers/mtd/nand/mxc_nand.c:1276: warning: initialization discards qualifiers from pointer target type

Signed-off-by: Dirk Behme <dirk.behme@googlemail.com>
---
 drivers/mtd/nand/mxc_nand.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 6acc790..31b125a 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1264,16 +1264,16 @@ static const struct mxc_nand_devtype_data imx51_nand_devtype_data = {
 static const struct of_device_id mxcnd_dt_ids[] = {
 	{
 		.compatible = "fsl,imx21-nand",
-		.data = &imx21_nand_devtype_data,
+		.data = (void *)&imx21_nand_devtype_data,
 	}, {
 		.compatible = "fsl,imx27-nand",
-		.data = &imx27_nand_devtype_data,
+		.data = (void *)&imx27_nand_devtype_data,
 	}, {
 		.compatible = "fsl,imx25-nand",
-		.data = &imx25_nand_devtype_data,
+		.data = (void *)&imx25_nand_devtype_data,
 	}, {
 		.compatible = "fsl,imx51-nand",
-		.data = &imx51_nand_devtype_data,
+		.data = (void *)&imx51_nand_devtype_data,
 	},
 	{ /* sentinel */ }
 };
-- 
1.7.7.4
