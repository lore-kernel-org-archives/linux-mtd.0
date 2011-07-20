Message-ID: <20006.36214.352337.659803@ipc1.ka-ro>
Date: Wed, 20 Jul 2011 10:10:30 +0200
From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Huang Shijie <b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Re: [i.MX28 GPMI] problem overwriting all-0xff data in NAND
In-Reply-To: <4E26794D.8040004@freescale.com>
References: <20004.12663.29494.339601@ipc1.ka-ro>
	<20110718164354.GA3328@S2100-06.ap.freescale.net>
	<4E26794D.8040004@freescale.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawn.guo@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Huang Shijie writes:
> Hi Lothar:
> > On Mon, Jul 18, 2011 at 03:13:27PM +0200, Lothar Waßmann wrote:
> >> Hi,
> >>
> >> with the gpmi-nfc driver for imx28 from Shawn Guo on a TX28 I
> > To be clear, the author of gpmi-nfc driver is Huang Shijie (Cc-ed).
> >
> > Regards,
> > Shawn
> >
> >> encountered some problems with jffs2 when overwriting pages that have
> >> been written with 0xff (e.g. from padding from the file system image
> >> file).
> >>
> >> The problem is that the ECC info for an all-0xff block is not all-0xff
> >> and thus a newly erased block is different from a block that has been
> >> written with 0xff.
> >> If such a block is being altered (jffs2 thinking it can simply
> >> overwrite it without erasing first) the ECC information will be
> >> corrupted and will produce ECC errors upon read.
> >>
> >> The only remedy I can think of is to prevent empty pages from actually
> >> being written to flash, but leaving them in the erased state instead.
> Did you mean that:
> If the gpmi have to write a page which is full of 0xff,
> the gpmi driver should skip the writting, and leave the page in the 
> erased state.
> 
> Am I right?
> 
Exactly. But it seems others think this should be handled by userspace
tools rather than in the kernel driver.


Lothar Waßmann
-- 
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstraße 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Geschäftsführer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
