Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1B1C76196
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 06:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgtbFElMO95wHWMRlo/FYQqLcsj5dU+lzK+RXqmRYFU=; b=KSqlL3Jy3m16nu
	+2De6Io/ZL+xGc0YgLJqzPbSfA+ieN5F5mrgszEzZOTTyroAJQatw0VkmK15HYbKHrGqhXOkWQn48
	MrH9fo0PlxHHRUcH93igrtB/wWaJPCWOZdp/wqt8O0kE7BFAxxerxFCOjgy4TKjJ+E+XLaJf/48G/
	2raXUB7GgYtf9amMXCk77OcYVh2z2iK51dFZ2RoRUteae9E4XjKHzURmJW9cFlwbu5j9i7bavLpYc
	uXORAlMKG/fbfhHArE4XIpN3GcOowLslx0csZcZ0Q4uaseOCSXhOhW4lWr8TTkNLWuh559vJ4rg3G
	ohDtPjmRC/zcWelreX4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfn5-009I7J-12;
	Fri, 07 Apr 2023 06:41:43 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfn1-009I5B-2V
	for linux-mtd@lists.infradead.org;
	Fri, 07 Apr 2023 06:41:41 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-514156b4976so98795a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2023 23:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680849698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=un0jH+BvXUy8JZS2TFdi6Y5/mRYagcdDM2S4IrcnSzA=;
        b=IBwyYMSqP5YxWVU6QLWL5+WuOes6GWYiY8WVmvlP09BoToid9YBR8trbEkuWvnGNNW
         +CQprDPRD/BgZaaPXc7I+MXistZ+ktQFA4BYKVWeUOcMvuCWHnWFSIRNJHUbKeOfDEBr
         0cBWX5WCFaK/USlDC71i6LJLsPHlZai00J5JFKPdUInx3PdDMLEI/tHg2SuLNx+UqWN5
         vOvzwG9N9/kel6HYDqT48ZQnNYQE48h4YO0bw5p30EBN3U2jL/VM3jhxSjtFrNriuJO1
         hgKp+mvwvvhLv1rhrSvKYe0UGzi2NNjEmHmIyDe6ZjxuZ+YYnATIhTciKt1gaVPIur5u
         od4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680849698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=un0jH+BvXUy8JZS2TFdi6Y5/mRYagcdDM2S4IrcnSzA=;
        b=TYxQI8KVVJPI3QKDTWjd2632C1QTosDcfS0NiuUcpn0Wp07PRZpBvdSgixhBVdhmO+
         x8ucpZv7kdGOtKmI3552CSNcFTEjzUJmH6heTrCRyalFYrc6arjbWfMMkKiUSqkI9osJ
         TvaZCT429NgFNTB1LL7Uf3Si+g2W05FIcaWHdADAlhFxOF4gMQrxD6sasKJsNxWUNp+a
         LW1HriQGMzdY/UcUkZXMh/Ny0XR67KoVeA0ibjhifZ3eCJcusaOIWHkwoIoz8EfURXUT
         SRtXfRAxBGTyh/JenaBp1eYF5vsyDcQcHnhF8ET4XJJZcULnwjShChELbq5LOGphkqGw
         xp3w==
X-Gm-Message-State: AAQBX9fgZmpDNr+aFhQplVSuufdeeKSKTtoB5rxuLpb/LsmNy0oR3Rw1
	lTccDkIMKX5Y1FrP7onmdhPEuvx3Swo=
X-Google-Smtp-Source: AKy350YsCbzpnEncBvJ3EXL91FtdIV4RDxUpaZL60G5hJ66VhyitGcVH9xdHic17LTfbnC8GL6tw7Q==
X-Received: by 2002:a62:4e4d:0:b0:5cb:eecd:387b with SMTP id c74-20020a624e4d000000b005cbeecd387bmr1457289pfb.33.1680849698333;
        Thu, 06 Apr 2023 23:41:38 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-220-119.msd.spmode.ne.jp. [49.98.220.119])
        by smtp.gmail.com with ESMTPSA id k14-20020aa790ce000000b005abc0d426c4sm2309806pfk.54.2023.04.06.23.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 23:41:37 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 3/8] mtd: spi-nor: Extract volatile register offset from SCCR map
Date: Fri,  7 Apr 2023 15:40:59 +0900
Message-Id: <e2cc39ad6e0e02dd8288c4def9bb201a3f564425.1680849425.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_234139_813957_40845B54 
X-CRM114-Status: GOOD (  14.44  )
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

In use of multi-chip devices, we need to access registers in each die for
configuration and status check. The number of dice in the device and
volatile register offsets for each die are essential to iterate register
access ops.

The volatile register offset for the first die resides in the 1st DWORD
of SCCR map. Allocate the table and copy the offset value.

The table may be allocated when the SCCR map for multi-chip is parsed.
Since we cannot assume SCCR parse is always in ahead of SCCR multi-chip,
we need to check if the table is already allocated or not.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.h |  4 ++++
 drivers/mtd/spi-nor/sfdp.c | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index a9e5e091547d..fd61c4793a10 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -352,6 +352,8 @@ struct spi_nor_otp {
  *			in octal DTR mode.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
  *			command in octal DTR mode.
+ * @n_dice:		number of dice in the flash memory.
+ * @vreg_offset:	volatile register offset for each die.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
  * @reads:		read capabilities ordered by priority: the higher index
@@ -385,6 +387,8 @@ struct spi_nor_flash_parameter {
 	u8				addr_mode_nbytes;
 	u8				rdsr_dummy;
 	u8				rdsr_addr_nbytes;
+	u8				n_dice;
+	u32				*vreg_offset;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index e184b67f3c9f..9d43e18d3770 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1226,6 +1226,7 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 static int spi_nor_parse_sccr(struct spi_nor *nor,
 			      const struct sfdp_parameter_header *sccr_header)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	u32 *dwords, addr;
 	size_t len;
 	int ret;
@@ -1242,6 +1243,18 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 
 	le32_to_cpu_array(dwords, sccr_header->length);
 
+	/* Address offset for volatile registers (die 0) */
+	if (!params->vreg_offset) {
+		params->vreg_offset = devm_kmalloc(nor->dev, sizeof(*dwords),
+						   GFP_KERNEL);
+		if (!params->vreg_offset) {
+			ret = -ENOMEM;
+			goto out;
+		}
+	}
+	params->vreg_offset[0] = dwords[SFDP_DWORD(1)];
+	params->n_dice = 1;
+
 	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE,
 		      dwords[SFDP_DWORD(22)]))
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
