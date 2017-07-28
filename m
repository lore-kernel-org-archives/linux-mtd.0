Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dbAhP-0007Hj-93
 for linux-mtd@lists.infradead.org; Fri, 28 Jul 2017 19:13:26 +0000
Date: Fri, 28 Jul 2017 21:13:01 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexander Dahl <ada@thorsis.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: mtd: nand: atmel: probe of Spansion S34ML02G1 fails
Message-ID: <20170728211301.10d25227@bbrezillon>
In-Reply-To: <2274647.ublHvqEhgW@ada>
References: <5326598.QgYTQxcFMR@ada> <9879279.x3T2Y4a6KK@ada>
 <20170726203326.2159f0cc@bbrezillon> <2274647.ublHvqEhgW@ada>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Fri, 28 Jul 2017 15:15:25 +0200,
Alexander Dahl <ada@thorsis.com> a =C3=A9crit :

> Hello Boris,
>=20
> Am Mittwoch, 26. Juli 2017, 20:33:26 schrieb Boris Brezillon:
> > Okay, first thing to test: revert f9ce2eddf176 ("mtd: nand: atmel: Add =
=20
> > ->setup_data_interface() hooks"). You may have to revert other =20
> > commits to compile the driver.
> >=20
> > If it works, I'd like you to drop SMC timings in both situations (with
> > and without this commit).
> >=20
> > I'd also like to to dump NAND timings (those passed to =20
> > ->setup_data_interface()). =20
>=20
> So based on those three atmel-ebi patches from earlier this week I used=20
> the attached patch to dump the nand timings and smc settings before the=20
> get applied. clk mck runs at 132096000 Hz (slow_xtal 32768, main_xtal=20
> 18432000). Previously clock settings for NAND were set in (very old) U-
> Boot to this (double checked, Linux didn't touch it):
>=20
> 	U-Boot> md.l 0xffffef1c 1
> 	ffffef1c: 0001000a    ....
> 	U-Boot> md.l 0xffffec30 4
> 	ffffec30: 00010001 03030303 00050005 00020003    ................
>=20
> So setup, pulse, cycle, tdf all to quite low number of clock cycles, but=
=20
> as far as I can tell this worked with all flash chips we had connected=20
> over the years.
>=20
> Now with the old Hynix flash chip, I get the following:
>=20
> 	atmel-nand-controller 10000000.ebi:nand-controller: atmel_smc_nand_setup=
_data_interface(csline: 0, type: 0)
> 	atmel-nand-controller 10000000.ebi:nand-controller: tBERS_max: 0, tCCS_m=
in: 500000, tPROG_max: 0, tR_max: 200000000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tALH_min: 20000, tAD=
L_min: 400000, tALS_min: 50000, tAR_min: 25000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tCEA_max: 100000, tC=
EH_min: 20000, tCH_min: 20000, tCHZ_max: 100000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tCLH_min: 20000, tCL=
R_min: 20000, tCLS_min: 50000, tCOH_min: 0
> 	atmel-nand-controller 10000000.ebi:nand-controller: tCS_min: 70000, tDH_=
min: 20000, tDS_min: 40000, tFEAT_max: 1000000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tIR_min: 10000, tITC=
_max: 1000000, tRC_min: 100000, tREA_max: 40000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tREH_min: 30000, tRH=
OH_min: 0, tRHW_min: 200000, tRHZ_max: 200000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tRLOH_min: 0, tRP_mi=
n: 50000, tRR_min: 40000, tRST_max: 250000000000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tWB_max: 200000, tWC=
_min: 100000, tWH_min: 30000, tWHR_min: 120000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tWP_min: 50000, tWW_=
min: 100000
> 	atmel-nand-controller 10000000.ebi:nand-controller: smcconf: setup: 0x00=
000002, pulse: 0x0f080f08, cycle: 0x000f000f, timings: 0x88060483, mode: 0x=
001f0003
> 	nand: Could not find valid ONFI parameter page; aborting
> 	nand: device found, Manufacturer ID: 0xad, Chip ID: 0xda
> 	nand: Hynix NAND 256MiB 3,3V 8-bit
> 	nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
>=20
> 	$ devmem 0xffffef1c
> 	0x0001000A
> 	$ devmem 0xffffec30
> 	0x00000002
> 	$ devmem 0xffffec34
> 	0x0F080F08
> 	$ devmem 0xffffec38
> 	0x000F000F
> 	$ devmem 0xffffec3c
> 	0x001F0003
>=20
> To me those values look like some kind of defaults every nand chip should=
 run with?
>=20
> The failing Spansion chip here:
>=20
> 	atmel-nand-controller 10000000.ebi:nand-controller: atmel_smc_nand_setup=
_data_interface(csline: 0, type: 0)
> 	atmel-nand-controller 10000000.ebi:nand-controller: tBERS_max: 0, tCCS_m=
in: 500000, tPROG_max: 0, tR_max: 200000000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tALH_min: 20000, tAD=
L_min: 400000, tALS_min: 50000, tAR_min: 25000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tCEA_max: 100000, tC=
EH_min: 20000, tCH_min: 20000, tCHZ_max: 100000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tCLH_min: 20000, tCL=
R_min: 20000, tCLS_min: 50000, tCOH_min: 0
> 	atmel-nand-controller 10000000.ebi:nand-controller: tCS_min: 70000, tDH_=
min: 20000, tDS_min: 40000, tFEAT_max: 1000000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tIR_min: 10000, tITC=
_max: 1000000, tRC_min: 100000, tREA_max: 40000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tREH_min: 30000, tRH=
OH_min: 0, tRHW_min: 200000, tRHZ_max: 200000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tRLOH_min: 0, tRP_mi=
n: 50000, tRR_min: 40000, tRST_max: 250000000000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tWB_max: 200000, tWC=
_min: 100000, tWH_min: 30000, tWHR_min: 120000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tWP_min: 50000, tWW_=
min: 100000
> 	atmel-nand-controller 10000000.ebi:nand-controller: smcconf: setup: 0x00=
000002, pulse: 0x0f080f08, cycle: 0x000f000f, timings: 0x88060483, mode: 0x=
001f0003
> 	nand: device found, Manufacturer ID: 0x01, Chip ID: 0xda
> 	nand: AMD/Spansion S34ML02G1
> 	nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> 	atmel-nand-controller 10000000.ebi:nand-controller: atmel_smc_nand_setup=
_data_interface(csline: -1, type: 0)
> 	atmel-nand-controller 10000000.ebi:nand-controller: tBERS_max: 141006540=
8, tCCS_min: 100000, tPROG_max: 700000000, tR_max: 25000000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tALH_min: 5000, tADL=
_min: 400000, tALS_min: 10000, tAR_min: 10000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tCEA_max: 25000, tCE=
H_min: 20000, tCH_min: 5000, tCHZ_max: 30000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tCLH_min: 5000, tCLR=
_min: 10000, tCLS_min: 10000, tCOH_min: 15000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tCS_min: 20000, tDH_=
min: 5000, tDS_min: 10000, tFEAT_max: 1000000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tIR_min: 0, tITC_max=
: 1000000, tRC_min: 25000, tREA_max: 20000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tREH_min: 10000, tRH=
OH_min: 15000, tRHW_min: 100000, tRHZ_max: 100000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tRLOH_min: 5000, tRP=
_min: 12000, tRR_min: 20000, tRST_max: 500000000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tWB_max: 100000, tWC=
_min: 25000, tWH_min: 10000, tWHR_min: 80000
> 	atmel-nand-controller 10000000.ebi:nand-controller: tWP_min: 12000, tWW_=
min: 100000
> 	atmel-nand-controller 10000000.ebi:nand-controller: smcconf: setup: 0x00=
000001, pulse: 0x05020502, cycle: 0x00050005, timings: 0x88030282, mode: 0x=
001b0003


Hm, ok. It seems that we're accepting mode 4 even though the controller
is not supporting EDO mode which mandatory for mode 4 and 5.

Can you try with the following patch? Timings are expressed in picoseconds
and this test was testing against a value expressed in nanoseconds. =20

BTW, did you try to comment the line I pointed out yesterday? I'd like
to be sure this is a timing issue.

--->8---
diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/at=
mel/nand-controller.c
index d922a88e407f..2c8baa0c2c4e 100644
--- a/drivers/mtd/nand/atmel/nand-controller.c
+++ b/drivers/mtd/nand/atmel/nand-controller.c
@@ -1201,7 +1201,7 @@ static int atmel_smc_nand_prepare_smcconf(struct atme=
l_nand *nand,
         * tRC < 30ns implies EDO mode. This controller does not support th=
is
         * mode.
         */
-       if (conf->timings.sdr.tRC_min < 30)
+       if (conf->timings.sdr.tRC_min < 30000)
                return -ENOTSUPP;
=20
        atmel_smc_cs_conf_init(smcconf);
