Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeUyt-0002Od-2z
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2011 16:29:44 +0000
Date: Wed, 6 Jul 2011 18:29:35 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Lothar =?iso-8859-15?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Subject: Re: [PATCH] Add 'config IMX_NFC_V1_BISWAP' to swap the Bad block
	Indicator, and use for imx27pdk nand support.
Message-ID: <20110706162935.GV6069@pengutronix.de>
References: <1309872828-13942-1-git-send-email-J.Lambrecht@televic.com>
	<20110706080942.GC26347@pengutronix.de>
	<4E142B18.60407@televic.com> <19988.19315.787284.113228@ipc1.ka-ro>
	<4E145789.8040801@televic.com>
	<19988.26817.208939.223896@ipc1.ka-ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19988.26817.208939.223896@ipc1.ka-ro>
Cc: Estevam Fabio-R49496 <r49496@freescale.com>,
	Lambrecht =?iso-8859-15?Q?J=FCrgen?= <J.Lambrecht@TELEVIC.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 06, 2011 at 03:53:05PM +0200, Lothar Waßmann wrote:
> Hi,
> 
> Lambrecht Jürgen writes:
> > On 07/06/2011 01:48 PM, Lothar Waßmann wrote:
> > > > Am I correct that all nfc-v1's have that bug, so only imx27 and imx51?
> > > > The application note we finally got from freescale only mentions "FSL
> > > > IMX NFC".
> > > >
> > > It's not exactly a bug (which would be possible to get fixed), but an
> > > inherent feature of the controller which handles NAND flash with a
> > > page size larger than 512 byte like it has n pages of 512 byte.
> > >
> > OK, a "hardware bug" then (can be fixed with a re-write of the 
> > VHDL/Verilog code of the NFC, giving v2). It seems to me Freescale tried 
> > to enhance their 512B-page controller with to possibility to also handle 
> > 2kB pages, but they forgot about the Factory Bad Block byte (n=4 only).
> > So to reply to your next mail: only the imx27 and imx31 (thanks sascha, 
> > it was a typo to mention 51) have the NFC v1, I believe all the others 
> > have NFC v2, which are fixed.
> > 
> How do you come to that conclusion?

I remember fsl code which does this only for the v1 controller, but I
can't find this anymore, so maybe my mind fooled me.
Have you checked this somehow that it is indeed swapped for all
controllers or do you believe the fsl code?

> All the controllers share the same
> flash buffer layout and map it to the actual flash data in the same
> way. Thus the problem exists for all of them.
> And the original Freescale code for i.MX5 et al. handles the bad block
> markers in the same way as for i.MX2 or i.MX3.

Indeed :(

>From what I've seen neither barebox nor the kernel nor u-boot handle
this in Mainline versions. I think we have to do something.

Maybe we can handle this in a way that when no bad block table is
present we create one with the correct values? This way we could
eliminate the problem at least on boards with virgin flashes.

This whole topic totally sucks. Whatever we do now we end up with
corrupted flashes in one way or the other.

BTW the Bootrom code expects non swapped flash layout, so applying
a swap patch makes it impossible to update the bootloader in NAND.
Maybe that's the reason the FSL code has this disable_bi_swap sysfs
attribute in it.

Not calling this a bug makes me think you work for the Freescale
marketing department ;)

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
