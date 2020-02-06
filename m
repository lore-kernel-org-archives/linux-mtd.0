Return-Path: <SRS0=MuW7=32=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEE6C35247
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 20:25:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416A021927
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 20:25:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qgUNXfVh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/+ec3Lz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 416A021927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UZGgLg51bEFLSnN9FBeGvYBRREfCakROXGxn/vOqjKs=; b=qgUNXfVhpuQtzno6zV1JdfFpVJ
	xSUszTm0Pt5oxAxWGXgVubRw98WUBB0zWKJ7s/TVrfdH25HO9oeNqw+n68d6mBPpxXAyhPnInZeAI
	qgP/ULKnuQqvIIgCxy0CgAfKoZ5iH+Lu/ARlWGPbEPHHdZ6GePDVTP8q4+pKHFvEGq5BRjPMM9uwK
	4dnba/yc5cDRvmTufxta2e9aJjCzn7Y5M6haTyGlPMzwkDTJEkevBMh00VOB6CPsbPvU5w2mmsR8/
	ljTrXQ/iHoR6f57yPtV5T6FnA3DtzDK2wT+muqj6V2IdjTq4aTiMJtqO+p9BxH5F9THXMtOEVkOxQ
	8e5PXEMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izni7-0000Cq-7D; Thu, 06 Feb 2020 20:25:15 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iznhV-0006rg-Py
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2020 20:24:39 +0000
Received: by mail-wm1-x343.google.com with SMTP id p9so256788wmc.2
 for <linux-mtd@lists.infradead.org>; Thu, 06 Feb 2020 12:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LFxMYCi8lGoovOV/sAYPGteEncrVIWaLSH+LK6Sw5BI=;
 b=k/+ec3LzTqJfjILFR0cc7f2Q6keBUxbOd+AiEs2of8GbeM6GGMyLV8t5tlwRr6KluB
 Q0ypKUjvislTnM12SgJdNMO4zs4w7G35fKiyxdPp8Ka+faKrRC7xfm0ai1SZ47cQERp8
 V58dZd8FLH99DbpwJCzA2vzmXw4+T85nRNz0CKl3lzj7gTFDukAGr9hZQ6iw9uzeamSZ
 yN5vr+4bbMkRnWqfCBA4hDpo5N+efpViK8lHR5qqNhCPP00uZM2tgoJHKaEqOIln125r
 BZR5072gpKse4NZwGg9LDF2VVgdT/4tOCILneL6geAW20JTdo2aV5GNv3ilenohoKFzP
 P1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LFxMYCi8lGoovOV/sAYPGteEncrVIWaLSH+LK6Sw5BI=;
 b=hKD1T8QBumXJDUFm46aR5XwNEQboPK7AH3in6pxx3+bdv9sfb0Que8LdpLowvLDh82
 X1ZxYkmJrVkc0Tc/bvV2q5l5ihKMUq5RyxpuqrWf6MQE+3HsN1tsrMpVm2+t0zaElZSw
 AekbE0btug+SkYFVouB0iWLzgMkzv+qdtH7HlnPJK2nLuqX8N3YT51S49x0kjbqjpHZc
 H9qNTK8WxszUUGbKIJxo8dJWTaZNp0woAcuPzHJRJF3DHKYrZCHevsZAnTmhdWrK1r+d
 vjsZsw7sLOWUOFRttrqCSIQzEimHN4tZwlN01ESxNT19glPsfsGFa4LpGY1wp8AV1Dag
 Ho2w==
X-Gm-Message-State: APjAAAWEjFxBeCpCWeONA0ZOmknm6pkPj4rM6lyygGSXcAEIvXeHnUhP
 GX4T0Qs3O021IF46hmZxdkv3BdyexlXKnA==
X-Google-Smtp-Source: APXvYqyq7CoP1tZczuROmScct0k4Sx4IrB7cBccXjoqRWw1lrhus82/ttE+70/rzdw9FMMxc1pYF6w==
X-Received: by 2002:a1c:1f56:: with SMTP id f83mr6336867wmf.93.1581020676029; 
 Thu, 06 Feb 2020 12:24:36 -0800 (PST)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id c13sm539929wrx.9.2020.02.06.12.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 12:24:35 -0800 (PST)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] mtd: spinand: micron: identify SPI NAND device with
 Continuous Read mode
Date: Thu,  6 Feb 2020 21:22:04 +0100
Message-Id: <20200206202206.14770-4-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200206202206.14770-1-sshivamurthy@micron.com>
References: <20200206202206.14770-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_122437_861018_2282BFF8 
X-CRM114-Status: GOOD (  14.75  )
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
index 5fd1f921ef12..a8e947609cd9 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -18,6 +18,8 @@
 #define MICRON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
 #define MICRON_STATUS_ECC_7TO8_BITFLIPS	(5 << 4)
 
+#define MICRON_CFG_CONTI_READ		BIT(0)
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
+	if (spinand->flags == SPINAND_HAS_CR_FEAT_BIT)
+		return spinand_upd_cfg(spinand, MICRON_CFG_CONTI_READ, 0);
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
