Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A764C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:45:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CDA564F00
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CDA564F00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uGOBQmnJyOnhGNa0z0ecplGibxofEnROX17lhScXrhI=; b=XDjsuxXMoWySYS37Bb/TjNfCz
	w6lZd5WXdEyHY8SrRuvHlALLg9NPI3QpW4YYmZLOZR6i7YMA/QaMm4llbuJBEoBh4DCA845EQXu4a
	/POxvG/zDH39LF5Zqlmle1epBfKr2IcKCpeww4vR39i4PeHnqVbNpTCZpwZ+MaEIWUiUybQ/QB7CC
	oexialO1fyvJVOJd9LfMu2OII3NK6CeQ07QAV7bA2fJeJR0v1iqUWYt0/WT0LZNZKjABqSrw2cQD/
	gtm0cTSfMv564wdlm0sH2Fs0MMRx8osHmkHvkrPwcoeTxBd2DRsfAkHGTIMqn4TCl7SdwdDc86eoA
	SM7XXDfPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKeLo-00B3lM-Su; Fri, 12 Mar 2021 09:44:57 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKeLi-00B3kE-0I
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 09:44:53 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so10813483pjv.1
 for <linux-mtd@lists.infradead.org>; Fri, 12 Mar 2021 01:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/UWZPj8NNYrTS5DzEsYt+H6Dt4K2DGvRf/+nZpkic4Q=;
 b=cZ1O2nepVyqhO0ZneO82f+yVbtGi+F2lMvGn5kNgKeOzdSn3a5HsocQ3266q7wnaIf
 VqK28aCHtuSMwOqgbA/ARLt8G4KE/VCzd3+5TboNVr+hbEkJxxW0sIaAMnMUdXGttupb
 0LuJzQXNMovcmnj4mf0KzlSurdKVExmMk5bB3+hSTFIqxQQnRYoAqYdii4xDxGVkRqMu
 jZFSZ3yauiTNLIjn/WmJw4te+dswKO2/8h26k/cB43VMdshwpr2QEH6kmlItScxvaee0
 gyDT1yqedRa/9I8rTemAVtvnlPlsoB6yk/MThCOH6q9vhhNlaFWnbEz/AESlKGwrRd3O
 9zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/UWZPj8NNYrTS5DzEsYt+H6Dt4K2DGvRf/+nZpkic4Q=;
 b=d5PW/W+Hhb4l1uRpRtQZAiml9X9YfOycW2HyDF13G81svLQkfWLkjyru6bGdBg2Br1
 m9dGnNySci57t2uzOeRkiY4uR8nSmrPICl6MSHLyvWwbJbq2LVMMevEqq/admKP/Qzfq
 LHQ/sG0jAGpbDp9k7lC4KGAJpKvcTLTLo5Gi2kEuJAYw87rMI1I4ImRuDRHVjIMhRMYJ
 2t8oMppbZVsdPyPaYWgbqOhxyE000WoSei2GQLOEiReyjPTI/1FoAUN5Nd5TuZR67xJH
 6GcDM92OLwQzBWhlt9ADuMw2HeNVWo18xcMHWUT+QGSVb9hVHGftdp+AEUthUWlzqLZE
 kL3w==
X-Gm-Message-State: AOAM5324wAlLRzXbH3Hg9Yh5pMsg64dj/KZDKwd5ySgo+ZRQfnSULuDw
 rlUMnNQs74ptgSoEu9+4fmiGfxIjjih/Yg==
X-Google-Smtp-Source: ABdhPJxs/f9I2qq+2nY8vCy8H2903hgT58cIJAqU/l9jJ+0rndK2h3ujzgKuInWYIs94FRZt1pDm2A==
X-Received: by 2002:a17:90a:5d09:: with SMTP id
 s9mr12958073pji.172.1615542288336; 
 Fri, 12 Mar 2021 01:44:48 -0800 (PST)
Received: from ISCNPF1JZGWX.tyo.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id 35sm4811758pgr.14.2021.03.12.01.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 01:44:48 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 4/6] mtd: spi-nor: spansion: Add support for volatile QE bit
Date: Fri, 12 Mar 2021 18:44:36 +0900
Message-Id: <dc9bc04fbfc9c913e37e8200f46ac4773acedce9.1615523176.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_094450_340284_4D7B8EA3 
X-CRM114-Status: GOOD (  17.52  )
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
---
Changes in v3:
  - Add multi-die package parts support

 drivers/mtd/spi-nor/spansion.c | 58 ++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 1bce95cb7896..b5b5df4836c6 100644
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
@@ -121,6 +123,62 @@ static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr, u8 reg_val)
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
