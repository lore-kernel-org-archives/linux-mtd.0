Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7519C79FBF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QsvxE9but41H4+nr2egojpA/204AOOB5xkrmG6iUTO8=; b=F5dIvU/uKmkB2F
	m8SNpMWQWx+o0gYPynFGQ521jiC8JnAf8Q0v2VqcDOJz/1ksSn8M2Vuw3hvzZnkUdY8ZO7bDi7+Zu
	DBkBweWWU615nxTWcLLgzYdJneIGu4APVWm5bbBZPyp7Qh0hbl9rIvMe+Bw7f1+KwuEzBOoxtlz+K
	nt+31+XneXG8OVIxQOeXdYOrlZWjBukK3f9cRffEoh01qfT2MHghCYNcovtulFBoh3RFkcw6qIQFB
	rLiDXYweHrZ/ZFxRZwQ0r/DnMY9JPRkp+gRZH9D1gAFrJkcKGIAUknJ3YOVxGJG+gukFFfixVmIhC
	pY56xQjmuPX908ZOZSWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dj4-0000000B7XQ-2dQO;
	Wed, 09 Sep 2026 08:32:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DiD-0000000B6cX-3elY
	for linux-mtd@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TWYxqME/J0ZGh+4rhdO4kodCM+OpkopMyyvvaFCYW7w=; b=pe3MyGez0Cn2afCiwM4g3efYNp
	+Hucw8Yc4To4rCN4cLz4T39jBYa16AT6meGCk8KOKXRom0BwKEkKGQ9cGAeFpimcJHSLKL/h6AVZL
	F9qIurV7nyVGzS6numWB6vLS8oRSGDR08e4Zu4QfOQKyIPOYHWxZ6pNmbkt+rimvj8hTunwsbpD0/
	kh/0KT9V6dLg6FK4kOLB0Fw2K4NLnPjphibtD2J2nIMdq8LdZZx5LWJLKwZAqwqZiGhV3JQNr89NI
	o1pIWVvx049DaoQudEaMj0sASD068ity41q4x61NVplKDy2Sfm7SwMRsQsMMsN2mIXcf6nCjBMVB0
	9Sia/qBw==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Di7-00000000unq-2k57
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:20 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7eb6573bd52so5327910a34.3
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942673; x=1789547473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWYxqME/J0ZGh+4rhdO4kodCM+OpkopMyyvvaFCYW7w=;
        b=KbKPj98dJDf3ub2vxUObdquNEU0zodyNHu1bT0/1Gdis4bWrXU7XpolX8IZkrJ9l7b
         61HDO5/gniN3LuFyhkFyWdEVp/R4PmkSaZfEmPHJ8YcIqdj4008/ztubbtFTN5EOxRFw
         c2fA9lQ60i6aiyZmYvbokZr3sSFlw22Gib0jcFzTl5jsMScY4o/KFRuFOhLz/wh2jQ7I
         tXFtNb3mXDfgX1/gL7WjuwdRuy3nhJLjKCawjr3pBEA5SmkjGfEFhTprPXaAH6L5QE1a
         +Q3QlK4L8H+zyHgVg8081pe9C0uSAFXcSdUeTbc2RDr9v8wfwgMJTE5rIp28Co343EvY
         5rDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942673; x=1789547473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWYxqME/J0ZGh+4rhdO4kodCM+OpkopMyyvvaFCYW7w=;
        b=kX5rWAZ5yNV+p+1FboplMMH/Q6aynL3nJHpoKB3YNShjHgGv/TUUa1B7s472Ff+2qU
         x+hBXhYXkeHc9pZgOSUPkPqJDq0cySpeCdK96xX+v81HLxQE/BbFBYXIDHpMh5gepiN6
         SiVR7BNS2G3QCTVust+otbWksn2OWGsY3MQufbIkYj+ie+K6FxdDpjxjQCACVrGVRnq+
         0XLgBStE1aZps/pEIHmanRS/LN5j//chECb+YVQspWw0FU056m5WxVn6bHxRTO3eh3sv
         f0PnGtyA4UKE1+pRFkgWhnAU+7fVpTW7QX0LWSj71/B2/xjLAwcud8VFMgHyBjKmkTBQ
         FQwA==
X-Gm-Message-State: AFuF++mHTPRRc7CeeKpqhmOEvBZ6vGVg+C+/h6gM1+Z1Lok2sH/sAyFG
	5ykcyCBTyA27kuEK5yTmq+MOjnHFPYION7F9iuCUcTMQghbjH0wSgzTY
X-Gm-Gg: AYBFou2KsYo3Qh3RsjobFOBsjama4qBwICduieouljEhFUzlZrY3geDt+Pi+LrgwZt9
	EzwdGG4/moMoo+ol/whgXghI1OsA/8zBI9beubBT9DOmkEw1zyy/+2huc3d9KO32+fg8I4cQXrn
	BM9YcxnlYYEQRknT5b+6A6vMIr0D6Hfk3exor4QDm/CXRTKJ7K+XWOd1L2wfj/E+1lHOo1YGYjq
	sY6Q5gGZHQ5C+UtZz+KBe5Y4eTNqyt9/o3MnmEI761frES9GbiB/reCYgi0EZ5L0+JMOG8rxI1x
	DkAl/71g1nJQxOFXbfHTdwp6SDIMQBdgvH8v+BoRKO4qgTCXerME46xofq42oIoswMqNKONOeZ7
	UbPQPZqTXO/myneRgrN4M7YNai35w4MEBiSjFewG1JUVFZ3jPvxASqPgB4u+I4INnhKA2n/XAWa
	TJ5BF/r+MNFj6SNw5AycLHI26cl3E+ZL6b9Czo1JmZEIlDlnfzRpyQwgQ9054LS4oGRNkrFoXhb
	UiX/3KmsIK7Lp4VRr/DBAajilQJzy4/jDdTlrFWxCj+ZgIMTcGsKGjIhtULtEC9qnEKrZd9sXPS
	grUTYcfgFZ7EnI315SgANWJyRmtF/8+p5grFexx0+jzcSEeE0dZ0oikk1H+k4JAtDJWyrYPCa7h
	TGFp3JHDGnQpTV5O/iHD/8QqC1ejs3S26SKl/VUI=
X-Received: by 2002:a05:6820:1987:b0:6b7:46fa:16a2 with SMTP id 006d021491bc7-6b746fa1a6bmr17306489eaf.55.1788942673434;
        Wed, 09 Sep 2026 01:31:13 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:47 -0600
Subject: [PATCH v3 14/15] mtd: rawnand: sunxi: reduce user-data length
 register accesses
MIME-Version: 1.0
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-14-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_093116_241676_B3C93B55 
X-CRM114-Status: GOOD (  18.68  )
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

DMA reads and writes clear every user-data length register and then
read-modify-write one field at a time. Multiple ECC steps share each
register, so this repeats MMIO accesses to the same words.

Build each register value in memory and write it once, including zero
lengths for unused slots. Reprogram every word for every DMA operation
instead of caching hardware state, so controller resets and switches
between chips need no special cache invalidation.

Share the length encoding with a PIO-specific setter. PIO always uses
hardware slot zero, and its page callbacks clear all length registers
before the chunk loop. Write the slot-zero value directly instead of
reading and modifying the same register for every chunk. Keep the
per-operation clearing so other slots remain zero after DMA fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 73 +++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9dc742ee4344..1c1fcea69108 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -996,35 +996,59 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int hw_step)
+static int sunxi_nfc_user_data_len_code(struct sunxi_nfc *nfc, int len)
 {
-	bool found = false;
-	u32 val;
 	int i;
 
+	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
+		if (len == nfc->caps->user_data_len_tab[i])
+			return i;
+	}
+
+	dev_warn(nfc->dev, "Unsupported length for user data reg: %d\n", len);
+	return -EINVAL;
+}
+
+static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
+{
+	int code;
+
 	/* not all SoCs have this register */
 	if (!nfc->caps->reg_user_data_len)
 		return;
 
-	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
-		if (len == nfc->caps->user_data_len_tab[i]) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
-		dev_warn(nfc->dev,
-			 "Unsupported length for user data reg: %d\n", len);
+	code = sunxi_nfc_user_data_len_code(nfc, len);
+	if (code < 0)
 		return;
-	}
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
+	/* PIO uses slot zero; the page callback clears all other slots. */
+	writel(FIELD_PREP(NFC_USER_DATA_LEN_MSK(0), code),
+	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
+}
+
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int first, step, len, code;
+	u32 val;
+
+	if (!nfc->caps->reg_user_data_len)
+		return;
 
-	val &= ~NFC_USER_DATA_LEN_MSK(hw_step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(hw_step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
+	/* Write each packed register once, including zeroes for unused slots. */
+	for (first = 0; first < nfc->caps->max_ecc_steps;
+	     first += NFC_REG_USER_DATA_LEN_CAPACITY) {
+		val = 0;
+		for (step = first; step < nchunks &&
+		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1213,7 +1237,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1524,9 +1548,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc, sunxi_nfc_user_data_sz(sunxi_nand, i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, nchunks);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 
@@ -1682,7 +1704,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -1977,7 +1999,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	if (ret)
 		goto pio_fallback;
 
-	sunxi_nfc_reset_user_data_len(nfc);
+	sunxi_nfc_set_user_data_len_dma(nand, ecc->steps);
 	for (i = 0; i < ecc->steps; i++) {
 		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1985,7 +2007,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
 						    user_data_sz);
-		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
