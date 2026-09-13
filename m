Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3F6C88E40
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2026 04:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFMG2GA4AbL74i5pjCaycbIvmAIXzTF6O5zNM6G50xY=; b=rzlSdkqWN/LPGe
	8c2ME+LfizTQqGODao/t2LboYbYxMpsLZuLze+dxofbXBP4C+4VSVzr4y7YUX+n/YRhW+qNK3znH3
	Mz8ZsC+04UzWN4+gC1cOJKcTrqXn2nIM28QDAgVSRooFDOP95uziSrgFqY2Zz4RtEvSVlNdw3SmbM
	+iMv8l2Njc744JOP0qxC4YiJW0obcuMICYlBDowC4/clV/dtiOqR2di8If+RLTfbSxij2n+VfCwFu
	RT69HufYLpIKTCrMl3qLT410uOukVoPVb393KnbyO8RMKeTr5gHLyrHBA0YFu6BMvRBKSkf4NyVmt
	3XwkF3t9cKzsexShtYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSy-00000001MK9-1xoN;
	Sun, 13 Sep 2026 04:05:20 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSs-00000001MD5-0DnU
	for linux-mtd@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:15 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-80576d65d8eso1218179a34.1
        for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2026 21:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272313; x=1789877113; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zvSS6wjgtzp/kp5vxvE4i3FisWUsufvg/JdfpaRzj0w=;
        b=muwkfe0Sw1kpsJizu/2t90qPIya8IYwrQXNxDEasX0oB5f3e4KvmyB33rUXNNqNckl
         fb8ZRQv0wVDXrR2vVXjuQ2mWxKLh/qChUZo9fqNZbmQeKdtCrbt3T7y5dFtX0L3bLlgY
         +IraGPLCwxqmDaCFrK5U7y0jA3Qrs+kls6FRvZkl9gz1nyrESETL4F+9jn96j/rEfinl
         nCQVAPJg2R8jyhzQiMvGcnja9PNVbZlc7x2rPBhCiqfgp6/eoI6bavrlnNhsPWxHr6r+
         drliCDNz9/Rq6rCtG8O2rCaj+TYkdMo0opyEeVLJZggvX2X+g79EeocXVub5pXPTReqR
         y/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272313; x=1789877113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvSS6wjgtzp/kp5vxvE4i3FisWUsufvg/JdfpaRzj0w=;
        b=n4gxh96ozVZa7cx9smPNffWEL7mvbrNZN87vHRVKWI+cNhEaFXEsT50aJXAX/3bzPF
         VdDzksVLgcDfa40CKgKqd9qwK8y8EapmWZ0UlXp1V/Xbu4LCFwvFHn5j5v5Ntz5jvQTY
         vz/d/n8RLjixJixWSQD3U8MqeildVa55vHI0WyUzznC9XTJblSDoyIGRjlOj7jvoKP2A
         +XlufZumSllMsViFYYpTBA7ezpiauncrGghh+ZEyo37jEhI57KdcmfLAjthUgEBYUxkA
         zPlj+YgeljjnYUaJ/PZxKbelCH7MPKGdUhjzPqpVI+G7fVu5iDQB88/Hhk8pXRtLcHDC
         Di+Q==
X-Gm-Message-State: AFuF++nMNwbRM7KIe6qMiREWylsHqk1GqmE54YOV7ZZ9VnBWKKhCXxKw
	nzIqVTrVPouX0BIix8cs5RN20TMRBbHj4iUranxAEY9tz1FLQfTLzs57
X-Gm-Gg: AYBFou3l4e44yORhfETrFMEw2q0L8c2s4RJH5I716nQBRnFCBPCHNvItOkPVwh4Fyec
	yI13nat3JMovgWbrTlmWfaDg8GFGvaTM5M4AF/6Rds2xY/wcDyhssu4iezOghu21n4TzcJ7NG/1
	wyUwsr4qqqidT8J+stHZoeuNxr+2bbL1orGU/8jUJobIO6u4JMU1KFBLafWm46XOSK0v9AzqlVj
	QdS0VufNFEj+g0ePxTbUcerUfxuC85vJggQTb2obZ4KRqpytY9n4mBSZrF9kF2Ugc8sTnnDqnV+
	3ClB/8suPOaBewkvHduAl7EHixzPn8QdrD8paFgHykisvcmssCitRbfYZfKd9dm8m5mAZxDQZAC
	7xS9lUEWZ8Mmy0D289xac+hwbxVeh3LtepNHYGwpg+B3MhMGFqghKsVmTxTx6AHHeu65CFfK5DP
	IgY/yAWUv1pg7bDXLgor9saSi8fmqYamGc3usd7szFFQcxpJzxPnLQfeDXbzrYVI0HrfwreJjRG
	JmXtunhl5Y0yN7lRH7F2F2giaINuuVhuJw5l3BDS3q9p/fbKRNT2pbNB0tsPHHjbEZ9rZt+areY
	krqA4JZ9+Q38fc53QEHSqNTv0ooq4LyWvlZt+lo9aY3Bn2Nz8jAiB1EpbsHUHI3QNAZDTimc3jL
	9/bT0nXoIEF4hEe+qIlWtQb+TgFvc8Q==
X-Received: by 2002:a05:6870:6111:b0:475:e235:902 with SMTP id 586e51a60fabf-47dea515f36mr7446958fac.32.1789272312951;
        Sat, 12 Sep 2026 21:05:12 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:55 -0600
Subject: [PATCH v4 04/17] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
MIME-Version: 1.0
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-4-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210514_121983_A2F0D277 
X-CRM114-Status: GOOD (  13.39  )
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
