Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE06ECCFA13
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2026 17:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Y/TvmGCyNdHG0KwdGcGEMepQ1aUrTZfYrbwuYVK5+U=; b=e3VyjAkx9VuS6Y
	h36AyUM2SOCL95m12K28xiES1CKhGA0bc/mkGqsamqUK/jxJWhBRHOtfWYJwT+5/tN+XSXSvlussI
	DOY0pYKCZf1i93dWkmFFhn3I545ylGfDkMv8I0g5VJw1Sghj1+9kT+8BxK4X3+A/HYz9gKHEwECKz
	Lg3ZbFDbUKlyjj6mOBHyLPzcfUkfzIPcS2w24GFSHlCSnJLCJATLrzzoQhmF4sgraL665xiTHF+As
	XWS5zVbx0WXFQdf/9hwJNJT4zxt1aDikGLrMmNt+TvC5P/gfR8koK8D0qYu0IcFyfOizkFJWi/W2q
	Yb85zjmz3U+PdB5F1kAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9BN-000000041Tc-2wKr;
	Wed, 29 Apr 2026 17:58:45 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9Ay-000000040wf-0uN6;
	Wed, 29 Apr 2026 17:58:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 38FA24E42B71;
	Wed, 29 Apr 2026 17:58:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0CCFF5FD43;
	Wed, 29 Apr 2026 17:58:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C0971072B171;
	Wed, 29 Apr 2026 19:58:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777485495; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=djNQC+WiehgbSjZPUHPGAOR2nkZcZmEr0KjHIcYf3t4=;
	b=NmSZF+iWjEyn2SmSbXR4+EkHCCLdjDtILUG9X51p5SCiphlxZnjKNNGhMMDdv6+IE8Z0pT
	ASIHf/oK5ins8abEGkf3OT/DpAh4+l/rTkVjcESvNc56zjX3c6MzBilErApZ2Bhx8qWhnA
	q4skr5wiZcq3mmwHq2jiVNGW1mYCJN/tNbDh2F3BzrrvyfD4fdGmhsSID0jKhhjNOiGAz6
	jJJPYq8QKvuUtagfzMs9+zJqCAJairETws7j+Woa85G71iDosgPBr85dnsTyIGKlD82Shb
	llYfvCKlpMGTCJF/Xyt0qdAzxC71iYXH4L/FxQpv9jVgln0FJY4chh9edS6YQw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 29 Apr 2026 19:56:47 +0200
Subject: [PATCH v3 10/11] mtd: spinand: winbond: Create a helper to detect
 the need for the HS bit
MIME-Version: 1.0
Message-Id: <20260429-winbond-v6-18-rc1-cont-read-v3-10-0f38b3c229ad@bootlin.com>
References: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
In-Reply-To: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_105820_487417_E9A1875B 
X-CRM114-Status: UNSURE (   9.62  )
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

The logic is not complex but might be reused to cleanup a bit the
section by moving it to a dedicated helper.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index b30a343a6672..ffbcd25b0366 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -421,30 +421,33 @@ static int w25n0xjw_set_sr4_hs(struct spinand_device *spinand, bool enable)
 	return spinand_write_reg_op(spinand, W25N0XJW_SR4, sr4);
 }
 
+/*
+ * SDR dual and quad I/O operations over 104MHz require the HS bit to
+ * enable a few more dummy cycles.
+ */
+static bool w25n0xjw_op_needs_hs(const struct spi_mem_op *op)
+{
+	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
+		return false;
+	else if (op->cmd.buswidth != 1 || op->addr.buswidth == 1)
+		return false;
+	else if (op->max_freq && op->max_freq <= 104 * HZ_PER_MHZ)
+		return false;
+
+	return true;
+}
+
 static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
 			   enum spinand_bus_interface iface)
 {
 	const struct spi_mem_op *op;
-	bool hs;
 
 	if (iface != SSDR)
 		return -EOPNOTSUPP;
 
-	/*
-	 * SDR dual and quad I/O operations over 104MHz require the HS bit to
-	 * enable a few more dummy cycles.
-	 */
 	op = spinand->op_templates->read_cache;
-	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
-		hs = false;
-	else if (op->cmd.buswidth != 1 || op->addr.buswidth == 1)
-		hs = false;
-	else if (op->max_freq && op->max_freq <= 104 * HZ_PER_MHZ)
-		hs = false;
-	else
-		hs = true;
 
-	return w25n0xjw_set_sr4_hs(spinand, hs);
+	return w25n0xjw_set_sr4_hs(spinand, w25n0xjw_op_needs_hs(op));
 }
 
 static int w35n0xjw_write_vcr(struct spinand_device *spinand, u8 reg, u8 val)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
