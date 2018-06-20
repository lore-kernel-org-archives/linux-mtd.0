Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVXXM-0001F7-27
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 07:28:22 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Archit Taneja <architt@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 04/15] mtd: rawnand: qcom: remove dt property
 nand-ecc-step-size
Date: Wed, 20 Jun 2018 12:57:31 +0530
Message-Id: <1529479662-4026-5-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1529479662-4026-1-git-send-email-absahu@codeaurora.org>
References: <1529479662-4026-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

QCOM NAND controller supports only one step size (512) so
nand-ecc-step-size DT property is redundant. This property
can be removed and ecc step size can be assigned with 512 value.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
* Changes from v3:

 1. Minor change in comment
    (s/512 bytes of data in each step/512 bytes data steps)

* Changes from v2:

 NEW CHANGE

  1. Removed the custom logic and used the helper fuction.
 drivers/mtd/nand/raw/qcom_nandc.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 6a5519f..bf80a61 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2325,15 +2325,8 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
 	bool wide_bus;
 	int ecc_mode = 1;
 
-	/*
-	 * the controller requires each step consists of 512 bytes of data.
-	 * bail out if DT has populated a wrong step size.
-	 */
-	if (ecc->size != NANDC_STEP_SIZE) {
-		dev_err(nandc->dev, "invalid ecc size\n");
-		return -EINVAL;
-	}
-
+	/* controller only supports 512 bytes data steps */
+	ecc->size = NANDC_STEP_SIZE;
 	wide_bus = chip->options & NAND_BUSWIDTH_16 ? true : false;
 
 	if (ecc->strength >= 8) {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation
