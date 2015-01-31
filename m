Received: from mail-yk0-x234.google.com ([2607:f8b0:4002:c07::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHYQH-0006VG-2s
 for linux-mtd@lists.infradead.org; Sat, 31 Jan 2015 13:49:17 +0000
Received: by mail-yk0-f180.google.com with SMTP id 131so19053986ykp.11
 for <linux-mtd@lists.infradead.org>; Sat, 31 Jan 2015 05:48:54 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 12/15] mtd: kconfig: replace PPC_OF with PPC
Date: Sat, 31 Jan 2015 21:47:42 +0800
Message-Id: <1422712065-9403-13-git-send-email-haokexin@gmail.com>
In-Reply-To: <1422712065-9403-1-git-send-email-haokexin@gmail.com>
References: <1422712065-9403-1-git-send-email-haokexin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Kevin Hao <haokexin@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The PPC_OF is a ppc specific option which is used to mean that the
firmware device tree access functions are available. Since all the
ppc platforms have a device tree, it is aways set to 'y' for ppc.
So it makes no sense to keep a such option in the current kernel.
Replace it with PPC.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 7d0150d20432..ceade0448025 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -421,7 +421,7 @@ config MTD_NAND_ORION
 
 config MTD_NAND_FSL_ELBC
 	tristate "NAND support for Freescale eLBC controllers"
-	depends on PPC_OF
+	depends on PPC
 	select FSL_LBC
 	help
 	  Various Freescale chips, including the 8313, include a NAND Flash
-- 
1.9.3
