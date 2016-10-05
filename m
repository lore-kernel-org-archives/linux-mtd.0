Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brjQ3-0007PL-V8
 for linux-mtd@lists.infradead.org; Wed, 05 Oct 2016 10:27:27 +0000
Date: Wed, 5 Oct 2016 13:27:00 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Stefan Roese <sr@denx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
Message-ID: <20161005102700.GD1765@lahna.fi.intel.com>
References: <1471245044-12767-1-git-send-email-mika.westerberg@linux.intel.com>
 <2cf1530a-8e10-9a4a-51a4-8ae322b26ed9@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cf1530a-8e10-9a4a-51a4-8ae322b26ed9@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 05, 2016 at 11:57:46AM +0200, Stefan Roese wrote:
> Hi Mika,
> 
> On 15.08.2016 09:10, Mika Westerberg wrote:
> > This is third version of the series. Previous versions can be found:
> > 
> >   v2: http://lists.infradead.org/pipermail/linux-mtd/2016-June/068277.html
> >   v1: https://lkml.org/lkml/2016/6/14/269
> > 
> > This series adds support for the Intel SPI serial flash controller found on
> > many recent Intel CPUs including Baytrail and Braswell. This driver makes
> > it possible to access the BIOS and other platform data which is stored on
> > the SPI serial flash. It is also possible to upgrade the BIOS using this
> > driver if it has not been protected by special hardware bits.
> > 
> > The patch [1/3] includes documentation how to upgrade BIOS on MinnowBoard
> > MAX.
> > 
> > Since poking the SPI serial flash can brick the machine, this driver can
> > only be enabled when CONFIG_EXPERT=y and even then it will remain read-only
> > unless instructed othwerwise by module parameter.
> 
> I'm currently testing this driver on a BayTrail based board with
> a common 8MiB SPI NOR chip. Something special to note is, that I'm
> using U-Boot as bootloader instead of some BIOS. Accessing the
> SPI NOR in U-Boot works without problems. Also I'm able to access
> the SPI NOR in Linux via the flashrom tool just fine.
> 
> I've now applied your v3 patchset on top of v4.8 and got the SPI NOR
> driver loaded. But the SPI NOR device is not detected correctly. Here
> the output of the driver with DEBUG enabled:
> 
> ...
> [    3.675891] intel-spi intel-spi: BFPREG=0x07ff0300
> [    3.675894] intel-spi intel-spi: HSFSTS_CTL=0x00006000
> [    3.675897] intel-spi intel-spi: FADDR=0x006effc0
> [    3.675900] intel-spi intel-spi: DLOCK=0x00000000
> [    3.675902] intel-spi intel-spi: FDATA(0)=0x00000000
> [    3.675905] intel-spi intel-spi: FDATA(1)=0x00000000
> [    3.675908] intel-spi intel-spi: FDATA(2)=0x00000000
> [    3.675910] intel-spi intel-spi: FDATA(3)=0x00000000
> [    3.675913] intel-spi intel-spi: FDATA(4)=0x00000000
> [    3.675916] intel-spi intel-spi: FDATA(5)=0x00000000
> [    3.675918] intel-spi intel-spi: FDATA(6)=0x00000000
> [    3.675921] intel-spi intel-spi: FDATA(7)=0x00000000
> [    3.675923] intel-spi intel-spi: FDATA(8)=0x00000000
> [    3.675926] intel-spi intel-spi: FDATA(9)=0x00000000
> [    3.675929] intel-spi intel-spi: FDATA(10)=0x00000000
> [    3.675931] intel-spi intel-spi: FDATA(11)=0x00000000
> [    3.675934] intel-spi intel-spi: FDATA(12)=0x00000000
> [    3.675941] intel-spi intel-spi: FDATA(13)=0x00000000
> [    3.675943] intel-spi intel-spi: FDATA(14)=0x00000000
> [    3.675946] intel-spi intel-spi: FDATA(15)=0x00000000
> [    3.675949] intel-spi intel-spi: FRACC=0x0000ffff
> [    3.675951] intel-spi intel-spi: FREG(0)=0x00000000
> [    3.675954] intel-spi intel-spi: FREG(1)=0x07ff0300
> [    3.675957] intel-spi intel-spi: FREG(2)=0x02ff0001
> [    3.675959] intel-spi intel-spi: FREG(3)=0x00001fff
> [    3.675962] intel-spi intel-spi: FREG(4)=0x00001fff
> [    3.675965] intel-spi intel-spi: PR(0)=0x00000000
> [    3.675967] intel-spi intel-spi: PR(1)=0x00000000
> [    3.675970] intel-spi intel-spi: PR(2)=0x00000000
> [    3.675972] intel-spi intel-spi: PR(3)=0x00000000
> [    3.675975] intel-spi intel-spi: PR(4)=0x00000000
> [    3.675978] intel-spi intel-spi: PR(5)=0x00000000
> [    3.675980] intel-spi intel-spi: SSFSTS_CTL=0xf87f00c0
> [    3.675983] intel-spi intel-spi: PREOP_OPTYPE=0x00020000
> [    3.675985] intel-spi intel-spi: OPMENU0=0x0000000b
> [    3.675988] intel-spi intel-spi: OPMENU1=0x00000000
> [    3.675990] intel-spi intel-spi: BCR=0x00000009
> [    3.675992] intel-spi intel-spi: Protected regions:
> [    3.675997] intel-spi intel-spi: Flash regions:
> [    3.676001] intel-spi intel-spi:  00 base: 0x00000000 limit: 0x00000fff
> [    3.676004] intel-spi intel-spi:  01 base: 0x00300000 limit: 0x007fffff
> [    3.676007] intel-spi intel-spi:  02 base: 0x00001000 limit: 0x002fffff
> [    3.676009] intel-spi intel-spi:  03 disabled
> [    3.676012] intel-spi intel-spi:  04 disabled
> [    3.676014] intel-spi intel-spi: Using HW sequencer for register access

It should not be using HW sequencer on Baytrail. The driver thinks so
because it wants that both OPMENU0 and OPMENU1 to be set before it
switches to use SW sequencer.

You can try to change:

static int intel_spi_init(struct intel_spi *ispi)
{
	...
	if (opmenu0 || opmenu1) {

but I suppose that's not enough because it does include RDID in the
OPMENU0 which we use to read the JEDEC ID.

Since the controller is not locked down (DLOCK is 0) we could program
those for the OPMENU0 so that it contains 0x00009f0b and maybe something
more.

You could try to add

       writel(0x00009f0b, ispi->sregs + OPMENU0);

before we read OPMENU0 in the same function.
