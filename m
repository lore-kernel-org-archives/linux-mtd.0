Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C184360A3814
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UmuGDsCQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGykRTsI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NgHeOw8NeE8j9kr9UIt0zU5fPPdEffvHAhGzEccuHkU=; b=UmuGDsCQaBw9ogjCo3JxMqpk0w
	yqmTmjlCwShFY0Pdt/a0w43QHGWq9VPJVLt0JpZDOap7Lt6ItPcid2H54A+kwI71MNCJr/0wqwIG4
	61m4ouhvoBAauJ+LPlFpA6+zTds9mb+9n7UZIn/jQhgvCHE4QEKTml98Wi2MKWKaAa4WuiiLzkdEa
	UFj90PYjJZh3n8Q3QEj5gQD/9FR212PoZpHmJbp9SmC4TPnQ1X99/ZRLmXFc8H9CqGYVPpU+Kivku
	fLRBw0jsktaF76ijeP6pf3+ivS4Qj3nSToAmMyuICkXFiyXbdTgCnS+FCRLEFo2Q8DUzGfWS+MvUn
	pwgLejqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2dC-0000000ADgZ-0cLE;
	Thu, 05 Nov 2026 18:56:14 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cY-0000000ADEM-2BgT
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:55:44 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-7143451981fso1504248eaf.3
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904933; x=1794509733; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPvgTlYh271ksxX8dw0Tb6RYwBWSB/xct0guWKo1nsA=;
        b=XGykRTsI4Fh/CrxamSWQzqbcERCFwgHBjT7k02+3V0KOmIMjI9kJ5Im700frgE9DN8
         M0mCQsIqruCFvh7+N1i4IkfQRUFSabQCjkTmCrV8t/0D3xzB6hhQ/KCybzgCmYcAlN29
         MlmgXZzzaccy3e/acETA24qzCuoYJdkMszd+RJ31r9HFe8p0/CTEpNKZ8kzeZ4AR9vc3
         BYCQPrRpDAxWtzDgxKXiRzN67I7lYwlCmLBwrXpwcf+6PXBiYxC3QcaDjj2jvH3yZ2+d
         bLsKPyRUagCjWIZ+5J8NU0CmfAWKyLd6A2GLHcys55WgZSEfv54KXG9fDL9Xka+IZCk6
         K8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904933; x=1794509733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPvgTlYh271ksxX8dw0Tb6RYwBWSB/xct0guWKo1nsA=;
        b=i/eHBV+I/gIvlK0lC7whv2+Eh0xclPdvdVFFXw9/4jEefUq0CrEI3sW49y3Ij6F5EP
         U5tIljG3jSgSNUAQcTMb6Vr7FAfQOi3ZjXl9NL5LXiiuyhAXjHJ5QABJbxu1ugkgsern
         evC9+OSz5F28qLwoCjD5+V8RwpeI9mj1EWtiEyLBcmhMwpgh6neCqHRTYhUKnkOd+xX8
         /3YdwN1gmHUAizK7EQQE8s0jugPGT8JqD5Nz2Lek80kAXHAfGP8YZS9WTTk02i2c56hU
         XP7IKNDvsDuCbALU2UOBW8vn1Bsc1vVtl/P8/IFOohAQHCk5CKN3xRFQxzDTp6If2HzJ
         iOnw==
X-Forwarded-Encrypted: i=1; AKwUvBz1JRTkgwM8M/NduIscxfwkZaxr7S59UTRLC+Q0tS4ovgJPefm97vo+cbu97O6tsM7FtToMN8E5HHg=@lists.infradead.org
X-Gm-Message-State: APuU4Z9x8NJmPCziMl95saSwbXE6DAU5IkQFn9XXS/vSYEjRcieHMIzx
	GddtDc0F1LwFulWzIgT34N1Yjm1mKkaihu7ONLS5k/eJoEHv3UrilfyW
X-Gm-Gg: AYBFou06KLmGhUr8pNoXYWAUJQC62lAACY16B8E5S5vVrGiE6ltlpjdzS+8e0SmEtgh
	XN9KXrRlBIVvq/M53rq/NejOdcU/r/EpDAmBPRG5uPlvy+Y+uzAWXRmCJMkJQlyEQZ9r1yzsp+D
	GMwALq/Xb9+SmmgxqgIC77r+c/tU7m126A0PjgTeTz8/VQA+/AWMkm8J3BAs1Rmrh04MwsE1qcj
	BuD8HV1AU7cHDNnd48kxmroo6LFcM7ZhVFUgVBWkGA8p+c98D8N4fW54HJDBG+eo5niUNqzlu+/
	B4sv7I3++BH5r3SEdZWXM4qQ8XsbV9FQ2kb+ryDQWgV+HtLQuWJljlAlGwlqDnV7euIXP+zfgsr
	RmzwaXumeIXXaSpt6Pq0SaWhRDR6c+mD02sMv8WvWe3NowBGIdCLc3ZVzvlt+IJ1C5XIrIgBaQy
	Ow7TDOGsYeGZmjltx2wEcbg1a9AJRv9WrWiYPIFVWVTJD4iPx2saSEst+5zCJYUE/XAab/DVn82
	+GIsyqOgc4uhj4vmIBnDS+9jNy5Idk552Tr3TlXrHFAIM+Wt3FiEu07/UqP8B8EDVsUCBR/AaZx
	C7LTphpyGNk3+pt8NPS0kV1U7mH4lsDaXeUPRFqy0bQI1AcTJSuI9aQ/0uK/MmSYmzuFQHOM1z/
	s0BgCwnDxh1YTXZfAugrgGnPa4ofJr/sNrpJ7hmM59Ho+GV5Qdx0I0eWeIz6LMDVgT49FTv+OOz
	L/ZnNbdDZSOXAxKYG2HxpdH6YxuiURQCOpqJ7KOhquYf3oO/HokHCRQgAiUsOVRPk/Se67F1oG/
	g==
X-Received: by 2002:a05:6820:7048:b0:6f8:2346:cd89 with SMTP id 006d021491bc7-716e73a98famr324182eaf.13.1793904933325;
        Thu, 05 Nov 2026 10:55:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:19 -0700
Subject: [PATCH v10 03/26] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-3-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_105535_345382_E62F6C43 
X-CRM114-Status: GOOD (  11.67  )
X-Spam-Score: -1.9 (-)
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
index b75984961699..662d96fc2535 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1513,8 +1513,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1537,8 +1535,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
@@ -1562,8 +1558,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1589,8 +1583,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
@@ -1612,8 +1604,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1652,8 +1642,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
