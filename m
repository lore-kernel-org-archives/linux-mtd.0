Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF268C76196
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 07:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9lYbwSCBz8eiLhcjPnGZiRYYDnzQP9nQNyAEiP23GU=; b=G0TItgphxO3oy5
	Vrmk17XoBSB/ZCEr16kTBU+273t/JSiHeEL7RDkuI1UBBbN5JfKFlOGogmmDyN/QheZLnVWo4C6LM
	0e3U2IoNE3DEZZEyq45BjzUjV6KLiIlGTYTuqIymUgR2tPtEnnmNytcJBymuXcu6iAv0a31YQpyq2
	VBUDHBubGTFDR3SeqD8XYKBpIuMrWv6pVdT9cOEw7qc5u2mKv/wP1q6rPQQWCsP+shXF4GalTYZQW
	y7asmyjygJaoygn+iWL3ovrL5ryhvoOMVk/eeFZjFCmWNJUF6S4avu/huxQnbopRw/7MlWFkF7UKk
	RXZPxAjjg3uU0yx/6y+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9TA-006DAN-0g;
	Fri, 31 Mar 2023 07:46:44 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9Sp-006Cu5-1R
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 07:46:27 +0000
Received: by mail-lj1-x234.google.com with SMTP id t14so22148457ljd.5
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 00:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680248776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VskMtKqJo2Tm6jcABPqz9otpp15wXPXFPfERL76lmb8=;
        b=Elu0oDZbKYEaJk3BPLEWS5s8WTLK+AaaOOVyg0VGUguJTbOOn25MNKzUV3tCoWCCTT
         BiCRfHHRXXZZfUOACZrGAK/qaOzRs15WE+pgplX+7qZd9dAz9/KW7RTSEq99zR0Gp2x1
         DxqR6vFs5pY6d4hICY+TzZynuFIi5us7VYuUJ+I0V6rObnijrCZ+xO6O1skXCrc8zk7j
         CY/YPA+MFqglO4ThyH56V+xL3ZPK2fnHJND6e1XCMR/BDhrUWqJx6EB4VHdK4GlRkHbw
         3mdt1XI4rrMwBJCs61qe3pXW6gUTl1aQr6S1DLRxkrfqFLm5mb9Owc7LYEwPMqNlTF6T
         0GYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680248776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VskMtKqJo2Tm6jcABPqz9otpp15wXPXFPfERL76lmb8=;
        b=zCq8+03EPFDlLfcLWYXdp8txowBlQzIH5hC6qqlSMfC3Lhq0BpE0vXMH7zzEv9YMZ4
         MDsve0CPKnFtFm+X+2gkK2DkQWkgTgzHxQ3q60yzJry+GtPj8Q6OjSxoiQAkavrl8W2m
         tRvNu76KOPr1Bb7oTaDOSj2h6BoOOIypOE++IbfFD24CefassukoFmsfsYFeYPPm+y5F
         GWLBVEGie9V1t2VRaQ9Hso5cSLEDSjtjaB8GkyGnlrDlWo9XmncAEhS7ae3HTbPlHel9
         E+/af3FuN4hTpwJa4RD7Ze6mTRbsCQPsWqTngG0/Dp7bROQ3ro+FggZbWdrZepNsfw92
         RhzQ==
X-Gm-Message-State: AAQBX9eSr3ai2wQn6Vjf9y+3sV+9OB1W+HvrWb4lTEGbQiXHLS7a0jvi
	e5ghFZ2j8rIK9CrMSYEQW89A3rrAkdHnIF5SizodIQ==
X-Google-Smtp-Source: AKy350aAhXaohE8Hvyy3v/ekKM2Vs2P+IJ8jEz+Nt0k2TBTY5ykvbGfHN5gWB273oUVJ87tLm+i9Rg==
X-Received: by 2002:a2e:320a:0:b0:298:b03d:5715 with SMTP id y10-20020a2e320a000000b00298b03d5715mr8307472ljy.25.1680248775893;
        Fri, 31 Mar 2023 00:46:15 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020a2e8794000000b0029573844d03sm241201lji.109.2023.03.31.00.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 00:46:15 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 04/10] mtd: spi-nor: core: Update name and description of spi_nor_set_4byte_addr_mode
Date: Fri, 31 Mar 2023 07:46:00 +0000
Message-Id: <20230331074606.3559258-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
References: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_004623_501217_38E8B40F 
X-CRM114-Status: GOOD (  11.78  )
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

Rename method to spi_nor_set_4byte_addr_mode_en4b_ex4b and extend its
description. This method is described in JESD216 BFPT[SFDP_DWORD(16)],
BIT(31) and BIT(23).

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c     | 8 +++++---
 drivers/mtd/spi-nor/core.h     | 2 +-
 drivers/mtd/spi-nor/macronix.c | 2 +-
 drivers/mtd/spi-nor/winbond.c  | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e8f6141c0ef6..4c9264e427ff 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -508,14 +508,16 @@ int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
 }
 
 /**
- * spi_nor_set_4byte_addr_mode() - Enter/Exit 4-byte address mode.
+ * spi_nor_set_4byte_addr_mode_en4b_ex4b() - Enter/Exit 4-byte address mode
+ *			using SPINOR_OP_EN4B/SPINOR_OP_EX4B. Typically used by
+ *			Winbond and Macronix.
  * @nor:	pointer to 'struct spi_nor'.
  * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
  *		address mode.
  *
  * Return: 0 on success, -errno otherwise.
  */
-int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+int spi_nor_set_4byte_addr_mode_en4b_ex4b(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
@@ -556,7 +558,7 @@ int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor, bool enable)
 	if (ret)
 		return ret;
 
-	ret = spi_nor_set_4byte_addr_mode(nor, enable);
+	ret = spi_nor_set_4byte_addr_mode_en4b_ex4b(nor, enable);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index d8e3fd60d6ee..067945c10023 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -647,7 +647,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 			     const enum spi_nor_protocol proto);
 int spi_nor_write_enable(struct spi_nor *nor);
 int spi_nor_write_disable(struct spi_nor *nor);
-int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
+int spi_nor_set_4byte_addr_mode_en4b_ex4b(struct spi_nor *nor, bool enable);
 int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor,
 					       bool enable);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 6853ec9ae65d..91a8fa7d4512 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -105,7 +105,7 @@ static const struct flash_info macronix_nor_parts[] = {
 static void macronix_nor_default_init(struct spi_nor *nor)
 {
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
-	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode;
+	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
 }
 
 static const struct spi_nor_fixups macronix_nor_fixups = {
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index ca39acf4112c..9cea241c204b 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -188,7 +188,7 @@ static int winbond_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
-	ret = spi_nor_set_4byte_addr_mode(nor, enable);
+	ret = spi_nor_set_4byte_addr_mode_en4b_ex4b(nor, enable);
 	if (ret || enable)
 		return ret;
 
-- 
2.40.0.348.gf938b09366-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
