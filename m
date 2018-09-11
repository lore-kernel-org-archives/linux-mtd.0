Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fzi0P-00048c-B3
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2018 12:42:59 +0000
From: Colin King <colin.king@canonical.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: Kconfig: fix spelling mistake "partions" -> "partition"
Date: Tue, 11 Sep 2018 13:42:34 +0100
Message-Id: <20180911124234.32744-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in the Kconfig text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index c77f537323ec..28b079f20b4b 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -144,7 +144,7 @@ config MTD_BCM63XX_PARTS
 	depends on BCM63XX || BMIPS_GENERIC || COMPILE_TEST
 	select CRC32
 	help
-	  This provides partions parsing for BCM63xx devices with CFE
+	  This provides partition parsing for BCM63xx devices with CFE
 	  bootloaders.
 
 config MTD_BCM47XX_PARTS
-- 
2.17.1
