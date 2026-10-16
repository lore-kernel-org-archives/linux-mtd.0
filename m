Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696DBCCA46C
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 03:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnC3wn13y9ngLI8wVTHCRTMUu/dmv/fVqisDVqnS4Ow=; b=QPWSIj8MXWgsdV
	kBhz0R2t0QydPJW1u09DhNpnnAPfgPgoch6GQpbX3+bPMIsAWNKONgXi//AovymtzoR64pOiHhWFX
	S3Z7VaxbtapYD0lrRaS2e2XDet1O4OlQWXv4dRuuD4/B92F/XGXCsPGjIpM51TNr4jfqXbtkc1U6W
	i0MA0wkzhuaD/Ypt0k00lBxNJfKmgE5QRZa7EP+YbHEdIU+3iJbqXK7xUacKe96ujXQMQx+rH+5M5
	c2OWBx3Tq+w/l1OYbCXUrVkpnZz+x/zU+TV2avqR2qXkxoFVNWoIpTe7hmjXggbuvHJMgrum35EAH
	xR/Fr9AdF6mKfm+iFpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYth-00000001tbV-3qsC;
	Fri, 16 Oct 2026 03:46:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtZ-00000001tIa-1FiX
	for linux-mtd@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QbSWlHvRSkwrntnAwnz2EiQPWPQUyhRA77LwoZKqBYc=; b=nEtOAE3YeXYse56kSIytnLqUAD
	u0fvzg5vDirboJtIT6SYJ04GPiMvcqPaTFSj9qIwT1vjd6ETv75FzvyiqSJitFDfhcfZrsPaxT3nW
	HFZKHUVtmQz+jyO8c6nEnvrmTlbCvUYinlfI5t5zP8nOuxP4Kk/X87QR9k/jjlpXLgwFdza3Yj/cW
	bGHrtCcRNbwkbbNnEXImntgbksNpFmy78rhiboP2XERkU4RkWs/o/JreOzwn91nJsA5gTGXOQ65Wc
	m4nEPkpGXBKbZ+oQVLlfXOOCmcWotmrhrA6UoJCJDBisM4HuYjdYSQ4E0Qmubf2/uOnIvcVG9VlpK
	uiYLYYtw==;
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYtT-000000014B8-3uRu
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 03:46:12 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-823545ce223so2086541a34.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 20:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122358; x=1792727158; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbSWlHvRSkwrntnAwnz2EiQPWPQUyhRA77LwoZKqBYc=;
        b=X4r1vj2uzopwRqryLT+InFTxInByrz+ZJVRhjSRwOwWngjuVoN9Sjz49DJnoP0WrH/
         YavPoN7KgHAa+LbU860mZkmj/h5Ph7nM93XXsjAyK/r+B+32DloQ6ZCmFuBTwH+3XQLN
         ZEhlGhLNPqHYKT4QdUHJZSV6Mht+HT/T/lGbZuJUUk8wtHhYvqrTVN0w03Kse05Oida/
         z7VoVV6UkXYgIoIksoxWG1eKlsJSZS9nEHSeZvJgAt0KDe25aHrowlSFxa76xkXDf+Kq
         ymjfLby2Ai4l3o4hjhw0lXrmiQlLT7p6dP6v7rvoUJAQHDmqtuwpfoma0wApLvt7utMi
         g/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122358; x=1792727158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbSWlHvRSkwrntnAwnz2EiQPWPQUyhRA77LwoZKqBYc=;
        b=sEnQ2QvLNY28tgQk9+W2jjTfj4JQjntWh37sIpl9dsaIumtFLvNeFD3gcV7F6Ct7rg
         tdzQHPW/DD+puxvwW7dqSREZHcM2n0Nw/9+P9YY2pU6Bc372ezifsUCvh2ET7PXwvYyt
         PkXDHypOfjeSPSFbvY/Cqtkon3IAts0Lhm70X5VCfvM8fZvEb6GfiVu5BHFXynM6iLJw
         FWTWrK+M5DQBNuSpeykN8dZMroClwqhyztWIENWeqmuier59CyWGA5iaUwapRXXCJTa7
         I9bE+VdJmbecEaeliWZUUwzJ5/P9W3AKPlkN+TN/3hGWWflvex76ERclo1vnDVVT3apt
         vCyA==
X-Forwarded-Encrypted: i=1; AKwUvBw6aDuum/RiLIWI03Uf2h7F+Gw10FIxcLKpkFqrN31ZqPHiETSL7MQh3UcKPfw7AsY52wGpVyR69+4=@lists.infradead.org
X-Gm-Message-State: AFq9FYLj774IBbuPO3XWTgjw/KPA3XgMxd0sU7tJKdj1LoQPntm8WWiU
	eXIUqji44cRODEzYTThtop/BSiGqHBoWUBVpTq/7JwVqc/YabA6g8d9U
X-Gm-Gg: AYBFou3TNgGD9X2cfb6LKK+dK2ExTelKaWV6gvDFjfcVpTdjqtn5eq66wbD5BJtZhMq
	G/lYZsNrI4RX67J6ZTJUxVvhr6ETHyV9Vin/Mgp+Y8kvs3xFx/ohUzDl5r9j30vRIA8ppb8mHai
	dJJkiv5awznFznljH43ua6YNSk8o0W5Hx1tYJ9gozh7O5n8gWTjiZsH8oDo/BY9hXfGKoQ/v7gz
	m1LwJEvVgrqmv4t+jDiPZUxhr+0AdUoQ0nRLwYMt2TFSML8j9TcbarJD/sJCnhLh5YofiuDc0Mb
	SrBLIjh+7VOh29kGR7XgpNiLCZAdBf1hH/cOGtkF0jVOedcP27au4MjB+zr3Zlmal5rF/pnu6de
	iRRzlNbmF7VwGxBs2jdO+oi0cUP0y9lPSWqybn+QZGPjEUIjTft1EIFxFFarz+5ogo3/3+E1CGr
	/lA4jq1zH6AueMzH/tATA/l902tzx9qseKTFlGpBitIMFjx1Q0nxkxY4fmkdhI503YUdtzJsktK
	Zsq9dAybq6M1FXxCKyuXSC871+chKyLnsZ+UOD0L/j7Eaoh9P8pot6vL7QaeLCuT8o32nP4XNZz
	yYleBr1zGPZ4Sr5KVtC9840KLx2l9eQr5UDFDx6+BUJZGZaWvBUHXofgqgwKOkRWIZFtwaGUMYD
	ct7BI82qaapRxZRIFyYktYQ==
X-Received: by 2002:a05:6830:6d45:b0:806:3072:240c with SMTP id 46e09a7af769-8309815e745mr20040213a34.29.1792122357925;
        Thu, 15 Oct 2026 20:45:57 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:32 -0600
Subject: [PATCH v8 17/17] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
MIME-Version: 1.0
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-17-8ba4881fbee8@gmail.com>
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
X-CRM114-CacheID: sfid-20261016_044608_625045_0FB97DDF 
X-CRM114-Status: GOOD (  24.70  )
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

Normal hardware-ECC reads also decode protected OOB, including the
bad-block marker and metadata used in bad-block-table scans. Allwinner
firmware leaves the marker in the randomizer stream, but the existing
driver compensates it to keep a plain physical marker. On H6/H616,
firmware also packs protected user data before the first parity region
rather than maximizing its allocation across the page. Those mismatches
prevent normal ECC reads from interpreting firmware-formatted pages and
their markers.

Honor allwinner,randomized-oob through a separate operations table
selected by an opt-in attach helper. Enable scrambling for normal
controller-ECC transfers and omit marker compensation. Reject software
or disabled ECC, and reject a step larger than the page before the core
can fall back to software ECC. Without the property, keep the existing
operations and geometry, including the plain marker on otherwise
scrambled NAND.

For H6/H616, reserve four user-data bytes per ECC step, capped at 16
bytes per page, and put the entire reservation in step zero. Later steps
have only parity. Apply the same reservation when maximizing ECC
strength so strength selection and actual layout agree. Older
controllers retain their fixed four-byte user-data field per step.

An erased page physically contains 0xff, which the randomizer turns into
non-0xff decoded bytes. Select the Allwinner firmware's
controller-specific erased-page predicate instead of the generic
bit-count check. Apply it to ECC-decoded protected bytes re-encoded with
the OOB randomizer stream. This is not a raw reread: bytes corrected by
ECC retain their corrected values. Older controllers require eight exact
0xff bytes, with a four-byte shortcut at block page zero and pages 127
modulo 128 for 1 KiB steps. The H6-generation predicate requires byte zero
and at least nine of ten bytes to be 0xff.

ECC exception mode can suppress errors for uniform physical data.
Include pattern-found steps in classification even without an ECC-error
bit, and ignore their correction counters. Keep decoded bytes until the
page-wide decision: an all-zero physical page takes precedence over the
spare check and returns zeroed data/OOB with ECC failures; an accepted
erased page returns all 0xff. Other failures retain decoded main and
protected OOB so bad-block and table scans can still inspect the marker
or signature.

Read complete pages for subpage requests because these checks classify a
whole page. Collect status during each PIO step or DMA batch, and defer
statistics until requested OOB reads succeed. Read unprotected OOB only
when requested, combining adjacent parity/tail ranges without crossing
protected user data. Preserve each step's randomizer phase and the
existing PIO/DMA representation of parity. Raw callbacks remain
unchanged.

All format policy is in the new callbacks and attach helper. Apart from
the opt-in dispatch, existing functions are unchanged: geometry
allocation, marker compensation, status collection and PIO/DMA transfer
sequencing continue to serve the existing operations tables as before.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 332 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 332 insertions(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 56594bb41193..0e2ff1c59120 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -349,6 +349,8 @@ struct sunxi_nfc_mdma_desc {
  * @nuser_data_tab:	Size of @user_data_len_tab
  * @sram_size:		Size of the NAND controller SRAM
  * @timings:		Controller timing characteristics
+ * @spare_is_erased:	Allwinner randomized-OOB erased-page check on
+ *			re-encoded protected OOB bytes
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
@@ -377,6 +379,7 @@ struct sunxi_nfc_caps {
 	unsigned int max_ecc_steps;
 	int sram_size;
 	const struct sunxi_nfc_timings *timings;
+	bool (*spare_is_erased)(struct nand_chip *nand, const u8 *spare, int page);
 };
 
 /**
@@ -1160,7 +1163,15 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	return ret >= 0;
 }
 
+struct sunxi_nfc_allwinner_oob_status {
+	u32 error_steps;
+	u32 zero_steps;
+	unsigned int corrected;
+	unsigned int max_bitflips;
+};
+
 struct sunxi_nfc_ecc_read {
+	struct sunxi_nfc_allwinner_oob_status allwinner_oob;
 	u8 *buf;
 	int page;
 	unsigned int max_bitflips;
@@ -2342,6 +2353,299 @@ static const struct sunxi_nfc_oob_ops sunxi_nfc_scrambled_plain_bbm_oob_ops = {
 	.finish_read = sunxi_nfc_oob_finish_read,
 };
 
+/* Allwinner randomized-OOB format, selected only by allwinner,randomized-oob. */
+#define SUNXI_NFC_H6_ALLWINNER_OOB_MAX_USER_DATA_SZ 16
+
+static void sunxi_nfc_randomize_buf(u16 state, u8 *buf, unsigned int len)
+{
+	while (len--) {
+		*buf++ ^= state;
+		state = sunxi_nfc_randomizer_step(state, 8);
+	}
+}
+
+static void
+sunxi_nfc_allwinner_oob_record_status(struct nand_chip *nand,
+				      struct sunxi_nfc_allwinner_oob_status *result,
+				      int logical_step, int hw_step,
+				      struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	u32 count;
+
+	if ((snapshot->pattern_found & BIT(hw_step)) &&
+	    !(snapshot->pattern_id & BIT(hw_step)))
+		result->zero_steps |= BIT(logical_step);
+
+	/*
+	 * Exception mode can suppress the ECC error for a physical pattern.
+	 * Classify these steps with the Allwinner randomized-OOB page check too,
+	 * and do not use their correction counters. Keep their decoded data until
+	 * then.
+	 */
+	if ((snapshot->status & NFC_ECC_ERR(hw_step)) ||
+	    (snapshot->pattern_found & BIT(hw_step))) {
+		result->error_steps |= BIT(logical_step);
+		return;
+	}
+
+	count = sunxi_nfc_hw_ecc_read_count(nand, snapshot, hw_step);
+	result->corrected += count;
+	result->max_bitflips = max(result->max_bitflips, count);
+}
+
+static bool sun4i_a10_nfc_spare_is_erased(struct nand_chip *nand,
+					  const u8 *spare, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	unsigned int block_page = page % mtd_div_by_ws(mtd->erasesize, mtd);
+
+	/*
+	 * Older Allwinner firmware recognizes exact four-byte erased
+	 * signatures on page zero and pages 127 modulo 128. With their
+	 * 1 KiB ECC steps these correspond to four physical 0xff bytes.
+	 * Other pages require all eight spare bytes to be 0xff.
+	 */
+	if (nand->ecc.size == 1024 &&
+	    (!block_page || block_page % 128 == 127) &&
+	    !memchr_inv(spare, 0xff, USER_DATA_SZ))
+		return true;
+
+	return !memchr_inv(spare, 0xff, 8);
+}
+
+static bool sun50i_h6_nfc_spare_is_erased(struct nand_chip *nand,
+					  const u8 *spare, int page)
+{
+	unsigned int erased = 0;
+	int i;
+
+	/* Byte zero and at least nine of ten bytes must be 0xff. */
+	for (i = 0; i < 10; i++)
+		erased += spare[i] == 0xff;
+
+	return spare[0] == 0xff && erased >= 9;
+}
+
+static bool sunxi_nfc_allwinner_oob_spare_is_erased(struct nand_chip *nand,
+						    int page)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	u16 state = sunxi_nfc_randomizer_state(nand, page, true);
+	u8 spare[10];
+	unsigned int len, pos = 0;
+	int i, off;
+
+	/*
+	 * Re-encode ECC-decoded protected OOB for the firmware's spare check.
+	 * This is not a raw reread: ECC-corrected bytes stay corrected. Each
+	 * step restarts the OOB randomizer; H6/H616 pack the entire prefix in
+	 * step zero. Pad unavailable bytes with 0xff.
+	 */
+	memset(spare, 0xff, sizeof(spare));
+	for (i = 0; i < ecc->steps && pos < sizeof(spare); i++) {
+		len = min_t(unsigned int, sunxi_nfc_user_data_sz(sunxi_nand, i),
+			    sizeof(spare) - pos);
+		off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
+		memcpy(spare + pos, nand->oob_poi + off, len);
+		sunxi_nfc_randomize_buf(state, spare + pos, len);
+		pos += len;
+	}
+
+	return nfc->caps->spare_is_erased(nand, spare, page);
+}
+
+static int sunxi_nfc_allwinner_oob_read_unprotected(struct nand_chip *nand,
+						    bool dma, int page)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	unsigned int len, off;
+	u16 state;
+	int ret, i;
+
+	for (i = 0; i < ecc->steps; i++) {
+		off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
+		len = ecc->bytes;
+		/* Keep decoded user data, but combine adjacent parity regions. */
+		while (i + 1 < ecc->steps &&
+		       !sunxi_nfc_user_data_sz(sunxi_nand, i + 1)) {
+			len += ecc->bytes;
+			i++;
+		}
+		if (i + 1 == ecc->steps)
+			len = mtd->oobsize - off;
+
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
+					    nand->oob_poi + off, len);
+		if (ret)
+			return ret;
+	}
+
+	/* Preserve each path's normal representation of ECC bytes. */
+	if (!dma) {
+		for (i = 0; i < ecc->steps; i++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
+			state = sunxi_nfc_randomizer_state(nand, page, true);
+			state = sunxi_nfc_randomizer_step(state, len * 8 + 15);
+			sunxi_nfc_randomize_buf(state, nand->oob_poi + off,
+						ecc->bytes);
+		}
+	}
+
+	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
+	len = mtd->oobsize - off;
+	if (len) {
+		/* The unprotected tail uses the page seed and its 15-bit advance. */
+		state = sunxi_nfc_randomizer_state(nand, page, false);
+		state = sunxi_nfc_randomizer_step(state, 15);
+		sunxi_nfc_randomize_buf(state, nand->oob_poi + off, len);
+	}
+
+	return 0;
+}
+
+static int sunxi_nfc_allwinner_oob_read_batch(struct nand_chip *nand,
+					      struct sunxi_nfc_ecc_read *read,
+					      struct sunxi_nfc_ecc_snapshot *snapshot,
+					      int first_step, int nsteps)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	unsigned int reg_index = 0, user_data_sz;
+	int i;
+
+	/*
+	 * The normal snapshot skips pattern IDs when every pattern has an
+	 * ECC error. Allwinner randomized-OOB page classification needs those IDs
+	 * as well.
+	 */
+	if (snapshot->pattern_found &&
+	    !(snapshot->pattern_found & ~snapshot->status))
+		snapshot->pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
+
+	for (i = 0; i < nsteps; i++, reg_index += user_data_sz / 4) {
+		int step = first_step + i;
+		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
+		u8 *oob = nand->oob_poi + oob_off;
+
+		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+		sunxi_nfc_allwinner_oob_record_status(nand, &read->allwinner_oob,
+						      step, i, snapshot);
+		if (!read->dma)
+			memcpy_fromio(read->buf + step * ecc->size,
+				      nfc->regs + NFC_RAM0_BASE, ecc->size);
+		/* Page classification needs protected OOB even for data-only reads. */
+		sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !step,
+						    read->page, user_data_sz);
+	}
+
+	return 0;
+}
+
+static int sunxi_nfc_allwinner_oob_finish_read(struct nand_chip *nand,
+					       struct sunxi_nfc_ecc_read *read,
+					       int *cur_off)
+{
+	struct sunxi_nfc_allwinner_oob_status *result = &read->allwinner_oob;
+	u8 *buf = read->buf;
+	bool oob_required = read->oob_required;
+	bool dma = read->dma;
+	int page = read->page;
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	int ret;
+
+	/*
+	 * Allwinner firmware treats an all-zero physical page as bad, even without
+	 * ECC errors. This takes precedence over the spare-byte heuristic.
+	 */
+	if (result->zero_steps == GENMASK(ecc->steps - 1, 0)) {
+		memset(buf, 0, mtd->writesize);
+		memset(nand->oob_poi, 0, mtd->oobsize);
+		mtd->ecc_stats.failed += ecc->steps;
+		return 0;
+	}
+
+	if (result->error_steps && sunxi_nfc_allwinner_oob_spare_is_erased(nand, page)) {
+		memset(buf, 0xff, mtd->writesize);
+		memset(nand->oob_poi, 0xff, mtd->oobsize);
+		return 0;
+	}
+
+	/*
+	 * Keep the original decoded main and protected OOB bytes on ECC failure.
+	 * BBT pattern scans inspect them even when an ECC error is reported.
+	 * Read the remaining OOB only when requested, not to classify the page.
+	 */
+	if (oob_required) {
+		ret = sunxi_nfc_allwinner_oob_read_unprotected(nand, dma, page);
+		if (ret)
+			return ret;
+	}
+
+	mtd->ecc_stats.corrected += result->corrected;
+	mtd->ecc_stats.failed += hweight32(result->error_steps);
+
+	return result->max_bitflips;
+}
+
+static int sunxi_nfc_allwinner_oob_read_subpage(struct nand_chip *nand,
+						u32 data_offs, u32 readlen,
+						u8 *buf, int page)
+{
+	return nand->ecc.read_page(nand, buf, false, page);
+}
+
+static unsigned int sunxi_nfc_h6_allwinner_oob_user_data_sz(int nsectors)
+{
+	return min(nsectors * USER_DATA_SZ,
+		   SUNXI_NFC_H6_ALLWINNER_OOB_MAX_USER_DATA_SZ);
+}
+
+static unsigned int sunxi_nfc_allwinner_oob_min_user_data(struct nand_chip *nand,
+							  int nsteps)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+
+	if (!nfc->caps->reg_user_data_len)
+		return sunxi_nfc_oob_min_user_data(nand, nsteps);
+
+	return sunxi_nfc_h6_allwinner_oob_user_data_sz(nsteps);
+}
+
+static int sunxi_nfc_allwinner_oob_init_user_data(struct nand_chip *nand, int nsteps)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+
+	/* Do not let the core fall back to software ECC for this format. */
+	if (nsteps <= 0)
+		return -EINVAL;
+
+	if (!nfc->caps->reg_user_data_len)
+		return 0;
+
+	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsteps, GFP_KERNEL);
+	if (!sunxi_nand->user_data_bytes)
+		return -ENOMEM;
+
+	/* H6/H616 pack all protected user data before step-zero parity. */
+	sunxi_nand->user_data_bytes[0] = sunxi_nfc_h6_allwinner_oob_user_data_sz(nsteps);
+	return 0;
+}
+
+static const struct sunxi_nfc_oob_ops sunxi_nfc_allwinner_oob_ops = {
+	.min_user_data = sunxi_nfc_allwinner_oob_min_user_data,
+	.init_user_data = sunxi_nfc_allwinner_oob_init_user_data,
+	.read_batch = sunxi_nfc_allwinner_oob_read_batch,
+	.finish_read = sunxi_nfc_allwinner_oob_finish_read,
+};
+
 static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				       struct nand_ecc_ctrl *ecc,
 				       struct device_node *np)
@@ -2473,6 +2777,28 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	return 0;
 }
 
+static int sunxi_nfc_allwinner_oob_attach_chip(struct nand_chip *nand,
+					       struct device_node *np)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int ret;
+
+	if (nand->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
+		return dev_err_probe(nfc->dev, -EINVAL,
+				     "Allwinner OOB format requires controller ECC\n");
+
+	sunxi_nand->oob_ops = &sunxi_nfc_allwinner_oob_ops;
+	nand->options |= NAND_NEED_SCRAMBLING | NAND_NO_SUBPAGE_WRITE;
+	ret = sunxi_nand_hw_ecc_ctrl_init(nand, &nand->ecc, np);
+	if (ret)
+		return ret;
+
+	/* This format's spare and all-zero checks classify the whole page. */
+	nand->ecc.read_subpage = sunxi_nfc_allwinner_oob_read_subpage;
+	return 0;
+}
+
 static int sunxi_nand_attach_chip(struct nand_chip *nand)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -2498,6 +2824,9 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 	if (!ecc->size || !ecc->strength)
 		return -EINVAL;
 
+	if (of_property_read_bool(np, "allwinner,randomized-oob"))
+		return sunxi_nfc_allwinner_oob_attach_chip(nand, np);
+
 	sunxi_nand->oob_ops = nand->options & NAND_NEED_SCRAMBLING ?
 		&sunxi_nfc_scrambled_plain_bbm_oob_ops : &sunxi_nfc_plain_oob_ops;
 
@@ -2995,6 +3324,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
 	.timings = &sun4i_a10_nfc_timings,
+	.spare_is_erased = sun4i_a10_nfc_spare_is_erased,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
@@ -3018,6 +3348,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
 	.timings = &sun4i_a10_nfc_timings,
+	.spare_is_erased = sun4i_a10_nfc_spare_is_erased,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
@@ -3044,6 +3375,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.max_ecc_steps = 32,
 	.sram_size = 8192,
 	.timings = &sun50i_h616_nfc_timings,
+	.spare_is_erased = sun50i_h6_nfc_spare_is_erased,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
