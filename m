Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56778C2B9F7
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 14:19:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17F7F6124B
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 14:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17F7F6124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QK4hzphp8jlHJogCbpvznYWIrxpVn7rRQNdsopN2RW0=; b=vyzbpWbfcHXk2b
	Ijlgl3bIjYPeW0AAsKtXNkTWbzaoJwjtozo1ARjh6ZFFXXv7+u4cbpviaRNsIXm3CU60jnUWvel8l
	Q8PV1jC3qW/aoArCDaSx0stvfmd78HoRPzAFKyTWOnmEG3cjfyV+lKIcrN/JIr2/4RUYhrzate0r2
	/0IteEUuwDOttC7t1sunmI6/ieRcqmhFoQdGurJhZ2UKYP38eZchPS/nekGQMhe1hkOdl5CGQZXGT
	AHBMxG2WfXqw992aVRzb2YAwjf/VGQAJaZpDlfql+ZratMfoLsJ8XyP2IExuvPnTW+/wYgbKD09Mm
	jpF11zx/hd6ixeH1Ym8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmdK6-00G70X-Vs; Fri, 28 May 2021 14:18:51 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmdII-00G6BU-Df; Fri, 28 May 2021 14:17:00 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SE8M54030904; Fri, 28 May 2021 16:16:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=e2cWYJoOM9ZBMvGbPSWfnuuYTOko3MHHZmgI0RkE1mk=;
 b=YoP/+4tehpzuKz1U1l0yEb3hbVIo85uwdU4WK1nkc4/0EqTAae4FL7JqAmWfLHsNRs/w
 0lmNhU7tGwAKmr1mYOd1b85geK9eRzIImrUc1nZJyzZwCdKyNeM25nZxsVJSGOQkDGYz
 CH0OdBkCm4j9LOtQarlu8Oe/+lZe9BbUwrBT+kQtIEbV9KUKJocRVJAQo7rliHD+HPwb
 iG2NNQpujqGjd6I8KRA5XxRdr+08cbF4R5GKCGzAe7LDTmfwFz2GD2LVVhNrYyWbpNuq
 CNNu0V0dAsTbnjsFzyqoY7BsokODOyA6MQtiHrIh+bg1XlKSwffhFibLWlY0GCrfnsN8 zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38tsq0jxba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 16:16:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D15BC100034;
 Fri, 28 May 2021 16:16:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0EE4231DC0;
 Fri, 28 May 2021 16:16:53 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May 2021 16:16:53
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Pratyush Yadav <p.yadav@ti.com>
CC: <patrice.chotard@foss.st.com>, <christophe.kerello@foss.st.com>
Subject: [PATCH v4 3/3] mtd: spinand: add SPI-NAND MTD resume handler
Date: Fri, 28 May 2021 16:16:39 +0200
Message-ID: <20210528141639.3194-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210528141639.3194-1-patrice.chotard@foss.st.com>
References: <20210528141639.3194-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_05:2021-05-27,
 2021-05-28 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_071658_803975_7FF53C9F 
X-CRM114-Status: GOOD (  17.96  )
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

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v4:
  - Call spinand_init_flash() helper in spinand_mtd_resume()

Changes in v3:
  - Add spinand_read_cfg() call to repopulate cache

Changes in v2:
  - Add helper spinand_block_unlock().
  - Add spinand_ecc_enable() call.
  - Remove some dev_err().
  - Fix commit's title and message.

 drivers/mtd/nand/spi/core.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 58945f0ae839..e108e6176f64 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1121,6 +1121,26 @@ static int spinand_init_flash(struct spinand_device *spinand)
 	return ret;
 }
 
+static void spinand_mtd_resume(struct mtd_info *mtd)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	int ret;
+
+	ret = spinand_reset_op(spinand);
+	if (ret)
+		return;
+
+	ret = spinand_read_cfg(spinand);
+	if (ret)
+		return;
+
+	ret = spinand_init_flash(spinand);
+	if (ret)
+		return;
+
+	spinand_ecc_enable(spinand, false);
+}
+
 static int spinand_init(struct spinand_device *spinand)
 {
 	struct device *dev = &spinand->spimem->spi->dev;
@@ -1191,6 +1211,7 @@ static int spinand_init(struct spinand_device *spinand)
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
