Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KXXua-00046f-98
	for linux-mtd@lists.infradead.org; Mon, 25 Aug 2008 08:58:56 +0000
Message-ID: <48B274EB.4080004@nokia.com>
Date: Mon, 25 Aug 2008 12:01:31 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] [OneNAND] OMAP2: add retry after read timeout
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Very occasionally, (about one in a million) read operations are
ongoing after the timeout has expired.  So, retry three times
while the ongoing bit remains set.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/omap2.c |   26 +++++++++++++++++++++++---
 1 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 34b4253..8387e05 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -187,16 +187,36 @@ retry:
 			}
 		}
 	} else {
+		int retry_cnt = 0;
+
 		/* Turn interrupts off */
 		syscfg = read_reg(c, ONENAND_REG_SYS_CFG1);
 		syscfg &= ~ONENAND_SYS_CFG1_IOBE;
 		write_reg(c, syscfg, ONENAND_REG_SYS_CFG1);
 
 		timeout = jiffies + msecs_to_jiffies(20);
-		while (time_before(jiffies, timeout)) {
-			intr = read_reg(c, ONENAND_REG_INTERRUPT);
-			if (intr & ONENAND_INT_MASTER)
+		while (1) {
+			if (time_before(jiffies, timeout)) {
+				intr = read_reg(c, ONENAND_REG_INTERRUPT);
+				if (intr & ONENAND_INT_MASTER)
+					break;
+			} else {
+				/* Timeout after 20ms */
+				ctrl = read_reg(c, ONENAND_REG_CTRL_STATUS);
+				if (ctrl & ONENAND_CTRL_ONGO) {
+					/*
+					 * The operation seems to be still going
+					 * so give it some more time.
+					 */
+					retry_cnt += 1;
+					if (retry_cnt < 3) {
+						timeout = jiffies +
+							  msecs_to_jiffies(20);
+						continue;
+					}
+				}
 				break;
+			}
 		}
 	}
 
-- 
1.5.4.3
