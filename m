Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C27EB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jul 2023 12:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUatVMzXZdgRw/NPhc+AvkAY1hnySycijvFqrHiikIY=; b=tue6a40Gim9UNu
	Y0aRfLZD8cvUu71YkBCVjAwphLMGTM3a2kQGRpHsrgNw9xnoDZX8Wo27b3np0Z1r9y4SGVjHuMSX7
	A9/+qDwfVySZInj/SaBohdovv5PujWO/ymrfuDWyIfG9jtjZGRcJgA1stL5XyDRDI5uUU/fl/lUJ2
	ku84Q6S8TtTDDyK0DIeF+JczHyJlTYhsPnTEjZTyAZfwXUYVdfekcKeatWU4628dJE5fzy30IkeI2
	UwghliVFVRnXtUCH0ojvAwk5omdnLEmm1NCW4Hkk/xRYLC7MRizMIGn8oW/hLuYOrtbiJMnO0bWNL
	p8MSirAKdvINHHU30ZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqDc-00Bd9t-2C;
	Mon, 10 Jul 2023 12:42:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqDZ-00Bd8x-0L;
	Mon, 10 Jul 2023 12:42:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so42098725e9.0;
        Mon, 10 Jul 2023 05:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688992935; x=1691584935;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pBd1Lu1Lca2z3up8dzZ0bUwRcOK91MQPeC1b10XMPe4=;
        b=jMayj+6FlyzWisJa44u1vRVzWTqzkkr+hAgEqmGIvhditBR6u9AfV21PT8niYQk2WU
         9UL48NjJw19HLqdX83VpGrvCYR8rcxLqauGy0ioZpWd9BVq7GV99DrfYCGBVjLoEj5X7
         v+l1Z3m0B4PK/tTI80IYslI/+sWfb1hyVraBfwnwtBErzZyh1+WYjxSwIKKFLj8oHR2R
         e6+tmLxj6YBn1G0B24s1RiNZEn3XrG0AMpAgxxOhBZKW6hJo0YHsW5SMwiP1ZKXcLNC7
         ZLjqoI3KjmYJOBdQxlevWgF8QzeU37YSmnoch4wmSbV7jmuFK+atJdJ6ziy8HJtC1SiT
         KNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688992935; x=1691584935;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBd1Lu1Lca2z3up8dzZ0bUwRcOK91MQPeC1b10XMPe4=;
        b=A6I+9AoyAhiOBDM47aggshIks88Mf90zv2NsPsGRxOk4thgBbQQ5bIODFaa06u2adc
         kJwYbYkcE+OVMDjfV9GPQZOZFihI2hwo/QEcDoV7A8oGVtLTa827ZVdJISPoiJbVtzvP
         ns3KA9kNtocsP4UGIZ0h0kjnUDDWkUuRLE9On0JrutUfGLMl8+NyH/fluaHJ7D4zGVTc
         g/xolKjlpz3Qv4WUk6Io1OHX/5v1bCSq3eTLfbwGWKQ2xuwwZudwEdJvX70Kqmd2Trjz
         dXhzoa/oD8ocSntXdtldXUHlY7AnGFoudYSA7MnLoSgj4jDB6iTvyBvjbtfoEKiVRkSa
         GM7g==
X-Gm-Message-State: ABy/qLYaegJRU1wPl+mubmb61Pth6KCONdypgjCJozb4DTX0+KXaa+I0
	YJkVW1bWgew/Omapxq78i/A=
X-Google-Smtp-Source: APBJJlHsd3OjEmoDoMtV1lj2Xvfy9YGaqMv5Pv0DobeXvA2Ss7TEnthuzrVy/NImHSoytpm3lJI96g==
X-Received: by 2002:a5d:6e11:0:b0:315:a155:5294 with SMTP id h17-20020a5d6e11000000b00315a1555294mr851620wrz.34.1688992934466;
        Mon, 10 Jul 2023 05:42:14 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id u12-20020adfdd4c000000b0030ab5ebefa8sm11582335wrm.46.2023.07.10.05.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 05:42:14 -0700 (PDT)
Message-ID: <876e58f3-e3c2-6295-9137-312e686026bb@gmail.com>
Date: Mon, 10 Jul 2023 14:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v4 1/3] mtd: rawnand: rockchip: fix oobfree offset and
 description
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <08f694df-4c1d-f059-43fd-f1aee678062c@gmail.com>
Content-Language: en-US
In-Reply-To: <08f694df-4c1d-f059-43fd-f1aee678062c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_054217_151237_FFEC5F72 
X-CRM114-Status: GOOD (  16.08  )
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
