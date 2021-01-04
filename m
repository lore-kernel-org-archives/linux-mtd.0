Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB175C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 18:32:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AF1721D94
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 18:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AF1721D94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rorv/hh5O24PjJdirdd2II+fB1aY8/HjilU0DUaf1P8=; b=Z/bl4D3PW0Tnib6hwDSYA0vpsy
	8Vg63kxxs0KSH/klaVgXFHel4k2cRV4gFzl2XpRL11gi/xcBBP3cN9auuckrXze9LZdZuNRY2BWI2
	GWooWdZioZmxkAEsrrUfeX2siNLk1DmOoj3m+MmG/dMDba9HTzw2Nd+G4sL3Fodoir27R5XHxn980
	V/mOwB5/r/I0uHPkj6xsPHNrJMHZWlBomnGwE4J3GPM7eQj2cOzIBu2xsDuutgDmTMEn+tgaTBN02
	6T8gQ1tJ0u78pVCr2w1/XKU/zz3qNv3WGX7Qj4I1gveFCiYZgF00vvncxbTZNzEMajV8KptSLHR/T
	15C7w1CA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwUdw-0006RA-V9; Mon, 04 Jan 2021 18:31:49 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwUdt-0006Oi-IP
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 18:31:47 +0000
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 04 Jan 2021 10:31:41 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 04 Jan 2021 10:31:40 -0800
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 05 Jan 2021 00:01:23 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id 2200421860; Tue,  5 Jan 2021 00:01:23 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, manivannan.sadhasivam@linaro.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, vigneshr@ti.com
Subject: [PATCH V2] mtd: rawnand: qcom: update last code word register
Date: Tue,  5 Jan 2021 00:01:18 +0530
Message-Id: <1609785078-22310-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_133145_766802_6D644D27 
X-CRM114-Status: UNSURE (   9.95  )
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
Cc: mdalam@codeaurora.org, sricharan@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From QPIC version 2.0 onwards new register got added to
read last codeword. This change will update the same.

For first three code word READ_LOCATION_n register will be
use.For last code wrod READ_LOCATION_LAST_CW_n register will be
use.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
[V2]
 * Fixed alignment for NAND_READ_LOCATION_LAST_CW_n reg macro
 * Changed number of register write to 1 when NAND_READ_LOCATION_LAST_CW_n register will use
 drivers/mtd/nand/raw/qcom_nandc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index eaef51d..9e89236 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -48,10 +48,10 @@
 #define	NAND_READ_LOCATION_1		0xf24
 #define	NAND_READ_LOCATION_2		0xf28
 #define	NAND_READ_LOCATION_3		0xf2c
-#define NAND_READ_LOCATION_LAST_CW_0    0xf40
-#define NAND_READ_LOCATION_LAST_CW_1    0xf44
-#define NAND_READ_LOCATION_LAST_CW_2    0xf48
-#define NAND_READ_LOCATION_LAST_CW_3    0xf4c
+#define	NAND_READ_LOCATION_LAST_CW_0	0xf40
+#define	NAND_READ_LOCATION_LAST_CW_1	0xf44
+#define	NAND_READ_LOCATION_LAST_CW_2	0xf48
+#define	NAND_READ_LOCATION_LAST_CW_3	0xf4c
 
 /* dummy register offsets, used by write_reg_dma */
 #define	NAND_DEV_CMD1_RESTORE		0xdead
@@ -1125,7 +1125,7 @@ config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc)
 	if (nandc->props->is_bam) {
 		if (nandc->props->qpic_v2)
 			write_reg_dma(nandc, NAND_READ_LOCATION_LAST_CW_0,
-				      4, NAND_BAM_NEXT_SGL);
+				      1, NAND_BAM_NEXT_SGL);
 		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
 			      NAND_BAM_NEXT_SGL);
 	}
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
