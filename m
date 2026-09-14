Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D19BC88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37T+hz9fGnKTbdOvsYekdyO74FMWasBTBcwfwXKuadE=; b=MjVKnSLDvLc/Ir
	cTNvOuZYrvQkzMCy5WkV1AATpw3sAnu9Lv94AVh9R3OQ/QfFxVqN9YeaZ0E2GCMMQ3GWAOXfJpZqP
	T3jeGof6Dah+/Oxku/8WlUSJeVpWAFfxvqJWCSTTxpqFdKmc8DlrEYFLSQ+TcC1OI8nlDUdOPM0WW
	MQuppP8jb7KpDRMZhJHj7QYa/b2Wm8G9SdaBn0o30mPVyEphYeLvbp6UvB2VwqgflS2c1Yaq/ujjL
	bJ5SJHJwLYbQ6JQDRDiEbCExbjMv5cQUJYcX42zhRvcOo66LRA+JUjaWX3q2Uu/dKq3APpuBENW1K
	hD3G5l+6Ow2OUxtJO1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxF-00000002Cxv-3Hyb;
	Mon, 14 Sep 2026 03:02:01 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wx5-00000002Cjp-3xPZ
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:53 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 46e09a7af769-7f4f0c89e35so966497a34.2
        for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2026 20:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354911; x=1789959711; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gIMuO5LgsmThmwiwqzrGE8ky+825OhMeKFgclE6Udc=;
        b=WyvA5p01AhXdOzZvLkwpBvnPnWilGu9gcUTJzD6q43ByGgLKQ9UdO4dzQdwoB3RMF+
         huukf0ocIB+sy63E95OtKIbP14VyLE4sUKI1EXjQhDnlRsHhwC1FMk8c6hYiccdvT35W
         oZoHhVURNoX76KLVL9j5Tn4XgNmFxNu3l+TSMycmQ8e5JXToTE74N2L+ErYFk6J4ZXuV
         xFWelato3zDiBHZz2/INmuWBFGvUdpNXdKM/iWbYen/XSwZL3ZZl9jz2vO0xzcycyng2
         YUt0pBIgz3wpO0xq6SLNwXkcI6pie+G8tHDx5nNPc6HHMjH2y8M62Tt5cEaBz70HcZdC
         vJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354911; x=1789959711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gIMuO5LgsmThmwiwqzrGE8ky+825OhMeKFgclE6Udc=;
        b=fDH3Ml0EdVWkK/18DXFGUOVJQDKhA+D5hjGlfmm6sry5gDx8MTZWyp8DCXf3xSO+BZ
         kOAaG4Z0x0ZQyPaanET6bvVU4aSuK91hcfAYFIHNi/TAcwAbpLbtCfqjAeUCU2Enx/60
         ceHo1U800c0NyjxVFyZWiQt6DTbHviv7TUDui25QlrmPcNUnADL3QCKM5faIPXzoch1P
         RURnKgmutbiwrB2XShvruWzIR0LGYHguZ5YQ6Cxou67eFG68yWBzL6fn2bsJmCARTWpS
         qsawxgjd3e0D4iDj3podKiwAi6a0SKwifSMZwEly2gZ1hnZ+5UBCnM4C6tuUpWLElF9V
         5Bkg==
X-Gm-Message-State: AFuF++kQ+1oSuokgT/87Py7u+xR+9083IRN5W/ZSUg6S5jIZEo+v559E
	JRBQ9terJXBmRDdWJ/kKxHlRPsEk/c0mx7UYFVua7pnww5UcjBW/Iua9
X-Gm-Gg: AYBFou3V/TH7ZlZh31MLjPuzmtU0K/2UwLpzwDrAjUHx9kpjFEly5yzVnoqEHgImiDl
	+CYc0MMMsFt1GTf0cWiz///f3Wp6CqBY1jswT5dVbmZoimvb4LthnozsOf09eq45f5n6XK188gL
	jVO0zXyDb29m6WVOHujQmAn/cO6JOVhM7DNXg3AIhk9cWM5syMhIpvFj/MB3CjFChTG8Mfbvpsw
	aL0t40aT4BCObSOxrOAUX4V8P5Z0cS7Tw1yqeWeIJcw1i/3alU2Rh30TCS1LCs30SFL/kUWFyEJ
	wC7hH7tFpjhPlzzXNUEWCsoQBOjN8S0jVvdz4S7JBXGXIY+2fXVNLWDeUzoLWF95ZeJOOwTtDZd
	FYMM/ZV3+6i945eyD0tYjGqnD3gV9PPC2wVNqpovD55mQ2UWxC6CjNJcxYff5lAfQmuTgdU6c9l
	64KB2eoIHcHeXwOG4gKJ+30T7NHYOY5fSLSbbcfwyNPfv+sYTwjzvaiCRuzDDzTFxonWMDFeGa0
	1AZjr1KNhiEXJmwMKOyGVjtfxT2+AzSsEPOQ99L8az86WfWVTgcp7beyzxjU5HeDaL9VGdx8KqG
	dajR0nRzk5RT4YRVjj7znbq3jZmVhW5E3KACAyqR4PheH/6VgcQDDNI3xoRgE4np13+EIWOriw5
	++g1548w4X0PDanG/WJmzMjOIC4WF7Q==
X-Received: by 2002:a05:6830:2a8c:b0:7d7:d524:bc88 with SMTP id 46e09a7af769-80897c891b2mr304523a34.10.1789354911083;
        Sun, 13 Sep 2026 20:01:51 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:15 -0600
Subject: [PATCH v5 09/18] mtd: rawnand: sunxi: use page reads to reposition
 small-page NAND
MIME-Version: 1.0
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-9-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200152_015076_C1801096 
X-CRM114-Status: GOOD (  19.49  )
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

The hardware-ECC read paths use random-column commands to revisit main
data and OOB. Small-page NAND does not support these commands, and
nand_change_read_column_op() rejects pages of 512 bytes or less. Ignoring
that error does not provide a physical reread: the erased-chunk check can
instead inspect stale buffer contents.

Introduce a read-column helper which starts a new page read for small-page
NAND. Let the NAND core select READ0, READ1 or READOOB and send the row
address. Keep random-column commands for large pages. Pass the page number
through the erased-chunk fallback and use the helper for normal OOB reads
as well.

Retain transport errors and only classify a physical chunk after all its
rereads succeed. Read exactly the requested region so the tracked column
still matches the start of any trailing OOB.

Also select PIO callbacks for small-page hardware ECC even when DMA is
available. The DMA page sequencer uses large-page random-column commands;
PIO can stream the single 512-byte ECC step and its OOB without them.

Keep the ECC geometry checks unchanged. In particular, the usual 512+16
geometry still cannot fit the controller's minimum 28 parity bytes and
four user-data bytes. This fixes the command handling for small-page
geometries that pass those checks, not a demonstrated regression on a
previously working 512+16 device. Software-ECC and raw callbacks,
large-page DMA eligibility and the on-flash layout are unchanged.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 40 +++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 13dc0af56eb3..e29638c828ca 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1079,6 +1079,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
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
@@ -1087,7 +1097,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1095,13 +1105,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
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
 
@@ -1169,7 +1178,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	const int nfc_step = 0;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1179,7 +1188,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1217,13 +1226,12 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 		return sunxi_nfc_hw_ecc_read_error(nand, data, data_off,
 						 oob, oob_off, user_data_sz,
-						 max_bitflips);
+						 max_bitflips, page);
 	} else {
 		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 
 		if (oob_required) {
-			ret = nand_change_read_column_op(nand, oob_off, NULL, 0,
-							 false);
+			ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 			if (ret)
 				return ret;
 			ret = sunxi_nfc_randomizer_read_buf(nand, oob,
@@ -1285,8 +1293,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1386,9 +1394,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 		if (oob_required && !erased) {
 			/* TODO: use DMA to retrieve OOB */
-			ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							 oob, ecc->bytes + user_data_sz,
-							 false);
+			ret = sunxi_nfc_read_column(nand, page, mtd->writesize + oob_off,
+						    oob, ecc->bytes + user_data_sz);
 			if (ret)
 				goto err_stats;
 
@@ -1416,7 +1423,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 			ret = sunxi_nfc_hw_ecc_read_error(nand, data, data_off, oob,
 							  mtd->writesize + oob_off,
 							  user_data_sz,
-							  &max_bitflips);
+							  &max_bitflips, page);
 			if (ret < 0)
 				goto err_stats;
 			if (ret)
@@ -2305,7 +2312,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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
