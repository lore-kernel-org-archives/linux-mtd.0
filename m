Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A68C88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHg41DGZF2q7QnPcDdQebVYlfygiqbdiE342VVU98KQ=; b=sfZNuvIc3FX4QK
	iFOAHwFhH1ZJ3/izS9+Ou6Edoc44FH8ZpDbUbbgiB5o7KgBbjii5nN5ePsqx3BzAH4y2zdi/KSdAR
	BIhi6HrlsyqIurw8zesqOq/lktCREQY9rmJpYGxJADct6t8xT/13lk8u2dgFidRGuTn/ybOmIfcNf
	g/triA/KjcMJZOKYbQpczVfXApplytgDELlWsdLgCtpVXk6N/fln2JXNaFrgvtx8S490cchT4uK89
	8KkLzYllHN8/kIxWVsZkJcPt1Ocoki31GtKZ8lnWhLsGAbAZB36lWqlA3Rjnkxd0cZmc/VN21aQ5q
	lrUzPYZ5uzjtr/KdHuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxX-00000002DV4-2Pr0;
	Mon, 14 Sep 2026 03:02:19 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxE-00000002Cws-0BFW
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 03:02:05 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 46e09a7af769-801a8bf8112so338850a34.1
        for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2026 20:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354919; x=1789959719; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wD0VAfBnkJ1JCjUlJIh8uFV9v+cdt2HXmo4JRu4mOC0=;
        b=RvCCtZTu8QOMxZuG64EEUbHWZ6Nnl58eSCaWVrvhtWe4IjnRJTFS2TU2LAbO/3N9JF
         YtDDf/24gXziqwz6yMxZU2B9sUf8LZDb2v5G1/+bCtZJInksqoBW/BA08//PdPziKGIx
         HZ24+qCz9/pRA4q/wmjS5Ymoc5Gz+203lQBeWiiJ2wTTmm2ZYHFQn3lKniHf4MUV1EdN
         h0t999/v3Gfas8oWbrX5UApFH3Xr6DCrHEJlNhHOTiUvVon0KSpnBiR60bBBdzXS02lm
         DY8DG3YVLnFyremQpHcHUOzVX0X49keT+1OvqyQsvDTvlUZHrTSAPGtyh1tLERftMiDM
         hFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354919; x=1789959719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wD0VAfBnkJ1JCjUlJIh8uFV9v+cdt2HXmo4JRu4mOC0=;
        b=kzsR5WavcISF42X6JBHZZJRjrk9/FHGgxFinin/OunewyuxCLYQw+n428UY6XQQftL
         1u+i+4JLbNe7Da+nyOOBW5H0kszHkcOnBNvkDdM8COTROU2xOAlxC2roDSSxUeBO+M+d
         SWdhnbxlXs3anXHEIRcf8QN7eKQ8zCQhlguNXgaaBecGGZheYAL04rZAcZ6arl8Gmd1T
         28qeAFbHca8q44u1sVSN30gUdn/h+pagVpVTmZ3wKyR55qjcw6pwikIijAxjn21WTSzb
         J5A/7A+VE7cMtI5pNjGt33aqKlI6m6gk//CCOFaP9BfJrz6tG0EFTUVNRjFFCwxpGzGA
         da9w==
X-Gm-Message-State: AFuF++lU3GHGPFsCtI6OC32wh0ORYUYQWGDbchcdWRlxnvR8WgxZXCQo
	1BBqKN/Mmu/YV+nyKSstpdNIjDdNJq8A6oMhp/EKmTMH7uevitT1GUcw
X-Gm-Gg: AYBFou2+c/BBLmNaLaHqnkfudlrcVHPDwtbQz9FP1dFZ7k4h0zhnL6vd6CqOfF4oJ30
	osjjJqNo/Vwd8Vx1GVwR/Nz/nb6WpNsUsdcw8dRnFJFHDTWdFcJJSqfcGqnXRQ1INVo9rjr9ERe
	7QRWQ2IMmH4sjiWgnQ1RZyFDjkWq6aiXUhVfjMtZbegFCjCcqeT0khAmDhcDDbRQbH9dNMOwSQD
	0AsQp+094k+HBL//fJhHKB19mdtoA1oKUcr7XXw1uCKBU3pr3YNvANOofF8F+Ooe+fi0TmjQtvM
	XqRHvPet6th9eBMR9QYZhjc6P4VJLlTMdpf5u+6pfuXocy6boQKAZ8CVpCHjdq3hj/iQVrZlJM6
	+6htU7iuCjh5Z1pG25IYpgsovYVVvkmBGaIVcwz6VXXACmRi3OrhV5Q57hkkY+QG9+NJLYbs9JK
	VeZfRF0j1BA0ssqZVrZFtetmQgi0P0FhMQZ0pgVjm+fL8QS89iYaClNtX9lNFioIrhF2N4mn4Xe
	VvLcHzSIHhPXMF5q9zR1RkTlUwcjp8Qwm7xjTP+SVhIAT3IELPwtaSCGYuDC8EhoSjQUCZMZr6x
	lL956RLqMwIhQbahmv4sgOkeFZp+bxvv710clMsHYcR+14boK3m0WL3zDky2xxDkdDp0lX1bgwY
	je94N84CSc/XZy1ecXoYasYfGp7Bg+A==
X-Received: by 2002:a05:6830:67ca:b0:800:bca4:5626 with SMTP id 46e09a7af769-80899266b51mr285872a34.19.1789354919239;
        Sun, 13 Sep 2026 20:01:59 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:20 -0600
Subject: [PATCH v5 14/18] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
MIME-Version: 1.0
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-14-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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
X-CRM114-CacheID: sfid-20260913_200201_528624_C0D15C49 
X-CRM114-Status: GOOD (  19.54  )
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
index 0375930042ef..3fb61a10a441 100644
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
@@ -2417,8 +2420,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
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
@@ -2434,6 +2443,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
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
@@ -2494,6 +2509,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2564,12 +2583,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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
