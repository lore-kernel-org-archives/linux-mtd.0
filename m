Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eF0Wc-0002sZ-1L
 for linux-mtd@lists.infradead.org; Wed, 15 Nov 2017 16:26:57 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23992186AbdKOQ0xcaV3T (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Wed, 15 Nov 2017 17:26:53 +0100
Date: Wed, 15 Nov 2017 17:26:43 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Cc: Roger Quadros <rogerq@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>
Subject: [PATCH v5 03/16] ARM: dts: omap3-igep: Update onenand node timings
Message-ID: <20171115162643.tptv7w4jkudyzyox@lenoch>
References: <20171115162306.2o2w2yrf7wucroxd@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171115162306.2o2w2yrf7wucroxd@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update node timings to be compatible with actual chip used -
gpmc_cs_show_timings utilized to dump values.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Acked-by: Roger Quadros <rogerq@ti.com>
Acked-by: Tony Lindgren <tony@atomide.com>
---

Changes in v5: None
Changes in v4:
- new patch

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/omap3-igep.dtsi | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-igep.dtsi b/arch/arm/boot/dts/omap3-igep.dtsi
index 4929ba1cb9d3..1e4b8d5c7572 100644
--- a/arch/arm/boot/dts/omap3-igep.dtsi
+++ b/arch/arm/boot/dts/omap3-igep.dtsi
@@ -144,32 +144,32 @@
 		gpmc,sync-read;
 		gpmc,sync-write;
 		gpmc,burst-length = <16>;
-		gpmc,burst-read;
 		gpmc,burst-wrap;
+		gpmc,burst-read;
 		gpmc,burst-write;
 		gpmc,device-width = <2>; /* GPMC_DEVWIDTH_16BIT */
 		gpmc,mux-add-data = <2>; /* GPMC_MUX_AD */
 		gpmc,cs-on-ns = <0>;
-		gpmc,cs-rd-off-ns = <87>;
-		gpmc,cs-wr-off-ns = <87>;
+		gpmc,cs-rd-off-ns = <96>;
+		gpmc,cs-wr-off-ns = <96>;
 		gpmc,adv-on-ns = <0>;
-		gpmc,adv-rd-off-ns = <10>;
-		gpmc,adv-wr-off-ns = <10>;
-		gpmc,oe-on-ns = <15>;
-		gpmc,oe-off-ns = <87>;
+		gpmc,adv-rd-off-ns = <12>;
+		gpmc,adv-wr-off-ns = <12>;
+		gpmc,oe-on-ns = <18>;
+		gpmc,oe-off-ns = <96>;
 		gpmc,we-on-ns = <0>;
-		gpmc,we-off-ns = <87>;
-		gpmc,rd-cycle-ns = <112>;
-		gpmc,wr-cycle-ns = <112>;
-		gpmc,access-ns = <81>;
-		gpmc,page-burst-access-ns = <15>;
+		gpmc,we-off-ns = <96>;
+		gpmc,rd-cycle-ns = <114>;
+		gpmc,wr-cycle-ns = <114>;
+		gpmc,access-ns = <90>;
+		gpmc,page-burst-access-ns = <12>;
 		gpmc,bus-turnaround-ns = <0>;
 		gpmc,cycle2cycle-delay-ns = <0>;
 		gpmc,wait-monitoring-ns = <0>;
-		gpmc,clk-activation-ns = <5>;
+		gpmc,clk-activation-ns = <6>;
 		gpmc,wr-data-mux-bus-ns = <30>;
-		gpmc,wr-access-ns = <81>;
-		gpmc,sync-clk-ps = <15000>;
+		gpmc,wr-access-ns = <90>;
+		gpmc,sync-clk-ps = <12000>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.11.0
