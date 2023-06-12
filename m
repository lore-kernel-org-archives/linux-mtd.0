Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3795C7EE2F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 15:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PU09H7Zm+QN9yp2IBXDEAV3RhRihdwF02Rtxc//kqYI=; b=aF1tk8hd+ScAuv
	UbjKQK2CIlcgW765wmhZgCo6pZOrBhqOUQxJvDrEIrbjXpLnBfpBrkaTvCxFYtlWBM7rfZ8adkiPg
	xTUaEJ+AbeAWX1dEOqcnHp5puRNskhAVhaLMg9Cgsi34A4Gx+WagOqkl1Bzu77OUsXJsJ3FM7/Z7X
	lKAWzB/1JBSVNjIyl7ZBGbbJPtuG4FXjR1a0uZopmPZogDV3aI5v1wNMIdaRFVF3hTqoFz4eL1aQ+
	QfPbJvVzoWMcEKxTOC3QZLXETr8xMpJSrIAZWdvV2NZAjYnRdoUMSifHi2p66Sxgh6Fy8gu7/ehFV
	sRRWNqX12fqyAWAjyomg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8j4o-004Oox-0z;
	Mon, 12 Jun 2023 15:03:26 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8j4l-004OmH-33;
	Mon, 12 Jun 2023 15:03:25 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9786fc23505so656880066b.2;
        Mon, 12 Jun 2023 08:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686582200; x=1689174200;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C6UuLqkfXOKHkrI1ad2tdmANY5TMlVXBKHyBVpKDDNs=;
        b=fQoS3tSGn8MnsOHfhsD6U5U64Fu3Nmsz50Zwg30oq03i6E9Ezn91hqw2g7JpPIfkYa
         eMxsDjRIBq9G0jJGBcWaDnePtVmfbNPUTYXkxtjP670BBPDpCwJOCK3L/KPB4zt36UjW
         kdt6PlviG3u9oMqOmGxqCLIMkk1SKvUtpzyC+hd9ztU8insHBNXyIOokRBp0ctanexIY
         NJp9NQSsohcxBpxh49DM4vi0azYuVugTJ838AKT94gn1TeK2cUx1267WJIPahLF1PDIo
         F5UQNY4dJJR83Egpjg+3rjY6RUlKmsbFha9n3Bejl45Oi6Vq1kE4K81JkzKG5nkdhNwm
         P2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686582200; x=1689174200;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6UuLqkfXOKHkrI1ad2tdmANY5TMlVXBKHyBVpKDDNs=;
        b=P8pgfPGctMhQTskCSWNRkRwMQgxJoK+VpH001QOZGlW1+VG9ObzN3D+615HmfqfOGV
         tx/Yah4IcGLFm3oPIgfNLzMN/FUNumR2SwIiglpKjXaLp6qNwGuNfixEyXRjS1RgeOcj
         XE4g7ogjd7NMTkzrHeX6TvGUiVKZpj0uuM4LXHiQli4HwM0bFqFHcbeRSaiLHVE4yj2W
         z0Sd4Hud7tj+KOjVi2+p4SkzaG9pk+kybFyMIHTYkGmxdnmw/MlHRe+9m2fkiyZB5lGi
         kPdM+uedcmobJencTr1d4pC+WfBubt85o9xlWsOKkzcTDYxgygsMlyUdxcsku16wJ333
         8Y/Q==
X-Gm-Message-State: AC+VfDwS+13JDXWbBMROEkbne6/lUG9lBB7ikTb+u3t82Ual1/0U7XSX
	DdB51aZL4EGr/Q/pZemOm1Q=
X-Google-Smtp-Source: ACHHUZ4K+07M7JwoUNnwyZygd7mJqgEw47AtVBH7IL8iAes/yi0KtHWRtUq/gJqHa6/nh/N6rjJouQ==
X-Received: by 2002:a17:907:3603:b0:96a:19d8:f082 with SMTP id bk3-20020a170907360300b0096a19d8f082mr9821093ejc.25.1686582199969;
        Mon, 12 Jun 2023 08:03:19 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id k14-20020a1709061c0e00b0096f6e2f4d9esm5264570ejg.83.2023.06.12.08.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 08:03:19 -0700 (PDT)
Message-ID: <f2cebf54-a16c-c849-a988-bfd98c502748@gmail.com>
Date: Mon, 12 Jun 2023 17:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 3/5] mtd: nand: raw: rockchip-nand-controller: fix oobfree
 offset and description
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <11e16c3b-6f7b-a6a9-b0ed-b7ac0cd703e3@gmail.com>
Content-Language: en-US
In-Reply-To: <11e16c3b-6f7b-a6a9-b0ed-b7ac0cd703e3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_080323_982323_ABDAACF5 
X-CRM114-Status: GOOD (  15.61  )
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
for the BBM. The first free OOB byte is therefore OOB2 at offset 2.
Page address(PA) bytes are moved to the last 4 positions before
ECC. Update the description for Linux.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 31d8c7a87..fcda4c760 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -566,9 +566,10 @@ static int rk_nfc_write_page_raw(struct nand_chip *chip, const u8 *buf,
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
@@ -945,12 +946,8 @@ static int rk_nfc_ooblayout_free(struct mtd_info *mtd, int section,
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
