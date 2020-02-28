Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB16C3F2D5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 15:04:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B47B3246AF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 15:04:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TqCx7mvK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isJ8mi++"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B47B3246AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6fbtpdBB8im6MeR0bjgTiwkYvjrM0buZbwOTt1G8JCg=; b=TqCx7mvKW+IDO1a8cNQb9DI8tZ
	J9YoGHTmLRU2uVo8StSr4r9rGxosDMPSr360yQCfjJcrILNnKYy4mtwg7gYJpnSBUqJLIvG6fY2Fy
	dDJk9XjrIEphoLpPaLP3EdBRlT2Bqfq/RDWLc8XH62tEoNI3Ctr+LhqWlcOAeryuUU6xRPrm0Izff
	OOHsMFcKAUxtJowWVGHATtUJKhGRSPRdyAJyv3Dx+fRuvZGeRkl/b/JCT1maEL+IkvrSMkXE6J8pN
	pmsgBqTpaUjm1GqTv/HoX7Nq8mtTbg4g1TtUYch70utJCNymsDfi61CxJJVarl3jB0Y9T/7HXHlyA
	6zTwk3Vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7hBg-0003Rq-El; Fri, 28 Feb 2020 15:04:24 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7hAm-0002Y6-Hs
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 15:03:30 +0000
Received: by mail-wm1-x341.google.com with SMTP id f15so3506620wml.3
 for <linux-mtd@lists.infradead.org>; Fri, 28 Feb 2020 07:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xNSnSJKXH2EkPaG4hjJt+WELoZtykx3G8gAN3oUER3Y=;
 b=isJ8mi++bCKg0QwA3LH/R8iKb3ngkv58+4RVGVxiTngZMUaTScwi8uVDNccUZTaENn
 yB3vDTxAT0/pVWBZEbflkmopna9V4tN6TEJQetSH0u+1T8A35Y2ITlvugSVngPJhCGiY
 tTfMzRKoA4Eqf11dsWgzBA0Sk2Mtry95qcGQghC6AOYzTTaNR7g7u6xJVY7i+Wnt7M3e
 PdxAB0hBfJQu6cNC4yFQvlYuQ8AB+ejD+j3UI5SW6kfizbXtb0k/FjAKdo0He61fZOoU
 CWZvIvHFGjU39i/wjY3LA5p4vzrCdQ6hVGub4lfDdzn6vyYEyJqIQNlXsRLutp260dH2
 SDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xNSnSJKXH2EkPaG4hjJt+WELoZtykx3G8gAN3oUER3Y=;
 b=QCARpK71Rk1YXdtSBe9XpjzdbqzOA9JgbJL8YR4x26kjuXwutd8aEKMEpZlfFQwumw
 9wMWOqMiSlTTFfJIl3Xn2OH3nOGkXsV/TminYjhk81v/izYXWOgQUmuMmKLm/mifs3Ys
 +otIUt/b7pDDUgiWNHWY72eTeq+J9q9bGbursK5wMrwPGVUGOS4roCtXaDb4W8mwufdi
 UR7GmiHXGjq6JXOSecC/Fb8mW8H0RIgsWoOLP0E6G6kzmTztMGD6lm4PvgDRolSLuEPx
 ovalZcm7ylRa/SDlfVnZGwG9VqUbzjCV8lStcxli8J86gpRXks2WIKAxEw4UUkwflXB2
 uimw==
X-Gm-Message-State: APjAAAUYI8C9AisSpuG2Aq1Z46i0wYsAOylxETniN93XHwGZfP/NdEOI
 hUUSGP8EX//B9SvVHLn62vs=
X-Google-Smtp-Source: APXvYqwl5wksvi5lEi7JJEQ44SKgkAmAfwlNJG3BxMTJZCWLSr2w7QkyiFh8ErKiyNfWrkk7Jzzw8g==
X-Received: by 2002:a1c:df45:: with SMTP id w66mr5155697wmg.171.1582902207037; 
 Fri, 28 Feb 2020 07:03:27 -0800 (PST)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id m125sm2540235wmf.8.2020.02.28.07.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 07:03:25 -0800 (PST)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/6] mtd: spinand: micron: identify SPI NAND device with
 Continuous Read mode
Date: Fri, 28 Feb 2020 16:03:09 +0100
Message-Id: <20200228150311.12184-5-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228150311.12184-1-sshivamurthy@micron.com>
References: <20200228150311.12184-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_070328_601093_722F36C8 
X-CRM114-Status: GOOD (  14.98  )
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
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Add SPINAND_HAS_CR_FEAT_BIT flag to identify the SPI NAND device with
the Continuous Read mode.

Some of the Micron SPI NAND devices have the "Continuous Read" feature
enabled by default, which does not fit the subsystem needs.

In this mode, the READ CACHE command doesn't require the starting column
address. The device always output the data starting from the first
column of the cache register, and once the end of the cache register
reached, the data output continues through the next page. With the
continuous read mode, it is possible to read out the entire block using
a single READ command, and once the end of the block reached, the output
pins become High-Z state. However, during this mode the read command
doesn't output the OOB area.

Hence, we disable the feature at probe time.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/spi/micron.c | 16 ++++++++++++++++
 include/linux/mtd/spinand.h   |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 5fd1f921ef12..ff0a3c01441d 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -18,6 +18,8 @@
 #define MICRON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
 #define MICRON_STATUS_ECC_7TO8_BITFLIPS	(5 << 4)
 
+#define MICRON_CFG_CR			BIT(0)
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -153,8 +155,22 @@ static int micron_spinand_detect(struct spinand_device *spinand)
 	return 1;
 }
 
+static int micron_spinand_init(struct spinand_device *spinand)
+{
+	/*
+	 * M70A device series enable Continuous Read feature at Power-up,
+	 * which is not supported. Disable this bit to avoid any possible
+	 * failure.
+	 */
+	if (spinand->flags & SPINAND_HAS_CR_FEAT_BIT)
+		return spinand_upd_cfg(spinand, MICRON_CFG_CR, 0);
+
+	return 0;
+}
+
 static const struct spinand_manufacturer_ops micron_spinand_manuf_ops = {
 	.detect = micron_spinand_detect,
+	.init = micron_spinand_init,
 };
 
 const struct spinand_manufacturer micron_spinand_manufacturer = {
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 4ea558bd3c46..333149b2855f 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -270,6 +270,7 @@ struct spinand_ecc_info {
 };
 
 #define SPINAND_HAS_QE_BIT		BIT(0)
+#define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
 
 /**
  * struct spinand_info - Structure used to describe SPI NAND chips
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
