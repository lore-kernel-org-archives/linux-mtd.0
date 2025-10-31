Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C431CCFA02
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lhoMUOyW/E6mICHW98PiClPH+5rdA4wndfOSwfAkY4=; b=pQMP7TzyriMwBo
	19PDfNBUV0R0P5l8pcVvK7n0Ae9C/LjCqy3Rjsd4XZcWHiAgnn0mysxxjS5h1Cr6jWu0Qq6m/66Ly
	RXpLuWo/VBiF38v3+U20K7p4VtqX22G0KEmsCxmJmiNxOnq5IPOKzKJFEsd2oPJs6gpi7QcR9b4f7
	3e4/tSeakGD/D07XuKod9vONsOFPVsFwPr9NwKmQ5mmnZx4It2gEyA/w8aFP07nabQquSJCovS5ys
	OX73T5evXhS4btQz38APE5TTdUF8TJ2jMHABqWJJB9cXCOsWqH3/oklhXltEWnQmsF/uf+PIPX/GK
	w1++yWq9azwxfYNYmsyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvX-00000006UVk-3XXQ;
	Fri, 31 Oct 2025 17:28:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvF-00000006U95-2DBO
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 001311A17C2;
	Fri, 31 Oct 2025 17:28:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3C1260704;
	Fri, 31 Oct 2025 17:28:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E3CB11818466;
	Fri, 31 Oct 2025 18:28:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931699; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YMq2Oulid+/ZQVRpF4JkTbc5d0mnCd8cN+kKX2PYD7Y=;
	b=qPsj2AdSwefrttBWTwJ1ayqmRCPISo0cpeRtPiZQNG94IkZbwRoSwb56jEVqoTDePSuj/v
	dqx8EmWFclZbh9bkRk2OcjdD+lz96eweN42MuDNrsCQd/de+kbrc+/TeyAezKeHPg0Q6Xy
	PGy23q9AfTRxd9oPCpXyiB21cPRBdpPihzKYAjkgkvut03QlsQ1PwZi9zHUZ+ocJbrAHG8
	xgyevXzS5Qw4oBNf5Z8WlZ7OYOge6f7kv8rBexL59N1xTdkkkSsx8gT+ohadd675AXODwK
	8Iqcaz7E4p8JJdehRIpMuGkGfXFhzPaLWY9pghjLT8YzwWU8rFLcXSuKoxzOyw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:26:51 +0100
Subject: [PATCH 07/28] mtd: spinand: Use standard return values
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-7-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102821_731683_29995FA4 
X-CRM114-Status: UNSURE (   8.52  )
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

Replace -ENOTSUPP with -EOPNOTSUPP which is as relevant in this case but
is standard.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 9d4e82554dab07b676632155ae94a706cf1177df..e6ff5706a65bdd300ce5945846749afa59b2f12a 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1418,28 +1418,28 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
 		if (!op)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		spinand->op_templates.read_cache = op;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.write_cache);
 		if (!op)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		spinand->op_templates.write_cache = op;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.update_cache);
 		if (!op)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		spinand->op_templates.update_cache = op;
 
 		return 0;
 	}
 
-	return -ENOTSUPP;
+	return -EOPNOTSUPP;
 }
 
 static int spinand_detect(struct spinand_device *spinand)

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
