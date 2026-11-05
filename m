Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3843E606EEA3
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UsHg6EhL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PnNW8hsa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YGW57wk08Ba8ZJXSgFesjMa1/41zUVjOA3gmSD9XjQs=; b=UsHg6EhLSNIKWQp+HTUxRWxuat
	es7umX9A9Hixp9Rfwh6VWxRpTgyDX4SZ4Krw2oF06Z8/BEWGHPS5m3bJYs+TgI6qPOPHbzhUL5hN8
	R4eLV3lAde5cgJI2PJbGS0WBzq4RFz8/hDLpGGcLPG+SkYiJOyuPHMTEBQZZEyoj87rFhBo178VXu
	ZX3dN5Zb0Nw3hy53XhwX0B+CH/Jrrej1NHC4/+w8bTf2pADY+V9z1sutz6qbktZ/c4mp/oGDvydOo
	LyAZNT+8zUiYL+5dPnClixZRguZ430Pw9VE9wxodwDecMpassp5DOmG1PP7VAsoxuRXNwQKz88Q0w
	ZKJ/KmEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cn-0000000ADMG-3T1C;
	Thu, 05 Nov 2026 18:55:49 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cW-0000000ADDe-3gjC
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:55:38 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-704597ef1d8so982283eaf.3
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904932; x=1794509732; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ex3VtA9PGW+lx4Jwo9zXOKsJ7tUqHQi29kWPU0YYtkI=;
        b=PnNW8hsaUxJvw4r6H5Mt8aum5BtSb7xdAvgT/glBt9bG2xKgPokyYs8rFsqInOxcR5
         yTdiwW61cVFyRcWvRLcZqswgenAm6DTFo3gPJAPTochQaDWphDTUG7qoujwx+YFCRO1U
         MrmpFLt5QF/+uCz3Ia/xDNXDba3MFt+p8qjgeMVy2uATHWI96WHfC/Sg1jEn6CnqjPHB
         rmw1eYW22kQezJNzpPSHONYsaSfqey1KWaLlQwr+ogDVCJxoQ5HUv8wH6ydDXTs4fEi5
         bdPldrDTOjax9nkyrlbUUcIB9POL3D/TQBoGe5xLlLUbJxRQDc9SR+I/uvpBhxZWd+d5
         eC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904932; x=1794509732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ex3VtA9PGW+lx4Jwo9zXOKsJ7tUqHQi29kWPU0YYtkI=;
        b=gORhZWcriQWIKdkKIHfRMeTywl/MT+pTYanBxiCker/c12YEu4hXm/FRQ+wwGU6pEm
         VZK90lsVaVTocSVl21oh78A1yR4y2PpDHkLA15BeEzi372V/V5NsQrpLTu+cKyhLyAWR
         bmi4tQU2pH4j415in9VZa5f2jC3g4inDUu5sEtC9CjMw0HPzC+Qxb4dosKqwgd5fm55H
         MpmdipcYuIzCtxnwi3a/Dew9WaxAd1Gt4myRo4QUvZ+Ow4O8nwUUE1kEvKuud2zIp+aB
         1lz3QHZJP3N4IuwguFfwYW5S3PhiuPT4O7NBWWwVoOVxww+TWzQrjFI4IvuoJ0wN80EV
         1Imw==
X-Forwarded-Encrypted: i=1; AKwUvByacrzBUT4OkZKfSOr53MPHeRP9wBTh5DslV7PBtoaXRgON8DbsTyKRVZuWO7pWnKDqUkQBKEJo/cA=@lists.infradead.org
X-Gm-Message-State: APuU4Z8fu3X5sXqt2C1BJ9cqLjoS9QccFktkl5Sh3hhao4JnupGkbDm+
	7MnbZOiVXNq4npIGuvFV7bliKWbw82QYT6apo4DeJtwQLBSaP8QYXcTg
X-Gm-Gg: AYBFou0RjHsH4TlFM1DT1Kuab5jQfwQCshoY6SRP+DJfoX59GvncHhFPIVv1HcNPu5J
	4P5rGev27Z0KPSZXRyZUtXVFEefSuYxvaBBB0ZwB2vrYg09ZBsrtxdF2OWhXf+4bWdP+OIcFKuP
	5SbpZ9qQyXPGLSADpZEfstZzyC2rWJdeoqimRphHI79NATledwAqBwKVB3dNPQTrripzayQAIHZ
	X+YT/2BBo9bcbOu+oNScLaXhn08tjXFmxwrOaHFb8sk6Ms5neC2IrZrPLbYs63jqfx1oXktIs6W
	WAo5e+nWaDWIcaGhXgjr7Ro5kr8epgKFgaLAg1pbd5OLEQ+dOSdbsDBNyn7DLAC01WWS18w2QQU
	5H4djucflfe1dVf1oBx5G/fE+B1xBXfz/UVnc1W8D2KBugB9FhAKzBYdqGSaKGJovSKxKMkmxhf
	awGf0jaaXBP04iOQPIOIrtMlGvNcgs5U9tEYq4HX9FvE7ZzUQU4pqp+1Xd73eH0k+juTsTwwhOD
	4ZPuvmt2tpB5YsZ/Wi7/9qlOjzyNy6QlaFN7ltSjmqLgAtaRtAPM0WYuuT9qS4nciUWTny16G3a
	7jFeh8/dyEa3n9LvQalOFeA5U5jngPic4f8oaK/h+oyTpf2LQmWnZmP0M1TiBlznGpU9js4RYpB
	8kyaC4nUBZfCfGeVTITkqZKnr2prb29AUJv3zmUpoflHyB/JXWhqxLppavklsGNZyBkrPhIS19w
	c3+ZPdxsnniPkiNHrjEk6XVOzVzRq+qdCHHDas9vKjC8ySlCj8ywYNFL2Ezgo4oGEE46yiMqeDC
	A==
X-Received: by 2002:a05:6820:2484:b0:6dd:bc51:888d with SMTP id 006d021491bc7-716e79f15c7mr263473eaf.87.1793904931737;
        Thu, 05 Nov 2026 10:55:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:18 -0700
Subject: [PATCH v10 02/26] mtd: rawnand: sunxi: share the buffer transfer
 chunk size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-2-dca1f6ed29a8@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_105532_965350_CD3EE1D1 
X-CRM114-Status: GOOD (  11.98  )
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

Use one helper to determine how many bytes a buffer read or write can
transfer in a single normal command. Keep the existing SRAM-size limit
and command sequencing unchanged.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 80006d1a33d6..b75984961699 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -659,6 +659,11 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	writel(ctl, nfc->regs + NFC_REG_CTL);
 }
 
+static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
+{
+	return min(len, nfc->caps->sram_size);
+}
+
 static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -671,7 +676,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, nfc->caps->sram_size);
+		cnt = sunxi_nfc_buf_chunk_size(nfc, len - offs);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
@@ -709,7 +714,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, nfc->caps->sram_size);
+		cnt = sunxi_nfc_buf_chunk_size(nfc, len - offs);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
