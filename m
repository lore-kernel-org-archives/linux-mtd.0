Return-Path: <SRS0=STJJ=JX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA950C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 14:42:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2616C60C40
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 14:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2616C60C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZZtIhkb6XLuKTtkyYsu5WnsyvdBSplhywFitnNtzr5Y=; b=ia+NeGY/W9hLIjxJjDZonDtZ8
	FstZm3qfY0EnYlae0+4kerCOfDVpTwthDyYL1vybcT8GWnBb7UnYFdP018ZSizW3qbWKTrtoq2ILX
	1+LvWcUvHu1gKk9E34Dl+mZbPcz1qLcENgQVEr7yVLUCiRag7Ljlw7tyeOERp+aoaJLLdixnHtL25
	T62O6PKr02i58OlP+LqTYysqpv5TMc+BYBCIRakM6qrDz/ALlBwyNb9R0jquZQ/QCt41+MpTfkVFV
	E0IDYqCLQwFZ/FZFZgkJR2q3s+1afii+y2DVw3UuXHydVmD69mlnwYYh3Vx4DMta5+diqEsG+4Yym
	iRz9QUAug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb2QY-007rnY-3z; Mon, 26 Apr 2021 14:41:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb2Or-007rYA-Oy; Mon, 26 Apr 2021 14:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rKQByYKh9iwatTFVoAH76g3JFEZTY9btSBhtfNq13Vo=; b=VUXdp1K8A/+kFaZ7zN3IeAxX1O
 iYPCX0g02WAD+vl8UCTuQN4oXmghN9v/t2P6uA5UCz9cZd+y1hAbBuCcg6MkVdWnbp1D/KtofnGeF
 KXbk3f/B9B9VRcGtfreIvCgJM/BEAsmu2TNN+4EHVhT8yf4CGFlgRgd9n/2fdQj42P8Yem2wUWk4S
 u6t/FRZ2T0ye+jBnx1Yyg5O98tEX1twlCUWRweKCjLqg7sc5SUJhJiPgnDwnkzFB2fsH+gbDUimIB
 Qik4lOA5ZqHGox90Oc0LLUjNVbWjisoulHeiR3nBFT/T2DLulPjvgB6c2l8cl4ptUE20sUhrtJlZo
 qMgA1bZQ==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb2On-00G1BC-HY; Mon, 26 Apr 2021 14:39:48 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QEcPVN015854; Mon, 26 Apr 2021 16:39:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=rKQByYKh9iwatTFVoAH76g3JFEZTY9btSBhtfNq13Vo=;
 b=foxLr38u1jcgz51POaRlVdw6CYaK4m8E91UnNy7i74BUxY2noOnxMQmKCR1gMBwrHB6C
 dEOwIREZwGAxV0F9vdjFDzbVwvNTAgVBZ4olLYK8erdd6DZtReaq4zvCftzfDJyWnMKA
 0vNQeMgtsx/TRQ6jl/9RnuqBz37dG/DE99YPXlaiXPWZw1ltt8KY+KnjvOQtbuZa6L2x
 jHlxQ6ZBQmH0bfXMmc6Y2EIIuboc9Hp/GGR7q6c45c6FlD4zNFkg0lUaLqxZK6GdsAxz
 d9LNBabwdq0mALpHntag/e45f4GQR1upRH4aA8zwOVf5UVO+4RjMUL9W/DCT7cdQu59m UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 385b0xx7d0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 16:39:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBDD2100034;
 Mon, 26 Apr 2021 16:39:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D54332178E6;
 Mon, 26 Apr 2021 16:39:38 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Apr 2021 16:39:38
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patrice.chotard@foss.st.com>, <christophe.kerello@foss.st.com>
Subject: [PATCH 1/3] spi: spi-mem: add automatic poll status functions
Date: Mon, 26 Apr 2021 16:39:32 +0200
Message-ID: <20210426143934.25275-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426143934.25275-1-patrice.chotard@foss.st.com>
References: <20210426143934.25275-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_07:2021-04-26,
 2021-04-26 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_073946_049176_EEE894EC 
X-CRM114-Status: GOOD (  22.41  )
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

From: Christophe Kerello <christophe.kerello@foss.st.com>

With STM32 QSPI, it is possible to poll the status register of the device.
This could be done to offload the CPU during an operation (erase or
program a SPI NAND for example).

spi_mem_poll_status API has been added to handle this feature.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/spi-mem.c       | 34 ++++++++++++++++++++++++++++++++++
 include/linux/spi/spi-mem.h |  8 ++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 1513553e4080..43dce4b0efa4 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -743,6 +743,40 @@ static inline struct spi_mem_driver *to_spi_mem_drv(struct device_driver *drv)
 	return container_of(drv, struct spi_mem_driver, spidrv.driver);
 }
 
+/**
+ * spi_mem_poll_status() - Poll memory device status
+ * @mem: SPI memory device
+ * @op: the memory operation to execute
+ * @mask: status bitmask to ckeck
+ * @match: status expected value
+ * @timeout: timeout
+ *
+ * This function send a polling status request to the controller driver
+ *
+ * Return: 0 in case of success, -ETIMEDOUT in case of error,
+ *         -EOPNOTSUPP if not supported.
+ */
+int spi_mem_poll_status(struct spi_mem *mem,
+			const struct spi_mem_op *op,
+			u8 mask, u8 match, u16 timeout)
+{
+	struct spi_controller *ctlr = mem->spi->controller;
+	int ret = -EOPNOTSUPP;
+
+	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
+		ret = spi_mem_access_start(mem);
+		if (ret)
+			return ret;
+
+		ret = ctlr->mem_ops->poll_status(mem, op, mask, match, timeout);
+
+		spi_mem_access_end(mem);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(spi_mem_poll_status);
+
 static int spi_mem_probe(struct spi_device *spi)
 {
 	struct spi_mem_driver *memdrv = to_spi_mem_drv(spi->dev.driver);
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 2b65c9edc34e..5f78917c0f68 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -250,6 +250,7 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
  *		  the currently mapped area), and the caller of
  *		  spi_mem_dirmap_write() is responsible for calling it again in
  *		  this case.
+ * @poll_status: poll memory device status
  *
  * This interface should be implemented by SPI controllers providing an
  * high-level interface to execute SPI memory operation, which is usually the
@@ -274,6 +275,9 @@ struct spi_controller_mem_ops {
 			       u64 offs, size_t len, void *buf);
 	ssize_t (*dirmap_write)(struct spi_mem_dirmap_desc *desc,
 				u64 offs, size_t len, const void *buf);
+	int (*poll_status)(struct spi_mem *mem,
+			   const struct spi_mem_op *op,
+			   u8 mask, u8 match, u16 timeout);
 };
 
 /**
@@ -369,6 +373,10 @@ devm_spi_mem_dirmap_create(struct device *dev, struct spi_mem *mem,
 void devm_spi_mem_dirmap_destroy(struct device *dev,
 				 struct spi_mem_dirmap_desc *desc);
 
+int spi_mem_poll_status(struct spi_mem *mem,
+			const struct spi_mem_op *op,
+			u8 mask, u8 match, u16 timeout);
+
 int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
 				       struct module *owner);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
