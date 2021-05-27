Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF2CC47089
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 08:51:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5291661222
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 08:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5291661222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PegOjdP3IBokeuPxvy3yS+KfX1yscd5a/Os8BZ65spY=; b=anRtQ8UrsZ3tWs
	PzwBH1XYaRMKNXyuP6B6Q8oMIKhxrXtZxla+/54+acT3OGanqoN177TKiJa0Tl5HBkvEKTFTQHjkq
	zkHVDGkb83fmtiPYJhXmSxb0AMhMZJjssmVGrRQ/GcctDN730wlsz9qs5hjV1Qb9iCtXBRin6WIcJ
	9utuhqnlP5fh2OZhop24J4pYkyicp+IctksiWGLQL4rKa4cebgGAg04nBz62jGJsKTvp1M9C6WKce
	nXc+SZnhv9hxU6Qd09X08Oi7CgdCA/nqOdoH3jpHP0a/lvXOoKjI8dMQLf4iI0AcHSEI2wFegoiXR
	Yn5Mf44fAxeQJLs1H3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmBjD-0041fu-0p; Thu, 27 May 2021 08:50:55 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmBiT-0041Cu-6A; Thu, 27 May 2021 08:50:11 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14R8mESg000871; Thu, 27 May 2021 10:50:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=eDyQ3JK/tNpdJeDvgtw0zoHW5bVANv2eEW/8n7UMnwA=;
 b=GFw8vx3qiIEqpCzYmE9V1lyV+Qr/2DnF9eEfCKiXY8/NcpzzYnCqM8xvKejlyul1BpeM
 tDuqhQhUCaR9ODjaAwlVMb7Q14ZOFH9dn3AhSxJfYzbazi1wUdR3tK+IfkbYqad7G3Wq
 O5FECvE82angwwdFZi+dLaNu/IAmoQ/RB3Gaf6jWC1mi9SIod6vcLXNOGm7+OLq/GO2F
 wj7yw36Z5RBRqLykStPG8xLQXHnD6bksF4gvUoFuPxg+Jx6Rnc6bgUJKtYmtGVK6LnO4
 4BCTL8hjPURBVTayKF1fklVvh1ET9N/NfBI0S4osQG1Hj6AoKrugZPyfGxgxIgwD9oX0 vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38t0fr2d43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 May 2021 10:50:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D61EE100034;
 Thu, 27 May 2021 10:50:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C03A821BF67;
 Thu, 27 May 2021 10:50:02 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May 2021 10:50:02
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patrice.chotard@foss.st.com>, <christophe.kerello@foss.st.com>
Subject: [PATCH v2] mtd: spinand: add SPI-NAND MTD resume handler
Date: Thu, 27 May 2021 10:49:59 +0200
Message-ID: <20210527084959.1548-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-27_04:2021-05-26,
 2021-05-27 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_015009_743746_179EA3CC 
X-CRM114-Status: GOOD (  21.07  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Patrice Chotard <patrice.chotard@foss.st.com>

After power up, all SPI NAND's blocks are locked. Only read operations
are allowed, write and erase operations are forbidden.
The SPI NAND framework unlocks all the blocks during its initialization.

During a standby low power, the memory is powered down, losing its
configuration.
During the resume, the QSPI driver state is restored but the SPI NAND
framework does not reconfigured the memory.

This patch adds SPI-NAND MTD PM handlers for resume ops.
SPI NAND resume op re-initializes SPI NAND flash to its probed state.

It also adds a new helper spinand_block_unlock() which is
called in spinand_init() and in spinand_mtd_resume().

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v2:
  - Add helper spinand_block_unlock().
  - Add spinand_ecc_enable() call.
  - Remove some dev_err().
  - Fix commit's title and message.

 drivers/mtd/nand/spi/core.c | 62 +++++++++++++++++++++++++++++++------
 1 file changed, 53 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 17f63f95f4a2..f77aeff11f43 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1074,6 +1074,55 @@ static int spinand_detect(struct spinand_device *spinand)
 	return 0;
 }
 
+static int spinand_block_unlock(struct spinand_device *spinand)
+{
+	struct device *dev = &spinand->spimem->spi->dev;
+	struct nand_device *nand = spinand_to_nand(spinand);
+	int ret = 0, i;
+
+	for (i = 0; i < nand->memorg.ntargets; i++) {
+		ret = spinand_select_target(spinand, i);
+		if (ret)
+			return ret;
+
+		ret = spinand_lock_block(spinand, BL_ALL_UNLOCKED);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static void spinand_mtd_resume(struct mtd_info *mtd)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	struct device *dev = &spinand->spimem->spi->dev;
+	int ret;
+
+	ret = spinand_reset_op(spinand);
+	if (ret)
+		return;
+
+	ret = spinand_init_quad_enable(spinand);
+	if (ret)
+		return;
+
+	ret = spinand_upd_cfg(spinand, CFG_OTP_ENABLE, 0);
+	if (ret)
+		return;
+
+	ret = spinand_manufacturer_init(spinand);
+	if (ret)
+		return;
+
+	ret = spinand_block_unlock(spinand);
+	if (ret)
+		return;
+
+	spinand_ecc_enable(spinand, false);
+}
+
 static int spinand_init(struct spinand_device *spinand)
 {
 	struct device *dev = &spinand->spimem->spi->dev;
@@ -1137,15 +1186,9 @@ static int spinand_init(struct spinand_device *spinand)
 	}
 
 	/* After power up, all blocks are locked, so unlock them here. */
-	for (i = 0; i < nand->memorg.ntargets; i++) {
-		ret = spinand_select_target(spinand, i);
-		if (ret)
-			goto err_manuf_cleanup;
-
-		ret = spinand_lock_block(spinand, BL_ALL_UNLOCKED);
-		if (ret)
-			goto err_manuf_cleanup;
-	}
+	ret = spinand_block_unlock(spinand);
+	if ret)
+		goto err_manuf_cleanup;
 
 	ret = nanddev_init(nand, &spinand_ops, THIS_MODULE);
 	if (ret)
@@ -1167,6 +1210,7 @@ static int spinand_init(struct spinand_device *spinand)
 	mtd->_block_isreserved = spinand_mtd_block_isreserved;
 	mtd->_erase = spinand_mtd_erase;
 	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
+	mtd->_resume = spinand_mtd_resume;
 
 	if (nand->ecc.engine) {
 		ret = mtd_ooblayout_count_freebytes(mtd);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
