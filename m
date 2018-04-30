Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fD47z-0003IS-D9
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2018 08:25:44 +0000
Received: by mail-wm0-x241.google.com with SMTP id f8so2316647wmc.4
 for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2018 01:25:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 09/12] ARM: davinci: dm646x-evm: specify the chipselect in
 davinci_nand_pdata
Date: Mon, 30 Apr 2018 10:24:50 +0200
Message-Id: <20180430082453.8091-10-brgl@bgdev.pl>
In-Reply-To: <20180430082453.8091-1-brgl@bgdev.pl>
References: <20180430082453.8091-1-brgl@bgdev.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We now have the core_chipsel field in davinci_nand_pdata. Use it
instead of the platform_device id number.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-dm646x-evm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index d672804df817..37c9e0ee4dcc 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -84,6 +84,7 @@ static struct davinci_aemif_timing dm6467tevm_nandflash_timing = {
 };
 
 static struct davinci_nand_pdata davinci_nand_data = {
+	.core_chipsel		= 0,
 	.mask_cle 		= 0x80000,
 	.mask_ale 		= 0x40000,
 	.parts			= davinci_nand_partitions,
-- 
2.17.0
