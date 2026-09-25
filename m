Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74826C98321
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MfD2lfM+pxtXIn9jz4yzYLGcQPe1mxaQwefI1cchEo4=; b=2oPJdtahGPRSyV
	W6o52XyvZde/zyA7rS2XzAQqUbKqqilJWjlqxxYDWcFbfs9sRylCLbV3aeINr/xDUFtNWUYx590lh
	zQwFOLjMRZClKFNVrb3AopRmQAyeKP2pCbyOUvb3B3F9WEVqSZ0e41SwBxt9uQqCIKGSVb1LD30Rd
	CnUjZHsOyWpXxrzN/WOGcV0j1ulCPINRVTzRCsA3vC2ysX63SWVVE0CJgez7XMG66A3EJ6QbxAIQH
	GMc6GRAKeh5k/8DjLnNX7T4qDSNf6qU0XA02CRzCHVqO9Yjap3PdieGluAqcWEVa9ys0oMlOlKdVR
	pan8xBMC+7glxZjY2Rdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABMT-0000000EF1e-3J2P;
	Fri, 25 Sep 2026 19:13:33 +0000
Received: from mail-lr2-x0e.google.com ([2a00:1450:4864:38::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABMS-0000000EF0x-06GA
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 19:13:33 +0000
Received: by mail-lr2-x0e.google.com with SMTP id 38308e7fff4ca-3a65a351692so949321fa.2
        for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2026 12:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363610; x=1790968410; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5jkKD2v4oiF/61cAOq1H7aVeTB8y+S8JbJGXm/lHUM=;
        b=AtMZVWiHhktTiomoL+V4jwwpkItKOvJV9fDe6KBoe5h4KEvUHIwkJVP9ATPKW37yz1
         bFgf3o8m08iEv+Vz4LSPfCumBY3pOYO4Hh+AjfpGbs84Xh1zqeSS+1LVhbahOFyeVv+4
         /OG0uX+oROfIT2rsnxaID+60CQ8P01xNeAA+YbQR3kQJJVbw0Q9rj3MYAdXlwv11sHn4
         pNVrBgpkR87VTzK/Bt3Nxng1FifJdPwk/2lxnr8/CjK1hnaheoVbE3Q4+1phvboN7q5O
         bC0myGxsr7xZFjV6oZxCRG1WtDvAAmJ1rjHbSUpW1LcdG9taltwwj8/Gp5v6wnPCpwuT
         kwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363610; x=1790968410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5jkKD2v4oiF/61cAOq1H7aVeTB8y+S8JbJGXm/lHUM=;
        b=yYYt3FVyk9+NW9h1w6d3rhJeZk6mE/311d9XM1f6vrb4OGDbXBi9TFcurRq5bwRciS
         kDSDHXNLBdbiZLGY5dtbTlrGCK+P2EI8R+/+W4kVabJ3Bc1E6TP3fTbRoYqznko2Ux+l
         B8/8iEQT9pgST6ewi1fO1WyOtwlVzopuaydeWFXwDa23KjET0ClQ/jJgr4c/SRctL+ah
         RgaAY8cSFXGbhyMtAY+r7GnwTbdu6u53YEk3K7iN+MldvmrWi7RFYEoLo6i+2jWfYaWB
         +6imANaa3/GCQFtID5BsICDBL4sW436Fg/wK3BXlGnzuWmpdaBIBSZklfvnHNxWfnhAT
         cNxw==
X-Forwarded-Encrypted: i=1; AKwUvBxfEX/9a78BULuHQDoxgvQPrVNTUbTWivvxL7inIUYEFwBlRaEkTd7HaSPcjsYmlasgQTAlXcPhu1Y=@lists.infradead.org
X-Gm-Message-State: AFuF++nP4t51yP0ujxvC7qQShfntPaaR6gvOnfU8wPznTYRna7GkY/c3
	aVUsBjKk2Hf/1CQTP6S1wODOgxRTubKiN/ruRmk4SLELj6gcEXFRaLq2+sLs+Q==
X-Gm-Gg: AYBFou0kvunqJ8EpI00ClzPaFEA39HtOMrY6Rtn3Mi+yywaK2akqS8QLpIUbPVs9uRx
	zmdiaEG3fdPhxuMA3uzmQXOEOBKODfrDxlQtxNl0bj05XfCmyK9k4sEVyAUdiInERIpYZnPnNpz
	I+kdrMdBR3SZpG9q8Ta7DXzjWmJlBTodv7Iy10QPnVfbDPP4nbnX54phDF64yYzZFBH86llWtRi
	Hi+BcjgCeevi5b8qj3ASRA2VSnQNGkPvIbYRcc3LxFp9kBTlk+p3r61B1lCG6f+wxYKbGQcVT/Y
	E7jRHoKiZ+ftKG1SscR0+ODBuRxbTozKnJEzGzmhmoI+jNyyIXZ9syuIGDfzYannEa/UiMbG/RC
	rGk+MeZKgshbQy98TJl0YeIs+FIPM91yezYrr1l1YffuSQj2ooNprGfYDIx5GLYoqUZTupzbsaL
	cclmLOULQNyRwvMlIcKryMIadX9sFGfYoDQA5VlhkZn6+SSl+iI96VoO9bovZi6Yog69T6B1t6a
	TuVvbckX3YSHTj21HNCdyZtzlI=
X-Received: by 2002:a05:6000:41d8:b0:488:7b80:f2d0 with SMTP id ffacd0b85a97d-4887b80f651mr6001675f8f.52.1790363187806;
        Fri, 25 Sep 2026 12:06:27 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:27 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:11 +0200
Subject: [PATCH v2 2/8] mtd: rawnand: qcom: make config_nand_page_read()
 more generic
MIME-Version: 1.0
Message-Id: <20260925-qcom_nandc-share-more-code-v2-2-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_121332_087018_BCD42D04 
X-CRM114-Status: GOOD (  17.15  )
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

The function gets a 'nand_chip' pointer as a parameter but it is
only used to extract a pointer to the nand controller's private
structure from that.

In order to make the function more generic, change the declaration
to get a 'qcom_nandc_controller' pointer directly, and update the
callers accordingly. While at it, also change the function name to
use a 'qcom_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - Replace 'qpic_nandc' to 'qcom_nandc' in the commit message to match
    the actual code (spotted by sashiko-bot)
---
 drivers/mtd/nand/raw/qcom_nandc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 12bfb14cd9a3..c65a8416c3f5 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -305,10 +305,8 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, i
  * Helper to prepare DMA descriptors for configuring registers
  * before reading a NAND page.
  */
-static void config_nand_page_read(struct nand_chip *chip)
+static void qcom_nandc_config_page_read(struct qcom_nand_controller *nandc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-
 	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
 	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
 	if (!nandc->props->qpic_version2)
@@ -357,7 +355,9 @@ static void
 config_nand_single_cw_page_read(struct nand_chip *chip,
 				bool use_ecc, int cw)
 {
-	config_nand_page_read(chip);
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+
+	qcom_nandc_config_page_read(nandc);
 	config_nand_cw_read(chip, use_ecc, cw);
 }
 
@@ -490,7 +490,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	qcom_clear_bam_transaction(nandc);
 	set_address(host, host->cw_size * cw, page);
 	update_rw_regs(host, 1, true, raw_cw);
-	config_nand_page_read(chip);
+	qcom_nandc_config_page_read(nandc);
 
 	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 	oob_size1 = host->bbm_size;
@@ -727,7 +727,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	u8 *data_buf_start = data_buf, *oob_buf_start = oob_buf;
 	int i, ret;
 
-	config_nand_page_read(chip);
+	qcom_nandc_config_page_read(nandc);
 
 	/* queue cmd descs for each codeword */
 	for (i = 0; i < ecc->steps; i++) {

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
