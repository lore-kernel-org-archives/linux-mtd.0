Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFD2C0219B
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Feb 2025 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Oq1sZu40FtdDj2SlOAHogq963lvC5yniuU7OaxkTjMQ=; b=LQxT5wM3v5mSvJ
	pjH8/7x//3Bop76BnRZKO6rug/tmsHFfWQpGr26raKctY4eVM14rFYSDbHDmxN/9QpbfobSjcJLni
	Veqf87vFevjP7vo5JQSp4ZkVLyNkw9IpjB6ZnIpwdK2KKh1WDMx5jpMLLiMO9vow2L3XnVKZVDali
	oMal2QHbfPRGDggoXtFIEG+jQvPnRKKmVsxiK5rcj0iOAZRmBgvTzmlSYS/j90zlI8Zt0oDtY5oHh
	A8Ns0flr+DDxPO1kwgo1Uk+GjG7C8AmeJ0l+MDXL4ryzXx2bipDla6y9gd5HMaMU5Hurpm110ikNT
	Ib9XBVdS+sgfVpWsO/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th8iJ-0000000F2xD-1iuK;
	Sun, 09 Feb 2025 14:55:15 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th8iG-0000000F2wU-36H7
	for linux-mtd@lists.infradead.org;
	Sun, 09 Feb 2025 14:55:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38dcc6bfbccso1081611f8f.0
        for <linux-mtd@lists.infradead.org>; Sun, 09 Feb 2025 06:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739112911; x=1739717711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VR6UdNPUPJ42D/VBzpeWAAtAvkLAE7xD5d1I3/gJKTc=;
        b=k5zSC9/5iCR+633yPZfp7BK6ebKQj/ajU0DOnlrfSXHaZNpartmQevuUNADpx8t5ue
         es/+zs9pZVXWBGPv1n4bhDUqFSXUb985z8a+RdE3Aq5CtlLo3ySZAuxOeXQ5uATFlVjP
         4rY8+3m6M6+4ngfFFPj46JqsvCr5pNSh10QFcrM8UzKl0LJdM7m67LHhcPXGj4d3R9B9
         zZyxX916lehmzfsM3dvl1zIj80X2M5mqzjxG4eZ4Y1D1LZF+tgdNItcqA4eyjPaogaoR
         rtQCfAxjb/Bn6GIlWKPRaqTWhPstZmQZFjJWRHb6quL687787yHskLkisxyz3KT2shms
         e0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739112911; x=1739717711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VR6UdNPUPJ42D/VBzpeWAAtAvkLAE7xD5d1I3/gJKTc=;
        b=cX4ksr/c+v2iQMZXZZ2Xw/B1kiOWQW7XMM476lo2+stYnzzPw+cTuRQZRMyhM4fmYa
         7mdKU1zyRdxf5jGIy+YvqE2TlasEERV47F9JXEI7QpaCtLpqD6Fh/7wbdv1F2+PygmSq
         jxQXh1T0n1DwDMWYlMVUdspwOepiVKoL2jHnU0vE+q8ifXdZaqxi+TKYvjU368XV8AA3
         F6O5FCb5Q2eC/pOFzHUzOnYHRvUmLbEyOGhJbfc0+4Sd+1urBCahz4bdB+EQR/Gz2l42
         yGOO423VyyrbnHlTwNpHPgUqtdwOTRhKz4o8H6Rk68rWVQ874at0P1OCCuH9bUnFbtDT
         QQtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVSn3CUnZEtp0KWBzwzQXzJ46qI1tmk1W0cRpYBQW44dnkbSCeIlJmGKVMPX5fSKmoABqfjUVHBi4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw78hlKUlSk4kNM1EMzHZNiqjZi+jLd/J1uYYhOK9I1bNtPmsUY
	muWC4n/pz72RUC/een9m0EplCKGolW0TV/TWTFAf74+adYJg/DVo
X-Gm-Gg: ASbGnctdyKPQpoX7kraqJAp68t5AMD087H9a4US8MevJXZOspEt4ArDG7ULdUGP68Zp
	YG08ypvOJyUwoizKRRF1zm8K1m/0SikeE6uaABQBQf8sFSkAPG+2dsuerGmQ5N1eRlG8jUoW0XJ
	750BIjd5h8BB5l7GmM9G3JK/SXPA0XCNX4TEFbm+q/qd+QKGathl2pvM63inyFv8TmKQ+oudB7q
	5dVWAWmkY4E03811w8UWjuOhlS32ygqOvFQdnJRO0HUVEnr/xbRA2chTYliwM+OMEffna6HMIib
	5HxlygZGaDgU3axwJgEN8939Wjq9JVMURaci+xo6EGnhBJxgZV8C2GRMCzwn
X-Google-Smtp-Source: AGHT+IFHe7gvVLclb1m+4Z27Ar57CqWhA65W6sLxSy8rAjGx/OK7ohocscL6lEIOsqgeUbXb4Kh4PA==
X-Received: by 2002:a05:6000:2aa:b0:38d:daf3:be6a with SMTP id ffacd0b85a97d-38ddaf3c061mr2341962f8f.40.1739112910710;
        Sun, 09 Feb 2025 06:55:10 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-439069290c7sm138387205e9.0.2025.02.09.06.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 06:55:10 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] mtd: rawnand: qcom: finish converting register to FIELD_PREP
Date: Sun,  9 Feb 2025 15:54:32 +0100
Message-ID: <20250209145439.19047-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_065512_784331_562AB280 
X-CRM114-Status: GOOD (  13.78  )
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

With some research in some obscure old QSDK, it was possible to find the
MASK of the last register there were still set with raw shift and
convert them to FIELD_PREP API.

This is only a cleanup and modernize the code a bit and doesn't make
any behaviour change.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c    | 36 ++++++++++++++--------------
 include/linux/mtd/nand-qpic-common.h |  6 ++++-
 2 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 6720b547892b..5eaa0be367cd 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -165,9 +165,9 @@ static void nandc_set_read_loc_first(struct nand_chip *chip,
 {
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	__le32 locreg_val;
-	u32 val = (((cw_offset) << READ_LOCATION_OFFSET) |
-		  ((read_size) << READ_LOCATION_SIZE) |
-		  ((is_last_read_loc) << READ_LOCATION_LAST));
+	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
+		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
+		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
 
 	locreg_val = cpu_to_le32(val);
 
@@ -197,9 +197,9 @@ static void nandc_set_read_loc_last(struct nand_chip *chip,
 {
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	__le32 locreg_val;
-	u32 val = (((cw_offset) << READ_LOCATION_OFFSET) |
-		  ((read_size) << READ_LOCATION_SIZE) |
-		  ((is_last_read_loc) << READ_LOCATION_LAST));
+	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
+		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
+		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
 
 	locreg_val = cpu_to_le32(val);
 
@@ -271,14 +271,14 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, i
 	}
 
 	if (host->use_ecc) {
-		cfg0 = cpu_to_le32((host->cfg0 & ~(7U << CW_PER_PAGE)) |
-				(num_cw - 1) << CW_PER_PAGE);
+		cfg0 = cpu_to_le32((host->cfg0 & ~CW_PER_PAGE_MASK) |
+				   FIELD_PREP(CW_PER_PAGE_MASK, (num_cw - 1)));
 
 		cfg1 = cpu_to_le32(host->cfg1);
 		ecc_bch_cfg = cpu_to_le32(host->ecc_bch_cfg);
 	} else {
-		cfg0 = cpu_to_le32((host->cfg0_raw & ~(7U << CW_PER_PAGE)) |
-				(num_cw - 1) << CW_PER_PAGE);
+		cfg0 = cpu_to_le32((host->cfg0_raw & ~CW_PER_PAGE_MASK) |
+				   FIELD_PREP(CW_PER_PAGE_MASK, (num_cw - 1)));
 
 		cfg1 = cpu_to_le32(host->cfg1_raw);
 		ecc_bch_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);
@@ -882,12 +882,12 @@ static void qcom_nandc_codeword_fixup(struct qcom_nand_host *host, int page)
 			    host->bbm_size - host->cw_data;
 
 	host->cfg0 &= ~(SPARE_SIZE_BYTES_MASK | UD_SIZE_BYTES_MASK);
-	host->cfg0 |= host->spare_bytes << SPARE_SIZE_BYTES |
-		      host->cw_data << UD_SIZE_BYTES;
+	host->cfg0 |= FIELD_PREP(SPARE_SIZE_BYTES_MASK, host->spare_bytes) |
+		      FIELD_PREP(UD_SIZE_BYTES_MASK, host->cw_data);
 
 	host->ecc_bch_cfg &= ~ECC_NUM_DATA_BYTES_MASK;
-	host->ecc_bch_cfg |= host->cw_data << ECC_NUM_DATA_BYTES;
-	host->ecc_buf_cfg = (host->cw_data - 1) << NUM_STEPS;
+	host->ecc_bch_cfg |= FIELD_PREP(ECC_NUM_DATA_BYTES_MASK, host->cw_data);
+	host->ecc_buf_cfg = FIELD_PREP(NUM_STEPS_MASK, host->cw_data - 1);
 }
 
 /* implements ecc->read_page() */
@@ -1531,7 +1531,7 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 			    FIELD_PREP(ECC_PARITY_SIZE_BYTES_BCH_MASK, host->ecc_bytes_hw);
 
 	if (!nandc->props->qpic_version2)
-		host->ecc_buf_cfg = 0x203 << NUM_STEPS;
+		host->ecc_buf_cfg = FIELD_PREP(NUM_STEPS_MASK, 0x203);
 
 	host->clrflashstatus = FS_READY_BSY_N;
 	host->clrreadstatus = 0xc0;
@@ -1817,7 +1817,7 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
 		q_op.cmd_reg |= cpu_to_le32(PAGE_ACC | LAST_PAGE);
 		nandc->regs->addr0 = q_op.addr1_reg;
 		nandc->regs->addr1 = q_op.addr2_reg;
-		nandc->regs->cfg0 = cpu_to_le32(host->cfg0_raw & ~(7 << CW_PER_PAGE));
+		nandc->regs->cfg0 = cpu_to_le32(host->cfg0_raw & ~CW_PER_PAGE_MASK);
 		nandc->regs->cfg1 = cpu_to_le32(host->cfg1_raw);
 		instrs = 3;
 	} else if (q_op.cmd_reg != cpu_to_le32(OP_RESET_DEVICE)) {
@@ -1900,8 +1900,8 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
 	if (!nandc->props->qpic_version2) {
 		nandc->regs->vld = cpu_to_le32((nandc->vld & ~READ_START_VLD));
-		nandc->regs->cmd1 = cpu_to_le32((nandc->cmd1 & ~(0xFF << READ_ADDR))
-				    | NAND_CMD_PARAM << READ_ADDR);
+		nandc->regs->cmd1 = cpu_to_le32((nandc->cmd1 & ~READ_ADDR_MASK) |
+						FIELD_PREP(READ_ADDR_MASK, NAND_CMD_PARAM));
 	}
 
 	nandc->regs->exec = cpu_to_le32(1);
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index 4d9b736ff8b7..35e7ee0f7809 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -108,7 +108,7 @@
 #define	ECC_FORCE_CLK_OPEN		BIT(30)
 
 /* NAND_DEV_CMD1 bits */
-#define	READ_ADDR			0
+#define	READ_ADDR_MASK			GENMASK(7, 0)
 
 /* NAND_DEV_CMD_VLD bits */
 #define	READ_START_VLD			BIT(0)
@@ -119,6 +119,7 @@
 
 /* NAND_EBI2_ECC_BUF_CFG bits */
 #define	NUM_STEPS			0
+#define	NUM_STEPS_MASK			GENMASK(9, 0)
 
 /* NAND_ERASED_CW_DETECT_CFG bits */
 #define	ERASED_CW_ECC_MASK		1
@@ -139,8 +140,11 @@
 
 /* NAND_READ_LOCATION_n bits */
 #define READ_LOCATION_OFFSET		0
+#define READ_LOCATION_OFFSET_MASK	GENMASK(9, 0)
 #define READ_LOCATION_SIZE		16
+#define READ_LOCATION_SIZE_MASK		GENMASK(25, 16)
 #define READ_LOCATION_LAST		31
+#define READ_LOCATION_LAST_MASK		BIT(31)
 
 /* Version Mask */
 #define	NAND_VERSION_MAJOR_MASK		0xf0000000
-- 
2.47.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
