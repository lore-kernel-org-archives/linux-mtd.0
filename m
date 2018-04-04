Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3hkZ-0001ob-Fd
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 12:42:53 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Archit Taneja <architt@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 1/9] mtd: nand: qcom: use the ecc strength from device
 parameter
Date: Wed,  4 Apr 2018 18:12:17 +0530
Message-Id: <1522845745-6624-2-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently the driver uses the ECC strength specified in
device tree. The ONFI or JEDEC device parameter page
contains the ‘ECC correctability’ field which indicates the
number of bits that the host should be able to correct per
512 bytes of data. The ecc correctability is assigned in
chip parameter during device probe time. QPIC/EBI2 NAND
supports 4/8-bit ecc correction. The Same kind of board
can have different NAND parts so use the ecc strength
from device parameter (if its non zero) instead of
device tree.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 563b759..8dd40de 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -2334,6 +2334,14 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
 		return -EINVAL;
 	}
 
+	/*
+	 * Read the required ecc strength from NAND device and overwrite
+	 * the device tree ecc strength for devices which require
+	 * ecc correctability bits >= 8
+	 */
+	if (chip->ecc_strength_ds >= 8)
+		ecc->strength = 8;
+
 	wide_bus = chip->options & NAND_BUSWIDTH_16 ? true : false;
 
 	if (ecc->strength >= 8) {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
