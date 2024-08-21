Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347DBC5321D
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 16:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5amwvypaOjWY7OaCXKNqEUAMBymrJvpVfCSxJeKC0mM=; b=szbXJ4KbvbIi8v
	fQBwCU8PXAI6gTCgcici88e0TwGneLLzci2wlHRW/FToUoVeaVcpo2aJY4hYqd3bIKzJHZNz4/OKe
	1h0bp6Y61A9ldV6e8quRMtpLPeMa4I9UkXZVN2VOaUh47MdsmmBNctwX7wP6pS0M10kHPpRQ6yM1j
	TzMPnTRN7mxLF82dYrr3K40f3/4ETOa5YhoglacsN7606we01YN5drUiaJRXghdnKe0qlupzWqf1B
	fN9ueQqO2eRPoOAE/fEcMb3GV3yyU85rt5k95cX15pv8j7kpyt4/HmfwVwDH36Lr19m3GNXeslTGa
	S1APnQMfy51LsekqI17g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgo9W-00000009kMd-1rXQ;
	Wed, 21 Aug 2024 16:25:42 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgo9P-00000009kGp-1CQ8
	for linux-mtd@lists.infradead.org;
	Wed, 21 Aug 2024 16:25:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 567901BF20C;
	Wed, 21 Aug 2024 16:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724257533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cYbmshYnvet/JiabjlqxkyvV0iyBR1gnH02mnefGWtM=;
	b=aoQ/9OwZccYasRvTxJJ4T8CHYBD6Ejwpbs4RF9p5YIU15pqPHoCHdM+bhZ8vlPiefPxJWX
	StDNHupEP4wHDp4b11aj4/cIrBXRH74TjQFaY898q83lenrW1FAVkWIxkqePukwZaLe3q0
	LtP7GObC3+V3/bOIYhJU+Hik2hCQ+tvWNtFyGxP3b4hesZ8PcuxsgM3lhH29bb5Lw6UZIT
	czUsR+QrAssJiDHzZczyuWHpz5mHBW96WaN3HSEwQAmeMuc2YCvJsOcYO/q2GN7vz/W3Om
	RrrXI+oqPqSZ/g+ARb9FHCKaYHzAyY7IVPS2iHtOSlA6oxKFv8RQhGQNpXLkMA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 5/9] mtd: spi-nand: Expose spinand_write_reg_op()
Date: Wed, 21 Aug 2024 18:25:24 +0200
Message-ID: <20240821162528.218292-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240821162528.218292-1-miquel.raynal@bootlin.com>
References: <20240821162528.218292-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_092535_626464_A40C1571 
X-CRM114-Status: GOOD (  12.08  )
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

This helper function will soon be used from a vendor driver, let's
export it through the spinand.h header. No need for any export, as there
is currently no reason for any module to need it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 2 +-
 include/linux/mtd/spinand.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 964c9035fdc8..b7518f0f7d71 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -34,7 +34,7 @@ static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 	return 0;
 }
 
-static int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val)
+int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val)
 {
 	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(reg,
 						      spinand->scratchbuf);
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 8a335a3ad073..228ffda8b50d 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -527,6 +527,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 			   enum spinand_readid_method rdid_method);
 
 int spinand_upd_cfg(struct spinand_device *spinand, u8 mask, u8 val);
+int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val);
 int spinand_select_target(struct spinand_device *spinand, unsigned int target);
 
 #endif /* __LINUX_MTD_SPINAND_H */
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
