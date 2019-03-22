Return-Path: <SRS0=aBH3=RZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06131C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 14:36:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5943218A5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 14:36:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lOVNhk7S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5943218A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vktgmNUjNbLD/SEhPchLZz2JP5Fus02r6jfpjkzwHxc=; b=lOVNhk7S/FXlph
	+q+fj4EuChqgN5ffZ75V9hhzJsNThwetjx9UqOMlqzH7HFMSdOi+4s241WGRVc3G8AaeQ9unMP+DB
	HcgQuBIBpDOu07ByEzrZXJN+MMJ+efhapKOH779tRDS8oG3sqZNTj4y1TQ2FMYQzBJj3lA5CWU5V7
	VNZsFjZfIGfZY7JFaijPRJQp9SservT1ekHwOIC4SOdbYviY3vaF3Iuc8THsMn/fb82Vx4e+Vl5mH
	jBt9GqCD5KRLVTPHlj97lCGJwsjqWpBbTmO/FyZIbCfj4Eb6wviHae2+ZSYbMgkTugsXKvt6lkagn
	v6TBzxKE0CdcD/cif/lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7LHT-0005XZ-FF; Fri, 22 Mar 2019 14:36:23 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7LHQ-0005W0-7G; Fri, 22 Mar 2019 14:36:21 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2MEXK33012146; Fri, 22 Mar 2019 15:36:11 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2r8q5bvdu7-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 22 Mar 2019 15:36:11 +0100
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0FE6E3F;
 Fri, 22 Mar 2019 14:36:11 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C84505154;
 Fri, 22 Mar 2019 14:36:10 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.435.0; Fri, 22 Mar
 2019 15:36:10 +0100
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.435.0; Fri, 22 Mar
 2019 15:36:10 +0100
From: Ludovic Barre <ludovic.Barre@st.com>
To: Mark Brown <broonie@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/2] spi: stm32-qspi: add dma support
Date: Fri, 22 Mar 2019 15:35:52 +0100
Message-ID: <1553265354-16433-1-git-send-email-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-22_08:, , signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_073620_552754_4889D572 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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

This patch series adds dma support for the stm32-qspi.
In read mode, the memory map is preferred vs dma
(due to better throughput). If the dma transfer fails the buffer is
sent by polling.

Ludovic Barre (2):
  spi: stm32-qspi: add spi_master_put in release function
  spi: stm32-qspi: add dma support

 drivers/spi/spi-stm32-qspi.c | 182 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 163 insertions(+), 19 deletions(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
