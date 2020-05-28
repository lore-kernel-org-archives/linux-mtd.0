Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28228C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:00:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8A792063A
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:00:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TzisV4K7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8A792063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rUkc42sDqD4WS2ptUuDzFqKSUWnOx8AF97GLJGNVFyc=; b=TzisV4K7zAsLxE5xtpBU4m5hSq
	vru0lnlYOo+4Cpfln8JK65xQYCJlWUPD439Qt6qOE6lHsoDLQl/MgsaLxgNYSErVAoIKnAwtaoLQ8
	/owSU6g+A4Lmo5FNDlAKh7XZoCb+Q5qbFr+i6WcafbCz59JKxw+sszg1C9ajiYowoyuGzc7cXmZxt
	sKk36fvp4shVDg92yUmo9u7JVw8eeI2txTZi+ZZqqTNhXI+B8m8sYP84Yatv5CgJJErl3ndCzGPrK
	wQF+bnsFIQhGlG5kse8aLC1/CNNyuoEWrZP1fH3zOzuZp5UOJaS4j3LSH23xu0CmcCr80WLu7cDg7
	Y7C1SPrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDSy-0002sc-AX; Thu, 28 May 2020 08:00:40 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeDRY-0007kN-Tu
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 07:59:15 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id 04S7wMHf030973;
 Thu, 28 May 2020 15:58:27 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, tudor.ambarus@microchip.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com,
 matthias.bgg@gmail.com
Subject: [PATCH v3 06/14] mtd: spi-nor: sfdp: get octal mode maximum speed
 from BFPT
Date: Thu, 28 May 2020 15:58:08 +0800
Message-Id: <1590652696-8844-7-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1590652696-8844-1-git-send-email-masonccyang@mxic.com.tw>
References: <1590652696-8844-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com 04S7wMHf030973
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_005913_221248_F6C0ABEA 
X-CRM114-Status: GOOD (  11.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mason Yang <masonccyang@mxic.com.tw>, p.yadav@ti.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Get maximum operation speed of device in octal mode from
BFPT 20th DWORD.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.h |  2 ++
 drivers/mtd/spi-nor/sfdp.c | 36 ++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.h |  4 ++++
 3 files changed, 42 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index de1e391..f644ed1 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -192,6 +192,7 @@ struct spi_nor_locking_ops {
  *
  * @size:		the flash memory density in bytes.
  * @page_size:		the page size of the SPI NOR flash memory.
+ * @octal_max_speed:	maximum operation speed of device in octal mode.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
  * @reads:		read capabilities ordered by priority: the higher index
@@ -214,6 +215,7 @@ struct spi_nor_locking_ops {
 struct spi_nor_flash_parameter {
 	u64				size;
 	u32				page_size;
+	u16				octal_max_speed;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 3685a3a..d7ef47a 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2014, Freescale Semiconductor, Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
 #include <linux/mtd/spi-nor.h>
@@ -26,6 +27,12 @@
 #define SFDP_JESD216A_MINOR	5
 #define SFDP_JESD216B_MINOR	6
 
+/* Basic Flash Parameter Table 20th DWORD, Max operation speed of device */
+struct octal_max_speed {
+	u8 idx; /* Bits value */
+	u16 hz; /* MHz */
+};
+
 struct sfdp_header {
 	u32		signature; /* Ox50444653U <=> "SFDP" */
 	u8		minor;
@@ -440,6 +447,22 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	u32 addr;
 	u16 half;
 	u8 erase_mask;
+	static const struct octal_max_speed max_hz[] = {
+		/* Bits value, MHz */
+		{ 0x0c, 400 },
+		{ 0x0b, 333 },
+		{ 0x0a, 266 },
+		{ 0x09, 250 },
+		{ 0x08, 200 },
+		{ 0x07, 166 },
+		{ 0x06, 133 },
+		{ 0x05, 100 },
+		{ 0x04,  80 },
+		{ 0x03,  66 },
+		{ 0x02,  50 },
+		{ 0x01,  33 },
+	};
+	u8 idx;
 
 	/* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs. */
 	if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
@@ -626,6 +649,19 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return -ENOTSUPP;
 	}
 
+	/* Octal mode max speed */
+	idx = max(FIELD_GET(BFPT_DWORD20_OCTAL_DTR_MAX_SPEED,
+			    bfpt.dwords[BFPT_DWORD(20)]),
+		  FIELD_GET(BFPT_DWORD20_OCTAL_STR_MAX_SPEED,
+			    bfpt.dwords[BFPT_DWORD(20)]));
+
+	for (i = 0; i < ARRAY_SIZE(max_hz); i++) {
+		if (max_hz[i].idx == idx) {
+			params->octal_max_speed = max_hz[i].hz;
+			break;
+		}
+	}
+
 	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt, params);
 }
 
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index e15e307..d8ee681 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -90,6 +90,10 @@ struct sfdp_bfpt {
 #define BFPT_DWORD18_CMD_EXT_RES		(0x2UL << 29) /* Reserved */
 #define BFPT_DWORD18_CMD_EXT_16B		(0x3UL << 29) /* 16-bit opcode */
 
+#define BFPT_DWORD20_OCTAL_MAX_SPEED_MASK       GENMASK(31, 16)
+#define BFPT_DWORD20_OCTAL_DTR_MAX_SPEED        GENMASK(31, 28)
+#define BFPT_DWORD20_OCTAL_STR_MAX_SPEED        GENMASK(19, 16)
+
 struct sfdp_parameter_header {
 	u8		id_lsb;
 	u8		minor;
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
