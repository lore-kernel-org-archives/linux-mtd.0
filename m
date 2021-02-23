Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD85FC433E9
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 19:40:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7432964E61
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 19:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7432964E61
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoWw3L4N+D25aJzbuyqqK1wwYcc7Jb5JIhEnWrWAd8I=; b=j0GffKIB4YlfmyGBHfLBlXfR5K
	PUUyaDKkR5X/GNXIrX7ZDftVuW1nuK0t7kg8jfZUo0dxVtZjmOgmoMeR/Tbk+VQGCOQRWZcveNO3m
	aigcmtf12lxDDZB+QcqhOwG+FqndqWJZjKc3BJH3pkSBttyyTE/yTLdOkQw5X//5x9ga7taof65EH
	p6Aab80MshHMWt2PGmleJK/ivMUG/sDcxT9CoXSir0ddl0Qaky5NcmPDzAFV5fAN8mPb7RffB4D9b
	m+6oGLp79Q1xuDDLJOJvwOADpaGCfge8cen9E4RMHxbp1m8aHYX0KPsL7BwpEKLrglZtr0v7+vemh
	T4bGhpbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEdWu-0005uC-7L; Tue, 23 Feb 2021 19:39:32 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEdWq-0005sZ-0o
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 19:39:29 +0000
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 23 Feb 2021 11:39:27 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 23 Feb 2021 11:39:26 -0800
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 24 Feb 2021 01:09:10 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id 651A420E1F; Wed, 24 Feb 2021 01:09:10 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] mtd: rawnand: qcom: Add helper to configure location
 register
Date: Wed, 24 Feb 2021 01:09:00 +0530
Message-Id: <1614109141-7531-4-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614109141-7531-1-git-send-email-mdalam@codeaurora.org>
References: <1614109141-7531-1-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_143928_231533_59E08E8E 
X-CRM114-Status: GOOD (  12.63  )
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

Create a nandc_set_read_loc() helper to abstract the
configuration of the location register.

QPIC v2 onwards features a separate location register
for the last codeword, so introducing this extra helper
which will simplify the addition of QPIC v2 support.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index f1aafee..57d2ad02 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -181,8 +181,8 @@
 #define	ECC_BCH_4BIT	BIT(2)
 #define	ECC_BCH_8BIT	BIT(3)
 
-#define nandc_set_read_loc(chip, reg, cw_offset, read_size, is_last_read_loc)	\
-nandc_set_reg(chip, NAND_READ_LOCATION_##reg,			\
+#define nandc_set_read_loc_first(chip, reg, cw_offset, read_size, is_last_read_loc)	\
+nandc_set_reg(chip, reg,			\
 	      ((cw_offset) << READ_LOCATION_OFFSET) |		\
 	      ((read_size) << READ_LOCATION_SIZE) |			\
 	      ((is_last_read_loc) << READ_LOCATION_LAST))
@@ -668,6 +668,18 @@ static bool qcom_nandc_is_last_cw(struct nand_ecc_ctrl *ecc, int cw)
 	return cw == (ecc->steps - 1);
 }
 
+/* helper to configure location register values */
+static void nandc_set_read_loc(struct nand_chip *chip, int cw, int reg,
+			       int cw_offset, int read_size, int is_last_read_loc)
+{
+	int reg_base = NAND_READ_LOCATION_0;
+
+	reg_base += reg * 4;
+
+	return nandc_set_read_loc_first(chip, reg_base, cw_offset,
+			read_size, is_last_read_loc);
+}
+
 /* helper to configure address register values */
 static void set_address(struct qcom_nand_host *host, u16 column, int page)
 {
@@ -725,7 +737,7 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 	nandc_set_reg(chip, NAND_EXEC_CMD, 1);
 
 	if (read)
-		nandc_set_read_loc(chip, 0, 0, host->use_ecc ?
+		nandc_set_read_loc(chip, 0, 0, 0, host->use_ecc ?
 				   host->cw_data : host->cw_size, 1);
 }
 
@@ -1218,7 +1230,7 @@ static int nandc_param(struct qcom_nand_host *host)
 		nandc_set_reg(chip, NAND_DEV_CMD_VLD_RESTORE, nandc->vld);
 	}
 
-	nandc_set_read_loc(chip, 0, 0, 512, 1);
+	nandc_set_read_loc(chip, 0, 0, 0, 512, 1);
 
 	if (!nandc->props->qpic_v2) {
 		write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
@@ -1646,16 +1658,16 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	if (nandc->props->is_bam) {
-		nandc_set_read_loc(chip, 0, read_loc, data_size1, 0);
+		nandc_set_read_loc(chip, cw, 0, read_loc, data_size1, 0);
 		read_loc += data_size1;
 
-		nandc_set_read_loc(chip, 1, read_loc, oob_size1, 0);
+		nandc_set_read_loc(chip, cw, 1, read_loc, oob_size1, 0);
 		read_loc += oob_size1;
 
-		nandc_set_read_loc(chip, 2, read_loc, data_size2, 0);
+		nandc_set_read_loc(chip, cw, 2, read_loc, data_size2, 0);
 		read_loc += data_size2;
 
-		nandc_set_read_loc(chip, 3, read_loc, oob_size2, 1);
+		nandc_set_read_loc(chip, cw, 3, read_loc, oob_size2, 1);
 	}
 
 	config_nand_cw_read(chip, false);
@@ -1886,13 +1898,13 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 
 		if (nandc->props->is_bam) {
 			if (data_buf && oob_buf) {
-				nandc_set_read_loc(chip, 0, 0, data_size, 0);
-				nandc_set_read_loc(chip, 1, data_size,
+				nandc_set_read_loc(chip, i, 0, 0, data_size, 0);
+				nandc_set_read_loc(chip, i, 1, data_size,
 						   oob_size, 1);
 			} else if (data_buf) {
-				nandc_set_read_loc(chip, 0, 0, data_size, 1);
+				nandc_set_read_loc(chip, i, 0, 0, data_size, 1);
 			} else {
-				nandc_set_read_loc(chip, 0, data_size,
+				nandc_set_read_loc(chip, i, 0, data_size,
 						   oob_size, 1);
 			}
 		}
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
