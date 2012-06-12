Received: from ftp.meprolight.com ([194.90.149.17] helo=meprolight.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SePF8-0007G4-4e
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 11:26:38 +0000
From: Alex Gershgorin <alexg@meprolight.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH] mtd: nand: mxc_nand fix compiler warning
Date: Tue, 12 Jun 2012 14:18:07 +0300
Message-ID: <1339499887-17859-1-git-send-email-alexg@meprolight.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
 Alex Gershgorin <alexg@meprolight.com>, u.kleine-koenig@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch removes the following warning:
drivers/mtd/nand/mxc_nand.c:1246: warning: initialization discards qualifiers from pointer target type
drivers/mtd/nand/mxc_nand.c:1249: warning: initialization discards qualifiers from pointer target type
drivers/mtd/nand/mxc_nand.c:1252: warning: initialization discards qualifiers from pointer target type
drivers/mtd/nand/mxc_nand.c:1255: warning: initialization discards qualifiers from pointer target type

Signed-off-by: Alex Gershgorin <alexg@meprolight.com>

Applies to v3.5-rc2+
---
 drivers/mtd/nand/mxc_nand.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index c58e6a9..74b6e75 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1243,16 +1243,16 @@ static const struct mxc_nand_devtype_data imx51_nand_devtype_data = {
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
1.7.0.4
