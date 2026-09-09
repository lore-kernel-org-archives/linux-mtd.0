Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1D3C79FAD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOqP3UZw9aW8sH9LgzzUGfUtBkZGDYCDL7Zshb9wWws=; b=GWwNTiUn1PawCz
	W/gJj/V18sdqEWo9EJV+brz+QX8P2c22evUOTEpRCEFgE6/F81mPmoRZdwz2VeaEO10gXqSHrqghR
	/m0UgLpXF18111akXjZxdsZ5Wt4eVkEi06cYuzahDSxlDA1nXsSztDSSAe2cCfK47An0GLJIQAYhB
	t2ZMlK3DQoSubwpD5wIuh1pe7TGoNucEwpUvY9FUmbIp/fzrtEVDPPUi49wQzo/nvpIVhLcyEg7oT
	mGeKKEipTeb6HiLMogHzXvkoG8FroHMYWQm4i2iPKaFBdXgZ9cZ2m8j8v+nkAGn+m8LLdy6cs6tOp
	LbBUfq0bb6GdYwLMwyiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dio-0000000B77n-33cI;
	Wed, 09 Sep 2026 08:31:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DiA-0000000B6Y0-2TaK
	for linux-mtd@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CID5bvCPjR59lMZ6K1AMRWDV5Xq0pdMdX69zJBV2wqs=; b=rE7/UpuJJV2qiBPMT9Fw6b/ovP
	jHMIoOrNFFNvB6+miQddVkWEdkrEIzs0jupBYdeV7BcUMK0kIVI/Gyu6adGoLatxerF4PemgAYyVm
	9toYGo5w/tK/cTDTQhfxuzrl7xDcPc5JnfBImdrftgPYAnv0T0ilpwc93M/CVbmZG+u3qPWu9trnL
	21FuTxV5g7McMrLTkyxao7rgJIk3qWTxnR+jH2SXt/ihuBE0cgJdUV8jot6nh6miyrbpz03OB7SSq
	L0sp51FhxmQddBpjCAzUgIZNUKnbUANXGWJ6tLuuceeh0ayBZtzQzrZZUzdaQP5D5o1gS0pFp2Xh3
	Syx1Qo6g==;
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Di6-00000000umz-1ABy
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:17 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso4657048a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942670; x=1789547470; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CID5bvCPjR59lMZ6K1AMRWDV5Xq0pdMdX69zJBV2wqs=;
        b=b6f69Fp0nzzx3RZ9ISxg6PyCdqh0G6TMJffVLePp8H3QE2Y779zsEzfNpcjOnG1vav
         qsRND1C0VHBDNRxHyrImNOdqJCFrGjnb1uNcEwEB4J8DYOHF1gis9GCnh7OWpjsJF7LQ
         s0SuUcodXxUakcdxlDxuyF5Iw55zHARY9qwXpYMVw6eBY5fGY8qkcmcxIJAB/V2ZYVd1
         xWgkdt1jplOPehhD1k6feMrseyNIzxeaqUDhB2NhwNps5fcIfTP8YFnho6Q9JLo2tgXW
         9WY5cyinzC89MHfze7IhqL/22bbzfuKaykfucuGyoQlzYKl7okwfFWGSeHc1mEUm5tdN
         8V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942670; x=1789547470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CID5bvCPjR59lMZ6K1AMRWDV5Xq0pdMdX69zJBV2wqs=;
        b=sx2ixUWBvLct+ca56L9VIj1mPtYBckzSaHEb1NTzO3bh0Lovp/8b1+GWaLln31igWm
         ZoTCDnmL1RvDI2q2fMzz3bzK+Z0wAiLQV9+wMhfvNAZ0hnxrg57w0T3Tr8dmbSCkmQOz
         Vk9Q4WREkwk1XxFJDcx1kxPy807w1Hd7c9z9XCb2QsjbmUZBKZWynFCm3C4Msd4i02wm
         fZVYzAsNADmhaf7ySLsHK/NDny9DO5lBX4orofaSUp+/f8sDIuprueYDlEkiXgbAJHf+
         5CUzvhGD+8hhOIa52ZhFTb3Qd3kE9wsFAYDyF7mBJZio4tvYigmqT2hBN2zjt8MGq80/
         VoDQ==
X-Gm-Message-State: AFuF++mfrzB72v6xnb70y/b4oki7IXQCezBtPRg0+zBPuTEFgo+m9rFd
	VpdHei6ADAzuSCli4EI3MORjChsQb8o5sWP1fUgp0MgQB9Erylb0Z1wf
X-Gm-Gg: AYBFou3KXShrRh3zeXG6xGRXg77WgeCQLpwgq3A4qTpagklApJZtooW7FqGQRKmc4ck
	5pwQPIRwVYgVjvzgz0eL6VUrgvlBCwlb7iqOhGpPbSITBQSKu9KgJJJBJ8dfeoDvZTtHCXyuuDR
	AaZdzRQYHn6iH5iTElhJoKg56YTh3ZLXX2g5GJiUphJmQIZ25eVzDz/TE45jcsdSjiWOa8EC84y
	ilwspTevuphn5y+kJWlU4RWEdo67WxNpmC1SBQVxpVxdogvs0i8bunQfar7aSce0lLeB25fpZEL
	eRVsHSJzstnz0yT78T5Nay/LG4gC7OtqMXcU7xUkNZbydoc6qsnrWUmW/DCZ2GSJH0bc301gVdw
	wCt0CpZUK7+URVmvOoz21dAz1Me8b4De1mezTTkVmRvVpHo4Mv8JZf1PRWj/fp+l52OOEn7mzZ9
	2bJNqm9md8vINboEfrz1RHj3rT5Hd0ODSbTeYBrUpZcW+bTs2kCDZZ9VfHHAVAZyV6gVk4FeHvT
	/75dPObyBIgUgCpN0M6Z3lFpT6LE2tDjZbMW+U9t8AaA4wXhl+hD2mw09cY97J7Z+h1aDNN+9P0
	qGljjsnrDUc5MDvGbP+1dw9/xGkSSGX2fG3EGLyF3ItRrStx6Unjv6RwaTRt8SLOC0qfp4sPZ8G
	640MIXmruDXhArxHkqOV/AgmFiW572A==
X-Received: by 2002:a05:6820:1891:b0:6be:731b:5544 with SMTP id 006d021491bc7-6be731b5b5amr683141eaf.37.1788942670338;
        Wed, 09 Sep 2026 01:31:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:45 -0600
Subject: [PATCH v3 12/15] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
MIME-Version: 1.0
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-12-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_093114_670240_745D48D2 
X-CRM114-Status: GOOD (  16.97  )
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

The randomized-format OOB reader fetches each parity region and the
unprotected tail separately. H6/H616 pack protected user data before the
first ECC step, leaving a contiguous range of parity bytes and tail data.

Combine adjacent parity regions without crossing protected user data,
and include the tail in the final transfer. Keep software de-randomization
separate so each ECC step and the tail retain their existing seed phases
and PIO/DMA representations. The NAND operation parser splits transfers
which exceed the controller SRAM size.

This reduces column commands for OOB reads without changing erased-page
classification, data-only reads or the plain-marker paths.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 6e54d3a92219..bbfed22640c8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1412,15 +1412,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	int ret, i;
 
 	for (i = 0; i < ecc->steps; i++) {
-		len = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
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
 		ret = nand_change_read_column_op(nand, mtd->writesize + off,
-						 nand->oob_poi + off,
-						 ecc->bytes, false);
+						 nand->oob_poi + off, len, false);
 		if (ret)
 			return ret;
-		/* Preserve each path's normal representation of ECC bytes. */
-		if (!dma) {
+	}
+
+	/* Preserve each path's normal representation of ECC bytes. */
+	if (!dma) {
+		for (i = 0; i < ecc->steps; i++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
 			state = sunxi_nfc_randomizer_state(nand, page, true);
 			state = sunxi_nfc_randomizer_step(state, len * 8 + 15);
 			sunxi_nfc_randomize_buf(state, nand->oob_poi + off,
@@ -1431,10 +1444,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + off,
-						 nand->oob_poi + off, len, false);
-		if (ret)
-			return ret;
 		/* The unprotected tail uses the page seed and its 15-bit advance. */
 		state = sunxi_nfc_randomizer_state(nand, page, false);
 		state = sunxi_nfc_randomizer_step(state, 15);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
