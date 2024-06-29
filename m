Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCF7C3065D
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Jun 2024 10:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PSHzal0aK3bQqBZNTCUfaoNSKyyesTjeVHfx2YCML2c=; b=gyOku3jsgefwYQ
	fdOWXxCyIdaoQSH5wvnIQ7GbqVe0tLZCJz8bgyZzdJUEk6fAF2s8LcBDekxckcIceUOnwKS63ZnLh
	qe67moW9KcRU6u7EFU1Z/oTCz1DTvQpB9+7xSNgglEL5P83ElDwZ4mKoyvQdIT8jPkFuiwckqg98A
	epXHOkbNQp/JYeC6uyzyH6QnrELHoQhC896WboZV4a3jQ44NrUTsCENwJAqqrDknmyAP+fGvOnApu
	WGpBL3aTPTJgAwkOtrbtnk0uD9bC1UWx8V2uDIkbzrm+kOGc06Zw4kQcswTrrajcBm2tI29Kqx2gO
	HmApdB06qjO1bd3gz31Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNVUq-0000000GG4j-0SdK;
	Sat, 29 Jun 2024 10:39:56 +0000
Received: from chessie.fmt1.pfcs.com ([2001:470:1:205::234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNVUm-0000000GG1B-0rop
	for linux-mtd@lists.infradead.org;
	Sat, 29 Jun 2024 10:39:53 +0000
Received: from localhost.localdomain (unknown [31.16.248.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4WB82410BczMQLy;
	Sat, 29 Jun 2024 10:39:39 +0000 (UTC)
From: Erez Geva <erezgeva@nwtime.org>
To: linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Erez Geva <ErezGeva2@gmail.com>
Subject: [PATCH v2 4/4] Add Macronix SPI-NOR mx25l12833f with OTP.
Date: Sat, 29 Jun 2024 12:39:13 +0200
Message-Id: <20240629103914.161530-5-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240629103914.161530-1-erezgeva@nwtime.org>
References: <20240629103914.161530-1-erezgeva@nwtime.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_033952_274553_248D7EDE 
X-CRM114-Status: GOOD (  11.55  )
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

From: Erez Geva <ErezGeva2@gmail.com>

mx25l12833f uses the same JEDEC ID as mx25l12805d.

The 2 chips have the same flash size.
So user can use mx25l12805d setting with mx25l12833f chip.

mx25l12833f support SFDP and have a bigger symmetric OTP.

Macronix annonce the end of life of mx25l12805d in 2010.

See:
  "https://www.macronix.com/Lists/TechDoc/Attachments/9861/PCN31_2009 PCN_MX25L6405D and MX25L12805D.pdf"

Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
---
 drivers/mtd/spi-nor/core.c     | 1 +
 drivers/mtd/spi-nor/macronix.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0f267da339a4..6a5caa199978 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3799,6 +3799,7 @@ static const struct spi_device_id spi_nor_dev_ids[] = {
 	 */
 	{"at25df321a"},	{"at25df641"},	{"at26df081a"},
 	{"mx25l4005a"},	{"mx25l1606e"},	{"mx25l6405d"},	{"mx25l12805d"},
+	{"mx25l12833f"}, /* Uses the same JEDEC ID of mx25l12805d */
 	{"mx25l25635e"},{"mx66l51235l"},
 	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q512a"},
 	{"s25fl256s1"},	{"s25fl512s"},	{"s25sl12801"},	{"s25fl008k"},
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index f210231468a6..28ae6041fe8c 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -247,6 +247,11 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K,
+	}, {	/* Yes, Same JEDEC ID as mx25l12805d */
+		.id = SNOR_ID(0xc2, 0x20, 0x18),
+		.name = "mx25l12833f",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
+		.otp = SNOR_OTP(512, 2, 0x000, 0x200),
 	}, {
 		.id = SNOR_ID(0xc2, 0x20, 0x19),
 		.name = "mx25l25635e",
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
