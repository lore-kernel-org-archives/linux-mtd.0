Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D9A606A33E
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eJ93Q15T;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cn3WgqVZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kj2JMfAv2DTvIFxPYpkzQVIqQXtAgV00RZ0GLxMxgek=; b=eJ93Q15TrB30P83MOAReCUdZEZ
	+neDDxNyX89B9HMSx4GRDItKjdfXHRT8/+gavLAU+19y9IlOsN0XVjpzw0+6P7jqoDphvNd7VTFdu
	7rQzFEa2z5ChX460tZCRhPKd6zKJMqkNrScjeIRBilL0CJuBcbDBQXtazR682NZG+vf4g7uoIBx7k
	pZ9Whcp4QUuYOslMojY4N5zAnpM1Q8ScM3rrTxeT4lg1pHKYaqUqCF7aRUrNzo1jeotE1z6F2shWI
	p5tif7Hsfl7SP/PJ2B6Wr0pkqzPxbBuFOaCXkFkh9MP6qCA3GMEXzyjQKJdPna2hGlIEU+q7QdFQ3
	c05k3Yww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZeQ-0000000GaKb-2scm;
	Sat, 21 Nov 2026 01:12:22 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdJ-0000000GZLk-2FM1
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:18 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-49429181ce9so962367fac.0
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223473; x=1795828273; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25Y0T/EWWqPPUndC1dVyA3/WPrprnkSUm6qbYkkV3TY=;
        b=Cn3WgqVZB5vdWSP2QKZVWvuT0IboOr7K5x1TzslGITxNtSxx4LWDDjHcsoJS66jLkq
         rEYaXox9sXYrXJYzbfDVUIzHNS5wXA88TN11iosFu4apsauA3DQO6Z2BMfYKAh/To+Wo
         uOCVqHU/bWsk9tnnZJd7djZq4RXBToO+nI3okbtPz4Za3Corel/a9ZGwoy4D5nSJ+PQM
         Une4VCjyjCGMo7Xe6IJzcV8tHDtXIsT9u6WrGB8NFlGBPgH9KGuQsrbKW5KfDxz340hc
         XqroZRHxAFOQckUwn28qrjoEq6CgbSqjrylrgo/IBZSTqzP5MZxOoIxyMWdNIdvZQZvZ
         fhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223473; x=1795828273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25Y0T/EWWqPPUndC1dVyA3/WPrprnkSUm6qbYkkV3TY=;
        b=mtqomsnM2+xIEh4IXO4xgXCRJs+U0+ZmRQNJKno36ZYEZN4LnSdbsIGkz7stn3YJLH
         zod2S+lAH7Pg+uallSwpR4FeuwVDzcmVtliL7kp8Ml21j4Qgb8xRaW5rOFxCRk9tf56f
         9Ek7u2FOtm665E/xmzeScmg+hqFY+fQoQ3sNgceLRvSHgoJy2Spg0QLVbpnsYzjvhOKv
         CkvMDjA0xv12djPIpwtc/bDWachO6T7GoZDNOIfRDPqpdqmPQegfH3lK1DWKTMmqkAG7
         Nc96wCmMh1h624mYuLxNc8utQroPDycUsXHQlvteTInDwjgynR3/tk/jAWNPhNC4PXfR
         uAyA==
X-Forwarded-Encrypted: i=1; AL+hErGkDN2S3JvjgN/kk6dE9BEIwJu5iSJfZyJEpZrTKCRPozMuIf/owlSgH+8WBY7hxfmbEOjKI5MMRV4=@lists.infradead.org
X-Gm-Message-State: APuU4Z/KJu1BU+3ACWu1X27X390drxCPFoBuKkWWxkYAHZwq3/XXsJIo
	UxobnORaKEtR2lth8o+/dF6bJP3DpWORRoPWbX3Ezr8a51NyVD8gImbW
X-Gm-Gg: AZFdTZftOjOGbEyfDFpwUrCDQncnJIRM+JUgFATXrKPjjHKappLyR0AlhNc/c7kFyFE
	phzju7aoXswtx/Xtvd+LZpFMQugbuHJYwj5uuGSltgKI3of90nxKQScchlkr9M+5FLvFQ3n06vt
	wWzWEMWDn0dw2SIVlnQRcFhJy0/dGy99IaJ/nCZDgYLFcMEmOB2IzRgy+OQNeWvGeRVOKryw7lB
	+LG4TBqIDWvvFz8w9N9RppARc3x/PYI+fnkq5lGEuFirbGp+h4As4tUneU/d84JG5YbyZb0nxBK
	lapRaDnjhwOOYOb78wApA66hAMqUU7zD46b4bN2+DaPPmGMxBmcbdMbaFPvOrd2JbUv/6kxAw1X
	vxgzE2IEWcV5ldQMdNUaaq3iaUjO+fmjWq5ybGR6KYKXaXkJw8lKGfeiPMyuXU2qmRJbhhJexTy
	EPbo2d6+XMiLGfV8+S4ITd9dk6TcFnbbn/jAnI4kn8itYgQASiDP4cLJt3ppaSz7CpR/yav1RhY
	VIaFOPpouX69aoZCmzYCvSB80sOh2zY3WtlHekDFkhLPD6jrcms+7Sble5Xg1vcU9DofoksUxP6
	qUqVurUnBB10/e1qViXFANS/JaPgtx4hjm7QLG/XqYk1Xdl99DtekZAiGuJh+aQsXDyAkyogvvE
	VA2+NYGarHnlgItumfoRmZVGAQOQI7I5jaBXbQYyayL6xc1HmiTmfUwNKHaqMrGQy/d7/YgQyX2
	VK8H3YDq5CNoOYgZzlQoDKgJlrjtlv5x/l9V/8nKRm7IUiX/9Iy/iS
X-Received: by 2002:a05:6808:1986:b0:572:72d4:9ac9 with SMTP id 5614622812f47-57a09e0d7c4mr6351251b6e.27.1795223472625;
        Fri, 20 Nov 2026 17:11:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:35 -0700
Subject: [PATCH v11 12/26] mtd: rawnand: sunxi: handle ECC results in the
 batch reader
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-12-9721b1905ef4@gmail.com>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171114_218799_3A5013D8 
X-CRM114-Status: GOOD (  18.55  )
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

The batch reader must know whether the corrected bytes are ready to
use, need to be filled with a hardware-detected pattern, or need a raw
reread to distinguish an erased chunk from an uncorrectable one. The
correction helper returns zero both for a pattern and for data with no
bitflips, so its caller tests the pattern bit a second time to avoid
overwriting synthesized bytes.

Handle the three outcomes in the batch reader. When a slot reports both
an ECC error and a pattern, keep the existing error-first ordering.
Preserve the data for the raw erased-chunk check and run that check
after collecting corrected OOB for the batch. For a pattern without
an error, fill the applicable buffers once; only an all-ones pattern
marks the chunk erased. Read the correction count only for an ordinary
step.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 70 ++++++++++++---------------------------
 1 file changed, 22 insertions(+), 48 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 538ffcc79108..e76f7cc67081 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1070,41 +1070,12 @@ struct sunxi_nfc_ecc_read {
 	bool has_erased_chunk;
 };
 
-static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
-				    int step, u32 status, u32 pattern_found,
-				    unsigned int user_data_sz, bool *erased)
+static unsigned int sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand, int slot)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	u32 tmp;
-
-	*erased = false;
-
-	if (status & NFC_ECC_ERR(step))
-		return -EBADMSG;
-
-	if (pattern_found & BIT(step)) {
-		u8 pattern;
-
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
-			pattern = 0x0;
-		} else {
-			pattern = 0xff;
-			*erased = true;
-		}
+	u32 count = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, slot));
 
-		if (data)
-			memset(data, pattern, ecc->size);
-
-		if (oob)
-			memset(oob, pattern, ecc->bytes + user_data_sz);
-
-		return 0;
-	}
-
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, step));
-
-	return NFC_ECC_ERR_CNT(step, tmp);
+	return NFC_ECC_ERR_CNT(slot, count);
 }
 
 /*
@@ -1203,35 +1174,38 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
 	unsigned int reg_index = 0, user_data_sz;
-	int i, ret;
+	int slot, ret;
 
-	for (i = 0; i < nsteps; i++, reg_index += user_data_sz / 4) {
-		int step = first_step + i;
+	for (slot = 0; slot < nsteps; slot++, reg_index += user_data_sz / 4) {
+		int step = first_step + slot;
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
 		u8 *data = read->buf + step * ecc->size;
 		u8 *oob = nand->oob_poi + oob_off;
-		bool erased;
 		int bitflips;
 
 		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
-		bitflips = sunxi_nfc_hw_ecc_correct(nand,
-						    !read->dma || randomized ? data : NULL,
-						    read->oob_required ? oob : NULL,
-						    i, status, pattern_found,
-						    user_data_sz, &erased);
-		if (bitflips < 0) {
+		if (status & NFC_ECC_ERR(slot)) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
 				memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 			continue;
 		}
 
-		/* Both patterns are already filled; only all-ones is erased. */
-		if (pattern_found & BIT(i)) {
-			read->has_erased_chunk |= erased;
+		if (pattern_found & BIT(slot)) {
+			u32 pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
+			u8 pattern = pattern_id & BIT(slot) ? 0xff : 0;
+
+			if (!read->dma || randomized)
+				memset(data, pattern, ecc->size);
+			if (read->oob_required)
+				memset(oob, pattern, ecc->bytes + user_data_sz);
+			if (pattern == 0xff)
+				read->has_erased_chunk = true;
 			continue;
 		}
 
+		bitflips = sunxi_nfc_hw_ecc_read_count(nand, slot);
+
 		if (!read->dma)
 			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 
@@ -1260,10 +1234,10 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		return 0;
 
 	/* Finish consuming the batch's corrected OOB before raw error rereads. */
-	for (i = 0; i < nsteps; i++) {
-		int step = first_step + i;
+	for (slot = 0; slot < nsteps; slot++) {
+		int step = first_step + slot;
 
-		if (!(status & NFC_ECC_ERR(i)))
+		if (!(status & NFC_ECC_ERR(slot)))
 			continue;
 
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read, step);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
