Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFC9C88E66
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 03:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0RRoa4z4dXjthgUmGbyY4Y+yg/szhRp9KQu7Z9yaqY=; b=RsQwV1/cV6vqgT
	0JJfX56BwNgixcW90zKfzecoYdbWdF1raGtgs9y75DFcaDSbQBx1rq/7JVYVP4FnIGqLUaYPTLcDc
	lWn3HIXcCvRhe53scA+/0lcd7YPGne20U1Lq3GyJK0i8Mtoo4wMnnoOizGNvAnXAOrEWzNzNX26oW
	E1oOVxpx8ByX/4ieWuBKlf4JEo9LZHL/H5xdq15pV1NV2hPTNQWXT7x6Fx/Mr0KtNWyOBEXLBV5Iq
	3w1+irbsW5O4SQHAqFbNaNBzMYAgRux4uiaJxUNoAxtzdkl8ubXpCjXCszP84vkeH1RwS4y+1LZxY
	1DPD+LAotIzHBBqIh4kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wx8-00000002Cmg-0hjm;
	Mon, 14 Sep 2026 03:01:54 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wwx-00000002CbV-2jYG
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:44 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 46e09a7af769-7f4f0cfb29cso757180a34.1
        for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2026 20:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354903; x=1789959703; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=rzLD+wC/g45qc56lTzuMSHjAszIpreftCqAepoeJVjiIvCV9A4TIXDfGa0//cN697k
         CEv4MMTzewZCLS8eQYYTwAAkgi7Eh7yinN7IvadIKHfeg+ZccGVnb1cTOsf2Rkz2qTOD
         KV5H38riKbWGuwbEx1oEPI3xTfoRm36GknYemknyo/OvfmQ3RAsbym1vlQWHdSC/NLAF
         HYFiAQIHh1zBmSejtFvIfMvj0zX+FpsJbQkOWSGL0BreGsgiJRsrqoJwJkTsRgoEX/tm
         MHXxzwaIdPbV70hFb8aZR1usJWl2zk3sgelmp9IBfWBJm4Iu/yqnxszidpcY/gXSfrYH
         R0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354903; x=1789959703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=hsYh8alTZF4FWxll1qeS2Bm7Nk9uN9k/1yR67GCPy0Vxn3EC+dlXofCKS/Xmpa8ZZS
         8KkKsypwmlenCr2D4kx3PJICgJwRzoFIXRt93wPyLboL/dZ6aM7v8zeir03zKEqVG+u9
         H1Ug+Be/ip//5KYQHUCiBp6o0r7yeSp/F7KNbpyAlTivkLZVozJxFhjCj06JUNnfcPgx
         tbQaW/iW7XU72VVaCmKQQhp+nbf4ysORn7TmZBnBuUd8EfqYGigRdqzq305BRIAc8tEU
         c0HDEBZhfb+bm+hjrLB13EEZLgDT8tSxKdEHGZg/QR2rmxlzlb5WEAt2st03aMUXh9hT
         oiEw==
X-Gm-Message-State: AFuF++lSGd0sRJDD8l7JfyMlvy1d7l8s77T3vhZ87os2KF/cq+j1DXRo
	aNbVDza+fj9D1i5M4lEm+HW7rJbL2v/IJl+e0jcW5jxlC+IGWH9pG7XZ
X-Gm-Gg: AYBFou37HwsI7IRsvIG42m917usnh8NqIrttKG+pt9bwxqi2etud0O4M55aGmr5sTkE
	b1kKlptNMHoo7PFyRqELRF7ih1gB+EmOnKcaaymQtfo3KzOG6BfauLIdMQUhcxsRqwUZF3VJHie
	TFtbwV/xtBTTCUYe+f23e2DwDUue7lIudKehh2FVhGhFIsi48l5GlylkTiXd5y+6pH0WiNfrZhl
	VZlzWzwjQQytc9j+ozy2OG//1AYd1ZVKIUAHg9FvfW1hazw8DB/LGD4TGly+I2zDHy0J/8zhSZ3
	gRPX3rR7vVawAJwheAtfBKPSW1bldcVqB9n/pPESV6bWjmworfN0QHdxz2U/OMtVEzWfSj2mlHl
	Z/+y1MLuahhPUcxOZ2aHyFUkaTbOkjYuDssk5zf6OUnHz76sIeusWTmfQlAV1vHri3a9h6nqaW4
	j68Tbr6FNOHPyG8NeEAaga5f56Szf5wFEFiGn1kSbjXMv4ufZn0o/q3azsvLxCIe9JREiBOQegU
	jn8rKWEF6MtWaVxtew8yk7wF9QDIkpX7M0TXHsQBLWERW9O27ioIoqtSIZ1S8QCr5ljCUnH4sOh
	gD2k0YYuEsMv/Us9GJKt7nxlWXTAJiTQoXuuiCNYZ1Qbi5YPPfch2f8Lds6xVhJLs9l8C/s7DLi
	fItbvAcA6nrLPMkpUrEj6LJRn3f97Mg==
X-Received: by 2002:a05:6830:3894:b0:805:9f8b:bef8 with SMTP id 46e09a7af769-8089974baa0mr554382a34.14.1789354902809;
        Sun, 13 Sep 2026 20:01:42 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:10 -0600
Subject: [PATCH v5 04/18] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
MIME-Version: 1.0
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-4-7d711076a6f7@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200143_749248_6523EECD 
X-CRM114-Status: GOOD (  13.59  )
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
