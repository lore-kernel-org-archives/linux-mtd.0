Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00F9C4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 17:39:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCD3E613BE
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 17:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCD3E613BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UM3cIDCqrDa2tbqPRMt0mLOg/XDID0/0A2xvCG2YfIQ=; b=LtN2D/gxtpEhUr
	zr7EnLyN8XsG+OF6dIzHX5924lzkXpBWn8T5sZUkK94msgs+rEh7DG0AHYQbdTwSCi7zDk3eqIUft
	cI0sqNlvHXTbaeY86PebkabQlXeTAc8aga9Q3ln4C+/YOTo7zB9QwrOA5slLRiSniHXV650URWLuI
	QN0FBr5BgMukVnDnrcwfarViuSvF1SADnbbypvAOAjAfV88B4JujKEkKlot8ns/QIOw3jkoiC1GnG
	WQ9zXzsCrXMu0ROYSR4CRsyoUTNEj2eIr36qYUZsy8YVWW6RM1ynQP7bEDlAx5xuVV1BJO7enGMh4
	Hf7ONAcBmj3CjBz34W3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmJxi-0089pz-Sh; Thu, 27 May 2021 17:38:27 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmIdI-007Vq2-SQ; Thu, 27 May 2021 16:13:20 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14RGCErn027551; Thu, 27 May 2021 18:13:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=lhIzyMB3zCeRcGYJfgFXnoCQIPHUSlhrp5nHGanC4TA=;
 b=eU0svrHAYFpVKvArcV6Up8RWPbB6JNsnCe5W0dmYmC3ouIhfvT/mFAuQJl1wB64lhnzQ
 opmNqVZ1wBo14ddEEk8Kcjeh2Z3aHiQ1vmNpKYjV2rRHTXLDfSSsBl9JLpC1QQOEBB/k
 pnCjdzXhObwW9hBFf3D/hNinVLqxJjQkcN/qBL1yA6cXwB90QhjuwLBYLOQbQtUHulPk
 WaGALKkDRH7ccnxVSy3iaqtdYcZCtRB9Mz9FGzE4FaB9m9zOGXTPcOszwepKull1IXrE
 tCUkBz6tuu7/Uru9Kmc7cSlazAbZb7m6AoHjaOQ06qdWgDsyo1qsnfarCzIHovcG/OnC 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38t0fr4ypg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 May 2021 18:13:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8D65100034;
 Thu, 27 May 2021 18:13:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C99ED236566;
 Thu, 27 May 2021 18:13:03 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May 2021 18:13:03
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patrice.chotard@foss.st.com>, <christophe.kerello@foss.st.com>
Subject: [PATCH v3 1/3] mtd: spinand: Add spinand_block_unlock() helper
Date: Thu, 27 May 2021 18:12:50 +0200
Message-ID: <20210527161252.16620-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527161252.16620-1-patrice.chotard@foss.st.com>
References: <20210527161252.16620-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-27_09:2021-05-27,
 2021-05-27 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_091317_490236_0F683774 
X-CRM114-Status: GOOD (  18.63  )
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

Put code responsible of block unlocking in spinand_block_unlock().
This function will be needed by the future SPI-NAND resume ops.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/mtd/nand/spi/core.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 17f63f95f4a2..095742e5bc2b 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1074,12 +1074,30 @@ static int spinand_detect(struct spinand_device *spinand)
 	return 0;
 }
 
+static int spinand_block_unlock(struct spinand_device *spinand)
+{
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
 static int spinand_init(struct spinand_device *spinand)
 {
 	struct device *dev = &spinand->spimem->spi->dev;
 	struct mtd_info *mtd = spinand_to_mtd(spinand);
 	struct nand_device *nand = mtd_to_nanddev(mtd);
-	int ret, i;
+	int ret;
 
 	/*
 	 * We need a scratch buffer because the spi_mem interface requires that
@@ -1137,15 +1155,9 @@ static int spinand_init(struct spinand_device *spinand)
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
+	if (ret)
+		goto err_manuf_cleanup;
 
 	ret = nanddev_init(nand, &spinand_ops, THIS_MODULE);
 	if (ret)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
