From: nagasure@xilinx.com (Naga Sureshkumar Relli)
Date: Thu, 17 Jan 2019 11:01:26 +0000
Subject: [LINUX PATCH v12] mtd: rawnand: pl353: Add basic driver for arm
 pl353 smc nand interface
In-Reply-To: <CABgxDoKgC_oYkKf5hsyDnH6USeqbjSFGV6R4rxpTDAYUiQcBkg@mail.gmail.com>
References: <1533620414-3332-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20181221091750.GA19470@hp-probook-450> <20190102093338.3b4a8c69@xps13>
 <MWHPR02MB26237BE35B07E8930B5E2AB2AF8C0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <CABgxDoKgC_oYkKf5hsyDnH6USeqbjSFGV6R4rxpTDAYUiQcBkg@mail.gmail.com>
Message-ID: <DM5PR02MB2617E518DC7148ABE27A85C4AF830@DM5PR02MB2617.namprd02.prod.outlook.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi Romain,

> -----Original Message-----
> From: Romain Perier [mailto:romain.perier at gmail.com]
> Sent: Monday, January 7, 2019 3:56 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>; Boris Brezillon
> <bbrezillon@kernel.org>; linux-mtd at lists.infradead.org; peterpandong at micron.com;
> linux-kernel at vger.kernel.org
> Subject: Re: [LINUX PATCH v12] mtd: rawnand: pl353: Add basic driver for arm pl353
> smc nand interface
> 
> Hi,
> 
> Le mer. 2 janv. 2019 ? 10:23, Naga Sureshkumar Relli <nagasure@xilinx.com> a ?crit :
> >
> > Hi,
> >
> > > -----Original Message-----
> > > From: Miquel Raynal [mailto:miquel.raynal at bootlin.com]
> > > Sent: Wednesday, January 2, 2019 2:04 PM
> > > To: Romain Perier <romain.perier@gmail.com>
> > > Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>; Boris Brezillon
> > > <bbrezillon@kernel.org>; linux-mtd at lists.infradead.org;
> > > peterpandong at micron.com; linux-kernel at vger.kernel.org
> > > Subject: Re: [LINUX PATCH v12] mtd: rawnand: pl353: Add basic driver
> > > for arm pl353 smc nand interface
> > >
> > > Hi Romain,
> > >
> > > Switching Boris address.
> > >
> > > Romain Perier <romain.perier@gmail.com> wrote on Fri, 21 Dec 2018
> > > 10:17:50 +0100:
> > >
> > > > Hello,
> > > >
> > > > I have rebased this patch onto 4.19.11. I use it on a
> > > > Zynq7000-based board with a NAND chip Micron MT29F4G08ABADAH4, since ~2
> weeks now.
> > > > The only problem I have to report is that when I boot with an
> > > > unchanged driver on my board, I get the following logs:
> > > >
> > > > [    1.988797] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xdc
> > > > [    1.995184] nand: Micron MT29F4G08ABADAH4
> > > > [    1.999187] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> > > > [    2.402661] nand: timeout while waiting for chip to become ready
> > > > [    2.408665] nand: timing mode 5 not acknowledged by the NAND chip
> > > > [    2.416251] Bad block table not found for chip 0
> > > > [    2.422278] Bad block table not found for chip 0
> > > > [    2.426903] Scanning device for bad blocks
> > > > [    2.431024] Bad eraseblock 0 at 0x000000000000
> > > > [    2.435509] Bad eraseblock 1 at 0x000000020000
> > > > [    2.439978] Bad eraseblock 2 at 0x000000040000
> > > > [    2.444465] Bad eraseblock 3 at 0x000000060000
> > > > [    2.448936] Bad eraseblock 4 at 0x000000080000
> > > > [    2.453423] Bad eraseblock 5 at 0x0000000a0000
> > > > [    2.457893] Bad eraseblock 6 at 0x0000000c0000
> > > > [    2.462354] Bad eraseblock 7 at 0x0000000e0000
> > > > [    2.466841] Bad eraseblock 8 at 0x000000100000
> > > > [    2.471304] Bad eraseblock 9 at 0x000000120000
> > > > [    2.475793] Bad eraseblock 10 at 0x000000140000
> > > > [    2.480349] Bad eraseblock 11 at 0x000000160000
> > > >
> > > > [...]
> > > >
> > > >
> > > > After investigation, it seems that during the nand_scan phase, the
> > > > NAND subsystem tests different timing modes on the NAND chip (mode
> > > > 0 seems to be apply during reset, and then it tries to detect the
> > > > best mode supported by the NAND chip). Only the mode 0 works here,
> > > > trying the use the mode 5 resuls in an error (as you can see in
> > > > the log) and a bad BBT detection. Both modes are supported by the
> > > > NAND chip. In order to fix this, I had to put the nfc timing into
> > > > the device node of the nfc, inside the DT
> > > (that's not a real fix, ihmo).
> > >
> > > Thanks for testing! Indeed, the ->setup_data_interface() callback should be fixed.
> > Ok, let me check.
> > Meanwhile, can you share the timings that you put inside the DT?
> 
> Sure, I have simply added an array in the DT:
> 
> pl353,nand-controller-timings=<4 4 2 2 1 1 2>;
But the below values are not matching with sdr mode 5 timings.
The value at index 3, represents tWP_min and as per SDR mode5 timings this value is 1 (expressed in clock cycles).
And also value at index 1 represents tWC_min and as per SDR mode5 timings this value is 2.
I will also cross check the setup_data_interface() hook.

Miqual, this version of driver is rebased on top of 4.19, I will send next version on top of 4.20

Thanks,
Naga Sureshkumar Relli
> 
> Then, I pass this array directly to pl353_smc_set_cycles().  (I got these value from the hdf
> originally, then I ported the DT to a mainline format, written by hand).
> 
> Hope this helps,
> Regards,
> Romain
> 
> > >
> > > > Except this, everything is working as expected. Everything is
> > > > stable with correct performances.
> > > >
> > > > If I can provide more informations, feel free to ask.
> > >
> > > [...]
> > >
> > > > > +static int pl353_setup_data_interface(struct mtd_info *mtd, int csline,
> > > > > +                                const struct
> > > > > +nand_data_interface *conf) {  struct nand_chip *chip =
> > > > > +mtd_to_nand(mtd);  struct pl353_nand_controller *xnfc =
> > > > > +         container_of(chip, struct pl353_nand_controller,
> > > > > +chip);  const struct nand_sdr_timings *sdr;
> > > > > + u32 timings[7], mckperiodps;
> > > > > +
> > > > > + if (csline == NAND_DATA_IFACE_CHECK_ONLY)
> > > > > +         return 0;
> > > > > +
> > > > > + sdr = nand_get_sdr_timings(conf); if (IS_ERR(sdr))
> > > > > +         return PTR_ERR(sdr);
> > > > > +
> > > > > + /*
> > > > > +  * SDR timings are given in pico-seconds while NFC timings
> > > > > + must be
> > > > > +  * expressed in NAND controller clock cycles.
> > > > > +  */
> > > > > + mckperiodps = NSEC_PER_SEC / clk_get_rate(xnfc->mclk);
> > > > > + mckperiodps *= 1000; if (sdr->tRC_min <= 20000)
> > > > > +         /*
> > > > > +          * PL353 SMC needs one extra read cycle in SDR Mode 5
> > > > > +          * This is not written anywhere in the datasheet but
> > > > > +          * the results observed during testing.
> > > > > +          */
> > > > > +         timings[0] = DIV_ROUND_UP(sdr->tRC_min, mckperiodps) +
> > > > > + 1; else
> > > > > +         timings[0] = DIV_ROUND_UP(sdr->tRC_min, mckperiodps);
> > > > > +
> > > > > + timings[1] = DIV_ROUND_UP(sdr->tWC_min, mckperiodps);
> > > > > + /*
> > > > > +  * For all SDR modes, PL353 SMC needs tREA max value as 1,
> > > > > +  * Results observed during testing.
> > > > > +  */
> > > > > + timings[2] = PL353_TREA_MAX_VALUE; timings[3] =
> > > > > + DIV_ROUND_UP(sdr->tWP_min, mckperiodps); timings[4] =
> > > > > + DIV_ROUND_UP(sdr->tCLR_min, mckperiodps); timings[5] =
> > > > > + DIV_ROUND_UP(sdr->tAR_min, mckperiodps); timings[6] =
> > > > > + DIV_ROUND_UP(sdr->tRR_min, mckperiodps);
> > > > > + pl353_smc_set_cycles(timings);
> > > > > +
> > > > > + return 0;
> > > > > +}
> > > >
> > > > If I hack this function in order to limit the timings only to mode
> > > > 0, everything works. Otherwise it hangs when it tries to apply mode 5.
> > > >
> > >
> > > Maybe Naga is not using a chip compatible with mode 5 and did not ran into this issue?
> > No, these are the chips I am using, S34ML01G1 and MT29F2G16ABAEAWP.
> > These are up to mode 5 compatible.
> >
> > Thanks,
> > Naga Sureshkumar Relli
> > >
> > >
> > > Thanks,
> > > Miqu?l
