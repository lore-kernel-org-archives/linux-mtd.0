Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B40CC88E66
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQ1UeEUij6gTVZCXQAv9mh6fY5h7dRYb+mUf60hL8P0=; b=yXgZSBLT1k5Y8w
	sdZmROkCxWbEbdOnu4M4imDj9VlBnQSbv7n3gp0vJVCbjQCDOH8LXVu2dG5h8WQPnV9r7bnXoZztD
	Bsi8sivTuiu2ZZXJso1WwXT39jyO8l0mKnNqGHKUHF+IbvG1HKcrf+I3/XSFNLboa/KOpGFTCOjo+
	pQsBkl3fszI/8WuQ0gJObIxJwoOA8bpgwIGEbz3w0BPSfsx7CVVV9r0MdeWxSUAsoLTTxD8z942Hx
	51HKjxz6VcNrNH1afZM1w0X96G1/E2cfkjOCHoHh5BS98M52wa4xepOz17W2Fy5s4Ke7jyP0D78CS
	8y8r9WYuRv9S3F8QrCGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxm-00000002Dro-1lkG;
	Mon, 14 Sep 2026 03:02:34 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxH-00000002D15-1dct
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 03:02:10 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-805010cbdebso1321587a34.1
        for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2026 20:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354922; x=1789959722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OyRFeG3dg/KDzFyQJutH2zdFtVEXygh+smPcYHYkDoA=;
        b=fcLV3LksTLm+4GtSJBy8guqXlcSx0KFNOJrN4jReldME+4oZK8DMhgdLOpFPN5EJQK
         8/Yg0vwpWeLsk0bxl8nh9fKa/61p1/wJcr640Y5EmSQeoP5owRvaKBy5uWeC+paM43gj
         OsUl509plnk7gmeV5EFsBnk1A/SMQt+9SYEbVOEfE6DPCCFm5rDC6inCxMcHVDM75Z1Z
         XttNcJTe+l+a3WIDULOX6oZs8AUkyc7o7pBK++tQ8UYggoTOZvIk8/B6y8blkb8xKG8R
         AyHHWXJN7KUjahVO9H18xNTE3nK1F13Z0uPOXf9WDOetoS5IF0uKRWEghfu5ZrBR5mdc
         vWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354922; x=1789959722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OyRFeG3dg/KDzFyQJutH2zdFtVEXygh+smPcYHYkDoA=;
        b=Z+ARJtl1MurIOvxnW/FOdpHIpOv034SmBe6uJxbvg1l8ThqJLHLCABERrQNjsPX0Me
         Lyh9gSUv1E9vxTw/uqrvYtWvz1jNRInzXCfCRmMDy2TP/mbQNI5Aqv+UQnHmzn8Habp0
         CMZzlQET5hSitOvlf1p57tWefWmOL1bgR0iqfg68oAcDsIZNlmQsZ9cGd81PmFjj0EDQ
         LFyZAhPmaUR005ztLbQYSWMe04sCKbLzglboR13TV92bDAhEjXPGu4fRUuDLuhVdTxlp
         pPsw82jiu3inmWFpDnkGXSb6RnLtp9ZLHm0DejTHeocGeHfRx48abM5Yfp0ezyuwTyfO
         NbYQ==
X-Gm-Message-State: AFuF++mAo2WyO99+hROnayY9POSjDJJ0vvtxQbLKeb/aqonv+Sfl8aFO
	0xzYwct6617DcEkSOG4hsU0zVLkVCGk0s6TwjQ3XwsvBCM/DYJOk03NI
X-Gm-Gg: AYBFou1mSA9AJ2Sg8qWY8xMtqncg4M+OFA/ahHv/Lp+pmYr84BUKl8T5b+IyrPurKVJ
	hKcY+OlJcwvbN4Q3aG5IcGb+M24XRP8A7Auyicu9DBQbKIOrybLxNKidXWpuw1BoG9bduG9rGEd
	whios6qZpPBI/QMuLNzgMs6ecEF2CotyyDEi5MLfEG9wKBFdckPvhgZxJ0x3UGr4/+cYdoXMb/9
	IbhqFKdgZAeaUQtLSWIEX4Rc8sFUhVu/Ldz4fjlYMrgY7AhiPKovxZngn5EkDBLg2Ov4TZaItna
	nIH2SMOD17LreqwWX5Ohye7caCPzbIlzR+p+hq7siRy+9O3TUuGL2x+ZUDe0IV7A12YzYx8ws5x
	GrI9ini6PfopOm1h96ZslCJ/jdw4oSOzZ6iDK8asXXgV0cRyiBfrP3ecZ0yrauYYUCAPt5mPrfh
	iqyfbbhn95AWaYosnvfZW1GMhDwfw9JFNbZxVM7VL8yojQm9SkP3zb72R9oR7izr9VQtCtXWLxo
	QCgcjgXpSAuY+V85o2LN99etQjSSsTkQ8I3D9zU0UkiJzIBGvabc5eMHe/UmlrjxJ/4os4oGhs5
	Gyv8o6LOJHPlWACbjkAVyroFv7Aiwer/8Qpk3cqMnErhBM7War0mI73KKT4M8lj21QYXKWBEFf6
	beD6xTpqewThj4gaHB0RZZ9Az6swZHA==
X-Received: by 2002:a05:6830:6d2a:b0:7de:9b99:a8ee with SMTP id 46e09a7af769-80719632b97mr1941438a34.9.1789354922030;
        Sun, 13 Sep 2026 20:02:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:02:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:22 -0600
Subject: [PATCH v5 16/18] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
MIME-Version: 1.0
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-16-7d711076a6f7@gmail.com>
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
X-CRM114-CacheID: sfid-20260913_200205_586180_B598DA99 
X-CRM114-Status: GOOD (  10.12  )
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

The page helpers invoke exec_op(), which selects the chip and programs
its timing and spare-area registers. Remove the identical setup directly
before those helpers in the read callbacks and PIO write callbacks.

Keep explicit selection in the DMA write callback: it accesses controller
registers and prepares DMA before issuing the program-begin operation.
Do not cache controller state or change selection after a controller reset.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index b7ac8d7b0301..4103337f6a07 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1794,8 +1794,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1844,8 +1842,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1874,8 +1870,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1916,8 +1910,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1941,8 +1933,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1986,8 +1976,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
