Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B45C4BA2D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 12:40:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E6C24699
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 12:40:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UzUrqpHv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QjZeglP3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99E6C24699
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/9JC2TYkrHYGncq773gkID85UYXGCSQKDYuuZgu92Z0=; b=UzUrqpHvkfXS8T
	FTpmGNWCy0tJVtAUtFtU+1UVUqU3t8/p+leBmZfFZErYA55K38L+1dzJyDVDM1X2vBKX6dIUhYTue
	+RH6evjDqhmWZyVpjQ6WFeq6N+4oiFHPhrvw3B420V1VRFXhQV40bJpk1cvXw1lt0iGhXlvhKEwb3
	kawJCROG82vmjCWEXOTGgzMGpTWWKoxoE3fVPd9jXgbmqWJnSs2txT7FzVzq8qI7NkiTuwZoHhEhM
	HtWBhbbNOufzWqV6CTpDx3iMuCMcmkESBhTn+nnhWLTx4uKF9EYPD6zFYjXO/lPJhxcV5IAUe2omv
	AFZOkf8xdb9A378yDIxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7ISG-0003HL-7q; Thu, 27 Feb 2020 12:39:52 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7IQa-0001ij-Ag; Thu, 27 Feb 2020 12:38:11 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RCbrEZ089743;
 Thu, 27 Feb 2020 06:37:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582807073;
 bh=N0ZTnsWAGol2AuTpDnmtxbZq6ogLFkSohABUVzcd+sE=;
 h=From:To:CC:Subject:Date;
 b=QjZeglP3AIt+Vfhur4e95S7ux4fT6vGQuuR59x4CU4MDfozKzCGK7gX6k01I/FJo/
 3B/CfbHDM8esY4J4EqdSOh0tSnxweSOHKtl/x15h1+3Q70VvdK4FV2gbbtoS0swBfq
 DZndI5YUx/MGSer6tbBQ1yeUzNCaEC1TmDZ1EQEg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RCbrsE130414;
 Thu, 27 Feb 2020 06:37:53 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 06:37:52 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 06:37:52 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RCbnvN100207;
 Thu, 27 Feb 2020 06:37:49 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <han.xu@nxp.com>,
 <richard@nod.at>, <mripard@kernel.org>, <wens@csie.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Subject: [PATCH 0/7] mtd: rawnand: Convert drivers to use dma_request_chan()
Date: Thu, 27 Feb 2020 14:37:42 +0200
Message-ID: <20200227123749.24064-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_043808_643833_7103286D 
X-CRM114-Status: UNSURE (   6.22  )
X-CRM114-Notice: Please train this message.
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
Cc: vkoul@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

With dma_request_chan() drivers can know why the channel request failed and
depending on how they are implemented can handle the failure in a best effort,
either deferring or falling back to PIO mode.

Regards,
Peter
---
Peter Ujfalusi (7):
  mtd: rawnand: gpmi: Use dma_request_chan() instead
    dma_request_slave_channel()
  mtd: rawnand: marvell: Release DMA channel on error
  mtd: rawnand: marvell: Use dma_request_chan() instead
    dma_request_slave_channel()
  mtd: rawnand: sunxi: Use dma_request_chan() instead
    dma_request_slave_channel()
  mtd: rawnand: qcom: Release resources on failure within
    qcom_nandc_alloc()
  mtd: rawnand: qcom: Use dma_request_chan() instead
    dma_request_slave_channel()
  mtd: rawnand: stm32_fmc2: Use dma_request_chan() instead
    dma_request_slave_channel()

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |  21 +++--
 drivers/mtd/nand/raw/marvell_nand.c        |  38 +++++---
 drivers/mtd/nand/raw/qcom_nandc.c          | 105 +++++++++++++--------
 drivers/mtd/nand/raw/stm32_fmc2_nand.c     |  44 +++++++--
 drivers/mtd/nand/raw/sunxi_nand.c          |  15 ++-
 5 files changed, 149 insertions(+), 74 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
