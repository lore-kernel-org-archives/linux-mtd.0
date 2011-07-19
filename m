Message-ID: <20005.7506.283476.184839@ipc1.ka-ro>
Date: Tue, 19 Jul 2011 07:59:46 +0200
From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Ivan Djelic <ivan.djelic@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Re: [i.MX28 GPMI] problem overwriting all-0xff data in NAND
In-Reply-To: <20110718145635.GA24419@parrot.com>
References: <20004.12663.29494.339601@ipc1.ka-ro>
	<20110718145635.GA24419@parrot.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Shawn Guo <shawn.guo@freescale.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Ivan Djelic writes:
> On Mon, Jul 18, 2011 at 02:13:27PM +0100, Lothar Waßmann wrote:
> > Hi,
> > 
> > with the gpmi-nfc driver for imx28 from Shawn Guo on a TX28 I
> > encountered some problems with jffs2 when overwriting pages that have
> > been written with 0xff (e.g. from padding from the file system image
> > file).
> > 
> > The problem is that the ECC info for an all-0xff block is not all-0xff
> > and thus a newly erased block is different from a block that has been
> > written with 0xff.
> > If such a block is being altered (jffs2 thinking it can simply
> > overwrite it without erasing first) the ECC information will be
> > corrupted and will produce ECC errors upon read.
> 
> Hello Lothar,
> 
> Can you describe more precisely what is happening ? How did you come to the
> conclusion that JFFS2 "thinks it can simply overwrite a block without erasing it
> first" ?
> 
I'm writing a JFFS2 image file that is padded with 0xff to eraseblock
size to flash (either from the bootloader or with the nandwrite
utility from Linux).
When mounting the filesystem everything is OK until the first file is
being written. A subsequent read of the affected flash page gives ECC
errors.

JFFS2 is giving out the first all-FF page in the last used block for
creating the new file. Since that block has a non-FF ECC pattern, the
ECC information is being corrupted on write.

> JFFS2 normally marks a block as clean just after it has erased it; it won't
> blindly assume a block is erased and write to it.
> 
The GPMI driver does not allow the OOB area to be written, so JFFS2
cannot and does not use cleanmarkers.
I applied a patch that is distributed by Freescale with their BSPs
that prevents the OOB area from being used by JFFS2:
http://git.tqc.de/cgi-bin/gitweb.cgi?p=linux-2.6-denx.git;a=commitdiff;h=93c3823f2fdb889ad9a56fc4bb926f952c2c5dba

> I am not very familiar with how JFFS2 metadata work, but I doubt it would
> confuse a blank page with a page containing a piece of file with 0xff bytes.
> 
> Are you sure your gpmi-nfc driver is not writing ECC info when JFFS2 writes its
> cleanmarker, like in the issue previously discussed in
> http://lists.infradead.org/pipermail/linux-mtd/2011-June/036538.html ?
> 
No. The ECC is written by the bootloader (or nandwrite utility) when
the image file is initially programmed. I have checked that by dumping
the flash contents right after writing the image file.


Lothar Waßmann
-- 
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstraße 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Geschäftsführer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
