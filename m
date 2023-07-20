Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2411FEB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 07:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7rdHgT3v2JR195w8gOioWSerUQMoJNyZQM5tZp3MHE=; b=woVEHGXG3xBgG3
	CtcO/k646tzbatTSEmSxOCDnw2DlM0Vn44rmol5Nn9VJUCombOozIYQdh6BcReT+rAgWCz+cPHBqv
	Av7Nnl7AvNIKlvJDHND2Fb+HTLE8zaDzT7vYvKqWvEXidNgdZiqStAPmK4TbBVvfY5V/QGGtVKp59
	XC6xwB4ZgsM3Sef9No0WvMEKcnExMDOMBbtIRK4zasAFdgVs6da4jHZLgObAFFCsYwnwnByb4XFUb
	HUszXxyjUzA9u6SYpQcgo0k4MYEe3fT3aJKfdMFZq9yvI6VJ0GKTUiae3DFT4nuCaCFjb2J8lZxdB
	kwpavBoocO7+gt/bq+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNo3-00A4Vq-3A;
	Thu, 20 Jul 2023 07:10:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNnx-00A4OL-1M
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 07:10:31 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b8ad9eede0so3465015ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 00:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689837026; x=1690441826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZiOti2rSZYWbFsWA6OHv4fYxFNp7o8241gPXk8Ck/Q=;
        b=rqU1Na7VrWUQpawH3Invx0ALCoQ5EFfYxLPqnwK3A/L0VIEaGb+v7XVDCSPackKODU
         gFrBwqx3Okco8wd+JryWSeAlRucEnQ0d8z4b1LF6imYrmyxuyTMN0dE+EPM0VTcGsuS4
         ftpjrdCsLvRlH9wRKyzsm3KJm/vWcgUlPEFxEUUG+iAE93WK2F7EOizrYlQzcSysy1dE
         /W2wnBOItOIYwPHZgcaLk+CbJS9TjXL8cAff4KvEUhRQrrlYLaEOmGrelMitXt7vnJ7J
         9F3UbRd3p9lz0vxh1zSUoBC4drAGM425pLyZrHavoo4Iw2Gt4BzLFcgdYg73FhcgNtNw
         3wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689837026; x=1690441826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZiOti2rSZYWbFsWA6OHv4fYxFNp7o8241gPXk8Ck/Q=;
        b=ZvRLC99BVZx0naS2yvao7khZBHJ58ZmeakvPQWneTM6zkEKW/ChdtHeTyovHJXBVMf
         +hymSULFcTwGVHiO+o4PTA/cIiKt2ZQPDaFM0waEqyg2KlL8ZkqfDuH6h2MIq+KdQfR2
         kbcj/QUxq5aDrFWJKfBV3P2fgqWQ2ptsG0ygtp/GkNWQ/rW5Sl63xRuU9t6t9U188Ttb
         28lyb2u34kd9MFwRqriZyEm4H75qyvoH3wlzRLwDeci76o+1BqNhK3cjlG13EEMWbxEl
         9IvqAkTUqzrUDX7nHXESypn3Nq9vEAkJLX2qvOKA1wcYl1g6d/zkYWNmXV4kD7/oKlcT
         ukzg==
X-Gm-Message-State: ABy/qLZCtAeStPFo3Hzt259+FkMKJr3LHjejGNYlKOIb7iZPNR9pC3Ha
	r7ozTBCz7FhUBDwqrcoj5QorDCFNEp4=
X-Google-Smtp-Source: APBJJlEyvcd7oT4FKPciBjWLfXUhZlvCq1DIHB78hlMWM3DxEdynxfZ6AqxEaXV1TbFBqCDbR9CuNw==
X-Received: by 2002:a17:902:ea86:b0:1bb:3498:9caa with SMTP id x6-20020a170902ea8600b001bb34989caamr4586214plb.58.1689837026251;
        Thu, 20 Jul 2023 00:10:26 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm515821pld.13.2023.07.20.00.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 00:10:25 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/8] mtd: spi-nor: spansion: preserve CFR2V[7] when writing MEMLAT
Date: Thu, 20 Jul 2023 16:09:57 +0900
Message-Id: <a8e94532d0d64631e6068845e29c4eea273b2871.1689836066.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
References: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_001029_480402_4110CAF0 
X-CRM114-Status: GOOD (  12.78  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

CFR2V[7] is assigned to Flash's address mode (3- or 4-ybte) and must not
be changed when writing MEMLAT (CFR2V[3:0]). CFR2V shall be used in a read,
update, write back fashion.

Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/spi-nor/spansion.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index f40d4ede4093..8515f7e56715 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2014, Freescale Semiconductor, Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/mtd/spi-nor.h>
 
@@ -28,6 +29,7 @@
 #define SPINOR_REG_CYPRESS_CFR2			0x3
 #define SPINOR_REG_CYPRESS_CFR2V					\
 	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR2)
+#define SPINOR_REG_CYPRESS_CFR2_MEMLAT_MASK	GENMASK(3, 0)
 #define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
 #define SPINOR_REG_CYPRESS_CFR2_ADRBYT		BIT(7)
 #define SPINOR_REG_CYPRESS_CFR3			0x4
@@ -161,8 +163,18 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	int ret;
 	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
 
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
+					  SPINOR_REG_CYPRESS_CFR2V, 0, buf);
+
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
 	/* Use 24 dummy cycles for memory array reads. */
-	*buf = SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24;
+	*buf &= ~SPINOR_REG_CYPRESS_CFR2_MEMLAT_MASK;
+	*buf |= FIELD_PREP(SPINOR_REG_CYPRESS_CFR2_MEMLAT_MASK,
+			   SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24);
 	op = (struct spi_mem_op)
 		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
 					  SPINOR_REG_CYPRESS_CFR2V, 1, buf);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
