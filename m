Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEDAD-0005U0-3Q
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 12:16:47 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: add default values for dynamic timings
Date: Thu,  3 May 2018 14:16:20 +0200
Message-Id: <20180503121620.13450-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some timings like tBERS (block erase time), tCCs (change column setup
time), tPROG (page program time) and tR (page read time) are derived
from the ONFI parameter page. They are set in the SDR interface only
under certain circumstances: the chip is ONFI compliant and
->setup_data_interface() is populated.

The former makes the use of these timings unreliable if the driver uses
one of these four values with a non-ONFI chip, while the latter is a
problem for drivers not populating ->setup_data_interface() hook but
using these delays nonetheless in the code.

Fix this situation by taking the highest possible value for each
timing (stored as unsigned 16-bit entries in the parameter page).

This makes tBERS, tPROG and tR maximum times being ~65ms while typical
values are at most a few milliseconds. As these are timeouts, it is not
impacting at all on the performances in nominal use.

tCCS minimum time (delay to wait after a change column) becomes ~65us
while typical values are a few hundred nanoseconds. This might have an
impact depending on the driver's implementation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_timings.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index 7c4e4a371bbc..848446f8004c 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -13,6 +13,8 @@
 #include <linux/export.h>
 #include <linux/mtd/rawnand.h>
 
+#define ONFI_DYN_TIMING_MAX U16_MAX
+
 static const struct nand_data_interface onfi_sdr_timings[] = {
 	/* Mode 0 */
 	{
@@ -24,6 +26,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tALH_min = 20000,
 			.tALS_min = 50000,
 			.tAR_min = 25000,
+			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tCCS_min = 1000UL * ONFI_DYN_TIMING_MAX,
 			.tCEA_max = 100000,
 			.tCEH_min = 20000,
 			.tCH_min = 20000,
@@ -38,6 +42,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tFEAT_max = 1000000,
 			.tIR_min = 10000,
 			.tITC_max = 1000000,
+			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tR_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tRC_min = 100000,
 			.tREA_max = 40000,
 			.tREH_min = 30000,
@@ -66,6 +72,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tALH_min = 10000,
 			.tALS_min = 25000,
 			.tAR_min = 10000,
+			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tCCS_min = 1000UL * ONFI_DYN_TIMING_MAX,
 			.tCEA_max = 45000,
 			.tCEH_min = 20000,
 			.tCH_min = 10000,
@@ -80,6 +88,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tFEAT_max = 1000000,
 			.tIR_min = 0,
 			.tITC_max = 1000000,
+			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tR_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tRC_min = 50000,
 			.tREA_max = 30000,
 			.tREH_min = 15000,
@@ -108,6 +118,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tALH_min = 10000,
 			.tALS_min = 15000,
 			.tAR_min = 10000,
+			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tCCS_min = 1000UL * ONFI_DYN_TIMING_MAX,
 			.tCEA_max = 30000,
 			.tCEH_min = 20000,
 			.tCH_min = 10000,
@@ -122,6 +134,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tFEAT_max = 1000000,
 			.tIR_min = 0,
 			.tITC_max = 1000000,
+			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tR_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tRC_min = 35000,
 			.tREA_max = 25000,
 			.tREH_min = 15000,
@@ -150,6 +164,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tALH_min = 5000,
 			.tALS_min = 10000,
 			.tAR_min = 10000,
+			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tCCS_min = 1000UL * ONFI_DYN_TIMING_MAX,
 			.tCEA_max = 25000,
 			.tCEH_min = 20000,
 			.tCH_min = 5000,
@@ -164,6 +180,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tFEAT_max = 1000000,
 			.tIR_min = 0,
 			.tITC_max = 1000000,
+			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tR_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tRC_min = 30000,
 			.tREA_max = 20000,
 			.tREH_min = 10000,
@@ -192,6 +210,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tALH_min = 5000,
 			.tALS_min = 10000,
 			.tAR_min = 10000,
+			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tCCS_min = 1000UL * ONFI_DYN_TIMING_MAX,
 			.tCEA_max = 25000,
 			.tCEH_min = 20000,
 			.tCH_min = 5000,
@@ -206,6 +226,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tFEAT_max = 1000000,
 			.tIR_min = 0,
 			.tITC_max = 1000000,
+			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tR_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tRC_min = 25000,
 			.tREA_max = 20000,
 			.tREH_min = 10000,
@@ -234,6 +256,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tALH_min = 5000,
 			.tALS_min = 10000,
 			.tAR_min = 10000,
+			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tCCS_min = 1000UL * ONFI_DYN_TIMING_MAX,
 			.tCEA_max = 25000,
 			.tCEH_min = 20000,
 			.tCH_min = 5000,
@@ -248,6 +272,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tFEAT_max = 1000000,
 			.tIR_min = 0,
 			.tITC_max = 1000000,
+			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tR_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tRC_min = 20000,
 			.tREA_max = 16000,
 			.tREH_min = 7000,
-- 
2.14.1
