Received: from tolkor.sgi.com ([192.48.180.13])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eHcj-0004U8-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 17:00:53 +0100
Message-ID: <3D57DB99.A8F39B75@sgi.com>
Date: Mon, 12 Aug 2002 11:00:25 -0500
From: Steven Hein <ssh@sgi.com>
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
CC: linux-mtd@lists.infradead.org
Subject: Re: Hardware ECC in NAND flash driver
References: <3D511B55.6ADABE4D@sgi.com>
	 <1028726139.19447.255.camel@thomas.tec.linutronix.de>
	 <3D527739.5B19816C@sgi.com> <1028975588.9592.167.camel@thomas.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Thomas Gleixner wrote:

> > I don't have any experience with how any other Hardware ECC generators
> > for NAND flash might work (including DiskOnChip), but the one in the
> > S3C2410 is pretty simple.  Before reading/writing data, you write a bit
> > to an internal register to reset the ECC generator.  Then, after
> > reading/writing the 512 bytes of data, you read a register that contains
> > the 3 byte ECC code (this must be read *before* reading/writing OOB data).
> 3 byte for 512 byte data reduces the recovery probabilty by factor 2.
> I'm wondering, why Samsung did it this way. They support 256 byte page
> NAND chips and don't care about the ECC for these chips. Also they are
> member of the SmartMedia Consortium and the spec's there use definitly 3
> byte ECC per 256 Byte, which means 6 Byte per 512 Byte. So you cannot
> read/write SmartMediaSpec compatible Cards, if you wan't to use the
> onchip ECC generator.
> But maybe they have decided that the ugly SmartMedia DOS-FAT filesystem
> is not reliable and give a sh.. on compability :). This is likely the
> case as they support booting from NAND  in a way which is definitly not
> compatible with SmartMediaDosFAT.
> 
Interesting...... (I didn't have any background on the SmartMedia
spec.).
I just discovered that the next rev. of the Samsung 2410 (rev. 1) no
longer supports NAND parts with 256 byte pages (there was a problem with
nWAIT holding the bus during erase operations or something, so they
redefined the the pin used for 256/512 byte pages to be a R/nB signal
for NAND flash).


> 
> >   2) In nand_write_page(), in order to generate a correct hardware ECC
> >      for partial page writes, you need to write the actual data stored
> >      in the page (rather than pre-padding with 0xff).
> I see your need, but this breaks the datasheet specs. You have to pad
> already written data with 0xff or in case of Samsung NAND you can write
> only the bytes you want program to the chip and the chip takes care of
> 0xff padding itself. As far as I understand the physical insides of
> NAND, it might lead to erroneous behaviour, if you reprogram contents.
> In that case, which should not happen with JFFS2 or any other
> filesystem, which takes care of NAND specific issues, we should skip ECC
> for this page in case we are using a 512 byte only hardware ECC
> generator.

That sounds like the best approach to me also.   (Since I just have a
JFFS2 filesystems and a couple of partitions with a kernel and a
CRAMFS ramdisk, I don't expect to see any partial page programming
happening anyway......)

....As an alternative, if you *really* wanted to do ECC on when you
finally
program to the end of the page, couldn't you....
   -- write the entire 512 bytes out exactly as it should be in Flash
   -- capture/generate the correct hardware ECC
   -- reset (via the SEQIN command) and rewrite the block padded with
0xFF
   -- then issue the PAGE_PROGRAM command
The data doesn't actually get written to the flash until the
PAGE_PROGRAM
command, correct?  This would be slower (as you are writing out the data
twice), but it would allow the correct ECC to be generated.  (This may
not work for all hardware ECC generators I guess).  Again, just a
thought
but not worth pursuing.

> 
> >   3) For NAND controllers like mine with 512-byte ECC, using ECC with
> >      256-byte page NAND chips isn't really practical  (my changes currently
> >      don't handle that case very gracefully, but I'm not using chips with
> >      256-byte pages).
> In this case you could use the software ECC. Your HW driver can specify
> this after chipdetection.

I guess I don't have to worry about this anymore   :)



Thanks,
Steve


-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Steve Hein (ssh@sgi.com)              Engineering Diagnostics/Software
Silicon Graphics, Inc.                          
1168 Industrial Blvd.                 Phone: (715) 726-8410
Chippewa Falls, WI 54729              Fax:   (715) 726-6715
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
