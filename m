Received: from vs81.iboxed.net ([185.82.85.146])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bubvb-0000Mu-Sf
 for linux-mtd@lists.infradead.org; Thu, 13 Oct 2016 09:03:53 +0000
Date: Thu, 13 Oct 2016 11:00:06 +0200 (CEST)
From: Alexander Kurz <akurz@blala.de>
To: Moritz Fischer <moritz.fischer@ettus.com>
cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Michal Suchanek <hramrach@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] drivers mtd: spi-nor: add new variants
In-Reply-To: <CAAtXAHdVxz-uV7EYWnUsBx9JpATBF8Wjf4Sg=-81xR4c3Xu81w@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1610131059180.15993@blala.de>
References: <1476020727-17299-1-git-send-email-akurz@blala.de>
 <CAAtXAHdVxz-uV7EYWnUsBx9JpATBF8Wjf4Sg=-81xR4c3Xu81w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 27d3d578dacd2b9cb80338517f73decb169e46ec Mon Sep 17 00:00:00 2001
From: Alexander Kurz <akurz@blala.de>
Date: Fri, 7 Oct 2016 17:06:10 +0200
Subject: [PATCH] drivers mtd: spi-nor: add new variants

Macronix MX25U4035 and Winbond 25Q20BW devices are used in 4/5th
generation Kindle ebook readers. Add those spi-nor variants.
Also add similar devices found in the same datasheets.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/mtd/spi-nor/spi-nor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0fc165..649f54e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -868,6 +868,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
+	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
@@ -980,6 +982,9 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "w25x80", INFO(0xef3014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "w25q20cl", INFO(0xef4012, 0, 64 * 1024,  4, SECT_4K) },
+	{ "w25q20bw", INFO(0xef5012, 0, 64 * 1024,  4, SECT_4K) },
+	{ "w25q20ew", INFO(0xef6012, 0, 64 * 1024,  4, SECT_4K) },
 	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
 	{
 		"w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64,
-- 
2.1.4
