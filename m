Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8153EC001DE
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 15:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rQ+MPoIrA4tvMpWBF2AmlQ+wi0YC/KBM/MzAFprzWTc=; b=4PpkR3jzQfXaDW
	x3AVQ+i7xZmuAyPmapa74x1VvmX84bA0F9Vcnr7VZ750GjKIEdQ0h3pXRp9wUGQ8uZQXbPxNj0blx
	FsfpoxR7K78ItGWUGhtG7HQw686KswloYMaTG8tGv7F4KvHSXpCsmsP2ZZCFTXcBvTvlXRGGr4ppA
	YfPy4dz9K8j1O90O1dH+yh92LcaZB7YX2UKO0cfJm/3PS3SknweN9TB5XOB0c2onySBy706pioyLf
	DZFwpG3enA47dEBMF0sedWcz7lx7o0fSOf6s2irBYgK1nRWlYgC48qxH05joDFPOjMmwF+5HOI41f
	PxUa9T7K/Aywj3kVhBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPP5B-003oca-23;
	Fri, 28 Jul 2023 15:08:45 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPP58-003oJM-2B
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 15:08:43 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b962c226ceso33849551fa.3
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2023 08:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690556916; x=1691161716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DfYppoEpQrdUrZuOGiowedMyBgvAOJ+ROPmkKgYzwvo=;
        b=IncjLpyAsMyhYXLXrcSkFxluXG/sIm1wuQkDW7iAUjHCV6FTUN7yNYPMhrg5uSx8L3
         NZSN/YAyR1Nvh/cNuOlsxE62MuzKXEh1f+gC3gUv6drzlzCYNUAMzlNgRNo5Dl2qmuPZ
         vleE24eIb6XO34+TN4fX5Z4LXL6o2Sk+/uKJCfozzLrZlKx5j7mmszk9R17X2aYqkTVD
         AEf9Z8e7iYW/XJy4BxayLvX7BqELsSG0Ss1OHuo2EkdljOU95qQaNbDqJUzATuCPd9VP
         A57DERbToV9r/IKybcwlp2VsM/+6bHxYuOV0yaq55lp17O/Sj4CJW+PniXr4uvdEk0uf
         cI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690556916; x=1691161716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfYppoEpQrdUrZuOGiowedMyBgvAOJ+ROPmkKgYzwvo=;
        b=c47tR9gM43Fxh+IFOjwWXqCQbzO8fKMSYMDWP0/GJ8C+LFaaPBWKlYyaMzH63BoNCd
         FKRkYb1eAyJY+X0fkuLeQZmCwS3aKOrYAurqIE4cxW/n2hIG4oijrrHaa3bNOVxoDgRm
         CBsEYkrgKiZWtmmGCcN1912nGIO2ucuyIbOlXs0FBk/n0KSI4/1JDtPvl/PRxvLjI8xZ
         NaeooOBCJvB3ObKjMEx4mdhekNWUsGpWh1ouWoTnPFSf6wO4/3HtmFGvjNoaUf7bnU3S
         0bXgvEhs59NzAy1XHCCgW0DS7fefWNCRZOEXy9+Xv/xl3HfNaxGYbko1K3ZhWDgEr71p
         9kbA==
X-Gm-Message-State: ABy/qLbCOdwlvwP1xleiLw6f8dxKaozWCcrlumnrWhnVWyCyaxvZ9GOR
	6FHmvi6zmnMk5h6+b0xl0ss=
X-Google-Smtp-Source: APBJJlEB3CA5YQpmX6srbtFzn4YGXvD+B9oLPIkTdmYsmHE1AqdrEWucPzpSv2fQp0u+v6KWXxWNGg==
X-Received: by 2002:a2e:2e17:0:b0:2b0:297c:cbdf with SMTP id u23-20020a2e2e17000000b002b0297ccbdfmr2224696lju.1.1690556916294;
        Fri, 28 Jul 2023 08:08:36 -0700 (PDT)
Received: from bhlegrsu.conti.de (ip-037-201-119-179.um10.pools.vodafone-ip.de. [37.201.119.179])
        by smtp.googlemail.com with ESMTPSA id f5-20020a1709064dc500b0098669cc16b2sm2158016ejw.83.2023.07.28.08.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 08:08:35 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
X-Google-Original-From: Wadim Mueller <wadim.mueller@continental-corporation.com>
To: 
Cc: Wadim Mueller <wafgo01@gmail.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] SPI-NOR: Add support for Micron mt35x01g
Date: Fri, 28 Jul 2023 17:08:09 +0200
Message-Id: <20230728150810.205656-1-wadim.mueller@continental-corporation.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_080842_713233_03BFA735 
X-CRM114-Status: GOOD (  12.79  )
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

From: Wadim Mueller <wafgo01@gmail.com>

Currently only the mt35xu512aba and mt35xu02g are supported,
support for the 1G version is missing. This patch adds
the corresponding entry in the micron_parts structure.

Verification and tests were done on a custom NXP S32G2 board with the
mt35xu01g qspi nor populated

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 drivers/mtd/spi-nor/micron-st.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 4b919756a205..fe97583547fe 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -166,6 +166,11 @@ static const struct flash_info micron_nor_parts[] = {
 		MFR_FLAGS(USE_FSR)
 		.fixups = &mt35xu512aba_fixups
 	},
+	{ "mt35xu01g", INFO(0x2c5b1b, 0, 128 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		MFR_FLAGS(USE_FSR)
+	},
 	{ "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
