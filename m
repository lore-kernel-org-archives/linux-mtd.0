Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CB6C4363D
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 12:27:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1950206A5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 12:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ybv8ZI5Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1950206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JLO+x3nCErD2PdN0euFCE9aXfhKp6Ba/NV0FUMzRy6w=; b=ybv8ZI5QNpg0yqiFmfYmFzVJr
	XYarjJeXY+Cutqff++LVkH7CtArbcbbVo/jT1oaLyU81AQqVQAM717DlCVbO6YOxSN9tX7YJqBhBL
	1KKdzYuJXp6kwSt+qVH0BD74YqYsiiSyHAbDAGnrLLIzrx+nBjJjoDroD5dFOKTIhilkYOOYOmRnH
	OH03BgR/FFPBMxuy3vVUwEeEIBPwdXBYGZ2F3ueoOSTTZjAnVS6oU/laT20nk6A2oMZfundroOchg
	6izxN4IeIxPifX7FsbPlkO9yN9QQV5+7Pkv6hFoKEvHhjFsDsQZ08AGbZG7eea1usFCHqbZk/Pf/5
	4X8Pt7j1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLQKD-0007So-ER; Thu, 24 Sep 2020 12:26:13 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLQK3-0007Or-HY
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 12:26:04 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6CA398AAA78F95E889DD;
 Thu, 24 Sep 2020 20:25:53 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 24 Sep 2020 20:25:46 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <john.garry@huawei.com>, <broonie@kernel.org>
Subject: [PATCH 2/4] spi: hisi-sfc-v3xx: factor out bus config and transfer
 functions
Date: Thu, 24 Sep 2020 20:24:28 +0800
Message-ID: <1600950270-52536-3-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1600950270-52536-1-git-send-email-yangyicong@hisilicon.com>
References: <1600950270-52536-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_082604_346200_B0E1D1A5 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 yangyicong@hisilicon.com, tudor.ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In hisi_sfc_v3xx_generic_exec_op(), we will write the data to the buffer,
configure and start the transfer, read the data to the buffer and check
whether occurs an error. Factor out the config and transfer start codes
as individual functions, to make the process a bit clearer.

Acked-by: John Garry <john.garry@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/spi/spi-hisi-sfc-v3xx.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
index 69f5a7b..62d4ed8 100644
--- a/drivers/spi/spi-hisi-sfc-v3xx.c
+++ b/drivers/spi/spi-hisi-sfc-v3xx.c
@@ -198,12 +198,12 @@ static void hisi_sfc_v3xx_write_databuf(struct hisi_sfc_v3xx_host *host,
 	}
 }
 
-static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
-					 const struct spi_mem_op *op,
-					 u8 chip_select)
+static int hisi_sfc_v3xx_start_bus(struct hisi_sfc_v3xx_host *host,
+				   const struct spi_mem_op *op,
+				   u8 chip_select)
 {
-	int ret = 0, len = op->data.nbytes, buswidth_mode;
-	u32 int_stat, config = 0;
+	int len = op->data.nbytes, buswidth_mode;
+	u32 config = 0;
 
 	if (op->addr.nbytes)
 		config |= HISI_SFC_V3XX_CMD_CFG_ADDR_EN_MSK;
@@ -227,9 +227,7 @@ static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
 		config |= HISI_SFC_V3XX_CMD_CFG_DATA_EN_MSK;
 	}
 
-	if (op->data.dir == SPI_MEM_DATA_OUT)
-		hisi_sfc_v3xx_write_databuf(host, op->data.buf.out, len);
-	else if (op->data.dir == SPI_MEM_DATA_IN)
+	if (op->data.dir == SPI_MEM_DATA_IN)
 		config |= HISI_SFC_V3XX_CMD_CFG_RW_MSK;
 
 	config |= op->dummy.nbytes << HISI_SFC_V3XX_CMD_CFG_DUMMY_CNT_OFF |
@@ -241,6 +239,23 @@ static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
 
 	writel(config, host->regbase + HISI_SFC_V3XX_CMD_CFG);
 
+	return 0;
+}
+
+static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
+					 const struct spi_mem_op *op,
+					 u8 chip_select)
+{
+	u32 int_stat;
+	int ret;
+
+	if (op->data.dir == SPI_MEM_DATA_OUT)
+		hisi_sfc_v3xx_write_databuf(host, op->data.buf.out, op->data.nbytes);
+
+	ret = hisi_sfc_v3xx_start_bus(host, op, chip_select);
+	if (ret)
+		return ret;
+
 	ret = hisi_sfc_v3xx_wait_cmd_idle(host);
 	if (ret)
 		return ret;
@@ -265,7 +280,7 @@ static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
 	}
 
 	if (op->data.dir == SPI_MEM_DATA_IN)
-		hisi_sfc_v3xx_read_databuf(host, op->data.buf.in, len);
+		hisi_sfc_v3xx_read_databuf(host, op->data.buf.in, op->data.nbytes);
 
 	return 0;
 }
-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
