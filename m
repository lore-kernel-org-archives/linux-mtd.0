Received: from mail-ie0-f178.google.com ([209.85.223.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMcZ4-0004mq-0i
 for linux-mtd@lists.infradead.org; Wed, 27 Aug 2014 12:43:03 +0000
Received: by mail-ie0-f178.google.com with SMTP id rd18so168625iec.9
 for <linux-mtd@lists.infradead.org>; Wed, 27 Aug 2014 05:42:41 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] ARM: sti: Add two new clock definitions for use with ST's
 NAND controllers
Date: Wed, 27 Aug 2014 13:42:17 +0100
Message-Id: <1409143344-22458-3-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1409143344-22458-1-git-send-email-lee.jones@linaro.org>
References: <1409143344-22458-1-git-send-email-lee.jones@linaro.org>
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

The EMISS and NAND Control clocks are used when conducting operations
on attached NAND Flash chips.

Reviewed-By: Pekon Gupta <pekon@pek-sem.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 include/dt-bindings/clock/stih416-clks.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/stih416-clks.h b/include/dt-bindings/clock/stih416-clks.h
index f9bdbd1..3a8c979 100644
--- a/include/dt-bindings/clock/stih416-clks.h
+++ b/include/dt-bindings/clock/stih416-clks.h
@@ -7,10 +7,12 @@
 
 /* CLOCKGEN A0 */
 #define CLK_ICN_REG		0
+#define CLK_EMISS		3
 #define CLK_ETH1_PHY		4
 
 /* CLOCKGEN A1 */
 #define CLK_ICN_IF_2		0
 #define CLK_GMAC0_PHY		3
+#define CLK_NAND_CTRL		4
 
 #endif
-- 
1.9.1
