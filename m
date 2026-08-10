Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D620C5B569
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 23:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MbW4UXJo7WqvmQNL5w902eOAByv7pEOYMwoDQVVaWec=; b=gwkOpmCDuZDzrd
	P9La9hKx0nHtPD5i2IfEXRqqGC0/RcDGozUHbUJ1VB64QJY950MBUNZxmmXOrJdiwYy5xw0rFCYNM
	KpvO5ZGIYB6f42EtTJaaksevYNMm8JNKIMKghIBHP4pNmaZrUwrVebdd27CX3bsHYHqJP0aVgZyxn
	BbGltMDQsJ06a0+LmXTft2d7RsVnbvvNn9PLzoKF0mJqwYCo87UeCbEh55LBerVfHqBxQ++XIcNe6
	bTpUWuR+yJoi6hI/2f45qT3fvPvdWqBlX9MeTJlxqe1l/Py3aTe+waWVYO65E9xQIYisZeFrQ9igC
	yZRq4fFu3SY72wLnT6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZ3N-0000000D0Ko-1zU7;
	Mon, 10 Aug 2026 23:05:09 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZ3J-0000000D0Hr-2Tvd
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 23:05:08 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso2526305a34.3
        for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 16:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403105; x=1787007905; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTW3rnTf6gNY3ga4NJ5kmbTdCiFHL1I5Sk6ssF2oGp8=;
        b=QPUhqq1NRM9lg2Su7ep1LBckh5HyQZ6OXfo/PpxIY/evxnYiN3MVl44oeD+WZlt0HL
         YCwyODkXNno06z6YtF4pDDR26wIwTrrfHfq96YCrAKgqSGZIX9xrp1SDj8ZWnvm5okPy
         97Z6z2IHZnGJN5QT5Fv82WNjHB6wsCTuR9428OxMvSjjG2zHCVjr4MQKRQJe2QQ2ExsH
         kcOJ+mmXJUJGbvoghsB8RD15k41GNiOu1C1rYnre0ItU/SvcWd24xdNAhh+P9fApGmXq
         s5uVSobjJIae4oMqxfd89tcjPXmXcU1UZocBFiYdONUbBG81H6+K1BqoeCT6a64Ms6+B
         9Beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403105; x=1787007905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WTW3rnTf6gNY3ga4NJ5kmbTdCiFHL1I5Sk6ssF2oGp8=;
        b=mdPh7FF1i4AXIDksyY8C9dIMyiO/0Co4hDFyEOB8T37MwalRFaFYj3BuQmuOvL4VmW
         MDFn+47bphGhGeo/ID5zm3bAMjDKfSeOzbiU+lRQHiKPbIIrcYBnelDTR6zs1ntvl3GE
         eSSPk8b6OB1Hg/t9UtJ9Zyi0TqVbo9EjJJovkHlIfETZfzSRD2ercMGVbmp8G18tJfoe
         QWFhTSAZkswTKmQ4Xyl8MbLRBWmhg1HSV9S/JG3JymDEDGy+J3bXRhmHPYVWI+N9whrn
         wRKQwFfS1rhw9AlE71BvTlXe68DxTQ5GcRM5s824MZpP2fSAk/OLShmUiKNp8xfipvqs
         axhQ==
X-Gm-Message-State: AOJu0YwuKlrts2HZo25zzoRcnH/Fp4my4nLfQOV2JrddcvkVKM1uAPaH
	5ZCKUD2Y0zM8yAtRsEOVxJ1cKhFOr4s3F6BIAh+ItBNzxJcHg7lhPAp6
X-Gm-Gg: AR+sD11pUG+e4IWWK/DdBEHEjDVrhwWKyP02VDoIvWl9J7rgnXnNq0DpQqYNFlfCb+T
	19P1QGVY/rFYyK6teKrIZN0RWQ8ooJvDO25HUdtbes3j37s1g7Yp/UMmwZH3ooCdliFrTaDgUAp
	JQ7+SaTbfI/Ud3RTKL8j0oGGhWdDm0Rl2RSmJbJfXIT1oHS2hAlWGdxdJq5sLHC9mJ8WNN37QG6
	g/0yqF+SzwGPweDovKjjx6rFKDmlypg80Gju3TWjaURjv/lnut66u6tAk60QIcex20iJXc+IpZb
	MrOhJIJ9VUToGhBOuvtrzjl4a2N1IwDwjpg+qd/1UOTvFUJR0oCewcM1pt3DkSc/c23QzwEVLpi
	ll4dxEyjunrG9MRLoU0n54TOn5bM+J2TkE+vLCUTlbqtMkqCO9kjXX/iTAyQacn9YTPF3/SPMje
	Kxi72FtDKRUg87fMU6Xkmjs31XKYjFaCyelhS+9Yp9BT43lQXToqZ/HD2KcbQPMAFHtKR3avDbv
	aY6WdkauV3DPVEsf2k/R7SuiS8o6kFKr8gFkBOQ0oF5gjnYYXxwL7vmQ0Eyb6gk16EWhH7awo2J
	XnIDnoV12Zskh3Cc3d/Omwr9VApEax+8XBb6GCwzuEv7m/YA81NOEBsomlb/psI3fC4u2fryG73
	+oPa1lApzEVB/mvzW1Q==
X-Received: by 2002:a05:6830:3591:b0:7e9:e5c0:e0a with SMTP id 46e09a7af769-7f39a872f1cmr4107850a34.5.1786403104757;
        Mon, 10 Aug 2026 16:05:04 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b5a7616sm8921584a34.8.2026.08.10.16.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:05:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Aug 2026 17:04:51 -0600
Subject: [PATCH 3/3] mtd: rawnand: sunxi: select the packed H6/H616 OOB
 layout
MIME-Version: 1.0
Message-Id: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-3-463853a14ad9@gmail.com>
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
In-Reply-To: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
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
X-CRM114-CacheID: sfid-20260810_160505_668949_DBEA7BC6 
X-CRM114-Status: GOOD (  19.79  )
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

The allwinner,randomized-oob property selects the randomized normal-page
OOB format. When it is present on H6/H616, use four protected user-data
bytes per 1 KiB ECC step, cap the total at 16 bytes, and assign the
entire total to ECC step zero. Reserve the same total before maximizing
ECC strength so the selected strength leaves enough room.

Keep the existing maximized mainline user-data layout when the property
is absent. Older controllers have fixed four-byte user-data registers
and need no additional placement change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 92b26371a6d1..2388cc361685 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -223,6 +223,9 @@
  */
 #define USER_DATA_SZ 4
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2036,8 +2039,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
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
@@ -2050,6 +2059,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
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
@@ -2104,6 +2119,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * remove at least the BBM size before computing the
@@ -2170,12 +2189,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	nsectors = mtd->writesize / ecc->size;
 
 	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
+	 * The default variable-length layout prioritizes maximum ECC strength,
+	 * then uses the remaining space for user data.
 	 */
 	if (nfc->caps->reg_user_data_len)
-		sunxi_nfc_maximize_user_data(nand, mtd->oobsize, ecc->bytes,
-					     nsectors);
+		sunxi_nfc_init_user_data(nand, mtd->oobsize, ecc->bytes,
+					 nsectors);
 
 	if (total_user_data_sz == 0)
 		for (i = 0; i < nsectors; i++)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
