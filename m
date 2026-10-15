Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE6CCC6B34
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 01:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BenV1Aeu4CUvSoc+A2obA1RO4KEVJWcJYsmf761fSgE=; b=gzWbPPza3lESOs
	LtRx7K6YUG3lZPU1vH8E7Y3GcAUtKVU8GZvdO2U0BSbtGolWQU4YcvyU+qlJ2P+4bCy+ng7C3COKj
	jVqLXkHNw2YK/SxjNZVU+xvpgTuqjpYrkQxnpc+aSXIjFAOPtAEBVQ1FbBEJ4yECpPd9rjZQ2upt+
	Qv0eHRQbJGDX/ezKZrG99PVPZp6my9U9CREx0m/G29H73KyXMAvqasBtMbwrNRZkjoC11XrqVwm56
	Angrk5lhABQOLW+FmfXTezxJ8GmZDvaoWSHpdIFKXmna9kDVcrJH2cxHsTMF2Yjtk5WEknfn3Grgp
	FvKmfGWJhknottbw1awQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMl-0000000GYjP-3PmJ;
	Thu, 15 Oct 2026 01:34:43 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMe-0000000GYSi-2Edy
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:38 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-48e2d5a69c4so582397fac.3
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 18:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028076; x=1792632876; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oafE3Y1G60hqD5AuR17ZSRtdy2A1IL7jrwTpft1hiNc=;
        b=G92dtwMHrgpIMONeAHFfXrrB0VdHDOr9oxbsZ8QCq2Q6Fyb3Bywp4vLTpn+H/Th0Mh
         wP/NBPI3lQ503Kqe46LAd1667h1Pjdfi2mKRipkXLQr1VFIJVuh1Fq+DLEd8Uo9DvbO/
         qWQvTtAso0SWWUBVuhKBQl4nHYfNRUZmRbDNRSOM+YDDjLtAJJa5Io+8giKYlelXZC4y
         j0uLnvwmnIAuDX+/InQv4QK3fWtB0rIxGqbj78wuW0j1wmX3HgiYZbeuF/X14E8tKqlZ
         mMHh4qJhYWaTwDXi0lQh840DDJJ9+Wo33YcnQUqaqy2oRKZsDBe3oBPTNBrbPGGSBKY+
         FSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028076; x=1792632876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oafE3Y1G60hqD5AuR17ZSRtdy2A1IL7jrwTpft1hiNc=;
        b=WWRv/Z01Bc/I23D0zB2mSAbQX2VKeB3ZYL5pNPIHidxH0uvwThXC5T2i6p6H/qiiug
         gOnrLeb9+k90FsMmqnxiyUstNL3//NkcC5kLTe7IVA1ksjc7DjlWWHX2qMSB8uy50x2+
         jujW633T/uyKLM0iE0JsKW+25XKFfkYQi03jkfJEy3lkFOhRO2Y5HvuOzk8S3+UOX65s
         zrmxao6x+PtT66uA3wBKV8yHdf1URt4PuIRwnr+ymvnXD03H3Gz/HKDGnW+uU3jqflqH
         lLD19JNviOkKTt21VV+O6uBUegLTFgrxJqvAuN7zcfrdVG6ecFn5//wd9qKDbPa4ZNLk
         /mew==
X-Forwarded-Encrypted: i=1; AKwUvBzri1K2MC/x/gVCaq/FRvodW8pdVoEcLzSb0c49q+OYKcMYbx4eh/E5D97zdr4reZYlOTQa8xX5/sw=@lists.infradead.org
X-Gm-Message-State: AFq9FYLNGgyqkiYtBI7j/sY+WWEd1B7deBoAVIoVauFFjCOIqtXcIXf/
	onz5RxXnKoj2ZvoglXP4Mfp7ARlfrIOQ5u/An9IU8CkKce/IBIN0XX5U
X-Gm-Gg: AYBFou28FyNYHQUWWvSBx1GahKS8nNjpIiS56h0x5DqrBehjYKnazsBbbemZ00rrBI/
	N3RyIOsDPgj60NlObf3zQQUyKPFZcpfsCC8Lh2/sOyWOZZBc952ChYqvtqoJ0WgwpIpWYKNtocy
	FgKhCJbozUs6niuXm5Fz1UXGRMOVBbE6mtowZipUJOKf2yQ5wfPIJCW2lgFeSOfp6EBT0rare+9
	HO+KMmx4MNp0SqS/OfZmjerbJSyGTNcS65oPorSzqnEPoboGyYl/Hs/oH9j9qIUjbBmI1xw8GG2
	N+5e3qdkadfuf+mZyX3nDba18+5bFZwhID1BAXOIVCJJEzcqDa64uFen2bwfMl0QU0tNJtnx6PT
	zVRpjot3vd+1Zq+tk6K7fG9Fv2RnaDoILM63DnBisBYB+qaa5KI/rAy/lSJU0ke8HnABBsMmFbl
	vSaeMAhNymZDhx9vZOzJbb9aO2lWUbOv8wB0UBsNUEMkFOWXqR8eGm6w1udQ8zXgiGSkFaYwS0P
	+8phlColPofKZS6C0bhnKEiMSpbNYsC86z6JSYkdIpMaS0u8AuzfCAvm0imWuax2/hpfEEwqFrj
	82qAmxreumD2XIcww3PFGoyNe6ch1DsZ9QgUjf0zmoQytjBtWDVMF23xvWlDnPtlZ/i2sArzqWT
	mEGP8mfGQMuAo2/VIaBRR
X-Received: by 2002:a05:6871:722:b0:48f:e0f6:bd5f with SMTP id 586e51a60fabf-4a2a8b0964amr15694991fac.48.1792028075784;
        Wed, 14 Oct 2026 18:34:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:34:00 -0600
Subject: [PATCH v7 13/16] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
MIME-Version: 1.0
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-13-5d3fc6ad2da1@gmail.com>
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
X-CRM114-CacheID: sfid-20261014_183436_899112_3E1C0C92 
X-CRM114-Status: GOOD (  11.74  )
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

sunxi_nfc_select_chip() programs chip selection, timing and the
spare-area base. The page-read callbacks and PIO page/subpage writers
call it directly, then immediately call nand_read_page_op() or
nand_prog_page_begin_op(). Those helpers dispatch through
sunxi_nfc_exec_op(), which performs the same selection before executing
the command. No controller access between the two selections needs the
first one.

Remove the duplicate calls from those callbacks. Keep selection in the
DMA writer: it accesses registers and prepares DMA before program-begin,
so it cannot rely on the later exec_op() call. This removes redundant
setup only; selection still runs for each executed operation, with no
new cached state to invalidate after resets or chip switches.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 74fdca27ba10..4e6fcf1e7aaf 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1642,8 +1642,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1669,8 +1667,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1696,8 +1692,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1726,8 +1720,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1751,8 +1743,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1796,8 +1786,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
