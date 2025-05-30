Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF865C5B543
	for <linux-mtd@archiver.kernel.org>; Fri, 30 May 2025 03:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YbUG8supcCy5ODkggwRpa27ZWNRoQeLlIARdV7Xw78Q=; b=TMQKbuWM9jH2u5
	m2NBbKQHl/ez14AEJ8+UtW1FuhbnCsOcvwK6iKCR4TqB703YdW8BWrmYZV6O6W+d/fX/MVaQ3PYPE
	pV08pHbZKG3v0eqq5T/H/huz6009KKlVRJ58XijruP89cabKpHU8vT9fydy1sehseIqIiNZ2/Wibo
	ep38UfV65fA+tQoRnwKbkckux+10lAxpE6X9+Ngz44cVw8ptKp2Tdk+FwyVbXm2tmgnEWyx89t12s
	rS0pOCwDZ4Qyr64zQxCv22HH4K2iWMCS41Xj2jk4FsBokmymoLQEByFiqKpBOfa3zCv2juoNByHJj
	0MCX5ScF/g6lSLEEuJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqkE-0000000H6oS-3lQW;
	Fri, 30 May 2025 03:49:22 +0000
Received: from mail-yb1-xb61.google.com ([2607:f8b0:4864:20::b61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqj2-0000000H6gV-1ugD
	for linux-mtd@lists.infradead.org;
	Fri, 30 May 2025 03:48:09 +0000
Received: by mail-yb1-xb61.google.com with SMTP id 3f1490d57ef6-e7dc419b92dso200153276.2
        for <linux-mtd@lists.infradead.org>; Thu, 29 May 2025 20:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748576886; x=1749181686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TlMFeDmViObsRmCRsBGfnvTFsQkhpyrM25hcpRVgu8E=;
        b=In6DESm3F3J2+MPGRLrP8XPBt0C1zWWv62MYMHI6i/oDDGUaraZpynBDr1dWFa+dHG
         szaOPTEU9FrWh9czN35u0NHZa/iuzD2fQtyX4P9TeKFmc4Q0KUAYHvu1sS5zl0fu16JO
         gm/wraw87lPz1thCBxD5HNMIWD+OUP11RTtRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748576886; x=1749181686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlMFeDmViObsRmCRsBGfnvTFsQkhpyrM25hcpRVgu8E=;
        b=YS1c0NKvaES1z1ugjA8uFMUlMYrzks3fSrypxnX7s89WGNQMl2CiGx5EWFEiXA0ll0
         WTvvx6uw1Qd8U9aBEBo+2OF5FdtN4MZGDpveUHVDwEbj2YylMRgF0aUblP1EQRjr8eBJ
         yUVMJMKVSpprifniqcfQSrkMKjWwmEvJ/7F1axgf8HynDKSrJHAHCMTXeC7poKxaZ0U8
         3efv5xnIiqNxiwJRgCzb4uEftu1EN4qaAPbKALtPUr6d9KQbXNfAt3Ryp0CRNObBAiLT
         0krilSnDUMeF/yP1gvapeA7soajNCTNqAVdtRCFIyiHqRvO734dE064g17faCSTCZ/Lb
         ks/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXS18twUm9GJMuJ7pj3E4UV5X99rOSzACNo9o7aT4emHKl9Agxr4eS+xWA8IPZ48fCZKTU7RhQfaI8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwdaLsUikL0PbaAQMECh0UzPV1rPem+7YbjCRBCCjFKsq5xn2S/
	MnKrjBR1GysNtUuGxR8QGsUSTtKCBj4oekpkWATrQSMTLQ5U66S4+pQ+dnnsPm8U0Qpvl2nWkVK
	fe1NpIKqeX+EzM9JYF8OFaL3eMZ1rdQR5cA==
X-Gm-Gg: ASbGncst4ftcxoWl3XC4Zh3NiiDd8uBHJNLcSArKNd+KjpPjHu35JCXRdjq6n596ukJ
	UIUBlFxU9QLc28aDZHeru3MN9B2vzfSo/jlRhNcLaWHZdfHinBnsRcqMB+vFI8GSt+Ag4X0x7OH
	lFAKK8qeeESr+Hsv+5LSntI2Sv/4+6OUUdtrLcHaEMm27xQqPuCw6ttDPY6lH7Qxy6LGsj1CNvK
	gOSXTV3P+ZfuK5JLaf8cn7qNE6e0CZ/0I/7Ph+7DcsbOE6Tp8SlVlr4YY7dEws0Y0/rjwIPv5u+
	wtMGHRQOPviE3GyZu1c2SEBj4NovumyCjCLfPMsjUPNkOUvYACHN0ytD+xplGA==
X-Google-Smtp-Source: AGHT+IFYlcasWUbSeH3e/3BpiLkJ/wqunTec57zsoURE4x+b3YDK2EjycXsojz1T4jvgsHKfWfJe30ptkmtu
X-Received: by 2002:a05:690c:7002:b0:70e:614d:6446 with SMTP id 00721157ae682-71048cbb122mr4828267b3.7.1748576886315;
        Thu, 29 May 2025 20:48:06 -0700 (PDT)
Received: from bcacpedev-irv-2.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-70f8ad73e72sm1290147b3.68.2025.05.29.20.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 20:48:06 -0700 (PDT)
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
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
Subject: [PATCH] mtd: nand: brcmnand: fix mtd corrected bits stat
Date: Thu, 29 May 2025 20:46:59 -0700
Message-ID: <20250530034713.4165309-1-dregan@broadcom.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_204808_540850_34311236 
X-CRM114-Status: GOOD (  17.75  )
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
Reviewed-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 48 ++++++++++++++++++------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 62bdda3be92f..43ab4aedda55 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -361,6 +361,7 @@ enum brcmnand_reg {
 	BRCMNAND_CORR_COUNT,
 	BRCMNAND_CORR_EXT_ADDR,
 	BRCMNAND_CORR_ADDR,
+	BRCMNAND_READ_ERROR_COUNT,
 	BRCMNAND_UNCORR_EXT_ADDR,
 	BRCMNAND_UNCORR_ADDR,
 	BRCMNAND_SEMAPHORE,
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
+	[BRCMNAND_READ_ERROR_COUNT]	=     0,
 	[BRCMNAND_CORR_EXT_ADDR]	=  0x70,
 	[BRCMNAND_CORR_ADDR]		=  0x74,
 	[BRCMNAND_UNCORR_EXT_ADDR]	=  0x78,
@@ -449,6 +452,7 @@ static const u16 brcmnand_regs_v50[] = {
 	[BRCMNAND_CORR_THRESHOLD_EXT]	=     0,
 	[BRCMNAND_UNCORR_COUNT]		=     0,
 	[BRCMNAND_CORR_COUNT]		=     0,
+	[BRCMNAND_READ_ERROR_COUNT]	=     0,
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
+	if (ctrl->nand_version < 0x0600)
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
+	unsigned int corr; /* max corrected bits per subpage */
+	bool dma = 0;
 
 	dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
 
@@ -2195,14 +2217,17 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 		if (has_edu(ctrl) && err_addr)
 			edu_err = true;
 
+		dma = 1;
 	} else {
 		if (oob)
 			memset(oob, 0x99, mtd->oobsize);
 
 		err = brcmnand_read_by_pio(mtd, chip, addr, trans, buf,
-					       oob, &err_addr);
+					   oob, &err_addr, &corr);
 	}
 
+	mtd->ecc_stats.corrected = brcmnand_corr_total(ctrl);
+
 	if (mtd_is_eccerr(err)) {
 		/*
 		 * On controller version and 7.0, 7.1 , DMA read after a
@@ -2240,18 +2265,19 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	if (mtd_is_bitflip(err)) {
-		unsigned int corrected = brcmnand_count_corrected(ctrl);
+		if (dma)
+			corr = brcmnand_count_corrected(ctrl);
 
 		/* in case of EDU correctable error we read again using PIO */
 		if (edu_err)
 			err = brcmnand_read_by_pio(mtd, chip, addr, trans, buf,
-						   oob, &err_addr);
+						   oob, &err_addr, &corr);
 
 		dev_dbg(ctrl->dev, "corrected error at 0x%llx\n",
 			(unsigned long long)err_addr);
-		mtd->ecc_stats.corrected += corrected;
+
 		/* Always exceed the software-imposed threshold */
-		return max(mtd->bitflip_threshold, corrected);
+		return max(mtd->bitflip_threshold, corr);
 	}
 
 	return 0;
-- 
2.43.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
