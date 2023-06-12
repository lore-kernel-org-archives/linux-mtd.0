Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCFDC88CB4
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KWxeW6R0j+tjQlkT4PxFtIyJZCAVyAj2whBonaX1/Q=; b=rxdWLgMPdoxbeY
	qzYjh5SMCju6B4D2ObERhpjwKv2oRkb7mrAqjXgYnjoX1lzf8C0BVA3sZJLF8asai/9ch/mgCzYsD
	4Bx7ug17YLU4cSD552HJiIZvfVmVebqwjTeBWEXl6SIMmn5iJOfoXQAZMv/ZdxbIE+fFR8cLuDsv6
	WIY0x3WweqAqb7VmBkeLWlmB1qJaBPbraoDB0A1f+Xm4G7e93qCwJyISDiK27cuD7E2Y+dm9aoRsb
	S+S7rfCrz6PbSTWCOoOersOkv9+e9LsrYu8c2fVgQnxyvPAEW3O9qqfzuQ6FeG2NpcNtHkmjJ2yZe
	TUVnO0lWtar7akaOomIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8j4D-004OYw-2J;
	Mon, 12 Jun 2023 15:02:49 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8j4A-004OXq-0d;
	Mon, 12 Jun 2023 15:02:47 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b1adf27823so53113301fa.2;
        Mon, 12 Jun 2023 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686582163; x=1689174163;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vsbB0vH5LsCtdiDXzwFJEcjnZ1bqcJw9xluET8hnyJA=;
        b=geaq3E+bmBkq6z7kvRXllGNe4ro8ZY2negeHlbij7OD8LDJcNauS8idOAlZ4cheng9
         Nx/Afo0cShXI1ObiRE8z3uOjEbhnkYViq+HeeGtERscjnvNGZehHS2ApxhZUoUvoKyu5
         IVQC1kTVZgqMsOmO3Lmw8dtkuefsuaERZHR+6wcxdD4Y1AZwxly13rrpRdZC9Lpnr22m
         MDz9jYciXhhFZ6c6+Gs7lX4JhlVegARLtYXSmBno604MRNBcBQGV0Vaux6WQ9Lr3/ayo
         09MT/NlHGenMBJ7KYPbYPpC6Vk+ZPkhNZYL7nlfHSbg6UrgIJ5sUYdoAjq7ep6mBvSzQ
         niiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686582163; x=1689174163;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vsbB0vH5LsCtdiDXzwFJEcjnZ1bqcJw9xluET8hnyJA=;
        b=HP80EIIrXnqfJ6GZonYYif9Iy+V7cxii0lLBkf11P4wuSUZIz7Xk0CoDlMawvJVeld
         hsY3mrLE9z1Z63/OLmjraYROu2Lc9L/XxcxDtIIfW2qf0B0Ig7SEgx3LB3jOZ+ytFW7Q
         53vAjZ352jOqcWDD94Jzl3u0mi37NZWAyI/eXSIKNNmeKoGSPA/ArYH3sP8C2bfbZdHE
         d9rEWSn2h7BtCSBrxYRdUs4QrCtfMUoH/+s42vIEhYwg0/OrMOa3BXlHeXtTrW2Yto0h
         2NcK2jxSK1y4mLz9n/i47UgZOCyvo++hmdCnBXTAjmbXBRc68++GXskqqvDuoxdS2UTQ
         ClPg==
X-Gm-Message-State: AC+VfDxQNkF/r4MQio5iiKvslXtpHBSTI0bQFoq+nT8Xc7jOcudPlpT3
	7goiCmVTMTH1BtYwvKp6ii4=
X-Google-Smtp-Source: ACHHUZ6oIv55dIdolZeg9heB91jDSC5+GqANWRfteW66ewwdwraqMlcH+Xy8nktWBYBWwxGOo2lRRw==
X-Received: by 2002:a2e:888f:0:b0:29c:921c:4eb0 with SMTP id k15-20020a2e888f000000b0029c921c4eb0mr3450738lji.22.1686582162597;
        Mon, 12 Jun 2023 08:02:42 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id h11-20020a1709063c0b00b0097883000525sm5477783ejg.15.2023.06.12.08.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 08:02:41 -0700 (PDT)
Message-ID: <b4e73d0f-d3de-b3e1-26a4-cce5337fe07e@gmail.com>
Date: Mon, 12 Jun 2023 17:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 1/5] mtd: nand: raw: rockchip-nand-controller: copy hwecc
 PA data to oob_poi buffer
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <11e16c3b-6f7b-a6a9-b0ed-b7ac0cd703e3@gmail.com>
Content-Language: en-US
In-Reply-To: <11e16c3b-6f7b-a6a9-b0ed-b7ac0cd703e3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_080246_231138_67A3168B 
X-CRM114-Status: GOOD (  16.37  )
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
Each page must have a page address (PA) pointer in OOB to the next page.
Pages are written in a pattern depending on the NAND chip ID.
This logic used to build a page pattern table is not fully disclosed and
is not easy to fit in the MTD framework.
The formula in rk_nfc_write_page_hwecc() function is not correct.
Make hwecc and raw behavior identical.
Generate boot block page address and pattern for hwecc in user space
and copy PA data to/from the last 4 bytes in the
chip->oob_poi data layout.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../mtd/nand/raw/rockchip-nand-controller.c   | 34 ++++++++++++-------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 2312e2736..cafccc324 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -597,7 +597,7 @@ static int rk_nfc_write_page_hwecc(struct nand_chip *chip, const u8 *buf,
 	int pages_per_blk = mtd->erasesize / mtd->writesize;
 	int ret = 0, i, boot_rom_mode = 0;
 	dma_addr_t dma_data, dma_oob;
-	u32 reg;
+	u32 tmp;
 	u8 *oob;

 	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
@@ -624,6 +624,13 @@ static int rk_nfc_write_page_hwecc(struct nand_chip *chip, const u8 *buf,
 	 *
 	 *   0xFF 0xFF 0xFF 0xFF | BBM OOB1 OOB2 OOB3 | ...
 	 *
+	 * The code here just swaps the first 4 bytes with the last
+	 * 4 bytes without losing any data.
+	 *
+	 * The chip->oob_poi data layout:
+	 *
+	 *    BBM  OOB1 OOB2 OOB3 |......|  PA0  PA1  PA2  PA3
+	 *
 	 * Configure the ECC algorithm supported by the boot ROM.
 	 */
 	if ((page < (pages_per_blk * rknand->boot_blks)) &&
@@ -634,21 +641,17 @@ static int rk_nfc_write_page_hwecc(struct nand_chip *chip, const u8 *buf,
 	}

 	for (i = 0; i < ecc->steps; i++) {
-		if (!i) {
-			reg = 0xFFFFFFFF;
-		} else {
+		if (!i)
+			oob = chip->oob_poi + (ecc->steps - 1) * NFC_SYS_DATA_SIZE;
+		else
 			oob = chip->oob_poi + (i - 1) * NFC_SYS_DATA_SIZE;
-			reg = oob[0] | oob[1] << 8 | oob[2] << 16 |
-			      oob[3] << 24;
-		}

-		if (!i && boot_rom_mode)
-			reg = (page & (pages_per_blk - 1)) * 4;
+		tmp = oob[0] | oob[1] << 8 | oob[2] << 16 | oob[3] << 24;

 		if (nfc->cfg->type == NFC_V9)
-			nfc->oob_buf[i] = reg;
+			nfc->oob_buf[i] = tmp;
 		else
-			nfc->oob_buf[i * (oob_step / 4)] = reg;
+			nfc->oob_buf[i * (oob_step / 4)] = tmp;
 	}

 	dma_data = dma_map_single(nfc->dev, (void *)nfc->page_buf,
@@ -811,12 +814,17 @@ static int rk_nfc_read_page_hwecc(struct nand_chip *chip, u8 *buf, int oob_on,
 		goto timeout_err;
 	}

-	for (i = 1; i < ecc->steps; i++) {
-		oob = chip->oob_poi + (i - 1) * NFC_SYS_DATA_SIZE;
+	for (i = 0; i < ecc->steps; i++) {
+		if (!i)
+			oob = chip->oob_poi + (ecc->steps - 1) * NFC_SYS_DATA_SIZE;
+		else
+			oob = chip->oob_poi + (i - 1) * NFC_SYS_DATA_SIZE;
+
 		if (nfc->cfg->type == NFC_V9)
 			tmp = nfc->oob_buf[i];
 		else
 			tmp = nfc->oob_buf[i * (oob_step / 4)];
+
 		*oob++ = (u8)tmp;
 		*oob++ = (u8)(tmp >> 8);
 		*oob++ = (u8)(tmp >> 16);
--
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
