Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE24C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 09:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GzXRX6p4LdjrrnNREgjDd/9tdjizharOHj6BKdZKBeg=; b=GqmTiCHcAIoU0h
	dafjArF/DVwxL+UkV+hWwpgCOYPsaKrDaYMv8mluCvQ7osJAOaLlpeopjPCYTKcYEdY5vL9feJZup
	edIefJ+zsUewH4q3imS63XiIHpGXfHfXUWX5G0IBqux1rmcTEsKxalYpUr7mQmlW3lWnUHI9/YLzI
	35r6cBAMOwJO+R/U9aO/CB9AMoJD11ppDNgXjDJaLohmWiZiH+R0Qw79/HtJ9ciqQ5G3GUpBeLU+H
	ErOO8w6LIb2NnZxQNscVCotvR3YReiIZZ7SQ5LxMlIWSInkMrOx5cv4E38fekKxy05SDc+Ff+lh/l
	jb0B6ra83d5puB7mlGlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE5c-000WDK-LW; Thu, 09 Jun 2022 09:04:29 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE1C-000Tsp-5j
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 08:59:56 +0000
Received: by mail-pj1-x1034.google.com with SMTP id j7so20809266pjn.4
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 01:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tSXgMQ+JPPKthZ/OrYLrIhCK+stKM+9YsnH2iC2Q9OE=;
        b=nGS3BzwfGZMShDiII9/wyRtF9xQIhfe57x1mPbsuydht0+e1dWjQXOKCWErzFAxNCr
         JJ0O95n2aHG3yTuTrHCYpSzTTW2lC7L3GmEyfuTLbY+mFA5x199soHU5VkEv5itAUcDA
         +qld43FhJaRqkQbnoNEL+LrKgxbcK2oWOCWhCMsqY07FXPWq0BhA2iKKmXl4yvcjfRpN
         ey2CJ/9TearkkddJ84g/sWuyDZyLeuCZNa/jIPqDnWdwH1qGRLHHURGu5i0CjGR2Ig0E
         mn+mQnJ6Z+ky1J0nEW/box0734pXoGMfI0Y7rV8XmALBLAgq67t7caSl+nOGhYv9uIkt
         1bpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tSXgMQ+JPPKthZ/OrYLrIhCK+stKM+9YsnH2iC2Q9OE=;
        b=Grb5g0a+4eOAQnndU48K29O5JuiaEMQgaUHyhBZ2xG4Kw/hNL7pH7sdllIX/qblAyT
         X+OusOvQRWuF9eSlM6HRI8CRbtQG+grscQ26y8vrEsRF3+oW5A2+AK2VCLUe3/28H2S8
         cV4krXAg5Rn0GwYm3mqqWpqXxXUcSZCs43pXggF26E67Oeg6YTC9Bno9G0KGBSc+Pxzt
         u/GKE72xGlrRWkDKm8NKrr64/nyRrEwCZRTjJG3QZiVKZSYZ9ruIwhFMNVt0YUgbDNLQ
         BFPGlMMOJjBId5xJuXx/I1VOvaQE2XbvN3qORfVKZO2sCHLEz6StUD1mE2muhw8Huqu3
         OScg==
X-Gm-Message-State: AOAM532b2cHupgfTxHKqmohcoYvJ70l+gRfjg91J0vbKnlG6dBLYP6Y8
	SgMxx6LSauxXCfzvFIpsMgVSdDIYhtA=
X-Google-Smtp-Source: ABdhPJyIc9+kbL99a12MA3B7PiiGOn7lxeE2Lg/LA/zNeHju1Nuv6QBy3zv4+EzWTYIW/VQ/C7Xh/A==
X-Received: by 2002:a17:90a:aa8a:b0:1c9:bfd8:9a90 with SMTP id l10-20020a17090aaa8a00b001c9bfd89a90mr2436023pjq.118.1654765192578;
        Thu, 09 Jun 2022 01:59:52 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
        by smtp.gmail.com with ESMTPSA id ja13-20020a170902efcd00b00168adae4eb2sm575997plb.262.2022.06.09.01.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 01:59:52 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	p.yadav@ti.com,
	michael@walle.cc,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v16 5/8] mtd: spi-nor: core: Couple the number of address 
Date: Thu,  9 Jun 2022 17:57:42 +0900
Message-Id: <7a6a4c6b5743835dc6f27173b48ecae375656dab.1654741889.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
References: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_015954_290648_9BC9E94E 
X-CRM114-Status: GOOD (  26.39  )
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

Some of Infineon chips support volatile version of configuration registers
and it is recommended to update volatile registers in the field application
due to a risk of the non-volatile registers corruption by power interrupt.
Such a volatile configuration register is used to enable the Quad mode.
The register write sequence requires the number of bytes of address in
order to be programmed. As it was before, the nor->addr_nbytes was set to 4
before calling the volatile Quad enable method. This was incorrect because
the Write Any Register command does not have a 4B opcode equivalent and the
address mode was still at default (3-byte mode) and not changed to 4 by
entering in the 4 Byte Address Mode, so the operation failed.

Move the setting of the number of bytes of address after the Quad Enable
method to allow reads or writes to registers that require the number of
address bytes to work with the default address mode. The number of address
bytes and the address mode are tightly coupled, this is a natural change.

Other (standard) Quad Enable methods are not affected, as they don't
require the number of address bytes, so no functionality changes expected.

Reported-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v16:
  - Return error code from set_4byte_addr_mode()

 drivers/mtd/spi-nor/core.c | 134 +++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 64 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3aa159d29159..883df4c47e4e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2249,49 +2249,6 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 	return 0;
 }
 
-static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
-{
-	if (nor->params->addr_nbytes) {
-		nor->addr_nbytes = nor->params->addr_nbytes;
-	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
-		/*
-		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
-		 * in this protocol an odd address width cannot be used because
-		 * then the address phase would only span a cycle and a half.
-		 * Half a cycle would be left over. We would then have to start
-		 * the dummy phase in the middle of a cycle and so too the data
-		 * phase, and we will end the transaction with half a cycle left
-		 * over.
-		 *
-		 * Force all 8D-8D-8D flashes to use an address width of 4 to
-		 * avoid this situation.
-		 */
-		nor->addr_nbytes = 4;
-	} else if (nor->info->addr_nbytes) {
-		nor->addr_nbytes = nor->info->addr_nbytes;
-	} else {
-		nor->addr_nbytes = 3;
-	}
-
-	if (nor->addr_nbytes == 3 && nor->params->size > 0x1000000) {
-		/* enable 4-byte addressing if the device exceeds 16MiB */
-		nor->addr_nbytes = 4;
-	}
-
-	if (nor->addr_nbytes > SPI_NOR_MAX_ADDR_NBYTES) {
-		dev_dbg(nor->dev, "address width is too large: %u\n",
-			nor->addr_nbytes);
-		return -EINVAL;
-	}
-
-	/* Set 4byte opcodes when possible. */
-	if (nor->addr_nbytes == 4 && nor->flags & SNOR_F_4B_OPCODES &&
-	    !(nor->flags & SNOR_F_HAS_4BAIT))
-		spi_nor_set_4byte_opcodes(nor);
-
-	return 0;
-}
-
 static int spi_nor_setup(struct spi_nor *nor,
 			 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -2301,10 +2258,7 @@ static int spi_nor_setup(struct spi_nor *nor,
 		ret = nor->params->setup(nor, hwcaps);
 	else
 		ret = spi_nor_default_setup(nor, hwcaps);
-	if (ret)
-		return ret;
-
-	return spi_nor_set_addr_nbytes(nor);
+	return ret;
 }
 
 /**
@@ -2686,6 +2640,74 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
 	return nor->params->quad_enable(nor);
 }
 
+static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
+{
+	if (nor->params->addr_nbytes) {
+		nor->addr_nbytes = nor->params->addr_nbytes;
+	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
+		/*
+		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
+		 * in this protocol an odd address width cannot be used because
+		 * then the address phase would only span a cycle and a half.
+		 * Half a cycle would be left over. We would then have to start
+		 * the dummy phase in the middle of a cycle and so too the data
+		 * phase, and we will end the transaction with half a cycle left
+		 * over.
+		 *
+		 * Force all 8D-8D-8D flashes to use an address width of 4 to
+		 * avoid this situation.
+		 */
+		nor->addr_nbytes = 4;
+	} else if (nor->info->addr_nbytes) {
+		nor->addr_nbytes = nor->info->addr_nbytes;
+	} else {
+		nor->addr_nbytes = 3;
+	}
+
+	if (nor->addr_nbytes == 3 && nor->params->size > 0x1000000) {
+		/* enable 4-byte addressing if the device exceeds 16MiB */
+		nor->addr_nbytes = 4;
+	}
+
+	if (nor->addr_nbytes > SPI_NOR_MAX_ADDR_NBYTES) {
+		dev_dbg(nor->dev, "address width is too large: %u\n",
+			nor->addr_nbytes);
+		return -EINVAL;
+	}
+
+	/* Set 4byte opcodes when possible. */
+	if (nor->addr_nbytes == 4 && nor->flags & SNOR_F_4B_OPCODES &&
+	    !(nor->flags & SNOR_F_HAS_4BAIT))
+		spi_nor_set_4byte_opcodes(nor);
+
+	return 0;
+}
+
+static int spi_nor_set_addr_mode(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = spi_nor_set_addr_nbytes(nor);
+	if (ret)
+		return ret;
+
+	if (nor->addr_nbytes == 4 && nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
+	    !(nor->flags & SNOR_F_4B_OPCODES)) {
+		/*
+		 * If the RESET# pin isn't hooked up properly, or the system
+		 * otherwise doesn't perform a reset command in the boot
+		 * sequence, it's impossible to 100% protect against unexpected
+		 * reboots (e.g., crashes). Warn the user (or hopefully, system
+		 * designer) that this is bad.
+		 */
+		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
+			  "enabling reset hack; may not recover from unexpected reboots\n");
+		return nor->params->set_4byte_addr_mode(nor, true);
+	}
+
+	return 0;
+}
+
 static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
@@ -2717,22 +2739,7 @@ static int spi_nor_init(struct spi_nor *nor)
 	     nor->flags & SNOR_F_SWP_IS_VOLATILE))
 		spi_nor_try_unlock_all(nor);
 
-	if (nor->addr_nbytes == 4 &&
-	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
-	    !(nor->flags & SNOR_F_4B_OPCODES)) {
-		/*
-		 * If the RESET# pin isn't hooked up properly, or the system
-		 * otherwise doesn't perform a reset command in the boot
-		 * sequence, it's impossible to 100% protect against unexpected
-		 * reboots (e.g., crashes). Warn the user (or hopefully, system
-		 * designer) that this is bad.
-		 */
-		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
-			  "enabling reset hack; may not recover from unexpected reboots\n");
-		return nor->params->set_4byte_addr_mode(nor, true);
-	}
-
-	return 0;
+	return spi_nor_set_addr_mode(nor);
 }
 
 /**
@@ -2988,7 +2995,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
 	 * - set the number of dummy cycles (mode cycles + wait states).
 	 * - set the SPI protocols for register and memory accesses.
-	 * - set the address width.
 	 */
 	ret = spi_nor_setup(nor, hwcaps);
 	if (ret)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
