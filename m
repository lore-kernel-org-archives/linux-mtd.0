Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFWo1-0000ID-Eb
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2012 20:27:50 +0000
Received: by dadn15 with SMTP id n15so821534dad.16
 for <linux-mtd@lists.infradead.org>; Wed, 04 Apr 2012 13:27:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120404183314.GF17187@pengutronix.de>
References: <CAOdLEarFOdmDBS0iDmafLeBU=NNWxWjejTvJ-eEkQjRO12+VYg@mail.gmail.com>
 <20120404070157.GB24930@pengutronix.de>
 <CAOdLEaqXyvHzTRSq2=RquZLqEO6kMEp11rjKJ+UtSqtF4nr-EA@mail.gmail.com>
 <20120404183314.GF17187@pengutronix.de>
Date: Wed, 4 Apr 2012 13:27:46 -0700
Message-ID: <CAOdLEaoboQowyx3T9ONjv-Y3q1JfFRb4ahS8CNrzeJi3N8Dczg@mail.gmail.com>
Subject: Re: Using GPMI-NAND driver on iMX28 using 3.4-rc1?
From: Sam Gandhi <samgandhi9@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Would love to see how you registering your nand device for your board,
if that can be shared?

I am using the 3.4-rc1 from kernel.org

I am registering nand device using function below, it is exact same
board as MX28EVK board as far as pin setups are ( fwiw on this board
older implementation NAND_NFC works just fine )

static int board_gpmi_nand_platform_init(void)
{
        return mxs_iomux_setup_multiple_pads(board_gpmi_nand_pads,
                                ARRAY_SIZE(board_gpmi_nand_pads));
}

struct gpmi_nand_platform_data amp_nand_config =3D {
        .platform_init =3D board_gpmi_nand_platform_init,
        .min_prop_delay_in_ns =3D 5,
        .max_prop_delay_in_ns =3D 9,
        .max_chip_count =3D 1,
        .partitions =3D 0,
        .partition_count =3D 0,
};
static void mx28_nand_register()
{
        mxs_add_gpmi_nand( &amp_nand_config  ,&mx28_gpmi_nand_data);
}

Now I boot the board with command mtdparts=3D"gpmi-nand:10m(boot),-(fs)"
I do see /dev/mtd0, mtd1 cat /proc/mtd shows right information.

During init relevant messages related to nand are:

mxs-dma mxs-dma-apbh: initialized
mxs-dma mxs-dma-apbx: initialized
...
ONFI param page 0 valid
ONFI flash detected
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron MT29F2G08ABAEAH4)
Scanning device for bad blocks
Bad eraseblock 0 at 0x000000000000
GPMI NAND driver registered. (IMX)

However moment I try to do  flash_erase /dev/mtd1 0 0 I see following error=
:

kernel BUG at /home/sam/linux/drivers/dma/dmaengine.h:53!
Internal error: Oops - BUG: 0 [#1] PREEMPT ARM
Modules linked in:
CPU: 0    Not tainted  (3.4.0-rc1-09874-g9e81810-dirty #6)
PC is at mxs_dma_int_handler+0xfc/0x16c
LR is at handle_irq_event_percpu+0xc4/0x258
pc : [<c024c924>]    lr : [<c006e47c>]    psr: 60000093
sp : c3b99b00  ip : c3b99b28  fp : c3b99b24
r10: 00000000  r9 : c0529058  r8 : 00000000
r7 : 00000010  r6 : 00000004  r5 : c3811000  r4 : 00000004
r3 : c38111e0  r2 : 00000000  r1 : 00000000  r0 : 00000058
Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0005317f  Table: 42ce4000  DAC: 00000015
Process flash_erase (pid: 1214, stack limit =3D 0xc3b98270)


-Sam

On Wed, Apr 4, 2012 at 11:33 AM, Wolfram Sang <w.sang@pengutronix.de> wrote=
:
>
>> I don't see any of the mach-* files setting up the
>> gpmi_nand_platform_data so I wonder if this GPMI-NAND driver for has
>> ever been tested for NAND on mx28?
>
> linux-mtd should contain quite some discussion about this driver :)
> And yeah, I do use it.
>
> --
> Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | Wo=
lfram Sang =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|
> Industrial Linux Solutions =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | http://www.p=
engutronix.de/ =A0|
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.10 (GNU/Linux)
>
> iEUEARECAAYFAk98k+oACgkQD27XaX1/VRsaggCfcBhlEj9Yyof2YTcFMlPRBtto
> R3UAmJr1XJ8681YRJJhWYGzLiPYAdfo=3D
> =3DEEDL
> -----END PGP SIGNATURE-----
>
