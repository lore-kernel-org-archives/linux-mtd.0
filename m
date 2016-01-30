Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aPTcI-0003m1-Ls
 for linux-mtd@lists.infradead.org; Sat, 30 Jan 2016 11:23:00 +0000
Date: Sat, 30 Jan 2016 12:22:19 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mason <slash.tmp@free.fr>
Cc: Brian Norris <computersforpeace@gmail.com>, Sebastian Frias
 <sf84@laposte.net>, David Woodhouse <dwmw2@infradead.org>, linux-mtd
 <linux-mtd@lists.infradead.org>
Subject: Re: RFC on large number of hacks in mtd core files
Message-ID: <20160130122219.0acac449@bbrezillon>
In-Reply-To: <56ABF506.6000203@free.fr>
References: <56A24C22.2050607@free.fr> <20160123031635.GB90611@google.com>
 <56A35BA2.3040906@free.fr> <56A65CBA.9050705@free.fr>
 <20160129172717.24a12c3d@bbrezillon> <56ABF506.6000203@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mason,

On Sat, 30 Jan 2016 00:25:58 +0100
Mason <slash.tmp@free.fr> wrote:

> Wow... you guys are truly amazing! Thanks.
> 
> On 29/01/2016 17:27, Boris Brezillon wrote:
> 
> > Hi Mason,
> > 
> > Just ignored all the changes that were not related to NAND or mtdcore
> > (i.e. drivers/mtd/{chips, maps, device})
> 
> Are you telling me to ignore them? Or are you saying you
> ignored them? Because you know they are irrelevant?

I'm saying that I didn't review those changes, because as Brian said, if
the only thing you want is to add support for your NAND controller,
then you don't need them.
So yes, you can drop them too.

> 
> > On 23/01/2016 11:53, Mason wrote:
> >
> >> $ git diff --stat -p v3.4.39 HEAD drivers/mtd include/linux/mtd
> >>
> >>  drivers/mtd/Kconfig                 |   14 +-
> >>  drivers/mtd/chips/cfi_cmdset_0002.c |  127 ++-
> >>  drivers/mtd/devices/m25p80.c        |  100 +-
> >>  drivers/mtd/maps/Kconfig            |   11 +-
> >>  drivers/mtd/maps/physmap.c          |  193 +++-
> >>  drivers/mtd/mtdchar.c               |   54 +
> >>  drivers/mtd/mtdcore.c               |   48 +-
> >>  drivers/mtd/mtdpart.c               |    6 +
> >>  drivers/mtd/nand/Kconfig            |   18 +-
> >>  drivers/mtd/nand/Makefile           |    1 +
> >>  drivers/mtd/nand/nand_base.c        |  230 +++-
> >>  drivers/mtd/nand/nand_ids.c         |   24 +-
> >>  drivers/mtd/nand/nandsim.c          |    2 +-
> >>  drivers/mtd/nand/smp8xxx_nand.c     | 1974 +++++++++++++++++++++++++++++++++++
> >>  include/linux/mtd/map.h             |    1 +
> >>  include/linux/mtd/mtd.h             |    6 +
> >>  include/linux/mtd/nand.h            |   10 +
> >>  17 files changed, 2776 insertions(+), 43 deletions(-)
> >>
> >> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> >> index 27143e042af5..a2661a490f3c 100644
> >> --- a/drivers/mtd/Kconfig
> >> +++ b/drivers/mtd/Kconfig
> >> @@ -22,9 +22,21 @@ config MTD_TESTS
> >>  
> >>  	  WARNING: some of the tests will ERASE entire MTD device which they
> >>  	  test. Do not use these tests unless you really know what you do.
> >> +config MTD_PARTITIONS
> >> +	bool "MTD partitioning support"
> >> +	help
> >> +	 If you have a device which needs to divide its flash chip(s) up
> >> +	 into multiple 'partitions', each of which appears to the user as
> >> +	 a separate MTD device, you require this option to be enabled. If
> >> +	 unsure, say 'Y'.
> >> +
> >> +	 Note, however, that you don't need this option for the DiskOnChip
> >> +	 devices. Partitioning on NFTL 'devices' is a different - that's the
> >> +	 'normal' form of partitioning used on a block device.
> > 
> > This Kconfig option is already available in mainline.
> 
> Are you referring to MTD_PARTITIONED_MASTER?

Oh, you're right, I thought there was an option, but mtdpart.c is
compiled when you enable MTD support. Anyway, I don't think we need an
extra option to disable MTD_PARTITIONS, so you should still drop those
changes.

[...]

> >> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> >> index f2f482bec573..8219c1ce0f6b 100644
> >> --- a/drivers/mtd/mtdchar.c
> >> +++ b/drivers/mtd/mtdchar.c
> >> @@ -620,6 +620,8 @@ static int mtdchar_write_ioctl(struct mtd_info *mtd,
> >>  	return ret;
> >>  }
> >>  
> >> +#define MEMERASEFORCE  _IOW('M', 20, struct erase_info_user)
> >> +
> >>  static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
> >>  {
> >>  	struct mtd_file_info *mfi = file->private_data;
> > 
> > Support for bad block erasure has been discussed several times, AFAIR
> > no decision was taken (or maybe it was decided that it was safer to not
> > allow it).
> > 
> > The problem here is that BBM (bad block markers) which are placed by the
> > NAND vendor can be erased too, and if you loose this information you can
> > start reusing a block that was really bad. ITOH, because some NAND
> > controller have weird page layout in which BBM are replaced by in-band
> > data or ECC bytes. So sometime it's useful to be able to force erasure
> > of bad blocks.
> > Anyway, until we agree on something I suggest you drop this feature and
> > use the nand scrub command in u-boot (if you are using u-boot ;)),
> > which is doing exactly what you're trying to do.
> 
> Our dev boards have u-boot, but the production boards don't,
> as far as I understand.

Ok, but let's keep that for later (you don't need this feature to
support your NAND controller).

[...]

> 
> >> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> >> index 7d17cecad69d..e27256885ec1 100644
> >> --- a/drivers/mtd/nand/Kconfig
> >> +++ b/drivers/mtd/nand/Kconfig
> >> @@ -1,3 +1,10 @@
> >> +config MTD_NAND_IDS
> >> +	tristate "Include chip ids for known NAND devices."
> >> +	depends on MTD
> >> +	help
> >> +	  Useful for NAND drivers that do not use the NAND subsystem but
> >> +	  still like to take advantage of the known chip information.
> >> +
> > 
> > This option already exists and is selected by MTD_NAND, no need to add
> > a description for it (we don't want users to see this option). So
> > again, this can be dropped.
> > 
> >>  config MTD_NAND_ECC
> >>  	tristate
> >>  
> >> @@ -83,6 +90,14 @@ config MTD_NAND_DENALI_SCRATCH_REG_ADDR
> >>            scratch register here to enable this feature. On Intel Moorestown
> >>            boards, the scratch register is at 0xFF108018.
> >>  
> >> +config MTD_NAND_TANGOX
> >> +        tristate "TANGOX NAND Device Support"
> >> +        depends on TANGO3 || TANGO4
> > 
> > Maybe you can add COMPILE_TEST too.
> 
> You mean if I try to submit the driver, right?

Yes. Wasn't it the point of the RFC?

[...]

> >>  
> >> @@ -646,7 +661,11 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
> >>  	 * Apply this short delay always to ensure that we do wait tWB in
> >>  	 * any case on any machine.
> >>  	 */
> >> +#ifdef CONFIG_TANGOX
> >> +	udelay(1); /* needs to make it much longer than tWB */
> >> +#else
> >>  	ndelay(100);
> >> +#endif
> > 
> > Yes, this delay here should probably depends on the NAND timings
> > attached to the NAND device, but anyway, I don't think this should be
> > done like this, so just drop it for the moment, and we'll find a way to
> > express that differently.
> 
> There's a lot of cargo cult delays all over our drivers.
> 
> > BTW, could you explain why you need it to sleep for more than tWB?
> > I think this is because you do not wait for the controller to
> > acknowledge that the command has been sent to the NAND device, can you
> > check that?
> 
> Could it be that, on some setups, ndelay(100) is equivalent
> to no wait at all?

Hm, it should not, but maybe. Anyway, I'll look at the driver code to
check that you're waiting for the HW ack before returning from
->cmd_ctrl().

[...]

> 
> >>  	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
> >>  	*busw = 0;
> >>  	if (le16_to_cpu(p->features) & 1)
> >>  		*busw = NAND_BUSWIDTH_16;
> >>  
> >> -	chip->options |= NAND_NO_READRDY | NAND_NO_AUTOINCR;
> >> +	chip->options &= ~NAND_CHIPOPTIONS_MSK;
> >> +	chip->options |= (NAND_NO_READRDY |
> >> +			NAND_NO_AUTOINCR) & NAND_CHIPOPTIONS_MSK;
> > 
> > Hm, can this really happens? Can we really have something set in
> > ->options before entering this function?
> 
> Are you asking me?

Yes, and also kinda asking Brian too. But I think this field is set to
0 if you allocate your nand_chip struct with kzalloc().

> 
> >> @@ -2995,14 +3072,17 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
> >>  		 * Field definitions are in the following datasheets:
> >>  		 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
> >>  		 * New style   (6 byte ID): Samsung K9GBG08U0M (p.40)
> >> +		 * Micron      (5 byte ID): Micron MT29F16G08MAA (p.24)
> >> +		 *      Note: Micron rule is based on heuristics for
> >> +		 *            newer chips
> 
> http://lists.infradead.org/pipermail/linux-mtd/2010-July/031068.html

Okay, so according to the patch those chips are ONFI compliant, so I
guess you don't need this. Just make sure your driver supports ONFI
detection (which should be the case if you're implementing
->cmd_ctrl()).


[...]

> >> @@ -3259,6 +3423,19 @@ int nand_scan_tail(struct mtd_info *mtd)
> >>  		case 128:
> >>  			chip->ecc.layout = &nand_oob_128;
> >>  			break;
> >> +		case 224:
> >> +			chip->ecc.layout = &nand_oob_mlcbch_224;
> >> +			//8 bit bch ecc for Micron 1G flash, 224 oobsize use 128 for ecc
> >> +			//for(i=224-112,k=0;i<224;k++,i++)
> >> +			//	chip->ecc.layout->eccpos[k]=i;
> >> +			//chip->ecc.layout->oobfree[0].offset=3;
> >> +			//chip->ecc.layout->oobfree[0].length=(224-112-3);
> >> +			break;
> >> +#ifndef CONFIG_MTD_NAND_ECC_512
> >> +		case 448:
> >> +			chip->ecc.layout = &nand_oob_mlcbch_448;
> >> +			break;
> >> +#endif
> > 
> > Let's see if we can build those layout dynamically...
> 
> You mean compute the array at run-time, instead of having it
> pre-computed and hard-coded?

Yes.

[...]

> >>  
> >> -	{NULL,}
> >> +	/*
> >> +	 * Fill-in gaps, may be refilled at the runtime
> >> +	 */
> >> +	{"                                ", 0, },
> >> +	{"                                ", 0, },
> >> +	{"                                ", 0, },
> >> +	{"                                ", 0, },
> >> +	{"                                ", 0, },
> >> +	{"                                ", 0, },
> >> +	{"                                ", 0, },
> >> +	{"                                ", 0, },
> >> +
> >> +	/*
> >> +	 * Terminates the table
> >> +	 */
> >> +	{NULL, },
> >>  };
> > 
> > Let's say I didn't see that. Please remove it :).
> 
> "Interesting" isn't it?

Yep :).

> 
> >> @@ -178,6 +198,8 @@ struct nand_manufacturers nand_manuf_ids[] = {
> >>  	{NAND_MFR_MICRON, "Micron"},
> >>  	{NAND_MFR_AMD, "AMD"},
> >>  	{NAND_MFR_MACRONIX, "Macronix"},
> >> +	{NAND_MFR_ESMT, "ESMT"},
> > 
> > There's already an entry for EON, so putting the "EON/ESMT" should be
> > good.
> 
> The IDs are unique?

Yes.

> There have been less than 256 manufacturers, ever?

Apparently, far less than 256 according to the ids defined in the
header ;).


[...]

> >>  
> >> @@ -556,6 +564,8 @@ struct nand_chip {
> >>  #define NAND_MFR_MICRON		0x2c
> >>  #define NAND_MFR_AMD		0x01
> >>  #define NAND_MFR_MACRONIX	0xc2
> >> +#define NAND_MFR_ESMT		0x92
> > 
> > As Geert said, not sure we have to redefine a new macro, just say that
> > EON and ESMT are the same.
> 
> But if someone expects ESMT, are they supposed to know
> EON was swallowed by ESMT?

Hm, they'll eventually find out pretty quickly that the ESMT
manufacturer id and EON are the same.

> 
> >> +#define NAND_MFR_MIRA		0xc8
> 
> What about this one?

This one should be added, yes.

> 
> http://www.deutron.com.tw/miles.htm
> 2002 MIRA renamed as Deutron focus on DRAM spot market.
> 
> http://www.datasheetspdf.com/PDF/PSU8GA30AT/897320/1
> 
> Anyway, many many thanks for having taken such a close look
> at this patch.

No problem.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
