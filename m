Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235F5C4363D
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 13:25:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34083207EA
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 13:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hXWv1+Kc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34083207EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=biot.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Umj9KAi9WknrkgYPCRuL70JDHxnbxXAWt4MZZvCimNs=; b=hXWv1+Kcc0pNiYav4xhE5I7EfO
	v8hiuNYTBpjG6U8lwlJrsxX7aWbULlf9llFBg4b1D5jHm1ikWWo14zHOLBhVeMPe88uCQZeDcE27a
	Tgm6y39GAP4uIhOPP0e0cXI9ptlk/ueun1gDQ6Nc3as3qmGuWcD2odESVi65WQ9hsDOdNjuYVEynt
	LQOMAHNu5LGGeKoeT/Xfo/8EGuc1jOU2qJVf8jBQrWyOUy32hoxj5ClGKoOITPRjqYCdnxzbDGFrM
	QvyYYFpN2yYMetC0yEAHo+T4V4xXp3AVxWXc51S7wBHC/aPANNUIAKL7kYXb93wDS92VfiWSR5MH5
	9tfZAJmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPmwu-0008Nm-0H; Tue, 06 Oct 2020 13:24:12 +0000
Received: from yawp.biot.com ([2a01:4f8:10a:8e::fce2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPmwr-0008Mv-Ag
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 13:24:10 +0000
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
 (envelope-from <bert@biot.com>) id 1kPmwn-00ELnq-PG
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 15:24:06 +0200
Received: from [2a02:578:460c:1:1e1b:dff:fe91:1af5] (helo=sumner.biot.com)
 by yawp.biot.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <bert@biot.com>)
 id 1kPmwZ-00ELnC-8b; Tue, 06 Oct 2020 15:23:51 +0200
Received: from bert by sumner.biot.com with local (Exim 4.90_1)
 (envelope-from <bert@biot.com>)
 id 1kPmwY-0003Ip-Se; Tue, 06 Oct 2020 15:23:50 +0200
From: Bert Vermeulen <bert@biot.com>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [RESEND PATCH v2] mtd: spi-nor: Fix address width on flash chips >
 16MB
Date: Tue,  6 Oct 2020 15:23:46 +0200
Message-Id: <20201006132346.12652-1-bert@biot.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_092409_382693_F6A96EFD 
X-CRM114-Status: GOOD (  11.66  )
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

Fixes: f9acd7fa80be ("mtd: spi-nor: sfdp: default to addr_width of 3 for configurable widths")
Signed-off-by: Bert Vermeulen <bert@biot.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
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
