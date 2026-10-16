Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6899ECC6B2D
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 03:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4PuTrP6duYSexGb3lNYdqbPGccXr6EL1eNcp6snHjMM=; b=eLs2Hn1p1dedVk
	vto97hRsBiTWtqlGrKaEMJflaAwUnLBFeEPq0tGnXK/zpfTL9gt2Jx8AHA1L4nxPt+yKAKXn1+vvj
	j5rReqqJMqPsgaYBzcCK4OHLb+uYeW5O1aL0UTkKHhgTTc46kfPU+T5uMQGsynZ1bz2ni9Npv8ffr
	IC0f734XiMTxEUMOVzsccaigo03CZyGpcaDxrPdNsha2uyxIYkzu9UXhDjdSarDQji7aHUu+6qxMU
	N/yI51CV9Z+ctB3T7pX56hb1CQ80jen853fRJZGzG625nMEIg0hjCGItvfS9mgZMd5poc0heKZydL
	8YLkEqfEQtrTKRMl+wNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtN-00000001stz-1wKr;
	Fri, 16 Oct 2026 03:46:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtC-00000001saI-38y6
	for linux-mtd@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5/V8rc4CjnNbzKk1bJzDBVlS/8f2AkkYVi/FGYi/KHc=; b=fqkwEVOB4UfLHJ5DoZk36zyUrP
	H5oINdtqhVH20tskinmHWuM5uLfuIT3I/Kk2dvgUU+P9sRFn796UNAcpe8nZYcmFjRoYQM0j7g+Ck
	Nax4ADXKZqYK+0h3/2akhB+6BaDxoSpEjzJG2JanE1t1gOtr8SZAudzf0Z2mfUmct1XR3wSyJz7vT
	ev0nxNHEMez87nT1NiJFjTO/BRmmwEA+b427jEq8zzPfUiQYZeqs7zZ8XAWCY3kkpyB0aZt808gQn
	JR86q+94zVkf8ovX9V5Cl6M+261SSK5TZIrzUtywzA1u9fl/r5Hh5JiXI90XVn2B5Bez/1IE/Z9M8
	iVjPYjfg==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYt8-0000000146D-1owk
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:49 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-823545ce223so2086435a34.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 20:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122344; x=1792727144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/V8rc4CjnNbzKk1bJzDBVlS/8f2AkkYVi/FGYi/KHc=;
        b=fYeOPEiZmyH+IvKiN5PXTgu4R+/BZDUAlgLvdogd9UozS4zEyv7/yx7b3/c+RxEDjG
         5iiLXLnqCBHsch7hosG4IE1Z3b7LB+/86In6OUsb2mwQqI4abavTQj/hkZCOjFno4bGX
         Whw985UzQ+TZSp10GNjHEqgbmpShm/U35JFjD5i22yemtZ028GtNAPprTM3wZ2mqXwjd
         DTWhvu4GcsK73Rn6WuQ1A9fQeGXD2EqpsqNTF5OP6Fy+pw7zeFRHDWpsFM/g2u46LGuj
         OSTEQG4PdxUWHxlApGUzoEs34xMiQyPbOqZM63VkERtYUcVWbFHuhKBlPsd+/a5h+h0C
         isHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122344; x=1792727144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/V8rc4CjnNbzKk1bJzDBVlS/8f2AkkYVi/FGYi/KHc=;
        b=pGoiH+Wadp2m+luERUBa+d7LTJZgPTckEpsrIG16mHdiD4cngvLvHYYVbjtrIwAhdy
         RWIIg551dVRMR0nvMUk7RR+Vg80XsWXQrcWuGl15GFu5WaFVhEN/CPL7rwMi54AW671p
         8HWIOHtVXym1UiYbZH050bAa0EpfpP3EMK6TXf99u/++yoDIcrNeiDERRExUAVvfVKU6
         louwjgwQWwUaT3njqo2l+0rkskcQF+AvgOrl8bcdlWl0UgfvmThY1JBNH3XuM2W9JxQH
         Utl65d15vMkJvE11amyDuCKPWg4ddMPQ0F2XNsmlCt5/ktpeCO3ZlfmA+ZsseAoZOJKl
         g9ZA==
X-Forwarded-Encrypted: i=1; AKwUvByxpWcdt3HVj2UoE0/GrQs9kcX/oEAEzrSpkw4/8Q51qofBx+IOyzcg8ehjqEkYyB6N0sqyghW09wI=@lists.infradead.org
X-Gm-Message-State: AFq9FYLLrUSL3qLjgMG346N3dlBxEfpvZSXdjgFt36hRDwxozEXCGEnD
	nR8msUywHybFCLEG1N9LDsU4neP+E+4suhnnVI4OHKARnDTgbEW9fNba
X-Gm-Gg: AYBFou35vNRiUZrqAboSGGLUqPo6Va2ihmHG6WzEofZYka7V0dq51Zv9n7fgtKR0rv5
	HB5q8tY/Tpsxq5DVuphoaLlqwZrRD+gRCWO+i99+HYiW8WFL1Tizonpb16yX5d5IjCc0EK45Lzg
	IPROvTwamCx/VHNOjuKEOv3/mBOhChYCy4Ieo50pS7jE7QKFxYGyuvVa+3wl5dXB0ExFy3KeOjX
	VlROFNaxApw7Onejc68DcdzJgGph3MCIAXz54dTrbk7B8xB0KVXAwMWQgBjfd5EkPPjFXBQIHtD
	J2f+lBkl2HVk2+rdeB0v+7N2mTf5mklFpF2uUnZXikqBBl6x+sz78m2DzqCKUJjL0ius4IowuWX
	PzhD9F9tMK6yCazyrKeZp0pDyGFmqh4bJwPkcJyOa87CwY12HHPizcp//A++kqqX8JjcGC6+aJ7
	Tx7q3CLI9Du5zGaXh/W+G9DRjze52hjFLYaEPMwoSLDivTjov8J9lNOcDQ6zHxW644ytDNzyrZ/
	nAz8E2UGun7qNp276cXoojhZSSPDRDivOOLVxQv1eOPWlFA3ZTpMJeMmuYJMDeZyzKv766kemsv
	VWbiV8G2mTe6wpRU24+HUg4O+POI5Y6I/hwkQfxweqj+N5E0cW1MiS6sPZT/4TJUi/NE8+IRmpl
	mZ2wVetIPGvnWv+JJ+8xwtQ==
X-Received: by 2002:a05:6830:6816:b0:7fa:ac4f:79d with SMTP id 46e09a7af769-83097c62d97mr22209672a34.25.1792122344353;
        Thu, 15 Oct 2026 20:45:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:25 -0600
Subject: [PATCH v8 10/17] mtd: rawnand: sunxi: use page reads to reposition
 small-page NAND
MIME-Version: 1.0
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-10-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
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
X-CRM114-CacheID: sfid-20261016_044547_379839_89108902 
X-CRM114-Status: GOOD (  19.36  )
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9f03ba22b4b7..34c1c5037b11 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1061,6 +1061,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
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
@@ -1069,7 +1079,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1077,13 +1087,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
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
 
@@ -1184,8 +1193,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1250,10 +1259,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
-			ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							 read->dma ? oob : NULL,
-							 read->dma ? ecc->bytes + user_data_sz : 0,
-							 false);
+			ret = sunxi_nfc_read_column(nand, read->page, mtd->writesize + oob_off,
+						    read->dma ? oob : NULL,
+						    read->dma ? ecc->bytes + user_data_sz : 0);
 			if (ret)
 				return ret;
 
@@ -1289,7 +1297,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read->buf + data_off, data_off,
 						  nand->oob_poi + oob_off,
 						  mtd->writesize + oob_off, user_data_sz,
-						  &read->max_bitflips);
+						  &read->max_bitflips, read->page);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -1329,7 +1337,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1339,7 +1347,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -2312,7 +2320,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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
