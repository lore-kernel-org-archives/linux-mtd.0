Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D7AEB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jul 2023 15:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUatVMzXZdgRw/NPhc+AvkAY1hnySycijvFqrHiikIY=; b=Z13XeOlL0eAOes
	faCmRsvjYt+wBcdKWWWN0GhXCcdtGIrDiiMuNMQqYuf63ZRIOXbmZ6BPHwscq1WozvSIucTUVtycQ
	RMuXkR7Ed2MaoHd4iLa2M+x8MhN8c9JxRdgGJ4W3sOd50Y+q7rD3zHoDOUvnG3aZdHwkiKL8+ZfRS
	aJi/05ChF/GxoRkJyGYZn4UI+s5sBaXj8tNyQUJj6aIHPuhc6OMTUNKvGl8d2TgFYnz4gAZjSVvM4
	1wh4h4cBzTxP4w79UNpZEMWkztRMg/m4IOCsJkcJEfD/4kLJHp5mgKyl5kV7dtwmiz1v+a6qwowoM
	SrcLXk4pjonYVh3c0CLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKbU-006VXw-0e;
	Fri, 14 Jul 2023 15:21:08 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKbR-006VX1-2Y;
	Fri, 14 Jul 2023 15:21:07 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9891c73e0fbso408545966b.1;
        Fri, 14 Jul 2023 08:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689348063; x=1691940063;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pBd1Lu1Lca2z3up8dzZ0bUwRcOK91MQPeC1b10XMPe4=;
        b=A/ccbJQG0mWqO3nDpiY+xh4xfkY0kga+DZl3nc3cBWumq4nGzT53Wb7qYroMNPoxPy
         0CoG/+AoAlP6Gq1bU+/2/OQPqmm2y/xSP82/Yfycy55uI6VlbagidJ4/jh3KboVYEiEg
         XWv/dbdZohM7ku2gJWtfyeKTpV+DNHZT4CyK9c6gUnBym9whu5JN9v+SdZ4Ltt4mzJLa
         aPJhX7i4msQ1Uv4Ad2NqgN830ytwvXPffJWBlHBzeIlr+tmVB0r1O+njKrK0Wjc7LmCY
         DgmQ21Dl7oKxmrYHJp5/SI1B0xMgLo8DUebKCOIEXu68j6mxro5f14oCj5Qhm/2WjGC5
         O8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689348063; x=1691940063;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBd1Lu1Lca2z3up8dzZ0bUwRcOK91MQPeC1b10XMPe4=;
        b=jI9pcCOQNJMQ8Sp+47ucFsFnLjKIueNFeWZOPOcFIEGLEGt6KaFBmxL7WScMdNky96
         gAUThWQHQcsFxuMJ2obhflk6eHHrZWAuDkre7w2oreasjwzUlUWCKxrqMb4nlApGeHLF
         W0J9FEEyiTx8/W0/UezGq0Gh5eCab+/C2TSd7OUY3fyWBQNh/ej57LRbFjBsOtctjvpr
         MiwF/+d/9jdcYipa987YlQS8+ajyBtDpfkX1hfAz35e59Ahy/9GlqYLqpVKfKTlsrzoF
         qbjzodFwuGYqsg5CL2hhoixGlaJAsaN0kR1yWkgtrkjbfSmSKTTvSQH8ZDMQwWhVNhxj
         ZlXg==
X-Gm-Message-State: ABy/qLZAWuihwxiwOJwAURNBX7kuIj5/JQYVvxwsW0CMT5/D0whc/e08
	vFuKNlF6VBD+lrFvfEkfV0QsgaY0jCE=
X-Google-Smtp-Source: APBJJlHFHvaFDcvkAw77w3uKJvNPDPy6uA2o4hJTamnYM6gRdFo3+dDRFZ8cjHJS7uHdyw7FmDCSUQ==
X-Received: by 2002:a17:907:2d23:b0:988:565f:bf46 with SMTP id gs35-20020a1709072d2300b00988565fbf46mr3573681ejc.32.1689348062674;
        Fri, 14 Jul 2023 08:21:02 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id bm24-20020a0564020b1800b0051e069ebee3sm5820793edb.14.2023.07.14.08.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 08:21:02 -0700 (PDT)
Message-ID: <d202f12d-188c-20e8-f2c2-9cc874ad4d22@gmail.com>
Date: Fri, 14 Jul 2023 17:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v5 1/2] mtd: rawnand: rockchip: fix oobfree offset and
 description
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <273ad871-9050-7851-9973-5545b88bf43b@gmail.com>
Content-Language: en-US
In-Reply-To: <273ad871-9050-7851-9973-5545b88bf43b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_082105_828081_EFD1D345 
X-CRM114-Status: GOOD (  15.88  )
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

Rockchip boot blocks are written per 4 x 512 byte sectors per page.
Each page with boot blocks must have a page address (PA) pointer in OOB
to the next page.

The currently advertised free OOB area starts at offset 6, like
if 4 PA bytes were located right after the BBM. This is wrong as the
PA bytes are located right before the ECC bytes.

Fix the layout by allowing access to all bytes between the BBM and the
PA bytes instead of reserving 4 bytes right after the BBM.

This change breaks existing jffs2 users.

Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V4:
  Reduce subject size
  Add 'Fixes:' tag
  Reword

Changed V3:
  Change prefixes
  Reword
  State break existing users.

---

Example:

Wrong free OOB offset starts at OOB6:
oob_region->offset = NFC_SYS_DATA_SIZE + 2;
                   = 4 + 2
                   = 6

oob_region->length = rknand->metadata_size - NFC_SYS_DATA_SIZE - 2;
                   = 32 - 4 - 2
                   = 26

Together with this length above it overlaps a reserved space for the
boot blocks Page Address(PA)

chip->oob_poi buffer layout for 8 steps:

BBM0   BBM1  OOB2  OOB3  | OOB4  OOB5  OOB6  OOB7

OOB8   OOB9  OOB10 OOB11 | OOB12 OOB13 OOB15 OOB15
OOB16  OOB17 OOB18 OOB19 | OOB20 OOB21 OOB22 OOB23

OOB24  OOB25 OOB26 OOB27 | PA0   PA1   PA2   PA3

ECC0   ECC1  ECC2  ECC3  | ...   ...   ...   ...

Fix by new offset at OOB2:
oob_region->offset = 2;

The full range of free OOB with 8 steps runs from OOB2
till/including OOB27.
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 2312e27362cb..37fc07ba57aa 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -562,9 +562,10 @@ static int rk_nfc_write_page_raw(struct nand_chip *chip, const u8 *buf,
 		 *    BBM  OOB1 OOB2 OOB3 |......|  PA0  PA1  PA2  PA3
 		 *
 		 * The rk_nfc_ooblayout_free() function already has reserved
-		 * these 4 bytes with:
+		 * these 4 bytes together with 2 bytes for BBM
+		 * by reducing it's length:
 		 *
-		 * oob_region->offset = NFC_SYS_DATA_SIZE + 2;
+		 * oob_region->length = rknand->metadata_size - NFC_SYS_DATA_SIZE - 2;
 		 */
 		if (!i)
 			memcpy(rk_nfc_oob_ptr(chip, i),
@@ -933,12 +934,8 @@ static int rk_nfc_ooblayout_free(struct mtd_info *mtd, int section,
 	if (section)
 		return -ERANGE;

-	/*
-	 * The beginning of the OOB area stores the reserved data for the NFC,
-	 * the size of the reserved data is NFC_SYS_DATA_SIZE bytes.
-	 */
 	oob_region->length = rknand->metadata_size - NFC_SYS_DATA_SIZE - 2;
-	oob_region->offset = NFC_SYS_DATA_SIZE + 2;
+	oob_region->offset = 2;

 	return 0;
 }
--
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
