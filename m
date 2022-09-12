Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C5FECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Sep 2022 05:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oo9uFHBD/iJGarcOx1F0DJGoUIsvg3z5VP1DaNz7isA=; b=zNlP5uFpba4Wpg
	Z1m/oCkzEcvP3xNXEjNLZqzLcGOsPP2LfuLI5mcavoxVlFOFQQyeCdPyjP70yWt/3+74QvqEj776l
	f271qX8xVT/5UPL6W2emxNcRDl5alb3FrDTNg738hEOI5S96RwI7DlUosZpBgbHWPwiGtc8IqBScX
	ynHSrvj8pXf9/XXme1SOW71EQcRGW2GVKpswO/ptnKijJO4I9DrRG8NRZhlXL/HH4BYesgoXzHDB8
	h4JffxTRNHdHCDQjtmGZZ3QfAFOT8oV8ep3ZBi61vsARND/iGJbXgNryYzjcDmESIeMBIeLePs49Y
	BL0UM65LY6IPCBvZozwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXblL-0072I2-Iy; Mon, 12 Sep 2022 05:13:39 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXblG-0072GQ-Qe
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2022 05:13:36 +0000
Received: by mail-pf1-x435.google.com with SMTP id y136so7527540pfb.3
        for <linux-mtd@lists.infradead.org>; Sun, 11 Sep 2022 22:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9DqBcz1y2FDrZTuSPICqAyuvut7uHrYOcPQAhxJ7Pgc=;
        b=GNxHwohfUCp6jPgWZF/g0H5snR7MWzyLxabE3mTWo0Kg9R0xfg2cBcpEbRaHMIMXN2
         Df0S/LnEKwC2KQ+CPgD0oP3tDUt+hB4OOLiCFevUrM0iDMzK17KI2kTP26CReKZ898tH
         eRT6wiNH/EnY+h9IZNk6kYiuPE4vVMZnSp8jNm1IqR5Cd6SK4e7zWMG3EfwalFCUPHyI
         Ao9whVhruydHB5L9kF+0uU5xwr2zusm08F3JVbjMiCLxFhenJQRpAuXB4yne6yCHIcbr
         w5gPw522wjraPFdstck8LmQojUTN7ifIZnLPoejhO7mB1dDANNWHjeHns6+/agz583Mx
         nnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9DqBcz1y2FDrZTuSPICqAyuvut7uHrYOcPQAhxJ7Pgc=;
        b=vzr23KykWX2/4yJXbS/DZQp/YHd8Wi/GaL6S5qxT8XU1wu+EowXBpzLcVuDZ2z65x2
         G8A7PirgKGPNtabNymADvHN/XMuO7i+DO5ZxOYAtP+7UKEvj+qtxRRuGerpryfw5wxHj
         nZNFzR9c1FxWN/BdMfgcahGaQZIn0gYMAncrd5KoFRfgaCmoeY2KX1uHWTEij0LWgmzg
         Kpq/l1q04E/c2Zytb/uMSSTVUCoqy+CT6WfrMsp7BA6JqQR+SF9j81XRhmoG3W0CrDQ1
         sCHAbCQPsoJOMd/YwepIappKLMk7lGbfhISZTrTGuMwIiWJ7tLCXWsd+LVj3nG2FYA2i
         96sQ==
X-Gm-Message-State: ACgBeo23CHm4kl4QIrSYqfQiHjzKKOcJPzEdNT+hg0eUEBw6UOVlL5ux
	Hj1AKtRf3l+fOoNkfhVGLb5DWmEPGkk=
X-Google-Smtp-Source: AA6agR5a+lwbOSjxffHbGhYvQGjLzoSrJaUZRxI4GcqiCtoM6svxsAKyXz14ma3s6NLQimqLrls7Eg==
X-Received: by 2002:a05:6a00:174f:b0:537:6845:8b1a with SMTP id j15-20020a056a00174f00b0053768458b1amr26697108pfc.68.1662959612752;
        Sun, 11 Sep 2022 22:13:32 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id b190-20020a621bc7000000b005364e0ec330sm4238396pfb.59.2022.09.11.22.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 22:13:31 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2] mtd: spi-nor: sfdp: Fix index value for SCCR dwords
Date: Mon, 12 Sep 2022 14:13:17 +0900
Message-Id: <20220912051317.2369-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_221335_108586_DF9C02A3 
X-CRM114-Status: GOOD (  10.28  )
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

Array index for SCCR 22th DOWRD should be 21.

Fixes: 981a8d60e01f ("mtd: spi-nor: Parse SFDP SCCR Map")
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
v2: Add Fixes tag.

 drivers/mtd/spi-nor/sfdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 2257f1b4c2e2..681e5e78724c 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1222,7 +1222,7 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 
 	le32_to_cpu_array(dwords, sccr_header->length);
 
-	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[22]))
+	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[21]))
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
 
 out:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
