Return-Path: <SRS0=Y29Q=3W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707C0C35249
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Feb 2020 21:58:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 351622051A
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Feb 2020 21:58:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L9I6d5NI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gv10nS8Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 351622051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QbJXvKBvh+dokK1fB7yXQScSWr9UhKUvFd+mP6rfJno=; b=L9I6d5NI0YExk31fvhIerCVgdJ
	Cf4BUTs4V5h8uSNKtKVr0vOh6tMBSZTfFHGwkfAidkZFPalNghRkU7rzjiG26wBPMSS274i59E3a6
	nBNQ3/eLD9oOrvJk8D+1UoJ32zDKgi9ZqfdowTUz9BtJOUIAuIL6yZHauQk9SktbPeviC2WNE4GkT
	+0vbooiXC+rFwPjz0o2f9ao4rR2Bu3FHlMahEtkqru5GQGd+0QlpzDzHNTY9BafDkJCrKeKmN5nrl
	XVaFHJzZVi5+4NhtkUPuqoIQXOhlbgggXT1C+5FdgSHJV5XungikVdTEMDhv8fw8LuJgom5ScepZg
	RRxNtT7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyNG2-00011h-Lo; Sun, 02 Feb 2020 21:58:22 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyNFD-0000EY-2k
 for linux-mtd@lists.infradead.org; Sun, 02 Feb 2020 21:57:32 +0000
Received: by mail-wm1-x344.google.com with SMTP id t23so13802862wmi.1
 for <linux-mtd@lists.infradead.org>; Sun, 02 Feb 2020 13:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jmAtE7xwSXR+AJEG/25i5LGMBTNXSyD6hhPgoSBYe1o=;
 b=gv10nS8Z7FAbqlgYZGrOQBrI83FVSAwXFPTLKNyQt0LPaxtiTHggSqFghbPdNvQ1r5
 7CkgF+sngWjdtVSYpGpxslRLevkHc0HF7YUOngXO4fxYvdgym6MYjadjADlJSgJCFH0a
 IsfEp0GZFwoNoeZM+zxU3Gm6iti34QXCJto3EjqrcbkClmrzpBF5EAwgDlPXRvXtpALe
 kLraKIror4yaN+RXwB0XGFp/g1BO2Y9ydI7ARVEkUAZhUTG1SIdhEEzkMnLZq9dJiXnA
 tq1CpucixSYrU0y77vx4YVVe5O8N3yLN64zKhJl0p89ikh6wb9ZqRjGBRtr+Ri9Vzdjn
 O6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jmAtE7xwSXR+AJEG/25i5LGMBTNXSyD6hhPgoSBYe1o=;
 b=cVHv+GyntUIGWpKPdYBG1vlof1HaoykzX4bh/k3emoripUidJcfRfkG8mAgfysVcA3
 dfU5Ok+eiiym6eMxyW9TW7YyF3y9KWdRc4xguGmQdxcKJktP5K0lgtXQ8hz1Yz9bHujf
 iW6FdhSVKMh9WowHqMXo/7ytJUkaYYVwMlae+l2GEF4+W+vBPnRjaZCQmD22qYXwCYbI
 D/M6BHearTXvJSK7MB3l/iyyZT1Vp9Rw4FUOSek0KUbmIg5C+tbG4z5RFfnpokJ0ekOs
 xo8dZ67Gd0SNr35KmULYaQ5ShHMcubYXShUjJwW6zk/SpbJote+eFZjKymA9dfnFkWzm
 HRjw==
X-Gm-Message-State: APjAAAVDLGaJ1NJnvbCL7jYueLPbEqdbUPO9XwP6qxtDAWWQ5orE9lDf
 7BnNF7Y517h4ix5gNp7/keE=
X-Google-Smtp-Source: APXvYqxJwDn66jjhZAwmIruS4H0N6mjIcP4rBfVPljwStGDUMtTwYEUR6ImG3moa8tMtGbD1xRFWfg==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr24198750wml.3.1580680649279;
 Sun, 02 Feb 2020 13:57:29 -0800 (PST)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id c4sm20612488wml.7.2020.02.02.13.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2020 13:57:28 -0800 (PST)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] mtd: spinand: micron: Add M70A series Micron SPI NAND
 devices
Date: Sun,  2 Feb 2020 22:55:07 +0100
Message-Id: <20200202215508.2928-5-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200202215508.2928-1-sshivamurthy@micron.com>
References: <20200202215508.2928-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200202_135731_146968_FFDB372E 
X-CRM114-Status: GOOD (  13.91  )
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

Add device table for M70A series Micron SPI NAND devices.

As opposed to the M79A and M78A series already supported, M70A parts
have the "Continuous Read" feature enabled by default, which does not fit
the subsystem needs.

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
 drivers/mtd/nand/spi/micron.c | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 5fd1f921ef12..3d3734afc35e 100644
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
@@ -131,6 +133,26 @@ static const struct spinand_info micron_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
+	/* M70A 4Gb 3.3V */
+	SPINAND_INFO("MT29F4G01ABAFD", 0x34,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_CR_FEAT_BIT,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
+	/* M70A 4Gb 1.8V */
+	SPINAND_INFO("MT29F4G01ABBFD", 0x35,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_CR_FEAT_BIT,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
 };
 
 static int micron_spinand_detect(struct spinand_device *spinand)
@@ -153,8 +175,22 @@ static int micron_spinand_detect(struct spinand_device *spinand)
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
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
