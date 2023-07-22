Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C82EB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 08:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+rZx5TV/On9wB2uf4COx4hZHvxETnwVeCHlkUvXCbc=; b=l2iHLBDRO84ncE
	J5AKeJj1RSzCfD7N8G4kS2mNQfKGi4VV1nIbXYr8+MgxBBFMYkZsPKGcklT0FzE59M8/Q58ZYJ4S6
	NMishohNYiylvcs/r5tmm7RqctnVdjUh2ZslPd8CHP2I3ncu0Qk9eOFHsoLACobqaI3DAdtxmtkDp
	NyjpcSiNW6izNl67YZlszCpq2VMcfhe2dXzWR66gnXJv2W8K8q2+ukOUibMcG2/u5klod1U6vrvbS
	8sDiqJHtfLt9kJj2Cw9vBTmu80OOwpJrbQfFMstTVIZEidb2va16baRjh6ZSTNaUToux/wW47u4sZ
	oQqUXyRar+vQdDDhddxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8A4-00GA5m-17;
	Sat, 22 Jul 2023 08:40:24 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8A1-00GA4l-1W
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 08:40:22 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-986d8332f50so418883266b.0
        for <linux-mtd@lists.infradead.org>; Sat, 22 Jul 2023 01:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690015220; x=1690620020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9TJeEMNRCv2DgCOuJM1bBGc8b3D58xXpaHuqfHRQK8=;
        b=n4seZDY0bMuh9xp7Iuhq3UR77wpwNEpdbqlB0BPZwZI8sMBJ7tv7TzP8yy1rqhAe3J
         ZrRDdwZm1S+TLt7bVhibZWUffxysVi6BrgZRB+zkLUX5rO9t8DdMj1yfnWCilZyt6909
         1eg86o2EY0sxMgwzCFY/YMYlPmLARJT6UXdfKn3eNU7pdkQB1E7QVIarwst9Nlws2MBO
         QhupPqkXQdHZpM23yiyXDVwfOMuSzJ++tLcDXlxmaIQwRmeR9ZAg0X7TBLv/VsOL5XAa
         yNFKB6K6yxorxL4i1PUNiEy6YzYEBc64stVXvvz2yHasPWkiM7BouprLqk7h/EItfP7d
         I3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690015220; x=1690620020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9TJeEMNRCv2DgCOuJM1bBGc8b3D58xXpaHuqfHRQK8=;
        b=d4J9mPnSzB5+TTo7l+doVicZsMXRgJtAx7+y1ZZNrPHL+gUH8gAaPqdjj4iLZvwJp3
         FvODVZRE7vOXpRpl8jL2rMxkI6itwdKT7kguAKMg3xk/fDuT4Nu2clCwwbYHlmlpl/97
         BHlulDlvPR3SrBeKFe675U+yDmp0d1B4Rk+uuNLGQho9Kr+uKVXuBAffqGMOMKT2edCL
         8JfVUN5T/qMBIKKtItfXKGgbJhHsnucrdDb48OnL65PDDndX/VorAa3Tbweivn25XAIY
         Ye+2BvGzV2/jRyuxPkpCb6KHy3EmNfZnAUSoqzD+QUNBCCnmdjAXo8+FeSH2sMvxcNyn
         2NEQ==
X-Gm-Message-State: ABy/qLbaa/ZS4nFCNhJ8ZXIJW2GkOqH1P3udEipJ0T1o1g/7xu4D8t/o
	5sFOR5XP5sTtv61lse9heNd6eg==
X-Google-Smtp-Source: APBJJlF4lMl5iWQYQ/4JO4kw+zAmtEy7Y8ZV+haXiFSDaQ5Vdtk6DJHqYZ/wuPRGiL+IpYJYL/0U4g==
X-Received: by 2002:a17:906:3059:b0:994:673:8afa with SMTP id d25-20020a170906305900b0099406738afamr3849246ejd.28.1690015220231;
        Sat, 22 Jul 2023 01:40:20 -0700 (PDT)
Received: from 1.. ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm3253861ejb.84.2023.07.22.01.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 01:40:17 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 02/11] mtd: spi-nor: spansion: preserve CFR2V[7] when writing MEMLAT
Date: Sat, 22 Jul 2023 11:39:57 +0300
Message-Id: <20230722084004.21857-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230722084004.21857-1-tudor.ambarus@linaro.org>
References: <20230722084004.21857-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944; i=tudor.ambarus@linaro.org; h=from:subject; bh=kVZ7aQId7ERSbIGrhSxOKuGFZinAOtskWkM0179Q9K8=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBku5XjSIacWrtM6rqggQL3xW9NW3MgQizA9VFwu e+IRxfckVyJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLuV4wAKCRBLVU9HpY0U 6YbLB/45qZNj8nqPWcNS3Itsu5FdKDrhjLuejWXdzdmPSETVdxeQz58b4LPfXz+sOF1aqcEOUSL LOg0Lb3Od7CYJMV99JDgS8ABw5FOUFIi5KGBoniJ+fnuS9F8VSHsU+QT59CQ/RE7J4t4DZO2Lv0 WGAjIEzRmnPNJTeN5eOJEmgb62EJ8spSGmwuFgZmB2EBAb7fOlEVhqQ9HMGs/o438ixCJKD6Fwa xJmD1c6Gjy/uMn15C5yq72c8GHsHHmQ6YcN6u+MnJ+CDtQl5806ib/dfeoAprNBYazjB82cP8Xn FnfEVTsgxAH/DnIBtVBhEYNoROepT57/DyxonpJISVr4mWnq
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_014021_513060_317191AC 
X-CRM114-Status: GOOD (  11.40  )
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
index 6b2532ed053c..6460d2247bdf 100644
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
