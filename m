Return-Path: <SRS0=RgZt=UU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DD2C43613
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 17:14:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AD02208C3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 17:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kdRo7UZk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Q2ZSk9vC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AD02208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hY9Gs3+aiDOGqhvjpL7auUQUOLU1msGbbQKxGauErGY=; b=kdRo7UZk+dH3aZSmdSITrIGeVk
	0kE9mps/MT7fdDTKNlHB0Rkz8Q3+VLhs8joaKiiYELeHkW+iQ38hJsAiJ0ttGEwyY3PbaVlhMMHHT
	OnLMv3zH4RxYpVLIKR8N74sRuPmpypVWVlGHpFjyiwkgfMJYGcb8nzFFf2Y5vunjTLi9r5xYNzFYZ
	82EBxwlmHl5GcCqd6m7YcFUCb4/UNW0XS0oW5tKV4i/I+cOCpKoY3Hhytzd6O4qjCuwtNR+GgJLZ8
	iXYL2hLO/e3Qvoj8PJTbvoY9Og4ITqVGwPqr9HkV8wVwkTpgsKHmBAM5/A8BV7mfHOvN3YFdOJjtg
	p31wbXkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heN7N-0001KQ-UK; Fri, 21 Jun 2019 17:14:29 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heN75-00011C-9j
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2019 17:14:13 +0000
Received: by mail-pl1-x644.google.com with SMTP id bi6so3302521plb.12
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2019 10:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N/kCe23FnlWfiZKCbStw0AW/YTrnxdjyv6vYAsNOAfw=;
 b=Q2ZSk9vCw+x+iIH32bIfRqP8Yt6xOoasPqtyRr/dtPPg+PLC4VbFUdjgFhRw/R0QJM
 Owwfsn1FTFHgoI78Yq/vJj3PEh47ix8wwHxygErkGAq7SmyQA+OsVev+5/2H5mS2WydR
 HM+epn2ETGVRCx0UAHlY6DmpyTsDnHWP1PZi60/KLhDnqjb6TmEMoJTEY+FrNwDr7LUB
 l2ohcg4Fu9aoo0c8EQ3UiEj4VqNymY5YKZZdoWirBBwJufUbrfYxMJFaXbEpUbxy0NK2
 Yn0cAmT+HE1ZeZX3EGQw4sXzURRVrJbInZFnloDMvKyfdBBflZNuBFSHasxKKPtvyd/l
 0mGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N/kCe23FnlWfiZKCbStw0AW/YTrnxdjyv6vYAsNOAfw=;
 b=jVSl4rPmNl0j7TwZUlNKlDICTou1dvakuCAu9CzmKfc/XMz9R6SD7aytyh3RWQfZt3
 EDT81EPNEMjqAczW3Z+kCRzSfmdkial0weJa7p6vSEIHY8zgMFBZviIePYXOb8tsHbAy
 6FsMD36PzW2ilrKW/sJf/hjtsTcfO6b3QaOjwxm49FWeeMH3bR1Yjw8eBWTvsQKfAYO/
 mJvoWOTc2bwOMmvRhMwAKS/OhNUvWTk9wwwFEtjz0P0dhK94K5aRvLwLAgXSurtUPowE
 N3R4z/9wmo2pedP1T7D7l5l7Dt5GJZsKE+8SZ+GmeBFsJOaeGfxrHD0Cwmi98Dy73zMV
 5Xng==
X-Gm-Message-State: APjAAAUXm8Ko2roRK+fFVVs4fkUuAjZvLl1BylXLzfZqMyemWksTEYwS
 omss5Iem7A9bEAYCKvM0PyjxzA==
X-Google-Smtp-Source: APXvYqz5Ie2nmL5/PN7woKT004oRODT2bf9j5mFvoxRsmyWR1yZ5AJP+G1Q5AsfKmtr7qk77VFrvuQ==
X-Received: by 2002:a17:902:b487:: with SMTP id
 y7mr71565141plr.219.1561137250337; 
 Fri, 21 Jun 2019 10:14:10 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id t5sm3496190pgh.46.2019.06.21.10.14.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Jun 2019 10:14:09 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH v6 2/3] mtd: spi-nor: add support to unlock flash device
Date: Fri, 21 Jun 2019 22:43:30 +0530
Message-Id: <1561137211-12406-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561137211-12406-1-git-send-email-sagar.kadam@sifive.com>
References: <1561137211-12406-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_101411_390531_4CEC77C3 
X-CRM114-Status: GOOD (  18.12  )
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
Cc: aou@eecs.berkeley.edu, palmer@sifive.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Nor device (is25wp256 mounted on HiFive unleashed Rev A00 board) from ISSI
have memory blocks guarded by block protection bits BP[0,1,2,3].
Add identifier within flash info structure to indicate that a particular
flash device has the fourth block protect bit (SPI_NOR_HAS_BP3).
Increase size of flash_info flags from u16 to u32 to accommodate
SPI_NOR_HAS_BP3.

Clearing block protection bits, unlocks the flash memory regions
The unlock scheme is registered during nor scans.

Based on code developed by Wesley Terpstra <wesley@sifive.com>
and/or Palmer Dabbelt <palmer@sifive.com>.
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

spell correction: "Configuration" in spansion_quad_enable function
description.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 66 ++++++++++++++++++++++++++++++++++++++++---
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c816f0c..d165fcd 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -250,7 +250,7 @@ struct flash_info {
 	u16		page_size;
 	u16		addr_width;
 
-	u16		flags;
+	u32		flags;
 #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
 #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
 #define SST_WRITE		BIT(2)	/* use SST byte programming */
@@ -279,6 +279,13 @@ struct flash_info {
 #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 #define USE_CLSR		BIT(14)	/* use CLSR command */
 #define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
+#define SPI_NOR_HAS_BP3		BIT(16)	/*
+					 * Flash SR has block protect bits
+					 * for lock/unlock purpose, few support
+					 * BP0-BP2 while few support BP0-BP3.
+					 * This flag identifies devices that
+					 * support BP3 bit.
+					 */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
@@ -1461,7 +1468,50 @@ static int macronix_quad_enable(struct spi_nor *nor)
 }
 
 /**
- * spansion_quad_enable() - set QE bit in Configuraiton Register.
+ * issi_unlock() - clear BP[0123] write-protection.
+ * @nor: pointer to a 'struct spi_nor'.
+ * @ofs: offset from which to unlock memory.
+ * @len: number of bytes to unlock.
+ *
+ * Bits [2345] of the Status Register are BP[0123].
+ * ISSI chips use a different block protection scheme than other chips.
+ * Just disable the write-protect unilaterally.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int issi_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	int ret, val;
+	u8 mask = SR_BP0 | SR_BP1 | SR_BP2 | SR_BP3;
+
+	val = read_sr(nor);
+	if (val < 0)
+		return val;
+	if (!(val & mask))
+		return 0;
+
+	write_enable(nor);
+
+	write_sr(nor, val & ~mask);
+
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
+
+	ret = read_sr(nor);
+	if (ret > 0 && !(ret & mask)) {
+		dev_info(nor->dev, "ISSI block protect bits cleared SR: 0x%x\n",
+			 ret);
+		ret = 0;
+	} else {
+		dev_err(nor->dev, "ISSI block protect bits not cleared\n");
+		ret = -EINVAL;
+	}
+	return ret;
+}
+
+/**
+ * spansion_quad_enable() - set QE bit in Configuration Register.
  * @nor:	pointer to a 'struct spi_nor'
  *
  * Set the Quad Enable (QE) bit in the Configuration Register.
@@ -1834,9 +1884,10 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
+	{ "is25wp256",	INFO(0x9d7019, 0, 64 * 1024, 1024,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_4B_OPCODES)
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			SPI_NOR_HAS_BP3)
 	},
 
 	/* Macronix */
@@ -4080,6 +4131,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->flash_is_locked = stm_is_locked;
 	}
 
+	/* NOR protection support for ISSI chips */
+	if (JEDEC_MFR(info) == SNOR_MFR_ISSI &&
+	    info->flags & SPI_NOR_HAS_LOCK &&
+	    info->flags & SPI_NOR_HAS_BP3) {
+		nor->flash_unlock = issi_unlock;
+	}
+
 	if (nor->flash_lock && nor->flash_unlock && nor->flash_is_locked) {
 		mtd->_lock = spi_nor_lock;
 		mtd->_unlock = spi_nor_unlock;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index ff13297..256a8b6 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -127,6 +127,7 @@
 #define SR_BP0			BIT(2)	/* Block protect 0 */
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
+#define SR_BP3			BIT(5)	/* Block protect 3 */
 #define SR_TB			BIT(5)	/* Top/Bottom protect */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Spansion/Cypress specific status bits */
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
