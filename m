Subject: Re: GPMI-NAND Status?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lothar =?ISO-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Date: Mon, 15 Aug 2011 19:34:45 +0300
In-Reply-To: <20040.59254.170515.492518@ipc1.ka-ro>
References: <20110805135133.GA26981@pengutronix.de>
	<20110814081139.GD17063@parrot.com>
	<20040.45443.810005.525431@ipc1.ka-ro>
	<20110815082935.GA18364@parrot.com>
	<20040.59254.170515.492518@ipc1.ka-ro>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1313426095.8691.44.camel@sauron>
Mime-Version: 1.0
Cc: Koen Beel <koen.beel.barco@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
	Huang Shijie <b32955@freescale.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ivan Djelic <ivan.djelic@parrot.com>, Shawn Guo <shawn.guo@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-08-15 at 11:31 +0200, Lothar Waßmann wrote:
> Hi,
> 
> Ivan Djelic writes:
> > On Mon, Aug 15, 2011 at 06:41:23AM +0100, Lothar Waßmann wrote:
> > > Hi,
> > > 
> > > Ivan Djelic writes:
> > > > On Fri, Aug 05, 2011 at 02:51:33PM +0100, Wolfram Sang wrote:
> > > > (...)
> > > > > 
> > > > > problem overwriting all-0xff data in NAND [2]
> > > > > =============================================
> > > > > 
> > > > > Although it occured only when writing JFFS2 images so far, this is a generic
> > > > > issue and needs to be fixed, right?
> > > > > 
> > > > > 
> > > > (...)
> > > > > [2] http://lists.infradead.org/pipermail/linux-mtd/2011-July/037104.html
> > > > 
> > > > As explained in the thread linked above, this issue should be fixed in your
> > > > flashing tool, _not_ in your driver. The nand device you are using does not
> > > > support programming pages multiple times in a row; pretending it does in the
> > > >
> > > It's not a problem of the device (Samsung K9F1G08U0B in my case)! The
> > > problem is that the controller generates an ECC code that is non-FF
> > > for all-FF data, which JFFS2 cannot handle properly.
> > 
> > JFFS2 has nothing to do with it. JFFS2 does not assume it can program empty
> > pages and then reprogram them on a NAND flash device. You flashing method does.
> > 
> AFAICT JFFS2 checks the flash for areas that contain only FF and
> treats them like erased flash. At least it tries to overwrite such
> areas in flash without erasing it beforehand.

Right, when JFFS2 scans the flash and finds a partially-used eraseblock,
it tries to find out where the data ends and the empty space starts.
JFFS2 assumes that the empty space is usable, and it uses it. JFFS2
author just missed the fact that in case of newly flashed JFFS2 image
this empty space may be unusable. And this was extremely unlikely those
times.

You may teach JFFS2 to avoid using this space or to "clean it up", just
like we taught UBIFS to do this recently. The other option is to change
the flashing method. 

> I avoided the problem by creating JFFS2 images that are padded with
> oxff to page size only instead of eraseblock size.

Right.

> > Therefore... it is simply a matter of avoiding empty page programming, which
> > only happens in your flasher. See also the flashing guidelines [1] as per Artem
> > suggestion.
> > 
> "Your flasher" is the standard mtd-utils mkfs.jffs2 to create an image
> file and the U-Boot commands 'nand erase/nand write' or
> the mtd-utils 'flash_eraseall/nandwrite' to write it to flash.

I do not use these tools, but if they have issues - just fix them and
send patches.

-- 
Best Regards,
Artem Bityutskiy
