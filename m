Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9298ACA0EE4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1sgTDfO2FKDM3l543Y9Zgo6XhFTZYQPfrB28j0/PHY=; b=udEzzz4kL3Z0tk
	viPbd3Wux5GUQyD0op79vS/02TD/I06SOVEE5G7lPcIjv2OKGmcUvq8hfp6SpPGOr8VlGdDbXjqms
	8/jhMoZHgz2QZEmoDfXG//GurNKtUvGhg0JutxFkoEUOsWt4OxW7K2Km+ewgIPA4TG9v3t2bU/X5f
	XuY74DcJe407jFBXtmDedpwBIDVCwl52RFZTE3sVx3R0K+K5NGeoNAqBav9o9Tg82n6rk998Wm/VN
	bCqWqJ5gCSDhZEGMlrganmK2oiMgLWky+p2JlHZ9v5fnV0FYk6QWlXSw+ZFrnct6IfK71WVZyae1I
	s35rJubtkdtN1KWBFiiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulad5-00000009DOI-3ReW;
	Mon, 11 Aug 2025 22:04:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYH0-00000008w1N-1TVj
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Aug 2025 19:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YdngpaN6rCWaiPZrMnO8j4ato33z/K66hxWiRc0bfZs=; b=oA7gXZ5xCX+zxYyrOQ3hUaMRY8
	0tv06vJZ6idOfueC76UD5xp2ZAjzInhEsM4dldOQR25lqov4XpA/wmsMlH4WFADQFjARWmEj31AK6
	BfzD26AKRIxltOAkZApBvFFWZw/GaZBfoJO+vJkNZEXnaDbhcQhQEuOSdEChjS28EEC6s62j/u+vo
	LCOASmh5N21B70imHyMCxjZRYVW9TrAKJeLT+1NgPT8NZzojZuvJ3o5Ycv+UGZnm4i7a1/LiyK7LG
	R1Y+hMOntiMXRJdRpZ1D2gescIfgCE7h5wC2CZosT9MiSNxxaMH6WFJNtuxmJNdwG6+I1OYmtL6cq
	y0oxktLA==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYGs-0000000FUsc-2VQV
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 19:33:30 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57BJXBkB1678213;
	Mon, 11 Aug 2025 14:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754940791;
	bh=YdngpaN6rCWaiPZrMnO8j4ato33z/K66hxWiRc0bfZs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f2B30xwHAzok/DYFLm6sq1Nht6Lr2fTlpiSwUCWeHbmcN7Xx9sb15htsqz1XnOlCc
	 g1wgvSvJExN0JMF7m1E90zZfNjDOfmAvw3jy0ywXvWL1myHhxaRsxyDCqccAcTkJT2
	 KLZ+PWBcVm633QwamgtUX6VJMI6VOUmPtX9Wbz/4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57BJXBvX2910863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 14:33:11 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 14:33:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 14:33:10 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57BJWq1q3690681;
	Mon, 11 Aug 2025 14:33:06 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <broonie@kernel.org>, <tudor.ambarus@linaro.org>,
        <pratyush@kernel.org>, <mwalle@kernel.org>, <p-mantena@ti.com>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <s-k6@ti.com>, <a-dutta@ti.com>,
        <u-kumar1@ti.com>, <praneeth@ti.com>
Subject: [RFC PATCH 03/10] mtd: nand: spi: Introduce _execute_tuning for mtd devices
Date: Tue, 12 Aug 2025 01:02:12 +0530
Message-ID: <20250811193219.731851-4-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811193219.731851-1-s-k6@ti.com>
References: <20250811193219.731851-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_203328_760151_0147619A 
X-CRM114-Status: GOOD (  16.96  )
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

Add _execute_tuning to mtd_info allowing mtd devices to run their own
PHY tuning procedure to run at higher frequencies.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/mtd/nand/spi/core.c | 61 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h     |  1 +
 2 files changed, 62 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index b0898990b2a5..c890a42cdb0a 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1483,6 +1483,66 @@ static void spinand_mtd_resume(struct mtd_info *mtd)
 	spinand_ecc_enable(spinand, false);
 }
 
+static int spinand_mtd_execute_tuning(struct mtd_info *mtd, struct mtd_part *part)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	struct nand_device *nand = spinand_to_nand(spinand);
+	struct nand_pos page_pos;
+	struct nand_page_io_req page_req;
+	struct spi_mem_op read_page_op;
+	struct spi_mem_tuning_params *tuning_params;
+	int ret, pageoffs;
+	u8 status;
+
+	tuning_params = kzalloc(sizeof(*tuning_params), GFP_KERNEL);
+	if (!tuning_params)
+		return -ENOMEM;
+
+	ret = spi_mem_get_tuning_params(spinand->spimem, tuning_params);
+	if (ret)
+		goto err_free_tuning_params;
+
+	/*
+	 * TODO:
+	 * Write the PHY pattern to cache using spinand_write_to_cache_op()
+	 * and readback pattern from cache during tuning instead of using up
+	 * the flash's space.
+	 *
+	 * For SPI NOR:
+	 * Things remain same as done here, the PHY pattern will be preflashed to
+	 * at an offset and will be readback during tuning.
+	 */
+
+	pageoffs = nanddev_offs_to_pos(nand, part->offset, &page_pos);
+	page_req.pos = page_pos;
+
+	read_page_op = *spinand->op_templates.read_cache;
+	read_page_op.addr.val = pageoffs;
+	read_page_op.data.nbytes = tuning_params->pattern_size;
+
+	ret = spinand_load_page_op(spinand, &page_req);
+	if (ret)
+		goto err_free_tuning_params;
+
+	ret = spinand_wait(spinand, SPINAND_READ_INITIAL_DELAY_US,
+			   SPINAND_READ_POLL_DELAY_US, &status);
+	if (ret < 0)
+		goto err_free_tuning_params;
+
+	spinand_ondie_ecc_save_status(nand, status);
+	ret = spi_mem_execute_tuning(spinand->spimem, &read_page_op);
+
+	/*
+	 * TODO:
+	 * Fallback to a lower frequency and a less dummy cycle in case of
+	 * PHY tuning failure
+	 */
+
+err_free_tuning_params:
+	kfree(tuning_params);
+	return ret;
+}
+
 static int spinand_init(struct spinand_device *spinand)
 {
 	struct device *dev = &spinand->spimem->spi->dev;
@@ -1551,6 +1611,7 @@ static int spinand_init(struct spinand_device *spinand)
 	mtd->_erase = spinand_mtd_erase;
 	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
 	mtd->_resume = spinand_mtd_resume;
+	mtd->_execute_tuning = spinand_mtd_execute_tuning;
 
 	if (spinand_user_otp_size(spinand) || spinand_fact_otp_size(spinand)) {
 		ret = spinand_set_mtd_otp_ops(spinand);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8d10d9d2e830..5ac8dc02280d 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -355,6 +355,7 @@ struct mtd_info {
 	int (*_suspend) (struct mtd_info *mtd);
 	void (*_resume) (struct mtd_info *mtd);
 	void (*_reboot) (struct mtd_info *mtd);
+	int (*_execute_tuning) (struct mtd_info *mtd, struct mtd_part *part);
 	/*
 	 * If the driver is something smart, like UBI, it may need to maintain
 	 * its own reference counting. The below functions are only for driver.
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
