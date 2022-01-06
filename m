Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7861C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jan 2022 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rkxS34FF+acwvqz6uJaiurjU8Zggq838nA1/iOIVoqI=; b=UFVI9VOoSS4lvL
	mLCucEaMty+0sjjH9xRJ8KKoNyF1lQGH0B+pQCnQIpjEsA+UkjQ9d+GCvuDuA+twTtkZj8+hMn9/u
	NFhXkdC/hWfoGLP8oa0j22OXS4veEUJj5FPHG6cON4+5TcyTBE4qa6GepzyRLd7/W3s1txue9XgJf
	EnoUn6Iu1C3v7IyERP7INnZRG733gM9vyHIaM+ykgvflIvSwzRM2g1s3zpQzEy4qAObviJ7y3ygM1
	iaEAkPpeRLYIX5VUwvn/VyGuKI+fGsZ3BfLt2iacVkER31CPIT5mLI9APni3YGhBq6lJhTU8t/Bhw
	lU+LJ8RyLJzthfJyS9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Scz-0008N3-ER; Thu, 06 Jan 2022 13:16:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Scu-0008Ky-N5
 for linux-mtd@lists.infradead.org; Thu, 06 Jan 2022 13:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1641474980; x=1673010980;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IYrdrJWcfkX8IFQj3tKNNLyxg7v2rQIq/226C5qZ1EQ=;
 b=gyKturBP9LYYq9IdW6b5Fg5FVMpbcTe6V7Y/anN9ftDwbLR3uRUiEYGh
 BYVP001A8s4yAyJykLwnhbyPpy1hKMtPp6QzkEljRRnVRQ+byTJeiAnk9
 jcc6wPXXnDtna0niqxIvAe8rLlbgpQISWOcsWXjlypUEuO+fYOpChIbFP
 OujYobpEx0QrkBBFefaMwKmPwvZoJ/zzme8Big0iOe/6wqMU3AX8ibEyV
 nlRq4ix2ExC7FrdfDKoaP17Ts5SKvXz2m6SDNTkaX88oIy0lFpovl0j2f
 ZOWiVGoneX5w7M9I4TGIc00kNvUOHqdsWJ5XPwUwh3J9nt0V5C+Lho3iU g==;
IronPort-SDR: UpvhNephNHdpHHP+cmFVmdv6qEVcaOTmb9LFOitOUHJj0DVTf09mxyqJUBJgReKreZewIWnJ0J
 w/5JZSjK5+NjQz+ybTMR69PmCExf3Ri1Q445Ii1YDZ2UE4UQ8vqWS2uZjN254IkSY2wTmjcwmn
 Kn6zMbjjwjVi+9A9B0tDq/W/+1x/5cmRNPhKd71lr/D6b2573vYHRQfCmOwghPynMDFRWqwDe2
 ZRV4o9QqN4zXUhwwLW/8uMU6PtLdkBsJtnyxmHSzUNQNf5EnzKXDzQHaXLYq0jwv7Bs+1gBfjV
 +wpWWhs2CKEAxpaGKAmuSsey
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="149326896"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Jan 2022 06:16:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 6 Jan 2022 06:16:17 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 6 Jan 2022 06:16:16 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 1/2] mtd: rawnand: Remove of_get_nand_on_flash_bbt() wrapper
Date: Thu, 6 Jan 2022 15:16:09 +0200
Message-ID: <20220106131610.225661-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_051620_788548_3C8D3359 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

Remove the wrapper as it hides for no reason what we really want: find an
of_property. Removing the wrapper makes the code easier to read.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/nand_base.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 113a2e9f43b1..b8e7f1aae032 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5287,11 +5287,6 @@ static int of_get_nand_bus_width(struct device_node *np)
 	}
 }
 
-static bool of_get_nand_on_flash_bbt(struct device_node *np)
-{
-	return of_property_read_bool(np, "nand-on-flash-bbt");
-}
-
 static int of_get_nand_secure_regions(struct nand_chip *chip)
 {
 	struct device_node *dn = nand_get_flash_node(chip);
@@ -5375,7 +5370,7 @@ static int rawnand_dt_init(struct nand_chip *chip)
 	if (of_property_read_bool(dn, "nand-is-boot-medium"))
 		chip->options |= NAND_IS_BOOT_MEDIUM;
 
-	if (of_get_nand_on_flash_bbt(dn))
+	if (of_property_read_bool(dn, "nand-on-flash-bbt"))
 		chip->bbt_options |= NAND_BBT_USE_FLASH;
 
 	of_get_nand_ecc_user_config(nand);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
