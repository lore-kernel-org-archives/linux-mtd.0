Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AEEC88E7F
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 21:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4oEfRtT73GLwphQvkfwiQ+q1vRbLqskhm2HxCjZlrA=; b=QxWQlZ3tfGZDhW
	MJG11MaTJTpToFhiOgc+cKsdG/BkrtnZx3aa7FbssJUWLjWrd5GNuN+hFjr7QUPUVaVCmoGrr+NYS
	k3Js7WEc1eLTElR1/baDWPrs323QWqdWY/hAqJSonMbrcgjrDBFERV9HDQEo21KR7ei0uL7fmM0el
	axW1jag0TwjqCtKYBi6Edi37Mw/thQJRGkkOUFDLO77yCKVlEBHydoj7l5FKjQUSOmKaT0kraw24e
	COGYqnr4PvcjyoXISM9ryFzszKLT2KKhUFCpamyB0oq0MT6XwzTM45lL1y1QLoMSWxAu1t0Hx/Mg1
	C3wqpQPA/hBIGKACk+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dy1-00000004hK6-2IGg;
	Mon, 14 Sep 2026 21:11:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dxa-00000004hAc-1XnE
	for linux-mtd@bombadil.infradead.org;
	Mon, 14 Sep 2026 21:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FDb8CvIky7fTL8ZHKUM7VSBHzZxqYVS0jxwrplOkME4=; b=lcKzo45or7ihK5KTzJsUy6QDPd
	Ht1rJaCr6XKY79mOFvoYLQRlMi2Tuwb2WMXag0dQtriZZWW89tHTtiXoNjmQgsp4LEa0C/4pp3vMG
	aK0dq62r4ldvCG0J4bPZiJvhVfrHxBXmLS/OM1kI1Gu3+1D0C+lm9nA/c2sViZREkMVSNYlSEPxAQ
	DwYxDMK9OWbTkmP6RjgQQz5gT99IRNRlzcsLAdodSYfN/TqajzVijYeR+LgRMfHe/QrrwOG9Y8RpC
	uVvnhRcE36O79X6OWa5XGvFlwOqd2SBFfhXwxNUlGotv9FwGiovDPvhYiBchRqh4be9XBJ7iyYQ7/
	G8b/bSmQ==;
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6DwR-000000061hS-0DQK
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 21:11:22 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6b12942ed04so3521607eaf.1
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 14:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420214; x=1790025014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDb8CvIky7fTL8ZHKUM7VSBHzZxqYVS0jxwrplOkME4=;
        b=fm/uJ5MlNZXHPBNgZwckyoKfYnSPAHfw74zfvELNvQpoMgL+obFghspS2ol2WXzoNj
         OEWaGOTEeJ+a+m+2htFXMMeUX1MLH8HQ5+7HzMWCkalPg/DaJZgibctYBDqeOAx6AlTH
         Dq9DYJYxGrE1C6DD7cqkkcN98Bb+lzm/iOpbUwORSUrcr5Rj7yyIoVxC26bwqmz3/Mpe
         QXbPRD6jB2R7F3AR6bHRpeeZvLdL6Vz1L+JloRBoj4gxCSBLwZu77E2kfLK14E4zyb2r
         OFxPgs1aMzHS/ZaUKTo6Xh8iO0eriFoDl/dIPgkUe3RGl7RA+No0nv9op1vqav9fm5rR
         WoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420214; x=1790025014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDb8CvIky7fTL8ZHKUM7VSBHzZxqYVS0jxwrplOkME4=;
        b=H7ulK2LddzkHvKR6xEDp7yRdoOcOwEsi6jYoUyQgp0IRwJKICk8IfdnqlxLlNXdXuM
         a8ALyCm0RyDIYuCVr1/LYgvUTpbxa84VIMmhU9WiQp3kObwCoZW9KHHS0Kj6cSxU8jO5
         vXoZIbGxgYXatfwOXvbEsg9dX1xJh9E1fETRNo5xvMG7xrx7pz0s2DaVEWkTOTYT4lgE
         9hGa+DwXcHjZNki6iVMrppBhVof/GoI/yoGpMy59xekFFBDgx0XFBw87wZrjMTUxdLCD
         yIU2gUavMpFhY55ajwOKDt9wSRWskYGmk8GTOTXztFkQtLc9bVF6IJIEVu8HXsBPrUUm
         PIIw==
X-Gm-Message-State: AFuF++nCY9PAKD8FXOeZCZkQfNkNs2hl58TR0vbekQ869euavhG7cRUq
	QpteO34QH8foIwW8eEGPGWQQBWFxnr4jAR1IMVjhsoWdq3fMmMuUf6DWI+KeRQ==
X-Gm-Gg: AYBFou1oGctdIYdwAHuD30cH1cGvYAsH55CU72kIm2Lfqt1QdKU21HOskbDmN2HnIHc
	ojtjnrNdUYE56Byv2fUf7jZvscYnL4p8ehEqIRJgxtFzrHCUUzDOBc3rb0JJiYVI9yq80HXEb8F
	nyLDl7lvlIsrOsXTyBh7COoF1g+Ry9gxxg3oadukfctDKtjuM66otQ6n1VD1qkARcJnYg+To2Di
	tyMTFusfWpM63Wfw0adlr+JM/Bf16gsiSe6iGDJpRytvhnQuxlV30DcxtJSCtmOo3AbTF+dNZqI
	4rAsRg/zqTh2sBvdeanlflp+/a3l+D1a99cFIUYH5DTGaymwLED0yc5eEsp+5hG7IgxHswoSlHE
	bccIp3N9Mn+Q8Myf4L6uyOwpIEOon0q8JDdEdrmyyP3PuAOpiyqLlY3ZnPCwdgnTYvlYYA2hp6h
	4y86ieQEAUbycUuPKJ6adZ3pKEKqUOMu7ST7/Z9KYyQlHHaTGuM9hM6Q5KWdAqqoOEGb5D/zmWl
	UgAELufe/EtlA5b+9BuXhYQqzJPosSJwiz+1FxrpHulEBeZFc7tVheaSLwXKZrjS5V00+0R/eW0
	mjaTDkcdFi01uNQWFOaOdKfjGX55FKqTNX3lKy0kUjSU3ysUaTdMIErE3GOvDp4rtoT+lHit6Rg
	ncYqerqxPts0OwE0HdlEOZ1/6biEHODROu+f350U=
X-Received: by 2002:a05:6820:200c:b0:6b7:83c5:fdf7 with SMTP id 006d021491bc7-6c5451a9095mr2847169eaf.56.1789420214324;
        Mon, 14 Sep 2026 14:10:14 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:00 -0600
Subject: [PATCH v6 14/18] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
MIME-Version: 1.0
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-14-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_221034_885645_C3832230 
X-CRM114-Status: GOOD (  19.64  )
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
index 42c5f782db40..8b0d0620e1d9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -225,6 +225,9 @@
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2431,8 +2434,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
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
@@ -2448,6 +2457,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
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
@@ -2508,6 +2523,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2578,12 +2597,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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
