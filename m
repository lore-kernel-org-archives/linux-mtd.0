Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDDDC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jul 2022 19:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=on8ebDQp3m8mZAaOxr5jZo8lx5cX9sy+9Ltq/RgmKxA=; b=YEaekD0QUIpJXm
	ddl+DGPKZmESBXHH/Ao0wzx/ooOLfKWzT3wLUGKD1dxt21mMeakGkhYS4y8osst85P5O5sNSV2uLa
	5zEZ18Ejytbf90EDiBsM1GzEQsvoV2D4XJGs+u0O8dLqGoXhCPv6WCsH3UfT66EUzXDh5cTtll9/t
	A689JdH/pc0tvXfacQcbRqzXJ+U1FW7l5481wdM1xWE3J0/F/RBx2mrTS9t6xukofDEdpFApWGOBx
	1VlmysgQMx/BnUgv75hwV7ZOuG4hwPKnymFTm7A55ReG6g4b3q4ZQLeVJW2l173BX905OMpfdrdF/
	3mTU8s+ypwbe53Wj9CFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC4Nr-000LoJ-Le; Thu, 14 Jul 2022 19:20:23 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC4NX-000L9k-L7; Thu, 14 Jul 2022 19:20:05 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id C4D9234D34;
	Thu, 14 Jul 2022 19:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1657826396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=J1TVAvphNmTpAWW61VUw6mw/9ks964p5lRoXg8fT5pQ=;
	b=yaCt/W2pKkPFnDaETQRiTHkJCEF9k9sdkjq5JwaHQnawjSKoiYi4DI8vi/+Uw5d+Sul19z
	37o2WGZVI43rBZhYukzagHSaK4SmQbA7jQM9qetajPGOmDZ520FSpw9IloUNbGKlSSf9kP
	bRh46ZyDYQTdv+Zp8n1jh86KwnMJjmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1657826396;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=J1TVAvphNmTpAWW61VUw6mw/9ks964p5lRoXg8fT5pQ=;
	b=wngWGUvhjqDObMv9OkYHJzzRhkbc88uRRchYKwwT861i6KWlF4AscZVrctIi5rsYr2VauG
	Qs7ENmMlzAFzaQBw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id 80F252C141;
	Thu, 14 Jul 2022 19:19:55 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linux-sunxi@lists.linux.dev
Cc: Michal Suchanek <msuchanek@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: spi-nor: When a flash memory is missing do not report an error
Date: Thu, 14 Jul 2022 21:19:47 +0200
Message-Id: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_122003_882325_75317D6E 
X-CRM114-Status: GOOD (  15.18  )
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

It is normal that devices are designed with multiple types of storage,
and only some types of storage are present.

The kernel can handle this situation gracefully for many types of
storage devices such as mmc or ata but it reports and error when spi
flash is not present.

Only print a notice that the storage device is missing when no response
to the identify command is received.

Consider reply buffers with all bits set to the same value no response.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 drivers/mtd/spi-nor/core.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 502967c76c5f..6bab540171a4 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1652,6 +1652,24 @@ static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
 	return NULL;
 }
 
+static const bool buffer_uniform(const u8 *buffer, size_t length)
+{
+	bool all0;
+	size_t i;
+
+	for (all0 = true, i = 0; i < length; i++)
+		if (buffer[i] != 0) {
+			all0 = false;
+			break;
+		}
+	if (all0)
+		return true;
+	for (i = 0; i < length; i++)
+		if (buffer[i] != 0xff)
+			return false;
+	return true;
+}
+
 static const struct flash_info *spi_nor_detect(struct spi_nor *nor)
 {
 	const struct flash_info *info;
@@ -1666,8 +1684,11 @@ static const struct flash_info *spi_nor_detect(struct spi_nor *nor)
 
 	info = spi_nor_match_id(nor, id);
 	if (!info) {
-		dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
-			SPI_NOR_MAX_ID_LEN, id);
+		if (buffer_uniform(id, SPI_NOR_MAX_ID_LEN))
+			dev_info(nor->dev, "No flash memory detected.\n");
+		else
+			dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
+				SPI_NOR_MAX_ID_LEN, id);
 		return ERR_PTR(-ENODEV);
 	}
 	return info;
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
