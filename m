Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0D3C88E7B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJF9ul8c4gzC3zHFIgXO16bDYELFtx5U4yn08aV6yqg=; b=K0WMHfgenq/ibO
	4Md6NT6XkEvV8IcOAJFcYZCn8rtTqxjLyBOm5RDsZwzpMaGdLIyEmTh1HZp+exgOEQeiD+xfWK3Py
	74ciyKqAqfKm7BBc6cT6p9HY04ErgDCg7cYOCYrRt/yf7VaJD4zkMiNUw9atRBFg+hxE3SIGRF2i7
	dltm++638LESp7oC5PGhgb37zQlwrueqdIzWWcVDYg27HIy867LdiWlbWhHXPl6IyI6IXNr8u2DkB
	Syxyd9D2gLP9lBE1FdmlqlQdoCyLHi8pKvbE+AD0HArHfjA8/4ysi0yNlBLOwqPTEt5t2WSnZV1Ez
	ermgsCrESDkt21HsqYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dwb-00000004fxo-0Dxv;
	Mon, 14 Sep 2026 21:10:29 +0000
Received: from mail-oo2-x11.google.com ([2607:f8b0:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwF-00000004fVs-0mJK
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:08 +0000
Received: by mail-oo2-x11.google.com with SMTP id 006d021491bc7-6b1ae7089c0so1335222eaf.0
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 14:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420206; x=1790025006; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=PonbDODBIZzFBqlorqomsowdVZ3gnrOthYyixAVpa9qUuzjkFyENWGIyBl5tldhfIn
         Q2ob/ICs3P1pZN7LDnRqgBYhaLRj+JDamPSzliKSTrGozYb2ZV12Z/v6DDgGgFyKRt8E
         qLQRIIwcosYeh8q5ldz84V4YIkbwYfaaf9aFYJY9Z6FN+V37U+Cb7abv0364Z8xujOgo
         9iuDWoll2/VYjC3q1MTuuSyNhX5PYDCsZB/P41mJPAIckWN999rP0oBH0nXJIrVCa/zd
         2cdtupdR0f/UnTXrvCdzUjvg7oG444m2MTAqtMX56Da6jA2Uh5No1YtcWkojepAM3HaN
         aZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420206; x=1790025006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=NRSrJELb+mpUpdsVRKlHcvQOmfwvh1C6OGETZrfh3/QjOXI76eK6S+wA1kG7q2ixZM
         5ihP/34Y2nCa/aKcEzQCp9yecQKcfJBwD4CmVyE2w7u9zvZbkKQlt2VjIXeQB2I/1zRQ
         duAXYk5Fd6Lo87TclgTGkqFSt6oITogrank1CxgFofowgtCufHsjdc966WuTCLQsu864
         9upDHOvBorsBbFP0idHB8o2s2/alopUSgnH+ifJXmPe21MlDZfTsCE6rXUZJYvAy6XZx
         n6DnKInmLetsNbC54gHTgv8qw+80b5sm6mwdRzLOEC0PgSmi1urCLODpL7FhfUV8tMSD
         KXEg==
X-Gm-Message-State: AFuF++lBdRaqWv5Pa1hVXfcObSPYZroA8DB0AMYfUbDu07LkiZ2V77SD
	HmstmQIA+jY7q1WouAcf53JfntbP93INTwIXmh7Q0yS47NwkevpYE+y+
X-Gm-Gg: AYBFou0h5i8axj3eAHC36P5L0WM9KMJXdFomAAGdvPgIcIc6a+hD41D4m19tYJsmOoY
	lH3ibE38LgLbuvYfx5Xt1BFf3JmmiY5gYwUNlsHa2HcaMhmpKnCoifLwasbzu4zzo1WNJupFhfZ
	vsgu0I7Gz6ZoJEmXCBfA0kQ78K44hioCOFwefum5uWUO1ku0buWsZkj/FoKgDRyn9QalCdbasXw
	XhrVGwPTcgVtBJtpCAEBHEnnzSpahOVTj5kjQqFdvWdodXcQtIpHHmPG5fa7gorMN9EFmHkAzzm
	cm08jjs1/4uu1aXnRnU6gibTn//n6BJ8c2EGw1MCmnORMONjRSErjJNj57P6KADmJv3dNyLiJ7W
	FP24Jty3F6ezw1XAnxJ541bv0FGBvhsL3Knf4PGVts8ielMBA35ShVGd5GC32tGIX1RmMVwOZYk
	cMG7Jh6BWxPSBERbijjnAdHV8JoXEkhnVt7ADp2qzcG5gqBT+uoH0Hz0a1Q9FDurZ2MTp3lnQxg
	tflJAKxPRHmL7oeqEjUQVcqetWvTz9MMOgms4C5rSkh//ZPNr8FPMbreDru4lqRCXMynxB/uDCW
	JmAU3Zb4dbekqCza5MYH+pBiUH2o3xQUyqRLx6YXG1uMM4TnO/MjtJ3cR6eFF7QbVpPgn2Qw4Qy
	1npDx+5CHrosrt75eSg9ftfNXWyic
X-Received: by 2002:a05:6820:c85:b0:6b7:8396:f3c4 with SMTP id 006d021491bc7-6c541457fa1mr2615579eaf.38.1789420206238;
        Mon, 14 Sep 2026 14:10:06 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:54 -0600
Subject: [PATCH v6 08/18] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
MIME-Version: 1.0
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-8-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_141007_301846_0813ACCB 
X-CRM114-Status: GOOD (  15.67  )
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

The PIO write loop tracks the absolute NAND column in cur_off, while the
extra-OOB helper computes an offset relative to the start of OOB. Comparing
these values directly always requests a column change, even when the last
ECC step has already left the cursor at the start of the extra OOB bytes.

Include the page size in the comparison, matching the extra-OOB read
helper. Keep the explicit column change when the caller does not track the
cursor, as in the DMA path, or when the current column differs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 41d6560d7df7..13dc0af56eb3 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1509,7 +1509,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
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
