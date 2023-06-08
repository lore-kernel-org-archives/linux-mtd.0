Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC3EC7EE25
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 16:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KWxeW6R0j+tjQlkT4PxFtIyJZCAVyAj2whBonaX1/Q=; b=ElHsb907YllgXv
	Az90Ht6aKol4XFPC3R6CfuL+3iOd+gNoBGgnqGmnRRrzIs/Dq6aPNjes57DnZ80xAr37AwBiGxQ8p
	e7MikmofY1sw5So8soN+yJXhV61oIoI6gLvP0kHQm/wNTcVY8JuDxm8qKB5wB9Z9MXpT497lPGbvN
	cDKuE/hn/w9a3r0kr3W7BY/Cj+3AuNvBvKyGq48WivvJTrhmLQj2/78Aj8IvIzvjWshJL4VDhuUcW
	WC+lb5P3x91IbF5yOI8wtVfRVoTdIg2kPHDCxVQYDNGu5JS2MSNc1ZZmd95t67ubr4a+BxWf8944D
	11GM5VplZ0XRI/oMMgag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7IWk-009svG-30;
	Thu, 08 Jun 2023 16:30:22 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7IWh-009stw-1M;
	Thu, 08 Jun 2023 16:30:20 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9768fd99c0cso400420866b.0;
        Thu, 08 Jun 2023 09:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686241817; x=1688833817;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vsbB0vH5LsCtdiDXzwFJEcjnZ1bqcJw9xluET8hnyJA=;
        b=hkZlfrj08DAP1djftJGmo6uA8r5XJM3qG/0ifHmdMHjFMPJUiG7J4+Q2yw+TJjY5bw
         KwIxIe8huBGGJ6hrpnTKR/Q/elpqCWAhZAgWMWsbnYVO0Yh/dlQMKpzxinQRhM5Lt5SC
         16O9tGJ2z3Z8zL8PCKQSfFc5xh7xgjuOWEp7VWn9xNRc/v3jMWtMd/cwx3pdJpMFQ+G0
         VWmqCUpWgFkt19Y8W5FubQmpuT8X+/DlsTRUL4Kmg065yRmnI8Z1S8O+x+xJKIqJFyxM
         x6mkccOU7yqrG1K9P46lbK5raTGfY4CDv3r8uVnspCJY3SwHjxuqKuM4+VCMGdnmgRJY
         0bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686241817; x=1688833817;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vsbB0vH5LsCtdiDXzwFJEcjnZ1bqcJw9xluET8hnyJA=;
        b=MU+z6+wXUbU9kEejJHfNqDlHHFSCxcz4GzX2vsyuzLydx8J71iMTXatfgQhZKaTML4
         ZKsiuUzEnF4nTfuojGiCpbHvH3D7nHhkxv+fYd0XJeIb1MmVA+YKqyIi7fRKbOug2WQk
         RXgm6crfhlfIV4AvjyJZaXgHGQeEO2hjlryTF9SeEfvq31sOuuu4dK9IsH6xAlTQICrQ
         /X7OLMRcjd+R1LDmmVHCNfi4idk0weuIvOdSQoFrHz4bXLh/o3dsz8rZ8hQnclcDn6KW
         NuDLz2W5d7sAptS1vI+kjOC6+y6yWhO8Nsqay307uzhP3YpWvAEBjPoNexH8LLozCR26
         4Snw==
X-Gm-Message-State: AC+VfDz18wqRmx6sxwcQGSXCzxERBrbah22Q+UrCB4V+igLYPETaH2oQ
	autyYOH0yl3VX5QdcA2qU7A=
X-Google-Smtp-Source: ACHHUZ6iMNVDTMeZdZzaR4cW1YP03V77zJAHgdi0d1rDcx262lUw2Jc2Wb32SEF9sMcsqRnfsVwf9A==
X-Received: by 2002:a17:906:7955:b0:977:cc28:d974 with SMTP id l21-20020a170906795500b00977cc28d974mr168921ejo.14.1686241816863;
        Thu, 08 Jun 2023 09:30:16 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906151000b009746023de34sm32160ejd.150.2023.06.08.09.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:30:16 -0700 (PDT)
Message-ID: <b516a130-c948-0f33-d792-5ea56ca63b40@gmail.com>
Date: Thu, 8 Jun 2023 18:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 1/5] mtd: nand: raw: rockchip-nand-controller: copy hwecc
 PA data to oob_poi buffer
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <19bf714a-43f9-c30a-8197-91aaaf4a6e5d@gmail.com>
Content-Language: en-US
In-Reply-To: <19bf714a-43f9-c30a-8197-91aaaf4a6e5d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_093019_461217_3506373A 
X-CRM114-Status: GOOD (  16.21  )
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
