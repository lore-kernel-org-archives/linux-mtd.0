Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B95CCF2CF
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 19:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7R/W8JIueFdk9l72GVvkmtU+7Zz99UpMu35MVgXypy8=; b=A9GoujtMuPHaPA
	XNngJXAhmXwt+6JLYY++WbK44Vf8ht8wIUqszMpN6QpSHEo9apuL/wXBdJsmHwq8RXYBk1HbAqUjM
	uhCl5BFNZJdC9JFHD4l1V92qLzXfRsy8A9b5loSI+tRmhybgUo8wWWoxk4dCUfKBa2Dlv+Pd2Yisp
	YYsMGrLe6ENK6iq5Mc3fsLa0GC/NRt0Xp9CQoK/DJ2E5YG20oBL+cUF6SqIwdhiYiVVTaWT+OxQcc
	cy4gFyCy4UQ030W+UYBLsqfFeMK9GyWb7aGz/iIhVGoDcb70JcxVvFNu1DPoMymCiYwiZLT2HGPj3
	1CaljjxOLn8p6X8jbSfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAN2-000000059qs-1oQD;
	Sat, 17 Oct 2026 19:47:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMe-000000059PW-0dFP
	for linux-mtd@bombadil.infradead.org;
	Sat, 17 Oct 2026 19:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mTIpJDfoSvJa9mNPyvSlvbjoEPEDMGD1iYdf7xNBtEM=; b=qBnhi4X25gnMy43YPDwYztka4u
	VfxUKoBw7iBLfVxzO1ekvslUuHGD2Ax3xLLd0VXFtlP/90Q09ng5TFqXNCBctBnMj71aLzPOPpXA1
	0J/cUqgEodNxtWBoJjuf/qYFbne/w9muGcSC4CmrOregG03N9IKNst0M4WtQP4eAEjr8JypW5yExl
	Ig+VtOAfL7PiUVD+/2L40DFViF8jIrndKsKxtg7SAo63Oh1jkga/IrCGs7/D09PCMxvxWOSLruumK
	2JR12yXuoPpbxNWpKPgZPaVutXDAOmpgDk/p84+qFWBSo5JtaJINUNv69vaRr4x9FKw5IMdcurVtn
	tdNwck8Q==;
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xIAMZ-00000002YO1-1XnV
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 19:46:43 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-4c27f0df6e8so395433b6e.0
        for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2026 12:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266397; x=1792871197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mTIpJDfoSvJa9mNPyvSlvbjoEPEDMGD1iYdf7xNBtEM=;
        b=X07lfs/cgi+7xcLa0EW/sz7iDRr/Rosp3hPDSBfwAbRIjNvyIAcJ5/orXIkj+OIM8h
         HeSpifLOb4IK+BtZb0720s6mfhmq/+iKaE7L+x/ck3OpM7rN7xcfU4IiMHkFJNVdiCaa
         OXgQQTp9LjmczQdtePHjCGN41lXEJkp9bp9KKPpXUCZchQXm7QxpkfxM+07eTwpi+iFK
         b40qxu0ITJR33ZXNYLtz7nIblD5UrLWcxZzlymXTP4WSpeAvRodmzwD7YVsV5gtnwV/e
         6Z0x7izYJe2ZPLwSOatG4MY4s56nkrCo70JY3a6YEp5uz/RxgmINYCzl2EaDl9yCrvqs
         njRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266397; x=1792871197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTIpJDfoSvJa9mNPyvSlvbjoEPEDMGD1iYdf7xNBtEM=;
        b=TFZJ4C5v4CY8lpkaRzl0PWxeoOokcK9rAth+ghN1Vg0OwD/wZxyc+oCKCODaKIL9SM
         93lLVpqVEu4nBjL9HR6X7OatTW1oK+0bYxiO1HAGOYETOT2N6aIYZbFkALe4kiUaEwIp
         qiicwpMHnYYBe6n/mbxY+fTCeMRcdEX2/LNVd+dlp37x7ebSscUFPT8z1YICTFWNWVXE
         fx0X8Xbu+B8deJDuhAuBECMuFPdwlhfC5OtFn+bta3CDGl/yG2mAEEwGbKR+Nacv9FDs
         iuzzLRcCBslYWjq86uWm4kA7RLUUl3i2puzNURVg8mLLTkOUmjHATWM5uXDRag9fvEF6
         jQAg==
X-Forwarded-Encrypted: i=1; AKwUvBxEiRnQZnRCftqkwUnp1y84NXG2uJbJ4pJ9SO2NTV8Xx0Ahc2fIN99bcaCntx/rI1vImUB4/SqTIww=@lists.infradead.org
X-Gm-Message-State: AFq9FYLXbK5xvfZ1M9EnHPhXRoy15RBF18X0qTpCY5gtiOd9bhG5bCdX
	f5+krW3ZtYTsZGRwpRHo+ep9csjOOHhEz5OERA32Uk5Kss/YMJ9A5Jm0
X-Gm-Gg: AYBFou2pMnaj1hh/OssKZ7HVL8KhJY+D6/0NEtRMHTtMbDOXUfrjZHOaQIP8wJx4cfx
	Ig3XUq5ORnKF+JrE+uCNgwIi9v756D00lFTy0QbfhS+m51TZmcI2Wxs2NVZGsoj/FLWqyjDf046
	lVWQDYc+0mHb6KS9Oq92pGk7KFAKh/AQwaaRrsGSMZrTfrncV4GDpbER4ImVC9pkTX1YSa8g5xO
	4sf0NcHoPmsEkqq8m5vGlh3uXzuK1HK5tA5tG6Ieqgce4JnKzYnbJXDOghY1gxHHp890bmvxFlT
	qRrhv5INCnRCaRk5ITYJt8kn1brO531TAz0wKRu8YkCMXi/TEsx10xO9g1nKucz9+EPLAtHUjkR
	9hbylNok1kLvvzX91+3MIuN0H3UnFJ2CgbdXl+FjFOiu/e2fDpJesihUZIBYifg+lOeXumt3SCN
	qhb3sI8Z6n33x7+ebk1ASfsjAo/rDDdOV5Nw2qph7S49Sd1CgyrJAkFdcbHaHwQmLw32dVtxlcx
	GW0c7GXz+QUaL05YyNQWEltTm9ibA==
X-Received: by 2002:a05:6808:6b89:b0:4b3:7549:d3c0 with SMTP id 5614622812f47-53cd20aaa38mr2724743b6e.18.1792266397145;
        Sat, 17 Oct 2026 12:46:37 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:06 -0600
Subject: [PATCH v9 11/18] mtd: rawnand: sunxi: use page reads to reposition
 small-page NAND
MIME-Version: 1.0
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-11-b624c09e3ee5@gmail.com>
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
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_204641_148641_F1542CDC 
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

The hardware-ECC reader moves between main data and OOB, and rereads raw
bytes when checking a possibly erased ECC step. It uses
nand_change_read_column_op(), which sends large-page random-output
commands and rejects NAND pages of 512 bytes or less. For a small-page
geometry accepted by hardware-ECC setup, these reads therefore fail when
they need to reposition, rather than using the small-page read commands.

Add a read-column helper that uses nand_read_page_op() on small pages.
The core selects READ0, READ1 or READOOB for the requested column and
sends the row address again. Pass the page number through the
erased-check path as well, and preserve errors from the resulting
operation. Keep the existing random-column operation for larger pages.

Select PIO for small pages even when DMA is available: the DMA PAGE_OP
sequencer uses large-page random-column commands internally.
This corrects read-side repositioning only; the write-column helper still
rejects small pages. Software-ECC and raw callbacks are unchanged.

This is a command-path correction found by inspection, not a claim that
ordinary 512+16 NAND becomes supported. The existing controller-ECC
limits still apply: it needs 512-byte ECC support and at least 28 parity
bytes plus four user-data bytes, so 512+16 remains rejected. No
small-page hardware validation is claimed.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260913041642.E28F81F000FF@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 40 ++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f00f9a8ff66b..ab9ff470062a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1072,6 +1072,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
+static int sunxi_nfc_read_column(struct nand_chip *nand, int page,
+				 unsigned int column, void *buf, unsigned int len)
+{
+	/* Small-page NAND needs a new READ0/READ1/READOOB and the page address. */
+	if (nand_to_mtd(nand)->writesize <= 512)
+		return nand_read_page_op(nand, page, column, buf, len);
+
+	return nand_change_read_column_op(nand, column, buf, len, false);
+}
+
 /*
  * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
  * statistics updated in either case. Negative values report transport errors.
@@ -1080,7 +1090,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1088,13 +1098,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
 	/* Check the physical representation for bitflips in erased pages. */
 	if (nand->options & NAND_NEED_SCRAMBLING) {
-		ret = nand_change_read_column_op(nand, data_off, data,
-						 ecc->size, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, data, ecc->size);
 		if (ret)
 			return ret;
 	}
 
-	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = sunxi_nfc_read_column(nand, page, oob_off, oob, oob_len);
 	if (ret)
 		return ret;
 
@@ -1196,8 +1205,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1263,14 +1272,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
 			if (read->dma) {
-				ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-								 oob, ecc->bytes + user_data_sz,
-								 false);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off,
+							    oob, ecc->bytes + user_data_sz);
 				if (ret)
 					return ret;
 			} else {
-				ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-								 NULL, 0, false);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off, NULL, 0);
 				if (ret)
 					return ret;
 
@@ -1305,7 +1314,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read->buf + data_off, data_off,
 						  nand->oob_poi + oob_off,
 						  mtd->writesize + oob_off, user_data_sz,
-						  &read->max_bitflips);
+						  &read->max_bitflips, read->page);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -1345,7 +1354,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1355,7 +1364,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -2333,7 +2342,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
 
-	if (nfc->dmac || nfc->use_mdma) {
+	/* The DMA page sequencer uses large-page random-column commands. */
+	if (mtd->writesize > 512 && (nfc->dmac || nfc->use_mdma)) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
 		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
