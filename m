Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4752EB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jul 2023 15:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrKRkCTBXBDymQ2LV48F7t2hEf7Opdh0DTsj5xbG6aQ=; b=fWJ05Ed4UkY5RY
	N6Hxyp6n+Du/etpbwLE+/7SctWZHXvlZ4ulicuC2btZc34VAtcg1u9AZ7B/dGu33icqHU2qH0DU1h
	B3rFLrbIG3ZxqPEPDDRnCyyRNKDdaK0+9jBYhlJEtmqDB/MF4PTt6mbpLzQW5OqcU4CnO10bGuLqT
	/ARDKYKNHOuliJ75ZrXDrQp8PWQqGiA4FIPyIQpllS3LwAk65zt96QS04pmVNFUA4WjJejlFR3JB9
	TVdJu+ccR6kaswEBCIStRMZ6GKOzecMZT9lXBx9po9C825mpGxItmyN0XAqgt7kRmqFUwjY8u8uSF
	XlUk5pdivLsITCxkaKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKP1-006Ti6-2B;
	Fri, 14 Jul 2023 15:08:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKOx-006TfZ-0d
	for linux-mtd@lists.infradead.org;
	Fri, 14 Jul 2023 15:08:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fc04692e20so19090645e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 14 Jul 2023 08:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689347283; x=1691939283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+25fSkkJ3LOx6seKX0QJU9kNSlEQwPNGN+WO1mhMvMI=;
        b=Lf90t73uKJmeeFq5uN4YHnr9sJ71rIEIK/flZU3SzfncDcf5OwbX1IaNvEqwOAb0b4
         xxBqFUEq3Uvnb+D3x4Cmp3x2N7XiE/ZXnI8W6ewz470ZtlQhqCrMmFr5mkPEBi4Zovuv
         YyA6fYsteZdMYHNGRhOWZc3PGOLjbcPE6uA5sYy29ZuMIhjRnBhHi0I7HXtdhfS1WBRH
         fwTfS2a842D87CKIquzHGJEyYYf8m4TMSD/8AZxD/T729gSgHZBJ4TCWookk3nD25VBr
         HsmBlJlGLwXekkIBJJtgDtBsvxi14OrKIvSjJddff0QUOHO7TwMS9UYllSLjShIU3DAr
         klVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689347283; x=1691939283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+25fSkkJ3LOx6seKX0QJU9kNSlEQwPNGN+WO1mhMvMI=;
        b=BbPlILy309xFdaPszmj+i1Eoewuj5ZV2ZRK7jLFo8REGSllepvopwXLQTt9eFKQoqU
         HsPIT5xcfbQElY7hvyqydAfkZwYTjwYkH68ty3tcgscJ38bItugQQnXAnBewFdhT6zLv
         SHmq+QeIclUbVv1OmcPcXBVtcEg8fsfVDRZLSdLRko8NDpyflFS4GkyvLQjOJmdqhtfS
         /ESpNG//rNkRx6wr8KbdviKYaDzRaSYaDrulMG0gWd3tZCHBsmoGpHfnXFK1/ecoU15X
         7gMhYeFjTtmgquzZE/omggV2TxVHsWAoa33hM7c2V3QNZ+r4HkwdUmUd6XE2gnrnvyug
         JuRw==
X-Gm-Message-State: ABy/qLa9FDglo62lYKDIKzTUabHcsNN8W2ViCYeSr6ecrkgyJ7eAqIZt
	e4uZ9VEl6HbrbDO2AFPgiX+38A==
X-Google-Smtp-Source: APBJJlENLcXufqPBumnSElb/7yqarWmZ3bKOHd1czA+a4aXqy+wlPkXkuyE3vtePDt+0cIIXJ8eC7w==
X-Received: by 2002:a5d:458c:0:b0:313:fcea:db06 with SMTP id p12-20020a5d458c000000b00313fceadb06mr4289774wrq.12.1689347282918;
        Fri, 14 Jul 2023 08:08:02 -0700 (PDT)
Received: from 1.. ([37.251.220.221])
        by smtp.gmail.com with ESMTPSA id k8-20020a5d5188000000b00314172ba213sm10977274wrv.108.2023.07.14.08.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 08:08:02 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc,
	pratyush@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] mtd: spi-nor: rename method for enabling or disabling octal DTR
Date: Fri, 14 Jul 2023 18:07:57 +0300
Message-Id: <20230714150757.15372-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616050600.8793-1-Takahiro.Kuwano@infineon.com>
References: <20230616050600.8793-1-Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6006; i=tudor.ambarus@linaro.org; h=from:subject; bh=Rd74k6/QPhZmiMzGtR06LDfyT/mYAR29wo1NOzFjRio=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBksWTNz/EGzj0cHtiJIYyXZ4exREnj4SDl/Q9FT GGzygf5bVOJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLFkzQAKCRBLVU9HpY0U 6WgmCACrK7IsyE77GiKfhN8ImYbHHgmWbi18hweYOW2aPSjKrtHkmWJwE+b/s2V2vZavXfhagXi u+zvw2Y5P0OXJJ+HNZ6xNZD+F5Io3DDJRVoKz0yGs+LQsdTC1rraNGMWlNDR91be+atg7TTP4We K1/GGVYbO/39Z4M8DOdA0O5HtKPxJFl6AbDAwHy+H4AH4qd5u2k2RH+4w44Lt2GzlkOMG5QW3OU tOWIfBPTs2utM+7jMf7QljZBxdiJlqT1aIlAr/MQCuOZiqtw0jJBj+2sHm1OkfPKUNeUGaeYavL Gn7VNmAPU5gKwscH0Jh84D7pajVOo/BnH7Kh6qx7hSMiNlDX
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_080811_299330_13402A34 
X-CRM114-Status: GOOD (  16.21  )
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

Having an *_enable(..., bool enable) definition was misleading
as the method is used both to enable and to disable the octal DTR
mode. Splitting the method in the core in two, one to enable and
another to disable the octal DTR mode does not make sense as the
method is straight forward and we'd introduce code duplication.

Update the core to use:
int (*set_octal_dtr)(struct spi_nor *nor, bool enable);

Manufacturer drivers use different sequences of commands to enable
and disable the octal DTR mode, thus for clarity they shall
implement it as:
static int manufacturer_snor_set_octal_dtr(struct spi_nor *nor, bool enable)
{
	return enable ? manufacturer_snor_octal_dtr_enable() :
			manufacturer_snor_octal_dtr_disable();
}

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c      | 12 ++++++------
 drivers/mtd/spi-nor/core.h      |  4 ++--
 drivers/mtd/spi-nor/micron-st.c |  4 ++--
 drivers/mtd/spi-nor/spansion.c  |  6 +++---
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 434c545c0ce4..273258f7e77f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3090,17 +3090,17 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	return 0;
 }
 
-/** spi_nor_octal_dtr_enable() - enable Octal DTR I/O if needed
+/** spi_nor_set_octal_dtr() - enable or disable Octal DTR I/O.
  * @nor:                 pointer to a 'struct spi_nor'
  * @enable:              whether to enable or disable Octal DTR
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
+static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
-	if (!nor->params->octal_dtr_enable)
+	if (!nor->params->set_octal_dtr)
 		return 0;
 
 	if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
@@ -3110,7 +3110,7 @@ static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 	if (!(nor->flags & SNOR_F_IO_MODE_EN_VOLATILE))
 		return 0;
 
-	ret = nor->params->octal_dtr_enable(nor, enable);
+	ret = nor->params->set_octal_dtr(nor, enable);
 	if (ret)
 		return ret;
 
@@ -3171,7 +3171,7 @@ static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
 
-	err = spi_nor_octal_dtr_enable(nor, true);
+	err = spi_nor_set_octal_dtr(nor, true);
 	if (err) {
 		dev_dbg(nor->dev, "octal mode not supported\n");
 		return err;
@@ -3273,7 +3273,7 @@ static int spi_nor_suspend(struct mtd_info *mtd)
 	int ret;
 
 	/* Disable octal DTR mode if we enabled it. */
-	ret = spi_nor_octal_dtr_enable(nor, false);
+	ret = spi_nor_set_octal_dtr(nor, false);
 	if (ret)
 		dev_err(nor->dev, "suspend() failed\n");
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 55b5e7abce6e..f2fc2cf78e55 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -364,7 +364,7 @@ struct spi_nor_otp {
  * @erase_map:		the erase map parsed from the SFDP Sector Map Parameter
  *                      Table.
  * @otp:		SPI NOR OTP info.
- * @octal_dtr_enable:	enables SPI NOR octal DTR mode.
+ * @set_octal_dtr:	enables or disables SPI NOR octal DTR mode.
  * @quad_enable:	enables SPI NOR quad mode.
  * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
  * @convert_addr:	converts an absolute address into something the flash
@@ -398,7 +398,7 @@ struct spi_nor_flash_parameter {
 	struct spi_nor_erase_map        erase_map;
 	struct spi_nor_otp		otp;
 
-	int (*octal_dtr_enable)(struct spi_nor *nor, bool enable);
+	int (*set_octal_dtr)(struct spi_nor *nor, bool enable);
 	int (*quad_enable)(struct spi_nor *nor);
 	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
 	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 4b919756a205..f79e71d99124 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -120,7 +120,7 @@ static int micron_st_nor_octal_dtr_dis(struct spi_nor *nor)
 	return 0;
 }
 
-static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
+static int micron_st_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 {
 	return enable ? micron_st_nor_octal_dtr_en(nor) :
 			micron_st_nor_octal_dtr_dis(nor);
@@ -128,7 +128,7 @@ static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 
 static void mt35xu512aba_default_init(struct spi_nor *nor)
 {
-	nor->params->octal_dtr_enable = micron_st_nor_octal_dtr_enable;
+	nor->params->set_octal_dtr = micron_st_nor_set_octal_dtr;
 }
 
 static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 36876aa849ed..6d6466a3436e 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -607,7 +607,7 @@ static struct spi_nor_fixups s25hx_t_fixups = {
 };
 
 /**
- * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
+ * cypress_nor_set_octal_dtr() - Enable or disable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
  * @enable:              whether to enable or disable Octal DTR
  *
@@ -616,7 +616,7 @@ static struct spi_nor_fixups s25hx_t_fixups = {
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
+static int cypress_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 {
 	return enable ? cypress_nor_octal_dtr_en(nor) :
 			cypress_nor_octal_dtr_dis(nor);
@@ -667,7 +667,7 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 
 static void s28hx_t_late_init(struct spi_nor *nor)
 {
-	nor->params->octal_dtr_enable = cypress_nor_octal_dtr_enable;
+	nor->params->set_octal_dtr = cypress_nor_set_octal_dtr;
 	cypress_nor_ecc_init(nor);
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
