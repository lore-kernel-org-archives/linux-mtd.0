Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9B7CC6B35
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 01:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/6vbZUpA7jqNDh/8uCL1medFzn0uF4Wx1JIC1LpoFQ=; b=jU4KvucKQfU5kf
	QS3lskQkyiEmCCcwPUXCGE67cHnazAfEMb78b+7Fzhv1EpcWhljO6uPR3S1RvJZxadbuMrtJFJ9pA
	WZ2MUtE7pw3/I48oIfZr1O0tXLDehPm6zOZ7xco0sVh/w7+z4wqW+FzNFqfUpWZwSZwJVHgpOD4tS
	oPEhHilNvLaowT5o6GmGjbG816Vlrq2lrtV9LdvrV7JL9BKoNIN2eHQhL8Mr7IEK8zr/1/wDAhUhb
	DUm9qBdUvXjP8g4/iLT9q/WzngzN8YdFGPsJVMhN0/zR7Qbw3ubFh8vDYIKGbSWy0Qa507kzio0Be
	NuHFmeLikJtzN0/mv3og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMi-0000000GYag-2rNy;
	Thu, 15 Oct 2026 01:34:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMb-0000000GYOZ-1OqY
	for linux-mtd@bombadil.infradead.org;
	Thu, 15 Oct 2026 01:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=V8zDMiUEBwO1gulkBzoLNFoNTmgcXEIIu2kuyTI/+xI=; b=AGL8kpmlco613rPv45PS/SsJ5o
	rfXY6sm6SKQqPt2rxOpyZx3crJ5CyTtk7BN3Z1xibQlK1azJcGLyRhOJ121Hndp1zyDuVO62xgoA3
	X2FGwVZmqlcHMykI/bm7PIFwaiZuwIk7S9FSytJakznApgUIjb+fz9fUnukLkbJP4Jkplus2/Pbgj
	jma2LaRYQV8YphTSESoXMII+dMXHYjPn2X25piBXj0b+bpbIVzw6vcG8o9DKxEdEE5Acqv5wkwVRf
	h9mzi3PpdoKaFjuAGzfSdUGxFYgmQSXml8/kVOSlaQseunjfNGFOS49K5Ml/COSDJ5Ye0VdeP0PSG
	u7hs5xOw==;
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHAMX-0000000HLY1-3Uzl
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:31 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-483a66818edso558902fac.0
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 18:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028068; x=1792632868; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8zDMiUEBwO1gulkBzoLNFoNTmgcXEIIu2kuyTI/+xI=;
        b=Xb4BEwGjCEl/OZh5q0yUtUPYgDJCd96enEvWGgm0+oz8f5OS2V2rJnw7MDGDv+k7V2
         sOshd8hKXKne1Z3K7W+nyxs69aLQPYocwJw62cMJpvZU4YlgVrYlHCpsrblsgUo9QOOC
         ZzuTa7qo0SjoKhbM6AQaQGSTlhtMLrRROmpU9OkXojX3GofYsnJyoBLvRQApLvAOhPqA
         vANKGD+YUswdcHmADczQuHrhhrjJE6H0QhaQ1XzYZW8qUb5IdA8nwEkoh97ARCer6VHI
         aCJEtDZMJbbEN+eESdolkKNVka0XSt7ONK+DXVFdw58Ietg0/PQ554FZFx3amLA45BYM
         dQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028068; x=1792632868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8zDMiUEBwO1gulkBzoLNFoNTmgcXEIIu2kuyTI/+xI=;
        b=C0wydDKP7Tk6PKzolWqUtn+jbUdTFJF44U6468VpUHadqTvaYNBuJ/0agOvAG2msXf
         t21EvcdB7fcgS1ApQfest5dO6H1FY8/r2YDED/55sKzA2Asy8ncmK+QG9xJeiJZ6g3gJ
         68n2rrPm/mWhD/90bAzqFlgbu1+E8Heo/5a5oYTzhEdxQOslBfG/DT5EX/SQzLyMEO+T
         dWmhXlF1r8Unt/AL/RN38+IFTGg8XBeHw1R34nhgik43JROk7poZKBCG9Vv4tH8UzNpU
         6jjW89cqV/ZQmGBTlEGvN76VQzVcuVPRScd/EU95r3WJ1x8u1F7d7H+U7qYnICfgv70m
         hPhw==
X-Forwarded-Encrypted: i=1; AKwUvBwSq5YnV6N4UXL32vj5uGRCOV5Tq8dT3JXp3lCwlQkAzFxDmWysAlnI+Q+4EvAlYTXGKH3wvSEIhbo=@lists.infradead.org
X-Gm-Message-State: AFq9FYLIjqgYrWt9mTmhjIqwCoEiwHFRCWNQ1U4YESb5LN0cNlk1pM+b
	yRryk2OFWgYGomNdQ6yfx66W2T8W9b5SL38aqZM5TJOcms5XjFkqmdYq
X-Gm-Gg: AYBFou3cOWKFWjTlyCFfl/eVliJ0Fz+rVqxZFhVuqfD8CoRCapjt+CSM9tdyyh3kfc7
	OL5/cX98Plv2F26veDtWLxmIkD1g6XPMVZT7zYUJ03veADdNI7GofVFXQe9fWVrwIL2RZdwj0ly
	vNO/7kv5QEmH1xnZrws/gRfNfAlf7aIugv7rv/2oMuGffmh4FwBR550egE5u0agKbClg62/u6E2
	YxUun/i93MBbZ3B1jXmyqJIH0XYFdabkS3pUN75omZQOgqAh8G6uumCcBlOOl36AnvbBekB8fT7
	Rv7Kn4zWraDYqIUEMyj/XeQZ9mX6OVXqyh8DRDUoMa1Z5UCj0sk+CqPTMPrmGGhu0CnbAUcmzFC
	i4Qkm+vEw5QibcHeRURuZBva5hz+FSIVDzAd+Bubsmg7P7jQlbiooj0HlnTAEPfTfNyH49GmUMx
	y+Er/0c4SGnozwE919wAPc3f0z52YmJibxAwJMT6I09SBXG4awPGmdrSExC2DYjkS8k9FOq9ZFB
	RLO18M9L2A+m9UWiqbWfUlSSgQ5D1HsQVoevBEEFhgZXJYEiBCC9tggb1HlKOBGGqd0Ah4m2aWK
	9bIn48dAuB41TKkqBt6timk0Y0r7ZgZJQu7IjSmDHaF7NqqQPEs41JBZs5PgnuF5pfmnXy7V7FJ
	IqpkN0k8lDEJzklIwEHem
X-Received: by 2002:a05:6870:a40a:b0:494:76db:2aa8 with SMTP id 586e51a60fabf-4a2a86a7ebemr15214415fac.5.1792028067725;
        Wed, 14 Oct 2026 18:34:27 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:56 -0600
Subject: [PATCH v7 09/16] mtd: rawnand: sunxi: use page reads to reposition
 small-page NAND
MIME-Version: 1.0
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-9-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
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
X-CRM114-CacheID: sfid-20261015_023430_163028_05340887 
X-CRM114-Status: GOOD (  19.45  )
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
index 6c4e1740a245..f8abcb46f7f0 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1054,6 +1054,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
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
@@ -1062,7 +1072,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1070,13 +1080,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
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
 
@@ -1177,8 +1186,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1242,10 +1251,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 
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
 
@@ -1281,7 +1289,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read->buf + data_off, data_off,
 						  nand->oob_poi + oob_off,
 						  mtd->writesize + oob_off, user_data_sz,
-						  &read->max_bitflips);
+						  &read->max_bitflips, read->page);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -1321,7 +1329,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1331,7 +1339,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -2304,7 +2312,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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
