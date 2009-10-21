Received: from mail-ew0-f205.google.com ([209.85.219.205])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0T5g-0001Tr-LU
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 04:46:33 +0000
Received: by ewy1 with SMTP id 1so5057320ewy.27
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Oct 2009 21:46:25 -0700 (PDT)
Date: Wed, 21 Oct 2009 13:46:14 +0900
From: Akinobu Mita <akinobu.mita@gmail.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: [PATCH 2/2] MTD: Add nand_ecc test module
Message-ID: <20091021044614.GA10336@localhost.localdomain>
References: <1255932706-23824-1-git-send-email-akinobu.mita@gmail.com>
	<1255932706-23824-2-git-send-email-akinobu.mita@gmail.com>
	<1256039401.29856.216.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1256039401.29856.216.camel@localhost>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 20, 2009 at 02:50:01PM +0300, Artem Bityutskiy wrote:
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

Should these MTD NAND tests support OneNAND device, too?

If so, the config with !CONFIG_MTD_NAND && MTD_ONENAND=m cannot select
this new MTD_NAND_TESTS. So Kconfig dependency should be:

config MTD_NAND_TESTS
        tristate "MTD NAND tests support"
        depends on MTD_TEST
        depends on MTD_NAND || MTD_ONENAND

But nand_ecc-test obviously needs CONFIG_MTD_NAND and cannot exist
in the same group.
