Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mxe9W-0005uJ-9V
	for linux-mtd@lists.infradead.org; Tue, 13 Oct 2009 09:58:51 +0000
Received: by yxe5 with SMTP id 5so2446923yxe.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Oct 2009 02:58:43 -0700 (PDT)
Date: Tue, 13 Oct 2009 18:58:36 +0900
From: Akinobu Mita <akinobu.mita@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] MTD: Add nand_ecc test module
Message-ID: <20091013095836.GA3166@localhost.localdomain>
References: <1255082095-22158-1-git-send-email-akinobu.mita@gmail.com>
	<1255268381.16942.74.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1255268381.16942.74.camel@localhost>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 11, 2009 at 04:39:41PM +0300, Artem Bityutskiy wrote:
> On Fri, 2009-10-09 at 18:54 +0900, Akinobu Mita wrote:
> > This module tests NAND ECC functions.
> > 
> > The test is simple.
> > 
> > 1. Create a 256 or 512 bytes block of data filled with random bytes (data)
> > 2. Duplicate the data block and inject single bit error (error_data)
> > 3. Try to correct error_data
> > 4. Compare data and error_data
> 
> So you want to test the built-in 256/512 software ECC calculation
> and correction functions?

Yes.

> > If the test fails, this creates create these files in debugfs:
> > 
> > /sys/kernel/debug/nand-ecc-test-crashers/
> > 
> >         <testname>
> >         <testname>-error
> > 
> > <testname> contains data
> > <testname>-error contains error_data
> 
> Why you need these files? This looks like overkill. Please, remove
> them.

OK. I'll remove them and just do hexdump() if the test fails.

> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: linux-mtd@lists.infradead.org
> > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > ---
> >  drivers/mtd/nand/nand_ecc.c       |   25 ++++-
> >  drivers/mtd/tests/Makefile        |    1 +
> >  drivers/mtd/tests/nand_ecc-test.c |  200 +++++++++++++++++++++++++++++++++++++
> >  include/linux/mtd/nand_ecc.h      |    6 +
> >  4 files changed, 227 insertions(+), 5 deletions(-)
> >  create mode 100644 drivers/mtd/tests/nand_ecc-test.c
> 
> Could you please split this on 2 patches - one is changing the generic
> code, one is the test itself.

OK.

...

> > +static void unregister_ecc_test_crasher(struct ecc_test_crasher *crasher)
> > +{
> > +	list_del(&crasher->list);
> > +
> > +	remove_ecc_test_blob(crasher->error_data);
> > +	remove_ecc_test_blob(crasher->data);
> > +	kfree(crasher);
> > +}
> > +
> > +#if defined(CONFIG_MTD_NAND) || defined(CONFIG_MTD_NAND_MODULE)
> 
> This should not be needed. MTD tests are always compiled as modules,
> so you should not have copilation errors. And if MTD NAND support is
> not present, modprobe will just fail.

nand_calculate_ecc and nand_correct_data needs CONFIG_MTD_NAND=y|m,
otherwise it will get link error:

ERROR: "__nand_correct_data" [drivers/mtd/tests/nand_ecc-test.ko] undefined!
ERROR: "__nand_calculate_ecc" [drivers/mtd/tests/nand_ecc-test.ko] undefined!
