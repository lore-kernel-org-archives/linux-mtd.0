Received: from stoneboat.aleph1.co.uk ([212.13.198.63] helo=home.wookware.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CASnt-0000y0-Fn
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 08:34:31 -0400
Received: from carnet-gw.aleph1.co.uk ([195.224.76.10] helo=court.aleph1.co.uk)
	by stoneboat.aleph1.co.uk with esmtp (Exim 3.35 #1 (Debian))
	id 1CASnR-0002H5-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Sep 2004 13:34:01 +0100
Received: from xios.aleph1.co.uk ([194.70.44.170] helo=xios ident=Debian-exim)
	by court.aleph1.co.uk with esmtp (Exim 3.35 #1 (Debian))
	id 1CASnb-0000sv-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Sep 2004 13:34:11 +0100
Received: from wookey by xios with local (Exim 4.34) id 1CASnO-0006XS-Kj
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 13:33:58 +0100
Date: Thu, 23 Sep 2004 13:33:58 +0100
From: Wookey <wookey@aleph1.co.uk>
To: linux-mtd@lists.infradead.org
Message-ID: <20040923123358.GB24050@xios>
References: <20040923004331.GA24050@xios> <1095923456.2925.55.camel@thomas>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1095923456.2925.55.camel@thomas>
Sender: Wookey <wookey@aleph1.co.uk>
Subject: Re: Finding which block 'contains' a missing inode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+++ Thomas Gleixner [04-09-23 09:10 +0200]:
> On Thu, 2004-09-23 at 02:43, Wookey wrote:
> > Hello people, I have a JFFS2 NAND rootfs which is giving a single 
> > 'Eep. Child "gpe-filemanager.desktop" (ino #3324) of dir ino #3035 doesn't
> > exist!' error.
> > 
> > I'd like to know if there is a way of finding out either form the live fs or
> > from the jffs2 image file which block the offending inode/file should have
> > been on?
> 
> Get a binary image from the chip and process it with 
> jffs2dump -vc binimg >img.dmp

And the correct way to get a binary image is nanddump /dev/mtd0 <filename>
(und choose unformatted output) ?

If I do this it fails with 'pread:Input/Output error' at the first bad block.
So my image is truncated therer, an the block I am suspicious about is a bit
further in.

I've looked around for some MTD tools docs but failed to find any. Are there
any? Or should I write some? (I've also noticed that the Debian packaged
version is astonishingly ancient - I'll get those updated and/or kick dave
scleef) (I'm not using them - I'm using cvs from 20040825, because that's
what's in our build image at the moment).

> The dump should tell you where which node/fragment resides

It reports and awful lot of header CRC errors - I don't think it should be
that bad.

> > Background: The kernel indicated one 'bad erase block' that is under this
> > fs, but flasheraseall found no problem, and nandwrite did not skip that
> > block. I worry that the block in question doesn't actually have the right
> > data in it - if it corresponded to the above inode then I'd be sure I had
> > located the problem.
> 
> What do you mean ? "kernel indicated one 'bad erase block'". 
> How is it indicated ?

When the kernel initialised it's nand driver it reported a long list of 'bad
erase blocks'. to first 0-255 of these are because the (designed for
windows) bootloader uses a different OOB layout, but one in block 3041 is in
the jffs2 'partition'.

> > There is also a 'normal' bad block (which gives an IO error when
> > flasheraseall tries to erase it) - this _is_ skipped by nandwrite as expected.

Right - I have just worked out that in fact there is only one 'bad block',
not two 'different sorts' - it's just that the first scan is counting 0 from
the start of the flash device, and the rest of the actions arew counting 0
from the 4Mb boundary (because we are avoiding the first4Mb controlled by
the incompatible-OOB bootloader). Oh what fun.

So, now I'm back to the original problem - why is there one ino(de) missing.

More via the #mtd channel I expect...

> Are you using current MTD code ?

reasonably - see above. With a 2.4.26 kernel. (the 2.6 kernel port to this
device hasn't got it's nand support finished yet)

> The code checks the device for bad blocks when nand_scan is called. It
> usually prints the bad block information. Is this your 'normal' bad
> block ?

I'm not sure - this may be the 'bad erase block' scan I descibe above during
kernel boot? 

Currently I get debug at 4 points:
1) kernel nand driver init ('reports 'bad erase blocks') - although in fact it
did this once when I started looking at this problem, and hasn;t done so
since. I'm not quite sure what's going on there. 
2) flasherasell (reports IO errors when it hits bad blocks)
3) nandwrite (reports blocks written and skipped)
4) Jffs2 mount (reports lots of Empty flash at foo, end at foo+a few bytes,
and one eep: child (ino foo) of dir ino bar doesn;t exist.

I don't have a good understanding of how this related to MTD functions (yet).

Wookey
-- 
Aleph One Ltd, Bottisham, CAMBRIDGE, CB5 9BA, UK  Tel +44 (0) 1223 811679
work: http://www.aleph1.co.uk/     play: http://www.chaos.org.uk/~wookey/
