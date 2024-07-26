Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4165AC3DA4A
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2024 18:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0f+CrWzbMwxtV+d3rS/YK1NHCSkB5REUIedmyhtx80E=; b=CIHsJkpu3z/UfS
	SPhQsdd7B6sp7r3THnj+BgJ583XMb7nhI7gXX4xNsgz/PTK+vPj5szwPSyb/9FdjDbsaxIqz08cW6
	NvX7pZz5+vdjQelecpA+sbRRunV1nFb+pq0oR5jqDfzd5no8MrABBMmK1YcWSdAEiiYlt9Bj6ZmdJ
	nSixFnrJWhYpeciujMHXnt8Lu3wC0/GH4fzJpRV8hld4tc0VWJUmgIBf6hkBI5WNrcMz0RvkgYF4V
	zc18DLx9f/zZVXSaWWTemkZqv9Rggh2nwfNyPxNEyMZAg+kGvaJJQgvlthyYFfLV65a4aOIyye38F
	FmWmbtZaViwv2C/lF40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXQ9C-00000004k8C-1bNn;
	Fri, 26 Jul 2024 18:58:34 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXQ99-00000004k78-1i4S
	for linux-mtd@lists.infradead.org;
	Fri, 26 Jul 2024 18:58:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1fc47abc040so7768425ad.0
        for <linux-mtd@lists.infradead.org>; Fri, 26 Jul 2024 11:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722020310; x=1722625110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L6yw1xHD9zAEjVMpNg+C0xVl0GDWtgqUwsdpTjnl5Jo=;
        b=kPYPJFfHzIT2duDdKGAmmovOa4RWDYWB13YXggNTd5b7enTHL+PAYanPzLvHkESyFF
         tnZsiJCbq3Vepec2Q/2L0vTr1A9v3y2XNr//Zf0AqZd2EhGhCaWwhCrPTp9QGWx2WVOF
         eDcMlxq8H6Cx647tnYnL1B5FH1CnhaCltWqRrxn7ypdT/rPA7bd5n+uVReyfBVQKeN6Z
         Lu5WsIkST7Ud89wmpzdSb2SQX/XGIwa4JfGI19GXvQrfQeJTeAPBiXnngYkQxWBlq3Ff
         7PdoDRGVuTPZmm7KB9T6X/Xqv1e2Rrn1PeqVCMFXSCaOJFNgHXfeT8PWnfYPXMonOV2d
         AshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722020310; x=1722625110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6yw1xHD9zAEjVMpNg+C0xVl0GDWtgqUwsdpTjnl5Jo=;
        b=xGUnxQNIWCXk/dtWM2lHIQL44HEf+W87qIuGDpZRgJYoC2125IrRi2Y7qrHyne1yEY
         1lGiPWeTV2jW5IHXXnd+4GwPyO1AxTOJjrTkzovq/qmZ27rK1PZKP58raS8fSnPnXaeD
         NRDhuU2f6bm5DjFJy4ld/J3xBgM5xhaZPvE0gov6pPZOBt+mMU3krCS6D7VnnajSFGDx
         DrqtgLtZtW+9QzZoiQa97vw2nf2G2BcI89hCxHWk/vGUNVSghSuPWpf8aMC7SMWi/HxW
         uSxpD5Ud4n5UPdAKZLLw3NC48gw+REE8qFkcaYPxqNhyKxveFMGSAlBh0KGxBGOaQqWp
         CPMg==
X-Gm-Message-State: AOJu0Yx2HDmydTmOeT9Zpn53U7AIRxmSBMZmhg/oWbL7tweX9jSJFA8j
	wRt7Z2uaaMncrGxGoVZ9rmG9uNNAVqScH7rs9Utx8bb1K4ms3Ab7k8K4+A==
X-Google-Smtp-Source: AGHT+IEYn3QbUlB6VurnfiUMl6eYXmGcorf3BPimFXSqrqw+9CtH5v7QARH5+IR7lXBiGnEzdi09Ug==
X-Received: by 2002:a17:902:fa8b:b0:1fd:a7a7:20b7 with SMTP id d9443c01a7336-1ff047d8f85mr5766985ad.30.1722020309790;
        Fri, 26 Jul 2024 11:58:29 -0700 (PDT)
Received: from localhost ([2600:1700:38c1:1d7f:f66d:4ff:fe3c:3ceb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee1168sm36416705ad.167.2024.07.26.11.58.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2024 11:58:29 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: micron-st: Add n25q064a WP support
Date: Fri, 26 Jul 2024 11:58:18 -0700
Message-ID: <20240726185825.142733-1-computersforpeace@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_115831_484556_0095C992 
X-CRM114-Status: GOOD (  12.30  )
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

These flash chips are used on Google / TP-Link / ASUS OnHub devices, and
OnHub devices are write-protected by default (same as any other
ChromeOS/Chromebook system). I've referred to datasheets, and tested on
OnHub devices.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---

 drivers/mtd/spi-nor/micron-st.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 3c6499fdb712..e6bab2d00c92 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -436,6 +436,8 @@ static const struct flash_info st_nor_parts[] = {
 		.id = SNOR_ID(0x20, 0xbb, 0x17),
 		.name = "n25q064a",
 		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x18),
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
