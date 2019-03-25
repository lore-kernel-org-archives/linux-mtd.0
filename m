Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9773C10F0A
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 17:02:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E04A20896
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 17:02:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uL3xhTjl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E04A20896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N0jKmS1Vw7WF8VlvKtuCixjvEBT16IhdVecoUtpnk50=; b=uL3xhTjl+y9HGg
	Apigup/IndkadzGLmCzRJfFHE35rj0azLuziCl8GvKRYmOMHz6yczJ5NEoOtLYotXmQ0F0pf687jO
	rw/wOe6dxXTcqlrLZ4JCjZ2jWM2CGF1gLlePuc0vCbR/RY1eux6uVU4QRi0nqatYzpj2tA9+a9OCT
	5JtDutXWBGdxF5JvqpMMGeHW/lD9MGyWOO0sLfIVeI3P5OJbJ6Sivt+mAWXaZFYuLoO6PV5DPBmaO
	rHjAlwL9hud7C65GISE+Kpm9TozOQbpdlinVz0EVFkDObFYeNVkYsnMLJFGedSUlOqQ/p1ZgDKvaH
	7QMXnG9ZH1+i368RWFtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8SzD-0003XJ-31; Mon, 25 Mar 2019 17:02:11 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Sz4-0003PN-ET; Mon, 25 Mar 2019 17:02:04 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2PGw2Is018055; Mon, 25 Mar 2019 18:01:56 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2rddhacy7n-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 25 Mar 2019 18:01:56 +0100
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C6C231;
 Mon, 25 Mar 2019 17:01:55 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3624E111F;
 Mon, 25 Mar 2019 17:01:55 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.361.1; Mon, 25 Mar
 2019 18:01:55 +0100
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.435.0; Mon, 25 Mar
 2019 18:01:55 +0100
From: Ludovic Barre <ludovic.Barre@st.com>
To: Mark Brown <broonie@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH V2 0/2] spi: stm32-qspi: add dma support
Date: Mon, 25 Mar 2019 18:01:38 +0100
Message-ID: <1553533300-29999-1-git-send-email-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-25_10:, , signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_100202_787056_C639649D 
X-CRM114-Status: UNSURE (   8.57  )
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

V2:
-fixe build error in patch 1/2 (move qspi->phys_base in patch 2)

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
