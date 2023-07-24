Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95757C41513
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 08:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+rZx5TV/On9wB2uf4COx4hZHvxETnwVeCHlkUvXCbc=; b=1z1zirJoHmqiFp
	rF6mH5i/DCrh7Fvd7Z5iNE/pHsrcprD864sugTANP7idd9o4CNp9ct4WV/73ZUyw6udNT+ha2BnM+
	jkS9t1wIGRQrwd2HW7mtHU59CZXAsYRcRom17t9ur5hmrq9OsMt0CAykgUddnMh76SX/f0uaETsaW
	FCqDJgE9fSrwFCAkm1z9XjTxw6qaaPrhQL1fjREqznqdDPglwSOydu1nFmSiE4C6J/NvMFRWVDLWQ
	Tc/gn7bXCQ2JJCp4r6V8zRwHt0F2AqxWXWuhXsKa/oqoZoCeD+DlerJzYUhS/UOOsSp1G415EFdY4
	lFry7yYqzaj7qQNOe5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgi-003CLX-1D;
	Mon, 24 Jul 2023 08:13:04 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgd-003CIY-2c
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 08:13:01 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-993d1f899d7so717959466b.2
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 01:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186377; x=1690791177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9TJeEMNRCv2DgCOuJM1bBGc8b3D58xXpaHuqfHRQK8=;
        b=IF+0ss6NBRFxVEvrbdhWI4conkRSs7twLSGYcxdmi6/cC/bynEt5PSWxf9WbyO4akj
         SSkOYO0ltYkykh1A+aRmVxXyb9WYfbifp+QfcC91Wo964JFWwMOTKJLrsNLI9/7h6S2g
         xvwkf659OHSWtNurKOW9lRV0jo4EX5g0fdTh1UC1yy5pdlVmDdQni9MYQfCeVC9dT51p
         aRFtftRXnU/gu0NxhOira9W4ABhJ7GUrLyoFXml9y+65QF8tI6oAQFCs0iRuDmXrh0cd
         59hEBINQ20GXqeeeo8CyAIJxRwnf0mSVKllCSQlovJvg6nNRrXMsuG5JRCGYSZ0jPnUB
         5NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186377; x=1690791177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9TJeEMNRCv2DgCOuJM1bBGc8b3D58xXpaHuqfHRQK8=;
        b=UxR39qU4zK0kjkM4CwQkV9DZlHjSggKWG8WcL43GW2qoW73QBBY0LhQZxXcwJgCkM0
         KzM9falpSsfeFEsgWbErYuyqpprgqvtNQyFUolnkB78E5kN4fl8J8fUhgPAEFpIS1jR9
         DWnftahNx7kNKUv9CnAY2Aj4nw2jP5LtfgpB52qzYLdm9I8SbLXZQrjeD3QwvodPncoa
         mbQl6mmAUpf03GFA8yQsuIzfRSCXWr6i9thQMt4/u3mWbvn7Dq3HjE6Acz/eAjxNjxrW
         fYRTIlXAMd45s+hzi/4a0nEkJMqORL8DbXYLsr84AU5U3qdAkVG2IHedzh9mL3EcylrH
         63GA==
X-Gm-Message-State: ABy/qLaRxkyhTDUTJidedRln9BdN4qy0RorAXfAoAjztLNQ9w6J5b9pc
	tASYPvIpTO+A65P471q+tVArCw==
X-Google-Smtp-Source: APBJJlFrbF1dyLHSDZqf2T8yfi603+3h845Soxk6FH+ij/grlAEud6qiyv29/Xz1egJwH4A8fSBWHw==
X-Received: by 2002:a17:907:7895:b0:99b:4bab:2838 with SMTP id ku21-20020a170907789500b0099b4bab2838mr9950011ejc.0.1690186377054;
        Mon, 24 Jul 2023 01:12:57 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709065f8600b0098ec690e6d7sm6355395eju.73.2023.07.24.01.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:12:56 -0700 (PDT)
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
Subject: [RESEND PATCH v3 02/11] mtd: spi-nor: spansion: preserve CFR2V[7] when writing MEMLAT
Date: Mon, 24 Jul 2023 11:12:38 +0300
Message-Id: <20230724081247.4779-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724081247.4779-1-tudor.ambarus@linaro.org>
References: <20230724081247.4779-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944; i=tudor.ambarus@linaro.org; h=from:subject; bh=kVZ7aQId7ERSbIGrhSxOKuGFZinAOtskWkM0179Q9K8=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkvjJ+SIacWrtM6rqggQL3xW9NW3MgQizA9VFwu e+IRxfckVyJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZL4yfgAKCRBLVU9HpY0U 6fIXB/4sxp2lHpr0bsLJOluiR+54Ai3rZFme+Z0Pca5oGlc2cJN4GcjbS3uuNnLbr7tfVFoByji wShomDl6y/CbrxwQzxMake0uet1egUDKMWMu2yTRNbwRE4ljVUgMEF9xh1WpId9T4CkC+CJ5pc0 FXWgZLt/0PjOw5XX+xjohQBXJ21y+U+C+2XPZJwkY+5Vh9uPkmc2qz6KrFOrpemfQRKYB/bWxsO I1IF9O5SU2xNxx1wJIL4/1HQISx1JFwpwJlzQnL51sa1tgg785Vx3zE4n7KJiy9VI+xADeSsD+u WUTXjxqujyuVPa5dvmLNFofEraQia4pr0HXRWfdH/DGgiR20
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011259_851283_BE92B6C3 
X-CRM114-Status: GOOD (  12.03  )
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
