Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCA7606A33D
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 19:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nrxaa3XR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zjjrwaRn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UB3GiK0B26V86igqQNsYOmmai+1P8SNyNoYjAB5LipM=; b=nrxaa3XRtCayRgHpKzUlFgq2QN
	PlkUdA3t6YLo3HXTzIUXMd6YBTAthSQRjXYXkYggpXxC/8P9q6OhxqAiec9kD2DuEjqf9Xo61e/UC
	Va4tNuyTRjIzg6n/IqdhaeS9OzTvi+ikw8uzHZh/e3Ht9FBLEfCf+LdLTkk/uEO0j5P6rtSzGrG7o
	QQ80ejLE9wFvWafL/uoN7JhuSwQaCFvXBR5BxaPzwaO8aUjCQYbufNA2ZGQaORvGLCgtmtKO84EBA
	UJRYgEB38KjBu9tLl3cLkpe/zq2F4ntzPDLF8gAdkZbaBSmcCiWdrIGeJVOauFjuZ4oey71TrzHmU
	Eihi9WFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJIw-0000000Gf7C-0MAC;
	Sat, 14 Nov 2026 19:20:50 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJIp-0000000Gf4h-0KXy
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 19:20:47 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-55c48582654so9787811cf.0
        for <linux-mtd@lists.infradead.org>; Sat, 14 Nov 2026 11:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684042; x=1795288842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DeWc8W1NhIBdehZmUo3RGXoiEr7NAQbmeD328Wa8hwE=;
        b=zjjrwaRnfKaBRipzJNLFoG4+JLeyB0aBUnqgsm9yzE0RtMdyBwj86M7tmDRoWrNubW
         x4oD37yb/eC4YYQxGHE+yICdLVMFYC86pbwC6oos7m0FXaFCV7E8VWYxRD/6x9UqY/WQ
         u4ASqMmtAAy1SZ81OQMr5jn4IqWpAZBeH1jrHJHNh4xPHGJMn6Nju2Iy7Ip+UiD8GiRB
         EEDJKHlqw2ed6qGeGpkGZM++VkgWoF1BE9FVln9ro651pW3tPOCEio+3QWOmka8QlcsS
         2ZeSJ9Ky3oFXUgQz0wgG1hDrz0KEpTJ58j0Ua4CPXLoc1kaaD5raU0i642RYxphcIDGa
         JG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684042; x=1795288842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DeWc8W1NhIBdehZmUo3RGXoiEr7NAQbmeD328Wa8hwE=;
        b=IWwlEFzHz6+IIodW5f8uZrXKEGKElQYhFMc+rwJjgjEZmA/IAnx+11ErSWzIVpX+Ow
         0bLOHc2QObQbl3oy4Ys1aggxPMIY9Qg7WQmesqD0t0B3PC6qOhPViGn9nwVaVT3BzZn6
         ED2SOOB55X2FYYxc15p1zgQ1JxSZFOAp+9KfhHo/VKsoT7qcuJE5iMq+XmajtR58roaQ
         Dc3zs07Ng2ZJYMmz6TjNsUg2Z2Yhu95BVBgbM6cGC+j8i3asf3blaasc9Rujlzkr6Mgg
         5R4QaPjJlmGVKyjfbSkD/Y4oA1TR7ETXDOfEkLeq7IR8vIF6TsT7nMYIX8JtN2AV83uw
         Jsgg==
X-Forwarded-Encrypted: i=1; AL+hErHHZ4rbDY2XZiwJpghFFNUEdKU1sYU4k9XmHNwcsuhclj+p7J66AuAnYozV/Vg36c5EWVGjRHzciSk=@lists.infradead.org
X-Gm-Message-State: APuU4Z87+soPGirpFbci43/HU6ZLiUZICqUTHlGXEhvff3sUltiGl84U
	1EMe9jOoWBoLywBkIsc/q8NWpC/E+MfKIJ4KPaesvDOigw8Lo5S4RCXI
X-Gm-Gg: AYBFou3VUNVo7VS+KtpjRa7MAuxpl42qwwXWrimLBiv2zrgfVbtuG3OzuxVPD2fpnOS
	Ox260sYevSCl8JrzJYnFHU7JtlcJq5nEgixgc1fFGCk2vGGWZb6ggbYcnrGB/Z075c7qFzPeK8K
	jCOZheprCNbZ2Ph77x/UB6omVmCwRnrVhdjOw2HLEbXASxaNMzTJgRD9yEIqU2+d0sxvAHgvEd6
	n06kkmgmRPbLr8JI6Y/+GgAu4J8NA0b43AwDmhC9EluH67nJ8hRrJV0r6cA9OXxhXdAk8IqF7v0
	pmRQZMdZcjPe/RHxGwnTYQJNUj/lYXO9x2d+uco9OkTkmIVsyBeRPfEFc3skKv18MPvO3iI+pls
	UbHgSUv6qR8VDcFFeAdFv6BnfhcG7cqEESG/iqgwshb80ax+0kBq28OpE03Twf1+NRvMgVBwk3D
	Def7Y+/tYuWkYQSAIHjs+Paa6JwOVV21w4ai2FR4e7yUSZ/PaDJC0K25dE7EomxrDEo8Hof9wpD
	qR/mTys8wuK8s2nq0Bnt7F5Ml7ar4RZVde0URmageHO9axgnKnhYKoo9OsKULq//kqnW63shkhi
	47sm0k5XeKMPSOEkWesakON4LzUegjx9nJM=
X-Received: by 2002:a05:622a:258e:b0:533:3bd5:b6e0 with SMTP id d75a77b69052e-55ac857f9e9mr105572911cf.59.1794684041554;
        Sat, 14 Nov 2026 11:20:41 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dbf30dsm48544256d6.44.2026.11.14.11.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:20:41 -0800 (PST)
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
Subject: [PATCH v2 3/3] mtd: rawnand: vf610_nfc: return an error when a command times out
Date: Sat, 14 Nov 2026 20:20:31 +0100
Message-ID: <20261114192031.959376-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114192031.959376-1-mehmet.fide@gmail.com>
References: <20261114192031.959376-1-mehmet.fide@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_112043_138618_DA78194E 
X-CRM114-Status: GOOD (  15.62  )
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
->exec_op() and the page read and write hooks.

Fixes: 456930d80a2d ("mtd: nand: vf610_nfc: Freescale NFC for VF610, MPC5125 and others")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 547eb1513893..d6d4a18432ce 100644
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
@@ -651,8 +658,10 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
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
