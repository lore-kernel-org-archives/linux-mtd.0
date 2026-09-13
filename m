Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB69C88E56
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2026 04:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfTHESZPRr+yAlfkbN3X0Gs+h/xnjjl+5yxr7UEhsCo=; b=gWgn//+EIcpnRs
	KzE7nqIGjWJtMUrNhPLEUjpCPy4tQDywRoPx8o/asgL31Z8eQQZG90H7o5qhZVetexYbGzr0Kg9jJ
	lpslKtgGW2v/vfM1Kkx9B+55KDEJFtwHdsUqw8MHmm+CSKJ3TsW241//N3B57kuMiZD0rOexYlA5H
	eSXyBT/HNEGv2qRzpJkGmxLAvh/q6fDZF0XPprIZU+m7zWeaXeXDs9BvqExVTOaOEuXEA1g730gOs
	S2MCpA4MeTRWCmoGy0HVPdhISvcXC+QKPDx80zrT6Q/b5MrD3d7CWQrV/oix88Z2+jGTyOsTkeZN0
	1XI8X1BsoxbpGPkPQedg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bTn-00000001NSZ-0xT1;
	Sun, 13 Sep 2026 04:06:11 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bT7-00000001MVj-0EZW
	for linux-mtd@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:31 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-47a6c640bf7so1318173fac.0
        for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2026 21:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272328; x=1789877128; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I96nTr3z4iUIosSghVQixbz9aFa+jjKeIwLd+JYqRDI=;
        b=FlwdLQErLI7al78QYpDJZciijgBYOzuE01D7FHoKIDT2yTMtOjrVPCFG6rOQTv3T2M
         DxT6+zqJLYxcg4OC6riBfZNfntGlu5tWeUzm1Jtz/hoSgqEsbkvbVg600PkHQqZifb8r
         U/+3UX9e81POCdJACGJ5JvOTPajXmkiEEIiSK4KeYFGmGuXNARZxIag7/vBlDhF5TF3R
         jx7f/hbtnENEXBr0x9Vqu8C4HuR8SCFmdeH8M12OlaxdA1663Eo/ErUR9U0KcjaPJHki
         kmRL8lj51A24X2yMwcLjdw+hVKm515arXA0JMyDfnHKHPvriwWKkSwy/LimROiybQezA
         9aZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272328; x=1789877128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I96nTr3z4iUIosSghVQixbz9aFa+jjKeIwLd+JYqRDI=;
        b=naPBK5PtSHhY2Oy/QcKVPHB1cCdsRwCeJUO9YBoEdUbZZC36Ii3fGIfA3pwXO+oW71
         ZT6jqIenVsu27Ej7Q5TRYCFX2TlwAjPRsaPRTBfRUvzWH+A0PKUTxtjWCEaXNeuY8tnR
         9HliSlVKGrHIg2IuURgOSK6rnZrk543bVNV6nJzvSZYj7DMl/Jqp51xPaIqHZ5IkinzY
         wqd+QidXlsKc+N2llA0IxwLrSla3xBmH/sM+Mo+iI8yt3OKr5v1thOcOy8IQ9F7j1CB8
         xoLqjmy+NSMAyE6rKVh4VZdLA3nsQkJdf3lOFpCjShoRSyvUHFU640kQRdK5LMXKk5fi
         iYWw==
X-Gm-Message-State: AFuF++loXBpgxp8InjYf4ts0UqDEOQhjX4sw81zfkXxW3BUw7CMm+B0Y
	NEge8eAvejEvOUVUBQNe0OdEsWYmKMtiBb+Tp+AtpPjCOUVgbJ0iF/5u
X-Gm-Gg: AYBFou2KQm4YJLsHKEl+Nz43nDabgJ1O/Lg+G74Zr6boYO6dyzeDB1fdDLAg3t08LBQ
	G/xvTlvRbOalwkzSHKb2Hs62ZQdnFJvJe4KWqAsUH1gMUASzyTCpqSXvUp3z4LP5tqJarumsiW8
	TaOdpDfrCDtYsF/3R1ztiTxbLGNt21y1kgR0pEBcaEv+ArVDx/yqJ8Ht+w7dbmhBYqFt1F6oPrx
	wCtUlxOTP/W8RgiZ0Sd8Cdjkc6Pbep9OMJ7oQYgx9VmzKDFUHiOy+qu3HWAh5RIkdHS9MS7/N0r
	UOnHGUAobyIFE5ILB6+uxxb+xlsd0YmT25JUvHxdPlGwVfmskYGbuYfCg62dP78m0ggbJ9xnUga
	lcgM7sg6OY38cVBuEaYxqmghbPc69B68chzWhaMvWtAvDaeY5VUTqhOMgsdacXivl2CtG3V8kqq
	FUXij0HVnx6RWF2bt7tyOAInD/MzDytNW6j9AFy0N3KfFeKy1YVx1rawiG4AFywCdrDYpJiI7Tc
	4l3NlN+M84HkSl1NmmLaYxLioyGX4PkeZ1eWLRSYiGmfOFd9vnL1prq4weZVNedB2f1GousrKfZ
	zKAKnT1dL3bGNulGN0HO2WsJHdQn0U7tRfo3p96xUb/THQ6xgSpJqBNrAPEOL+5WmpEe3zGWIbO
	IAc+a8c1FHgOpgvmGRD5T8G1TKNVp0g==
X-Received: by 2002:a05:6870:d307:b0:47d:a38a:6218 with SMTP id 586e51a60fabf-47de9864d36mr7458245fac.25.1789272327784;
        Sat, 12 Sep 2026 21:05:27 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:05 -0600
Subject: [PATCH v4 14/17] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
MIME-Version: 1.0
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-14-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210529_134769_9412E9BF 
X-CRM114-Status: GOOD (  10.01  )
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
index 5fba3c111a4b..84e1e04d0743 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1755,8 +1755,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1805,8 +1803,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1835,8 +1831,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1877,8 +1871,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1902,8 +1894,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1947,8 +1937,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
