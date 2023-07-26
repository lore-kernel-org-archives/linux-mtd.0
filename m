Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D531C001DE
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8bfsIbqJxKoC0gwF6k27fvxZj4mMpDElLXT3kcTXM18=; b=AWo0Bye3Y8RTQ3
	c0LnY7LvkDWRmGSz1A/w2309ykfJN1GA+sl7/HlfIgNuK0pxSPViDdX57t5d1CZoe/2/OtLD0ujW7
	tXbCtUjBI/orvzLWo5+d7t3bnKDq+eWYNUXjYAlrJyFcxpEFSlJsWJPWXu46i5boFJ4956cAb/os4
	19VFiHNXbMONpTXvRqx+12AlCJutxkVuQ/hxPeg0/7HnmOf8FTzpFbksO9p4T2SWP2/+YA0n0r3cx
	4lyLLZhn7skB78N2aTyw9N0GmbaRMksePyb9W8QrDQxyT68G7F0jV4OlUkJB0sPr89x37C3qy/18W
	NY1/WURiuhdnsi36HoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKj-009V3F-1S;
	Wed, 26 Jul 2023 07:53:21 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKd-009Uxp-2L
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:53:17 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b933bbd3eeso95502031fa.1
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 00:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690357992; x=1690962792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3InCljZqye4eFwsDTu+IODNCfq24t38Cj22eVGkKqxU=;
        b=SjCV/8xNSkyjqz5FS+Xw75QoV10ooDUJ1MU4dKZfKvJ8elu1NZ+8JLkUjZ1UE09dPW
         bhVr6aNQ4rUPXYC3R0S6qwidvA4On3ayyYu3ARZ61swT4EPMgxE7j+jshMJ7h21kU6sV
         XpsuvTsGptgeKeiCtZyvLTksp4dkMibMn1QyuRIH64if7+mfwvQ3Qpa2GYwk6ltN7oFK
         UXrOVBPgtLwC0ewYXDFv9BN3YI61WM3CdcFG12Tf+JmbODG5NUpsFQbCn3i2BHB/6p48
         w0HUb/uWeVgsLCWI14Q8aKNKM4flHeRj/S5eJt82vmoBhmjEN/NFmIvNsc2Rj2AvC19H
         So3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690357992; x=1690962792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3InCljZqye4eFwsDTu+IODNCfq24t38Cj22eVGkKqxU=;
        b=VF13+dSOIXenK4OqCV4xf1cU3r48F+iMH8YVx96AiuMGyE7ZVlkdXo6b/QW5MbH0N3
         RMu3Fe36Tug+qMH1mn8YoRe/ppXfVHaCBX2CV8ER4R1PpXlHLumfQGa/xxd9T5gYFqQo
         O0NNESrQkx+u4gx1jgDhljZ1AsgjspKYYsrb/p+cd4p4PVwdz4WGy3U71Afv/jCUyGeP
         uq+5R7zP9gvIJ5RKpj8NfpuyAS8duqhu919t02qmxCr7jSFYXt/1Cr/g4d11UPJK5++r
         3GfdvrXCBiJ9nma7QjU6ld9SLKw6C+vzPeCsKc3JpNkjhthD0rkk7qJ7DOo4fOacJZQf
         Isqg==
X-Gm-Message-State: ABy/qLY/LnLhOvgSshZ9tBm/KH7TxDWnX88GuFoLmEcOPNknnN6SWi/Y
	8hNYGpdn7iQVPiAj28H5ERJhKA==
X-Google-Smtp-Source: APBJJlEBXqLQv3e010LqDbxJd0efexmnQKBKiXcJ4lUJnBWUHbvBTg9p6Tg94k/lVYJgGJeyc9Q9bA==
X-Received: by 2002:a2e:870d:0:b0:2b9:acad:b4b2 with SMTP id m13-20020a2e870d000000b002b9acadb4b2mr828072lji.6.1690357991856;
        Wed, 26 Jul 2023 00:53:11 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c260e00b003fbca942499sm1264346wma.14.2023.07.26.00.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 00:53:11 -0700 (PDT)
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
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 06/11] mtd: spi-nor: spansion: add MCP support in set_octal_dtr()
Date: Wed, 26 Jul 2023 10:52:52 +0300
Message-Id: <20230726075257.12985-7-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726075257.12985-1-tudor.ambarus@linaro.org>
References: <20230726075257.12985-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370; i=tudor.ambarus@linaro.org; h=from:subject; bh=doE8v18UAwCgNrGgR/vrxrYb2ko5JOoI6sQ8dWotQW4=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkwNDY3mqSfchKqowpgyrLyI3ImYTReUH+R5oS1 Y/KJTj+vbGJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZMDQ2AAKCRBLVU9HpY0U 6QyfB/4uuxOaTt48p7ouhOQz71ZZ+86XFAaMCYdjr/yy1lCkCARo5ETZ9JZ0HbsUws1oCCZHr4Z GlQwhLqcDzWomLtFap317Njk3lJcTDVeREJsrGWfd0qajoSDhy67NX6PYbH+Bn43T+uOeWcRqku zrFsnnCnBVxYGQrQNOheDB/9SmWrrb6oGw8wuVKAW5dW9+ch9a1pdqADs7P/9Z58v417M+pDLRA +T5IB2oQjksf0J22I1sDE5L1YhcbDiuejBj426V/iljSonJd2pIv1qLK8pwaLsBgvTKxEGOF5pH eqDOSq3HYievyFVpU7XAejWrJhAovmJIfM8pEIt5ha3ifHJu
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_005315_826211_4126DDF9 
X-CRM114-Status: GOOD (  14.16  )
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

Infineon multi-chip package (MCP) devices require the Octal DTR
configuraion to be set on each die. We can access to configuration
registers in each die by using params->n_dice and params->vreg_offset[]
populated from SFDP. Add MCP support in set_octal_dtr().

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6d8dd800ba65..b3a710985f84 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -204,17 +204,19 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	const struct spi_nor_flash_parameter *params = nor->params;
 	u8 *buf = nor->bouncebuf;
 	u64 addr;
-	int ret;
+	int i, ret;
 
-	addr = params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR2;
-	ret = cypress_nor_set_memlat(nor, addr);
-	if (ret)
-		return ret;
+	for (i = 0; i < params->n_dice; i++) {
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR2;
+		ret = cypress_nor_set_memlat(nor, addr);
+		if (ret)
+			return ret;
 
-	addr = params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR5;
-	ret = cypress_nor_set_octal_dtr_bits(nor, addr);
-	if (ret)
-		return ret;
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR5;
+		ret = cypress_nor_set_octal_dtr_bits(nor, addr);
+		if (ret)
+			return ret;
+	}
 
 	/* Read flash ID to make sure the switch was successful. */
 	ret = spi_nor_read_id(nor, nor->addr_nbytes, 3, buf,
@@ -249,14 +251,17 @@ static int cypress_nor_set_single_spi_bits(struct spi_nor *nor, u64 addr)
 
 static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 {
+	const struct spi_nor_flash_parameter *params = nor->params;
 	u8 *buf = nor->bouncebuf;
 	u64 addr;
-	int ret;
+	int i, ret;
 
-	addr = nor->params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR5;
-	ret = cypress_nor_set_single_spi_bits(nor, addr);
-	if (ret)
-		return ret;
+	for (i = 0; i < params->n_dice; i++) {
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR5;
+		ret = cypress_nor_set_single_spi_bits(nor, addr);
+		if (ret)
+			return ret;
+	}
 
 	/* Read flash ID to make sure the switch was successful. */
 	ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
