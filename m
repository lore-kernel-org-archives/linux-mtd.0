Received: from vs81.iboxed.net ([185.82.85.146])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmmHe-0005vk-21
 for linux-mtd@lists.infradead.org; Sat, 11 Mar 2017 19:02:31 +0000
From: Alexander Kurz <akurz@blala.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Alexander Kurz <akurz@blala.de>
Subject: [PATCH v3 2/2] drivers mtd: spi-nor: add Macronix MX25Ux033E and
 MX25Ux035 variants
Date: Sat, 11 Mar 2017 20:01:05 +0100
Message-Id: <1489258865-831-2-git-send-email-akurz@blala.de>
In-Reply-To: <1489258865-831-1-git-send-email-akurz@blala.de>
References: <1489258865-831-1-git-send-email-akurz@blala.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Macronix MX25U2033E, MX25U4033E and MX25U4035 devices are used in 4/5/6th
generation Kindle ebook readers. Both MX25U403x variants share the same
JEDEC id. Add those spi-nor variants and the similar MX25U8035 mentioned
in the same set of datasheets.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/mtd/spi-nor/spi-nor.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 4fbd98c..3e14fd6 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1013,6 +1013,9 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
+	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
+	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
-- 
2.1.4
