Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C638CC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 06:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rb86QyQqxBxgO+wxvj+nRnUA9ZD28uoqcQLW2br914s=; b=i/+u/KywUmD28U
	CZb4yXzvZVTG4e+My1L4o9+LZ5z7johnWWO2oNmw0njFQfzG5DhyuV5nO+NsMBs22/KNJ5Kx+tsTi
	P7m1Goyz2prQmBcUkWIJBT3GluG5eaKPPOjMSUGXTB9RWImDLuuwOpWDwpO8FLLla/EFUghtrfGTi
	D+UumPiXBW4lI5MSCf6X4bms8by8wzEH4XBWpPHKgAbfx3XxoCEx0gyDiV6GHfZn+pLTagdCfTUYc
	3F8DCpH3/ryFEtrPJCVvyoFmDiKOH0l1Tt3CJuiFvJFYso8TQRbMVJbaSwtb0DNPud8OdlKNxG99u
	vmybyr9EXAwvoplL7SJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQVV-00Bmtv-DR; Thu, 21 Apr 2022 06:41:37 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQVO-00BmpK-3I
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 06:41:31 +0000
Received: by mail-pj1-x1032.google.com with SMTP id bx5so4082893pjb.3
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2022 23:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c/9WLo3GEcH1x9DQwW9Dg4T+6FbmlcyVJaIOrmn5cbg=;
 b=fATmXXt0SizcXafhqKP+QKA5eCf+ykOBEGmhXRKtd44paEMDW8qdmuG6fcOOsMPIwG
 cFsqzcBAqHpDbydksZ4rZvI+TNZ0tAICCUSuGfM4+tjpQ+kzYaLzoShpdFnAXs+6sSTM
 ZLR83MR0HW/1OzbFJ7ZemCfqTSoC70NIA7xZE/6fnFG7qh/PHvEke75+MX1MrYEwEGIt
 xVrbX4iqzhCZsEdvkavY6TTUQtMbxfD5X0AAxNz1aemR5NZlRCWG8QYOhJ/jabJWQV6S
 xNJuRJM5pICJCMv/Pzn4s2gWplhuMxnXs5LfwZrsDGn3gT8ZCJAuqe7jcFY8jPcjdhML
 PZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c/9WLo3GEcH1x9DQwW9Dg4T+6FbmlcyVJaIOrmn5cbg=;
 b=hX4NU6g2iwANBHDNLzlh3jiCslxF58WFQ0dZ0WbfWJerLIg0s08b1rQFJPZrETrXbI
 /B2SkH2eWqb+iAnX9ko5naSd3wF0OG6sIZKsF22og5pC3tJ150OvcO6StTdPh9qZT2WY
 PjvAR54HF34Lee/AYPa42rieB8yDonzsgBq3VmI/9jXtXfimWXXhkdRkUeS8VSkmni12
 irqG7Jxt+EiKha+suVbvbaYaeagFXwCXO1t2NDmh2O4vReFopYExoPufD6HDsff42Ihr
 i9jPVHh3EbUb3okeikN+jo0ZKkBD6rbsvoFkh/ZxEtVtT0eG01cInU+ExMKM1HrOblNT
 9zTQ==
X-Gm-Message-State: AOAM531Fx1p0CJinfm0BkV7R+/JofGjTeRMDPj6F8P6mRdl2EmEXZRv4
 X2oTdpKf/Hhgmk9s6LLBav++6WHdnh0=
X-Google-Smtp-Source: ABdhPJxQLTbzlp0bdyjVYHNhAD2nsjmVPd+PTDqx1vYdPZG0qNsTb4TvqydYHd5DnRzcGAfccetwZw==
X-Received: by 2002:a17:90b:4a49:b0:1d2:adce:8a89 with SMTP id
 lb9-20020a17090b4a4900b001d2adce8a89mr8734448pjb.43.1650523286355; 
 Wed, 20 Apr 2022 23:41:26 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 x184-20020a6286c1000000b0050ad3051f53sm2075037pfd.147.2022.04.20.23.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 23:41:26 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v12 1/6] mtd: spi-nor: Retain nor->addr_width at 4BAIT parse
Date: Thu, 21 Apr 2022 15:40:51 +0900
Message-Id: <d705a2c1fc8d0a59c93454aa05642aafe4fc960b.1650519576.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
References: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_234130_194807_4EE1154C 
X-CRM114-Status: GOOD (  14.53  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

nor->addr_width may be used as current address mode in SMPT parse. If
nor->addr_width is set to 4 in 4BAIT parse, correct erase map cannot be
obtained in Cypress SEMPER Flash family. Retain nor->addr_width value at
4BAIT parse and set it to 4 later by using SNOR_F_HAS_4BAIT flag.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Background information:
https://patchwork.ozlabs.org/project/linux-mtd/patch/20201212115817.5122-1-vigneshr@ti.com/

 drivers/mtd/spi-nor/core.c | 7 ++++++-
 drivers/mtd/spi-nor/sfdp.c | 1 -
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 40ba45328975..87603a99938f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2210,7 +2210,12 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 static int spi_nor_set_addr_width(struct spi_nor *nor)
 {
 	if (nor->addr_width) {
-		/* already configured from SFDP */
+		/*
+		 * Already configured from SFDP. Use an address width of 4 in
+		 * case the device has 4byte opcodes.
+		 */
+		if (nor->addr_width == 3 && nor->flags & SNOR_F_HAS_4BAIT)
+			nor->addr_width = 4;
 	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
 		/*
 		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c5dd79ef75c8..9aeefd070475 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1211,7 +1211,6 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 	 * Spansion memory. However this quirk is no longer needed with new
 	 * SFDP compliant memories.
 	 */
-	nor->addr_width = 4;
 	nor->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
 
 	/* fall through */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
