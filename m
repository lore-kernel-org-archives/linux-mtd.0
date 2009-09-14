Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MnCZl-0003as-FC
	for linux-mtd@lists.infradead.org; Mon, 14 Sep 2009 14:30:45 +0000
Subject: Re: UBIFS Error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: JerinJacob <jerin.jacob@maxim-ic.com>
In-Reply-To: <1252938440.5060.102.camel@localhost>
References: <4AA5F37F.4050307@maxim-ic.com> <4AA60E6C.6060307@nokia.com>
	<4AA8EA9C.4070805@maxim-ic.com> <4AA8ED7B.5020509@nokia.com>
	<4AA8F6E4.1090209@maxim-ic.com> <4AA90351.3050000@nokia.com>
	<4AAA4005.9080707@maxim-ic.com> <1252938440.5060.102.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Sep 2009 17:29:48 +0300
Message-Id: <1252938588.5060.103.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-09-14 at 17:27 +0300, Artem Bityutskiy wrote:
> > > And finally, could you please try to reproduce this problem with
> > > nandsim:
> > > http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_nandsim
> > >   
> >  >>> Unfortunately, I couldn't reproduce the problem with nandsim.It 
> > works with nansim.
> > However i couldn't test with 1GiB nandsim as it needs 1GiB ram.Tested 
> > with 512MiB nandsim.
> > 
> > I guess it is a could be data corruption either in platform  specific 
> > driver or ubifs.
> > Is there any way we can validate the platform specific nand driver ?
> > Please let me know your views on this?
> > 
> > Actually we are in the process of migrating from yaffs to ubifs, The 
> > same test application works  with
> > yaffs as well.
> 
> I've created this piece of documentation for you:
> http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests
> 
> Please, validate your flash driver/HW.

And here is the text in case someone would review it:

The MTD subsystem includes a set of tests which you may run to verify
your flash hardware and drivers. The tests are available in the mainline
kernels starting from kernel version 2.6.29 and they live in the
drivers/mtd/tests directory of the linux kernel source codes. You may
compile the tests as kernel modules by enabling them in the kernel
configuration menu by marking: "Device Drivers" -> "Memory Technology
Devices (MTD)" -> "MTD tests support" (or the MTD_TESTS symbol in
the .config file).

If you have a pre-2.6.29 kernel, you may find the tests here:

git://git.infradead.org/users/ahunter/nand-tests.git

The MTD test-suite contains the following tests:

      * mtd_speedtest: measures and reports read/write/erase speed of
        the MTD device.
      * mtd_stresstest: performs random read/write/erase operations and
        validates the MTD device I/O capabilities.
      * mtd_readtest: this tests reads whole MTD device, one NAND page
        at a time including OOB (or 512 bytes at a time in case of
        flashes like NOR) and checks that reading works properly.
      * mtd_pagetest: relevant only for NAND flashes, tests NAND page
        writing and reading in different sizes and order; this test was
        originally developed for testing the OneNAND driver, so it might
        be a little OneNAND-oriented, but must work on any NAND flash.
      * mtd_oobtest: relevant only for NAND flashes, tests that the OOB
        area I/O works properly by writing data to different offsets and
        verifying it.
      * mtd_subpagetest: relevant only for NAND flashes, tests sub-page
        I/O.
      * mtd_torturetest: this test is designed to wear out flash
        eraseblocks. It repeatedly writes and erases the same group of
        eraseblocks until an I/O error happens, so be careful! The test
        supports a number of options (see modinfo mtd_torturetest) which
        allow you to set the amount of eraseblocks to torture and how
        the torturing is done. You may limit the amount of torturing
        cycles using the cycles_count module parameter. It may be very
        god idea to run this test for some time and validate your flash
        driver and HW, providing you have a spare device. For example,
        we caught rather rare and nasty DMA issues on an OMAP2 board
        with OneNAND flash, just by running this tests for few hours.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
