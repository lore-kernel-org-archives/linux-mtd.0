Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A031EE57D5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 06:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kG+eurvyL/T2uU5eLnZEGWyDCYdBI7nEZRVU5USJreY=; b=jrug8HiH6GA56h
	icjzuK89orPh4LI8rk+JinNFAUQDB3LcgPBLiPl0rC9PSyJ1HhZFNcqmoRjt6cXR4a6zSNnSbaAhT
	M14DOJR1AXd3MPcH1NkXoYqgqohVbYfMNaoVPjKumZhfHac7XoyL6Cy8laF33ZP8cYkBJ6EJNK6FG
	UmIaIN051hAS8WmZu0yh7nffDulYAGshU+TM4QuKflM32lZXTCIWEFcBhEHlf8cK41OR6jVzBlaNU
	oNIHMlmJyRbqgRNvk5hAT+SQGzGMQZXfP7M9xWzCvuTIuPa+/hvHkEJ5TwFXauMKmWWXERXOGZplX
	BopAefob0HW9rGFEL3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVD3-00DBIt-2d;
	Fri, 08 Sep 2023 06:43:17 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVCy-00DBGM-1A
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 06:43:14 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-573ccec985dso1300700a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 07 Sep 2023 23:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694155390; x=1694760190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eby1PoaloBESLJImDfgmBJFqOV0ivhypXV8zrNm7FsY=;
        b=hXJ74mH74pv8sRpg+/m76pfzSTdVku1VyfdsbCJjUaPUi5TU4W+1uc3B0boIih1l6i
         dICr9FE0rWVOxIZPOh+ID1nTMVnam8vtVC4UqDcAkcboqarhBBDEp/17TZ3hhwedi1Wb
         Aftv0gwnGd+sv33vFH7AWvNRHm/SOb0FuR4MgbjoXO8rmi6gEuHusJlMoNSR0Jf1k0Q5
         OMo/rG9vfdaXU3Z7PYIe2OZ10G+POxhjHFopL5JRh9l0v3xQCIqO9tkqzDCiduezyO1H
         SCGfCnnqHehe6ctCk9GZ8vUfJ9ItHAZSy0VhDwFF/TgBB+3pLn6WaELdNUudcOs2TmqI
         Odwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694155390; x=1694760190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eby1PoaloBESLJImDfgmBJFqOV0ivhypXV8zrNm7FsY=;
        b=IayKiYBLuDz9XIh9y90LwYTSGiYiPGQrs4NtFyBQYe8HeLwM0MAn7HyDrO1EoS9Jxk
         7/ANAXtk31mjOx5Em1sJuxG5e1SKkPg5Ou+H2qebUFq67k2CehTV2wojHNxm/HhcSEgz
         51n7NAn0HCsWQZ72zF0s8HnI7FG9/dp4+V0c2/1j7Rz7FoqtTD34hp2BAEGPoNx92nbV
         ijKz9BKMBDxaB8pgKXxjPJHZvZ3HcggJM3HBa4JLZQPJ6yINEKh2wKdb6zKKzA78FTu0
         tCykito3fxWMcYhOjK+LgQwvG3h3Ev5nNHMmzDG+HoAuyqprLiYYIQbdGuFs43gXARr5
         Us0A==
X-Gm-Message-State: AOJu0YysaT3wD6uoRDKhc5brEEK5B2WfT/B3ExBr/FkMl+hovWwQgL2D
	+2pGUDoMtxzI45/DetLH8cGgSsCKYn0=
X-Google-Smtp-Source: AGHT+IF+QtHKUpaFKyYRgiBALoq7QeOyUUXn3ET7LnPHoeg6rVPR+GNx6WAVa4NPgYrTqjIpeTUViA==
X-Received: by 2002:a05:6a20:549b:b0:134:5c75:3d23 with SMTP id i27-20020a056a20549b00b001345c753d23mr2143953pzk.18.1694155390187;
        Thu, 07 Sep 2023 23:43:10 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id jh2-20020a170903328200b001bc35b14c99sm802768plb.212.2023.09.07.23.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 23:43:09 -0700 (PDT)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id DD33780E2B;
	Fri,  8 Sep 2023 14:45:06 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v4 1/6] mtd: spi-nor: Add manufacturer read id function
Date: Fri,  8 Sep 2023 14:42:59 +0800
Message-Id: <20230908064304.27757-2-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_234312_405458_B92A0350 
X-CRM114-Status: GOOD (  19.40  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Add manufacturer read id function because of some flash
may change data format when read id in octal dtr mode.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c     | 30 ++++++++++++++++++++++++++++--
 drivers/mtd/spi-nor/core.h     |  6 ++++++
 drivers/mtd/spi-nor/macronix.c | 18 ++++++++++++++++++
 3 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1b0c6770c14e..7ee624b16e17 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -408,7 +408,7 @@ int spi_nor_write_disable(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_read_id() - Read the JEDEC ID.
+ * spi_nor_default_read_id() - Read the JEDEC ID.
  * @nor:	pointer to 'struct spi_nor'.
  * @naddr:	number of address bytes to send. Can be zero if the operation
  *		does not need to send an address.
@@ -420,7 +420,7 @@ int spi_nor_write_disable(struct spi_nor *nor)
  *
  * Return: 0 on success, -errno otherwise.
  */
-int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
+int spi_nor_default_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
 		    enum spi_nor_protocol proto)
 {
 	int ret;
@@ -438,6 +438,32 @@ int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
 	return ret;
 }
 
+/**
+ * spi_nor_read_id() - Read ID by manufacturer read id function.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @naddr:	number of address bytes to send. Can be zero if the operation
+ *		does not need to send an address.
+ * @ndummy:	number of dummy bytes to send after an opcode or address. Can
+ *		be zero if the operation does not require dummy bytes.
+ * @id:		pointer to a DMA-able buffer where the value of the JEDEC ID
+ *		will be written.
+ * @proto:	the SPI protocol for register operation.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
+		    enum spi_nor_protocol proto)
+{
+	int ret;
+
+	if (nor->manufacturer && nor->manufacturer->fixups && nor->manufacturer->fixups->read_id)
+		ret = nor->manufacturer->fixups->read_id(nor, naddr, ndummy, id, proto);
+	else
+		ret = spi_nor_default_read_id(nor, naddr, ndummy, id, proto);
+
+	return ret;
+}
+
 /**
  * spi_nor_read_sr() - Read the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 9217379b9cfe..92cbc2d3f7fe 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -424,6 +424,8 @@ struct spi_nor_flash_parameter {
  * @late_init: used to initialize flash parameters that are not declared in the
  *             JESD216 SFDP standard, or where SFDP tables not defined at all.
  *             Will replace the default_init() hook.
+ * @read_id:   used to read id which may change format after enter into
+	       octal dtr mode.
  *
  * Those hooks can be used to tweak the SPI NOR configuration when the SFDP
  * table is broken or not available.
@@ -435,6 +437,8 @@ struct spi_nor_fixups {
 			 const struct sfdp_bfpt *bfpt);
 	int (*post_sfdp)(struct spi_nor *nor);
 	int (*late_init)(struct spi_nor *nor);
+	int (*read_id)(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
+		       enum spi_nor_protocol reg_proto);
 };
 
 /**
@@ -667,6 +671,8 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor);
 int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
+int spi_nor_default_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
+			    enum spi_nor_protocol reg_proto);
 int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
 		    enum spi_nor_protocol reg_proto);
 int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index eb149e517c1f..8ab47691dfbb 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -118,9 +118,27 @@ static int macronix_nor_late_init(struct spi_nor *nor)
 	return 0;
 }
 
+static int macronix_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
+				enum spi_nor_protocol proto)
+{
+	int i, ret;
+
+	ret = spi_nor_default_read_id(nor, naddr, ndummy, id, proto);
+	/* Retrieve odd array and re-sort id because of read id format will be A-A-B-B-C-C
+	 * after enter into octal dtr mode for Macronix flashes.
+	 */
+	if (proto == SNOR_PROTO_8_8_8_DTR) {
+		for (i = 0; i < nor->info->id_len; i++)
+			id[i] = id[i*2];
+	}
+
+	return ret;
+}
+
 static const struct spi_nor_fixups macronix_nor_fixups = {
 	.default_init = macronix_nor_default_init,
 	.late_init = macronix_nor_late_init,
+	.read_id = macronix_nor_read_id,
 };
 
 const struct spi_nor_manufacturer spi_nor_macronix = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
