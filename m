Received: from mail-ie0-f173.google.com ([209.85.223.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm3wp-0002mY-0j
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 17:00:43 +0000
Received: by mail-ie0-f173.google.com with SMTP id tr6so1108629ieb.18
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 09:00:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/11] ARM: multi-v7: Enable ST BCH NAND
Date: Wed,  5 Nov 2014 16:59:43 +0000
Message-Id: <1415206793-25670-2-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1415206793-25670-1-git-send-email-lee.jones@linaro.org>
References: <1415206793-25670-1-git-send-email-lee.jones@linaro.org>
Cc: pekon@pek-sem.com, computersforpeace@gmail.com, lee.jones@linaro.org,
 kernel@stlinux.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Reviewed-by: Pekon Gupta <pekon@pek-sem.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 18e2cd8..b1a507b 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -126,7 +126,9 @@ CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_OMAP_OCP2SCP=y
 CONFIG_MTD=y
+CONFIG_MTD_NAND=y
 CONFIG_MTD_M25P80=y
+CONFIG_MTD_NAND_STM_BCH=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_ICS932S401=y
 CONFIG_APDS9802ALS=y
-- 
1.9.1
