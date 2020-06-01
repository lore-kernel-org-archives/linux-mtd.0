Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7681C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 05:50:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F22720734
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 05:50:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I+Opn0/j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ix8IY9ZR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F22720734
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGIn3JPy1g0GevivlpY4GG7cpN3l6Q+b6AD386itTPI=; b=I+Opn0/jsVOCpa
	+FQtgrNFbiMcThiLKM1e1dUPd9uIsR6hyyFTD1BGKSHwxgKQtedU60dFpYHkvm3+HMDtlt/QaubID
	wTU+YrTIG9tUBvOqY6L7yFTUrkgJi69aU9Qzlz8rJx+reHkG0uTicr0TQs64AlLThrscYQd/yVzvV
	t7hlRbIcWOmChn3LMQYl7gQC4+z6oy76rRn5UoyaFrGQG/BoIELZ1KzhVnPCMQqg5WYu+Q8h6dBQo
	xI54/qNCZFCZkHBbM7iTyjuhXodmJ/yUFlrG4AnwPDYNblRN4cMgCNTdaCYXrPK/nNi/2SGMcQdyU
	eNlC3mvv4sIXEZ8wIFoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfdKd-0002iw-TA; Mon, 01 Jun 2020 05:49:55 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfdJ6-0001LE-KN
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 05:48:22 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0515lth2020332;
 Mon, 1 Jun 2020 00:47:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590990475;
 bh=Q9mpt5L2+tz9UJjcTocJbBwQDj4+9uQU3fRytRCiokA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Ix8IY9ZR+b9ycV8x5BFSbc6S/2e0D3rGebdu1A7ORLcpi1vOiHzvE+QhPHomshRbb
 rIi7t7svg2KHccDUUvYi4N+JR9RCeKAxA8o1WdsPP879wpukIUN5aByIFRjUSJDNlK
 c75VShP1a1DNxi0rDj17vosBbPeVEEo49o23/Fdk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0515lto7031993
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Jun 2020 00:47:55 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Jun
 2020 00:47:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 1 Jun 2020 00:47:55 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0515lRPm038289;
 Mon, 1 Jun 2020 00:47:52 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH v3 6/8] mtd: spi-nor: cadence-quadspi: Drop redundant WREN in
 erase path
Date: Mon, 1 Jun 2020 11:17:23 +0530
Message-ID: <20200601054725.2060-7-vigneshr@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200601054725.2060-1-vigneshr@ti.com>
References: <20200601054725.2060-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200531_224820_726921_D7B36F7C 
X-CRM114-Status: GOOD (  10.78  )
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

Drop redundant WREN command in cqspi_erase() as SPI NOR core takes care
of sending WREN command before sending erase command.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/controllers/cadence-quadspi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
index 0570ebca135a..6b1cbad25e3f 100644
--- a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
@@ -1016,11 +1016,6 @@ static int cqspi_erase(struct spi_nor *nor, loff_t offs)
 	if (ret)
 		return ret;
 
-	/* Send write enable, then erase commands. */
-	ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WREN, NULL, 0);
-	if (ret)
-		return ret;
-
 	/* Set up command buffer. */
 	ret = cqspi_command_write_addr(nor, nor->erase_opcode, offs);
 	if (ret)
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
