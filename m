Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDA6C6FA8E
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Mar 2023 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G04aR734yutKMxdhAmIOYb1pPkSHbQyWyUjyle9iTso=; b=meGJ2q2wPY75RT
	yz8dmhzaVfKZlBJILGcoOGceFfvmCdf2DBp2Paz+5RZ7mDEK24eLp0S1uaroAklM5NJ68n0y+GCCF
	TS1c6xZb7QDCKLYPQybmYuv7RkFz+gK6hHNSNq/rElp2eRGGlJUmV6vKJIeHUdtQee38xO+pStRGd
	XeQufERha/reObLfZ9jh1XrQCWZ5FFhBjH10WQS99YguADx676d5ZnKN7I71UvmqcRRTh+boSa2iB
	bMgWTfn863HGdoySP0Rsyfh/o0ZrEk88aDweQdmB5SnoPKYGPkdUg8y6+sQd3A6AfpaeX66cMsgL2
	3vIC6Ypx1poku/Q2xx+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXdTL-0019A3-6q; Thu, 02 Mar 2023 07:35:27 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXdTG-00198m-R0
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2023 07:35:24 +0000
Received: by mail-pf1-x434.google.com with SMTP id u20so9521314pfm.7
        for <linux-mtd@lists.infradead.org>; Wed, 01 Mar 2023 23:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bac/RpBXYVxnDqXNA3EgO2xm1b59XlFbCd7Xvwt5ZTo=;
        b=Q7DVeBXwzA7EjhBDmaDm2/G77bRKpoPCAL55Y9HPWfu4wSmuS83liGyw69KN6k8bCS
         IoXuD5kLLXyKkAK/nD3+SkMv3qITq+ri6RWIJqOuDnlPReUoo4dF3Uf9Cp3UaLJYlVb5
         0Kf8mYF8BdA1oZTPmhxIcKCW2If22aDHKC967N9M97QX1zLGJQvqi5OHMpm1GQXDqp21
         JAsPPAbF4wnA/GVRZMzSbTumRAegArdopRe1ty3CYECSp6gH6YEIid6vPhNwq4yQvkcL
         OKFuD5Kuh4DcIflfQlpqAIJ5PTyA6U0dHyAbV9oFD8TO9FdeRXpH2WjccE232lBhkg5S
         UDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bac/RpBXYVxnDqXNA3EgO2xm1b59XlFbCd7Xvwt5ZTo=;
        b=R7QPGoQ+KFRajptNyqi6Oum/KRc2ZLJqxDR83nPQpCF0C8e9Kv0WyRHVJ/FBJYemOn
         /xHlAyZEOq9nN5NQ7o7rhAUVWdtjz7ZU6N50U/ow9nzyGPXWcIb6ie4PYT7zzmTJ3Ghp
         3q1VYYxlKt9FBIp+THWlQjWUJqJyMqyYQ1kAPJCoy58rDXCwSGWFqXAVBhRlIVs30SR1
         jUMAdpQN7VcNpIjFj1roXE/cu9hftlsgfsVQebnJOPS3pP2GhJsubuLckZKq6vc39JTL
         c7BMfSLwdy8x0JlEZm+Sw/IyYH+z2ebbXtzxPTVMc/AEQpv7ierojqaleocNvVjxLNDD
         UdxA==
X-Gm-Message-State: AO0yUKUD0v58lgiaKTu4kkq/ZUK9VlIJh3rZHF4sW/7rmFpCpqEYTzRu
	vtTnfN5QdiAnA81Be0iOb29fzE022Xvy1A==
X-Google-Smtp-Source: AK7set82Cpbyd1YQ+k4l4oUcguYJJJxyYPz4yzMFRIHmKwgiGGgx4ZYO0aqVnYtexc35ewMbcsByZQ==
X-Received: by 2002:a62:1c0a:0:b0:60a:dc94:5d19 with SMTP id c10-20020a621c0a000000b0060adc945d19mr2476008pfc.33.1677742521047;
        Wed, 01 Mar 2023 23:35:21 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id v26-20020a62a51a000000b005a8e9e2f1c5sm9085898pfm.187.2023.03.01.23.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 23:35:20 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	pratyush@kernel.org,
	michael@walle.cc,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 1/2] mtd: spi-nor: spansion: Make RD_ANY_REG_OP macro take number of dummy bytes
Date: Thu,  2 Mar 2023 16:35:06 +0900
Message-Id: <03756e9e3ac41d2016a71d2afb702398dd0b19ed.1677557525.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677557525.git.Takahiro.Kuwano@infineon.com>
References: <cover.1677557525.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_233522_915777_96CDCD73 
X-CRM114-Status: GOOD (  12.31  )
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

Currently Read Any Register op is used to read volatile registers without
any dummy cycles, but the op requires dummy cycles depending on register
type (volatiler or non-volatile), device family, and device configuration.
Add 'ndummy' argument to RD_ANY_REG_OP macro to support other use cases.

Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 12a256c0ef4c..9faab29aba57 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -37,10 +37,10 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
 
-#define CYPRESS_NOR_RD_ANY_REG_OP(naddr, addr, buf)			\
+#define CYPRESS_NOR_RD_ANY_REG_OP(naddr, addr, ndummy, buf)		\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),		\
 		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
-		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
 		   SPI_MEM_OP_DATA_IN(1, buf, 0))
 
 #define SPANSION_CLSR_OP						\
@@ -148,7 +148,7 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 
 	op = (struct spi_mem_op)
 		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR1V,
+					  SPINOR_REG_CYPRESS_CFR1V, 0,
 					  nor->bouncebuf);
 
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
@@ -173,7 +173,7 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 	/* Read back and check it. */
 	op = (struct spi_mem_op)
 		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR1V,
+					  SPINOR_REG_CYPRESS_CFR1V, 0,
 					  nor->bouncebuf);
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
 	if (ret)
@@ -202,7 +202,7 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
 {
 	struct spi_mem_op op =
 		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR3V,
+					  SPINOR_REG_CYPRESS_CFR3V, 0,
 					  nor->bouncebuf);
 	int ret;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
