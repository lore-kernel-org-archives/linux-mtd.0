Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ycpes-0002xr-B6
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 06:28:19 +0000
Message-ID: <1427783272.30360.153.camel@sauron.fi.intel.com>
Subject: Re: Mounting UBIFS images with a min. I/O unit of 1 byte
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: "Kline, Matthew" <matthew.kline@flukenetworks.com>
Date: Tue, 31 Mar 2015 09:27:52 +0300
In-Reply-To: <E8C63C11EA3FB04DBDFEDECEFD927FD1140C207A@US-EVT-EXM04-P.global.tektronix.net>
References: <E8C63C11EA3FB04DBDFEDECEFD927FD1140C207A@US-EVT-EXM04-P.global.tektronix.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matt,

On Mon, 2015-03-30 at 18:13 +0000, Kline, Matthew wrote:
> Hello all,
> 
> I am attempting to mount a UBIFS image to extract and inspect the files within.
> Unfortunately, I'm running into a bunch of problems. For starters, there doesn't
> seem to be a canonical way to do so - the process listed at
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_extract
> seems out of date given how my kernel (3.19.2) behaves and compared to processes
> listed at more recent sources such as
> http://elinux.org/UBIFS#Mounting_UBI_Image_on_PC_using_nandsim or
> https://gist.github.com/naodesu/10620506. At any rate, I have had the most luck
> with the third method, but mount fails, logging to dmesg,
> "validate_sb: min. I/O unit mismatch: 8 in superblock, 2048 real".

Right, there is no canonical way, unfortunately, no one created it.

> After asking around on the IRC channel #mtd, I understand that the
> problem is caused by the UBIFS image being byte-addressable
> (with mkfs.ubifs being passed -m 1), while the NAND device nandsim is simulating
> is addressable to 2048 bit (or byte?) blocks (hence the dmesg output).

8 is what UBI/UBIFS uses in case of NOR flashes. So you seem to have an
image made for a NOR flash and you are trying to put it to a NAND flash
simulator.

> So, if the image has a minimum I/O unit of 1 byte and most NAND memory
> has a unit of >= 512 bytes
> (as mentioned at http://linux-mtd.infradead.org/doc/ubi.html#L_min_io_unit),
> is mounting it with nandsim out of the question? Is there any other approach
> I can take?

Try mtdram - should help. Make sure it is built, then modprobe mtdram.
There are parameters to control eraseblock size and flash size.

Generally - UBI/UBIFS images are specific to flash geometry. If you want
to mount the image, you need to have a flash of the same geometry:
eraseblock size and min. I/O unit size. Flash size should be same or
larger.

HTH.

P.S: feel free to amend the mtd web site too. Send patches against the
'mtd-www.git' project.
