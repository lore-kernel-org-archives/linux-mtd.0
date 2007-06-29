Received: from ajax.cnchost.com ([207.155.248.31])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I4Obl-0007Pb-BD
	for linux-mtd@lists.infradead.org; Fri, 29 Jun 2007 18:06:31 -0400
Received: from arvindwin2000 (67.104.37.226.ptr.us.xo.net [67.104.37.226])
	(as arvind@4access-comm.com)
	by ajax.cnchost.com (ConcentricHost(2.54) Relay) with ESMTP id
	E805A6488 for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jun 2007 18:06:27 -0400 (EDT)
Message-ID: <166801c7ba99$5911f460$6501a8c0@arvindwin2000>
From: "Arvind Agrawal" <arvind@4access-comm.com>
To: <linux-mtd@lists.infradead.org>
Subject: Almost all blocks marked bad on Nand partition using YAFFS
Date: Fri, 29 Jun 2007 15:03:38 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please see the attached below for original issue...

I digged into the YAFFS2-.yaffs_mtd1f2.c and mtd/nand code and found a
potential BUG which may cause large numbers of the BLOCKs marked bad.
I have not figured out yet that what conditions may cause this BUG to show
up...

yaffs2 calls mtd->write_oob(mtd, addr, &ops) with ops.databuf and ops.oobbuf
both set.
Which translates into (linux-2.6.20) as nand_do_write_ops().

This functions memsets "chip->oob_poi" to 0xFFs ONLY IF oob is NULL
otherwise, as in case of yaffs2 writes, nand_fill_oob() is called which
fills in the buffer "chip->oob_poi" starting at offset
"chip->ecc.layout->oobfree->offset" which in case of
large page nands is set 2 and is used for BAD BLOCK marking.

This assumes that "chip->oob_poi" is always (atleast byte 0 and 1)
initialised to 0xFF.
Nowhere in the code I noticed it to be initialised to  0xFF and probably
only reason it works that the code is also doing nand_read_oob() which is
initialising it the buffer and first 2 bytes of chip->oob_poi will be
initialized to 0xFF as they are being read from good blocks.

But once chip->oob_poi has or get non 0xFF bytes in first 2 bytes, any data
written onwards by YAFFS2 will turn all the blocks written to BAD Blocks and
that's what I have seen in TWO instances of excessive and consecutive blocks
marked bad.

Now looking at the code, I have not figure out if there is any other
condition where chip->oob_poi, first 2 bytes can be initailsed to non 0xFF
values. Only condition I could think of is a very long shot, and can be
caused by Bit Flipping on byte 0 when doing a nand_read_oob(). 1 bit
Bitflipping on databuf may be corrected by ECC but on OOB bad block bytes no
action is taken.
But then again Bit flipping may be caused on BLOCKs which are in kind of
wearing out state and should not happen on new NAND chips.

I need input on this from MTD and YAFFS gurus or anybody else who may have
seen similar issues.
First do you agree with my analysis and if yes , can you think of anyother
situation which may caused this BUG(??) to pop up..
Any ideas/help is greatly appreciated.

But in anycase, in function nand_do_write_ops() in nand_base.c (linux-2.6.20
onwards) we should probably add


 /* If we're not given explicit OOB data, let it be 0xFF */
 if (likely(!oob))
  memset(chip->oob_poi, 0xff, mtd->oobsize);

with ----------------

 /* If we're not given explicit OOB data, let it be 0xFF */
if (likely(!oob))
  memset(chip->oob_poi, 0xff, mtd->oobsize);
else
  memset(chip->oob_poi, 0xff, chip->ecc.layout->oobfree->offset);

thanks and best regards,

Arvind Agrawal

----- Original Message ----- 
From: "Arvind Agrawal" <arvind@4access-comm.com>
Sent: Tuesday, June 19, 2007 1:00 PM
Subject: Almost all blocks marked bad on Nand partition using YAFFS


> Hi,
>
> we are using YAFFS2 on 256 MB ST Micro Nand Flash.
> Few times we have seen when the unit is powered up and tries to mount the
> YAFFS2 files system, most of the blocks are marked bad and then every time
> on mount it displays the messages
> "Partially written block XXXX being set for retirement".
>
> And all of these blocks are now MARKED BAD in NAND BBT.
>
> we are usinh a mix of JFFS2 on small "ROOT FS" partition and YAFFS2 on
> larger (200MB+) partition
> All other partitions are fine at this point.
>
> The Configuration we are using is
>
> PXA255
> ST Micro 256MB large page NAND Flash
>
> Linux 2.6.20.3
>
> YAFFS2 - Yaffs_checkptrw.c, v 1.13 2007/02/14
> YAFFS_CHECKPOINT_VERSION 2
>
> yaffs_guts.c, v 1.48 2007/03/12
>
> yaffs_ecc.c v 1.9 2007/02/14
>
>
>
> NAND Flash is partitioned as
>
> 0000 - 0x20000     ---> System Area
> 0x20000 - 0x100000  ---> Control
> 0x100000-0x300000  ----> kernel
>
> 0x300000-0x1300000 ---> Root File system ---- JFFS2
>
> 0x1300000-0xEE00000 ---> User File System ---- YAFFS2
>
>
> Any Ideas? Does anybody else has seen similar issues
>
> Any help is greatly appreciated.
>
>
> thanks,
>
> Arvind
>
>
