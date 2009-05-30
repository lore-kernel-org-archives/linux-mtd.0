Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=teyla.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MASe2-0003bI-L9
	for linux-mtd@lists.infradead.org; Sat, 30 May 2009 17:47:36 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [MTD] [NAND] S3C2410: Basic kerneldoc comment updates
Date: Sat, 30 May 2009 18:41:29 +0100
Message-Id: <1243705298-21814-3-git-send-email-ben-linux@fluff.org>
In-Reply-To: <1243705298-21814-2-git-send-email-ben-linux@fluff.org>
References: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-2-git-send-email-ben-linux@fluff.org>
Cc: Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move to using kerneldoc style commenting in the driver

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/mtd/nand/s3c2410.c |   89 ++++++++++++++++++++++++++++++++++++++-----
 1 files changed, 78 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index b7f0740..a2d1c70 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -74,6 +74,14 @@ static struct nand_ecclayout nand_hw_eccoob = {
 
 struct s3c2410_nand_info;
 
+/**
+ * struct s3c2410_nand_mtd - driver MTD structure
+ * @mtd: The MTD instance to pass to the MTD layer.
+ * @chip: The NAND chip information.
+ * @set: The platform information supplied for this set of NAND chips.
+ * @info: Link back to the hardware information.
+ * @scan_res: The result from calling nand_scan_ident().
+*/
 struct s3c2410_nand_mtd {
 	struct mtd_info			mtd;
 	struct nand_chip		chip;
@@ -90,6 +98,21 @@ enum s3c_cpu_type {
 
 /* overview of the s3c2410 nand state */
 
+/**
+ * struct s3c2410_nand_info - NAND controller state.
+ * @mtds: An array of MTD instances on this controoler.
+ * @platform: The platform data for this board.
+ * @device: The platform device we bound to.
+ * @area: The IO area resource that came from request_mem_region().
+ * @clk: The clock resource for this controller.
+ * @regs: The area mapped for the hardware registers described by @area.
+ * @sel_reg: Pointer to the register controlling the NAND selection.
+ * @sel_bit: The bit in @sel_reg to select the NAND chip.
+ * @mtd_count: The number of MTDs created from this controller.
+ * @save_sel: The contents of @sel_reg to be saved over suspend.
+ * @clk_rate: The clock rate from @clk.
+ * @cpu_type: The exact type of this controller.
+ */
 struct s3c2410_nand_info {
 	/* mtd info */
 	struct nand_hw_control		controller;
@@ -145,6 +168,14 @@ static inline int allow_clk_stop(struct s3c2410_nand_info *info)
 
 #define NS_IN_KHZ 1000000
 
+/**
+ * s3c_nand_calc_rate - calculate timing data.
+ * @wanted: The cycle time in nanoseconds.
+ * @clk: The clock rate in kHz.
+ * @max: The maximum divider value.
+ *
+ * Calculate the timing value from the given parameters.
+ */
 static int s3c_nand_calc_rate(int wanted, unsigned long clk, int max)
 {
 	int result;
@@ -169,6 +200,14 @@ static int s3c_nand_calc_rate(int wanted, unsigned long clk, int max)
 
 /* controller setup */
 
+/**
+ * s3c2410_nand_setrate - setup controller timing information.
+ * @info: The controller instance.
+ *
+ * Given the information supplied by the platform, calculate and set
+ * the necessary timing registers in the hardware to generate the
+ * necessary timing cycles to the hardware.
+ */
 static int s3c2410_nand_setrate(struct s3c2410_nand_info *info)
 {
 	struct s3c2410_platform_nand *plat = info->platform;
@@ -245,6 +284,13 @@ static int s3c2410_nand_setrate(struct s3c2410_nand_info *info)
 	return 0;
 }
 
+/**
+ * s3c2410_nand_inithw - basic hardware initialisation
+ * @info: The hardware state.
+ *
+ * Do the basic initialisation of the hardware, using s3c2410_nand_setrate()
+ * to setup the hardware access speeds and set the controller to be enabled.
+*/
 static int s3c2410_nand_inithw(struct s3c2410_nand_info *info)
 {
 	int ret;
@@ -268,8 +314,19 @@ static int s3c2410_nand_inithw(struct s3c2410_nand_info *info)
 	return 0;
 }
 
-/* select chip */
-
+/**
+ * s3c2410_nand_select_chip - select the given nand chip
+ * @mtd: The MTD instance for this chip.
+ * @chip: The chip number.
+ *
+ * This is called by the MTD layer to either select a given chip for the
+ * @mtd instance, or to indicate that the access has finished and the
+ * chip can be de-selected.
+ *
+ * The routine ensures that the nFCE line is correctly setup, and any
+ * platform specific selection code is called to route nFCE to the specific
+ * chip.
+ */
 static void s3c2410_nand_select_chip(struct mtd_info *mtd, int chip)
 {
 	struct s3c2410_nand_info *info;
@@ -667,11 +724,16 @@ static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 }
 #endif
 
-/* s3c2410_nand_init_chip
+/**
+ * s3c2410_nand_init_chip - initialise a single instance of an chip
+ * @info: The base NAND controller the chip is on.
+ * @nmtd: The new controller MTD instance to fill in.
+ * @set: The information passed from the board specific platform data.
  *
- * init a single instance of an chip
-*/
-
+ * Initialise the given @nmtd from the information in @info and @set. This
+ * readies the structure for use with the MTD layer functions by ensuring
+ * all pointers are setup and the necessary control routines selected.
+ */
 static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
 				   struct s3c2410_nand_mtd *nmtd,
 				   struct s3c2410_nand_set *set)
@@ -759,12 +821,17 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
 		chip->ecc.mode	= NAND_ECC_NONE;
 }
 
-/* s3c2410_nand_update_chip
+/**
+ * s3c2410_nand_update_chip - post probe update
+ * @info: The controller instance.
+ * @nmtd: The driver version of the MTD instance.
  *
- * post-probe chip update, to change any items, such as the
- * layout for large page nand
- */
-
+ * This routine is called after the chip probe has succesfully completed
+ * and the relevant per-chip information updated. This call ensure that
+ * we update the internal state accordingly.
+ *
+ * The internal state is currently limited to the ECC state information.
+*/
 static void s3c2410_nand_update_chip(struct s3c2410_nand_info *info,
 				     struct s3c2410_nand_mtd *nmtd)
 {
-- 
1.5.6.5
