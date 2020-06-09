Return-Path: <SRS0=GuhJ=7W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCDAC433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 11:11:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77329207F9
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 11:11:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q7yyQAG/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77329207F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6QpoSSiWnXLfrNtAZoNbzFZPK1zoEIQV0S/iQf4TTY=; b=Q7yyQAG/oy1rE/
	WAiyL6XYtrQP/ewxdL3rV7YuVmQNnTEEwpX6UJcCczaDCA05ayklQZMJJawEA1fjjBmJ5OnjW7DQa
	eMyx5gWOdCVgUBtLqnjF/hUGbFwpFcQWUUgs8c6skEHIlipxwK2k2uUVy38vKeez7VXFkG5TPw7bd
	xKWaA18RnUNSCx6u+pqWLi8WSvtIC8NYCU51IU0pe6KJtuvZrqCxQOwNYeOUvQ7lnRSmSt2ZfyhQL
	EeqLP6ixPTbVI95VTTkT2HhqTx0S90qwt/otT6etLSLtFRSysBg+yJ1HAlz5Ir/C0UqmwLlBeQYEu
	gqIIH6pmykJkroAMq6hQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jicA2-0002uq-KR; Tue, 09 Jun 2020 11:11:18 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jic9x-0002oc-Kz
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2020 11:11:14 +0000
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Jun 2020 04:11:04 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
 by ironmsg04-sd.qualcomm.com with ESMTP; 09 Jun 2020 04:11:02 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
 id BE69721801; Tue,  9 Jun 2020 16:41:00 +0530 (IST)
From: Sivaprakash Murugesan <sivaprak@codeaurora.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 peter.ujfalusi@ti.com, sivaprak@codeaurora.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/2] mtd: rawnand: qcom: remove write to unavailable
 register
Date: Tue,  9 Jun 2020 16:40:55 +0530
Message-Id: <1591701056-3944-2-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591701056-3944-1-git-send-email-sivaprak@codeaurora.org>
References: <1591701056-3944-1-git-send-email-sivaprak@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_041113_727443_BF36510F 
X-CRM114-Status: UNSURE (   8.21  )
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

SFLASHC_BURST_CFG register is not available on all ipq nand platforms,
it is available only on ipq8064 devices and the nand controller works
without configuring these registers in this platform, so register write
to this can be removed.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 5b11c70..e0afa2c 100644
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
@@ -2774,7 +2773,6 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	u32 nand_ctrl;
 
 	/* kill onenand */
-	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
 	nandc_write(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD_VLD),
 		    NAND_DEV_CMD_VLD_VAL);
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
