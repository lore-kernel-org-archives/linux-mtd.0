Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B45C88E67
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2026 04:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxFYmAnqPJtBHhkPSnTlRgKQiqIWrNzJXsS4CN+9uf0=; b=HxBiGkGR62IW2Z
	gqSxflxX4UGsoHbr/1ZIcOc5eIAqUjuIcBRE3+Hpi+sd9xtHSSB7ZExDQgf6CRB4/B8S6ebO7bXm5
	dBWEyDy0Zpx6TjrVLrRtg5M655Cgy7KKmxIclJAxRYNkSGKSgrwdB9jiLod1VuQP5au+0SEFPLbKT
	ups/+gx01DfLC7r76eXR51zUQt/eGZLf9c+Y+uAlmELpec3Oa4tgNXuCNuulDNq2+UJLdb0ub+yXA
	0tCQCmcemf2WllfCvZhN9qxOOKEFBUUk6COVSlWM3IK0uYizFkRIsYlnmzbC1hVHc74u5uMIOjreb
	X2mHASe+iACLljnN72OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bTd-00000001NBK-0Xx0;
	Sun, 13 Sep 2026 04:06:01 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bT4-00000001MTd-11Zu
	for linux-mtd@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:30 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-495c49f8eccso2539189b6e.3
        for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2026 21:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272325; x=1789877125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3fsd5mFSYNbCICE0q+20FvucYtRM3opmhA2nF/SNd8=;
        b=FNcU2lDrXZSLbcLKk8mwGAezqADhBRhOBBrbjUaSV5Ma/DDphwOjZBK70Z9tfbVyoO
         tUEH7vwevpQ8uPcbBTTTOIWfvXgILGnYL1AAu0mBlhc6KORyrzGsKKOxXbulP9xShzGc
         TGLmqOsUyS2g0LWdkcXc5N+BBfhk1r6nEKw/rdTGokS9i0mF4+fQ1p38FbdFDOFkNiG7
         2WDrqhWPGpBfyTACRQbT4cEU1b3CzOG2hX/CvTuIM3FuweG+885bhrxv7E1AMTa1qPld
         K+E6vJCfv8PiEQwAUhVulUch8whRn2DTMrfoyDB1gZ4DWPsbp152Rah7/pGz6WnFHPkM
         jrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272325; x=1789877125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l3fsd5mFSYNbCICE0q+20FvucYtRM3opmhA2nF/SNd8=;
        b=o34EjRUqTPMJMisVQC9CJr8JtZH1QwidsJJcrjZqJKlGjwAs/u9fBEXYhBTORI2aOv
         ghcLl9TPcHdZt0LSHM5XHht2ZkbUzxFiA5Yhtm69eijOOWNA/7VFu+wtn0Z53MYc5Vfn
         p3YsLFL1H+G2IA1QNke40ZgWhffLBJq93amJOI/YmO6oFM29JFprCSEQ+9hUTRDS5E5B
         xopTjbxKvU1E3CSziKCSizBYKUdlomqhoB5lzvtJdT+iP9j9VRHqU8E3iXXeu159P/3a
         /bgKn0sNrt29o+PwJ0AIcXnRbM4pjjj/z81hYrQ0QRLW8FiuSkOiMAs/1rUTOxQfF5v9
         nPoA==
X-Gm-Message-State: AFuF++kkMJH1QT797cnZIUzBVBtOjx0tUeKENMYNycE1vnbvo/ETErc9
	ploUDPCQXZ68unuRsZx1s3qj1wru7S9U69APhCmpaEiiqjdAIr1vGRna
X-Gm-Gg: AYBFou2G88zneKUs3cHCQbW61Oqdjyk9JyDjh65zhzFhhZB0AU4UoQ3Xim4he2rR5O1
	kv1UDocSlRVqt2BC+G/t8yU5/uxxImt6d8wiRpHSh/TvLzbx84u0E+Rf3EzDdk8E2LwhKdy1Js5
	0y5b/oJJnDljs3O2FuBkILrhv3Eqmr/0OLF2V/NNNkaZjCQgL2Ub2AZsPXi6rYkTIrSCcAVy3sy
	c4unhOf1AiGQVI8oSrEScm0r+JEaLawU9IC0BQBdoaDckO3ZW80XppWGxc1531u2O50Zsam50F0
	f2HctEiXBLBEQnBTwxf8tkBQFuvXSHtnwCxlW6g7HVz3GKNHd1DkvjdjfO0IEAzFe8xSECtdUIh
	n7g8/v7BuZ9z5G9YLAAwE68Om4xixDt2AAz2cCAJSMEoqNN1RqpA9g89MfJjW29iL7/s+bWFGQs
	SSkxcAfw6ujUVJ1+fcizsBWUZLWe1H3HELSJaIB3ZO8Play47xe5gWhi/xaDuVDRQHLU/0qfEtq
	PBhU7BvOy9VGUDGoXEBv/8XQ9ZfSfrD6MWAvsqm0+8rgY0JLTOPtpTcRQDZIBlikaHQ9i/FmuOY
	6XnDFb+Oos5Dtd6Ti6b5mHssHHEv4cjoNnA/GCeIRAwdJQkglZy1QFtHavA1dE+SZk90vynEvu5
	VH8O2CCwR1s8MytV/J1YY2YVa65Q8AsY=
X-Received: by 2002:a05:6809:28e:20b0:4c3:7af9:f497 with SMTP id 5614622812f47-4c37af9fbbemr4704298b6e.38.1789272325105;
        Sat, 12 Sep 2026 21:05:25 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:03 -0600
Subject: [PATCH v4 12/17] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
MIME-Version: 1.0
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-12-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210528_329730_0DB2D0F4 
X-CRM114-Status: GOOD (  19.24  )
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
index 725cc302df9f..97a4b4470dad 100644
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
@@ -2360,8 +2363,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
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
@@ -2377,6 +2386,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
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
@@ -2437,6 +2452,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2507,12 +2526,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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
