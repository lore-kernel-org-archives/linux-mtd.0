Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCpDp-0001fD-D7
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 14:21:42 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 1/2] mtd: nand: timings: Fix tADL_min for ONFI 4.0 chips
Date: Tue, 14 Jun 2016 16:21:06 +0200
Message-Id: <1465914067-29736-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ONFI 4.0 spec defines different values for the tADL_min timing.
Since we don't want to have different timings depending on the ONFI
version, we just set tADL_min to the maximum value (the one specified
in the ONFI 4.0 spec).

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_timings.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/nand_timings.c
index e81470a..c0941d5 100644
--- a/drivers/mtd/nand/nand_timings.c
+++ b/drivers/mtd/nand/nand_timings.c
@@ -16,7 +16,7 @@
 static const struct nand_sdr_timings onfi_sdr_timings[] = {
 	/* Mode 0 */
 	{
-		.tADL_min = 200000,
+		.tADL_min = 400000,
 		.tALH_min = 20000,
 		.tALS_min = 50000,
 		.tAR_min = 25000,
@@ -53,7 +53,7 @@ static const struct nand_sdr_timings onfi_sdr_timings[] = {
 	},
 	/* Mode 1 */
 	{
-		.tADL_min = 100000,
+		.tADL_min = 400000,
 		.tALH_min = 10000,
 		.tALS_min = 25000,
 		.tAR_min = 10000,
@@ -90,7 +90,7 @@ static const struct nand_sdr_timings onfi_sdr_timings[] = {
 	},
 	/* Mode 2 */
 	{
-		.tADL_min = 100000,
+		.tADL_min = 400000,
 		.tALH_min = 10000,
 		.tALS_min = 15000,
 		.tAR_min = 10000,
@@ -127,7 +127,7 @@ static const struct nand_sdr_timings onfi_sdr_timings[] = {
 	},
 	/* Mode 3 */
 	{
-		.tADL_min = 100000,
+		.tADL_min = 400000,
 		.tALH_min = 5000,
 		.tALS_min = 10000,
 		.tAR_min = 10000,
@@ -164,7 +164,7 @@ static const struct nand_sdr_timings onfi_sdr_timings[] = {
 	},
 	/* Mode 4 */
 	{
-		.tADL_min = 70000,
+		.tADL_min = 400000,
 		.tALH_min = 5000,
 		.tALS_min = 10000,
 		.tAR_min = 10000,
@@ -201,7 +201,7 @@ static const struct nand_sdr_timings onfi_sdr_timings[] = {
 	},
 	/* Mode 5 */
 	{
-		.tADL_min = 70000,
+		.tADL_min = 400000,
 		.tALH_min = 5000,
 		.tALS_min = 10000,
 		.tAR_min = 10000,
-- 
2.7.4
