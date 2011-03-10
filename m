Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PxcnZ-0003r3-UZ
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2011 10:08:52 +0000
Date: Thu, 10 Mar 2011 11:08:44 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [RFC PATCH] mtd: mxc_nand: fix OOB corruption when page size > 2k
Message-ID: <20110310100844.GA29521@pengutronix.de>
References: <c3d5dae673b532b4a4dbdb8edc6626aa49d7a626.1299679613.git.baruch@tkos.co.il>
	<20110309143845.GZ29521@pengutronix.de>
	<20110309192210.GA3128@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20110309192210.GA3128@tarshish>
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 09, 2011 at 09:22:10PM +0200, Baruch Siach wrote:
> Hi Sascha,
> 
> On Wed, Mar 09, 2011 at 03:38:45PM +0100, Sascha Hauer wrote:
> > On Wed, Mar 09, 2011 at 04:12:20PM +0200, Baruch Siach wrote:
> > > When page size is 4k, ecc.total is set to 8*9, and this causes
> > > nand_write_page_hwecc() to read past the initialized part of the eccpos array,
> > > which corrupts chip->oob_poi with bogus values from ecc_calc.
> > > 
> > > Fix this by creating a proper nand_ecclayout for 4k flashes.
> > > 
> > > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > > ---
> > > 
> > > I'm not sure if this is the right fix. The proposed nandv2_hw_eccoob_4k is just 
> > > a natural extension of nandv2_hw_eccoob_largepage. However, I'm not convinced 
> > > that this actually matches the hardware behaviour. Anyway, this fixed a real 
> > > OOB corruption in BBT, which is the only place I know of where the OOB area is 
> > > actually used.
> > 
> > Does this work on barebox aswell?
> 
> I haven't tested barebox yet. The trouble is that the eccpos field in struct 
> nand_ecclayout of barebox is still limited to 64 < 8*9. This has changed in 
> Linux since cc26c3cd (mtd: nand: expand nand_ecc_layout, deprecate ioctl 
> ECCGETLAYOUTmtd: nand: expand nand_ecc_layout, deprecate ioctl ECCGETLAYOUT).  
> That is why I had to upgrade .38 for this fix. The barebox NAND code needs an 
> update if we are to port this fix, assuming that this is the correct fix.
> 
> > If yes you could verify the oob layout
> > by looking at md /dev/nand0_oob and verify that the ecc postitions
> > specified in your patch match the ecc positions written from the
> > hardware.
> 
> The current nandv2_hw_eccoob_largepage seem to match the documentation of 
> neither i.MX25 (RM §36.3.1, table 36-4), nor i.MX51 (RM §45.6.1, tables 45-8 
> and 45-9). This makes me unsure about my proposed fix. What is the source of 
> information for the nandv2_hw_eccoob_largepage layout?

Let's have a look. Here's the table you mention:

Address                 F E D C B A 9 8        7 6 5 4 3 2 1 0
0xAXI_BASE+0x1000 (SB0) Reserved for user(MSB) Reserved for user (LSB)
0xAXI_BASE+0x1002 (SB0) Reserved for user      Reserved for user
0xAXI_BASE+0x1004 (SB0) Reserved for user      Reserved for user
0xAXI_BASE+0x1006 (SB0) Reserved for user      Reserved for user
0xAXI_BASE+0x1008 (SB0) ECC Byte               ECC Byte
0xAXI_BASE+0x100A (SB0) ECC Byte               ECC Byte
0xAXI_BASE+0x100C (SB0) ECC Byte               ECC Byte
0xAXI_BASE+0x100E (SB0) ECC Byte               ECC Byte
0xAXI_BASE+0x1010–0xAXI_BASE_103F(SB0) Not in Use

This means the last 8 byte per 16 byte spare block are used for ecc.
This is repeated 3 times (for sb1/sb2/sb3). Looking at the oob data
on a i.MX51 board with 2k Nand we get this:

rebox@Freescale i.MX51 PDK:/ md -s dev/nand_oob0 -b
00000000: ff ff ff ff ff ff ff ff 7b 69 70 f3 13 7f ff 6f ........{ip....o
00000010: ff ff ff ff ff ff ff ff 0c 32 72 66 42 71 ff df .........2rfBq..
00000020: ff ff ff ff ff ff ff ff 47 15 6c 3f 8e 79 ff ff ........G.l?.y..
00000030: ff ff ff ff ff ff ff ff ed f5 55 6b 6a f2 ff 4f ..........Ukj..O

This means the last 8 byte per 16 byte block are used for ecc (don't
know why bytes 14/30/46/62 seem unused). So the hardware indeed matches
the documentation.

Now the nandv2_hw_eccoob_largepage looks like this:

static struct nand_ecclayout nandv2_hw_eccoob_largepage = {
	.eccbytes = 4 * 9,
	.eccpos = {
		 7,  8,  9, 10, 11, 12, 13, 14, 15,
		23, 24, 25, 26, 27, 28, 29, 30, 31,
		39, 40, 41, 42, 43, 44, 45, 46, 47,
		55, 56, 57, 58, 59, 60, 61, 62, 63
	},
	.oobfree = {
		{.offset = 2, .length = 4},
		{.offset = 16, .length = 7},
		{.offset = 32, .length = 7},
		{.offset = 48, .length = 7}
	}
};

And this seems to match both documentation and hardware. Don't know why
byte 7/23/39/55 are marked for ecc, but this doesn't hurt. The important
thing is that we do not add something to .oobfree which is used by the
hardware.

With 4k+128B Nand the controller uses exactly the same layout with the
double size (to protect the other 2k). So what you did really seems to
be correct:

> > > +	.eccbytes = 8 * 9,
> > > +	.eccpos = {
> > > +		7,  8,  9, 10, 11, 12, 13, 14, 15,
> > > +		23, 24, 25, 26, 27, 28, 29, 30, 31,
> > > +		39, 40, 41, 42, 43, 44, 45, 46, 47,
> > > +		55, 56, 57, 58, 59, 60, 61, 62, 63,
> > > +		71, 72, 73, 74, 75, 76, 77, 78, 79,
> > > +		87, 88, 89, 90, 91, 92, 93, 94, 95,
> > > +		103, 104, 105, 106, 107, 108, 109, 110, 111,
> > > +		119, 120, 121, 122, 123, 124, 125, 126, 127,
> > > +	},

So:

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
