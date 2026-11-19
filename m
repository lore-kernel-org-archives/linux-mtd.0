Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641CD606A331
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k1CFlVAX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cL0fXI2k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IGxBsvYkeacuO/2iGA8daD8oRzGgs7EmgoAaJvnAe4k=; b=k1CFlVAXMpgBiMr0A0uP7EG/5l
	y2viB4AbZpmMGwIQAObbvcNNIC8EqLyctQOdV0RZAJhPdD+4LG7nHYzEr4cRQD1iWoULdYCgWdS18
	gLjXGYYeFi4B+F9NQ4gd9nAwKWBT97SBNtw+XYN9i6yY1f5OmSxjnuUozyibDlcMwRO3s27NI/c6O
	0M9RJoy0GXxxsQxTOpqCuhSs8eE/LEphxODfgDxat4nQZ6rSS+cxgA9fxp9X6XI/4VSpsRnIsZXOV
	Lv3ar4bM90oe6ZBzF1oAPPqf1Apj3SPcS/3KcyOqU+ZS7rI2ykFgmjJcqosLPudfeTI6I6crcfSWl
	+6kA01fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1wg-0000000BzlN-1yyu;
	Thu, 19 Nov 2026 13:12:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1wd-0000000Bzji-2k22
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 13:12:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so17008675e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 05:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795093972; x=1795698772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=594xmkQi1EzZuFVwgIAsPQJhrxzAupoR0I5ZsOI+SEY=;
        b=cL0fXI2kkcXS3oBQGrAvCnBvBii7pYx36HzNiTIgpuM8Li71O+nMMOw86buafLAFMH
         O3TqFdmiqTDnoDW08LuYVRX+bfSHDSfPYtiPHFVZcZw3g6NYBxbqa62JoMNUGadPhek/
         J34Zn25LeNO6Hm7caTB9f7e3J3YOwRVy7RxNSwTDTRKXeE22BVHg4XEahh0EKGY0b7zI
         K2F8wVPtDX6mnAij9ZjV36wEq7MsC18hbeuj1faWVNbVsLFi5DzUvltjYk+ttvIT+qUO
         mnizBPgkRnmLjxDgjPUga35UxV+pX9kk4ux13lBRPpLXHFXPUPBtlOzhI765G9RZzCC5
         rnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093972; x=1795698772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=594xmkQi1EzZuFVwgIAsPQJhrxzAupoR0I5ZsOI+SEY=;
        b=zkF83MOhPEVEns85sRi8hkCKdofx2koDUxQ/lEqllU1JUHj1IAeAxl7D2Lei/5uz58
         1o+toevExiPMxc437fWsDw6EbxUpVc0BVjk5o66ViYbVTcK3WTn0Ki9N3tHcHZTBLLfu
         aAKe3Q4ET0vZ8ps8LXhC8KCShjhhIAJ3+NK8fasUEyclM2up921G+LWnR/ztqQqBw/e1
         TuI3tjE9XR5hqMM7ogaaht7u1fBiJD7RS6OOB4J3Weqp7ejdjOBzSevvfW4XJE7hnvbz
         UF6BJgWpLsoJiAaXd2JUGnD6IiXPhp8PhKB+TSenq5c22SnyiIdnjPL3PNFk+oWUPa4w
         ayKQ==
X-Forwarded-Encrypted: i=1; AL+hErF0dXz+cTzo71ReyllklqAMXTL3LM0dHXc7pSa5zPIUd8O2xp5LPB66bAJB6ofUhOmOP2aL0mj34K4=@lists.infradead.org
X-Gm-Message-State: APuU4Z8uVVWXUMfzFL5KcbLHB9gdCaYJnomWXxZdHbvclqz82tH/vZCK
	Df3uyLm12I9x6XnJuRQCp4Q6l/tSYv5apKPEFbb55JhfnboVqzLQe4ue
X-Gm-Gg: AYBFou2By5R1ToWz7D930HXMv4MLEngfJhptW09xMkkiF8X42qGi5L/MYHj9nI1kj39
	ctkf8HqxXIeZ0oFHLT0PEux39gLCwHibwcycifgtlp+QK3kx62Xk5YRC/XkRcHdNyRYIxGyHX8C
	g4i/wTOcNlvuSAWJe9FdqGTeI95ljz0WPru60XMhQqEFJlJ3TbanzqgilYYEra0qugpuhBIGMhJ
	q2WVKrua+XFS9Df5Tfe521DFicVvrW/9zO7+vlrYnH46zIHqYETFDYCjJ+n2L4VbHOgCLNaQib1
	+/A4JATCK/Gow1H/j1QW1RYjo+0j15uJfeBTShzCTyQIqIw6lrJQmPluIMMGUCfPO4jeU8jHIa0
	FIERO8FwJICAPvhHl4ZBHwauAjpQMIshQgq+qIyBTJPUtLNKBgtMVzPIsq6jxdz5M4w2D8pbwt0
	9QaSdntiq8jh1d2rIzoboLXL4xmfbZ7ZD87+/Z8+FG2W5MNFnDBWtbkqGvrHbDFZpejG4k0jgvf
	0HiuVQiPrCrpAqVY4fy+r31WBJSqHrvW+6obPFgQ0YpdaxoU9f50Q2pK0u/BPUGcXL2ZqPo+dBs
	3W8UFztU5nfdH7HCNj2VTBAKG0e1MDSLbq0=
X-Received: by 2002:a05:600c:354b:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4bb7da47513mr113467925e9.32.1795093972307;
        Thu, 19 Nov 2026 05:12:52 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343645sm38588485e9.5.2026.11.19.05.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:12:51 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v3 3/3] mtd: rawnand: vf610_nfc: return an error when a command times out
Date: Thu, 19 Nov 2026 14:12:46 +0100
Message-ID: <20261119131246.187406-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119131246.187406-1-mehmet.fide@gmail.com>
References: <20261119131246.187406-1-mehmet.fide@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_051255_738738_6BD7E336 
X-CRM114-Status: GOOD (  18.21  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A command that times out only prints a warning. The callers carry on,
copy whatever the SRAM buffer holds and report success.

Return -ETIMEDOUT from vf610_nfc_done() and pass it up through
->exec_op() and the page read and write hooks. The page read counts
only -EBADMSG of the raw re-read as an ECC failure, so that a timeout
there is returned as well.

Fixes: 456930d80a2d ("mtd: nand: vf610_nfc: Freescale NFC for VF610, MPC5125 and others")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 547eb1513893..488e63b301b7 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -288,9 +288,10 @@ static inline void vf610_nfc_clear_status(struct vf610_nfc *nfc)
 	vf610_nfc_write(nfc, NFC_IRQ_STATUS, tmp);
 }
 
-static void vf610_nfc_done(struct vf610_nfc *nfc)
+static int vf610_nfc_done(struct vf610_nfc *nfc)
 {
 	unsigned long timeout = msecs_to_jiffies(100);
+	int ret = 0;
 
 	vf610_nfc_clear_status(nfc);
 	reinit_completion(&nfc->cmd_done);
@@ -309,9 +310,12 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
 		dev_warn(nfc->dev, "Timeout while waiting for BUSY.\n");
 		vf610_nfc_clear(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
 		synchronize_irq(nfc->irq);
+		ret = -ETIMEDOUT;
 	}
 
 	vf610_nfc_clear_status(nfc);
+
+	return ret;
 }
 
 static irqreturn_t vf610_nfc_irq(int irq, void *data)
@@ -331,8 +335,8 @@ static inline void vf610_nfc_ecc_mode(struct vf610_nfc *nfc, int ecc_mode)
 			    CONFIG_ECC_MODE_SHIFT, ecc_mode);
 }
 
-static inline void vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row,
-				 u32 cmd1, u32 cmd2, u32 trfr_sz)
+static inline int vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row,
+				u32 cmd1, u32 cmd2, u32 trfr_sz)
 {
 	vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
 			    COL_ADDR_SHIFT, col);
@@ -348,7 +352,7 @@ static inline void vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row,
 		"col 0x%04x, row 0x%08x, cmd1 0x%08x, cmd2 0x%08x, len %d\n",
 		col, row, cmd1, cmd2, trfr_sz);
 
-	vf610_nfc_done(nfc);
+	return vf610_nfc_done(nfc);
 }
 
 static inline const struct nand_op_instr *
@@ -370,6 +374,7 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 	int op_id = -1, trfr_sz = 0, offset = 0;
 	u32 col = 0, row = 0, cmd1 = 0, cmd2 = 0, code = 0;
 	bool force8bit = false;
+	int ret;
 
 	/*
 	 * Some ops are optional, but the hardware requires the operations
@@ -448,9 +453,9 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 
 	cmd2 |= code << CMD_CODE_SHIFT;
 
-	vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
+	ret = vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
 
-	if (instr && instr->type == NAND_OP_DATA_IN_INSTR) {
+	if (!ret && instr && instr->type == NAND_OP_DATA_IN_INSTR) {
 		/*
 		 * Don't fix endianness on page access for historical reasons.
 		 * See comment in vf610_nfc_rd_from_sram
@@ -463,7 +468,7 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 	if (force8bit && (chip->options & NAND_BUSWIDTH_16))
 		vf610_nfc_set(nfc, NFC_FLASH_CONFIG, CONFIG_16BIT);
 
-	return 0;
+	return ret;
 }
 
 static const struct nand_op_parser vf610_nfc_op_parser = NAND_OP_PARSER(
@@ -572,7 +577,7 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int trfr_sz = mtd->writesize + vf610_nfc_spare_size(mtd);
 	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
-	int stat;
+	int stat, ret;
 
 	vf610_nfc_select_target(chip, chip->cur_cs);
 
@@ -587,8 +592,10 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 	cmd2 |= code << CMD_CODE_SHIFT;
 
 	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
-	vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
+	ret = vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
 	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
+	if (ret)
+		return ret;
 
 	/*
 	 * Don't fix endianness on page access for historical reasons.
@@ -610,6 +617,8 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 	stat = vf610_nfc_correct_data(chip, buf, chip->oob_poi, page);
 
 	if (stat < 0) {
+		if (stat != -EBADMSG)
+			return stat;
 		mtd->ecc_stats.failed++;
 		return 0;
 	} else {
@@ -651,8 +660,10 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	cmd2 |= code << CMD_CODE_SHIFT;
 
 	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
-	vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
+	ret = vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
 	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
+	if (ret)
+		return ret;
 
 	ret = nand_status_op(chip, &status);
 	if (ret)
-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
