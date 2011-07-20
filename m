Subject: Re: [i.MX28 GPMI] problem overwriting all-0xff data in NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Wed, 20 Jul 2011 11:35:43 +0300
In-Reply-To: <4E26794D.8040004@freescale.com>
References: <20004.12663.29494.339601@ipc1.ka-ro>
	<20110718164354.GA3328@S2100-06.ap.freescale.net>
	<4E26794D.8040004@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1311150947.20738.167.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawn.guo@freescale.com>,
	Lothar =?ISO-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-07-20 at 14:44 +0800, Huang Shijie wrote:
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

Please, no! The driver should just write what it is asked to write. Your
driver has a limitation - a NAND page can be written only _once_. If a
piece of software writes a page twice (1st with all 0xFFs, then with
something else) - this is a problem in _that piece of software_.


Additionally, all 0xFFs are just data, it needs ECC corrections in case
of bit-flips just like any other data. Eve you decided to do that
horrible "skip all 0xFFs" hack, you'd need to make sure bit-flips in
"skipped" pages are still corrected. Indeed, there is not reason why a
never written NAND page would not have bit-flips.

-- 
Best Regards,
Artem Bityutskiy
