Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106DECCD199
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Oct 2025 06:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UsmLqZPe8eHeVEj74ATkT4jHMuMIO4NPhMZ1s9OkMBM=; b=TjYxRjzhXWOFIp
	y4RPdmMZwjcFWlD7WOzWlT5iIHRv9zD4QUFhv3lcctEpZ+q/5X77ytjWGqcGtSxvf7xrOry6H5dyy
	RcyGCDe4nESeI/3JuLyEdF/U0psmCn4j9F5rxZvaQjSrmqjsJA1XOGTSPa74zw7t1JFKrHPxdst1u
	woSdDrtWoVxNftmyHU4AYArRla9gZ4Vkvl0aY0zDSlA29ThQb6blu5k8ToH6StKlkGK77R4atbAZt
	XokitHf7tp592xyogWz8RXZ4bz6yokhVwDaxL78slTma89Yh0haP8ZXYV2TUpc00IPIOWb2fDE8t6
	IdJPfRltwvetMH8ZhupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dbB-00000006gvb-0zps;
	Fri, 17 Oct 2025 06:05:57 +0000
Received: from mail.sinic.eu ([168.119.168.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9db8-00000006gsE-2PV3;
	Fri, 17 Oct 2025 06:05:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9DE33F16A;
	Fri, 17 Oct 2025 08:05:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sinic.eu; s=dkim;
	t=1760681145; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=EocX1a7XiC78SMAYfzWXkhpGeubPEEt2A4XDo0VaZcA=;
	b=Hw3uwCPs1UQdiaNMQhs1zky1zGH48CNcvQN0aGRsmpFukdSlNUX9Chfw2F1215QZmmVtkR
	EJILPv0rZPGdui26N3lEF/xJ3Pga+Pp9m3bGBVqPwQqXPXRbKnsmH3oxaoFeflzAGJ484q
	+HIUtz1coJTBXF6nX2+k3qoL/MJSTRJqLF6rPxm6+8aVhzWTi1eJ8r3JfaK34ZXBIe7eFT
	v/54CbUf8SyI+SZ7rJF3DRTbDbSr3vOcOJJlU6c4lheo52kCQCZJxqBCGtm8Zyiyh1oHMy
	33My9i3B5tnzl4UfPxCpS59vp6FpXtyhn+gyjpQkC+NOUtBjXLCnsuw+YpaubQ==
From: Simon Richter <simon@sinic.eu>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Simon Richter <simon@sinic.eu>
Subject: [PATCH] mtd: spi-nor: atmel: add at25dn011
Date: Fri, 17 Oct 2025 08:05:29 +0200
Message-ID: <20251017060529.21169-1-simon@sinic.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_230554_775934_1B1F7B6A 
X-CRM114-Status: UNSURE (   7.75  )
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

Add AT25DN011 with 1Mbit.
Used on multiple custom boards and tested with this patch.

Link: https://www.renesas.com/en/document/dst/at25dn011-datasheet?r=1608506
Signed-off-by: Simon Richter <simon@sinic.eu>
---
 drivers/mtd/spi-nor/atmel.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 82c592f0a1e1..0c2908bce0bc 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -171,6 +171,11 @@ static const struct flash_info atmel_nor_parts[] = {
 		.name = "at45db081d",
 		.size = SZ_1M,
 		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0x1f, 0x42, 0x00),
+		.name = "at25dn011",
+		.size = SZ_128K,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ
 	}, {
 		.id = SNOR_ID(0x1f, 0x42, 0x16),
 		.name = "at25sl321",
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
