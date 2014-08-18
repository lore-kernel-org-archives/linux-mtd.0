Received: from mail-ig0-f180.google.com ([209.85.213.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJKEo-0008Kp-JT
 for linux-mtd@lists.infradead.org; Mon, 18 Aug 2014 10:32:30 +0000
Received: by mail-ig0-f180.google.com with SMTP id l13so7327900iga.13
 for <linux-mtd@lists.infradead.org>; Mon, 18 Aug 2014 03:32:09 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] ARM: multi-v7: Enable ST BCH NAND
Date: Mon, 18 Aug 2014 11:31:52 +0100
Message-Id: <1408357919-19793-2-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1408357919-19793-1-git-send-email-lee.jones@linaro.org>
References: <1408357919-19793-1-git-send-email-lee.jones@linaro.org>
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

Reviewed-By: Pekon Gupta <pekon@pek-sem.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 5348364..4670836 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -115,7 +115,9 @@ CONFIG_DMA_CMA=y
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
