Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A8AC79F87
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 21:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsOa+cqO+YLwuIdvlhlYxttoasPfpqwMr8Wx5yWGPEU=; b=GeafCb31efz2L4
	K7D4IYh9BgGzu2lxLT1a4six8omnrXfDo8ZAKZO5m+u9Und9pl/4FBKFRqNEtUneM9CU+vMlqtp3u
	ZRt+xcG6YghgGOIoU/TEV7RhF0QmEL4c6URRKvPrntsJXBusMmsQv8W39murhjuKKbfSDJdh4YOyG
	FpUteN+YJxLbBCWblDpE62IdNDeg6PtZT+gzkIiC3V1yk6XAcVTbr+Nq4f+w78Gxvc9UvuiXnkAUo
	453z9l6/kKDhhHYoZMcFroK3K3U5PG/P6KjXRSNs6737m5ckAYLIM6UKOGD2V1UL/nXPKxWB5wYq4
	9UZiLLZ+Cv1tWD+Hn4bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bNy-00000003JhL-3q7F;
	Fri, 04 Sep 2026 21:23:46 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bNr-00000003JcL-10UW
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 21:23:40 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6b127c88220so1026292eaf.1
        for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2026 14:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557018; x=1789161818; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BgbJZzXDYwsOLv3h9k0AMpcw0EOYW2MSapQnfQyB+Y=;
        b=UgiplSdaYGsgBDa6c8StG+K2wxGmGfsHX7OdalYNSOpRVoq5nzJNhQlRB2y6kyMTAt
         7lKZEoHfpj0vk9RtIDFDn/qASNFe2QPtBnZahpUmmOr4/rSsp0HsQ73Xtys9lVOQO96G
         THg9ybA67nkLhNxjAgufKDiwkj6LNf+ULNXK9MK1An1pKbixPefQuna6YjeexVqLjCrP
         u5jjrIR5tj3srmctHupibZnZ6jNBThEFC6DfDMN/8Gmv68OBQdGdG8tncoyC14xGYWys
         32sxEISa8vmjn7em/V4Tqs1QFuXxFyr1an6tbMxnv70YMIPMgRuyxM3UrqtRIJWMDMZX
         bmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557018; x=1789161818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BgbJZzXDYwsOLv3h9k0AMpcw0EOYW2MSapQnfQyB+Y=;
        b=SJWGPuJBYIHiW6HfZ8bjo6IKbJIbVhIsG6RwdHqhfCKHHb7nAsXcNwFjFbkWil+c96
         O1s8K5M5qnOXrnJlpjYW8DIfNjWS/J2ONrPm+wJXQ+A7uw7WB26qDOVJCAnITMnCIdiD
         MLGA1Dv9feyWQspAj7tWP+wWW6U00P5vQ987Lll6p8QXXHjRGnVTYG7VU5kXjKNPxVSq
         LpLrg7PTPEVmP/zd7seKEkMGhAG1BsXNhc3yHX5wYdGS1Jf6kCsrPtKhC4jjcmeutNZH
         I2ggV7FLfAXXsrvzWGpPsxxfp5J3avibywFuvIWOLxn4o42ph7+Fe5vNSfpKQqERjsfE
         A/rg==
X-Gm-Message-State: AFuF++lbbgJFdqyYG7SQ8Mk5SDtcmMCwkI5/iV78WDl5/uBGTGCnmrPM
	ncIsniNXsA9GukgUWahjXhY9wYMgE4JBvtzAN83PiJWJF/Mszi3+dm8t
X-Gm-Gg: AYBFou29RrIbXS796HfIuT08sgwgHA6xdyHmEyEV0w9uDNsqllY9AOezi6DSHUp8t4g
	au/V6VE1RYFtMQWb61wf9jTdSM8gbRW7TVv8kCQkFznUWkvCzo39HATCJLMT2/mktTmT2sSk9QU
	oBMi6jnTkm8wYe2+TCyA3dj8Ir01DxkWM5cpzJ7WMN1d+mqSZHqXd7NAEpKZqDaUPEtw6wIHWWX
	0dFVI45sXS2LIliBZFwxLY9M1RVI1n+MtN5xFaTlJd/pUtjl5J0cPR2HSo5ODuvlLGvP1MDd2DU
	nOvdhfyI1JJoYt44660C9bBVhExF4Dlqdk5h4VBzbZzXYVc1UMUsVCDEsjhRWd4CPRamDcL3CJ2
	6L1OwoLnh8RfYUD4kO5UwbuGmAC+72OQtR9XcWhlCVVqVx84srm6kF2/litHjnh5yT8ceuhtUFA
	DUhoiV3MmShGxrsotYeRGGtq7AB2pu18mB81cc30l8f9BYqx2FJlDS/Ccee9FchQSK7b0vkxdJ3
	zeOCJJ8QKznsnfOBwiU/IHme/iA1pls0O0o4MFjhkaLgtA8ergbOLqWQ1en9jdwdla/ccC7cpnz
	PzhZgdiTLjokK6aX8zn0x+CN2benpWnLl16jXxl8LZb3zEJuRBbhHPPIxdVrQl88rEcYkgBRFkN
	WWiTOZDDwllwKGQzc38s=
X-Received: by 2002:a05:6820:180e:b0:6b1:65ad:3181 with SMTP id 006d021491bc7-6b6fcfd957cmr8410089eaf.16.1788557018080;
        Fri, 04 Sep 2026 14:23:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 15:22:13 -0600
Subject: [PATCH v2 3/3] mtd: rawnand: sunxi: select the packed H6/H616 OOB
 layout
MIME-Version: 1.0
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-3-b12074f4aca7@gmail.com>
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_142339_302864_FF2F94B7 
X-CRM114-Status: GOOD (  19.87  )
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

The H6/H616 controller can configure a separate protected user-data
length for every ECC step. Mainline fills all space left after ECC with
user data. This changes the physical ECC offsets from those used by
Allwinner NAND firmware, so pages written by one layout cannot be
decoded with the other.

The allwinner,randomized-oob property selects the firmware's normal-page
format for the configured controller hardware-ECC geometry. Use four
protected user-data bytes per 1 KiB ECC step, cap the total at 16 bytes,
and assign the entire total to ECC step zero. Reserve the same total before
maximizing ECC strength so the selected strength leaves enough room.

Keep the existing maximized mainline user-data layout when the property
is absent. Older controllers have fixed four-byte user-data registers
whose placement already matches the firmware and need no additional
change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c1246a9268ca..1265d900fc27 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -224,6 +224,9 @@
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2037,8 +2040,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
 	sunxi_nand->user_data_bytes = NULL;
 }
 
-static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize,
-					int ecc_bytes, int nsectors)
+static unsigned int sunxi_nfc_h6_user_data_sz(int nsectors)
+{
+	return min(nsectors * USER_DATA_SZ,
+		   SUNXI_NFC_H6_MAX_USER_DATA_SZ);
+}
+
+static int sunxi_nfc_init_user_data(struct nand_chip *nand, uint32_t oobsize,
+				    int ecc_bytes, int nsectors)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -2054,6 +2063,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
+	if (sunxi_nand->randomized_oob) {
+		sunxi_nand->user_data_bytes[0] =
+			sunxi_nfc_h6_user_data_sz(nsectors);
+		return 0;
+	}
+
 	for (step = 0; (step < nsectors) && (remaining_bytes > 0); step++) {
 		for (i = 0; i < c->nuser_data_tab; i++) {
 			if (c->user_data_len_tab[i] > remaining_bytes)
@@ -2111,6 +2126,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2177,12 +2196,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	nsectors = mtd->writesize / ecc->size;
 
 	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
+	 * The default variable-length layout prioritizes maximum ECC strength,
+	 * then uses the remaining space for user data.
 	 */
 	if (nfc->caps->reg_user_data_len) {
-		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
-						   ecc->bytes, nsectors);
+		ret = sunxi_nfc_init_user_data(nand, mtd->oobsize,
+					       ecc->bytes, nsectors);
 		if (ret)
 			return ret;
 	}

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
