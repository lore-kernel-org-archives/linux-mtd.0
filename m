Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8B5C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 19:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQrEtkkGO8jqRfzmAHWcQo3IJbXuPLA4hDiXtUJgCHA=; b=UfllPzdtR09gVr
	Rf1KGE5jIM90tCkftgOytpJqEU+43eZ6PsSiSOtcFdj3btPOElpZvdDVNQMUfgWx3BvuuOGYp6WN6
	SrBwRYEDpEv2MXKi3dQLA7jClSXBOzV/gnkHsZ4jkv+kNJjAt53Cz7tZ+K1vdevg528Q7ichqxUK8
	2LRA5et0HexoUEueJ6CPPtPfiO1unTfzsgcOBmcmnlZlV05C4vsAXkr44LENX5r6q9aVjFoCnnDCp
	nrdC30nuwjsF+nCCKZDtS4Kk4lq99WrGuBrCTQikSe8g7xjpEJcFY2j/tT5A3F/4SXIv5iW38+UiL
	4/Nnk0k7x+SsZrnphMug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIQK-002Sqv-MJ; Mon, 06 Jun 2022 19:30:00 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIQH-002Sq2-OU
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2022 19:29:59 +0000
Received: by mail-ej1-x632.google.com with SMTP id q21so30917280ejm.1
        for <linux-mtd@lists.infradead.org>; Mon, 06 Jun 2022 12:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WxFd85XWdH6G1vRB0EFSZ+sk3949XHOHzFGYkBNdeVo=;
        b=EV2BfPDGENUsu3CLb9s3/u0aa0aQ3ALz1kJMjhh40weZHRpenu7fevLdVkz68xtiZ7
         pYY9yM2Y9IVSxT7yhky4f9OHvNk1xIbUknedm7I5JCbd7sLBbfEHB4nAPSpOPPjVOCQ7
         I2IxqApO10SRlNsN94esZJx/9wIwLiKODtZi9KvOorG73lbmFHEmaAKaHymv65H4RQzf
         x118S/nUTaQfSMq2qObIzmCSY7Q2TqWSPOjf3GlpQjL3aMmWXoDcAH8yB/PqVqUihBaB
         D7KR4MLb+9BmQZj7DSHUJGjxwG8hNyvwaA+zRfcJMkztRmvUbbIrooaOigppztj6CKM8
         6tPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WxFd85XWdH6G1vRB0EFSZ+sk3949XHOHzFGYkBNdeVo=;
        b=hauVZwi7XGsGiIQg+I8+NP1xK5KteSySgc+43bl4YusS/Ym/jHymhylnKev0UUJvWv
         U+tG7g0UczhZhISr58W3xzSB9C53ccZg2pbg0/uoP9CDUoktPJJmlXZ4PJ7Y1LJR4+MA
         xPNsNvGi5Km9cgscAg/tVuVN9E5C9J8SsXXstHUGGt8WBZPi7f/PPbJqKmcCH84dTg+m
         OvAWRdAdtd4cAz5kEI+wH8wRnPsxLPadRiTlyENgYzvo4kJi9Qm1nxJdldJBbdoThFhk
         hkVEA/a5FbF5q2u42SHQ+va+EPZXp83lLibk/N1VfBp19Ojn8xc5R6jO6NhBZenR/tNZ
         q7Ow==
X-Gm-Message-State: AOAM5311B4GkDnlW5svwFAl5kVMIB2nrrIuvbM5qJwOfZPgCTtL6xVkl
	zhsVoJhlOWa65T19csUXCMY/LEzQwDg=
X-Google-Smtp-Source: ABdhPJz7Wxl9Ni8i8uqHj3pOnrIW7BqCoyNAny2yty7iTHuP38aFKC6AOM7efBw0+w56tDWdQn8c+g==
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id w7-20020a17090652c700b006cea88050a3mr23059609ejn.437.1654543793272;
        Mon, 06 Jun 2022 12:29:53 -0700 (PDT)
Received: from debian64.daheim (p5b0d7c1c.dip0.t-ipconnect.de. [91.13.124.28])
        by smtp.gmail.com with ESMTPSA id p19-20020a056402155300b0042617ba638esm9154827edx.24.2022.06.06.12.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:29:52 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.95)
	(envelope-from <chunkeey@gmail.com>)
	id 1nyIQC-000960-EL;
	Mon, 06 Jun 2022 21:29:52 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: dev@aboehler.at,
	miquel.raynal@bootlin.com
Subject: [PATCH] Revert "mtd: rawnand: add support for Toshiba TC58NVG0S3HTA00 NAND flash"
Date: Mon,  6 Jun 2022 21:29:52 +0200
Message-Id: <20220606192952.34957-1-chunkeey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606155919.23001410@xps-13>
References: <20220606155919.23001410@xps-13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_122957_854019_F47C0483 
X-CRM114-Status: GOOD (  11.33  )
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

This reverts commit 3380557fc7e28d9bce7607e16d98f123d36da4ca.

It turned out this "4-byte" ID might have been an honest mistake.
Regrettably, the chip Andreas has might be a counterfeit or is
damaged in some other way and shouldn't have ended up in a router.

Andreas reported his chip is returning just four bytes:
"98 f1 80 15 00 00 00 00".

However, according to Kioxia/Toshiba's datasheet, there should
have been at least another byte that would have contained the
correct OOB size that Andreas needed.

Thanks to Peter-vdL for reporting this issue and Hannu Nyman
as well as neg2led who did the debugging.

Cc: Andreas B<C3><B6>hler <dev@aboehler.at>
BugLink: https://github.com/openwrt/openwrt/issues/9962
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 drivers/mtd/nand/raw/nand_ids.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index 88c2440b47d8..dacc5529b3df 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -29,9 +29,6 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{"TC58NVG0S3E 1G 3.3V 8-bit",
 		{ .id = {0x98, 0xd1, 0x90, 0x15, 0x76, 0x14, 0x01, 0x00} },
 		  SZ_2K, SZ_128, SZ_128K, 0, 8, 64, NAND_ECC_INFO(1, SZ_512), },
-	{"TC58NVG0S3HTA00 1G 3.3V 8-bit",
-		{ .id = {0x98, 0xf1, 0x80, 0x15} },
-		  SZ_2K, SZ_128, SZ_128K, 0, 4, 128, NAND_ECC_INFO(8, SZ_512), },
 	{"TC58NVG2S0F 4G 3.3V 8-bit",
 		{ .id = {0x98, 0xdc, 0x90, 0x26, 0x76, 0x15, 0x01, 0x08} },
 		  SZ_4K, SZ_512, SZ_256K, 0, 8, 224, NAND_ECC_INFO(4, SZ_512) },
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
