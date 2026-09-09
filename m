Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FCBC79FAD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+hyzsr5yK1ZLaTI9fHSRWCI5P13MzcCC0MsXGfIyTU=; b=AlOlo2Hdit6rtr
	7tAOMmvwme8FngY6u7r4zym3EG4cCWSztUBnMswjtm0My543YAiGmMXVzicp4Rm4Uu71TI+7LfFKo
	6KQZ0rGLCDqaQoCdSbEYC6vSRRAKzuEvT2ooM85yLJahluzjCQR8oP8ierbaiymqCpNqjc4WOEVTN
	t0Df/o91xmvdHc/xZHY0RHJd8mpuBlsRwWscl7gj3tNGDqujLXeHY057Q+GeKAyQXoB+enOF8Aktj
	HvNaD/gT1xXRjUHhcN2Gi1Nhl1D4kdLkKBGIh1Vy4osxYgfSLbalmRTlmgSVBSxolYUUzs6M7tDrF
	UuBfFs3wpUwYUQjffZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DiW-0000000B6qS-1xxz;
	Wed, 09 Sep 2026 08:31:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dhz-0000000B6Sl-3Dhi
	for linux-mtd@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TAI1w8ATMKnIgdhqgRiA5pqnRC7cEUdZiCb1QZM8MYQ=; b=HUCX8i+rVzO849o5jve1p3o1uU
	JcQ10llKvbc8i2EqbufXcYkH5fdL18Zwb7zUr8ZxYH+XBEVAzkX7dsQmakhVus/gxNCwbR0LvXeQJ
	73/QZlPl/IgFm/UTes6Rd3L56sIgHMPYUeM5u5mJ9I7f3nMxXfGHHT1dgBSRrWCDB/pAlUM25TG8k
	sM9yu53vzh4zC04xyfV+k3s0Q8OvuHqQpz95i0Am2s4fjBIud03KaqN1P5siYV7skcvPN5LlbIMRH
	0Le5NQcfYbaYK2Ga7/HhievS1a3e30Sl/o0Q0Pib7v1By6mYl61WqLYvMCcSnE96SUe0Dwgn6iU2w
	wVgm/0Yg==;
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Dhq-00000000ukc-2kA8
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:00 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 46e09a7af769-7f4f0d05c12so490230a34.0
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 01:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942656; x=1789547456; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAI1w8ATMKnIgdhqgRiA5pqnRC7cEUdZiCb1QZM8MYQ=;
        b=IWOyBc6GSyf8vB7r2N8kGy2H5URKWRA/6ZWx8W8UVsVYhQvSwF5e8+yAWdk24ngZRz
         f15Z2LiDBoQmy9q4LLPoCvnDBx2BaFk/N2o7y6ZOPGvsg6SZEHQ6k7wQrA0S2cWdGmzN
         Ds9cdNrqukEFEhU1A6YOlyX53eAwwjNUmtTQXjd+anchnr9Mu7vcoF9gl10j9y4MZIp7
         yajyV1QJRCAHVO8FfMjdfke1r51PdeKCcdSw90I3e4sadLvh3xK0K4ODUD63+H9f7PYU
         3iNTOLmHH7FijxZg5MLgcLtYHgzrbUgkLCjr2neao20HaqSJKxBgsWOhxzsS00QqFhSV
         T6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942656; x=1789547456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAI1w8ATMKnIgdhqgRiA5pqnRC7cEUdZiCb1QZM8MYQ=;
        b=VSW+7tD2WMsiTZsIZqkMw5ZD7gqhuG9xx+0kHrx39n8EVJTyPo2we3zhqE1YRP5ZFH
         RXwP0jasqu6SJOfi9xj7IzPcf6Mbe3gAFCglToMvYqY29q+DYYA2Txj62Ren03woUeeu
         PvuYteN+rq675YoT1xwnbTlfYyAptq1H3792ywA4Ld5HfRm0icJ9VcEK5cBs/RgzGRUN
         JUIPniHu6F7HaWvcOAO7ZkFC3jtEEFDUi0XafpWyyzanQKTQdE667ohJZuasPgSFC3ak
         orsU/aCrv0LWrUyhWKcOa60xgtvQ+86kLnDu7MX1uzNzH1JwxqMxwvBnhqRTni03a2XM
         oBKg==
X-Gm-Message-State: AFuF++kLoeciBlHgYFN+HzNKl4FCsXkzlsRBNiPWDZPdzfingCxXAZQ8
	c9J9y9PprHmoVmK5vStPLSIa5ATa3g+hYMLkroIIJTQv2fC/Fq6ocl1H
X-Gm-Gg: AYBFou2dfpOi/lgOCILmRJ+9GVao2MxdPaQrdeniWssXjEHeNXTQbuPc4G3VePrr3LL
	szpblTCNIOICGeC0pOlgy21VzsnjB4qMBF3GNGUwO9ArzOh8qNAKWwIjJDGeoCYo27lZvC+0N00
	saZVv1TUNrJo7zWGynbPAizugelQMAPjppPwJdpi+tJ7qvLNIHOUzvAFHMKSayWGqRWog/v1LDE
	vTeBs/NHAsQHBN5cOGtbb3KEBW3RFP3ffb3a5ZJsr+1kiDSsHr818bnnE+Rb/2l7q3wm+N0mgH1
	g/T69OW8/XaiL7PKGllnojSH3I6mv8hX13oNR0dbyUByDnFvM0fcPv+O+MnKH5wmmy8vG3odhc9
	7jwFqMXlXxUkIB7toUcJs5Nj2JZ/i+kzlSeEYUcImLy7Say2JBPB71SzvJLekGIEChZ8vJxSRjQ
	rv0MLShCPrQXGvYR5u/xY1rWeFN9cRFYIXTyoYwq9rn/uqabU0YIxFTY46ifTVGjm3OZYF4E7ng
	omA+JEDlHJGnr4EwIX7HYBJEwgogobLukidxkIMwX00Xt5cGKh018XFKJU2cyg6SA1uEWlo5Aa8
	i+GJR7yG960dFNhUdJLFFIaw148IR30q8JFfFRKW8A7jCGjSA+/PCj8KZ+f+AfJ0DCFkh7funXz
	Uu54Ys7BF7n4ZTt8GbpYaAi5QFI1UbkbuCV+Ljak=
X-Received: by 2002:a05:6820:61a:b0:6b1:ba66:6998 with SMTP id 006d021491bc7-6bdca848f71mr4429570eaf.14.1788942656520;
        Wed, 09 Sep 2026 01:30:56 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:36 -0600
Subject: [PATCH v3 03/15] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
MIME-Version: 1.0
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-3-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_093059_123806_1FF2DEB7 
X-CRM114-Status: GOOD (  14.02  )
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

The PIO page and subpage write callbacks leave ECC enabled if a chunk
transfer fails. They also ignore program-setup errors, as does the DMA
page writer, and can continue transferring data and issuing PAGEPROG
after the setup command has failed.

Check program setup before enabling ECC or transferring data. If DMA
preparation has already succeeded, abort the queued operation and unmap
its buffer before returning the setup error.

Route PIO chunk failures through ECC disable and return the original
error. Issue the program-end command only after the transfers succeed,
preserving the existing successful-write sequence.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5190b39aec5a..af8ba2d9f7a0 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1598,11 +1598,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1617,14 +1619,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
 						 &cur_off, page);
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1638,11 +1643,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1658,10 +1665,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1700,7 +1710,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret) {
+		sunxi_nfc_dma_op_abort(nfc);
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		return ret;
+	}
 
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_randomizer_config(nand, page, false);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
