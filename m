Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AMENu-0001pC-QY
	for <linux-mtd@lists.infradead.org>; Tue, 18 Nov 2003 22:31:47 +0000
Sender: ahennessy@mvista.com
Message-ID: <3FBA9C88.1D213181@mvista.com>
Date: Tue, 18 Nov 2003 14:26:16 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
References: <3F984931.E6409ED7@mvista.com>
	<1066981292.29915.584.camel@hades.cambridge.redhat.com>
	<3F9D6328.547A39A6@mvista.com>
	<1067284806.16241.2.camel@imladris.demon.co.uk>
	<3F9D8384.ABC9FD4@mvista.com>
	<1067288106.16391.5.camel@imladris.demon.co.uk>
	<3FB18390.3846C928@mvista.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Re: Different nand interface
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alice Hennessy wrote:

> David Woodhouse wrote:
>
> > On Mon, 2003-10-27 at 13:17 -0800, Alice Hennessy wrote:
> > > Thanks for the quick response.  I'll weigh the massage effort with any
> > > future maintenance effort saved.
> >
> > Bear in mind I'm happy enough to make changes to the generic NAND
> > interface if they're going to be useful in general.
> >
> > --
> > dwmw2
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> I've attached the current driver for review, possibly as a standalone
> driver.  As you can
> see from the patch,   the current placement of the driver is in the
> drivers/mtd/nand
> directory and it replaces the generic nand.c if configured to the
> customized board.
> This was to make use of nand_ecc.c and nand_ids.c.    Also, the supporting
> files
> stw_flash.h and stw_flash.c  are currently under the board's directories
> but can be massaged to
> go anywhere necessary.     This board's nand flash, as I've stated in
> previous emails,
> has a completely different hardware interface than the standard nand flash
> and this makes
> using the generic nand.c difficult.   Any opinions on how this fits in
> would be appreciated.
>
> Alice
>
>   ------------------------------------------------------------------------

Hi,

Are there any objections or opinions on adding this driver ?

Alice
