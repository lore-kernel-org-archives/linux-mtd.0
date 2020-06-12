Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E561FC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 07:58:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 965CC207D8
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 07:58:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rm6sBW9l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 965CC207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2UU1eniN4jEeWajjTOFZ82UHSDcndPeUvvLFYOTRc0A=; b=rm6sBW9lNemQf4
	+IF9E9ugds9E0O8FrRIXV/LqLMwMam7BB6k0EMPyer+mIQhBrNaIogIbalc9Gxh5a3EpzEFZNbMY/
	j/5eHn/E5DD98J1JAX/ABOyIG5V1XdygGNZMiWhhzPoFFTU7GVnKkHQi3cuv3eIW+Is1Pdqt7fxXr
	PyGfU8JLd0qRZ93yR/q1SX5sLeYyVslwhWrMmMQE6EZfIMxNNrvGGldm8ICiSgvllhewBV9E86+3m
	bEZdiaibCzwEV7WAwzUkFN43NkQUdFGRCJUdw30YMCx+H2q4LqmKdTkAx+uOfI9qqemC2R9BKhVp6
	xVHX7mgomHUgHssQTYkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjeaF-0001CK-AV; Fri, 12 Jun 2020 07:58:39 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjeaC-00019A-Os
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2020 07:58:38 +0000
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Jun 2020 00:58:25 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 12 Jun 2020 00:58:23 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
 id CE32321880; Fri, 12 Jun 2020 13:28:21 +0530 (IST)
From: Sivaprakash Murugesan <sivaprak@codeaurora.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 peter.ujfalusi@ti.com, sivaprak@codeaurora.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V4 2/2] mtd: rawnand: qcom: set BAM mode only if not set
 already
Date: Fri, 12 Jun 2020 13:28:16 +0530
Message-Id: <1591948696-16015-3-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591948696-16015-1-git-send-email-sivaprak@codeaurora.org>
References: <1591948696-16015-1-git-send-email-sivaprak@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_005836_859750_6D6E4190 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

BAM is DMA controller on QCOM ipq platforms, BAM mode on NAND driver
is set by writing BAM_MODE_EN bit on NAND_CTRL register.

NAND_CTRL is an operational register and in BAM mode operational
registers are read only.

So, before enabling BAM mode by writing the NAND_CTRL register, check
if BAM mode was already enabled by the bootloader, and enable BAM mode
only if it is not enabled already.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 78b5f21..a3ef428 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2784,7 +2784,14 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	/* enable ADM or BAM DMA */
 	if (nandc->props->is_bam) {
 		nand_ctrl = nandc_read(nandc, NAND_CTRL);
-		nandc_write(nandc, NAND_CTRL, nand_ctrl | BAM_MODE_EN);
+		/* NAND_CTRL is an operational registers, and CPU
+		 * access to operational registers are read only
+		 * in BAM mode. So update the NAND_CTRL register
+		 * only if it is not in BAM mode. In most cases BAM
+		 * mode will be enabled in bootloader
+		 */
+		if (!(nand_ctrl | BAM_MODE_EN))
+			nandc_write(nandc, NAND_CTRL, nand_ctrl | BAM_MODE_EN);
 	} else {
 		nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
 	}
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
