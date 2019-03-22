Return-Path: <SRS0=aBH3=RZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BBDC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 14:36:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF2C4218A5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 14:36:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tuKvdgYK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF2C4218A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FE4fKlY1v1E3N9SO6QXbZSrx3CLWSH4M6ByPzMIgwF4=; b=tuKvdgYKvP9zVy
	Z76gciCIUXcpzfdDYM1Lqe/V8Nyi4xsklv8t6MieepkcYhIoiFbse3tUbeooNMq9ylHM9Fjqs6k4r
	pXP+utRf4uKR/yi2e3oZ0lmNomZFe1uI25OOkLcWJuUK3M2UZNYpAEGzIczxsKSftk7oTqUxZ6UPW
	b7g0sF4tzFaHiXHX60NUfuO6w+BlpXmAzg65ocxcPtpahdgdtsL+ms9YJKzGqOIrXkGCK1izVi1AA
	nHsJPfKQJm3pIrL+LnNDwzMoJizx0AZpmrYjCyv6R75a3rK9lYmBtP4LdCSMpguD4TVFg4blwrvV6
	R3QIhiHYkI5/8IBxSyHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7LHj-0005uT-A7; Fri, 22 Mar 2019 14:36:39 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7LHQ-0005W1-8p; Fri, 22 Mar 2019 14:36:22 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2MEV1OM021870; Fri, 22 Mar 2019 15:36:13 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2r8qg53xbh-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 22 Mar 2019 15:36:13 +0100
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 927A83F;
 Fri, 22 Mar 2019 14:36:12 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6EADF5154;
 Fri, 22 Mar 2019 14:36:12 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.361.1; Fri, 22 Mar
 2019 15:36:12 +0100
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.435.0; Fri, 22 Mar
 2019 15:36:11 +0100
From: Ludovic Barre <ludovic.Barre@st.com>
To: Mark Brown <broonie@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] spi: stm32-qspi: add spi_master_put in release function
Date: Fri, 22 Mar 2019 15:35:53 +0100
Message-ID: <1553265354-16433-2-git-send-email-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553265354-16433-1-git-send-email-ludovic.Barre@st.com>
References: <1553265354-16433-1-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-22_08:, , signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_073620_609638_7C62392B 
X-CRM114-Status: GOOD (  14.29  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, Ludovic Barre <ludovic.barre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch adds spi_master_put in release function
to drop the controller's refcount.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/spi/spi-stm32-qspi.c | 48 +++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 7879a52..983584d 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -93,6 +93,7 @@ struct stm32_qspi_flash {
 
 struct stm32_qspi {
 	struct device *dev;
+	struct spi_controller *ctrl;
 	void __iomem *io_base;
 	void __iomem *mm_base;
 	resource_size_t mm_size;
@@ -400,6 +401,7 @@ static void stm32_qspi_release(struct stm32_qspi *qspi)
 	writel_relaxed(0, qspi->io_base + QSPI_CR);
 	mutex_destroy(&qspi->lock);
 	clk_disable_unprepare(qspi->clk);
+	spi_master_put(qspi->ctrl);
 }
 
 static int stm32_qspi_probe(struct platform_device *pdev)
@@ -416,43 +418,56 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	qspi = spi_controller_get_devdata(ctrl);
+	qspi->ctrl = ctrl;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi");
 	qspi->io_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(qspi->io_base))
-		return PTR_ERR(qspi->io_base);
+	if (IS_ERR(qspi->io_base)) {
+		ret = PTR_ERR(qspi->io_base);
+		goto err;
+	}
+
+	qspi->phys_base = res->start;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi_mm");
 	qspi->mm_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(qspi->mm_base))
-		return PTR_ERR(qspi->mm_base);
+	if (IS_ERR(qspi->mm_base)) {
+		ret = PTR_ERR(qspi->mm_base);
+		goto err;
+	}
 
 	qspi->mm_size = resource_size(res);
-	if (qspi->mm_size > STM32_QSPI_MAX_MMAP_SZ)
-		return -EINVAL;
+	if (qspi->mm_size > STM32_QSPI_MAX_MMAP_SZ) {
+		ret = -EINVAL;
+		goto err;
+	}
 
 	irq = platform_get_irq(pdev, 0);
 	ret = devm_request_irq(dev, irq, stm32_qspi_irq, 0,
 			       dev_name(dev), qspi);
 	if (ret) {
 		dev_err(dev, "failed to request irq\n");
-		return ret;
+		goto err;
 	}
 
 	init_completion(&qspi->data_completion);
 
 	qspi->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(qspi->clk))
-		return PTR_ERR(qspi->clk);
+	if (IS_ERR(qspi->clk)) {
+		ret = PTR_ERR(qspi->clk);
+		goto err;
+	}
 
 	qspi->clk_rate = clk_get_rate(qspi->clk);
-	if (!qspi->clk_rate)
-		return -EINVAL;
+	if (!qspi->clk_rate) {
+		ret = -EINVAL;
+		goto err;
+	}
 
 	ret = clk_prepare_enable(qspi->clk);
 	if (ret) {
 		dev_err(dev, "can not enable the clock\n");
-		return ret;
+		goto err;
 	}
 
 	rstc = devm_reset_control_get_exclusive(dev, NULL);
@@ -475,14 +490,11 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	ctrl->dev.of_node = dev->of_node;
 
 	ret = devm_spi_register_master(dev, ctrl);
-	if (ret)
-		goto err_spi_register;
-
-	return 0;
+	if (!ret)
+		return 0;
 
-err_spi_register:
+err:
 	stm32_qspi_release(qspi);
-
 	return ret;
 }
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
