Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196ABC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jan 2022 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=izNPBAhLYaquta4nIkf4D9JkqzPzrwTwik+ljnxJr5I=; b=Zr87ZgYMrpv0It
	Vvejp98iM2Q8WjVthyR+huiJ7ArVAwM39THQoY4zqNeyXjf/a1Phu31CsyUfkzWnZTyHk6P1qqKjY
	Rx3XeHQrpf7s5pmwI/BAOzIrzAJ6Sg+IMUqlB0CdZTD7biTdFEVMKesn/5AnpJePuHZikY2CELihc
	wCM10lUkS6PEmvqueV2cKVjD8VrdpT2R9Lsm9MXOpeRxzF6GHtk/uYZkMrITdRkHZjahAWHatjKuI
	ZK9sIMNsFOSNWvvBHuddkGo4/4ascG7zX1mp4AJH1uoOSoUNijqXz7ROfZu/F4tDStmX9GyZigEYf
	lPXTo8riXQJm5eXMb3Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAYsR-00C05M-MA; Thu, 20 Jan 2022 14:57:27 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAYsO-00C042-Lx
 for linux-mtd@lists.infradead.org; Thu, 20 Jan 2022 14:57:26 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BD504223ED;
 Thu, 20 Jan 2022 15:57:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1642690642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KAK/CCTkkR4GNYWL05YGfvNU4qKumSuEfF/D9f/mP8g=;
 b=Er84q2/JwFi4hKoWf+lXNJQdDGmiNYw0QuFNNMeiOsGtdGTFtuiQA+O0eXCm/IwZI/W3Gk
 BH1AP06XJzFoPZv0Q6H9/4ArrcZeBZkui5k3HeV29ezZquat80GKFEoOVkVovWa4QB+pI/
 0kdmALz8j70b50C2Okm2qRe21dbCrFs=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH] mtd: spi-nor: winbond: fix the name of W25Q16JV-IM/-JM
Date: Thu, 20 Jan 2022 15:57:17 +0100
Message-Id: <20220120145717.3027624-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_065724_893847_456E25AC 
X-CRM114-Status: GOOD (  12.69  )
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

We don't include the package encoding in the name. Thus, just use
w25q15jvm as the name for this flash.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 93b537f4f0cb..3d91888882e4 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -52,7 +52,7 @@ static const struct flash_info winbond_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64)
 		NO_SFDP_FLAGS(SECT_4K) },
-	{ "w25q16jv-im/jm", INFO(0xef7015, 0, 64 * 1024,  32)
+	{ "w25q16jvm", INFO(0xef7015, 0, 64 * 1024,  32)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
