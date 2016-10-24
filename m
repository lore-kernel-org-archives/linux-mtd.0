Received: from mail1.bemta8.messagelabs.com ([216.82.243.198])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byenk-00046r-0Y
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 12:56:31 +0000
Subject: [PATCH v6 1/4] mtd: nand: Add a few more timings to nand_sdr_timings
To: linux-mtd <linux-mtd@lists.infradead.org>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>
References: <580E0318.5020004@sigmadesigns.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <580E0388.8010107@sigmadesigns.com>
Date: Mon, 24 Oct 2016 14:50:16 +0200
MIME-Version: 1.0
In-Reply-To: <580E0318.5020004@sigmadesigns.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris Brezillon <boris.brezillon@free-electrons.com>

Add the tR_max, tBERS_max, tPROG_max and tCCS_min timings to the
nand_sdr_timings struct.
Assign default/safe values for the statically defined timings, and
extract them from the ONFI parameter table if the NAND is ONFI
compliant.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_timings.c | 26 +++++++++++++++++++++++++-
 include/linux/mtd/nand.h        |  8 ++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/nand_timings.c
index 13a587407be3..f06312df3669 100644
--- a/drivers/mtd/nand/nand_timings.c
+++ b/drivers/mtd/nand/nand_timings.c
@@ -18,6 +18,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 	{
 		.type = NAND_SDR_IFACE,
 		.timings.sdr = {
+			.tCCS_min = 500000,
+			.tR_max = 200000000,
 			.tADL_min = 400000,
 			.tALH_min = 20000,
 			.tALS_min = 50000,
@@ -58,6 +60,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 	{
 		.type = NAND_SDR_IFACE,
 		.timings.sdr = {
+			.tCCS_min = 500000,
+			.tR_max = 200000000,
 			.tADL_min = 400000,
 			.tALH_min = 10000,
 			.tALS_min = 25000,
@@ -98,6 +102,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 	{
 		.type = NAND_SDR_IFACE,
 		.timings.sdr = {
+			.tCCS_min = 500000,
+			.tR_max = 200000000,
 			.tADL_min = 400000,
 			.tALH_min = 10000,
 			.tALS_min = 15000,
@@ -138,6 +144,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 	{
 		.type = NAND_SDR_IFACE,
 		.timings.sdr = {
+			.tCCS_min = 500000,
+			.tR_max = 200000000,
 			.tADL_min = 400000,
 			.tALH_min = 5000,
 			.tALS_min = 10000,
@@ -178,6 +186,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 	{
 		.type = NAND_SDR_IFACE,
 		.timings.sdr = {
+			.tCCS_min = 500000,
+			.tR_max = 200000000,
 			.tADL_min = 400000,
 			.tALH_min = 5000,
 			.tALS_min = 10000,
@@ -218,6 +228,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 	{
 		.type = NAND_SDR_IFACE,
 		.timings.sdr = {
+			.tCCS_min = 500000,
+			.tR_max = 200000000,
 			.tADL_min = 400000,
 			.tALH_min = 5000,
 			.tALS_min = 10000,
@@ -290,10 +302,22 @@ int onfi_init_data_interface(struct nand_chip *chip,
 	*iface = onfi_sdr_timings[timing_mode];
 
 	/*
-	 * TODO: initialize timings that cannot be deduced from timing mode:
+	 * Initialize timings that cannot be deduced from timing mode:
 	 * tR, tPROG, tCCS, ...
 	 * These information are part of the ONFI parameter page.
 	 */
+	if (chip->onfi_version) {
+		struct nand_onfi_params *params = &chip->onfi_params;
+		struct nand_sdr_timings *timings = &iface->timings.sdr;
+
+		/* microseconds -> picoseconds */
+		timings->tPROG_max = 1000000UL * le16_to_cpu(params->t_prog);
+		timings->tBERS_max = 1000000UL * le16_to_cpu(params->t_bers);
+		timings->tR_max = 1000000UL * le16_to_cpu(params->t_r);
+
+		/* nanoseconds -> picoseconds */
+		timings->tCCS_min = 1000UL * le16_to_cpu(params->t_ccs);
+	}
 
 	return 0;
 }
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c5d3d5024fc8..6fe83bce83a6 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -584,6 +584,10 @@ struct nand_buffers {
  *
  * All these timings are expressed in picoseconds.
  *
+ * @tBERS_max: Block erase time
+ * @tCCS_min: Change column setup time
+ * @tPROG_max: Page program time
+ * @tR_max: Page read time
  * @tALH_min: ALE hold time
  * @tADL_min: ALE to data loading time
  * @tALS_min: ALE setup time
@@ -621,6 +625,10 @@ struct nand_buffers {
  * @tWW_min: WP# transition to WE# low
  */
 struct nand_sdr_timings {
+	u32 tBERS_max;
+	u32 tCCS_min;
+	u32 tPROG_max;
+	u32 tR_max;
 	u32 tALH_min;
 	u32 tADL_min;
 	u32 tALS_min;
-- 
2.9.0
