Return-Path: <SRS0=vbdM=HB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004E6C433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Jan 2021 20:09:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B526864E11
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Jan 2021 20:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B526864E11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qudyz8g8KuOZdgYYrsKMEd+DSf8PqpfTm0RMT02fxJI=; b=PWkRPXtsKdimIU6z4TVu+cMunz
	GtT0P05J0WwcCgpYuQPNJRbbBvVF1F0XJ7j4RP4rFXy7jsb4E2FztFdgEkRbcSIHRPpwljMBO9cWF
	S7MOkOHwRjECpxQC1VNJCjRi1OPxUKF5XCAw9+wmG7OocYbNYd63/h4Ba5lo2ulH7I8n1w4HRUI/q
	biLOegrQTyWJkE8QK+jYpcMNWlc6d/6Qe+gajk/PyXhERpXI++Bctii4y6gwp7lGE4FYoYc0fWwOC
	m4Eh0DbRRFBex3c82NjrGAw1s7/A2qqfZKnL3SV4hSkAzgYOqbpHoiBzsNj6vhuhhBZujCBRiZftW
	0B59gEKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5wX8-0005R1-0i; Sat, 30 Jan 2021 20:07:50 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5wX3-0005QP-NU
 for linux-mtd@lists.infradead.org; Sat, 30 Jan 2021 20:07:47 +0000
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com)
 ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 30 Jan 2021 12:07:39 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA;
 30 Jan 2021 12:07:37 -0800
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg01-blr.qualcomm.com with ESMTP; 31 Jan 2021 01:37:19 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id 1C76821C96; Sun, 31 Jan 2021 01:37:19 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 boris.brezillon@collabora.com, manivannan.sadhasivam@linaro.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: qcom: Update register macro name for 0x2c offset
Date: Sun, 31 Jan 2021 01:37:16 +0530
Message-Id: <1612037236-7954-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_150745_903342_B1653314 
X-CRM114-Status: GOOD (  10.97  )
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
Cc: mdalam@codeaurora.org, sricharan@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This change will remove unused register name macro NAND_DEV1_ECC_CFG.
Since this register was only available in QPIC version 1.4.20 ipq40xx
and it was not used. In QPIC version 1.5 on wards this register got
removed.In QPIC version 2.0 0x2c offset is updated with register
NAND_AUTO_STATUS_EN So adding this register macro NAND_AUTO_STATUS_EN
with offset 0x2c.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 9484be8..c238a35 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -27,7 +27,7 @@
 #define	NAND_DEV0_CFG0			0x20
 #define	NAND_DEV0_CFG1			0x24
 #define	NAND_DEV0_ECC_CFG		0x28
-#define	NAND_DEV1_ECC_CFG		0x2c
+#define	NAND_AUTO_STATUS_EN		0x2c
 #define	NAND_DEV1_CFG0			0x30
 #define	NAND_DEV1_CFG1			0x34
 #define	NAND_READ_ID			0x40
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
