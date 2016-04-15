Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ar9qF-0004u1-9j
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 19:55:47 +0000
Received: by mail-wm0-x22e.google.com with SMTP id f198so11326084wme.0
 for <linux-mtd@lists.infradead.org>; Fri, 15 Apr 2016 12:55:26 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Mikael Starvik <starvik@axis.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-cris-kernel@axis.com (open list:CRIS PORT),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 05/12] CRIS v32: nand: set ECC algorithm explicitly
Date: Fri, 15 Apr 2016 21:54:05 +0200
Message-Id: <1460750052-16285-6-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is part of process deprecating NAND_ECC_SOFT_BCH (and switching to
enum nand_ecc_algo).

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c | 1 +
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
index 5aa3f51..3f646c7 100644
--- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
@@ -157,6 +157,7 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 	/* 20 us command delay time */
 	this->chip_delay = 20;
 	this->ecc.mode = NAND_ECC_SOFT;
+	this->ecc.algo = NAND_ECC_HAMMING;
 
 	/* Enable the following for a flash based bad block table */
 	/* this->bbt_options = NAND_BBT_USE_FLASH; */
diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
index a7c17b0..a745405 100644
--- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
@@ -148,6 +148,7 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 	/* 20 us command delay time */
 	this->chip_delay = 20;
 	this->ecc.mode = NAND_ECC_SOFT;
+	this->ecc.algo = NAND_ECC_HAMMING;
 
 	/* Enable the following for a flash based bad block table */
 	/* this->bbt_options = NAND_BBT_USE_FLASH; */
-- 
1.8.4.5
