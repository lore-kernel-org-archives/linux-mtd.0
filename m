Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E596C6FA82
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 18:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPqHgB99gLlV6TIN89VJiSJ44Af/hkKqJFvFPWx4uJg=; b=kr8Xag1ZSAX+Oi
	OLNPNCQwTwV4b63SwgH5sT7H6sbNL6i8kceKNZNryIo70mtmPbE28qXZA856k6t/ml2CNzFA8WLUe
	N3MPYoRGkzia1oMVeEP+LEQhAwm0pBVoOqFUn974G6rjKxe0s96c6WUTnCAF5cUrRsksYyGs/DwOy
	LRG3Mx8U56OI6aN9ocEzxRiTm9m5bK3SfjQ/thZgeL4Si5pqUqOl4Fi0MSFCjVjUWuNUP46QwP2ou
	5asZ+/Ze/6rTN2tJ0FPg58gvT4k6zT2IePwGYrQ7oQ1UrAT6uXZpB5Yr7244M41U92G17F6+AThcn
	FE6CDzNECVz0/mLwY/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiID-005oeK-37; Tue, 20 Sep 2022 18:48:25 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiI2-005oZX-KP
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 18:48:16 +0000
Received: by mail-wr1-x42a.google.com with SMTP id e16so5934584wrx.7
        for <linux-mtd@lists.infradead.org>; Tue, 20 Sep 2022 11:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=sYGkRYa3l7UDhvpu09qUEbAPCdOAg7Sh9qulo+MPJsg=;
        b=RhEADarMcfwqx06RJ5pKHOLDpARgUmLEibIOuaPmPrmtHeGpNQb8+bpiW6fDW0LlqY
         ByvGg4YAL/NTG5nQQM2bDGEMh26Js9cw10ws0aK7w2ShLXyG2Ke8E5/XpoYq3R7qLjY1
         uW2nzhKZY7q7gNsBxwCZR+jSk7dQ1lssroYMmB5FKVyaPPWd/EMAU0Hf9uzSqRLqhbGp
         ONLmc3V63ZX8QOt7kshON/KuHkvp2vSWkrHt2nvJPknbmvMabA7xOCOfbeugb3k6SYgz
         4oOfutXiAl3nJUnQ5Kzm6Y2g3116T1QzfGprD9cmXj279vtlaELjbpfIC+NcUIpajUkM
         VtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=sYGkRYa3l7UDhvpu09qUEbAPCdOAg7Sh9qulo+MPJsg=;
        b=AWBX2JUSK+HqARxDNptlu5lTDnYkgnfi2NE3DdjH2bEayX2h3fp0qPexCLSbqq1Pgp
         DpOGfFLos3z7cYfzOz7gr2EW4KhWnSb+KRicFjHVQxBOFaOnY0YcbypPGNoHSb8V0iZz
         rD5bCO5h1DQYKF3MijfE8Tb7sQ71meZcJNEBkOwWeHhpbKrohY5ORzPphGk5p4K/RKT6
         cfYC/fkPWwBqizW7WgG7f8API2JRxDLAQjgNrbI9DnaMTACM0sWHSVmKN2Iuf226VECy
         9DZAvUnarviMsW6KUyXkQlUHgs7Jh6nUOTPh7LNNsunErt9ELWhFXIf4nZF1bClz4y/j
         3zRQ==
X-Gm-Message-State: ACrzQf3XmpfrrYn3RDyZN0tikdku8S9dV7IrdDzk50aJJJIPz9iBuwfQ
	geiEr8JXDIhDS12zgdVyXyfvhA==
X-Google-Smtp-Source: AMsMyM7pa5QdD4ZmGPKkW3ltpbqJyuLGw/cLMDy6S75S+Zi8DkGzecVEEWssv0F0yB4mdO8A6QmlOA==
X-Received: by 2002:adf:f80b:0:b0:228:dbb9:5bdf with SMTP id s11-20020adff80b000000b00228dbb95bdfmr14987846wrp.327.1663699690940;
        Tue, 20 Sep 2022 11:48:10 -0700 (PDT)
Received: from localhost.localdomain (host-78-150-37-98.as13285.net. [78.150.37.98])
        by smtp.gmail.com with ESMTPSA id l16-20020a7bc350000000b003b4c40378casm469974wmj.39.2022.09.20.11.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 11:48:10 -0700 (PDT)
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: greentime.hu@sifive.com,
	jude.onyenegecha@sifive.com,
	william.salmon@sifive.com,
	adnan.chowdhury@sifive.com,
	ben.dooks@sifive.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudip.mukherjee@sifive.com>
Subject: [PATCH v3 2/2] mtd: spi-nor: add SFDP fixups for Quad Page Program
Date: Tue, 20 Sep 2022 19:48:08 +0100
Message-Id: <20220920184808.44876-2-sudip.mukherjee@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
References: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_114814_691148_75858588 
X-CRM114-Status: GOOD (  14.88  )
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

SFDP table of some flash chips do not advertise support of Quad Input
Page Program even though it has support. Use flags and add hardware
cap for these chips.

Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
---

Change from v2: SPI_NOR_QUAD_PP added to info->flags instead of
info->fixup_flags.
Link: https://lore.kernel.org/lkml/498c33a8-014f-e542-f143-cba5760fafdd@microchip.com/

Results from the tests given by Tudor in the following mail.

 drivers/mtd/spi-nor/core.c | 6 ++++++
 drivers/mtd/spi-nor/core.h | 2 ++
 drivers/mtd/spi-nor/issi.c | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f2c64006f8d75..992fb332514d8 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2474,6 +2474,12 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 	 */
 	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
 		spi_nor_init_default_locking_ops(nor);
+
+	if (nor->info->flags & SPI_NOR_QUAD_PP) {
+		nor->params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
+		spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP_1_1_4],
+					SPINOR_OP_PP_1_1_4, SNOR_PROTO_1_1_4);
+	}
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 85b0cf254e974..c2334fe33e2f9 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -458,6 +458,7 @@ struct spi_nor_fixups {
  *   SPI_NOR_NO_ERASE:        no erase command needed.
  *   NO_CHIP_ERASE:           chip does not support chip erase.
  *   SPI_NOR_NO_FR:           can't do fastread.
+ *   SPI_NOR_QUAD_PP:         flash supports Quad Input Page Program.
  *
  * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
  *                  Used when SFDP tables are not defined in the flash. These
@@ -507,6 +508,7 @@ struct flash_info {
 #define SPI_NOR_NO_ERASE		BIT(6)
 #define NO_CHIP_ERASE			BIT(7)
 #define SPI_NOR_NO_FR			BIT(8)
+#define SPI_NOR_QUAD_PP			BIT(9)
 
 	u8 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 8b48459b5054c..014cd9038bedc 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -73,6 +73,7 @@ static const struct flash_info issi_nor_parts[] = {
 	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512)
 		PARSE_SFDP
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		FLAGS(SPI_NOR_QUAD_PP)
 		.fixups = &is25lp256_fixups },
 
 	/* PMC */
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
