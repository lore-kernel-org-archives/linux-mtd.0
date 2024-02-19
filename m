Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF06FC48BC3
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Feb 2024 14:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rv4rrh08VNfWnKUECFmb1CebYxjN1cc55u9WYi+X3rk=; b=2IscbbPEN234MH
	V2tRKcuRstXzKK/kpoTXdxZawIaQM4fcjRiwTN8DiMoAWARGnLb7VNxSqQWAXyZwe7QUxSWDD8eIn
	hl5qutQaWzatuq3PzOpICA1L1kQMBa73P1TgZXSV4bTSyr1QHTecP86AT9U02lNeh55lH4b57Nnat
	ROh6oKROuIuSGdefzLe3huf4j2kUVklpXt1hzp8DT7/Oxj8VZttyi5Kl7rakiVrv3ddgBGnJlCC/d
	5W5e45RStK6BYySN/umEvAdnEvR9B3XJYVqyKTSQOdVaVelhytFz4CRwPvElqGELxoElZ1kkSOmcE
	HKjqTrOaqCVMDGIRKLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc4Hn-0000000Alda-3IN9;
	Mon, 19 Feb 2024 14:06:23 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc4Hj-0000000AlcE-0qxF
	for linux-mtd@lists.infradead.org;
	Mon, 19 Feb 2024 14:06:21 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41J9TEVB008714;
	Mon, 19 Feb 2024 15:06:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=selector1; bh=yFRkBHM
	ELWMAJ4eYruQiX4W19nuUNwDsJhqaDX8WO6k=; b=CwY0wRZsPMwx/gPCla0+Mai
	jI1r4KRfzqINlSZKMM3ZOlEbkz3YWE+Ui2Xf+rFvSH5sI+Sh8D0cZVEyN633iPdj
	WbKQvtxvW4jNBfnugRWC7xfg1fCgmmNzcu8M7LnHAKFZmuXTfez/Doksdvj7MQEe
	WNXo6yzsXobn6a1PCWJPZwc/UC41u50ZmrCDpAEG8DYZaPqTYa7Ww8bMfuaAx78z
	JtxMH/PTsK2cXqDFx5x3+vjpCr02v3Ct2O2HJhYo7WgrhoSlXty/OrTTRx8ENA6z
	5M/hxkgBjaAWW4gYqXNaWzWocUbSvpDxxIyqWPD/APHmipsPTNYny5URr3wXtUw=
	=
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wb784d40h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Feb 2024 15:06:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7BB4A4002D;
	Mon, 19 Feb 2024 15:06:04 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59B8426A995;
	Mon, 19 Feb 2024 15:05:24 +0100 (CET)
Received: from localhost (10.201.21.177) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 19 Feb
 2024 15:05:24 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>,
        Christophe Kerello <christophe.kerello@foss.st.com>
Subject: [PATCH v2 0/3] mtd: rawnand: stm32_fmc2: add MP25 support
Date: Mon, 19 Feb 2024 15:05:02 +0100
Message-ID: <20240219140505.85794-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-19_10,2024-02-19_01,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_060619_550272_0BDB9949 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
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

FMC2 IP supports up to 4 chip select. On MP1 SoC, only 2 of them are
available when on MP25 SoC, the 4 chip select are available.

For MP1 SoCs, MDMA is used and the max burst size is 128.
For MP25 SoC, DMA3 is used and the max burst size is 64.

Changes in v2:
 - dt-bindings commit message has been updated.
 - V1 patch 10, 11 and 12 have been squashed and reworked.

Christophe Kerello (3):
  dt-bindings: mtd: st,stm32: add MP25 support
  mtd: rawnand: stm32_fmc2: use dma_get_slave_caps to get DMA max burst
  mtd: rawnand: stm32_fmc2: add MP25 support

 .../bindings/mtd/st,stm32-fmc2-nand.yaml      | 25 +++++-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        | 83 +++++++++++++++----
 2 files changed, 93 insertions(+), 15 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
