Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97985C88E72
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0RRoa4z4dXjthgUmGbyY4Y+yg/szhRp9KQu7Z9yaqY=; b=x2s0lY0VSGk7n1
	WrKUDPNRNC0TCrbRYqwLVduB+OTu94YWf3c2S7dCKZqMB/cRqd7dIBCfjLwlxZ/PkMd7+R6/SF+fC
	V1GCAWjsqbIX4KoGyrWcPU40On8DLbvoVekpKlsvKSrcNMAP+r3Jc2qNcd7JGuGWRip3QqLy88vCh
	NJ6NX8/eWcF8SNBAjCyek1JmNtjFVE52t5l3gK+sSdQ7rxQqzagmCJe4wtyp0mgYAYU433Xx/pGfV
	PeMRSQDSi1zCpjXVn59d9HCdWKwVmtNog7ZF7UcQEWbQrOQWVv/5HyrO7adxx4x/UNAIE8QW4opDY
	7Zl9kn5DuXptgkgsBuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwF-00000004fXj-2xDw;
	Mon, 14 Sep 2026 21:10:07 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dw9-00000004fOp-1r4h
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:03 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466ccbd478bso1074861fac.3
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 14:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420201; x=1790025001; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=WJ6PfEbwQQ7m2F64lH50m8M1tA050obF2o0Lui6kpqdl8y9cgBBeIPMZQj2i875Q07
         Y0Au4IJRn8viIyeTb2CWmxmdAPBeFPtSVxMIAhb/RIjlgcENTBbOFdLLfCEeCiYLBdsD
         R3tXwlq7QYrns2DXzS8sAuEfqMRyv2vpYIVw/EUHvAYPb60XukAPp9WpnB/Yi83eaP5f
         Fk5M8wHKzxCMm9ugqOdJzZN7635TYxUbG8IZiBdB8WD7kt+zL0F+7Yc/P1Ht9OpGtlaL
         SK/3pSbI+fAZRJzuWvkq33a+PmtcQbYnqqA65EgzczDd6NwM+TnyeIN8Ne27v6v9q4dY
         hPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420201; x=1790025001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=ahvl3H1ltDK3yD42X/f1fJ52kxgtNu2Z/aPRDGMhG1JIxh5YgdhxDnqCOUa9hTi3o+
         lPTcP59Ry6NLqC0ZI5KgpIY+ftgr/0Kcfx9uj4dFxnk8F95dsayJpaWZLSuPEhUzMKVH
         9BFOJJh0hL1bc1D1cX3tfwm67W9aeIrbFlxQMXYeY8QjXb0FHDIpkaGM6LN2VWQTvuU0
         XHdW4HUEMQ1ZrSByIwwh7k7suEWrQqw4QakWFLbbEIiSZhKhfzoFIteqnNV3AfPH9bYh
         zf0x4oWqQf+f1Bsar0AoOqFxzjjVbmUHLD9X0mhU1M2gDDp6WhRm0p7EDaIsGMSpXjVa
         dZzA==
X-Gm-Message-State: AFuF++n30ldaMWH3nD1z2ZmqxgE4dTYoqiV66DJy9e1pBeF9yUatM8oh
	CvOWGkXQb8tu3mkD/Rg+xXwIvfDss8BNJdYTGNCks/cFnFymW2OWVVbu
X-Gm-Gg: AYBFou2DREaTti4mwTgic7z0x8qsYAyzpnzo8itm/pMpAWNsnhx3VLBhyUFpzUueq77
	fM8pPwX4qNyXm0GEqqi3Xd2v1hnWXct7E2a0ipeSCJGq6ob6xSYItV54GA0rVoZpPB2zzoAdaeX
	BoWPsJ2i3FLg3DchcMFVIQTDsKL8PDr8iaQsDEoBsP4NW7ZCGw7gdQ4NVsHXiwnRj7IaFRIntsK
	hptEchLzLVXmiKhJjPddzrKbWyT7vjpEPSeimwHWbCGky6W/Mc6Qi3nZv/5zSmuhgEPdoqgK+Zm
	fG2ccLf+Vk3wkw1pSdaHnWeYus9RaDP+wnrYrCW1hczN1R8H7gUx0lvKRfRrdyNmWFpIxqXdFUM
	ZFv7ayFqKlU04ZUH6QKhWQRJenuKAfi0EmMqVCCVxeadyrgGLLBDZKBTUhjDzWI2zEjc3Gqdhkz
	Gt5OupTvBRORFt19UmQ4NglZM+GNb/zooUpnRAoPTIqT2dLyMVZYwBJGDLgLj/6TkMyEhPFyMb4
	OirPV+KF6aILF8jgke2c2ggsuKKFdMcGZaDCdQxjLmiJJuYyBEJGTm848ImZb+nJUYd+Xdpt0dU
	N6P2CSpDUhP4r9LPbmnGEx02t0NA/RvxMC7mgPKkgagi9sJM49aMMNi5iekOCfkVaJKw5jfRSzG
	4/2+R9N6ksoyTdYSpcCVFPJVlCrI7
X-Received: by 2002:a05:6820:217:b0:6aa:ed21:6c95 with SMTP id 006d021491bc7-6c53c6f60abmr2434425eaf.0.1789420200643;
        Mon, 14 Sep 2026 14:10:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:50 -0600
Subject: [PATCH v6 04/18] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
MIME-Version: 1.0
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-4-2fb084fe0751@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_141001_524519_2EC1983D 
X-CRM114-Status: GOOD (  13.74  )
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
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d5d8d383b6d1..5d88ad3b8f70 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1610,11 +1610,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
 
@@ -1629,14 +1631,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1650,11 +1655,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
 
@@ -1670,10 +1677,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1712,7 +1722,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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
