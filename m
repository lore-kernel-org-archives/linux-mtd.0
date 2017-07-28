Received: from mail.thorsis.com ([213.211.200.15])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1db57U-0002f6-O7
 for linux-mtd@lists.infradead.org; Fri, 28 Jul 2017 13:15:59 +0000
From: Alexander Dahl <ada@thorsis.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: mtd: nand: atmel: probe of Spansion S34ML02G1 fails
Date: Fri, 28 Jul 2017 15:15:25 +0200
Message-ID: <2274647.ublHvqEhgW@ada>
In-Reply-To: <20170726203326.2159f0cc@bbrezillon>
References: <5326598.QgYTQxcFMR@ada> <9879279.x3T2Y4a6KK@ada>
 <20170726203326.2159f0cc@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart5041215.SXLXhUq288"
Content-Transfer-Encoding: 7Bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

--nextPart5041215.SXLXhUq288
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello Boris,

Am Mittwoch, 26. Juli 2017, 20:33:26 schrieb Boris Brezillon:
> Okay, first thing to test: revert f9ce2eddf176 ("mtd: nand: atmel: Add
> ->setup_data_interface() hooks"). You may have to revert other
> commits to compile the driver.
> 
> If it works, I'd like you to drop SMC timings in both situations (with
> and without this commit).
> 
> I'd also like to to dump NAND timings (those passed to
> ->setup_data_interface()).

So based on those three atmel-ebi patches from earlier this week I used 
the attached patch to dump the nand timings and smc settings before the 
get applied. clk mck runs at 132096000 Hz (slow_xtal 32768, main_xtal 
18432000). Previously clock settings for NAND were set in (very old) U-
Boot to this (double checked, Linux didn't touch it):

	U-Boot> md.l 0xffffef1c 1
	ffffef1c: 0001000a    ....
	U-Boot> md.l 0xffffec30 4
	ffffec30: 00010001 03030303 00050005 00020003    ................

So setup, pulse, cycle, tdf all to quite low number of clock cycles, but 
as far as I can tell this worked with all flash chips we had connected 
over the years.

Now with the old Hynix flash chip, I get the following:

	atmel-nand-controller 10000000.ebi:nand-controller: atmel_smc_nand_setup_data_interface(csline: 0, type: 0)
	atmel-nand-controller 10000000.ebi:nand-controller: tBERS_max: 0, tCCS_min: 500000, tPROG_max: 0, tR_max: 200000000
	atmel-nand-controller 10000000.ebi:nand-controller: tALH_min: 20000, tADL_min: 400000, tALS_min: 50000, tAR_min: 25000
	atmel-nand-controller 10000000.ebi:nand-controller: tCEA_max: 100000, tCEH_min: 20000, tCH_min: 20000, tCHZ_max: 100000
	atmel-nand-controller 10000000.ebi:nand-controller: tCLH_min: 20000, tCLR_min: 20000, tCLS_min: 50000, tCOH_min: 0
	atmel-nand-controller 10000000.ebi:nand-controller: tCS_min: 70000, tDH_min: 20000, tDS_min: 40000, tFEAT_max: 1000000
	atmel-nand-controller 10000000.ebi:nand-controller: tIR_min: 10000, tITC_max: 1000000, tRC_min: 100000, tREA_max: 40000
	atmel-nand-controller 10000000.ebi:nand-controller: tREH_min: 30000, tRHOH_min: 0, tRHW_min: 200000, tRHZ_max: 200000
	atmel-nand-controller 10000000.ebi:nand-controller: tRLOH_min: 0, tRP_min: 50000, tRR_min: 40000, tRST_max: 250000000000
	atmel-nand-controller 10000000.ebi:nand-controller: tWB_max: 200000, tWC_min: 100000, tWH_min: 30000, tWHR_min: 120000
	atmel-nand-controller 10000000.ebi:nand-controller: tWP_min: 50000, tWW_min: 100000
	atmel-nand-controller 10000000.ebi:nand-controller: smcconf: setup: 0x00000002, pulse: 0x0f080f08, cycle: 0x000f000f, timings: 0x88060483, mode: 0x001f0003
	nand: Could not find valid ONFI parameter page; aborting
	nand: device found, Manufacturer ID: 0xad, Chip ID: 0xda
	nand: Hynix NAND 256MiB 3,3V 8-bit
	nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64

	$ devmem 0xffffef1c
	0x0001000A
	$ devmem 0xffffec30
	0x00000002
	$ devmem 0xffffec34
	0x0F080F08
	$ devmem 0xffffec38
	0x000F000F
	$ devmem 0xffffec3c
	0x001F0003

To me those values look like some kind of defaults every nand chip should run with?

The failing Spansion chip here:

	atmel-nand-controller 10000000.ebi:nand-controller: atmel_smc_nand_setup_data_interface(csline: 0, type: 0)
	atmel-nand-controller 10000000.ebi:nand-controller: tBERS_max: 0, tCCS_min: 500000, tPROG_max: 0, tR_max: 200000000
	atmel-nand-controller 10000000.ebi:nand-controller: tALH_min: 20000, tADL_min: 400000, tALS_min: 50000, tAR_min: 25000
	atmel-nand-controller 10000000.ebi:nand-controller: tCEA_max: 100000, tCEH_min: 20000, tCH_min: 20000, tCHZ_max: 100000
	atmel-nand-controller 10000000.ebi:nand-controller: tCLH_min: 20000, tCLR_min: 20000, tCLS_min: 50000, tCOH_min: 0
	atmel-nand-controller 10000000.ebi:nand-controller: tCS_min: 70000, tDH_min: 20000, tDS_min: 40000, tFEAT_max: 1000000
	atmel-nand-controller 10000000.ebi:nand-controller: tIR_min: 10000, tITC_max: 1000000, tRC_min: 100000, tREA_max: 40000
	atmel-nand-controller 10000000.ebi:nand-controller: tREH_min: 30000, tRHOH_min: 0, tRHW_min: 200000, tRHZ_max: 200000
	atmel-nand-controller 10000000.ebi:nand-controller: tRLOH_min: 0, tRP_min: 50000, tRR_min: 40000, tRST_max: 250000000000
	atmel-nand-controller 10000000.ebi:nand-controller: tWB_max: 200000, tWC_min: 100000, tWH_min: 30000, tWHR_min: 120000
	atmel-nand-controller 10000000.ebi:nand-controller: tWP_min: 50000, tWW_min: 100000
	atmel-nand-controller 10000000.ebi:nand-controller: smcconf: setup: 0x00000002, pulse: 0x0f080f08, cycle: 0x000f000f, timings: 0x88060483, mode: 0x001f0003
	nand: device found, Manufacturer ID: 0x01, Chip ID: 0xda
	nand: AMD/Spansion S34ML02G1
	nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
	atmel-nand-controller 10000000.ebi:nand-controller: atmel_smc_nand_setup_data_interface(csline: -1, type: 0)
	atmel-nand-controller 10000000.ebi:nand-controller: tBERS_max: 1410065408, tCCS_min: 100000, tPROG_max: 700000000, tR_max: 25000000
	atmel-nand-controller 10000000.ebi:nand-controller: tALH_min: 5000, tADL_min: 400000, tALS_min: 10000, tAR_min: 10000
	atmel-nand-controller 10000000.ebi:nand-controller: tCEA_max: 25000, tCEH_min: 20000, tCH_min: 5000, tCHZ_max: 30000
	atmel-nand-controller 10000000.ebi:nand-controller: tCLH_min: 5000, tCLR_min: 10000, tCLS_min: 10000, tCOH_min: 15000
	atmel-nand-controller 10000000.ebi:nand-controller: tCS_min: 20000, tDH_min: 5000, tDS_min: 10000, tFEAT_max: 1000000
	atmel-nand-controller 10000000.ebi:nand-controller: tIR_min: 0, tITC_max: 1000000, tRC_min: 25000, tREA_max: 20000
	atmel-nand-controller 10000000.ebi:nand-controller: tREH_min: 10000, tRHOH_min: 15000, tRHW_min: 100000, tRHZ_max: 100000
	atmel-nand-controller 10000000.ebi:nand-controller: tRLOH_min: 5000, tRP_min: 12000, tRR_min: 20000, tRST_max: 500000000
	atmel-nand-controller 10000000.ebi:nand-controller: tWB_max: 100000, tWC_min: 25000, tWH_min: 10000, tWHR_min: 80000
	atmel-nand-controller 10000000.ebi:nand-controller: tWP_min: 12000, tWW_min: 100000
	atmel-nand-controller 10000000.ebi:nand-controller: smcconf: setup: 0x00000001, pulse: 0x05020502, cycle: 0x00050005, timings: 0x88030282, mode: 0x001b0003
	atmel-nand-controller 10000000.ebi:nand-controller: atmel_smc_nand_setup_data_interface(csline: 0, type: 0)
	atmel-nand-controller 10000000.ebi:nand-controller: tBERS_max: 1410065408, tCCS_min: 100000, tPROG_max: 700000000, tR_max: 25000000
	atmel-nand-controller 10000000.ebi:nand-controller: tALH_min: 5000, tADL_min: 400000, tALS_min: 10000, tAR_min: 10000
	atmel-nand-controller 10000000.ebi:nand-controller: tCEA_max: 25000, tCEH_min: 20000, tCH_min: 5000, tCHZ_max: 30000
	atmel-nand-controller 10000000.ebi:nand-controller: tCLH_min: 5000, tCLR_min: 10000, tCLS_min: 10000, tCOH_min: 15000
	atmel-nand-controller 10000000.ebi:nand-controller: tCS_min: 20000, tDH_min: 5000, tDS_min: 10000, tFEAT_max: 1000000
	atmel-nand-controller 10000000.ebi:nand-controller: tIR_min: 0, tITC_max: 1000000, tRC_min: 25000, tREA_max: 20000
	atmel-nand-controller 10000000.ebi:nand-controller: tREH_min: 10000, tRHOH_min: 15000, tRHW_min: 100000, tRHZ_max: 100000
	atmel-nand-controller 10000000.ebi:nand-controller: tRLOH_min: 5000, tRP_min: 12000, tRR_min: 20000, tRST_max: 500000000
	atmel-nand-controller 10000000.ebi:nand-controller: tWB_max: 100000, tWC_min: 25000, tWH_min: 10000, tWHR_min: 80000
	atmel-nand-controller 10000000.ebi:nand-controller: tWP_min: 12000, tWW_min: 100000
	atmel-nand-controller 10000000.ebi:nand-controller: smcconf: setup: 0x00000001, pulse: 0x05020502, cycle: 0x00050005, timings: 0x88030282, mode: 0x001b0003

I could not double check here with devmem, because I got no login prompt 
anymore, all those errors from the first mail follow. I didn't double 
check with the S34ML02G1 datasheet here, but those smc timings he wants 
to set don't look completely bad.

Greets
Alex

--nextPart5041215.SXLXhUq288
Content-Disposition: attachment; filename="0001-dump-nand-and-smc-timings.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0001-dump-nand-and-smc-timings.patch"

>From 61e7c97a9035406a86442f7a05218d0938381b1c Mon Sep 17 00:00:00 2001
From: Alexander Dahl <ada@thorsis.com>
Date: Fri, 28 Jul 2017 14:30:49 +0200
Subject: [PATCH] dump nand and smc timings

---
 drivers/mtd/nand/atmel/nand-controller.c | 57 +++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
index d922a88..f42ac8b 100644
--- a/drivers/mtd/nand/atmel/nand-controller.c
+++ b/drivers/mtd/nand/atmel/nand-controller.c
@@ -1413,9 +1413,64 @@ static int atmel_smc_nand_setup_data_interface(struct atmel_nand *nand,
 
 	nc = to_nand_controller(nand->base.controller);
 
+	dev_info(nc->dev, "atmel_smc_nand_setup_data_interface(csline: %i, type: %i)",
+		 csline, conf->type);
+	dev_info(nc->dev, "tBERS_max: %u, tCCS_min: %u, tPROG_max: %u, tR_max: %u",
+		 conf->timings.sdr.tBERS_max,
+		 conf->timings.sdr.tCCS_min,
+		 conf->timings.sdr.tPROG_max,
+		 conf->timings.sdr.tR_max);
+	dev_info(nc->dev, "tALH_min: %u, tADL_min: %u, tALS_min: %u, tAR_min: %u",
+		 conf->timings.sdr.tALH_min,
+		 conf->timings.sdr.tADL_min,
+		 conf->timings.sdr.tALS_min,
+		 conf->timings.sdr.tAR_min);
+	dev_info(nc->dev, "tCEA_max: %u, tCEH_min: %u, tCH_min: %u, tCHZ_max: %u",
+		 conf->timings.sdr.tCEA_max,
+		 conf->timings.sdr.tCEH_min,
+		 conf->timings.sdr.tCH_min,
+		 conf->timings.sdr.tCHZ_max);
+	dev_info(nc->dev, "tCLH_min: %u, tCLR_min: %u, tCLS_min: %u, tCOH_min: %u",
+		 conf->timings.sdr.tCLH_min,
+		 conf->timings.sdr.tCLR_min,
+		 conf->timings.sdr.tCLS_min,
+		 conf->timings.sdr.tCOH_min);
+	dev_info(nc->dev, "tCS_min: %u, tDH_min: %u, tDS_min: %u, tFEAT_max: %u",
+		 conf->timings.sdr.tCS_min,
+		 conf->timings.sdr.tDH_min,
+		 conf->timings.sdr.tDS_min,
+		 conf->timings.sdr.tFEAT_max);
+	dev_info(nc->dev, "tIR_min: %u, tITC_max: %u, tRC_min: %u, tREA_max: %u",
+		 conf->timings.sdr.tIR_min,
+		 conf->timings.sdr.tITC_max,
+		 conf->timings.sdr.tRC_min,
+		 conf->timings.sdr.tREA_max);
+	dev_info(nc->dev, "tREH_min: %u, tRHOH_min: %u, tRHW_min: %u, tRHZ_max: %u",
+		 conf->timings.sdr.tREH_min,
+		 conf->timings.sdr.tRHOH_min,
+		 conf->timings.sdr.tRHW_min,
+		 conf->timings.sdr.tRHZ_max);
+	dev_info(nc->dev, "tRLOH_min: %u, tRP_min: %u, tRR_min: %u, tRST_max: %llu",
+		 conf->timings.sdr.tRLOH_min,
+		 conf->timings.sdr.tRP_min,
+		 conf->timings.sdr.tRR_min,
+		 conf->timings.sdr.tRST_max);
+	dev_info(nc->dev, "tWB_max: %u, tWC_min: %u, tWH_min: %u, tWHR_min: %u",
+		 conf->timings.sdr.tWB_max,
+		 conf->timings.sdr.tWC_min,
+		 conf->timings.sdr.tWH_min,
+		 conf->timings.sdr.tWHR_min);
+	dev_info(nc->dev, "tWP_min: %u, tWW_min: %u",
+		 conf->timings.sdr.tWP_min,
+		 conf->timings.sdr.tWW_min);
+
 	ret = atmel_smc_nand_prepare_smcconf(nand, conf, &smcconf);
-	if (ret)
+	if (ret) {
+		dev_err(nc->dev, "atmel_smc_nand_prepare_smcconf() failed: %i", ret);
 		return ret;
+	}
+	dev_info(nc->dev, "smcconf: setup: 0x%08x, pulse: 0x%08x, cycle: 0x%08x, timings: 0x%08x, mode: 0x%08x",
+		 smcconf.setup, smcconf.pulse, smcconf.cycle, smcconf.timings, smcconf.mode);
 
 	if (csline == NAND_DATA_IFACE_CHECK_ONLY)
 		return 0;
-- 
2.1.4


--nextPart5041215.SXLXhUq288--
