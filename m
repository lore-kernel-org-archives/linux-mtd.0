From: Adrian Hunter <adrian.hunter@nokia.com>
To: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 4/4] mtd: OneNAND: OMAP2: increase multiblock erase verify
	timeout
Date: Mon,  7 Feb 2011 10:47:01 +0200
Message-Id: <1297068421-14430-5-git-send-email-adrian.hunter@nokia.com>
In-Reply-To: <1297068421-14430-1-git-send-email-adrian.hunter@nokia.com>
References: <1297068421-14430-1-git-send-email-adrian.hunter@nokia.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	linux-omap Mailing List <linux-omap@vger.kernel.org>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Roman Tereshonkov <roman.tereshonkov@nokia.com>

The current multiblock erase verify read timeout 100us is the maximum
for none-error case. If errors happen during multibock erase then
the specification recommends to run multiblock erase verify command
with maximum timeout 10ms (see specs. for KFM4G16Q2A and KFN8G16Q2A).

For the most common non-error case we wait 100us in udelay polling
loop. In case of timeout the interrupt mode is used to wait for the
command end.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/onenand/omap2.c |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 3e1bb95..ec26399 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -148,11 +148,9 @@ static int omap2_onenand_wait(struct mtd_info *mtd, int state)
 			wait_err("controller error", state, ctrl, intr);
 			return -EIO;
 		}
-		if ((intr & intr_flags) != intr_flags) {
-			wait_err("timeout", state, ctrl, intr);
-			return -EIO;
-		}
-		return 0;
+		if ((intr & intr_flags) == intr_flags)
+			return 0;
+		/* Continue in wait for interrupt branch */
 	}
 
 	if (state != FL_READING) {
-- 
1.7.0.4
