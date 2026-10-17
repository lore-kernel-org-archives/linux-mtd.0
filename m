Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9078DCCF2C4
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 19:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIln+mfPe17SUKQ5swJg2dv6IBwaW4NohpXhpWSFRV0=; b=XpzDacLuahBalA
	6zA9YkOYZHfjlounbNMLvSNlGS7Qo7K1Zcqmfd4Wp/f0rPAaTXBaW4shWb1/5LS0ogI2ccWNFn3V5
	1zHNQu+UNgG60BvSxMGIOB7GArFBQj5Ppdan+Iz2WzhqScNfmTKtSO+J+rUFJDMdNdQlwfE0JIkl2
	d1NLyGiRZj71hoQvnFKgKY0ot4zgSO5p5zwUyfRCJQGayNWIooCpPz88mfc4EdzLwIN9JH9SK3TGw
	7OFUbL0/5VjN0dvKYA3JABLtwjuTSTaKqJHNX1AbPAID8I8Q9bKgC5yhG4b7JqpLhp5+kOP3a5MYm
	APeYx72cqOAM4UGmN80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAN2-000000059qc-1Cg1;
	Sat, 17 Oct 2026 19:47:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMc-000000059MM-2lPk
	for linux-mtd@bombadil.infradead.org;
	Sat, 17 Oct 2026 19:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=p/4qBmrvtH6EJsayupSppfu0h+5jh/KQVNPd30Ou/RE=; b=hR4bC9YnI7SE4omTFq9KZam5Tk
	8T3jzMdRTuguR1Nnmc2K1YM6Ix0eqrhkfESJrYMPwYIw9jKom2KKzGqTeZX+x0BTmUzu3yXxW0yXp
	w8tZ76y6A5qnO1csiFuztQZdgCjzPjZ7PmWuh4+V7qou4cDaVfd89AgrKxL3zpRbcjTKFilUsINKs
	tZtyuOvrREutqITZP2CobjBz2tu0PvkDDAzM8pMfhbpTCHoemWs7FOLiLG0pJD1BzYZpY42PjM9cq
	gEVsmJzzNBbIIUKk/0i2h8grYWI7TvetA20kaloENj75LeRXgA50X8c6FoMpIRngWjQcJqUQeyZoV
	55YmT3Tw==;
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xIAMU-00000002YNJ-2Tg2
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 19:46:41 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4f59ea27bd0so336617b6e.0
        for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2026 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266389; x=1792871189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/4qBmrvtH6EJsayupSppfu0h+5jh/KQVNPd30Ou/RE=;
        b=HIQl3kXPK86xpkPDY0xRofjjgDccmRDGkJDIA2exr+y4JzJs9HAd0xO6UgdNodtEyt
         JW/zKVFO4DHhdfuVk5K3RUfjzeyLXXS7rGx0pQPXejxrmMHxhGTQljxyYRqwiqqow5lJ
         9o07q3F+c3Qm2wMzEVbv13EQCHIRDRUVfwHC/NWheSQzVMQf1P2ZzrWsCihQmWdOsjRC
         78McIoC49ZOOtqXuKnR+l3UutWWQsyc4aqWGYrT1zvT17c7mjrTuP66hROzX04avJk7f
         JnU81GENioVMKX0w7nl1KJBbu8BCHyYJ5oha6e37WswqDLlKOXlkDQM+OkPFsN233fLx
         Ugxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266389; x=1792871189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/4qBmrvtH6EJsayupSppfu0h+5jh/KQVNPd30Ou/RE=;
        b=2AITR06NZwswmbFdg2SGW9o0MOUYplWVOJNpnQP/wmIpKhW3ltgMtplSM9ydhqrfvf
         c3rWsY4aA3AG+jBGmW3/eUgbs175TvQW3Dne2BK8wUugXUGcYCCQlOREt1Hqo6V8p98x
         DQf5jYLsu5w733z9Wfrz0BUDakN1OOkophsV2BMctS0JF11JqhBneSfdTYGvJYqp/faf
         7I6G9Z0rYn0m4uNEaNN5raNfbK8IcJmBujODjIi9CuBdbsZ3hBU7+u50UMN2g/rO219L
         2XdPyiO5oQrI4ClXLalBBzeyzx+9QvKMHYj2Uf4/tVqWsMCSrzUNJzo1P7hiFL4BN0ct
         j0Uw==
X-Forwarded-Encrypted: i=1; AKwUvBxxzlQZxN8ZCypBU5J5NGQNlOJALp5kCpVhp+P2KXwagVlfFqzCJiA1rkJ742l7C9gSMNnSh7ooNq4=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+yzORCPMb45d9KoYbZf+fJXklrPS+eT7EzKiwu+vCtVngDuWs
	G7pU5Z2RKCxqnrE/O1gVHZQxNKQpySuAvOliMrgGBrPUR+daUSTdCY+S
X-Gm-Gg: AYBFou3KzI/WQgnixAzUOvBFqQigaMXt+VqPoq7wSJAfGEO1FuQD15LHnN/yiMLtKoe
	SsU5ohfDMHlcBDNtx4xAb76HQPThjuhppcrbNV0FRzM4DdJPXtYOLrLYGUGlxdkHI8IwJjldDNB
	BrorRWeJwgZWtOL/WLHLlzTwhwmnEq4wgbla783wjh1knmmXP+ZNJDCvV9ceZy3FUyc7OiVtBmU
	QfFEbkneOd0dJtGwHNKbN3nAzmEO4RhnzdVagU1kt/WIOItp1arVzQJgt66PasNnVzX7Y3IfcFe
	TAIIQmCiGJtGVR2BrB4Pk6o7/8iUnUElfIYwSnG9iQ1DAgVsJR6u3anBr/VBjnUNeQcRi+YM7+2
	Luke/QL3/8lWfczWk8lSI/oWH1XqTsiycNoMlwEwr2qkRnEHYHs4ZJ6J0USz2SEgcKbarYocYYu
	p0jOoEsmZCqtHVJquahZXdNgkQcsvTjVpx71shwDlJf9PzXUsrdve/N6dH0cgutCpfoK2vpHy4F
	ZrPhk0oVxwWNi8MBYWsXwau6WdAvIDPdmSSvi1d5mlgQAiH8SGr7O0FauYsfphWuh7FDyYCSkHx
	SdFOSpIs+xOZkHq/S9Ip8LRLHBtlD0g7V99bZIU+0jQKvWs/HMAb4kAhXmxnxUHsPV/ijOTj8Zw
	I61EZ8BL5papTR4WEDZ97
X-Received: by 2002:a05:6808:c115:b0:53a:8c5:d7d7 with SMTP id 5614622812f47-53cd209d1damr2708997b6e.58.1792266389388;
        Sat, 17 Oct 2026 12:46:29 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:04 -0600
Subject: [PATCH v9 09/18] mtd: rawnand: sunxi: propagate buffer and column
 transfer errors
MIME-Version: 1.0
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-9-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_204639_720871_4109B241 
X-CRM114-Status: GOOD (  18.96  )
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

sunxi_nfc_read_buf() and sunxi_nfc_write_buf() move data through
controller SRAM, waiting for FIFO space and transfer completion. On
timeout they stop their loop but return void, so their callers cannot
distinguish a complete transfer from a partial one. The hardware-ECC
paths also ignore some NAND column-change errors, including extra-OOB
transfers performed after DMA. Reads can thus succeed with incomplete
data or bytes from the wrong column; writes can issue PAGEPROG after
failing to transfer all the intended bytes.

Return the transfer status through the randomizer and OOB helpers to the
page callbacks. A read with a NULL destination still fills controller
SRAM for ECC and must report errors even though it does not copy to
memory. Disable the randomizer after either transfer outcome, and use
the page callbacks' error exits to disable ECC and skip program-end.
Update a tracked OOB column only after the requested transfer succeeds.

Keep transport status separate from the maximum corrected-bit count:
zero from a successful OOB read must not erase a positive correction
result. If an OOB read after DMA fails, restore that attempt's
corrected/failed counters before the caller retries the page in PIO.
Leave successful command sequences and the returned OOB representation
unchanged.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 174 +++++++++++++++++++++++++-------------
 1 file changed, 117 insertions(+), 57 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 82af3ccad885..b79a20158cd4 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -681,7 +681,7 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	writel(ctl, nfc->regs + NFC_REG_CTL);
 }
 
-static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
+static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
@@ -697,7 +697,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
-			break;
+			return ret;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
 		tmp = NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD;
@@ -709,17 +709,19 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 
 		ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, poll, 0);
 		if (ret)
-			break;
+			return ret;
 
 		if (buf)
 			memcpy_fromio(buf + offs, nfc->regs + NFC_RAM0_BASE,
 				      cnt);
 		offs += cnt;
 	}
+
+	return 0;
 }
 
-static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
-				int len)
+static int sunxi_nfc_write_buf(struct nand_chip *nand, const u8 *buf,
+			       int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
@@ -735,7 +737,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
-			break;
+			return ret;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
 		memcpy_toio(nfc->regs + NFC_RAM0_BASE, buf + offs, cnt);
@@ -749,10 +751,12 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 
 		ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, poll, 0);
 		if (ret)
-			break;
+			return ret;
 
 		offs += cnt;
 	}
+
+	return 0;
 }
 
 /* These seed values have been extracted from Allwinner's BSP */
@@ -902,23 +906,31 @@ static void sunxi_nfc_randomize_bbm(struct nand_chip *nand, int page, u8 *bbm)
 	bbm[1] ^= sunxi_nfc_randomizer_step(state, 8);
 }
 
-static void sunxi_nfc_randomizer_write_buf(struct nand_chip *nand,
-					   const uint8_t *buf, int len,
-					   bool ecc, int page)
+static int sunxi_nfc_randomizer_write_buf(struct nand_chip *nand,
+					  const u8 *buf, int len,
+					  bool ecc, int page)
 {
+	int ret;
+
 	sunxi_nfc_randomizer_config(nand, page, ecc);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_write_buf(nand, buf, len);
+	ret = sunxi_nfc_write_buf(nand, buf, len);
 	sunxi_nfc_randomizer_disable(nand);
+
+	return ret;
 }
 
-static void sunxi_nfc_randomizer_read_buf(struct nand_chip *nand, uint8_t *buf,
-					  int len, bool ecc, int page)
+static int sunxi_nfc_randomizer_read_buf(struct nand_chip *nand, u8 *buf,
+					 int len, bool ecc, int page)
 {
+	int ret;
+
 	sunxi_nfc_randomizer_config(nand, page, ecc);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_read_buf(nand, buf, len);
+	ret = sunxi_nfc_read_buf(nand, buf, len);
 	sunxi_nfc_randomizer_disable(nand);
+
+	return ret;
 }
 
 static void sunxi_nfc_hw_ecc_enable(struct nand_chip *nand)
@@ -1169,31 +1181,39 @@ static int sunxi_get_ecc_offset(struct sunxi_nand_chip *sunxi_nand,
 		sunxi_nfc_user_data_sz(sunxi_nand, step);
 }
 
-static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
-					    u8 *oob, int *cur_off,
-					    bool randomize, int page)
+static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
+					   u8 *oob, int *cur_off,
+					   bool randomize, int page)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int offset = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	int len = mtd->oobsize - offset;
+	int ret;
 
 	if (len <= 0)
-		return;
+		return 0;
 
-	if (!cur_off || *cur_off != (offset + mtd->writesize))
-		nand_change_read_column_op(nand, mtd->writesize + offset,
-					   NULL, 0, false);
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
+		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
+						 NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
 	if (!randomize)
-		sunxi_nfc_read_buf(nand, oob + offset, len);
+		ret = sunxi_nfc_read_buf(nand, oob + offset, len);
 	else
-		sunxi_nfc_randomizer_read_buf(nand, oob + offset, len,
-					      false, page);
+		ret = sunxi_nfc_randomizer_read_buf(nand, oob + offset, len,
+						    false, page);
+	if (ret)
+		return ret;
 
 	if (cur_off)
 		*cur_off = mtd->oobsize + mtd->writesize;
+
+	return 0;
 }
 
 /* Interpret one PIO step or a completed DMA batch before reusing its status. */
@@ -1243,14 +1263,22 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
 			if (read->dma) {
-				nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							   oob, ecc->bytes + user_data_sz, false);
+				ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
+								 oob, ecc->bytes + user_data_sz,
+								 false);
+				if (ret)
+					return ret;
 			} else {
-				nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							   NULL, 0, false);
-				sunxi_nfc_randomizer_read_buf(nand, oob,
-							      ecc->bytes + user_data_sz,
-							      true, read->page);
+				ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
+								 NULL, 0, false);
+				if (ret)
+					return ret;
+
+				ret = sunxi_nfc_randomizer_read_buf(nand, oob,
+								    ecc->bytes + user_data_sz,
+								    true, read->page);
+				if (ret)
+					return ret;
 			}
 
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !step,
@@ -1290,9 +1318,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 static int sunxi_nfc_oob_finish_read(struct nand_chip *nand,
 				     struct sunxi_nfc_ecc_read *read, int *cur_off)
 {
-	if (read->oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, cur_off,
-						!read->has_erased_chunk, read->page);
+	int ret;
+
+	if (read->oob_required) {
+		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, cur_off,
+						      !read->has_erased_chunk, read->page);
+		if (ret)
+			return ret;
+	}
 
 	return read->max_bitflips;
 }
@@ -1311,13 +1344,21 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	u32 pattern_found;
 	int ret;
 
-	if (*cur_off != data_off)
-		nand_change_read_column_op(nand, data_off, NULL, 0, false);
+	if (*cur_off != data_off) {
+		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+	ret = sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+	if (ret)
+		return ret;
 
-	if (data_off + ecc->size != oob_off)
-		nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+	if (data_off + ecc->size != oob_off) {
+		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -1440,13 +1481,21 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	/* From the controller point of view, we are at step 0 */
 	const int nfc_step = 0;
 
-	if (data_off != *cur_off)
-		nand_change_write_column_op(nand, data_off, NULL, 0, false);
+	if (data_off != *cur_off) {
+		ret = nand_change_write_column_op(nand, data_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_write_buf(nand, data, ecc->size, false, page);
+	ret = sunxi_nfc_randomizer_write_buf(nand, data, ecc->size, false, page);
+	if (ret)
+		return ret;
 
-	if (data_off + ecc->size != oob_off)
-		nand_change_write_column_op(nand, oob_off, NULL, 0, false);
+	if (data_off + ecc->size != oob_off) {
+		ret = nand_change_write_column_op(nand, oob_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -1472,27 +1521,35 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	return 0;
 }
 
-static void sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
-					     u8 *oob, int *cur_off,
-					     int page)
+static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
+					    u8 *oob, int *cur_off,
+					    int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int offset = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	int len = mtd->oobsize - offset;
+	int ret;
 
 	if (len <= 0)
-		return;
+		return 0;
 
-	if (!cur_off || *cur_off != offset)
-		nand_change_write_column_op(nand, offset + mtd->writesize,
-					    NULL, 0, false);
+	if (!cur_off || *cur_off != offset) {
+		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
+						  NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_write_buf(nand, oob + offset, len, false, page);
+	ret = sunxi_nfc_randomizer_write_buf(nand, oob + offset, len, false, page);
+	if (ret)
+		return ret;
 
 	if (cur_off)
 		*cur_off = mtd->oobsize + mtd->writesize;
+
+	return 0;
 }
 
 static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
@@ -1640,8 +1697,8 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
-		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
-						 &cur_off, page);
+		ret = sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
+						       &cur_off, page);
 
 out:
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -1766,10 +1823,13 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
+	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING)) {
 		/* TODO: use DMA to transfer extra OOB bytes ? */
-		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
-						 NULL, page);
+		ret = sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
+						       NULL, page);
+		if (ret)
+			return ret;
+	}
 
 	return nand_prog_page_end_op(nand);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
