Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6994DC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Jul 2022 16:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6Q2IxrM3W98E9PeKMAj6EwUcyHFIxWy/YS+1ljxJSM=; b=aGuiv0QhnMkfrb
	zNOGthXWwAAGvHqQXYDTupsQ5TFDFdWezJM7eTRoAiO8bSpohm8wEw22LSDzu0laAhX9THt0X4mi0
	eXTPXLAsH1/VaSctxj720GGI9A5UhuQmO/7hX4dcjh3YeyNT7O9kWgoP++NRt9UAswTFi9+xF4YNU
	ybJURNuVcluWCHIJMW6+vafqv0l/Ks3O9OlK6wlpdHHPG8MpMWpsKJ9dOjbZyQrqFnJGYKr2UPP64
	qOnMZGzKYpyQ8CZFu4VIbB7DaF34zwD4tG/Rmm6VOuMdqSJe4M67PrOmb7U7t0m9wAQZOfp+v9EN4
	9f5Vtc36p8RyJl2k5K7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIvP-00Cuyn-H1; Tue, 12 Jul 2022 16:39:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIuF-00CuCp-9Q
	for linux-mtd@lists.infradead.org; Tue, 12 Jul 2022 16:38:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id b26so11965673wrc.2
        for <linux-mtd@lists.infradead.org>; Tue, 12 Jul 2022 09:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JKhfBSF99cGeRL5/E+3ybugh2cH4mwS43tAxuhC31f0=;
        b=WalzjrJan0GdgXNc+jcedb6CZZSxb19MlR0FEDV27T/Eh8Ph077HshjmYEqrScbLL3
         qPM+GPV5cwfOzw3e+PjdwKlOrveJCRAx64fSOLw2K30sPDOmGTWWH0mOyeULI6D1vlXc
         nmplU2PWoRNhO7oTEeUdGBw/M/k63v0IvscKOeDCEb/bDl5chzlY/4VdN01eyJbeDC2g
         ABrpGv+eAQ4kbtdQAB8XJ8kyKz/SM5ztbP0R9UqLkWRPSEmzNw2gc2KOa+Mu2/F33PxG
         5RguZuynrkpFFDgEsTRWYJXhJ6EMEXBsZWHzrosOoUi9aPxq+1jW1x9xnhGT7rJpivgx
         NTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JKhfBSF99cGeRL5/E+3ybugh2cH4mwS43tAxuhC31f0=;
        b=P7nWdM1ykvomM1a6COM4pFk62ceas7HyPASC7thq7x3rwhwR0i1vN0iex42eXKqkWx
         +3e/wpctRc6eMridbKrZv8Q31JqvULeehteZe15S/f1pdvI5SWJxcjNNPOYhc9LRCto/
         TtkUPngKasCAY2DIkSLMpKa80zW5b6fnP6+FVb0aFKC8R3Z1KuK3v6Sp4mRONFtILPhs
         8Oi6LgHOAH2v8IQaVlf/Qax7Sqs7BHMInL4etcCETBAqSYALYDnut8fAzYAPZJlv2Swp
         VYFyr1ZAbv8JLY8p7RtCJgIpM8mzTOGANDN3JG7ftmayfSIHw4pWxUDA14zEQ5A2DQoO
         sl/w==
X-Gm-Message-State: AJIora88o3WbrfYAbq2CvLUWDb1pz+aQxB23fC5xiDDYRglyHBWgnduq
	1Jq/PZ9H8gsWAkZ159qkGV25bV3VofpR6Q==
X-Google-Smtp-Source: AGRyM1ufviadNLw6BfOV8sOAMFzMPgwFnfwUzwRqtK79s7nSUqOHQuOz0PRmE30FEk4ryAtWtjTjZA==
X-Received: by 2002:adf:d1cf:0:b0:21d:a2cd:522d with SMTP id b15-20020adfd1cf000000b0021da2cd522dmr13120142wrd.383.1657643912986;
        Tue, 12 Jul 2022 09:38:32 -0700 (PDT)
Received: from localhost.localdomain (host-78-150-47-22.as13285.net. [78.150.47.22])
        by smtp.gmail.com with ESMTPSA id s14-20020a5d424e000000b0021d4d6355efsm8623751wrr.109.2022.07.12.09.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 09:38:32 -0700 (PDT)
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: greentime.hu@sifive.com,
	jude.onyenegecha@sifive.com,
	william.salmon@sifive.com,
	adnan.chowdhury@sifive.com,
	ben.dooks@sifive.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudip.mukherjee@sifive.com>
Subject: [PATCH 3/3] mtd: spi-nor: issi: is25wp256: Enable Quad Input Page Program
Date: Tue, 12 Jul 2022 17:38:23 +0100
Message-Id: <20220712163823.428126-4-sudip.mukherjee@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712163823.428126-1-sudip.mukherjee@sifive.com>
References: <20220712163823.428126-1-sudip.mukherjee@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_093839_377019_622D8029 
X-CRM114-Status: GOOD (  11.52  )
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

The flash chip is25wp256 supports Quad Input Page Program. Enable it
in its no_sfdp_flags flags.

Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
---
 drivers/mtd/spi-nor/issi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 3c7d51d2b0509..9a04b03bebe0b 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -71,7 +71,8 @@ static const struct flash_info issi_nor_parts[] = {
 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		SPI_NOR_QUAD_PP)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
