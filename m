Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eDdCQ-0004uQ-N5
 for linux-mtd@lists.infradead.org; Sat, 11 Nov 2017 21:20:26 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990633AbdKKVUWVQ8io (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Sat, 11 Nov 2017 22:20:22 +0100
Date: Sat, 11 Nov 2017 22:20:20 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Cc: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH v4 06/16] mtd: onenand: omap2: Remove partitioning support
 from platform data
Message-ID: <20171111212020.mmz5wjogbctsgxas@lenoch>
References: <20171111211206.465pgorrjp3eyix6@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171111211206.465pgorrjp3eyix6@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No platform data user setups partitioning informations, so remove.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 Changes:
 -v2: new patch
 -v3: none
 -v4: none

 drivers/mtd/onenand/omap2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 93bd94337b35..883993bbe40b 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -703,8 +703,7 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 	if ((r = onenand_scan(&c->mtd, 1)) < 0)
 		goto err_release_dma;
 
-	r = mtd_device_register(&c->mtd, pdata ? pdata->parts : NULL,
-				pdata ? pdata->nr_parts : 0);
+	r = mtd_device_register(&c->mtd, NULL, 0);
 	if (r)
 		goto err_release_onenand;
 
-- 
2.11.0
