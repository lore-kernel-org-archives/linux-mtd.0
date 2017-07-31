Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dc5OA-0000zC-Kq
 for linux-mtd@lists.infradead.org; Mon, 31 Jul 2017 07:45:21 +0000
Date: Mon, 31 Jul 2017 09:44:43 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexander Dahl <ada@thorsis.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: mtd: nand: atmel: probe of Spansion S34ML02G1 fails
Message-ID: <20170731094443.25511c00@bbrezillon>
In-Reply-To: <55614391.xdWgSdKuKi@ada>
References: <5326598.QgYTQxcFMR@ada> <2274647.ublHvqEhgW@ada>
 <20170728211301.10d25227@bbrezillon> <55614391.xdWgSdKuKi@ada>
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

Hi Alexander,

On Mon, 31 Jul 2017 08:29:35 +0200
Alexander Dahl <ada@thorsis.com> wrote:

> Hello Boris,
>=20
> Am Freitag, 28. Juli 2017, 21:13:01 schrieb Boris Brezillon:
> > Can you try with the following patch? Timings are expressed in
> > picoseconds and this test was testing against a value expressed in
> > nanoseconds.
> >=20
> > BTW, did you try to comment the line I pointed out yesterday? I'd like
> > to be sure this is a timing issue. =20
>=20
> Now I did, see my other mail.
>=20
> > --->8--- =20
> > diff --git a/drivers/mtd/nand/atmel/nand-controller.c
> > b/drivers/mtd/nand/atmel/nand-controller.c index
> > d922a88e407f..2c8baa0c2c4e 100644
> > --- a/drivers/mtd/nand/atmel/nand-controller.c
> > +++ b/drivers/mtd/nand/atmel/nand-controller.c
> > @@ -1201,7 +1201,7 @@ static int atmel_smc_nand_prepare_smcconf(struct
> > atmel_nand *nand, * tRC < 30ns implies EDO mode. This controller does
> > not support this * mode.
> >          */
> > -       if (conf->timings.sdr.tRC_min < 30)
> > +       if (conf->timings.sdr.tRC_min < 30000)
> >                 return -ENOTSUPP;
> >=20
> >         atmel_smc_cs_conf_init(smcconf); =20
>=20
> This gives me the following debug output (with my own debug messages=20
> from the patch in one mail from last week, with an additional dump of=20
> the values read from onfi page):
>=20
> atmel-nand-controller 10000000.ebi:nand-controller: atmel_smc_nand_setup_=
data_interface(csline: 0, type: 0)
> atmel-nand-controller 10000000.ebi:nand-controller: tBERS_max: 0, tCCS_mi=
n: 500000, tPROG_max: 0, tR_max: 200000000
> atmel-nand-controller 10000000.ebi:nand-controller: tALH_min: 20000, tADL=
_min: 400000, tALS_min: 50000, tAR_min: 25000
> atmel-nand-controller 10000000.ebi:nand-controller: tCEA_max: 100000, tCE=
H_min: 20000, tCH_min: 20000, tCHZ_max: 100000
> atmel-nand-controller 10000000.ebi:nand-controller: tCLH_min: 20000, tCLR=
_min: 20000, tCLS_min: 50000, tCOH_min: 0
> atmel-nand-controller 10000000.ebi:nand-controller: tCS_min: 70000, tDH_m=
in: 20000, tDS_min: 40000, tFEAT_max: 1000000
> atmel-nand-controller 10000000.ebi:nand-controller: tIR_min: 10000, tITC_=
max: 1000000, tRC_min: 100000, tREA_max: 40000
> atmel-nand-controller 10000000.ebi:nand-controller: tREH_min: 30000, tRHO=
H_min: 0, tRHW_min: 200000, tRHZ_max: 200000
> atmel-nand-controller 10000000.ebi:nand-controller: tRLOH_min: 0, tRP_min=
: 50000, tRR_min: 40000, tRST_max: 250000000000
> atmel-nand-controller 10000000.ebi:nand-controller: tWB_max: 200000, tWC_=
min: 100000, tWH_min: 30000, tWHR_min: 120000
> atmel-nand-controller 10000000.ebi:nand-controller: tWP_min: 50000, tWW_m=
in: 100000
> atmel-nand-controller 10000000.ebi:nand-controller: smcconf: setup: 0x000=
00002, pulse: 0x0f080f08, cycle: 0x000f000f, timings: 0x88060483, mode: 0x0=
01f0003
> nand: device found, Manufacturer ID: 0x01, Chip ID: 0xda
> nand: AMD/Spansion S34ML02G1
> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> onfi timings: t_prog: 0x02BC, t_bers: 0x2710, t_r: 0x0019, t_ccs: 0x0064
> atmel-nand-controller 10000000.ebi:nand-controller: atmel_smc_nand_setup_=
data_interface(csline: -1, type: 0)
> atmel-nand-controller 10000000.ebi:nand-controller: tBERS_max: 1410065408=
, tCCS_min: 100000, tPROG_max: 700000000, tR_max: 25000000
> atmel-nand-controller 10000000.ebi:nand-controller: tALH_min: 5000, tADL_=
min: 400000, tALS_min: 10000, tAR_min: 10000
> atmel-nand-controller 10000000.ebi:nand-controller: tCEA_max: 25000, tCEH=
_min: 20000, tCH_min: 5000, tCHZ_max: 30000
> atmel-nand-controller 10000000.ebi:nand-controller: tCLH_min: 5000, tCLR_=
min: 10000, tCLS_min: 10000, tCOH_min: 15000
> atmel-nand-controller 10000000.ebi:nand-controller: tCS_min: 20000, tDH_m=
in: 5000, tDS_min: 10000, tFEAT_max: 1000000
> atmel-nand-controller 10000000.ebi:nand-controller: tIR_min: 0, tITC_max:=
 1000000, tRC_min: 25000, tREA_max: 20000
> atmel-nand-controller 10000000.ebi:nand-controller: tREH_min: 10000, tRHO=
H_min: 15000, tRHW_min: 100000, tRHZ_max: 100000
> atmel-nand-controller 10000000.ebi:nand-controller: tRLOH_min: 5000, tRP_=
min: 12000, tRR_min: 20000, tRST_max: 500000000
> atmel-nand-controller 10000000.ebi:nand-controller: tWB_max: 100000, tWC_=
min: 25000, tWH_min: 10000, tWHR_min: 80000
> atmel-nand-controller 10000000.ebi:nand-controller: tWP_min: 12000, tWW_m=
in: 100000
> atmel-nand-controller 10000000.ebi:nand-controller: atmel_smc_nand_prepar=
e_smcconf() failed: -524
> onfi timings: t_prog: 0x02BC, t_bers: 0x2710, t_r: 0x0019, t_ccs: 0x0064
> atmel-nand-controller 10000000.ebi:nand-controller: atmel_smc_nand_setup_=
data_interface(csline: -1, type: 0)
> atmel-nand-controller 10000000.ebi:nand-controller: tBERS_max: 1410065408=
, tCCS_min: 100000, tPROG_max: 700000000, tR_max: 25000000
> atmel-nand-controller 10000000.ebi:nand-controller: tALH_min: 5000, tADL_=
min: 400000, tALS_min: 10000, tAR_min: 10000
> atmel-nand-controller 10000000.ebi:nand-controller: tCEA_max: 25000, tCEH=
_min: 20000, tCH_min: 5000, tCHZ_max: 50000
> atmel-nand-controller 10000000.ebi:nand-controller: tCLH_min: 5000, tCLR_=
min: 10000, tCLS_min: 10000, tCOH_min: 15000
> atmel-nand-controller 10000000.ebi:nand-controller: tCS_min: 25000, tDH_m=
in: 5000, tDS_min: 10000, tFEAT_max: 1000000
> atmel-nand-controller 10000000.ebi:nand-controller: tIR_min: 0, tITC_max:=
 1000000, tRC_min: 30000, tREA_max: 20000
> atmel-nand-controller 10000000.ebi:nand-controller: tREH_min: 10000, tRHO=
H_min: 15000, tRHW_min: 100000, tRHZ_max: 100000
> atmel-nand-controller 10000000.ebi:nand-controller: tRLOH_min: 0, tRP_min=
: 15000, tRR_min: 20000, tRST_max: 500000000
> atmel-nand-controller 10000000.ebi:nand-controller: tWB_max: 100000, tWC_=
min: 30000, tWH_min: 10000, tWHR_min: 80000
> atmel-nand-controller 10000000.ebi:nand-controller: tWP_min: 15000, tWW_m=
in: 100000
> atmel-nand-controller 10000000.ebi:nand-controller: smcconf: setup: 0x000=
00001, pulse: 0x06030603, cycle: 0x00060006, timings: 0x88030282, mode: 0x0=
01b0003
> atmel-nand-controller 10000000.ebi:nand-controller: atmel_smc_nand_setup_=
data_interface(csline: 0, type: 0)
> atmel-nand-controller 10000000.ebi:nand-controller: tBERS_max: 1410065408=
, tCCS_min: 100000, tPROG_max: 700000000, tR_max: 25000000
> atmel-nand-controller 10000000.ebi:nand-controller: tALH_min: 5000, tADL_=
min: 400000, tALS_min: 10000, tAR_min: 10000
> atmel-nand-controller 10000000.ebi:nand-controller: tCEA_max: 25000, tCEH=
_min: 20000, tCH_min: 5000, tCHZ_max: 50000
> atmel-nand-controller 10000000.ebi:nand-controller: tCLH_min: 5000, tCLR_=
min: 10000, tCLS_min: 10000, tCOH_min: 15000
> atmel-nand-controller 10000000.ebi:nand-controller: tCS_min: 25000, tDH_m=
in: 5000, tDS_min: 10000, tFEAT_max: 1000000
> atmel-nand-controller 10000000.ebi:nand-controller: tIR_min: 0, tITC_max:=
 1000000, tRC_min: 30000, tREA_max: 20000
> atmel-nand-controller 10000000.ebi:nand-controller: tREH_min: 10000, tRHO=
H_min: 15000, tRHW_min: 100000, tRHZ_max: 100000
> atmel-nand-controller 10000000.ebi:nand-controller: tRLOH_min: 0, tRP_min=
: 15000, tRR_min: 20000, tRST_max: 500000000
> atmel-nand-controller 10000000.ebi:nand-controller: tWB_max: 100000, tWC_=
min: 30000, tWH_min: 10000, tWHR_min: 80000
> atmel-nand-controller 10000000.ebi:nand-controller: tWP_min: 15000, tWW_m=
in: 100000
> atmel-nand-controller 10000000.ebi:nand-controller: smcconf: setup: 0x000=
00001, pulse: 0x06030603, cycle: 0x00060006, timings: 0x88030282, mode: 0x0=
01b0003
>=20
> So, the system boots again, meaning it can successfully read from the=20
> ubifs.

Cool. I'll send a patch to fix that.

> The resulting timings are the same as in debug output:
>=20
> $ devmem 0xffffec30
> 0x00000001
> $ devmem 0xffffec34
> 0x06030603
> $ devmem 0xffffec38
> 0x00060006
> $ devmem 0xffffec3c
> 0x001B0003
>=20
> One thing I noticed is the tBERS_max value. From the 0x2710 in=20
> the onfi page I would assume 10000 =C2=B5s, so 10.000.000 ns, so=20
> 10.000.000.000 ps, which does not fit in an u32 anymore, which gives=20
> those 1410065408 due to integer overflow.

Indeed, it should be an u64 not an u32.

> I didn't check the other=20
> timings for possible overflow, maybe you can do this?

Yep, we have the same problem with tR_max and tPROG_max.

I'll send a patch to fix that.

Thanks,

Boris
