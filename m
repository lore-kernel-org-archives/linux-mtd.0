Subject: Re: [PATCH 2/2] MTD: Add nand_ecc test module
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
In-Reply-To: <1256039401.29856.216.camel@localhost>
References: <> <1255932706-23824-1-git-send-email-akinobu.mita@gmail.com>
	<1255932706-23824-2-git-send-email-akinobu.mita@gmail.com>
	<1256039401.29856.216.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Oct 2009 15:01:08 +0300
Message-Id: <1256040068.29856.222.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-10-20 at 14:50 +0300, Artem Bityutskiy wrote:
> On Mon, 2009-10-19 at 15:11 +0900, Akinobu Mita wrote:
> > This module tests NAND ECC functions.
> > 
> > The test is simple.
> > 
> > 1. Create a 256 or 512 bytes block of data filled with random bytes (data)
> > 2. Duplicate the data block and inject single bit error (error_data)
> > 3. Try to correct error_data
> > 4. Compare data and error_data
> > 
> > This test is added into new MTD test group called MTD NAND test
> > which requires MTD NAND device support.
> > 
> > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: linux-mtd@lists.infradead.org
> > Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > ---
> >  drivers/mtd/Kconfig               |    6 +++
> >  drivers/mtd/tests/Makefile        |    1 +
> >  drivers/mtd/tests/nand_ecc-test.c |   88 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 95 insertions(+), 0 deletions(-)
> >  create mode 100644 drivers/mtd/tests/nand_ecc-test.c
> > 
> > diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> > index ecf90f5..abe5c7f 100644
> > --- a/drivers/mtd/Kconfig
> > +++ b/drivers/mtd/Kconfig
> > @@ -33,6 +33,12 @@ config MTD_TESTS
> >  	  should normally be compiled as kernel modules. The modules perform
> >  	  various checks and verifications when loaded.
> >  
> > +config MTD_NAND_TESTS
> > +	tristate "MTD NAND tests support"
> > +	depends on MTD_TESTS && MTD_NAND
> > +	help
> > +	  This option enables MTD tests which require NAND Device support.
> > +
> >  config MTD_CONCAT
> >  	tristate "MTD concatenating support"
> >  	help
> 
> Could this please be a separate patch? Also, some of the existing tests
> are NAND only as well, so could do corresponding Makefile changes in the
> same patch and move the to the MTD_NAND_TESTS set? The tests are:
> 
> mtd_oobtest.c
> mtd_pagetest.c
> mtd_subpagetest.c

Err, and of course this patch has to be the _last_ in the series, to
preserve bisectability.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
