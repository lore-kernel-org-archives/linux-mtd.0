Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PS7PP-00039q-Ew
	for linux-mtd@lists.infradead.org; Mon, 13 Dec 2010 12:21:44 +0000
From: Adrian Hunter <adrian.hunter@nokia.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 13 Dec 2010 14:21:14 +0200
Message-Id: <20101213122114.20685.55182.sendpatchset@ahunter-work.research.nokia.com>
In-Reply-To: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>
References: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>
Subject: [PATCH 5/7] OMAP2/3: OneNAND: add 104MHz support
Cc: Tony Lindgren <tony@atomide.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	Adrian Hunter <adrian.hunter@nokia.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From ab0260a2cc3b17b98fa918dee34e129c3ff2b9b6 Mon Sep 17 00:00:00 2001
From: Adrian Hunter <adrian.hunter@nokia.com>
Date: Thu, 9 Dec 2010 11:22:50 +0200
Subject: [PATCH 5/7] OMAP2/3: OneNAND: add 104MHz support

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
index 1a07bfc..ac31f46 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -767,6 +767,9 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
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
