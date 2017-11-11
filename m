Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eDdD2-0004uQ-H0
 for linux-mtd@lists.infradead.org; Sat, 11 Nov 2017 21:21:04 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990633AbdKKVVAJ3kso (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Sat, 11 Nov 2017 22:21:00 +0100
Date: Sat, 11 Nov 2017 22:20:58 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Cc: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH v4 07/16] mtd: onenand: omap2: Account waiting time as
 waiting on IO
Message-ID: <20171111212058.3xkqfw42ik6pre47@lenoch>
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

Use wait_for_completion_io_timeout, which has an impact on how the
task is accounted in scheduling stats.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 Changes:
 -v4: new patch

 drivers/mtd/onenand/omap2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 883993bbe40b..0e7772e16d75 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -170,9 +170,8 @@ static int omap2_onenand_wait(struct mtd_info *mtd, int state)
 		if (result == 0) {
 			int retry_cnt = 0;
 retry:
-			result = wait_for_completion_timeout(&c->irq_done,
-						    msecs_to_jiffies(20));
-			if (result == 0) {
+			if (!wait_for_completion_io_timeout(&c->irq_done,
+						msecs_to_jiffies(20))) {
 				/* Timeout after 20ms */
 				ctrl = read_reg(c, ONENAND_REG_CTRL_STATUS);
 				if (ctrl & ONENAND_CTRL_ONGO &&
-- 
2.11.0
