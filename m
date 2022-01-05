Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADBEC43217
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jan 2022 13:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FhbokdUAKCVmhemAjslWxzzdROcDPICGFTExkFMSKo=; b=1qeJjjg5n7KoCc
	u6JDN3RvX6iHq/UdEwVNuDQXaF5P/i/8G4fY55SCK3Zwf1/Xxu+sxKpMlUE7SHpe+dlPJZ32Y7Y/+
	3iKQmzu/4xFDbwFZCY345AQHhJrI4O28pFgQ/nrCWfDxuZSrtFBhVk2xu4YRg/U5YD21C0N6pZdQm
	DzXlU9a6eZ0Pkacv261JOJIZfy0tUupwGeipgX8fTMOMiKvsftVFkalUtoftTmH2XRF0t2Ui1BjQ9
	hUuf4xIbLMcgIpjMzrGSbFMMBXNUAfATcpvKWS1MQfftS6aS3236zzrghD52gNtjkOdMAzQlkJYAk
	QTkNxjZLPffHzJ8ChOUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n56ob-00Eukd-FL; Wed, 05 Jan 2022 13:58:57 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n56oH-00EugZ-T9
 for linux-mtd@lists.infradead.org; Wed, 05 Jan 2022 13:58:39 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205DZ65I029790;
 Wed, 5 Jan 2022 14:58:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=vJYKJrfoZTOxidHtgmggToIXf7luT4gK50tpphfihR8=;
 b=iDQ7JsyMZ+Di+15I2+AGXfp/O7Qf/wD9cBgZhtVJ3+S5zAzYLO4HYCCtJ2x5uMz9JY1a
 FDOVtCXYT6IjwOHInxb+xq7ok9vWJd6wD/UthA7KtCInFUPm96L+pL/kuVY1XAulec6l
 0VBkwNyG+iT6P/wh2AAH7/9TJ5ZYibSihkaZAq7Fbzmh5zIeJAQp6RRh/eYIbEF1bzKe
 n4hgM27Uk35SXUiDIFgRGL2Tk5QvGVJhMPwCPXDxUK9/MZiTUNT8/40aVwrm3AenrkCy
 HxohIwADFX+DG0mv1p8WdEJsm6QBFxReO01coFNR/NfNeDznkLqr/6KXWCXtNeebiVLb TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dd7k91mce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 14:58:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B42710002A;
 Wed,  5 Jan 2022 14:58:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22B6D24D5F4;
 Wed,  5 Jan 2022 14:58:32 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 5 Jan 2022 14:58:31
 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <srinivas.kandagatla@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <devicetree@vger.kernel.org>, <chenshumin86@sina.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>
Subject: [PATCH 2/3] mtd: rawnand: stm32_fmc2: Add NAND Write Protect support
Date: Wed, 5 Jan 2022 14:57:33 +0100
Message-ID: <20220105135734.271313-3-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105135734.271313-1-christophe.kerello@foss.st.com>
References: <20220105135734.271313-1-christophe.kerello@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_03,2022-01-04_01,2021-12-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_055838_278501_B6516FE1 
X-CRM114-Status: GOOD (  21.96  )
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

This patch adds the support of the WP# signal. WP will be disabled in
probe/resume callbacks and will be enabled in remove/suspend callbacks.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 40 +++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 97b4e02e43e4..87c1c7dd97eb 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -9,6 +9,7 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/errno.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/mfd/syscon.h>
@@ -231,6 +232,7 @@ struct stm32_fmc2_timings {
 
 struct stm32_fmc2_nand {
 	struct nand_chip chip;
+	struct gpio_desc *wp_gpio;
 	struct stm32_fmc2_timings timings;
 	int ncs;
 	int cs_used[FMC2_MAX_CE];
@@ -1747,6 +1749,18 @@ static const struct nand_controller_ops stm32_fmc2_nfc_controller_ops = {
 	.setup_interface = stm32_fmc2_nfc_setup_interface,
 };
 
+static void stm32_fmc2_nfc_wp_enable(struct stm32_fmc2_nand *nand)
+{
+	if (nand->wp_gpio)
+		gpiod_set_value(nand->wp_gpio, 1);
+}
+
+static void stm32_fmc2_nfc_wp_disable(struct stm32_fmc2_nand *nand)
+{
+	if (nand->wp_gpio)
+		gpiod_set_value(nand->wp_gpio, 0);
+}
+
 static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc,
 				      struct device_node *dn)
 {
@@ -1785,6 +1799,18 @@ static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc,
 		nand->cs_used[i] = cs;
 	}
 
+	nand->wp_gpio = devm_gpiod_get_from_of_node(nfc->dev, dn,
+						    "wp-gpios", 0,
+						    GPIOD_OUT_HIGH, "wp");
+	if (IS_ERR(nand->wp_gpio)) {
+		ret = PTR_ERR(nand->wp_gpio);
+		if (ret != -ENOENT)
+			return dev_err_probe(nfc->dev, ret,
+					     "failed to request WP GPIO\n");
+
+		nand->wp_gpio = NULL;
+	}
+
 	nand_set_flash_node(&nand->chip, dn);
 
 	return 0;
@@ -1956,10 +1982,12 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	chip->options |= NAND_BUSWIDTH_AUTO | NAND_NO_SUBPAGE_WRITE |
 			 NAND_USES_DMA;
 
+	stm32_fmc2_nfc_wp_disable(nand);
+
 	/* Scan to find existence of the device */
 	ret = nand_scan(chip, nand->ncs);
 	if (ret)
-		goto err_release_dma;
+		goto err_wp_enable;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret)
@@ -1972,6 +2000,9 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 err_nand_cleanup:
 	nand_cleanup(chip);
 
+err_wp_enable:
+	stm32_fmc2_nfc_wp_enable(nand);
+
 err_release_dma:
 	if (nfc->dma_ecc_ch)
 		dma_release_channel(nfc->dma_ecc_ch);
@@ -2012,15 +2043,20 @@ static int stm32_fmc2_nfc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(nfc->clk);
 
+	stm32_fmc2_nfc_wp_enable(nand);
+
 	return 0;
 }
 
 static int __maybe_unused stm32_fmc2_nfc_suspend(struct device *dev)
 {
 	struct stm32_fmc2_nfc *nfc = dev_get_drvdata(dev);
+	struct stm32_fmc2_nand *nand = &nfc->nand;
 
 	clk_disable_unprepare(nfc->clk);
 
+	stm32_fmc2_nfc_wp_enable(nand);
+
 	pinctrl_pm_select_sleep_state(dev);
 
 	return 0;
@@ -2042,6 +2078,8 @@ static int __maybe_unused stm32_fmc2_nfc_resume(struct device *dev)
 
 	stm32_fmc2_nfc_init(nfc);
 
+	stm32_fmc2_nfc_wp_disable(nand);
+
 	for (chip_cs = 0; chip_cs < FMC2_MAX_CE; chip_cs++) {
 		if (!(nfc->cs_assigned & BIT(chip_cs)))
 			continue;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
