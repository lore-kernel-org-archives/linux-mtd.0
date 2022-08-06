Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5CBC25B08
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Aug 2022 06:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88ojyFYpA+W7bRRFxpNsivekEzzoGux1Tyb1lBYyIvI=; b=Sr9W5syJBKQ21A
	MOVh4RpvtNJXa6qZMnPyGe7V4NhpbOfgJrWTlvMmdQ4S+zvuFh5yyBuSizO0VNZwIMPBqfApkKblM
	u4nAEv5K/aEmKmcTkwdNQQcO8dWEIZjEyxg3L+zXqg3xzHyfaxbQtPf+di3H+TgnICY8eyEwe0gib
	CzoKwKXU7w+f0MZU9CS9yfoLvRBo7wXmrEudr32Y7t1BLKILIGw1Rdq5s4eBoL56tzDesMF7oVj1p
	zPNIQUqrQId4XkZD5hkXRXxqN/P9Q0MKTU1HSR9Huhy6AUzUx4Apd/qDMAAxlPmOYtUB9gKV9DmI/
	iGIWOUswvt+PWdnQTs8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPN-004nQA-9s; Sat, 06 Aug 2022 06:35:37 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPI-004nD3-66
	for linux-mtd@lists.infradead.org; Sat, 06 Aug 2022 06:35:33 +0000
Received: by mail-pj1-x102a.google.com with SMTP id q9-20020a17090a2dc900b001f58bcaca95so3257264pjm.3
        for <linux-mtd@lists.infradead.org>; Fri, 05 Aug 2022 23:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=WK+oHNJrrV+XIXO2X0KX9Iy3h4573rARxqLSqyRfmbs=;
        b=dqokSp9HavyCQ4LnbnUPgPe00kDyFQ8O+5uBNlpgLdovSfx6KMnpsiM9UVILuOHeHM
         NCozF6epuZzXQQMe8R1bjjxgzDcwyYYh2sOVO4aYD2ZIFqvWp/zT6Tkl5HxFI2f0OipO
         eSFPAcVLwbiyWjHio1FhirzK4jurg+bf2vVNI1w6pS5mgnGXS5mvor9ozF3BiXo0xNV3
         miVu7SS/HfR6OiPAxZBMuw649g5V8q44mR88tEqSomUTScg2WTD/PnDoc9MGbH+TZNEc
         hvAC20ABIDiwIr7gRvjXqPrmBRPkimY7ZJ8gdDaIcIKY+784kfa/H1xswORT5a/iBQR9
         3eKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=WK+oHNJrrV+XIXO2X0KX9Iy3h4573rARxqLSqyRfmbs=;
        b=tvA+dbHMx9sWx8aXVzm8R4dgL/2gRSuQq649/MaG+OxiJuuyW4SCXQCTWYlkKj6EWF
         tyWoFG+hnUV1F+1u/ZuuyutDABKCqVZAx8UFkK2pgWdjvSalhs0SFn+e5dxyQe93Tubt
         Dgc20mlpsTqKr/v/XDgTWsxwH2L2+OllDaEIvbS8iP3jcALulOJr9yoFqd8envtrqTyp
         vfjbdr+Yq1VWm5pZ82M021rdlOhIo6RSZCKk47gsdOcKxkucj+aZQjpoq5rKRVWX+OAQ
         QISrUJlHx6Eg7sWLKhkNCnqlTvBMx6RhRj9/rDR0zlOUlVmyZTYengOLtkBeaMkcqsl0
         u57A==
X-Gm-Message-State: ACgBeo0IjTxGSm+crg067c3tduwYHG2aB5bLHAmFbPdWcKspgh573wkh
	auw0SyikbrPz9ohQeAbv7OfQVtiCJKOWhw==
X-Google-Smtp-Source: AA6agR5oqwBpn9XjiRRQ6xUmBe6KLVmfVocJPi0FOIsbFUzeUc20RTjlVoiAPDuBYlD4akKod7SQAQ==
X-Received: by 2002:a17:902:d2c7:b0:16f:4e37:b04f with SMTP id n7-20020a170902d2c700b0016f4e37b04fmr9992835plc.4.1659767731113;
        Fri, 05 Aug 2022 23:35:31 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id a18-20020a63e852000000b0041b67615584sm2418452pgk.68.2022.08.05.23.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 23:35:30 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 4/8] mtd: spi-nor: spansion: Rework cypress_nor_set_page_size() for multi-chip device support
Date: Sat,  6 Aug 2022 15:34:22 +0900
Message-Id: <88bcd65f36e33a3fd8ac1976a08b0bf5d730a3ee.1659764848.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_233532_279406_3552AA10 
X-CRM114-Status: GOOD (  19.09  )
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

For multi-chip devices, we can use 512B page only when the all dice are
configured as 512B page size. Simple for-loop with params->num_of_dice can
check the CFR3V in each die. The volatile register address is calculated
inside the loop by using die number and volatile register offset.

The location of cypress_nor_set_page_size() call is moved from
post_bfpt_fixup() to post_sfdp_fixup(), because the number of dice and
volatile register offset are parsed after BFPT. The post_sfdp_fixup()
does not return error code so cypress_nor_set_page_size() prints error
message instead of returning error code.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 47 ++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 676ffd6d12ec..d82dd750da9a 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -18,7 +18,7 @@
 #define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
 #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
-#define SPINOR_REG_CYPRESS_CFR3V		0x00800004
+#define SPINOR_REG_CYPRESS_CFR3			0x4
 #define SPINOR_REG_CYPRESS_CFR3V_PGSZ		BIT(4) /* Page size. */
 #define SPINOR_REG_CYPRESS_CFR5V		0x00800006
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x3
@@ -190,27 +190,34 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
  * The BFPT table advertises a 512B or 256B page size depending on part but the
  * page size is actually configurable (with the default being 256B). Read from
  * CFR3V[4] and set the correct size.
- *
- * Return: 0 on success, -errno otherwise.
  */
-static int cypress_nor_set_page_size(struct spi_nor *nor)
+static void cypress_nor_set_page_size(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_mem_op op =
-		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR3V,
+		CYPRESS_NOR_RD_ANY_REG_OP(params->addr_mode_nbytes, 0,
 					  nor->bouncebuf);
 	int ret;
+	u8 i;
 
-	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
-	if (ret)
-		return ret;
+	/* Set to default page size */
+	params->page_size = 256;
 
-	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
-		nor->params->page_size = 512;
-	else
-		nor->params->page_size = 256;
+	for (i = 0; i < params->num_of_dice; i++) {
+		op.addr.val = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR3;
 
-	return 0;
+		ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+		if (ret) {
+			dev_err(nor->dev, "Failed to read page size configuration. Use default 256B.\n");
+			return;
+		}
+
+		if (!(nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ))
+			return;
+	}
+
+	/* We reach here only when all dice are configured to 512B */
+	params->page_size = 512;
 }
 
 static int
@@ -221,7 +228,7 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 	/* Replace Quad Enable with volatile version */
 	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
 
-	return cypress_nor_set_page_size(nor);
+	return 0;
 }
 
 static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
@@ -246,6 +253,8 @@ static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 			break;
 		}
 	}
+
+	cypress_nor_set_page_size(nor);
 }
 
 static void s25hx_t_late_init(struct spi_nor *nor)
@@ -313,19 +322,13 @@ static void s28hs512t_post_sfdp_fixup(struct spi_nor *nor)
 	 * actual value for that is 4.
 	 */
 	nor->params->rdsr_addr_nbytes = 4;
-}
 
-static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
-				     const struct sfdp_parameter_header *bfpt_header,
-				     const struct sfdp_bfpt *bfpt)
-{
-	return cypress_nor_set_page_size(nor);
+	cypress_nor_set_page_size(nor);
 }
 
 static const struct spi_nor_fixups s28hs512t_fixups = {
 	.default_init = s28hs512t_default_init,
 	.post_sfdp = s28hs512t_post_sfdp_fixup,
-	.post_bfpt = s28hs512t_post_bfpt_fixup,
 };
 
 static int
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
