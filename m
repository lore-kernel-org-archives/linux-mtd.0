Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8F9C4BA2D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 12:39:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D58C3246A3
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 12:39:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WGOWLuqH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="J5g8ORUa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D58C3246A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pp5tdFc6VScqDm/JHlEYK3y5C9zQYBCjicIVLmIxUYo=; b=WGOWLuqHbECEQ0
	V4GOGj7u7VrY316VDuDVj6XFw65jP6zRqjloCcYhaKrjjzysqjzLins7xHjHqX6o57dCK2+HxokWh
	AC5xs94gOB7k4QJ05L10KXNwM7gD8q2TVo8v0eaPyCB9sGnBfrJgfGDf+brKgHBOrf90h66J1wAab
	Ls+XkSTTdHZgLClPMSEk0b4aDqZ4FZmtJmW/jnHCAgCOcZiB5NjaM9i7VFOCJmJJlc0WPIvVDxOII
	5shk2dBNBU3sMiuu81Z7dN7pJYTEVnxly60qkyX+N3rK+qJ2xWacd1qOjMumvrSDXYvTmjO1BlO4/
	F8Bb8yWK9uwUu5oEtEWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7IS1-00030a-2z; Thu, 27 Feb 2020 12:39:37 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7IQZ-0001hb-Pk; Thu, 27 Feb 2020 12:38:11 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RCbuKr117335;
 Thu, 27 Feb 2020 06:37:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582807076;
 bh=Z4xHzVimku6GaO/uJJfGUrX05MI6KgVNH9lyK1vuJOw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=J5g8ORUa0Uh8C9gatDxzoG78qgUFARSC6gCL1Io+L+FE/JwuvC+qu0faZo8uDTmky
 ddw6DK5xpdJAtZNyuy4j43amj94PldkNgAsUylQ6LRABCmC2JlAOIcAZz8rXLoTcJt
 G4LozC50Gcxz5fYfGFNcVCPLEfNUqYQfEU4j0ras=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01RCbus6127675
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 Feb 2020 06:37:56 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 06:37:55 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 06:37:55 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RCbnvO100207;
 Thu, 27 Feb 2020 06:37:52 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <han.xu@nxp.com>,
 <richard@nod.at>, <mripard@kernel.org>, <wens@csie.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Subject: [PATCH 1/7] mtd: rawnand: gpmi: Use dma_request_chan() instead
 dma_request_slave_channel()
Date: Thu, 27 Feb 2020 14:37:43 +0200
Message-ID: <20200227123749.24064-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200227123749.24064-1-peter.ujfalusi@ti.com>
References: <20200227123749.24064-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_043807_961447_AE272FC5 
X-CRM114-Status: GOOD (  14.29  )
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

dma_request_slave_channel() is a wrapper on top of dma_request_chan()
eating up the error code.

Use using dma_request_chan() directly to return the real error code.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index b9d5d55a5edb..53b00c841aec 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1148,20 +1148,21 @@ static int acquire_dma_channels(struct gpmi_nand_data *this)
 {
 	struct platform_device *pdev = this->pdev;
 	struct dma_chan *dma_chan;
+	int ret = 0;
 
 	/* request dma channel */
-	dma_chan = dma_request_slave_channel(&pdev->dev, "rx-tx");
-	if (!dma_chan) {
-		dev_err(this->dev, "Failed to request DMA channel.\n");
-		goto acquire_err;
+	dma_chan = dma_request_chan(&pdev->dev, "rx-tx");
+	if (IS_ERR(dma_chan)) {
+		ret = PTR_ERR(dma_chan);
+		if (ret != -EPROBE_DEFER)
+			dev_err(this->dev, "DMA channel request failed: %d\n",
+				ret);
+		release_dma_channels(this);
+	} else {
+		this->dma_chans[0] = dma_chan;
 	}
 
-	this->dma_chans[0] = dma_chan;
-	return 0;
-
-acquire_err:
-	release_dma_channels(this);
-	return -EINVAL;
+	return ret;
 }
 
 static int gpmi_get_clks(struct gpmi_nand_data *this)
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
