Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B145C77B7C
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jul 2025 02:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2oy4Rk7Dwqa5zVmFq3aVRDoP4frkKHz5awLFR4EXPK0=; b=yy9JqVuImr/rF5
	1y6zDbXyF+zy20Cb01mNVoLgKgkrbKLqmlxLr+6gFR+FjbkVuHU7limYzGidtvgiHW/2zLecL5Ahk
	TuDj59hsrTr6fSeKxLx8ClsdMlIdlKfpO/9pKCdWkSRHRZwVaM02fJVKyw6A6MKCLN9o40YvMkJ71
	ihIKnN+88DngG6EPUG6PnMYJ+DveKkFr5YptZxoyiH+I8d+XR2740l1kTFdr6/1svfCzE+LzA8x6+
	O43O0qBPlRPYCUazFPCR5spnmBxrd5sQoircm+kb9tWmpeU2K+NcnqkL7NRAVwtPCDmcORg00CW7E
	hDyIJKccpg6YOK6EHXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9z5-0000000A3NJ-3D7T;
	Thu, 03 Jul 2025 02:47:35 +0000
Received: from mail-io1-xd61.google.com ([2607:f8b0:4864:20::d61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9z3-0000000A3Mx-25IH
	for linux-mtd@lists.infradead.org;
	Thu, 03 Jul 2025 02:47:34 +0000
Received: by mail-io1-xd61.google.com with SMTP id ca18e2360f4ac-86d063cd8faso11486039f.0
        for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2025 19:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751510852; x=1752115652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PhJFHcg87sU/DVyKPZbOZkGlSVURcDhV3sOi2cvPycY=;
        b=OzgIMpSSMr+PMSnakc6S6+1kOD8vlrwagsKkhBqVIyIku7tEyGuRWrgGz5oSL5RI5P
         4JH/x2IRrsu4PSlncsx5jqx6zUTxB891H9YNygAHHNiZ5HkYFw/MY+fMW4AUy0Ju0cFk
         byltfK7UDv58RKjv/cQM8j2EXlAtHQBftAA84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751510852; x=1752115652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhJFHcg87sU/DVyKPZbOZkGlSVURcDhV3sOi2cvPycY=;
        b=Mw2Bi0leQ8/bG6Ww6E0DY5HTxG2H/L0IwwaS5uMDTrCNJ1FxusW2oVZt2mrqvgwrIi
         P5L0OyFXilCRVPrihk9HpmxLS8LY/3C2Odycfp4iv/bSnMdUKx0wRAVGZws1G9rIbejN
         P6T1ajp8St6CaCtSKD9e3p8axPJ7Ra4TpwiL0E7QTPjW4PY6f7f63HaqypNeFbaHOeHo
         kUOWEkdT7i1MpdXXrLs/Kg/e//PSDws5nrqt52Wkn1r5aYuwA1Dj7CfpvjB04f96YcBS
         Hzw3/uoH+pfs84uyVjmeO+6iHLnMvfAnDE/I1N2lack/SlV1dB4hmaY+IogP/X/oGJKD
         xDGA==
X-Forwarded-Encrypted: i=1; AJvYcCUkGy+bGk1+lV7Sbkfb9O1jHs3yCkjYzHRwVui85HS3+NwEjYObCd6DWWgyAeOFR240xD7FRZ1c3NU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl/A/fpIpwA/2OR4IOlUNzAPHfRN7HAN8PVCgMmrsNFhjvg/M0
	MlMq8tibShB+mVEOCKYwEK2BW7PJulzaPyl+f4Ki6olplD2F6ViuQVkeSKZQXSL0tc7SBowr+1V
	VXrsgUSIb+bynf5gWAsNbI51foz1Kr58bkA==
X-Gm-Gg: ASbGnctsxrU5mY9usDdiJc7yI5PYo+ft9wLAPG1QCSxqzepzfFr9QpupAM73kgVnCkE
	kTtlCHu9kufR3sOt3qv64tO5nh+702pYviLHKbh5PftA1BUm92SBXzeH0qEpXHqUqyd9zZthD7g
	FndEqa0wu1h/Lq4elrgAawWZT/xYMUE7nBz4rd/LR3XMVqn6ui+7ME0hDxdaUKTcFOOtghg0qA0
	H3+H6rCZ5Vn8C5Lb5simLl+YXbgNcaefh6Of6j2ms7ASA7oZHgE8JW1LIazlOiQ95EXOMuYYRRc
	3dCiGfPnAiUBIbPsJcPUSsHS4+c5JAIdEerEVA3bs2TzApkKa6b4qRFEHiQYt+uU9zRezCAW
X-Google-Smtp-Source: AGHT+IHBZ5fRo7G1atIG2AuPc0KGWP4Pxe1ggQWyDHR0SAuva5sBRHfROcvhtC+7ef6kHhcljVviYf+CWAxy
X-Received: by 2002:a05:6602:13d0:b0:873:13c6:f37b with SMTP id ca18e2360f4ac-876d5125164mr16717339f.3.1751510851736;
        Wed, 02 Jul 2025 19:47:31 -0700 (PDT)
Received: from bcacpedev-irv-2.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-87687b2283asm53992439f.24.2025.07.02.19.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:47:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
From: david regan <dregan@broadcom.com>
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
Subject: [PATCH v3] mtd: nand: brcmnand: fix mtd corrected bits stat
Date: Wed,  2 Jul 2025 19:47:05 -0700
Message-ID: <20250703024719.2256470-1-dregan@broadcom.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_194733_670636_56C4951C 
X-CRM114-Status: GOOD (  19.26  )
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

From: David Regan <dregan@broadcom.com>

Currently we attempt to get the amount of flipped bits from a hardware
location which is reset on every subpage. Instead obtain total flipped
bits stat from hardware accumulator. In addition identify the correct
maximum subpage corrected bits.

Signed-off-by: David Regan <dregan@broadcom.com>
---
 v3: Use brcmnand_corr_total to obtain maximum subpage flipped
     bits for further backwards compatibility.

 v2: Add >= v4 NAND controller support as requested by Jonas.
     mtd->ecc_stats.corrected accumulates instead of set to total.
     Remove DMA specific flipped bits count.

---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 53 +++++++++++++++++-------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 62bdda3be92f..b13f5f8f0eec 100644
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
@@ -959,11 +966,11 @@ static inline u16 brcmnand_cs_offset(struct brcmnand_controller *ctrl, int cs,
 	return offs_cs0 + cs * ctrl->reg_spacing + cs_offs;
 }
 
-static inline u32 brcmnand_count_corrected(struct brcmnand_controller *ctrl)
+static inline u32 brcmnand_corr_total(struct brcmnand_controller *ctrl)
 {
-	if (ctrl->nand_version < 0x0600)
-		return 1;
-	return brcmnand_read_reg(ctrl, BRCMNAND_CORR_COUNT);
+	if (ctrl->nand_version < 0x400)
+		return 0;
+	return brcmnand_read_reg(ctrl, BRCMNAND_READ_ERROR_COUNT);
 }
 
 static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
@@ -2066,15 +2073,20 @@ static int brcmnand_dma_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
  */
 static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 				u64 addr, unsigned int trans, u32 *buf,
-				u8 *oob, u64 *err_addr)
+				u8 *oob, u64 *err_addr, unsigned int *corr)
 {
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_controller *ctrl = host->ctrl;
 	int i, ret = 0;
+	unsigned int prev_corr;
+
+	if (corr)
+		*corr = 0;
 
 	brcmnand_clear_ecc_addr(ctrl);
 
 	for (i = 0; i < trans; i++, addr += FC_BYTES) {
+		prev_corr = brcmnand_corr_total(ctrl);
 		brcmnand_set_cmd_addr(mtd, addr);
 		/* SPARE_AREA_READ does not use ECC, so just use PAGE_READ */
 		brcmnand_send_cmd(host, CMD_PAGE_READ);
@@ -2099,13 +2111,16 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 
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
+					if (corr && (brcmnand_corr_total(ctrl) - prev_corr) > *corr)
+						*corr = brcmnand_corr_total(ctrl) - prev_corr;
+				}
+			}
 		}
 	}
 
@@ -2173,6 +2188,8 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	int err;
 	bool retry = true;
 	bool edu_err = false;
+	unsigned int corrected = 0; /* max corrected bits per subpage */
+	unsigned int prev_tot = brcmnand_corr_total(ctrl);
 
 	dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
 
@@ -2200,9 +2217,11 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
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
@@ -2240,16 +2259,20 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
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
