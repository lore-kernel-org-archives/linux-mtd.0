Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D7EC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 09:44:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3011A20758
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 09:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3011A20758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zin397rJpROLlW4jjjI0YpJ6M5lpaONrBg9MiqVVaE8=; b=buHtFe6N8bcO90dotiW/vYlf7
	dXiFmL1Kv0ip15rgU71/0+pXKfSmizLMbgJHgRC7xl1ldUqfSVCEEQQJ/mIRx9cEwWHBKXia5YnEj
	vfKZlLVEM6QA2AN9UKq4Kx8/moAaDIBqNP2tqxoywXzRmK7BpAv5vhdBi2VnTwU3C4vFCrohrwoqR
	k8FhsTd4CUeYMN9MY967eqDGcj25WbI39tG73xOvH9ZumflH+TfQ+m1MWQnzAepM1IY7DOHrM2psW
	eP4zH0IzVVB9NCxjZWqJxtOXQCo9X6IPVqP0r6Twg8R5ED4pw/Zh0gSRdUbICNAhjiUJNyhqWlahO
	UtuxnKa2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4hME-0002qT-OR; Wed, 27 Jan 2021 09:43:26 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4hM5-0002nA-5u
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 09:43:18 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DQdt95jmBzjCw0;
 Wed, 27 Jan 2021 17:42:09 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Wed, 27 Jan 2021 17:42:59 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <tudor.ambarus@microchip.com>, <broonie@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 2/2] spi: hisi-sfc-v3xx: add address mode check
Date: Wed, 27 Jan 2021 17:40:50 +0800
Message-ID: <1611740450-47975-3-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1611740450-47975-1-git-send-email-yangyicong@hisilicon.com>
References: <1611740450-47975-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_044317_476702_544258A4 
X-CRM114-Status: GOOD (  14.19  )
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
Cc: john.garry@huawei.com, linuxarm@openeuler.org, prime.zeng@huawei.com,
 yangyicong@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The address mode is either 3 or 4 for the controller, which is configured
by the firmware and cannot be modified in the OS driver. Get the
firmware configuration and add address mode check in the .supports_op()
to block invalid operations.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Acked-by: John Garry <john.garry@huawei.com>
---
 drivers/spi/spi-hisi-sfc-v3xx.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
index 4650b48..f71b780 100644
--- a/drivers/spi/spi-hisi-sfc-v3xx.c
+++ b/drivers/spi/spi-hisi-sfc-v3xx.c
@@ -19,6 +19,8 @@
 
 #define HISI_SFC_V3XX_VERSION (0x1f8)
 
+#define HISI_SFC_V3XX_GLB_CFG (0x100)
+#define HISI_SFC_V3XX_GLB_CFG_CS0_ADDR_MODE BIT(2)
 #define HISI_SFC_V3XX_RAW_INT_STAT (0x120)
 #define HISI_SFC_V3XX_INT_STAT (0x124)
 #define HISI_SFC_V3XX_INT_MASK (0x128)
@@ -75,6 +77,7 @@ struct hisi_sfc_v3xx_host {
 	void __iomem *regbase;
 	int max_cmd_dword;
 	struct completion *completion;
+	u8 address_mode;
 	int irq;
 };
 
@@ -168,10 +171,18 @@ static int hisi_sfc_v3xx_adjust_op_size(struct spi_mem *mem,
 static bool hisi_sfc_v3xx_supports_op(struct spi_mem *mem,
 				      const struct spi_mem_op *op)
 {
+	struct spi_device *spi = mem->spi;
+	struct hisi_sfc_v3xx_host *host;
+
+	host = spi_controller_get_devdata(spi->master);
+
 	if (op->data.buswidth > 4 || op->dummy.buswidth > 4 ||
 	    op->addr.buswidth > 4 || op->cmd.buswidth > 4)
 		return false;
 
+	if (op->addr.nbytes != host->address_mode && op->addr.nbytes)
+		return false;
+
 	return spi_mem_default_supports_op(mem, op);
 }
 
@@ -416,7 +427,7 @@ static int hisi_sfc_v3xx_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct hisi_sfc_v3xx_host *host;
 	struct spi_controller *ctlr;
-	u32 version;
+	u32 version, glb_config;
 	int ret;
 
 	ctlr = spi_alloc_master(&pdev->dev, sizeof(*host));
@@ -463,6 +474,18 @@ static int hisi_sfc_v3xx_probe(struct platform_device *pdev)
 	ctlr->num_chipselect = 1;
 	ctlr->mem_ops = &hisi_sfc_v3xx_mem_ops;
 
+	/*
+	 * The address mode of the controller is either 3 or 4,
+	 * which is indicated by the address mode bit in
+	 * the global config register. The register is read only
+	 * for the OS driver.
+	 */
+	glb_config = readl(host->regbase + HISI_SFC_V3XX_GLB_CFG);
+	if (glb_config & HISI_SFC_V3XX_GLB_CFG_CS0_ADDR_MODE)
+		host->address_mode = 4;
+	else
+		host->address_mode = 3;
+
 	version = readl(host->regbase + HISI_SFC_V3XX_VERSION);
 
 	switch (version) {
-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
