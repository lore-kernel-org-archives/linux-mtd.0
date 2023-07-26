Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAC8C0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+rZx5TV/On9wB2uf4COx4hZHvxETnwVeCHlkUvXCbc=; b=gXlYrF/thBhU9M
	90t6cOqFpR6TdzHr/IEciuhGGudXaVbXKmPNu8/RllHqMYORVfo2EdCPTFxRCRrJCYZCsI3fu7bDd
	OOPEBX9poyrCZ9O0J8tHuU+VfgApAozYyOBapTql+UrIC6ToSYzH2/m7H7+NGNMi9oQEpcLCy5+8O
	xpEYNhItXu85DAIyHxWEldNy4u9oRqyWzwjrUQ4BnyrxjYcAswDzMhsqyF+JplqOiiAPGVUSVxbXR
	CaTyWVijThV67aFBn83zR5Dw5jDe2Z0YG/peQvU4XaFug0tRC5hRHgsh2yvYYYnLv/F1iHkvKwRHj
	po2opz1u9fjRBb95cpMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKc-009UyM-31;
	Wed, 26 Jul 2023 07:53:14 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKW-009UvT-35
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:53:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fc04692e20so63747495e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 00:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690357986; x=1690962786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9TJeEMNRCv2DgCOuJM1bBGc8b3D58xXpaHuqfHRQK8=;
        b=pq4Brhj55ONYmo8UszaBri7HNV1FDePeR8ylO84tUQWnC1hEsyv2pej6cyTBETJXQD
         wGM/HNoMSqqxKkeNBKInkKlPysEn/Pv1FhMUeRcOIhu3UD8diovitZKQph8yEgOHVC9E
         PdOMG4qNqQHm5mTSx/uYKcomYZ9J4xkdBt3O5NA3ue9qhh2pyTtYsjYvB/pgE94oszlP
         aTEyES+NgWstAmIgOqT95rVsP6NvGYQ9qLroWIbjzjTiI3pnfErDZjeQrps3d2ZNdM2l
         D63AC0v2pVy2nU3zxtvkZ27WRwP2sD304/B6woWo1k4NfF67Gq6sdsJC1gBORzwqHJyu
         rmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690357986; x=1690962786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9TJeEMNRCv2DgCOuJM1bBGc8b3D58xXpaHuqfHRQK8=;
        b=d4IEChDJ9Wu6QMUFyEM/FnOjkrLMXeT/PJ/VrMDUYpSPjrE1g9nzFHACe2Ozz2RJ5e
         HAxX/Lau78Ws82ZAKieVo6FeTCR2Ker4PoyJgDR3Cgbve09N8I9cjtTAMyQDJVfyUoU6
         TefEonTFEo2peysv8zcR7zxoQ5HR3HVkhlJfrMyl9CeeaMedSzrruf26XVOXw6ez9feJ
         fswwGnwrD94e4qZ7JQP5h8OqhmUQdXR9WnLp+JhsAngl2E/7EPIzF7SRkZBTuVM0LfsG
         Z0awI37oJK8sQkf15iYRo4F0NOzSKnQ1oKS9iROmPjV2tiRSXEogi4Joy2Y2cHO0/yRH
         FCZg==
X-Gm-Message-State: ABy/qLYD3cyoKgK6TZd+xVllKnEAFwN1+zfQTxCF1y3V2HZbjW3Po0a3
	mSRGF8LxNUA6E3lpru6PWdimFtDCNtWQ+nyJtJk=
X-Google-Smtp-Source: APBJJlE3xLWWa4x2NUcgPXxOGOScoCjYHAfSUUOory2sLtH0JMctp8AXJ4TIsUaWGm4w9kkkgzOeBw==
X-Received: by 2002:a05:600c:2212:b0:3f9:b8df:26ae with SMTP id z18-20020a05600c221200b003f9b8df26aemr766600wml.34.1690357986164;
        Wed, 26 Jul 2023 00:53:06 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c260e00b003fbca942499sm1264346wma.14.2023.07.26.00.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 00:53:05 -0700 (PDT)
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
Subject: [PATCH v4 02/11] mtd: spi-nor: spansion: preserve CFR2V[7] when writing MEMLAT
Date: Wed, 26 Jul 2023 10:52:48 +0300
Message-Id: <20230726075257.12985-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726075257.12985-1-tudor.ambarus@linaro.org>
References: <20230726075257.12985-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944; i=tudor.ambarus@linaro.org; h=from:subject; bh=kVZ7aQId7ERSbIGrhSxOKuGFZinAOtskWkM0179Q9K8=; b=owGbwMvMwMXoHervvrRX5CXjabUkhpQDF657tM2J2u3zateCRqbvR/N9o4sVnHQOfA0s2Pm+w 138zsSYTkZjFgZGLgZZMUUWWSetU+f5TuTGyf67DzOIlQlkCgMXpwBMpPAA+/+ckoQ31xSlePsW SdUvdJtreiBl1928qPwPBxxn73n6JmVvsiZ3SsHGvSGWSS3XRNbw/C5V3bR338nN0x2mL/DLbEo RfcUm72IhOTfsM7+2B4Omq9j5P97d/X1OW8+WhJbJvdO69W+Z3ArWl+3Jbzb9XBzsV+EbrO2qYe Lxs1PkDYfB1BX+s+fGHZoSXNO3R6OrhV3sRtDvM7dvTjnuPtlBzTW58pF3y5r8NIu/rW1n57JKf eKq4p69vMAo8Fjrgcu6a46JcptVCooefnJYUF7w05Il5d0CniVBOS4fWjK7rY3Ewg/Wslkr5S91 7tzOwvNznbDed55S2+LfvzgvbFtluXPyvyqeD5tj/DgdAA==
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_005308_995360_F94A9BF9 
X-CRM114-Status: GOOD (  12.59  )
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
