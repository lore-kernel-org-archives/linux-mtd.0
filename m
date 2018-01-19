Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ecXOn-0007XV-So
 for linux-mtd@lists.infradead.org; Fri, 19 Jan 2018 14:12:09 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] mtd: nand: gpmi: Use core timings instead of an empirical
 derivation
Date: Fri, 19 Jan 2018 15:11:06 +0100
Message-Id: <20180119141106.18067-1-miquel.raynal@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

GPMI driver timings derivation looks very empirical and does not use
the known timings that the core wants to use with the NAND chip, by
using local defined constants that have no special meaning from the
outside world.

Simplify the way all of this is computed and use the NAND core's SDR
timings.

Integrity of the reads/writes has been checked with nandbiterrs, speed
improvements with flash_speed on a Freescale i.MX6 DualLite/Solo SABRE
Automotive Board. Measures are below, variations of less than 150kiB/s
between tests are common and then not significant. Speeds using mode 5
are the same, while speeds using mode 0 are quite improved (+40/50%
from non-optimal computation).

Forcing timings mode 0:
=======================

Before this patch:
------------------
eraseblock write speed is 2298 KiB/s
eraseblock read speed is 3636 KiB/s
page write speed is 2136 KiB/s
page read speed is 3316 KiB/s
2 page write speed is 2199 KiB/s
2 page read speed is 3468 KiB/s

After this patch:
-----------------
eraseblock write speed is 3232 KiB/s
eraseblock read speed is 5663 KiB/s
page write speed is 2915 KiB/s
page read speed is 4904 KiB/s
2 page write speed is 3084 KiB/s
2 page read speed is 5267 KiB/s

Forcing timings mode 5:
=======================

Before this patch:
------------------
eraseblock write speed is 4338 KiB/s
eraseblock read speed is 14883 KiB/s
page write speed is 3786 KiB/s
page read speed is 12800 KiB/s
2 page write speed is 4076 KiB/s
2 page read speed is 14065 KiB/s

After this patch:
-----------------
eraseblock write speed is 4309 KiB/s
eraseblock read speed is 14712 KiB/s
page write speed is 3764 KiB/s
page read speed is 12673 KiB/s
2 page write speed is 4076 KiB/s
2 page read speed is 14065 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---


Hello,

This patch applies after this series that adds support in the GPMI
driver for ->setup_data_interface() available at [1].

Thanks,
Miquèl

[1] http://lists.infradead.org/pipermail/linux-mtd/2018-January/078924.html


 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 608 +++++----------------------------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  40 +--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 103 +-----
 drivers/mtd/nand/gpmi-nand/gpmi-regs.h |   5 +
 4 files changed, 99 insertions(+), 657 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 9a58661eb3b1..d55e838f377d 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -26,15 +26,8 @@
 #include "gpmi-regs.h"
 #include "bch-regs.h"
 
-static struct timing_threshold timing_default_threshold = {
-	.max_data_setup_cycles       = (BM_GPMI_TIMING0_DATA_SETUP >>
-						BP_GPMI_TIMING0_DATA_SETUP),
-	.internal_data_setup_in_ns   = 0,
-	.max_sample_delay_factor     = (BM_GPMI_CTRL1_RDN_DELAY >>
-						BP_GPMI_CTRL1_RDN_DELAY),
-	.max_dll_clock_period_in_ns  = 32,
-	.max_dll_delay_in_ns         = 16,
-};
+/* Converts time to clock cycles */
+#define TO_CYCLES(duration, period) DIV_ROUND_UP_ULL(duration, period)
 
 #define MXS_SET_ADDR		0x4
 #define MXS_CLR_ADDR		0x8
@@ -181,7 +174,6 @@ int gpmi_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_out;
 
-
 	/* Choose NAND mode. */
 	writel(BM_GPMI_CTRL1_GPMI_MODE, r->gpmi_regs + HW_GPMI_CTRL1_CLR);
 
@@ -320,399 +312,6 @@ int bch_set_geometry(struct gpmi_nand_data *this)
 	return ret;
 }
 
-/* Converts time in nanoseconds to cycles. */
-static unsigned int ns_to_cycles(unsigned int time,
-			unsigned int period, unsigned int min)
-{
-	unsigned int k;
-
-	k = (time + period - 1) / period;
-	return max(k, min);
-}
-
-#define DEF_MIN_PROP_DELAY	5
-#define DEF_MAX_PROP_DELAY	9
-/* Apply timing to current hardware conditions. */
-static void
-gpmi_nfc_compute_hardware_timings(struct gpmi_nand_data *this)
-{
-	struct gpmi_nfc_hardware_timing *hw = &this->hw;
-	struct timing_threshold *nfc = &timing_default_threshold;
-	struct nand_chip *nand = &this->nand;
-	struct nand_timing target = this->timing;
-	unsigned long clock_frequency_in_hz;
-	unsigned int clock_period_in_ns;
-	bool dll_use_half_periods;
-	unsigned int dll_delay_shift;
-	unsigned int max_sample_delay_in_ns;
-	unsigned int address_setup_in_cycles;
-	unsigned int data_setup_in_ns;
-	unsigned int data_setup_in_cycles;
-	unsigned int data_hold_in_cycles;
-	int ideal_sample_delay_in_ns;
-	unsigned int sample_delay_factor;
-	int tEYE;
-	unsigned int min_prop_delay_in_ns = DEF_MIN_PROP_DELAY;
-	unsigned int max_prop_delay_in_ns = DEF_MAX_PROP_DELAY;
-
-	/* Clock rate for non-EDO modes */
-	hw->clk_rate = 22000000;
-
-	/*
-	 * If there are multiple chips, we need to relax the timings to allow
-	 * for signal distortion due to higher capacitance.
-	 */
-	if (nand->numchips > 2) {
-		target.data_setup_in_ns    += 10;
-		target.data_hold_in_ns     += 10;
-		target.address_setup_in_ns += 10;
-	} else if (nand->numchips > 1) {
-		target.data_setup_in_ns    += 5;
-		target.data_hold_in_ns     += 5;
-		target.address_setup_in_ns += 5;
-	}
-
-	/* Inspect the clock. */
-	nfc->clock_frequency_in_hz = hw->clk_rate;
-	clock_frequency_in_hz = nfc->clock_frequency_in_hz;
-	clock_period_in_ns    = NSEC_PER_SEC / clock_frequency_in_hz;
-
-	/*
-	 * The NFC quantizes setup and hold parameters in terms of clock cycles.
-	 * Here, we quantize the setup and hold timing parameters to the
-	 * next-highest clock period to make sure we apply at least the
-	 * specified times.
-	 *
-	 * For data setup and data hold, the hardware interprets a value of zero
-	 * as the largest possible delay. This is not what's intended by a zero
-	 * in the input parameter, so we impose a minimum of one cycle.
-	 */
-	data_setup_in_cycles    = ns_to_cycles(target.data_setup_in_ns,
-							clock_period_in_ns, 1);
-	data_hold_in_cycles     = ns_to_cycles(target.data_hold_in_ns,
-							clock_period_in_ns, 1);
-	address_setup_in_cycles = ns_to_cycles(target.address_setup_in_ns,
-							clock_period_in_ns, 0);
-
-	/*
-	 * The clock's period affects the sample delay in a number of ways:
-	 *
-	 * (1) The NFC HAL tells us the maximum clock period the sample delay
-	 *     DLL can tolerate. If the clock period is greater than half that
-	 *     maximum, we must configure the DLL to be driven by half periods.
-	 *
-	 * (2) We need to convert from an ideal sample delay, in ns, to a
-	 *     "sample delay factor," which the NFC uses. This factor depends on
-	 *     whether we're driving the DLL with full or half periods.
-	 *     Paraphrasing the reference manual:
-	 *
-	 *         AD = SDF x 0.125 x RP
-	 *
-	 * where:
-	 *
-	 *     AD   is the applied delay, in ns.
-	 *     SDF  is the sample delay factor, which is dimensionless.
-	 *     RP   is the reference period, in ns, which is a full clock period
-	 *          if the DLL is being driven by full periods, or half that if
-	 *          the DLL is being driven by half periods.
-	 *
-	 * Let's re-arrange this in a way that's more useful to us:
-	 *
-	 *                        8
-	 *         SDF  =  AD x ----
-	 *                       RP
-	 *
-	 * The reference period is either the clock period or half that, so this
-	 * is:
-	 *
-	 *                        8       AD x DDF
-	 *         SDF  =  AD x -----  =  --------
-	 *                      f x P        P
-	 *
-	 * where:
-	 *
-	 *       f  is 1 or 1/2, depending on how we're driving the DLL.
-	 *       P  is the clock period.
-	 *     DDF  is the DLL Delay Factor, a dimensionless value that
-	 *          incorporates all the constants in the conversion.
-	 *
-	 * DDF will be either 8 or 16, both of which are powers of two. We can
-	 * reduce the cost of this conversion by using bit shifts instead of
-	 * multiplication or division. Thus:
-	 *
-	 *                 AD << DDS
-	 *         SDF  =  ---------
-	 *                     P
-	 *
-	 *     or
-	 *
-	 *         AD  =  (SDF >> DDS) x P
-	 *
-	 * where:
-	 *
-	 *     DDS  is the DLL Delay Shift, the logarithm to base 2 of the DDF.
-	 */
-	if (clock_period_in_ns > (nfc->max_dll_clock_period_in_ns >> 1)) {
-		dll_use_half_periods = true;
-		dll_delay_shift      = 3 + 1;
-	} else {
-		dll_use_half_periods = false;
-		dll_delay_shift      = 3;
-	}
-
-	/*
-	 * Compute the maximum sample delay the NFC allows, under current
-	 * conditions. If the clock is running too slowly, no sample delay is
-	 * possible.
-	 */
-	if (clock_period_in_ns > nfc->max_dll_clock_period_in_ns)
-		max_sample_delay_in_ns = 0;
-	else {
-		/*
-		 * Compute the delay implied by the largest sample delay factor
-		 * the NFC allows.
-		 */
-		max_sample_delay_in_ns =
-			(nfc->max_sample_delay_factor * clock_period_in_ns) >>
-								dll_delay_shift;
-
-		/*
-		 * Check if the implied sample delay larger than the NFC
-		 * actually allows.
-		 */
-		if (max_sample_delay_in_ns > nfc->max_dll_delay_in_ns)
-			max_sample_delay_in_ns = nfc->max_dll_delay_in_ns;
-	}
-
-	/*
-	 * Fold the read setup time required by the NFC into the maximum
-	 * propagation delay.
-	 */
-	max_prop_delay_in_ns += nfc->internal_data_setup_in_ns;
-
-	/*
-	 * Earlier, we computed the number of clock cycles required to satisfy
-	 * the data setup time. Now, we need to know the actual nanoseconds.
-	 */
-	data_setup_in_ns = clock_period_in_ns * data_setup_in_cycles;
-
-	/*
-	 * Compute tEYE, the width of the data eye when reading from the NAND
-	 * Flash. The eye width is fundamentally determined by the data setup
-	 * time, perturbed by propagation delays and some characteristics of the
-	 * NAND Flash device.
-	 *
-	 * start of the eye = max_prop_delay + tREA
-	 * end of the eye   = min_prop_delay + tRHOH + data_setup
-	 */
-	tEYE = (int)min_prop_delay_in_ns + (int)target.tRHOH_in_ns +
-							(int)data_setup_in_ns;
-
-	tEYE -= (int)max_prop_delay_in_ns + (int)target.tREA_in_ns;
-
-	/*
-	 * The eye must be open. If it's not, we can try to open it by
-	 * increasing its main forcer, the data setup time.
-	 *
-	 * In each iteration of the following loop, we increase the data setup
-	 * time by a single clock cycle. We do this until either the eye is
-	 * open or we run into NFC limits.
-	 */
-	while ((tEYE <= 0) &&
-			(data_setup_in_cycles < nfc->max_data_setup_cycles)) {
-		/* Give a cycle to data setup. */
-		data_setup_in_cycles++;
-		/* Synchronize the data setup time with the cycles. */
-		data_setup_in_ns += clock_period_in_ns;
-		/* Adjust tEYE accordingly. */
-		tEYE += clock_period_in_ns;
-	}
-
-	/*
-	 * When control arrives here, the eye is open. The ideal time to sample
-	 * the data is in the center of the eye:
-	 *
-	 *     end of the eye + start of the eye
-	 *     ---------------------------------  -  data_setup
-	 *                    2
-	 *
-	 * After some algebra, this simplifies to the code immediately below.
-	 */
-	ideal_sample_delay_in_ns =
-		((int)max_prop_delay_in_ns +
-			(int)target.tREA_in_ns +
-				(int)min_prop_delay_in_ns +
-					(int)target.tRHOH_in_ns -
-						(int)data_setup_in_ns) >> 1;
-
-	/*
-	 * The following figure illustrates some aspects of a NAND Flash read:
-	 *
-	 *
-	 *           __                   _____________________________________
-	 * RDN         \_________________/
-	 *
-	 *                                         <---- tEYE ----->
-	 *                                        /-----------------\
-	 * Read Data ----------------------------<                   >---------
-	 *                                        \-----------------/
-	 *             ^                 ^                 ^              ^
-	 *             |                 |                 |              |
-	 *             |<--Data Setup -->|<--Delay Time -->|              |
-	 *             |                 |                 |              |
-	 *             |                 |                                |
-	 *             |                 |<--   Quantized Delay Time   -->|
-	 *             |                 |                                |
-	 *
-	 *
-	 * We have some issues we must now address:
-	 *
-	 * (1) The *ideal* sample delay time must not be negative. If it is, we
-	 *     jam it to zero.
-	 *
-	 * (2) The *ideal* sample delay time must not be greater than that
-	 *     allowed by the NFC. If it is, we can increase the data setup
-	 *     time, which will reduce the delay between the end of the data
-	 *     setup and the center of the eye. It will also make the eye
-	 *     larger, which might help with the next issue...
-	 *
-	 * (3) The *quantized* sample delay time must not fall either before the
-	 *     eye opens or after it closes (the latter is the problem
-	 *     illustrated in the above figure).
-	 */
-
-	/* Jam a negative ideal sample delay to zero. */
-	if (ideal_sample_delay_in_ns < 0)
-		ideal_sample_delay_in_ns = 0;
-
-	/*
-	 * Extend the data setup as needed to reduce the ideal sample delay
-	 * below the maximum permitted by the NFC.
-	 */
-	while ((ideal_sample_delay_in_ns > max_sample_delay_in_ns) &&
-			(data_setup_in_cycles < nfc->max_data_setup_cycles)) {
-
-		/* Give a cycle to data setup. */
-		data_setup_in_cycles++;
-		/* Synchronize the data setup time with the cycles. */
-		data_setup_in_ns += clock_period_in_ns;
-		/* Adjust tEYE accordingly. */
-		tEYE += clock_period_in_ns;
-
-		/*
-		 * Decrease the ideal sample delay by one half cycle, to keep it
-		 * in the middle of the eye.
-		 */
-		ideal_sample_delay_in_ns -= (clock_period_in_ns >> 1);
-
-		/* Jam a negative ideal sample delay to zero. */
-		if (ideal_sample_delay_in_ns < 0)
-			ideal_sample_delay_in_ns = 0;
-	}
-
-	/*
-	 * Compute the sample delay factor that corresponds to the ideal sample
-	 * delay. If the result is too large, then use the maximum allowed
-	 * value.
-	 *
-	 * Notice that we use the ns_to_cycles function to compute the sample
-	 * delay factor. We do this because the form of the computation is the
-	 * same as that for calculating cycles.
-	 */
-	sample_delay_factor =
-		ns_to_cycles(ideal_sample_delay_in_ns << dll_delay_shift,
-							clock_period_in_ns, 0);
-
-	if (sample_delay_factor > nfc->max_sample_delay_factor)
-		sample_delay_factor = nfc->max_sample_delay_factor;
-
-	/*
-	 * These macros conveniently encapsulate a computation we'll use to
-	 * continuously evaluate whether or not the data sample delay is inside
-	 * the eye.
-	 */
-	#define IDEAL_DELAY  ((int) ideal_sample_delay_in_ns)
-
-	#define QUANTIZED_DELAY  \
-		((int) ((sample_delay_factor * clock_period_in_ns) >> \
-							dll_delay_shift))
-
-	#define DELAY_ERROR  (abs(QUANTIZED_DELAY - IDEAL_DELAY))
-
-	#define SAMPLE_IS_NOT_WITHIN_THE_EYE  (DELAY_ERROR > (tEYE >> 1))
-
-	/*
-	 * While the quantized sample time falls outside the eye, reduce the
-	 * sample delay or extend the data setup to move the sampling point back
-	 * toward the eye. Do not allow the number of data setup cycles to
-	 * exceed the maximum allowed by the NFC.
-	 */
-	while (SAMPLE_IS_NOT_WITHIN_THE_EYE &&
-			(data_setup_in_cycles < nfc->max_data_setup_cycles)) {
-		/*
-		 * If control arrives here, the quantized sample delay falls
-		 * outside the eye. Check if it's before the eye opens, or after
-		 * the eye closes.
-		 */
-		if (QUANTIZED_DELAY > IDEAL_DELAY) {
-			/*
-			 * If control arrives here, the quantized sample delay
-			 * falls after the eye closes. Decrease the quantized
-			 * delay time and then go back to re-evaluate.
-			 */
-			if (sample_delay_factor != 0)
-				sample_delay_factor--;
-			continue;
-		}
-
-		/*
-		 * If control arrives here, the quantized sample delay falls
-		 * before the eye opens. Shift the sample point by increasing
-		 * data setup time. This will also make the eye larger.
-		 */
-
-		/* Give a cycle to data setup. */
-		data_setup_in_cycles++;
-		/* Synchronize the data setup time with the cycles. */
-		data_setup_in_ns += clock_period_in_ns;
-		/* Adjust tEYE accordingly. */
-		tEYE += clock_period_in_ns;
-
-		/*
-		 * Decrease the ideal sample delay by one half cycle, to keep it
-		 * in the middle of the eye.
-		 */
-		ideal_sample_delay_in_ns -= (clock_period_in_ns >> 1);
-
-		/* ...and one less period for the delay time. */
-		ideal_sample_delay_in_ns -= clock_period_in_ns;
-
-		/* Jam a negative ideal sample delay to zero. */
-		if (ideal_sample_delay_in_ns < 0)
-			ideal_sample_delay_in_ns = 0;
-
-		/*
-		 * We have a new ideal sample delay, so re-compute the quantized
-		 * delay.
-		 */
-		sample_delay_factor =
-			ns_to_cycles(
-				ideal_sample_delay_in_ns << dll_delay_shift,
-							clock_period_in_ns, 0);
-
-		if (sample_delay_factor > nfc->max_sample_delay_factor)
-			sample_delay_factor = nfc->max_sample_delay_factor;
-	}
-
-	hw->data_setup_in_cycles    = data_setup_in_cycles;
-	hw->data_hold_in_cycles     = data_hold_in_cycles;
-	hw->address_setup_in_cycles = address_setup_in_cycles;
-	hw->use_half_periods        = dll_use_half_periods;
-	hw->sample_delay_factor     = sample_delay_factor;
-	hw->device_busy_timeout     = GPMI_DEFAULT_BUSY_TIMEOUT;
-	hw->wrn_dly_sel             = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS;
-}
-
 /*
  * <1> Firstly, we should know what's the GPMI-clock means.
  *     The GPMI-clock is the internal clock in the gpmi nand controller.
@@ -763,13 +362,10 @@ gpmi_nfc_compute_hardware_timings(struct gpmi_nand_data *this)
  *  4.1) From the aspect of the nand chip pins:
  *        Delay = (tREA + C - tRP)               {1}
  *
- *        tREA : the maximum read access time. From the ONFI nand standards,
- *               we know that tREA is 16ns in mode 5, tREA is 20ns is mode 4.
- *               Please check it in : www.onfi.org
- *        C    : a constant for adjust the delay. default is 4.
- *        tRP  : the read pulse width.
- *               Specified by the HW_GPMI_TIMING0:DATA_SETUP:
- *                    tRP = (GPMI-clock-period) * DATA_SETUP
+ *        tREA : the maximum read access time.
+ *        C    : a constant to adjust the delay. default is 4000ps.
+ *        tRP  : the read pulse width, which is exactly:
+ *                   tRP = (GPMI-clock-period) * DATA_SETUP
  *
  *  4.2) From the aspect of the GPMI nand controller:
  *         Delay = RDN_DELAY * 0.125 * RP        {2}
@@ -782,140 +378,109 @@ gpmi_nfc_compute_hardware_timings(struct gpmi_nand_data *this)
  *
  *            Set the HW_GPMI_CTRL1:HALF_PERIOD if GPMI-clock-period
  *            is greater DLL_THRETHOLD. In other SOCs, the DLL_THRETHOLD
- *            is 16ns, but in mx6q, we use 12ns.
+ *            is 16000ps, but in mx6q, we use 12000ps.
  *
  *  4.3) since {1} equals {2}, we get:
  *
- *                    (tREA + 4 - tRP) * 8
- *         RDN_DELAY = ---------------------     {3}
- *                           RP
- *
- *  4.4) We only support the fastest asynchronous mode of ONFI nand.
- *       For some ONFI nand, the mode 4 is the fastest mode;
- *       while for some ONFI nand, the mode 5 is the fastest mode.
- *       So we only support the mode 4 and mode 5. It is no need to
- *       support other modes.
+ *                     (tREA + 4000 - tRP) * 8
+ *         RDN_DELAY = -----------------------   {3}
+ *                                RP
  */
-static void gpmi_nfc_compute_edo_timings(struct gpmi_nand_data *this,
-					 int mode)
+static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
+				     const struct nand_sdr_timings *sdr)
 {
 	struct gpmi_nfc_hardware_timing *hw = &this->hw;
-	int dll_threshold = this->devdata->max_chain_delay;
-	unsigned long delay;
-	unsigned long clk_period;
-	int t_rp, t_rea, rp;
-
-	/* Set the main clock to: 100MHz (mode 5) or 80MHz (mode 4) */
-	hw->clk_rate = (mode == 5) ? 100000000 : 80000000;
+	unsigned int dll_threshold_ps = this->devdata->max_chain_delay;
+	unsigned int period_ps, reference_period_ps;
+	unsigned int data_setup_cycles, data_hold_cycles, addr_setup_cycles;
+	unsigned int tRP_ps;
+	bool use_half_period;
+	int sample_delay_ps, sample_delay_factor;
+	u16 busy_timeout_cycles;
+	u8 wrn_dly_sel;
+
+	if (sdr->tRC_min >= 30000) {
+		/* ONFI non-EDO modes [0-3] */
+		hw->clk_rate = 22000000;
+		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS;
+	} else if (sdr->tRC_min >= 25000) {
+		/* ONFI EDO mode 4 */
+		hw->clk_rate = 80000000;
+		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
+	} else {
+		/* ONFI EDO mode 5 */
+		hw->clk_rate = 100000000;
+		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
+	}
 
-	/*
-	 * [1] for GPMI_HW_GPMI_TIMING0:
-	 *     The async mode requires 40MHz for mode 4, 50MHz for mode 5.
-	 *     The GPMI can support 100MHz at most. So if we want to
-	 *     get the 40MHz or 50MHz, we have to set DS=1, DH=1.
-	 *     Set the ADDRESS_SETUP to 0 in mode 4.
-	 */
-	hw->data_setup_in_cycles = 1;
-	hw->data_hold_in_cycles = 1;
-	hw->address_setup_in_cycles = (mode == 5) ? 1 : 0;
+	/* SDR core timings are given in picoseconds */
+	period_ps = div_u64((u64)NSEC_PER_SEC * 1000, hw->clk_rate);
 
-	/* [2] for GPMI_HW_GPMI_TIMING1 */
-	hw->device_busy_timeout = 0x9000;
+	addr_setup_cycles = TO_CYCLES(sdr->tALS_min, period_ps);
+	data_setup_cycles = TO_CYCLES(sdr->tDS_min, period_ps);
+	data_hold_cycles = TO_CYCLES(sdr->tDH_min, period_ps);
+	busy_timeout_cycles = TO_CYCLES(sdr->tWB_max + sdr->tR_max, period_ps);
 
-	/* [3] for GPMI_HW_GPMI_CTRL1 */
-	hw->wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
+	hw->timing0 = BF_GPMI_TIMING0_ADDRESS_SETUP(addr_setup_cycles) |
+		      BF_GPMI_TIMING0_DATA_HOLD(data_hold_cycles) |
+		      BF_GPMI_TIMING0_DATA_SETUP(data_setup_cycles);
+	hw->timing1 = BF_GPMI_TIMING1_BUSY_TIMEOUT(busy_timeout_cycles * 4096);
 
 	/*
-	 * Enlarge 10 times for the numerator and denominator in {3}.
-	 * This make us to get more accurate result.
+	 * Derive NFC ideal delay from {3}:
+	 *
+	 *                     (tREA + 4000 - tRP) * 8
+	 *         RDN_DELAY = -----------------------
+	 *                                RP
 	 */
-	clk_period = NSEC_PER_SEC / (hw->clk_rate / 10);
-	dll_threshold *= 10;
-	t_rea = this->timing.tREA_in_ns * 10;
-	t_rp = clk_period * 1; /* DATA_SETUP is 1 */
-
-	if (clk_period > dll_threshold) {
-		hw->use_half_periods = 1;
-		rp = clk_period / 2;
+	if (period_ps > dll_threshold_ps) {
+		use_half_period = true;
+		reference_period_ps = period_ps / 2;
 	} else {
-		hw->use_half_periods = 0;
-		rp = clk_period;
+		use_half_period = false;
+		reference_period_ps = period_ps;
 	}
 
-	/*
-	 * Multiply the numerator with 10, we could do a round off:
-	 *      7.8 round up to 8; 7.4 round down to 7.
-	 */
-	delay  = (((t_rea + 40 - t_rp) * 8) * 10) / rp;
-	delay = (delay + 5) / 10;
+	tRP_ps = data_setup_cycles * period_ps;
+	sample_delay_ps = (sdr->tREA_max + 4000 - tRP_ps) * 8;
+	if (sample_delay_ps > 0)
+		sample_delay_factor = sample_delay_ps / reference_period_ps;
+	else
+		sample_delay_factor = 0;
 
-	hw->sample_delay_factor = delay;
+	hw->ctrl1n = BF_GPMI_CTRL1_WRN_DLY_SEL(wrn_dly_sel);
+	if (sample_delay_factor)
+		hw->ctrl1n |= BF_GPMI_CTRL1_RDN_DELAY(sample_delay_factor) |
+			      BM_GPMI_CTRL1_DLL_ENABLE |
+			      (use_half_period ? BM_GPMI_CTRL1_HALF_PERIOD : 0);
 }
 
-/* Begin the I/O */
 void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
 {
 	struct gpmi_nfc_hardware_timing *hw = &this->hw;
 	struct resources *r = &this->resources;
 	void __iomem *gpmi_regs = r->gpmi_regs;
-	unsigned int   clock_period_in_ns;
-	uint32_t       reg;
-	unsigned int   dll_wait_time_in_us;
+	unsigned int dll_wait_time_us;
 
-	/* [0] Set the main clock rate */
 	clk_set_rate(r->clock[0], hw->clk_rate);
 
-	/* [1] Set HW_GPMI_TIMING0 */
-	reg = BF_GPMI_TIMING0_ADDRESS_SETUP(hw->address_setup_in_cycles) |
-		BF_GPMI_TIMING0_DATA_HOLD(hw->data_hold_in_cycles) |
-		BF_GPMI_TIMING0_DATA_SETUP(hw->data_setup_in_cycles);
-
-	writel(reg, gpmi_regs + HW_GPMI_TIMING0);
-
-	/* [2] Set HW_GPMI_TIMING1 */
-	writel(BF_GPMI_TIMING1_BUSY_TIMEOUT(hw->device_busy_timeout),
-	       gpmi_regs + HW_GPMI_TIMING1);
-
-	/* [3] The following code is to set the HW_GPMI_CTRL1. */
-
-	/* Set the WRN_DLY_SEL */
-	writel(BM_GPMI_CTRL1_WRN_DLY_SEL, gpmi_regs + HW_GPMI_CTRL1_CLR);
-	writel(BF_GPMI_CTRL1_WRN_DLY_SEL(hw->wrn_dly_sel),
-	       gpmi_regs + HW_GPMI_CTRL1_SET);
-
-	/* DLL_ENABLE must be set to 0 when setting RDN_DELAY or HALF_PERIOD. */
-	writel(BM_GPMI_CTRL1_DLL_ENABLE, gpmi_regs + HW_GPMI_CTRL1_CLR);
-
-	/* Clear out the DLL control fields. */
-	reg = BM_GPMI_CTRL1_RDN_DELAY | BM_GPMI_CTRL1_HALF_PERIOD;
-	writel(reg, gpmi_regs + HW_GPMI_CTRL1_CLR);
-
-	/* If no sample delay is called for, return immediately. */
-	if (!hw->sample_delay_factor)
-		return;
-
-	/* Set RDN_DELAY or HALF_PERIOD. */
-	reg = ((hw->use_half_periods) ? BM_GPMI_CTRL1_HALF_PERIOD : 0)
-		| BF_GPMI_CTRL1_RDN_DELAY(hw->sample_delay_factor);
-
-	writel(reg, gpmi_regs + HW_GPMI_CTRL1_SET);
-
-	/* At last, we enable the DLL. */
-	writel(BM_GPMI_CTRL1_DLL_ENABLE, gpmi_regs + HW_GPMI_CTRL1_SET);
+	writel(hw->timing0, gpmi_regs + HW_GPMI_TIMING0);
+	writel(hw->timing1, gpmi_regs + HW_GPMI_TIMING1);
 
 	/*
-	 * After we enable the GPMI DLL, we have to wait 64 clock cycles before
-	 * we can use the GPMI. Calculate the amount of time we need to wait,
-	 * in microseconds.
+	 * Clear several CTRL1 fields, DLL must be disabled when setting
+	 * RDN_DELAY or HALF_PERIOD.
 	 */
-	clock_period_in_ns = NSEC_PER_SEC / hw->clk_rate;
-	dll_wait_time_in_us = (clock_period_in_ns * 64) / 1000;
+	writel(BM_GPMI_CTRL1_CLEAR_MASK, gpmi_regs + HW_GPMI_CTRL1_CLR);
+	writel(hw->ctrl1n, gpmi_regs + HW_GPMI_CTRL1_SET);
 
-	if (!dll_wait_time_in_us)
-		dll_wait_time_in_us = 1;
+	/* Wait 64 clock cycles before using the GPMI after enabling the DLL */
+	dll_wait_time_us = USEC_PER_SEC / hw->clk_rate * 64;
+	if (!dll_wait_time_us)
+		dll_wait_time_us = 1;
 
 	/* Wait for the DLL to settle. */
-	udelay(dll_wait_time_in_us);
+	udelay(dll_wait_time_us);
 }
 
 int gpmi_setup_data_interface(struct mtd_info *mtd, int chipnr,
@@ -924,33 +489,22 @@ int gpmi_setup_data_interface(struct mtd_info *mtd, int chipnr,
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	const struct nand_sdr_timings *sdr;
-	bool edo_mode = false;
 
 	/* Retrieve required NAND timings */
 	sdr = nand_get_sdr_timings(conf);
 	if (IS_ERR(sdr))
 		return PTR_ERR(sdr);
 
-	if (sdr->tRC_min <= 25000)
-		edo_mode = true;
-
 	/* Only MX6 GPMI controller can reach EDO timings */
-	if (edo_mode && !GPMI_IS_MX6(this))
+	if (sdr->tRC_min <= 25000 && !GPMI_IS_MX6(this))
 		return -ENOTSUPP;
 
+	/* Stop here if this call was just a check */
 	if (chipnr < 0)
 		return 0;
 
-	this->timing.tREA_in_ns = sdr->tREA_max / 1000;
-	this->timing.tRLOH_in_ns = sdr->tRLOH_min / 1000;
-	this->timing.tRHOH_in_ns = sdr->tRHOH_min / 1000;
-
-	/* Compute GPMI parameters depending on the mode */
-	if (edo_mode)
-		gpmi_nfc_compute_edo_timings(this,
-					     sdr->tRC_min > 20000 ? 4 : 5);
-	else
-		gpmi_nfc_compute_hardware_timings(this);
+	/* Do the actual derivation of the controller timings */
+	gpmi_nfc_compute_timings(this, sdr);
 
 	this->hw.must_apply_timings = true;
 
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 459b7fb5e15b..553c6c1cb932 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -94,7 +94,7 @@ static const struct mtd_ooblayout_ops gpmi_ooblayout_ops = {
 static const struct gpmi_devdata gpmi_devdata_imx23 = {
 	.type = IS_MX23,
 	.bch_max_ecc_strength = 20,
-	.max_chain_delay = 16,
+	.max_chain_delay = 16000,
 	.clks = gpmi_clks_for_mx2x,
 	.clks_count = ARRAY_SIZE(gpmi_clks_for_mx2x),
 };
@@ -102,7 +102,7 @@ static const struct gpmi_devdata gpmi_devdata_imx23 = {
 static const struct gpmi_devdata gpmi_devdata_imx28 = {
 	.type = IS_MX28,
 	.bch_max_ecc_strength = 20,
-	.max_chain_delay = 16,
+	.max_chain_delay = 16000,
 	.clks = gpmi_clks_for_mx2x,
 	.clks_count = ARRAY_SIZE(gpmi_clks_for_mx2x),
 };
@@ -114,7 +114,7 @@ static const char * const gpmi_clks_for_mx6[] = {
 static const struct gpmi_devdata gpmi_devdata_imx6q = {
 	.type = IS_MX6Q,
 	.bch_max_ecc_strength = 40,
-	.max_chain_delay = 12,
+	.max_chain_delay = 12000,
 	.clks = gpmi_clks_for_mx6,
 	.clks_count = ARRAY_SIZE(gpmi_clks_for_mx6),
 };
@@ -122,7 +122,7 @@ static const struct gpmi_devdata gpmi_devdata_imx6q = {
 static const struct gpmi_devdata gpmi_devdata_imx6sx = {
 	.type = IS_MX6SX,
 	.bch_max_ecc_strength = 62,
-	.max_chain_delay = 12,
+	.max_chain_delay = 12000,
 	.clks = gpmi_clks_for_mx6,
 	.clks_count = ARRAY_SIZE(gpmi_clks_for_mx6),
 };
@@ -134,7 +134,7 @@ static const char * const gpmi_clks_for_mx7d[] = {
 static const struct gpmi_devdata gpmi_devdata_imx7d = {
 	.type = IS_MX7D,
 	.bch_max_ecc_strength = 62,
-	.max_chain_delay = 12,
+	.max_chain_delay = 12000,
 	.clks = gpmi_clks_for_mx7d,
 	.clks_count = ARRAY_SIZE(gpmi_clks_for_mx7d),
 };
@@ -695,34 +695,6 @@ static void release_resources(struct gpmi_nand_data *this)
 	release_dma_channels(this);
 }
 
-static int init_hardware(struct gpmi_nand_data *this)
-{
-	int ret;
-
-	/*
-	 * This structure contains the "safe" GPMI timing that should succeed
-	 * with any NAND Flash device
-	 * (although, with less-than-optimal performance).
-	 */
-	struct nand_timing  safe_timing = {
-		.data_setup_in_ns        = 80,
-		.data_hold_in_ns         = 60,
-		.address_setup_in_ns     = 25,
-		.gpmi_sample_delay_in_ns =  6,
-		.tREA_in_ns              = -1,
-		.tRLOH_in_ns             = -1,
-		.tRHOH_in_ns             = -1,
-	};
-
-	/* Initialize the hardwares. */
-	ret = gpmi_init(this);
-	if (ret)
-		return ret;
-
-	this->timing = safe_timing;
-	return 0;
-}
-
 static int read_page_prepare(struct gpmi_nand_data *this,
 			void *destination, unsigned length,
 			void *alt_virt, dma_addr_t alt_phys, unsigned alt_size,
@@ -2099,7 +2071,7 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto exit_acquire_resources;
 
-	ret = init_hardware(this);
+	ret = gpmi_init(this);
 	if (ret)
 		goto exit_nfc_init;
 
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index 23f9030cf6d2..62fde59b995f 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -86,39 +86,6 @@ enum dma_ops_type {
 	DMA_FOR_WRITE_ECC_PAGE
 };
 
-/**
- * struct nand_timing - Fundamental timing attributes for NAND.
- * @data_setup_in_ns:         The data setup time, in nanoseconds. Usually the
- *                            maximum of tDS and tWP. A negative value
- *                            indicates this characteristic isn't known.
- * @data_hold_in_ns:          The data hold time, in nanoseconds. Usually the
- *                            maximum of tDH, tWH and tREH. A negative value
- *                            indicates this characteristic isn't known.
- * @address_setup_in_ns:      The address setup time, in nanoseconds. Usually
- *                            the maximum of tCLS, tCS and tALS. A negative
- *                            value indicates this characteristic isn't known.
- * @gpmi_sample_delay_in_ns:  A GPMI-specific timing parameter. A negative value
- *                            indicates this characteristic isn't known.
- * @tREA_in_ns:               tREA, in nanoseconds, from the data sheet. A
- *                            negative value indicates this characteristic isn't
- *                            known.
- * @tRLOH_in_ns:              tRLOH, in nanoseconds, from the data sheet. A
- *                            negative value indicates this characteristic isn't
- *                            known.
- * @tRHOH_in_ns:              tRHOH, in nanoseconds, from the data sheet. A
- *                            negative value indicates this characteristic isn't
- *                            known.
- */
-struct nand_timing {
-	int8_t  data_setup_in_ns;
-	int8_t  data_hold_in_ns;
-	int8_t  address_setup_in_ns;
-	int8_t  gpmi_sample_delay_in_ns;
-	int8_t  tREA_in_ns;
-	int8_t  tRLOH_in_ns;
-	int8_t  tRHOH_in_ns;
-};
-
 enum gpmi_type {
 	IS_MX23,
 	IS_MX28,
@@ -137,41 +104,21 @@ struct gpmi_devdata {
 
 /**
  * struct gpmi_nfc_hardware_timing - GPMI hardware timing parameters.
- * @timing_mode:               The timing mode to comply with.
  * @must_apply_timings:        Whether controller timings have already been
  *                             applied or not (useful only while there is
  *                             support for only one chip select)
  * @clk_rate:                  The clock rate that must be used to derive the
- *                             following parameters.
- * @data_setup_in_cycles:      The data setup time, in cycles.
- * @data_hold_in_cycles:       The data hold time, in cycles.
- * @address_setup_in_cycles:   The address setup time, in cycles.
- * @device_busy_timeout:       The timeout waiting for NAND Ready/Busy,
- *                             this value is the number of cycles multiplied
- *                             by 4096.
- * @use_half_periods:          Indicates the clock is running slowly, so the
- *                             NFC DLL should use half-periods.
- * @sample_delay_factor:       The sample delay factor.
- * @wrn_dly_sel:               The delay on the GPMI write strobe.
+ *                             following parameters
+ * @timing0:                   HW_GPMI_TIMING0 register
+ * @timing1:                   HW_GPMI_TIMING1 register
+ * @ctrl1n:                    HW_GPMI_CTRL1n register
  */
 struct gpmi_nfc_hardware_timing {
-	unsigned int timing_mode;
 	bool must_apply_timings;
 	unsigned long int clk_rate;
-
-	/* for HW_GPMI_TIMING0 */
-	u8 data_setup_in_cycles;
-	u8 data_hold_in_cycles;
-	u8 address_setup_in_cycles;
-
-	/* for HW_GPMI_TIMING1 */
-	u16 device_busy_timeout;
-#define GPMI_DEFAULT_BUSY_TIMEOUT	0x500 /* default busy timeout value.*/
-
-	/* for HW_GPMI_CTRL1 */
-	bool use_half_periods;
-	u8 sample_delay_factor;
-	u8 wrn_dly_sel;
+	u32 timing0;
+	u32 timing1;
+	u32 ctrl1n;
 };
 
 struct gpmi_nand_data {
@@ -186,8 +133,6 @@ struct gpmi_nand_data {
 	struct resources	resources;
 
 	/* Flash Hardware */
-	struct nand_timing	timing;
-	int			timing_mode;
 	struct gpmi_nfc_hardware_timing hw;
 
 	/* BCH */
@@ -241,40 +186,6 @@ struct gpmi_nand_data {
 	void			*private;
 };
 
-/**
- * struct timing_threshold - Timing threshold
- * @max_data_setup_cycles:       The maximum number of data setup cycles that
- *                               can be expressed in the hardware.
- * @internal_data_setup_in_ns:   The time, in ns, that the NFC hardware requires
- *                               for data read internal setup. In the Reference
- *                               Manual, see the chapter "High-Speed NAND
- *                               Timing" for more details.
- * @max_sample_delay_factor:     The maximum sample delay factor that can be
- *                               expressed in the hardware.
- * @max_dll_clock_period_in_ns:  The maximum period of the GPMI clock that the
- *                               sample delay DLL hardware can possibly work
- *                               with (the DLL is unusable with longer periods).
- *                               If the full-cycle period is greater than HALF
- *                               this value, the DLL must be configured to use
- *                               half-periods.
- * @max_dll_delay_in_ns:         The maximum amount of delay, in ns, that the
- *                               DLL can implement.
- * @clock_frequency_in_hz:       The clock frequency, in Hz, during the current
- *                               I/O transaction. If no I/O transaction is in
- *                               progress, this is the clock frequency during
- *                               the most recent I/O transaction.
- */
-struct timing_threshold {
-	const unsigned int      max_chip_count;
-	const unsigned int      max_data_setup_cycles;
-	const unsigned int      internal_data_setup_in_ns;
-	const unsigned int      max_sample_delay_factor;
-	const unsigned int      max_dll_clock_period_in_ns;
-	const unsigned int      max_dll_delay_in_ns;
-	unsigned long           clock_frequency_in_hz;
-
-};
-
 /* Common Services */
 int common_nfc_set_geometry(struct gpmi_nand_data *);
 struct dma_chan *get_dma_chan(struct gpmi_nand_data *);
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-regs.h b/drivers/mtd/nand/gpmi-nand/gpmi-regs.h
index 82114cdc8330..d92bf32221ca 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-regs.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-regs.h
@@ -147,6 +147,11 @@
 
 #define BM_GPMI_CTRL1_GPMI_MODE				(1 << 0)
 
+#define BM_GPMI_CTRL1_CLEAR_MASK (BM_GPMI_CTRL1_WRN_DLY_SEL | \
+				  BM_GPMI_CTRL1_DLL_ENABLE |  \
+				  BM_GPMI_CTRL1_RDN_DELAY |   \
+				  BM_GPMI_CTRL1_HALF_PERIOD)
+
 #define HW_GPMI_TIMING0					0x00000070
 
 #define BP_GPMI_TIMING0_ADDRESS_SETUP			16
-- 
2.11.0
