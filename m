Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDBEC61CE7
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Jun 2025 16:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZJAceWzLFUmD++lgfkh/SLZuIKQ0Z/L5S3V8amEMSFw=; b=T+cRqsVf0vlbOe
	jojecU5G5138nc1uHq63o/NCaBAnBH+u1zQN+debUND8sLAHD8hK2DSuAhfpHsdktJhwFG4RWS/oG
	+nYZAkCzW6YCwplNzotRSWZCUGWExxFuPw3+rFa6imKhBNxaJPh013ljQdxfghuWCCw7Hmgcy8EPl
	iwcc92VIFKaT4aPHLi/hmjOKKO2o5MZC/wiFah1ata7bazVsl0ikvCH4eWN5/++Inw4yEUMQQ+cWB
	X7LHaOM8aB24Sr0rZm2INrriagHsdllIS43fqGE8YjgrNCF7vowwZGb/gcZlL+XHnucQmNoGb1MvQ
	t4Evw5mqLnykCR0Y+RYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNaOf-00000000gUQ-3ggT;
	Fri, 06 Jun 2025 16:58:25 +0000
Received: from mail-yb1-xb62.google.com ([2607:f8b0:4864:20::b62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNaOd-00000000gT9-1E5b
	for linux-mtd@lists.infradead.org;
	Fri, 06 Jun 2025 16:58:24 +0000
Received: by mail-yb1-xb62.google.com with SMTP id 3f1490d57ef6-e8187df27f8so295213276.3
        for <linux-mtd@lists.infradead.org>; Fri, 06 Jun 2025 09:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749229101; x=1749833901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6GcLRRfuesWA0E+vmxrSkcl9ahXGVhzhcFxNoFBkwNY=;
        b=frkFUjJMon6lv91LqdY7lvM2O0M/Bx3IMflRyFlE35jf4r61dp/J2LKNMYwfQBoouc
         x0YCPjRoOTQ0LgRUZTszAeACAhStH/8BeLBKwFDI/jTGA1B4ZTX5uNEUnAgfxq+jJ1Bg
         Xb0zetxyAsgI+5kOGraA3uRcwYCA0Lx1VgeKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749229101; x=1749833901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6GcLRRfuesWA0E+vmxrSkcl9ahXGVhzhcFxNoFBkwNY=;
        b=FSgBS33+yYEQzOthk8srJ5FuYG4Hh8c5gAp0P4vIkbc+4P0CtlJSWx/5LdBdbiHHb0
         HY2AWCJNEr8NJfQnkyjVNJ2MTj9qLoNf5e23CmltgAc1hxfzGqxfYtmju5FnFP4JuNVU
         ZKh1A5hrGgHfBSgwagre/LwOoSwTC8DV4M4pYXJmu4UnHif2cQ3wBlSg3KYUI/yS2Cz1
         NdL6MFbsF09HgZ5q3q5PcXZ474IyfdkjgkmG81zAvcCkz172SYLsMqtkmHaHTAYhfQgB
         ICsRyukMCCASYHblWDudb53wEJfGU95IwgpJZN5RKZ6Tkp0HMExll4LrRCO9b9qN3c4b
         BNCg==
X-Forwarded-Encrypted: i=1; AJvYcCVcUn9CRKnOb7EOGwiUJkyCHb8xD0QL7gqt2STNvLqvMPUpJw8eoy0uPSmapOil3BEGdnxmeiuDUgY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmgjOpEZCgrcpAl0K4w88hUeyNGaYPKIfaT61IW6BktE6QfdVW
	2VtHF9hXydcTbgNfe8tE9vWCLXO0TRqzHeYgn1ZFuELuTDnAG2TKzT3ZnjyuiQWj0r00QYZgZFk
	UvDdOvowUQpSovpQaot97PmdTj/2PieGrzg==
X-Gm-Gg: ASbGncsVDYr2FBszSZUvTiYgC6qg/txpuxo4TN1jYyBKuH/w9kIi9uYfgggRYu2WACO
	NVQJkXSuCLxTCUj17p2KiQ1+deBtF6nCpiKHbI0SuABj/lXH5foDQuJEIt0E2XMepbAvB30qLb5
	OtvVi9ih4BKeXzemYzC6YvzH1cEIje2LGrqxu7MC5V/ynf+4Rtp5uqyzo1O6IkwRMcBz2aF1Tpp
	aP93rp+v9H1o27Iq4tA/HFbrUv/sCT3iEvF3dvax3RZilhBZ96CSY03TaU8N0jdwTA2Tr/oK2CH
	Dy/mJubtRsmMKLSIwfsZ/9xMqv3MEWmV5pxtutKtrey78AWu5ZBUKTUACFWGTq9AuVhFRkcc
X-Google-Smtp-Source: AGHT+IE4csKqUW2xqcAMljZpXppjshLODmsfBBcw73uSFQY2Nq15v84MAYa5IztjLQctwSQBfK5m+yep/T+D
X-Received: by 2002:a05:6902:1883:b0:e7d:c8b9:3191 with SMTP id 3f1490d57ef6-e81a97cc997mr1683264276.7.1749229101422;
        Fri, 06 Jun 2025 09:58:21 -0700 (PDT)
Received: from bcacpedev-irv-2.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id 3f1490d57ef6-e81a41592fasm120273276.23.2025.06.06.09.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:58:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
From: David Regan <dregan@broadcom.com>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com,
	florian.fainelli@broadcom.com,
	kamal.dasu@broadcom.com,
	dan.beygelman@broadcom.com,
	=?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	rafal@milecki.pl,
	computersforpeace@gmail.com,
	frieder.schrempf@kontron.de,
	vigneshr@ti.com,
	richard@nod.at,
	bbrezillon@kernel.org,
	kdasu.kdev@gmail.com,
	jaimeliao.tw@gmail.com,
	kilobyte@angband.pl,
	jonas.gorski@gmail.com,
	dgcbueu@gmail.com,
	dregan@broadcom.com,
	dregan@mail.com
Subject: [PATCH v2] mtd: nand: brcmnand: fix mtd corrected bits stat
Date: Fri,  6 Jun 2025 09:57:03 -0700
Message-ID: <20250606165756.1531164-1-dregan@broadcom.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_095823_381774_09B564A3 
X-CRM114-Status: GOOD (  18.37  )
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

Currently we attempt to get the amount of flipped bits from a hardware
location which is reset on every subpage. Instead obtain total flipped
bits stat from hardware accumulator. In addition identify the correct
maximum subpage corrected bits.

Signed-off-by: David Regan <dregan@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
---
 v2: Add >= v4 NAND controller support as requested by Jonas.
     mtd->ecc_stats.corrected accumulates instead of set to total.
     Remove DMA specific flipped bits count.
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 50 ++++++++++++++++++------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 62bdda3be92f..c3ed3dcf0871 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -359,6 +359,7 @@ enum brcmnand_reg {
 	BRCMNAND_CORR_THRESHOLD_EXT,
 	BRCMNAND_UNCORR_COUNT,
 	BRCMNAND_CORR_COUNT,
+	BRCMNAND_READ_ERROR_COUNT,
 	BRCMNAND_CORR_EXT_ADDR,
 	BRCMNAND_CORR_ADDR,
 	BRCMNAND_UNCORR_EXT_ADDR,
@@ -389,6 +390,7 @@ static const u16 brcmnand_regs_v21[] = {
 	[BRCMNAND_CORR_THRESHOLD_EXT]	=     0,
 	[BRCMNAND_UNCORR_COUNT]		=     0,
 	[BRCMNAND_CORR_COUNT]		=     0,
+	[BRCMNAND_READ_ERROR_COUNT]	=     0,
 	[BRCMNAND_CORR_EXT_ADDR]	=  0x60,
 	[BRCMNAND_CORR_ADDR]		=  0x64,
 	[BRCMNAND_UNCORR_EXT_ADDR]	=  0x68,
@@ -419,6 +421,7 @@ static const u16 brcmnand_regs_v33[] = {
 	[BRCMNAND_CORR_THRESHOLD_EXT]	=     0,
 	[BRCMNAND_UNCORR_COUNT]		=     0,
 	[BRCMNAND_CORR_COUNT]		=     0,
+	[BRCMNAND_READ_ERROR_COUNT]	=  0x80,
 	[BRCMNAND_CORR_EXT_ADDR]	=  0x70,
 	[BRCMNAND_CORR_ADDR]		=  0x74,
 	[BRCMNAND_UNCORR_EXT_ADDR]	=  0x78,
@@ -449,6 +452,7 @@ static const u16 brcmnand_regs_v50[] = {
 	[BRCMNAND_CORR_THRESHOLD_EXT]	=     0,
 	[BRCMNAND_UNCORR_COUNT]		=     0,
 	[BRCMNAND_CORR_COUNT]		=     0,
+	[BRCMNAND_READ_ERROR_COUNT]	=  0x80,
 	[BRCMNAND_CORR_EXT_ADDR]	=  0x70,
 	[BRCMNAND_CORR_ADDR]		=  0x74,
 	[BRCMNAND_UNCORR_EXT_ADDR]	=  0x78,
@@ -479,6 +483,7 @@ static const u16 brcmnand_regs_v60[] = {
 	[BRCMNAND_CORR_THRESHOLD_EXT]	=  0xc4,
 	[BRCMNAND_UNCORR_COUNT]		=  0xfc,
 	[BRCMNAND_CORR_COUNT]		= 0x100,
+	[BRCMNAND_READ_ERROR_COUNT]	= 0x104,
 	[BRCMNAND_CORR_EXT_ADDR]	= 0x10c,
 	[BRCMNAND_CORR_ADDR]		= 0x110,
 	[BRCMNAND_UNCORR_EXT_ADDR]	= 0x114,
@@ -509,6 +514,7 @@ static const u16 brcmnand_regs_v71[] = {
 	[BRCMNAND_CORR_THRESHOLD_EXT]	=  0xe0,
 	[BRCMNAND_UNCORR_COUNT]		=  0xfc,
 	[BRCMNAND_CORR_COUNT]		= 0x100,
+	[BRCMNAND_READ_ERROR_COUNT]	= 0x104,
 	[BRCMNAND_CORR_EXT_ADDR]	= 0x10c,
 	[BRCMNAND_CORR_ADDR]		= 0x110,
 	[BRCMNAND_UNCORR_EXT_ADDR]	= 0x114,
@@ -539,6 +545,7 @@ static const u16 brcmnand_regs_v72[] = {
 	[BRCMNAND_CORR_THRESHOLD_EXT]	=  0xe0,
 	[BRCMNAND_UNCORR_COUNT]		=  0xfc,
 	[BRCMNAND_CORR_COUNT]		= 0x100,
+	[BRCMNAND_READ_ERROR_COUNT]	= 0x104,
 	[BRCMNAND_CORR_EXT_ADDR]	= 0x10c,
 	[BRCMNAND_CORR_ADDR]		= 0x110,
 	[BRCMNAND_UNCORR_EXT_ADDR]	= 0x114,
@@ -966,6 +973,13 @@ static inline u32 brcmnand_count_corrected(struct brcmnand_controller *ctrl)
 	return brcmnand_read_reg(ctrl, BRCMNAND_CORR_COUNT);
 }
 
+static inline u32 brcmnand_corr_total(struct brcmnand_controller *ctrl)
+{
+	if (ctrl->nand_version < 0x400)
+		return 0;
+	return brcmnand_read_reg(ctrl, BRCMNAND_READ_ERROR_COUNT);
+}
+
 static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
@@ -2066,12 +2080,15 @@ static int brcmnand_dma_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
  */
 static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 				u64 addr, unsigned int trans, u32 *buf,
-				u8 *oob, u64 *err_addr)
+				u8 *oob, u64 *err_addr, unsigned int *corr)
 {
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_controller *ctrl = host->ctrl;
 	int i, ret = 0;
 
+	if (corr)
+		*corr = 0;
+
 	brcmnand_clear_ecc_addr(ctrl);
 
 	for (i = 0; i < trans; i++, addr += FC_BYTES) {
@@ -2099,13 +2116,16 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 
 			if (*err_addr)
 				ret = -EBADMSG;
-		}
+			else {
+				*err_addr = brcmnand_get_correcc_addr(ctrl);
 
-		if (!ret) {
-			*err_addr = brcmnand_get_correcc_addr(ctrl);
+				if (*err_addr) {
+					ret = -EUCLEAN;
 
-			if (*err_addr)
-				ret = -EUCLEAN;
+					if (corr && brcmnand_count_corrected(ctrl) > *corr)
+						*corr = brcmnand_count_corrected(ctrl);
+				}
+			}
 		}
 	}
 
@@ -2173,6 +2193,8 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	int err;
 	bool retry = true;
 	bool edu_err = false;
+	unsigned int corrected = 0; /* max corrected bits per subpage */
+	unsigned int prev_tot = brcmnand_corr_total(ctrl);
 
 	dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
 
@@ -2200,9 +2222,11 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 			memset(oob, 0x99, mtd->oobsize);
 
 		err = brcmnand_read_by_pio(mtd, chip, addr, trans, buf,
-					       oob, &err_addr);
+					   oob, &err_addr, &corrected);
 	}
 
+	mtd->ecc_stats.corrected += brcmnand_corr_total(ctrl) - prev_tot;
+
 	if (mtd_is_eccerr(err)) {
 		/*
 		 * On controller version and 7.0, 7.1 , DMA read after a
@@ -2240,16 +2264,20 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	if (mtd_is_bitflip(err)) {
-		unsigned int corrected = brcmnand_count_corrected(ctrl);
-
 		/* in case of EDU correctable error we read again using PIO */
 		if (edu_err)
 			err = brcmnand_read_by_pio(mtd, chip, addr, trans, buf,
-						   oob, &err_addr);
+						   oob, &err_addr, &corrected);
 
 		dev_dbg(ctrl->dev, "corrected error at 0x%llx\n",
 			(unsigned long long)err_addr);
-		mtd->ecc_stats.corrected += corrected;
+		/*
+		 * if flipped bits accumulator is not supported but we detected
+		 * a correction, increase stat by 1 to match previous behavior.
+		 */
+		if (brcmnand_corr_total(ctrl) == prev_tot)
+			mtd->ecc_stats.corrected++;
+
 		/* Always exceed the software-imposed threshold */
 		return max(mtd->bitflip_threshold, corrected);
 	}
-- 
2.43.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
