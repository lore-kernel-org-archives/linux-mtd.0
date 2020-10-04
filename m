Return-Path: <SRS0=8K5C=DL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F2EC4363C
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2020 21:33:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F35B5206DD
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2020 21:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pkiBB3fr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F35B5206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=biot.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=voBwTLRhokGUJ4CfCger0B+kw2VmVlvgwWXZ5HvQBg0=; b=pkiBB3frOzyAfdb+hA+BGZnNgH
	ZEPPJrKm3+bjDE+ekL9/Rl9Pd5dGkCIPCB5XN7aAz+OGo/fQBUmMPMx1Rlbpyj/OqElPTYwanMATn
	EbQQ3HuERPYgBAzD9CAoCgaEBpAzSVEivF9kBLsmgrOJ+HOGQRFBINXRABGEn01egGUje1IXB265c
	KMFQMLhmoMHIyJuz9bHXs75xiWiL4WtQRf6vKkUz4EXStgwYXJWrnUxvlrkRYa8rmZmhrhd3MFlg9
	g78Il+pc/tDQuH4eZe3Cl1QnXIRkaKJEm3OmBqABGSQTaqBHYE4T/nYYqGTpMVDNem37/TJDvlaQs
	2UPUqLGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPBcL-00027L-6H; Sun, 04 Oct 2020 21:32:29 +0000
Received: from yawp.biot.com ([2a01:4f8:10a:8e::fce2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPBcJ-000272-LC
 for linux-mtd@lists.infradead.org; Sun, 04 Oct 2020 21:32:28 +0000
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
 (envelope-from <bert@biot.com>) id 1kPBcH-00EAG7-Op
 for linux-mtd@lists.infradead.org; Sun, 04 Oct 2020 23:32:25 +0200
Received: from [2a02:578:460c:1:1e1b:dff:fe91:1af5] (helo=sumner.biot.com)
 by yawp.biot.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <bert@biot.com>)
 id 1kPBc7-00EAFT-Sx; Sun, 04 Oct 2020 23:32:15 +0200
Received: from bert by sumner.biot.com with local (Exim 4.90_1)
 (envelope-from <bert@biot.com>)
 id 1kPBc7-00031a-KE; Sun, 04 Oct 2020 23:32:15 +0200
From: Bert Vermeulen <bert@biot.com>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: Fix address width on flash chips > 16MB
Date: Sun,  4 Oct 2020 23:32:04 +0200
Message-Id: <20201004213204.11584-1-bert@biot.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_173227_711186_AFA09572 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: Bert Vermeulen <bert@biot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If a flash chip has more than 16MB capacity but its BFPT reports
BFPT_DWORD1_ADDRESS_BYTES_3_OR_4, the spi-nor framework defaults to 3.

The check in spi_nor_set_addr_width() doesn't catch it because addr_width
did get set. This fixes that check.

Signed-off-by: Bert Vermeulen <bert@biot.com>
---
 drivers/mtd/spi-nor/core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0369d98b2d12..a2c35ad9645c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3009,13 +3009,15 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
 		/* already configured from SFDP */
 	} else if (nor->info->addr_width) {
 		nor->addr_width = nor->info->addr_width;
-	} else if (nor->mtd.size > 0x1000000) {
-		/* enable 4-byte addressing if the device exceeds 16MiB */
-		nor->addr_width = 4;
 	} else {
 		nor->addr_width = 3;
 	}
 
+	if (nor->addr_width == 3 && nor->mtd.size > 0x1000000) {
+		/* enable 4-byte addressing if the device exceeds 16MiB */
+		nor->addr_width = 4;
+	}
+
 	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
 		dev_dbg(nor->dev, "address width is too large: %u\n",
 			nor->addr_width);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
