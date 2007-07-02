Received: from 206.173.66.57.ptr.us.xo.net ([206.173.66.57]
	helo=zebra.brightstareng.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I5NrT-0007q2-8K
	for linux-mtd@lists.infradead.org; Mon, 02 Jul 2007 11:30:49 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zebra.brightstareng.com (Postfix) with ESMTP id 737D528C2AE
	for <linux-mtd@lists.infradead.org>;
	Mon,  2 Jul 2007 11:30:44 -0400 (EDT)
Received: from zebra.brightstareng.com ([127.0.0.1])
	by localhost (zebra [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 17665-10 for <linux-mtd@lists.infradead.org>;
	Mon,  2 Jul 2007 11:30:40 -0400 (EDT)
Received: from pippin (unknown [192.168.1.25])
	by zebra.brightstareng.com (Postfix) with ESMTP id 5D99E28C29F
	for <linux-mtd@lists.infradead.org>;
	Mon,  2 Jul 2007 11:30:40 -0400 (EDT)
From: ian@brightstareng.com
Subject: Re: Almost all blocks marked bad on Nand partition using YAFFS
Date: Mon, 2 Jul 2007 11:30:39 -0400
References: <mailman.1.1183219206.5706.linux-mtd@lists.infradead.org>
In-Reply-To: <mailman.1.1183219206.5706.linux-mtd@lists.infradead.org>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
To: Undisclosed.Recipients: ;
Message-Id: <200707021130.39952.ian@brightstareng.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Arvind,

On Friday 29 June 2007 17:30, Arvind Agrawal wrote:
> O.K. I digged into the YAFFS2-.yaffs_mtd1f2.c and mtd/nand
> code and found a potential BUG which may cause large numbers
> of the BLOCKs marked bad. I have not figured out yet that what
> conditions may cause this BUG to show up...
>
> yaffs2 calls mtd->write_oob(mtd, addr, &ops) with ops.databuf
> and ops.oobbuf both set.
> Which translates into (linux-2.6.20) as nand_do_write_ops().
>
> This functions memsets "chip->oob_poi" to 0xFFs ONLY IF oob is
> NULL otherwise, as in case of yaffs2 writes, nand_fill_oob()
> is called which fills in the buffer "chip->oob_poi" starting
> at offset "chip->ecc.layout->oobfree->offset" which in case of
> large page nands is set 2 and is used for BAD BLOCK marking.
>
> This assumes that "chip->oob_poi" is always (atleast byte 0
> and 1) initialised to 0xFF.
> Nowhere in the code I noticed it to be initialised to  0xFF
> and probably only reason it works that the code is also doing
> nand_read_oob() which is initialising it the buffer and first
> 2 bytes of chip->oob_poi will be initialized to 0xFF as they
> are being read from good blocks.
>
> But once chip->oob_poi has or get non 0xFF bytes in first 2
> bytes, any data written onwards by YAFFS2 will turn all the
> blocks written to BAD Blocks and that's what I have seen in
> TWO instances of excessive and consecutive blocks marked bad.
>
> Now looking at the code, I have not figure out if there is any
> other condition where chip->oob_poi, first 2 bytes can be
> initailsed to non 0xFF values. Only condition I could think of
> is a very long shot, and can be caused by Bit Flipping on byte
> 0 when doing a nand_read_oob(). 1 bit Bitflipping on databuf
> may be corrected by ECC but on OOB bad block bytes no action
> is taken.
> But then again Bit flipping may be caused on BLOCKs which are
> in kind of wearing out state and should not happen on new NAND
> chips.
>
> I need input on this from MTD and YAFFS gurus or anybody else
> who may have seen similar issues.
> First do you agree with my analysis and if yes , can you think
> of anyother situation which may caused this BUG(??) to pop
> up..

Arvind, I have just looked over the code and concur with you
that this is a problem.  I don't see any simple/reliable
fix that could be included in Yaffs code as a workaround.  
Perhaps we should prepare a patch to include with Yaffs.

> But in anycase, in function nand_do_write_ops() in nand_base.c
> (linux-2.6.20 onwards) we should probably add
>
>
>  /* If we're not given explicit OOB data, let it be 0xFF */
>  if (likely(!oob))
>   memset(chip->oob_poi, 0xff, mtd->oobsize);
>
> with ----------------
>
>  /* If we're not given explicit OOB data, let it be 0xFF */
> if (likely(!oob))
>   memset(chip->oob_poi, 0xff, mtd->oobsize);
> else
>   memset(chip->oob_poi, 0xff,
> chip->ecc.layout->oobfree->offset);

Perhaps simply do the memset unconditionally -- it's less work
than running through the ecc.layout->oobfree array to figure
out what to 0xff, and the data is needed (in cache) for update 
and writing out to NAND shortly thereafter.

-imcd
