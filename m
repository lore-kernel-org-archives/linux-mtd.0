From: Adrian Hunter <adrian.hunter@nokia.com>
To: Tony Lindgren <tony@atomide.com>
Date: Tue, 21 Dec 2010 21:44:48 +0200
Message-Id: <20101221194448.3127.32165.sendpatchset@ahunter-work.research.nokia.com>
In-Reply-To: <20101221194433.3127.74744.sendpatchset@ahunter-work.research.nokia.com>
References: <20101221194433.3127.74744.sendpatchset@ahunter-work.research.nokia.com>
Subject: [PATCH 2/2] OMAP2/3: OneNAND: add 104MHz support
Cc: Felipe Balbi <balbi@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	linux-omap Mailing List <linux-omap@vger.kernel.org>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 18fc2304f7e779b6a617595db1b465bdf38f330c Mon Sep 17 00:00:00 2001
From: Adrian Hunter <adrian.hunter@nokia.com>
Date: Thu, 9 Dec 2010 11:22:50 +0200
Subject: [PATCH 2/2] OMAP2/3: OneNAND: add 104MHz support

Add GPMC timings for 104MHz OneNAND.

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
---
 arch/arm/mach-omap2/gpmc-onenand.c |    9 +++++++++
 drivers/mtd/onenand/omap2.c        |    3 +++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-omap2/gpmc-onenand.c b/arch/arm/mach-omap2/gpmc-onenand.c
index 1db606c..3a7d25f 100644
--- a/arch/arm/mach-omap2/gpmc-onenand.c
+++ b/arch/arm/mach-omap2/gpmc-onenand.c
@@ -173,6 +173,15 @@ static int omap2_onenand_set_sync_mode(struct omap_onenand_platform_data *cfg,
 	}
 
 	switch (freq) {
+	case 104:
+		min_gpmc_clk_period = 9600; /* 104 MHz */
+		t_ces   = 3;
+		t_avds  = 4;
+		t_avdh  = 2;
+		t_ach   = 3;
+		t_aavdh = 6;
+		t_rdyo  = 9;
+		break;
 	case 83:
 		min_gpmc_clk_period = 12000; /* 83 MHz */
 		t_ces   = 5;
diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 9f322f1..d0894ca 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -721,6 +721,9 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 	case 3:
 		c->freq = 83;
 		break;
+	case 4:
+		c->freq = 104;
+		break;
 	}
 
 #ifdef CONFIG_MTD_PARTITIONS
-- 
1.7.0.4
