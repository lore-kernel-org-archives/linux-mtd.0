Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BD7C4450A
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Jul 2026 21:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UDbvyEbmLszvXEdKvWy3+7GWVvCwMQK38NZyV1ZWav8=; b=FyB68/sE6eu/vS
	ylRYzXn466NQSw3DVU+mBMwYRnRuWyw1oaxHogEU3b1meM3TbCcdZAYrJzFTU8M69vVwVRJLT4tqY
	XPWxCnBKF1Imgwu8kV3YhwG0FF3AFXZvv/MEvGGewnT4JLbvEl27thc/SKRNNGmAZV7pHdZ6WGfji
	m2WriUrvKvrRmqrAdBzIphOqlCaMZuQ/MjFrQ0nKoBqsB2t5OKduax+Je+70ZKvKOlYWw5pkuelLa
	r9kouyI41bDwKAro4jo1MJ/PKnUcf8uCnROWOmhG0wSVDKdnyV0wZx5qc/fPOOs3yDu60Xrha4se6
	Vi0KGLvmDVbrK4mi+cJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlCkG-00000004XxG-1arr;
	Sat, 18 Jul 2026 21:38:52 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlCkC-00000004Xwt-2GhW
	for linux-mtd@lists.infradead.org;
	Sat, 18 Jul 2026 21:38:49 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-5bfa4c51c2aso3090385e0c.0
        for <linux-mtd@lists.infradead.org>; Sat, 18 Jul 2026 14:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784410724; x=1785015524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYIBuBrwfJUsCzNCzNz/dUN+3+R7rxSdNYOcgrLuLlQ=;
        b=Z53nZIGkE6jOpqk74v7VzjAwBcC1YqxatFxTtVg2grtPIdjHR0frRbdwOlWY9/H7EC
         asIzwbcA4mfepSw8V9a2jNNbJBwyFxJQBP7MXci3TOwRtn+arBmJx4MnUjxYVGxU/gzb
         9jED5LPL2gwj5nlKaGMmZCxw5KxfakIT5D6oLV08dSFxC6W7F6pqRbTGjW52PhZpUDSw
         8GwnzZC71MeED0REtpw5LcuJkAeVMAYIWKhOuBxZ1kRo+gLqmixbrtR1R2ZWkMBgjLmS
         NHmg3efNFZltfGX5j2YsXwNRlQNMdy3woIZUl+6x/+nWoNRmtosYm1XYZbZYe3zfCuo9
         cEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784410724; x=1785015524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYIBuBrwfJUsCzNCzNz/dUN+3+R7rxSdNYOcgrLuLlQ=;
        b=hA3c+9D55s4w4GCpkeC3w+oi1sfVJgf8u4QFUcewV3afnYzovUGh3aahfVRTcJ0ml/
         ZO686REsNgI5jlLLHnatv5JCN32pwBVVGGomtbHsjV0+3SHGCPDT9VDvIAI6ohria5Ec
         I2fHk1g8qSE1YQtviFOj/i4b+e3OXPyptEj3nHHtb7zrMve4jIMXidJC04kZMAGByk+h
         PrHSIdikRFntmnsZHMXmT84UZFr9YeVkn9meJH2njMOR7Z6prWw8DULIwcF56v1JQaZa
         B68WQaB57cIGZShavEtiR7HhBquJAadgwj7NiSTiAOmCtKoDUoRkLth/9yXVhbipiwwI
         ZzpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpm8MCFCzgobqYDdTHzfJXhGU9rT1Nk7/6Pzkz0oOU6sPOiZQQOiOv7q4j7uviozsDw/YOZmkWgKlA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKPtUK+rzj4ljR8uu9najkpzOFkmWft7I8JFzWgXK+6r1DMwz8
	nWUrqSsMUBJw0EoXDr6YcUsMNF+W0OkphLzW0cz2cJwf9oi4NGjSSU51
X-Gm-Gg: AfdE7cnNGGNm0qKDHXxSjE+ks5gaXSOPNVuywXrE0DV4ksExH9isVJTKjG8XJ+W/XTI
	3YG9J+T+iDowRVps4hHYiz3B3AmzsXpgG/6Ar2ivEUPeNWz3tXtTGSOAO2HJbMi3IR1y6wZ96tR
	aBTiMy0FoaF4pW3mFzmwLmcsFRxwE/74soqe7Nit4zBPcKwxKQzZeZXXwm6vp8GWw1n1jYE1z1t
	6cXxOdF2LExe2sZJsc5ev7NB6D9nq5wXoFCxQ9EcWDRDGKZOy0636Z0UecFAs9EmUZCOnfACOsv
	uSOYlgjzmiUpl6iyus1ICqwh0gAnP2aR2UVQxuxlIGXzUpwUr2B12+wjVdhFMeZ/UtoDA7gD7GD
	cr26aV/eYK3SOicSuvk6OJ0Rss/khTuHjI273QLbzxtEiHJoK62I8RRiO0ptnpoE8fomooyU3FS
	RaXGDhVhd1xrkHeiXd2uFhemoRjGALLUC7hgQSxhmnurPUXh8=
X-Received: by 2002:a05:6122:6592:b0:5a0:5805:c8ba with SMTP id 71dfb90a1353d-5c1ca8c3f5emr1475118e0c.11.1784410724441;
        Sat, 18 Jul 2026 14:38:44 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a801:a24:e0c9:d661:5aa2:2eb5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c1eecca4f7sm3660639e0c.3.2026.07.18.14.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 14:38:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: pratyush@kernel.org
Cc: mwalle@kernel.org,
	takahiro.kuwano@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	heiko@sntech.de,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH] mtd: spi-nor: xmc: Add XM25QH128C identification
Date: Sat, 18 Jul 2026 18:38:27 -0300
Message-ID: <20260718213827.701787-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_143848_593679_3010AA88 
X-CRM114-Status: GOOD (  10.89  )
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

From: Fabio Estevam <festevam@nabladev.com>

The XMC XM25QH128C is a 128-Mbit SPI NOR flash with JEDEC ID
20 40 18.

Add its identification entry. The device provides valid SFDP data, so
its parameters continue to be initialized entirely from SFDP.

The flash is populated on the Firefly ROC-RK3399-PC Plus board.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Tested on a Firefly ROC-RK3399-PC Plus using the
"rockchip,rk3399-spi" controller at 30 MHz.

root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/partname
XM25QH128C
root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_id
204018
root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/manufacturer
xmc
root@rk3399-station-p1:~# hexdump -Cv /sys/bus/spi/devices/spi1.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  20 00 01 04 d0 00 00 ff  84 00 01 02 c0 00 00 ff  | ...............|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 f1 ff ff ff ff 07  44 eb 08 6b 08 3b 42 bb  |. ......D..k.;B.|
00000040  fe ff ff ff ff ff 00 ff  ff ff 40 eb 0c 20 0f 52  |..........@.. .R|
00000050  10 d8 00 ff 24 02 06 01  82 a7 03 cd cc a1 06 35  |....$..........5|
00000060  7a 75 7a 75 f7 a9 d5 5c  19 f6 4d ff e9 10 c0 80  |zuzu...\..M.....|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000090  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000a0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000b0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000c0  00 00 f0 ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000d0  00 36 00 23 9f f9 77 64  00 e8 ff ff ff ff ff ff  |.6.#..wd........|
000000e0
root@rk3399-station-p1:~# sha256sum /sys/bus/spi/devices/spi1.0/spi-nor/sfdp
c027b82ebfdf18e455c6366a9d57602b36f2956d4307b770954544918102d9b3  /sys/bus/spi/devices/spi1.0/spi-nor/sfdp

 drivers/mtd/spi-nor/xmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index d5a06054b0dd..06bb8caf8927 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -19,6 +19,9 @@ static const struct flash_info xmc_nor_parts[] = {
 		.name = "XM25QH128A",
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0x40, 0x18),
+		.name = "XM25QH128C",
 	},
 };
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
