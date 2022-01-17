Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B702AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYmx4ewTel982yRuMtglCgCl9ku1MCUMq2crvkEBOTA=; b=Vs905FReAwymRq
	R1Vd8OPNfLYFInbcsoyVbFlM0RTXlJOcH8UWK695OPmTy6RQYNJ9Lbu8eMn0YrVrYj8oOFcHcPdx3
	gsA1FdDRVUUTVEApgNPTUxI0epWbiUZogMIQh7nv/3LmyHwPoYIXJRwwkbAiYXfqhfGuuefQiJZJt
	OyPXOx9AUHinBWUwcy6XuAEY2uWs5S+SeWFTjB5RdbzGwT+XtJAoKpsDlTA5U9Iw9zk8+rZotr1kM
	XvROt6GK+J7JHVLbyA3qLmTZXi45YyK9ptyGqbDGsfjesHB2rHNr9AD4KHxMhfkY1+28CUVuoLYy0
	j6O8ityZe3JP/L1Y/j4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9TkY-00FNE4-3B; Mon, 17 Jan 2022 15:16:50 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9TkR-00FNCp-Jh
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 15:16:46 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1n9TkM-0002fX-Kj; Mon, 17 Jan 2022 16:16:38 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1n9TkJ-0004sF-U3; Mon, 17 Jan 2022 16:16:35 +0100
Date: Mon, 17 Jan 2022 16:16:35 +0100
From: Sascha Hauer <sha@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v2 3/5] mtd: rawnand: gpmi: use a table to get EDO
 mode setup
Message-ID: <20220117151635.GB23490@pengutronix.de>
References: <20220117111829.1811997-1-dario.binacchi@amarulasolutions.com>
 <20220117111829.1811997-4-dario.binacchi@amarulasolutions.com>
 <YeVsnQpOkyXaBk0+@pengutronix.de>
 <CABGWkvruAWcOxX99U0jcK1sz+AoGKKJwHWbtn_kSO=SJsCO5Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvruAWcOxX99U0jcK1sz+AoGKKJwHWbtn_kSO=SJsCO5Wg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:16:11 up 37 days, 23:01, 81 users,  load average: 0.33, 0.20, 0.20
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_071643_862702_99547CE5 
X-CRM114-Status: GOOD (  55.00  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 17, 2022 at 03:08:30PM +0100, Dario Binacchi wrote:
> Hi Sascha,
> 
> On Mon, Jan 17, 2022 at 2:18 PM Sascha Hauer <sha@pengutronix.de> wrote:
> >
> > Hi Dario,
> >
> > On Mon, Jan 17, 2022 at 12:18:27PM +0100, Dario Binacchi wrote:
> > > +struct edo_mode {
> > > +     u32 tRC_min;
> > > +     long clk_rate;
> > > +     u8 wrn_dly_sel;
> > > +};
> > > +
> > > +static const struct edo_mode edo_modes[] = {
> > > +     {.tRC_min = 30000, .clk_rate = 22000000,
> > > +      .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
> > > +     {.tRC_min = 30000, .clk_rate = 22000000,
> > > +      .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
> > > +     {.tRC_min = 30000, .clk_rate = 22000000,
> > > +      .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
> > > +     {.tRC_min = 30000, .clk_rate = 22000000,
> > > +      .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
> > > +     {.tRC_min = 25000, .clk_rate = 80000000,
> > > +      .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY},
> > > +     {.tRC_min = 20000, .clk_rate = 100000000,
> > > +      .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY},
> > > +};
> > > +
> > >  /*
> > >   * <1> Firstly, we should know what's the GPMI-clock means.
> > >   *     The GPMI-clock is the internal clock in the gpmi nand controller.
> > > @@ -657,22 +678,18 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
> > >       int sample_delay_ps, sample_delay_factor;
> > >       u16 busy_timeout_cycles;
> > >       u8 wrn_dly_sel;
> > > +     int i, emode = ARRAY_SIZE(edo_modes) - 1;
> > >
> > > -     if (sdr->tRC_min >= 30000) {
> > > -             /* ONFI non-EDO modes [0-3] */
> > > -             hw->clk_rate = 22000000;
> > > -             wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS;
> > > -     } else if (sdr->tRC_min >= 25000) {
> > > -             /* ONFI EDO mode 4 */
> > > -             hw->clk_rate = 80000000;
> > > -             wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
> > > -     } else {
> > > -             /* ONFI EDO mode 5 */
> > > -             hw->clk_rate = 100000000;
> > > -             wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
> > > +     /* Search the required EDO mode */
> > > +     for (i = 0; i < ARRAY_SIZE(edo_modes); i++) {
> > > +             if (sdr->tRC_min >= edo_modes[i].tRC_min) {
> > > +                     emode = i;
> > > +                     break;
> > > +             }
> >
> > The first four entries of edo_modes[] all have the same value, so this loop
> > will never end on the second, third or fourth element. These eleqments are just
> > there to match 'emode' with the existing ONFI mode numbers, but then 'emode' is
> > never used as an ONFI mode number, instead it's only used as an index to the
> > array. You could equally well remove the second till fourth array entries.
> >
> > Then with only three entries left in the array I wonder if you're not better
> > off with the original code and change it to something like:
> 
> This implementation is justified by the next patch in the series ([RFC
> PATCH v2 4/5] mtd: rawnand: gpmi: validate controller clock rate).
> I thought that clock rate validation could be better implemented by
> indexing a table. The replication of the second, third and fourth
> elements
> makes the index also the edo mode (used in the debug printout). Using
> a less redundant table (three elements) requires the edo mode
> to be stored in it if you want to keep the debug printing or remove
> the debug message.
> 
> >
> >         if (sdr->tRC_min >= 30000) {
> >                 /* ONFI non-EDO modes [0-3] */
> >                 hw->clk_rate = 22000000;
> >                 min_rate = 0;
> >                 wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS;
> >         } else if (sdr->tRC_min >= 25000) {
> >                 /* ONFI EDO mode 4 */
> >                 hw->clk_rate = 80000000;
> >                 min_rate = 22000000;
> >                 wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
> >         } else {
> >                 /* ONFI EDO mode 5 */
> >                 hw->clk_rate = 100000000;
> >                 min_rate = 80000000;
> >                 wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
> >         }
> >
> >         hw->clk_rate = clk_round_rate(r->clock[0], hw->clk_rate);
> >         if (hw->clk_rate < min_rate)
> >                 return -EINVAL;
> >
> > I think this would be easier to follow.
> 
> I think the key point is to decide if the patch "[RFC PATCH v2 4/5]
> mtd: rawnand: gpmi: validate controller clock rate" makes sense.
> I thought of this patch to facilitate that implementation, since it
> compares the real GPMI clock rate to that of the previous edo mode.
> I thought it wasn't elegant to implement another switch case.

You don't have to implement another switch/case. It's already there.

To be more clear my suggestion was to replace 3/5 and 4/5 with the
following.

Sascha

---------------------------8<--------------------------------

From 879fb5daaf19524ae29eda84c75d08668ad06d42 Mon Sep 17 00:00:00 2001
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 17 Jan 2022 12:18:28 +0100
Subject: [PATCH] mtd: rawnand: gpmi: validate controller clock rate

What to do when the real rate of the gpmi clock is not equal to the
required one? The solutions proposed in [1] did not lead to a conclusion
on how to validate the clock rate, so, inspired by the document [2], I
consider the rate correct only if not lower or equal to the rate of the
previous edo mode. In fact, in chapter 4.16.2 (NV-DDR) of the document [2],
it is written that "If the host selects timing mode n, then its clock
period shall be faster than the clock period of timing mode n-1 and
slower than or equal to the clock period of timing mode n.". I thought
that it could therefore also be used in this case, without therefore
having to define the valid rate ranges empirically.

For example, suppose that gpmi_nfc_compute_timings() is called for edo
mode 5 configuration (100MHz, from the `edo_modes' table) but the rate
returned by clk_round_rate() is 80MHz (edo mode 4 from the `edo_modes'
table). In this case gpmi_nfc_compute_timings() will return error, and
will be called again for edo mode 4 configuration, which this time will
be successful.

[1] https://lore.kernel.org/r/20210702065350.209646-5-ebiggers@kernel.org
[2] http://www.onfi.org/-/media/client/onfi/specs/onfi_3_0_gold.pdf?la=en

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 73c3bf59b55e..dcad7410d817 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -644,8 +644,8 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
  *         RDN_DELAY = -----------------------     {3}
  *                           RP
  */
-static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
-				     const struct nand_sdr_timings *sdr)
+static int gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
+				    const struct nand_sdr_timings *sdr)
 {
 	struct gpmi_nfc_hardware_timing *hw = &this->hw;
 	struct resources *r = &this->resources;
@@ -653,6 +653,7 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 	unsigned int period_ps, reference_period_ps;
 	unsigned int data_setup_cycles, data_hold_cycles, addr_setup_cycles;
 	unsigned int tRP_ps;
+	unsigned int min_rate;
 	bool use_half_period;
 	int sample_delay_ps, sample_delay_factor;
 	u16 busy_timeout_cycles;
@@ -661,18 +662,23 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 	if (sdr->tRC_min >= 30000) {
 		/* ONFI non-EDO modes [0-3] */
 		hw->clk_rate = 22000000;
+		min_rate = 0;
 		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS;
 	} else if (sdr->tRC_min >= 25000) {
 		/* ONFI EDO mode 4 */
 		hw->clk_rate = 80000000;
+		min_rate = 22000000;
 		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
 	} else {
 		/* ONFI EDO mode 5 */
 		hw->clk_rate = 100000000;
+		min_rate = 80000000;
 		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
 	}
 
 	hw->clk_rate = clk_round_rate(r->clock[0], hw->clk_rate);
+	if (hw->clk_rate < min_rate)
+		return -ENOTSUPP;
 
 	/* SDR core timings are given in picoseconds */
 	period_ps = div_u64((u64)NSEC_PER_SEC * 1000, hw->clk_rate);
@@ -714,6 +720,7 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 		hw->ctrl1n |= BF_GPMI_CTRL1_RDN_DELAY(sample_delay_factor) |
 			      BM_GPMI_CTRL1_DLL_ENABLE |
 			      (use_half_period ? BM_GPMI_CTRL1_HALF_PERIOD : 0);
+	return 0;
 }
 
 static int gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
@@ -769,6 +776,7 @@ static int gpmi_setup_interface(struct nand_chip *chip, int chipnr,
 {
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	const struct nand_sdr_timings *sdr;
+	int ret;
 
 	/* Retrieve required NAND timings */
 	sdr = nand_get_sdr_timings(conf);
@@ -784,7 +792,9 @@ static int gpmi_setup_interface(struct nand_chip *chip, int chipnr,
 		return 0;
 
 	/* Do the actual derivation of the controller timings */
-	gpmi_nfc_compute_timings(this, sdr);
+	ret = gpmi_nfc_compute_timings(this, sdr);
+	if (ret)
+		return ret;
 
 	this->hw.must_apply_timings = true;
 
-- 
2.30.2

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
