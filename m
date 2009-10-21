Subject: Re: [PATCH 2/2] MTD: Add nand_ecc test module
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
In-Reply-To: <20091021044614.GA10336@localhost.localdomain>
References: <1255932706-23824-1-git-send-email-akinobu.mita@gmail.com>
	<1255932706-23824-2-git-send-email-akinobu.mita@gmail.com>
	<1256039401.29856.216.camel@localhost>
	<20091021044614.GA10336@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Oct 2009 09:52:44 +0300
Message-Id: <1256107964.29856.271.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-10-21 at 06:46 +0200, ext Akinobu Mita wrote:
> On Tue, Oct 20, 2009 at 02:50:01PM +0300, Artem Bityutskiy wrote:
> > > diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> > > index ecf90f5..abe5c7f 100644
> > > --- a/drivers/mtd/Kconfig
> > > +++ b/drivers/mtd/Kconfig
> > > @@ -33,6 +33,12 @@ config MTD_TESTS
> > >  	  should normally be compiled as kernel modules. The modules perform
> > >  	  various checks and verifications when loaded.
> > >  
> > > +config MTD_NAND_TESTS
> > > +	tristate "MTD NAND tests support"
> > > +	depends on MTD_TESTS && MTD_NAND
> > > +	help
> > > +	  This option enables MTD tests which require NAND Device support.
> > > +
> > >  config MTD_CONCAT
> > >  	tristate "MTD concatenating support"
> > >  	help
> > 
> > Could this please be a separate patch? Also, some of the existing tests
> > are NAND only as well, so could do corresponding Makefile changes in the
> > same patch and move the to the MTD_NAND_TESTS set? The tests are:
> > 
> > mtd_oobtest.c
> > mtd_pagetest.c
> > mtd_subpagetest.c
> 
> Should these MTD NAND tests support OneNAND device, too?
> 
> If so, the config with !CONFIG_MTD_NAND && MTD_ONENAND=m cannot select
> this new MTD_NAND_TESTS. So Kconfig dependency should be:
> 
> config MTD_NAND_TESTS
>         tristate "MTD NAND tests support"
>         depends on MTD_TEST
>         depends on MTD_NAND || MTD_ONENAND
> 
> But nand_ecc-test obviously needs CONFIG_MTD_NAND and cannot exist
> in the same group.

Oh, I see. May be your original idea with ifdefs in the code was not
bad at all :-) ?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
