Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A748EC636D3
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 11:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cIxzTdRG5zszQjvwDrc7tqQxRktEsjAbY1GhoJ3ahnQ=; b=S8OUEY4tVB3wwD
	6jvcQU0PfQ36FyUKSb7oq8eDUK/wE0oPpVlEMCisIe4AMKhkdcBMiWiQlfCkUIiRsPil6sSyQ9287
	5WjTbUf/Nvam5yyLtCyRYQZ7T9hE6kQkDmw6N5bHJFqXgSXSeOqcGOt8ABWlEWnL9Ti4Cjghp7Bb9
	Bw8DPTAB26UCZv8jO9qQk2mOcz6pmZeCe7YdsDvQzAf1QhFl5+AfjKLUZgKKZUYlJSK+FFmtuONIG
	eIE+6SEfH1XUxyytqyhS1r36b7dQNKIPoYqjqXCQty69br5ASuex2/1rWiF/SAg+LCEPNNm4rxQVt
	sOWVBaBoOlKPTNaCpZMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBU7-00BXut-37; Wed, 01 Feb 2023 11:41:03 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBPa-00BVKz-S6; Wed, 01 Feb 2023 11:36:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7E27B24000B;
	Wed,  1 Feb 2023 11:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675251381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UCz7ODIQVeSmkmmFzSlMwDmV1tQy3tFM45JPb30oVjs=;
	b=Is4UFilV21zvuEACvOfaYwqbJJmi+c26y5D6Gg/lTgC/yeXBz6iUCmc3BSi9zdVT40jnf7
	gULp9as279UIZSS3OH/oTlm+QliqvBgk6h6bO9CIctBstGOkL68TyfHoiz8NgPFKRovo+K
	qvKjw1zChfNh1v/RQ2mGicyebQAjZGnVUuMiNdR2WEI+xocWVLllgAI79IQMcTwl+y2nR7
	nSy8MvcXVfSCq6TH/jMaY6NAzKepPdJNSUn1Il9qacIS8/UjiyKjmRUXuv1ETyPiB1VU2c
	jGCBTRaL0rFH2sSVgYmFpDIQxGWoCMrt+GrpOfJV8P3rG0fgphHVn3TFJ/UBTg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michal Simek <monstr@monstr.eu>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 8/8] mtd: spi-nor: macronix: Add support for mx25uw51245g with RWW
Date: Wed,  1 Feb 2023 12:36:03 +0100
Message-Id: <20230201113603.293758-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201113603.293758-1-miquel.raynal@bootlin.com>
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_033623_084377_35C836AB 
X-CRM114-Status: UNSURE (   9.85  )
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

Describe this new part and provide the RWW flag for it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 6853ec9ae65d..655e7eec865c 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -82,6 +82,9 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx25uw51245g", INFOB(0xc2813a, 0, 16 * 1024, 1024, 4)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_RWW)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
