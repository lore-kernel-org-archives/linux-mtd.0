Return-Path: <SRS0=yUT7=7V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE02C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2020 10:47:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2B59206C3
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2020 10:47:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EN3stoDN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2B59206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=iis6GkI5vSMZSfRihKMLniYtZcFx4BK/J7NlZmRAwtw=; b=EN3
	stoDNMu64v7A3IzEnK4ho/jPBA1ZCabZNE4/gIIATgfcpBz56YXVZ/0KkAB4JsL4BewhVzWURIrAh
	tW6laBniN2jdXcl6PKPvxnn+IGjLR6AwV+5vhB9Q4cmfEPUAoEYZnVoH7EQ7aytgwBiSFIe3STKhr
	3L1Enu4iNfqcstWo1Or8Yugpok6KEGTM91FzCF+Be+T1gcuF8F6CNiXd/Yi9yy7oxuhjcIllvByo4
	YCbZMvdb4oFfWubP1SZj7IzvNznvfe6PTHkfuUzrhqWOvoejd7uvp5Xqqhpp91tJw3oyeSCziM6Go
	2UfJuffVkGMwfbcIbe8HC4FdgHwa1qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiFJi-00020e-G1; Mon, 08 Jun 2020 10:47:46 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiFJe-000202-UF
 for linux-mtd@lists.infradead.org; Mon, 08 Jun 2020 10:47:44 +0000
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Jun 2020 03:47:40 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 08 Jun 2020 03:47:38 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
 id C4AA3217EC; Mon,  8 Jun 2020 16:17:35 +0530 (IST)
From: Sivaprakash Murugesan <sivaprak@codeaurora.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 peter.ujfalusi@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: raw: qcom_nand: Fix register write error
Date: Mon,  8 Jun 2020 16:17:34 +0530
Message-Id: <1591613254-1065-1-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_034742_999740_16BA0E97 
X-CRM114-Status: GOOD (  10.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sivaprakash Murugesan <sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1. SFLASHC_BURST_CFG register is not available on all ipq nand platforms,
   it is available only on ipq8064 devices and the nand controller works
   without configuring these registers in this platform, so register
   write to this can be removed.

2. Once BAM mode is enabled register writes to NAND_CTRL should be
   performed through BAM command descriptors. The NAND BAM mode will
   be enabled by bootloaders. Check if BAM mode is already enabled and
   enable it only if not enabled already.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 5b11c70..7bfd93a 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -36,7 +36,6 @@
 #define	NAND_DEV_CMD1			0xa4
 #define	NAND_DEV_CMD2			0xa8
 #define	NAND_DEV_CMD_VLD		0xac
-#define	SFLASHC_BURST_CFG		0xe0
 #define	NAND_ERASED_CW_DETECT_CFG	0xe8
 #define	NAND_ERASED_CW_DETECT_STATUS	0xec
 #define	NAND_EBI2_ECC_BUF_CFG		0xf0
@@ -2774,14 +2773,20 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	u32 nand_ctrl;
 
 	/* kill onenand */
-	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
 	nandc_write(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD_VLD),
 		    NAND_DEV_CMD_VLD_VAL);
 
 	/* enable ADM or BAM DMA */
 	if (nandc->props->is_bam) {
 		nand_ctrl = nandc_read(nandc, NAND_CTRL);
-		nandc_write(nandc, NAND_CTRL, nand_ctrl | BAM_MODE_EN);
+		/* Once BAM_MODE_EN bit is set, writes to the NAND_CTRL
+		 * should be done through BAM command descriptors.
+		 * in most cases bootloader enables the bam mode we
+		 * need to set the BAM mode only if it is not set by
+		 * bootloader
+		 */
+		if (!(nand_ctrl & BAM_MODE_EN))
+			nandc_write(nandc, NAND_CTRL, nand_ctrl | BAM_MODE_EN);
 	} else {
 		nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
 	}
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
