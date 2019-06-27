Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA9BC48BD7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 07:44:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E8BE205ED
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 07:44:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="urOJuI0S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="WeLP0sfO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E8BE205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHQZCRqUjy2sp1A0yUKaGtvIWr8xPybEmZluTKmpi1M=; b=urOJuI0SqzHmTu
	6ZlBUSc9Tt9JJtwpUG0lLIv1RcTEBal5Nu1eFiXtEJB0urdsCJGa+5EUp9fKon+Qh4C7cD79a3xxu
	7pADuK71Z7Sqm857bTjvH2pwsChdYQzE/Iox0RHxRfUCUE37tqjYaFSlVkEOZ2XyXMhp7lnJkTtkw
	nd1AAPTR6XWe7XQhuaLNghdJT8pQ8ixycl8fBE3Fe38wUeHOc3Gfo6OFENS6GtMv2qpJ2pCwCzC0U
	0ZYHg2yv34w76eWDInOeIkrx61uqg8bHEla8v294UjT0pr/+Kse94IxE7bAr+v7wkLkjJwafKTsnV
	79W9Tx2p/hbZ9qyN6FGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgP4t-00072J-Bd; Thu, 27 Jun 2019 07:44:19 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgP4p-00071E-KY; Thu, 27 Jun 2019 07:44:17 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5R7gN3E025943; Thu, 27 Jun 2019 09:44:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=GHcv4g6tr7JE6E7+aaabKzOIotaPQfNSAvXVtLgorgc=;
 b=WeLP0sfOhW5LidRnIOOUbwYUkRRVFFtqf7wvD0l13yXu7zKPLROx+PfklvQJksHQGRbB
 uUBAFNk6FjWRdovwpEkZSs19tmDBnSjTzooLXZ8FwITj6XUzzBAL6dmeP3WkLH9zBcvj
 A7HJAsA8pC3QL9ZV/kzlepGrV/Vd6ypMLwEbmRHHF59A3a0RqeV13h1xnFFKlJ2ABdcD
 TjAE1c5J88+KN/XvwUx3zJf/iY3BHpA3gSKSc7FSCfRPP9UBiXFu76C7q1q6PMVHytWf
 ul4ZNUojW7kDQJnhquxqjv4rvTLDfzTYZhhERa4ROz0wCkiy6tcWChWS7CtmKSFhsFaL VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t9d2gn3nf-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 27 Jun 2019 09:44:09 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D2B83F;
 Thu, 27 Jun 2019 07:44:07 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 47D1D157C;
 Thu, 27 Jun 2019 07:44:07 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 27 Jun
 2019 09:44:07 +0200
Received: from lmecxl0923.lme.st.com (10.48.0.237) by Webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 27 Jun
 2019 09:44:06 +0200
From: Ludovic Barre <ludovic.Barre@st.com>
To: Mark Brown <broonie@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] spi: stm32-qspi: remove signal sensitive on completion
Date: Thu, 27 Jun 2019 09:43:59 +0200
Message-ID: <1561621439-7305-2-git-send-email-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561621439-7305-1-git-send-email-ludovic.Barre@st.com>
References: <1561621439-7305-1-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_03:, , signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_004416_130983_99776247 
X-CRM114-Status: GOOD (  13.61  )
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

On umount step a sigkill signal is set (without user specific
action), due to sigkill signal the completion will be interrupted and
the data transfer can't be finished if a sync is needed.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/spi/spi-stm32-qspi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 5dbb6a8..655e4af 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -245,12 +245,8 @@ static int stm32_qspi_tx_dma(struct stm32_qspi *qspi,
 	writel_relaxed(cr | CR_DMAEN, qspi->io_base + QSPI_CR);
 
 	t_out = sgt.nents * STM32_COMP_TIMEOUT_MS;
-	if (!wait_for_completion_interruptible_timeout(&qspi->dma_completion,
-						       msecs_to_jiffies(t_out)))
-		err = -ETIMEDOUT;
-
-	if (dma_async_is_tx_complete(dma_ch, cookie,
-				     NULL, NULL) != DMA_COMPLETE)
+	if (!wait_for_completion_timeout(&qspi->dma_completion,
+					 msecs_to_jiffies(t_out)))
 		err = -ETIMEDOUT;
 
 	if (err)
@@ -304,7 +300,7 @@ static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi,
 	cr = readl_relaxed(qspi->io_base + QSPI_CR);
 	writel_relaxed(cr | CR_TCIE | CR_TEIE, qspi->io_base + QSPI_CR);
 
-	if (!wait_for_completion_interruptible_timeout(&qspi->data_completion,
+	if (!wait_for_completion_timeout(&qspi->data_completion,
 				msecs_to_jiffies(STM32_COMP_TIMEOUT_MS))) {
 		err = -ETIMEDOUT;
 	} else {
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
