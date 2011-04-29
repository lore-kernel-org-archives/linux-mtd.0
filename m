Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFkyw-0008Qx-HA
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2011 10:31:31 +0000
Received: by wwb39 with SMTP id 39so2898713wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Apr 2011 03:31:28 -0700 (PDT)
Sender: Bryan De faria <bryan.defaria@gmail.com>
From: Bryan DE FARIA <bdefaria@adeneo-embedded.com>
To: 
Subject: [PATCH 1/3] omap : nand : fix omap2 module compilation
Date: Fri, 29 Apr 2011 12:31:08 +0200
Message-Id: <1304073070-24526-2-git-send-email-bdefaria@adeneo-embedded.com>
In-Reply-To: <1304073070-24526-1-git-send-email-bdefaria@adeneo-embedded.com>
References: <1304073070-24526-1-git-send-email-bdefaria@adeneo-embedded.com>
To: linux-omap@vger.kernel.org
Cc: Bryan DE FARIA <bdefaria@adeneo-embedded.com>, jjhiblot@adetelgroup.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Omap nand driver cannot be linked as a module because of gpmc symbols missing.

Signed-off-by: Bryan DE FARIA <bdefaria@adeneo-embedded.com>
---
 arch/arm/mach-omap2/gpmc.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
index 130034b..f6418bb 100644
--- a/arch/arm/mach-omap2/gpmc.c
+++ b/arch/arm/mach-omap2/gpmc.c
@@ -882,6 +882,7 @@ int gpmc_enable_hwecc(int cs, int mode, int dev_width, int ecc_size)
 	gpmc_write_reg(GPMC_ECC_CONFIG, val);
 	return 0;
 }
+EXPORT_SYMBOL(gpmc_enable_hwecc);
 
 /**
  * gpmc_calculate_ecc - generate non-inverted ecc bytes
@@ -912,3 +913,4 @@ int gpmc_calculate_ecc(int cs, const u_char *dat, u_char *ecc_code)
 	gpmc_ecc_used = -EINVAL;
 	return 0;
 }
+EXPORT_SYMBOL(gpmc_calculate_ecc);
-- 
1.7.1
