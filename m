Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F1BC10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 11:56:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90EE92051A
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 11:56:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L8EGgvRd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZ99WF4I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90EE92051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6fbtpdBB8im6MeR0bjgTiwkYvjrM0buZbwOTt1G8JCg=; b=L8EGgvRdLMQc0BNAoSbJshug6X
	Xs6ertPtpTWIz8UNIVx7O6cqRLvC9SnNVJB7/Jc2kiCCh6xqRMuUhODjHbNkS9AO5LHfJ94V5LDnO
	jwW2ifSe3c/vQtBlt+fFmlUReR4nj7vsJou0wNQ7GYJRrqk3DVunXXUGuucvMgMEks8PWvKaGx2Id
	a4Fz3JDO1aKCvWjkMwqkNaaaU9VXHNF+dQ6v+sDOh5hBzlVhPWnwQkdfGnWT8f6iQMNS3ZsZ3vV6k
	sHZoBWNUe/JtxsfL9FxSJaiGNEndyqQ6G2iHrk5jTvmedW290/21OCDilUzWNq9jKq+rtgj5AwSPP
	AJ2c7jvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBH1L-0008Nu-MC; Mon, 09 Mar 2020 11:56:31 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBH0W-0007U7-Uj
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 11:55:42 +0000
Received: by mail-wr1-x441.google.com with SMTP id v4so10709266wrs.8
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2020 04:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xNSnSJKXH2EkPaG4hjJt+WELoZtykx3G8gAN3oUER3Y=;
 b=jZ99WF4I2fRMtsfaQ8dSgmMyyh7DWUCBGMfaBLwJkx8xAdU67/hzTtHoBs8BXtmoe4
 noU5Dyx/6OknofOC9bPlRhd0oiBGFtSm+XJPTxgq0sZYsrmRQBPJCVmkrZ0YLkc6JnL+
 64G9JuV9oVLVHzk/wDaCaXBFnAJ1WhWx+vQYMTnEekHWxUy4xS5J4ZkaO/eiRuUdYRS0
 qjxZm5xPyVbL3Tx2kY3rU/xUGiDaP+9dBu0nFsUyMKbi4upiQ6kuvQsSYo8D6tF1+Cww
 W3lNrpLOuGNTMRdONYQlMYeDk4wTb2JGeCVRm1/f+OsaPDvSXvuhq9E8WYQvHrBm9H0S
 Jutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xNSnSJKXH2EkPaG4hjJt+WELoZtykx3G8gAN3oUER3Y=;
 b=cl1hllEfZeyd8Rzn8OYf0qG7V9neGEQ/ZfIGaQMLoSdQFSQRUEUFyb8unR4D/2RkZw
 /xXg01WmvDW6/e7EqjFcUASrstuv/OkHbvrsYlXHDRSjMkrRt5+52CCtGk5IVRbt+I0S
 YN9MESic477BVTnClimDCee29xANMwNHkHq078XNE9nYBym9Wi6daOpGFF0GhPH17vVG
 V9o8zNC2dGlXNZVgluKqdxucTGEiKzaQPSZ9IHse9k4c0y8z5HQJrdRfW/eV2mRED1jr
 211fZnmf4GJVw9KtsZVVJ4dQw0xs8G2GyCNJpayr65vQgSzpju9l4yH0vARthR+bKuCu
 XLFg==
X-Gm-Message-State: ANhLgQ1yKJ1OLO74chakRuRNa10Z1n6IhSdw4Xb/+JNj3kBXGpGZz5Pp
 5kIbXnKuxEp8sd0HYI1UgWA=
X-Google-Smtp-Source: ADFU+vt2XKelxwVGqJjD55nLHTjQb1eiD81FPw7LKv4smViOuAm8TzRSnFd/oE7McEarGyC+ZzncvQ==
X-Received: by 2002:adf:fc06:: with SMTP id i6mr7576104wrr.285.1583754939622; 
 Mon, 09 Mar 2020 04:55:39 -0700 (PDT)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id m21sm25035226wmi.27.2020.03.09.04.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 04:55:38 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/6] mtd: spinand: micron: identify SPI NAND device with
 Continuous Read mode
Date: Mon,  9 Mar 2020 12:52:28 +0100
Message-Id: <20200309115230.7207-5-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309115230.7207-1-sshivamurthy@micron.com>
References: <20200309115230.7207-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_045541_024103_995AAAF7 
X-CRM114-Status: GOOD (  15.33  )
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
