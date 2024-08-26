Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954C0C5321E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/7dxXnfnpVwWMbKj+/t70exbqB+JhuFNK9FYvFwYoY=; b=FN7QxjM1GHuBb7
	CBF7QmdararLbXJOomWn750Gpp12vzAdNniwMTLlE004I2hzSZhaHX5pLlas/KOohkSQCcZRwCnCn
	W826zvtUNygbIvwvIEsOJ3a4bCSN0/PUoD02SpeVXLG+/v3Nl63T/ts9R7SBt/YQVHKtIl9rgaVHP
	RcqAk+9oLSQNa5kFdCK8OP39Rg60Z8/1A0sWZphC7OuP/SANP/VQbDMdsdA0syL/nZoz0GNBdc+2n
	Ksk4xnIlQRzVb13Dv7yrcZFKXvJEuVQoDF60+auOHS2u4ndPH6ZPYogSfhLYSXCrSIuZXelec4b5K
	fvMdlIzhR/1+ypi29Z4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWls-00000006t4T-1DNB;
	Mon, 26 Aug 2024 10:16:24 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWjs-00000006sLk-3DGe
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 10:14:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E58611BF20D;
	Mon, 26 Aug 2024 10:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724667259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wIgnowZ/49c3eQMlQ/C2BuiZ82Ql4AyDD5dlsLgmiZU=;
	b=LYLev5uSILo3dQdahC/vBbbgTW2h75DJ8QmW780XUOv4hMJiDbv0QQPqsXKcFSBhZ1hEGz
	Jk9ystAUywscUWKsPiK0o+UN7aShIh4foFy+2xMmvgiXkJ5lYeYKuD2c/7KBK6g7gnOnou
	3GnOeMnVdssDHNEyPb+2PQtYjo0qxP6whuGMZwQ9M4mTe34AFMtNJAtL5dmgmw7YGI70T8
	WoOWVv01IxC6UySrn0gMVLwiKt/S3ClzqKBDHMTqe2fexoED/3CkzrAOvXFnmb33/3j3/k
	+wbafoOprtZmpPf/9IlE0H5GEvHkfMhTF4jj9bWQal8zwScvLIsW6XfpmLdZsg==
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
Subject: [PATCH v2 8/9] mtd: spi-nand: macronix: Add a possible bitflip status flag
Date: Mon, 26 Aug 2024 12:14:11 +0200
Message-ID: <20240826101412.20644-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826101412.20644-1-miquel.raynal@bootlin.com>
References: <20240826101412.20644-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_031421_050849_361A14E5 
X-CRM114-Status: GOOD (  11.02  )
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

Macronix SPI-NANDs encode the ECC status into two bits. There are three
standard situations (no bitflip, bitflips, error), and an additional
possible situation which is only triggered when configuring the 0x10
configuration register, allowing to know, if there have been bitflips,
whether the maximum amount of bitflips was above a configurable
threshold or not. In all cases, for now, s this configuration register
is unset, it means the same as "there are bitflips".

This value is maybe standard, maybe not. For now, let's define it in the
Macronix driver, we can safely move it to a shared place later if that
is relevant.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index d26e8a8c5850..a4feeb030258 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -12,6 +12,8 @@
 #define SPINAND_MFR_MACRONIX		0xC2
 #define MACRONIX_ECCSR_MASK		0x0F
 
+#define STATUS_ECC_HAS_BITFLIPS_THRESHOLD (3 << 4)
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
@@ -95,6 +97,7 @@ static int macronix_ecc_get_status(struct spinand_device *spinand,
 		return -EBADMSG;
 
 	case STATUS_ECC_HAS_BITFLIPS:
+	case STATUS_ECC_HAS_BITFLIPS_THRESHOLD:
 		return macronix_get_bf(spinand, status);
 	default:
 		break;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
