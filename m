Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84258606ACE2
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P4ZZEep1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jGpclJSC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L3/TgcU0X08UecIhgjo0l8aL0KhoPpnhdkMc8aPcwmo=; b=P4ZZEep1DWT5JLrvmv6HEMKf1z
	XUTGNMwaHUWW8MUZd032G0HmXH1jwQGXrQL8LVsOEVqaM/wnlcSNj6AEzco+6DTX1Ze9Qe8JoYdV3
	KfJe+IVkeLlkaPiJixsiOAgMt5LDDPKhN0Hij8dwTWZ6s+bXjd7BFk+OPbrb5STc8XGE30dG5F9Lc
	lbm1DXoviyJQyJ1LcJYgIedkmCd3+8lwYw3Uuktk58+pD2H+0svY+uf6Qq70V90tYu8dJ/4hZ7sLy
	9OtdJ5zBj1KOwDgkAdScOgIELEVRwW7nyjVnUWPBZ2R7OgKKNY04MlnolgZvOhWUckOJe+MohtIC0
	fRTvffgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZda-0000000GZfs-0ajU;
	Sat, 21 Nov 2026 01:11:30 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdB-0000000GZGx-22yr
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:07 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-71b45386310so496958eaf.3
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223464; x=1795828264; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0IrAGyQNQ+9vmexJ3HX+RGvKm7PP0ZR37lEcYjBayK8=;
        b=jGpclJSCw7n2u2ycc2eOafiLnqdQSDSnxV/vgBngtW3hY0xLOSrn/bqOPpZiebiuWz
         uIkqOzxIJanz8l/Uq0RSI/fQmsKZugA7kP2+It1yCbVT5trX82nPEiBRfcQcrMBcQuQl
         G6VF8ldH1I7A25JOKrXQQRkeqi9pFNTh7DDrOJzV//RmOu3rtRGjLyX21aIZMuszI/TS
         xo+YmhEvpFwWczVH+xIrHJwNUDIteDyQfU3cD9NCvyDdxdJORm09IOcsx2uCspvvDHw7
         TIf1/XkdI9vKf0B7O0qb1freq+5f4a+WCyrKPk3hD0rb0AC47ujg6RyQ8JewXLNNUBzt
         R4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223464; x=1795828264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IrAGyQNQ+9vmexJ3HX+RGvKm7PP0ZR37lEcYjBayK8=;
        b=e3Gvadlt7U1Zdcq+jh9ynNGa1pr5+PCBaUC4uJ3AxL5TT5stTU5tH2c+qVYBysg/B3
         hf23xlSgG7OlO7JGD3SkogXYnwp9d1f8sgC3SkHXTehaU2dRCzrTmzbc4zSVQzQ+bLWJ
         CTXtiIkYtuhLq9X2sbcTdDIoxExDfw9/NlIHMSSp13/YnQwIUESTfPLoCPYHn08XEMtv
         oq2N5TaSTb3FlTwzwFdh70q3ojuEcyaBQnfqSHJlH3dFn/IFPMVFJMn9EYFbPiQsRPNg
         naY5pQDFQSNEuvm+UAGEcC8nuAWHYYWnbGi3UEEUmaFiuzuHQxUcFPlSuc/EkMS5aH5b
         AQBw==
X-Forwarded-Encrypted: i=1; AL+hErH83y1UH8woncRbn+HbzlMlFH5mjOxrUtIFe8EGWVXOtn53R//0caWs4di5drJxQGW394WFw+L2l/4=@lists.infradead.org
X-Gm-Message-State: APuU4Z8kiOlbvJ50Otdu19B2fcnX8imjqQh03wKTgFi0Hk25gOby1Q3X
	H+/H2sf56823lyPBPtWbyh6hMLTg7jcfVnypmOX0ffbCgqOAw/+JTitT
X-Gm-Gg: AYBFou0fMX7A+cEpFm+Tix32F/W7i5nmQcNWOvZAkbzUi1666X9CNUkM1OAm7RQI1QO
	6hIJSUL0Ob4QCtJYYvfBfyGd5XUGqRQUqhOf0+ijIziZY34g6m4t1kwZ168cqxUIHgjlOgQql9N
	ocSBbu+PW//SjBKN4RkM4p8IL6mGI8dqlupXaxQtmzuuPkdGsAu4ExbcKKdtSQBKijgtCV0deCF
	2v8fYsweUickzh2unG8sK5kzzbLZ1lqPlo3Z94ahcqz39tlddcYlaU8xhVr5zNT0MoNQLEqjS9M
	77oQjCKL1zVW2Iu+sPwDEu0xYFWdO0z7isz/dTuwhUYKH5Vfk5FPKr/UNdEgDW/3ueURkjzupRw
	KBJpb1V3Z+5a+aUy/iLcju8ISDLmf9E9LBo72UECK82wsJxl2yT62r8uHJAsFB71D9OFG2eoFaS
	pKISPWLWzs9vdo8wfhXKi3vTEMcqhXy89rtKF6IZ5VCfYFyUXZAOo/cxmLG/NUQtWGKbbxUrzvV
	ZUmyiBtR7wKrAqUHihBw45KIALkz5+HORpqz0bcmWdHGqRapco0/WfKYP4UangMiliVDE2J1H4b
	5+V8tjmlIw0oyys7O7/Cf9q7Ouk1tiUGBgOk7Qv4qAFHYbfcHBl18knv7/OHpPEV6iiGOhhyVA+
	0c0sWN9RY3QAH+N18/LId+IkNvZS3niaWMFwoFTEDxO0MhrpEP9gpCvDzHeX9oIcH4H+Yo3Ps3k
	lf7yuWmwZBcIJMlQD58ugbODDhOzyQ7AYyu9VXy1bpqNidQlcFHqq6
X-Received: by 2002:a05:6808:6d93:b0:571:4e99:7942 with SMTP id 5614622812f47-57a0b65aeb8mr5797462b6e.48.1795223464361;
        Fri, 20 Nov 2026 17:11:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:29 -0700
Subject: [PATCH v11 06/26] mtd: rawnand: sunxi: use page reads to
 reposition small-page NAND
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-6-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
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
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171105_713794_C72050D5 
X-CRM114-Status: GOOD (  18.72  )
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

On a chip with 512-byte pages, an ECC read can fetch bytes from the
wrong column. The driver uses nand_change_read_column_op() to move
between main data and OOB and to reread a possibly erased chunk. That
helper rejects small pages because it uses large-page random-output
commands. Some callers then continue without repositioning the chip.

Use nand_read_page_op() to select the requested small-page column.
The NAND core chooses READ0, READ1 or READOOB and sends the page
address again. Keep the random-column command on larger pages.

Use PIO for full-page ECC reads and writes on small pages: the DMA
sequencer uses large-page random-column commands. Sequential small-page
writes need no change-column command.

This fixes the command sequence for an otherwise supported layout. On
8-bit small-page NAND the factory marker at byte 5 still lies outside
the reserved marker bytes. On 16-bit NAND the core uses byte 0, but
the driver does not program the controller for a 16-bit bus.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260913041642.E28F81F000FF@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 086618dee999..9d7e3e6f22b2 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1028,6 +1028,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
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
 /* Shared across a read's transfers; buf remains the full-page buffer base. */
 struct sunxi_nfc_ecc_read {
 	u8 *buf;
@@ -1111,10 +1121,10 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
 	/* Check the physical representation for bitflips in erased pages. */
 	if (nand->options & NAND_NEED_SCRAMBLING)
-		nand_change_read_column_op(nand, data_off, data, ecc->size, false);
+		sunxi_nfc_read_column(nand, read->page, data_off, data, ecc->size);
 
-	nand_change_read_column_op(nand, nand_to_mtd(nand)->writesize + oob_off,
-				   oob, oob_len, false);
+	sunxi_nfc_read_column(nand, read->page, nand_to_mtd(nand)->writesize + oob_off,
+			      oob, oob_len);
 
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
@@ -1141,8 +1151,8 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize))
-		nand_change_read_column_op(nand, mtd->writesize + offset,
-					   NULL, 0, false);
+		sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+				      NULL, 0);
 
 	if (!randomize)
 		sunxi_nfc_read_buf(nand, oob + offset, len);
@@ -1200,11 +1210,12 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
 			if (read->dma) {
-				nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							   oob, ecc->bytes + user_data_sz, false);
+				sunxi_nfc_read_column(nand, read->page,
+						      mtd->writesize + oob_off,
+						      oob, ecc->bytes + user_data_sz);
 			} else {
-				nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							   NULL, 0, false);
+				sunxi_nfc_read_column(nand, read->page,
+						      mtd->writesize + oob_off, NULL, 0);
 				sunxi_nfc_randomizer_read_buf(nand, oob,
 							      ecc->bytes + user_data_sz,
 							      true, read->page);
@@ -1260,12 +1271,12 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off)
-		nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 
 	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
 
 	if (data_off + ecc->size != oob_off)
-		nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -2105,7 +2116,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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
