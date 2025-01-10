Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF78E7719C
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXuOTSXEYzoXOossoaW513ZEInJzgJXi1YEmCnNSTcc=; b=dRy/ZdfR+kyU3q
	X606I0tkRQwkZ86QuaQ0uuvl4YLywAouZhPeccAK+hD+biGapsbjcNceVbxf/s/ryusNY6evbB18G
	YlBqAwDu2iTWty/VukzVvyWsNExipGkgn93+5dlME+/uxEnZ+fJTYcX5t/9F+Jlv7ie2fum+eZfKF
	itcwqHUYtIagzovn/dTQS3YPCIthRAdcjZoxylNfyCQXuQhybsF/ZAufrYIvkhPRvyOP4dL4N8Y97
	5BWhuvs2Q8UkeUktPygl5bQ2LxndvXy3vGNuSE/uyUoKCz5Dg61WS5vUJPToTUXKmpN/wfb+zUaks
	yUdiF4KDtedjN8Mk9w6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGjG-0000000FqU2-0LZi;
	Fri, 10 Jan 2025 15:15:18 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGGx-0000000FgOu-2Igd;
	Fri, 10 Jan 2025 14:46:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A47C0FF807;
	Fri, 10 Jan 2025 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736520361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqGs8PUET+BsGpw1lvBa5lHh5wRhBBbsSXm21QijbQY=;
	b=knxkeRs+zHJjSM4mur0EIav6g23HRoV1lnS4+lKJdZz5fYG2wByIPYx71fP8PFtE9m0n1+
	Lm5tNODPnNZG6BQWzHfBRhpwJlyk08XVMhzlHJS7Cg2uK9ESXuInSHhdj2CZzk4tbmCZSX
	p5yxJK3JQcjO9u4/0gB7gGiSjNt/GArPkCwrJ2E2DI9vFgfIVNtqJDmRBA700lhMrwk9Oz
	63srEcX99i9+LSSqmz3lsUHLvOzGs5hez3PUtpg16xQ3yPR8XABiVV2Hyyc5ype/UCIlNe
	NYtR0wrTL48JuM3smxZnH4XV4ekV59+bHA2Kgs0FOHyo3oR+TgD6AA5D9U7/SA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 15:45:25 +0100
Subject: [PATCH v3 23/27] mtd: spinand: Enhance the logic when picking a
 variant
MIME-Version: 1.0
Message-Id: <20250110-winbond-6-11-rc1-quad-support-v3-23-7ab4bd56cf6e@bootlin.com>
References: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
In-Reply-To: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, 
 Serge Semin <fancer.lancer@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mtd@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_064603_884858_76CC8804 
X-CRM114-Status: GOOD (  14.94  )
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

Currently the best variant picked in the first one in the list provided
in the manufacturer driver. This worked well while all operations where
performed at the same speed, but with the introduction of DTR transfers
and per operation maximum frequencies, this no longer works correctly.

Let's continue iterating over all the alternatives, even if we find a
match, keeping a reference over the theoretically fastest
operation. Only at the end we can tell which variant is the best.

This logic happening only once at boot, the extra computing needed
compared to the previous version is acceptable wrt. the expected
improvements.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 94f33c8be031ac60208e22e4e3fa0d90cfae093c..a2a8cfd1752139e3227fa4a39ab0e25bbeec53f8 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1198,10 +1198,13 @@ spinand_select_op_variant(struct spinand_device *spinand,
 			  const struct spinand_op_variants *variants)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
+	const struct spi_mem_op *best_variant = NULL;
+	u64 best_op_duration_ns = ULLONG_MAX;
 	unsigned int i;
 
 	for (i = 0; i < variants->nops; i++) {
 		struct spi_mem_op op = variants->ops[i];
+		u64 op_duration_ns = 0;
 		unsigned int nbytes;
 		int ret;
 
@@ -1220,13 +1223,17 @@ spinand_select_op_variant(struct spinand_device *spinand,
 				break;
 
 			nbytes -= op.data.nbytes;
+
+			op_duration_ns += spi_mem_calc_op_duration(&op);
 		}
 
-		if (!nbytes)
-			return &variants->ops[i];
+		if (!nbytes && op_duration_ns < best_op_duration_ns) {
+			best_op_duration_ns = op_duration_ns;
+			best_variant = &variants->ops[i];
+		}
 	}
 
-	return NULL;
+	return best_variant;
 }
 
 /**

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
