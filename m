Return-Path: <SRS0=UneP=HY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE21AC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 07:36:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 406D06146D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 07:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 406D06146D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4yezdS/vUvQUx9ClVp9ozr+CrRcHoCHTczdB7OrhyiA=; b=dnyas79yHQp3RSulm+qgaQEP6b
	w9/PBS8h+hxBDgD4zJzrxrHUJAFhiLF4Q6DJ8YuEUvurdLdbw9SU74QNQmGf476skzZLZ3GGlXpP9
	+Q2nMKZMNLHE2+fVZVYP4GtayyLrRL8BaqQ9Ee6g3aqBIXmhWVlZqRucyC/t+ObEs2l5gvuKIRLuO
	IIng82tnu+cXf3ApgKlu3Y8LxDJvihSlI2TNfXWnqA0+ypcOnA1KmxR31zXP1NegCf2RB7e9sZKM/
	QxB6HNCkloW/3cC1nPJdf9q+tmYyNs1BKMJjLoqtEZTUL+2nD8MfzfXz5QIiVHfoGF1801a4itMIa
	5qycc4Vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE5lG-0008Bg-Lp; Mon, 22 Feb 2021 07:36:06 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE5lF-0008BK-0Y
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2021 07:36:06 +0000
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 21 Feb 2021 23:36:03 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Feb 2021 23:36:01 -0800
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg01-blr.qualcomm.com with ESMTP; 22 Feb 2021 13:05:46 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id 8E8BC21DA8; Mon, 22 Feb 2021 13:05:44 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: qcom: Rename parameter name in macro
Date: Mon, 22 Feb 2021 13:05:42 +0530
Message-Id: <1613979342-23572-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_023605_192086_3871D9E0 
X-CRM114-Status: UNSURE (   7.80  )
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
Cc: Md Sadre Alam <mdalam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This change will rename parameter name in macro
nandc_set_read_loc().renamed parameter names are
cw_offset, read_size, is_last_read_loc.
Sinc in QPIC V2 on-wards there is separate location
register to read last code word, so to just differnciate
b/w is_last_read_loc from last_cw this change needed.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4189a7f..bfefb4e 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -181,11 +181,11 @@
 #define	ECC_BCH_4BIT	BIT(2)
 #define	ECC_BCH_8BIT	BIT(3)
 
-#define nandc_set_read_loc(nandc, reg, offset, size, is_last)	\
+#define nandc_set_read_loc(nandc, reg, cw_offset, read_size, is_last_read_loc)	\
 nandc_set_reg(nandc, NAND_READ_LOCATION_##reg,			\
-	      ((offset) << READ_LOCATION_OFFSET) |		\
-	      ((size) << READ_LOCATION_SIZE) |			\
-	      ((is_last) << READ_LOCATION_LAST))
+	      ((cw_offset) << READ_LOCATION_OFFSET) |		\
+	      ((read_size) << READ_LOCATION_SIZE) |			\
+	      ((is_last_read_loc) << READ_LOCATION_LAST))
 
 /*
  * Returns the actual register address for all NAND_DEV_ registers
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
