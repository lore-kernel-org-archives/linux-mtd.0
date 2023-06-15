Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F3EEB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 17:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnEi6xSUaOaeJGHC03BjPFfbJ2Y0CJgjJG+WKE7Ta8Y=; b=fi747xTdDDhKYB
	P1aorRiGqKDK/GOUKuD8VpPWrsBppaLkfG6AFvi29nIaOvMNM0A256Oi8kMGLRf0PcduO7aK/QKEp
	tNQnYfC1fx//gpcR/tL5NM49TXcoqU8Dkv1HTX/lJpcACh2i9MfBZDJBeFT1WZFh51s+k9OEj25DB
	ebKO7mfh9t5h8H7KNeWNiH0KVJ+q598HTKZd0eWwX3F2Z86QvENivDUA4PivfFGBz4s6RdsDMadKf
	eOBjEV/p/N/exJOudgIZ70P+UUl4iu6H755hqqpyU8glv4FJgQr5QidKfK2lMAeqCT33EZq7hIFhm
	/jsdWSScgANd7yOm2xiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9qrK-00FbSF-36;
	Thu, 15 Jun 2023 17:34:10 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9qrF-00FbQY-2o;
	Thu, 15 Jun 2023 17:34:08 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5147e40bbbbso12047473a12.3;
        Thu, 15 Jun 2023 10:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686850443; x=1689442443;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=onV5CTTksC2Qd78lIixG0/dIqB3m8E1M6AA6FD8Jbs0=;
        b=prWxaZ36pGTgPaazXWWLSZ/xe/uSXBNIHmD1xZ7n5pE3rJGVNhR0N9Zm23NkJFrUaX
         23X1HZj+C9gLiF3S2wI4MyAWgNOYENKQhq1kaOcWW9A3n5U8qc2s3L4U+OiTGCDSZ+dl
         Qwk4OmTavRtpKxzglgdJ3cCggklFJ/wLxLq5239yhVxe5zGikHCWEciVS+C1L/06GyVb
         rJwug9nP3s50XCidh0wzVYY6HrVRZPHorWCfYqoyabW9o9fauqFnoK33z0+lP1KceyNI
         HD4g9S/10dq66w1VFds9N1AyvSFP/qsDfpYJ2O37DLOOJ+xsvpIdME3n6vg7nx2kLdDd
         OmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686850443; x=1689442443;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=onV5CTTksC2Qd78lIixG0/dIqB3m8E1M6AA6FD8Jbs0=;
        b=ARcJdESO+sd2KxZ7FU0aj/3NA9OM4736vRoZUsvHVwluoYXU/QHLgC6Nmy3bxuZF9V
         s0Lw4a1aLIC0gHHN7aQ/QQxopVY71jh8QzzeWpA8Cv25Icn3vR3D8xaNx3pU3X4EmPHC
         yBKLC9siZlnLxJKw7La47M6lX2fD1fvZ7OlmwuuK9yhqGD31DejKeBvn6CTMkxdP0ykB
         k8/sSsMvCUhu2PRgC13FDjNPp5Q0F/XDutgokIeljgUIRL/jlvhWQkbwHke6zkGhxcbo
         1sdQLb2myjUl3AgxQkVPK+mbST1qRUxLCMtPul4sf/CgaORraA53GIiy/ZCQagZAoyzD
         2LFQ==
X-Gm-Message-State: AC+VfDwq/cA14V3DU4ePSD63ieRA19ImtHhj1WYuo6TeI9w3hTXjHPbS
	SawDfeOznOfrf4JaM2/DDQ8=
X-Google-Smtp-Source: ACHHUZ7yVhTWxSx4Cm9ZHg7+/ypOKVReVuS22P2vQuoAqqVdJ5E27xkglGRuj9g2yRDFuFKhEgHSvg==
X-Received: by 2002:aa7:c994:0:b0:518:7954:d082 with SMTP id c20-20020aa7c994000000b005187954d082mr5824467edt.10.1686850443301;
        Thu, 15 Jun 2023 10:34:03 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id b20-20020aa7d494000000b00514a3c04646sm9172936edr.73.2023.06.15.10.34.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 10:34:02 -0700 (PDT)
Message-ID: <dfb76ad5-b62a-3f1d-494e-cd17d57945ae@gmail.com>
Date: Thu, 15 Jun 2023 19:34:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v3 1/3] mtd: rawnand: rockchip-nand-controller: fix oobfree
 offset and description
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <0047fc52-bc45-a768-8bdd-c0f12cddc17e@gmail.com>
Content-Language: en-US
In-Reply-To: <0047fc52-bc45-a768-8bdd-c0f12cddc17e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_103405_911970_95D6509C 
X-CRM114-Status: GOOD (  17.08  )
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

The MTD framework reserves 1 or 2 bytes for the bad block marker
depending on the bus size. The rockchip-nand-controller driver
currently only supports a 8 bit bus, but reserves standard 2 bytes
for the BBM in the chip->oob_poi buffer. The first free OOB byte is
therefore OOB2 at offset 2. Page Address (PA) bytes are located at the
last 4 positions before ECC. The current advertised free OOB area has
an offset that starts at OOB6 and a length that overlaps with the space
reserved for the PA bytes. Writing unrelated data to a reserved space
with a specific task can corrupt our boot block page read order.
Fix by changing the free OOB offset to 2.

This change breaks existing jffs2 users.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

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
index 2312e2736..37fc07ba5 100644
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
