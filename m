Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079A6C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 09:38:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA2B1205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 09:38:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ynh7Rnnn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mY6XDesB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA2B1205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKuP8vzwRNpaBXVwqGcQgGms/xswwUhBenvuYOX9w6E=; b=Ynh7RnnnfS437n
	NZRpkNikQC/JsYL+ofSNPAfaeWJojVOGLu6AIOLTCipKSRAKXjJNJwdD6jrVd4q16v6ShwZvR+KRa
	pLrVvSr6xzd4v6l0siiEjfNaweO+5sh6nECapNRr/M2w0ut6iTMIBFBiTLn9gM5BYttvmvpGoD6Ke
	cWVlkUu3Ic7WMASN7Vcq8hGLgq9uBt9bLEnbAWTjFlIOB+vsl9wh2qWW+TKuS81voAdKqq98yy1cZ
	AAcud4VOsmspMk1IQjQ/LrFz++TVYt1DMJBnLcgeySQTb9Zcnh8cIvmaXvtEN4mjl+cgHcFr3z1pB
	UyPkTe8+lAOetdwyw61A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdW2K-0005xc-JP; Tue, 26 May 2020 09:38:16 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdW1e-0005HH-1L
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 09:37:35 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04Q9bTvC068729;
 Tue, 26 May 2020 04:37:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590485849;
 bh=/y4WWaA10maTxpJKiOlHRU9Z9YWAESF1eFGIjbiWFic=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=mY6XDesBpRrXK0a63EzQpTzcfvUmme7fHXo8HnXj8T5205n+bjX0N25jdu14n1bSO
 yDbU+khKPF4zqLXnx75AOYijwUAArdKIIhJyVwNicZfy/QJ7YmtFcaw15nclzkbaN3
 88uW8tKZPLygL0PXj20xC9+GvBfSD8YUx+aFHhUQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04Q9bTrf081458
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 May 2020 04:37:29 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 04:37:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 04:37:28 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04Q9b9hM066907;
 Tue, 26 May 2020 04:37:24 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH v2 3/6] mtd: spi-nor: cadence-quadspi: Don't initialize
 rx_dma_complete on failure
Date: Tue, 26 May 2020 15:06:01 +0530
Message-ID: <20200526093604.11846-4-vigneshr@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526093604.11846-1-vigneshr@ti.com>
References: <20200526093604.11846-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_023734_129219_A54889C6 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: marex@denx.de, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If driver fails to acquire DMA channel then don't initialize
rx_dma_complete struct as it won't be used.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/controllers/cadence-quadspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
index 8a9e17f79d8d..379e22c11c87 100644
--- a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
@@ -1180,6 +1180,7 @@ static void cqspi_request_mmap_dma(struct cqspi_st *cqspi)
 	if (IS_ERR(cqspi->rx_chan)) {
 		dev_err(&cqspi->pdev->dev, "No Rx DMA available\n");
 		cqspi->rx_chan = NULL;
+		return;
 	}
 	init_completion(&cqspi->rx_dma_complete);
 }
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
