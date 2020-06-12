Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9743AC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 15:23:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B67820835
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 15:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H7GkdbOU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="RrjTyH/f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B67820835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfkVCVLczMaC/9dUfLgXJKApEh8CqGgjuYbLQViLeHs=; b=H7GkdbOUJZFGOJ
	GLvBdaMSFMjcG/CzRnqtS188Qi+U7DD3QjrjcLVoHs6i0wQrTpMHKhokFHRidq2VkdwdV9oQrO5Fg
	FtwBEN7nuLRDRt14+aZ6GH9zSvQq6xGOn+XnypctjFcSKhaJcUosz3oZNvIGLZIed8Dpw0T1xZAoT
	5+KKaqtyiPmuGSXAOu8lcYXnsvJnWnBW+WjEtMC3Ku7MnWidQH9aOc3CG6+4+u/Ired+8JfGvvkMJ
	YKy3T7ETcMEq8hczD+CZGadv/YHK/o0afecHkK0zdb5uJ+fI5RF1XNWB8/rFfed0gY0Frqf/kMwZl
	WIvlzqYRRQ1eeg+cHSXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjlWs-0002BJ-Pz; Fri, 12 Jun 2020 15:23:38 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjlWl-00023n-Go
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2020 15:23:33 +0000
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05CFMR02016903; Fri, 12 Jun 2020 17:23:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Pjdkqf0iNDhsdmITwjZsSH1DCxFnXTvI5U7f8Lsv1nI=;
 b=RrjTyH/f/Qz2lchyKJILkskbIzipXYbJ1COBEXLK9jkdfdbf8T/SYChUKy8YfSexhwLv
 ZaeluLMGXLTG92XxUt+bc+1KhPhd12rRfrcp/fM7Qysb7N5lRmGVTAig6HX4z6vjQ8iZ
 Ie2YfFoGeTdH9NYdC1ZzIZNAXuhgz7OyiY4Dq9zG0ME9dY62UuWFIBfQV6nW8GKsR57B
 IyWNqep9xpRnSv/BcPdYFLxEzfGAjkumWBhlakANzbA7ElbwXGAMR54x6TixQpo/yjGe
 xe8Iqa56m4ceT/dxMkdab0yhrzuW8bt1Z96vlFJydQTgiweVsyZUPU0MVdvwPzbLdSch kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31g0ww8s82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 17:23:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 265BE100034;
 Fri, 12 Jun 2020 17:23:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16E702B9918;
 Fri, 12 Jun 2020 17:23:23 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 12 Jun 2020 17:23:22 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <arnd@linaro.org>,
 <alexandre.torgue@st.com>
Subject: [PATCH v5 1/6] mtd: rawnand: stm32_fmc2: do not display errors if the
 driver is deferred
Date: Fri, 12 Jun 2020 17:22:37 +0200
Message-ID: <1591975362-22009-2-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
References: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-12_11:2020-06-12,
 2020-06-12 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_082331_847673_1A27E398 
X-CRM114-Status: GOOD (  17.07  )
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
Cc: marex@denx.de, devicetree@vger.kernel.org,
 Christophe Kerello <christophe.kerello@st.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

A MDMA issue has been solved on Kernel 5.7. The effect of this fix is
that the MDMA driver is now deferred and the FMC2 NFC driver is also
deferred. All is working fine but there is a FMC2 log in the console:
stm32_fmc2_nfc 58002000.nand-controller: failed to request tx DMA
channel: -517

This patch removes the display of this log in the console in case of
this error is -EPROBE_DEFER.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 65c9d17..e7b706b 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1570,7 +1570,7 @@ static int stm32_fmc2_nfc_dma_setup(struct stm32_fmc2_nfc *nfc)
 	nfc->dma_tx_ch = dma_request_chan(nfc->dev, "tx");
 	if (IS_ERR(nfc->dma_tx_ch)) {
 		ret = PTR_ERR(nfc->dma_tx_ch);
-		if (ret != -ENODEV)
+		if (ret != -ENODEV && ret != -EPROBE_DEFER)
 			dev_err(nfc->dev,
 				"failed to request tx DMA channel: %d\n", ret);
 		nfc->dma_tx_ch = NULL;
@@ -1580,7 +1580,7 @@ static int stm32_fmc2_nfc_dma_setup(struct stm32_fmc2_nfc *nfc)
 	nfc->dma_rx_ch = dma_request_chan(nfc->dev, "rx");
 	if (IS_ERR(nfc->dma_rx_ch)) {
 		ret = PTR_ERR(nfc->dma_rx_ch);
-		if (ret != -ENODEV)
+		if (ret != -ENODEV && ret != -EPROBE_DEFER)
 			dev_err(nfc->dev,
 				"failed to request rx DMA channel: %d\n", ret);
 		nfc->dma_rx_ch = NULL;
@@ -1590,7 +1590,7 @@ static int stm32_fmc2_nfc_dma_setup(struct stm32_fmc2_nfc *nfc)
 	nfc->dma_ecc_ch = dma_request_chan(nfc->dev, "ecc");
 	if (IS_ERR(nfc->dma_ecc_ch)) {
 		ret = PTR_ERR(nfc->dma_ecc_ch);
-		if (ret != -ENODEV)
+		if (ret != -ENODEV && ret != -EPROBE_DEFER)
 			dev_err(nfc->dev,
 				"failed to request ecc DMA channel: %d\n", ret);
 		nfc->dma_ecc_ch = NULL;
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
