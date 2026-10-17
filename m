Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FDECCF2CF
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 19:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yC3OuIVuaNDMaYA3ACfZp7GaHNml2TKp4PPXr6sTdSE=; b=h1mWQAZr0C+e94
	m752F34ZnR9kIZz2Aj75QtBeooxfvFvkVT8+VTRtArPCCt0smli4Imo8XjdObbqyW2BNiuK39jZC4
	4cs9/DgKl3FINBKA7CyXs0qjj6QAhHod6DnwEZZgF5JCsG5JiW2GxflFoc0wIlLar8pJL6e4KpDuA
	yn3BNG7RvsNdfAeI0C/Zp6aBESI335v+bxrguxprgCZanmLsuII12E7NSfl0HdxfwdYMHSnFYP2Pa
	Ir1cPKjFZaxdLubxx8qkyeIOr9NKKiyJ7E89MRXN3kNj8DibFFJulnBfWd/62WJHr/cY4M3o5KEss
	aia4LUqVwMVTj0WmDXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAT8-00000005AsZ-2jY7;
	Sat, 17 Oct 2026 19:53:26 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAT0-00000005Amj-40Zr
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 19:53:20 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6de1ca1b05aso763880eaf.0
        for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2026 12:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266798; x=1792871598; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SAeoEq6yHDKt64XU8PioOz0s2+K/90/TohU+qG8Q+p0=;
        b=cTeyuWtqbw+XSyV6/1168uuS4I5f5ohJHLHQSiUOKSAVjb+zxi4Oim4niNCYYjFWUX
         kCuz5NYnb9I0zhOQOkcDOrLcTkoMxoHy6r7Qjyd44JabARFGnskIzYqCW3X3XmXi5XMP
         MmZ8tyHzwyJwq1SO+kmyqMymLFsxQ0DG8GxyTXkHLA65cqCPUTeWvWGlkBukCnhOcH9i
         XPLsMVUxUD0hBMNI8bBB8dMfKRyM6zjKF57FQNzrAwezY2m+Pu+DmtcgwddL3fAgNeMf
         SOTSAF71lmNuB5EaCnC73oB+o9jrjBrxYLOBKedahMJGmttCiB4z3Oqj9t30cdsQDrS/
         S3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266798; x=1792871598;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAeoEq6yHDKt64XU8PioOz0s2+K/90/TohU+qG8Q+p0=;
        b=Iv67i/u/Bt0CZqXo/nSxRgC02AdVJSLa91WHefaGd70vuN9GugqyXe62QrXmvNSD6L
         Ym8kv0iF2VUyOd3JhWnxbjYwEdjfgiC4Yi8u5lL2Uuu5yqd+VBCD1AlXeCaPbxlvNZKX
         yMSy+fdO7vZemrFOZhprO9Iu3OLqFzoF+bv0AMOZ9h+Eb2FCcYrmcQs8fQzJ72RVYiJx
         /VkVICpaTDEwTx+MK+AqMXopBeAJAPH+HW8jEz/RW8YHVfExziy+NGJzYG1V/YeHwuTd
         HkCLwS/65wrYrdTb02cyuV3hz8VYTNPBPkz8RGlWDlYDmVSVLW5pZw9k3t7sNWumPrkB
         EQpw==
X-Forwarded-Encrypted: i=1; AKwUvBzewbiZcXRqhp/kyGS4KVRT2qko/DDlUVeA6LFcS655qA1HWrmJWHzm1g+XK9oEirFTWB30M/fGgg0=@lists.infradead.org
X-Gm-Message-State: AFq9FYLSDCheSRmirbQwI6eeQc7Kwb+alcoKAx8Gh/6mu9ZYORyTd3Lo
	y4etiiqKHMnnsOrxNF5xlfmIOeirMKW4I0wCHgoE040c2xgMMRK3qCRN
X-Gm-Gg: AYBFou0seEJmWkkQHpN5oLBKfaEIsAXGNfCR8nMPx9aIWxlJCHAxETtHMKlErmk78a5
	hMNYOFzWxC92iHwEuX95RryFj5fAfz/hkhuzOrgCQagxJRsteqEBCHRVEsGKKuWn7tvTiuCFHdU
	94pi++8NgFWfFW9xEko/Jq7R2VKeQ90lgi7iSWRyQN9sW8XI0WS7Ci/rbl0fxFgw2aMCc4r6ZwZ
	DkOAVHkNmErpp7vpYWvtRRd3JtsTx3Ea4lRoYnH758A7NGC1pRHldJzQrjdk5/2PocVXaLhlPvG
	daXE/ixgZW1fqayrxiT7n0dzQ/ZLeDx8WuFDj6bcWAnKUgxnjghZlnXnlejQXZP8l5KrY4557OK
	ef3Nsvk9BNz8t2JJHfqWK6LaWYHf02xFXcS9rdEODnichPrM4F8Us5bK+rUiJGfc4sJ8Ic8EBqJ
	udJw8EIh5w4rJWcfTapKAqSRpJfl7Yj9dA+7sdhl4wFQQ4M+082q3dvaRDcXb/XWxOWlpCFDqG8
	OHMcPjPs0+qKNq6zEwGgJ+KbEKiREVIV0Wg1lNRSoznuDiy2EGG9jhPLEhsgxXSJmds4JpyeC/U
	KRiigMMkGEfyFh7znGI0X6j7QZlx3Njq7USLMS90jtXTffaF1j+AcRH2LNocfyMz8NTFagbiIwS
	aQ9ke8d1LunbiJtFLKuKGooKcw7L0dmJ3EZtUMpaM61pM8qk76eq3FA==
X-Received: by 2002:a05:6820:c2c7:20b0:700:da68:7396 with SMTP id 006d021491bc7-70357791d36mr1496668eaf.67.1792266797756;
        Sat, 17 Oct 2026 12:53:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a6e12dfasm4829795a34.24.2026.10.17.12.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:53:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v9 14/18] mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
Date: Sat, 17 Oct 2026 13:53:03 -0600
Message-ID: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-14-5af9a1be16ef@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_125319_031926_9E765094 
X-CRM114-Status: GOOD (  14.70  )
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

Extra OOB is the spare-area tail after the last ECC step's protected
user data and parity. The PIO write loop tracks cur_off as an absolute
NAND column, starting at zero in the main-data area. The extra-OOB
helper instead compares it with an offset relative to the OOB start. It
therefore requests a column change even when the last step has already
reached the tail.

Add mtd->writesize to the comparison, as the read helper already does.
The comparison and the column-change command then refer to the same
byte. Keep the command when the cursor differs or is unknown, including
the DMA path, which passes no cursor. No transferred data or OOB layout
changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index a12ec60c63b4..993e2efcee04 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1655,7 +1655,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
