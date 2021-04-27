Return-Path: <SRS0=EgaJ=JY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B547AC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 07:14:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 118CC610FB
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 07:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 118CC610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RWaUS8z1ZlSS1uVQTTjYzWahZxBwVORDo+sROW2vA3U=; b=hmnML/P+d7+W71BHXZ8o+OKwH
	Pf3jZq3PA+7Jo/uKfM4+WuQa2XPbFk7GF+JQv7Bsyr3I6yffgLIqt9QaQ9mDxhAo9H6JP3b3TzVq3
	GOUIxrWgf8O9bdnJLP1s1/K2FjYHSEHx6Q2Dtm2zJ8V2fwrxFG74SF8lOSB3OmFgZYFPY8Xdzkaql
	6jr94IyokKNaQDqvfNlykNiS+gGfnLk9RQJy5kyNVdanzaezkNhupnVB4JNE8e+zlHWJl8+rxGAVx
	8vZYhsUe+9Pi9ySeKu7tu6nipUbwHQ6KRFdzSUt3z8XRgMeiesor7OsArQzv6LpNquTmooy3f+9bc
	T9TSudCaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbHuZ-000w6P-6f; Tue, 27 Apr 2021 07:13:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHqg-000vU8-HB
 for linux-mtd@desiato.infradead.org; Tue, 27 Apr 2021 07:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4Q8vX3NoAVOb/mZph+oUCKQacfcoPoavlAUnHHeT1EA=; b=5BURqzBlDHNWAsOOW+X+zPif6U
 +54HBi24EDx9j2bN3GrJ8XEanLfWQCLVXdtgESklst6yltlRwPb0/k0rCv38VnYCqbhPWFzOcgNXe
 Pi9gxv6Dy/6iT8NgwdnVp00Bh5umvTBfkC0HJ4NFFySPaNQNq56HFoJulUrdy8+WxV3yt1YN9I4zA
 ZpqzwPTCQNkZhV1dsyVuR1DYe+cgzNpWgS6gRxpWnWM/fcRtbelix2RuLESQjrIl7DDSgtbyqeTBZ
 rKOOxlKjNzGeZORQZIEjlh1biCjhWQ+2GI5ni7qpwRwQ8HdHodRIjiMmYrKOjLpV93UBUwEW4+fWl
 oXlJs/Tw==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHqd-00GUgp-Tg
 for linux-mtd@lists.infradead.org; Tue, 27 Apr 2021 07:09:33 +0000
Received: by mail-pl1-x62b.google.com with SMTP id p17so4448618plf.12
 for <linux-mtd@lists.infradead.org>; Tue, 27 Apr 2021 00:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Q8vX3NoAVOb/mZph+oUCKQacfcoPoavlAUnHHeT1EA=;
 b=P7s1wocrmJhbM2TIBkWgszhqz9IyDcm0kR63iu7eC9qTcriWKi3GiD0MxJOwcqMxvS
 lixpWUvxGbnspjLw6uYAM85PIXX8trxVC6huGNpdj8zheTkmRxxz0Nb1Uy1LNkWMcgsG
 PhyXIFj2YP/8TQoyRzXNV/rWHfrbqdnpBFHbw1r0Jp2J52EMvdKPGo9siR5FnLqZG5lp
 aa+h6OnuUapNgeVTbO7dZGvAyCX66RXnlFKWe8L/B4XV+eiyi5bt1GH0Ml5beqa9USVp
 cUk9BOJYCkOAbMasoLckx+anZDBojs6s9H+FIQNn4OVjw7E0n0ex13BymGF3LvctUgjF
 jPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Q8vX3NoAVOb/mZph+oUCKQacfcoPoavlAUnHHeT1EA=;
 b=B6DEA9nhXumlaPt5AcL9K+c4/4eX7VgHBW04ojhtuiPOlddHPPy2sMS4aNeijiel58
 75EljhC2Vbjk6C5+ZzQ+fKVrEX1+JnP0r5txpc8GNp+Im5C4359GnN72UKVhuPU357Pp
 hqHVhnD0Kw/GGedJLMz/9+vboNjPbAiqVEVJEOMAMC/EBGi+j4axCFi+iI1T1Y2S7AHK
 l2BlW7z5kATpii4gKkod53VSAEhGC26UUZn08IpQ988k5ADt6re0ZqJKKeh+mrH9yM4W
 0+7PeJmpf34xGUYW9+eJDfPwsi+X4wFGPZQNkzhHgaKoCmjFI/ChbjYG0NhqytgH1Aaj
 p2Uw==
X-Gm-Message-State: AOAM533THEcDlotDRKPKgyMuNcMTpneX11PrCyxYQRSoPBTYjM0m85qK
 Haq7+sAiXFJNTkax7z7QQeKW5LCh4/4=
X-Google-Smtp-Source: ABdhPJzjLqEvXUjtqSXcSMgY4NqUja5d9tVyUsdsdsLk84VB6wydoixOOLzDY+hcCp91mT4+5VQXLw==
X-Received: by 2002:a17:903:18e:b029:ec:7e58:fbe1 with SMTP id
 z14-20020a170903018eb02900ec7e58fbe1mr22743378plg.70.1619507370703; 
 Tue, 27 Apr 2021 00:09:30 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id u189sm1589803pfb.151.2021.04.27.00.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 00:09:30 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v5 4/6] mtd: spi-nor: spansion: Add support for volatile QE bit
Date: Tue, 27 Apr 2021 16:08:59 +0900
Message-Id: <cc2c286f069a1aa3718a91b28342d907f1a77d2f.1619504535.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
References: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_000931_980404_4B105A6C 
X-CRM114-Status: GOOD (  18.26  )
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

Some of Spansion/Cypress chips support volatile version of configuration
registers and it is recommended to update volatile registers in the field
application due to a risk of the non-volatile registers corruption by
power interrupt. This patch adds a function to set Quad Enable bit in CFR1
volatile. The function supports multi-die package parts that require to
set the Quad Enable bit in each die.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
Changes in v5:
  - No change
  
Changes in v4:
  - No change
  
Changes in v3:
  - Add multi-die package parts support

 drivers/mtd/spi-nor/spansion.c | 58 ++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 436db8933dcf..0eac092f6c95 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -10,6 +10,8 @@
 
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
+#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
+#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
 #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
 #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
@@ -125,6 +127,62 @@ static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr, u8 reg_val)
 	return ret;
 }
 
+/**
+ * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @reg_dummy:	number of dummy cycles for register read
+ * @die_size:	size of each die to determine the number of dies
+ *
+ * It is recommended to update volatile registers in the field application due
+ * to a risk of the non-volatile registers corruption by power interrupt. This
+ * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
+ * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
+ * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
+ * also set during Flash power-up. This function supports multi-die package
+ * parts that require to set the Quad Enable bit in each die.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy,
+					 u32 die_size)
+{
+	int ret;
+	u32 base, reg_addr;
+	u8 cfr1v, cfr1v_written;
+
+	for (base = 0; base < nor->params->size; base += die_size) {
+		reg_addr = base + SPINOR_REG_CYPRESS_CFR1V;
+
+		ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
+		if (ret)
+			return ret;
+
+		if (cfr1v & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
+			continue;
+
+		/* Update the Quad Enable bit. */
+		cfr1v |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
+
+		ret = spansion_write_any_reg(nor, reg_addr, cfr1v);
+		if (ret)
+			return ret;
+
+		cfr1v_written = cfr1v;
+
+		/* Read back and check it. */
+		ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
+		if (ret)
+			return ret;
+
+		if (cfr1v != cfr1v_written) {
+			dev_err(nor->dev, "CFR1: Read back test failed\n");
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
