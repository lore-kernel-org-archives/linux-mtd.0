Received: from mail.elutions.com ([64.31.159.3])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QWwWh-0006Fg-4j
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2011 20:17:26 +0000
Received: from mail.elutions.com (127.0.0.1) by mail.elutions.com (MlfMTA
	v3.2r9) id hv41580171st for <linux-mtd@lists.infradead.org>;
	Wed, 15 Jun 2011 15:04:49 -0400 (envelope-from
	<prvs=11471e88ec=mhench@elutions.com>)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: NAND BBT corruption on MPC83xx
Date: Wed, 15 Jun 2011 16:17:19 -0400
Message-ID: <F87D23B7E1F84E4AB52E4FA4A55F85DC0259E00F@tpamail.elutions.com>
In-Reply-To: <BANLkTi=L8CqtTt=+sJ-CHVyXyTsxTR_o8Q@mail.gmail.com>
From: "Mike Hench" <mhench@elutions.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>,
	"MTD list" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the read page -1 problem we discussed earlier Round about line
485 of linux-2.6.39.1/drivers/mtd/nand/fsl_elbc_nand.c

        /* Read back the page in order to fill in the ECC for the
         * caller.  Is this really needed?
         */
        if (full_page && elbc_fcm_ctrl->oob_poi) {
            out_be32(&lbc->fbcr, 3);
            set_addr(mtd, 6, page_addr, 1);

page_addr at this point is always -1.
now WHY a read corrupts that last block I do not know.
-1 is not a valid page address, the address 'protocol' allows more bits
Than the flash uses. So it does not mean 'last block', or last page in
last block.
Maybe it is upsetting the state machine in the flash.
Maybe it is upsetting the ELBC.
You will find that the secondary bad block table (first page, second to
last block) is fine.

the kernel works fine without that block of code. So oob_poi must not be
used anywhere. In any case it is always garbage with the above code.
I raised this issue on this list earlier, no response.
I think Freescale might be more likely to notice on the PPC list.
I don't think they hang out here.

I am happy without that block of useless code.


-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Matthew L.
Creech
Sent: Wednesday, June 15, 2011 2:49 PM
To: MTD list
Subject: NAND BBT corruption on MPC83xx

Hi, I'm not sure whether this list or the U-Boot list is more
appropriate, but figured I'd start here and see if anyone can help.

We've gotten some devices back from the field which all suffer from
this same problem on bootup when attaching UBI (these messages are
from U-Boot):


...
Bad block table found at page 524224, version 0x01
Bad block table found at page 524160, version 0x01
nand_bbt: ECC error while reading bad block table
...(long stream of bogus bad blocks)...
UBI: attaching mtd1 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI error: vtbl_check: volume table check failed: record 0, error 9
UBI error: ubi_init: cannot attach mtd1
UBI error: ubi_init: UBI error: cannot initialize UBI, error -22
UBI init error -22

A full console dump is here:

http://mcreech.com/work/bbt-ecc-error.txt

Question #1: Is the UBI error here attributable to the blocks which
are wrongly marked as bad?  I would assume that it's a red herring,
and I should focus on figuring out how the BBT got corrupted, but
figured I'd check first.

Question #2: Are there any known issues that could cause the BBT to
become corrupt like this?

I noticed that the reported bad blocks were all aligned at multiples
of 0x80000 (with one exception).  Dumping the last 2 blocks shows:
  - one BBT with lots of bytes that have their lower 1 or 2 bits
un-set (e.g. 0xfe instead of 0xff): this explains all the
each-4th-block alignment.
  - the other BBT shows only one factory-marked bad block at
0x062e0000, which is presumably correct.  This is preserved in the
bogus BBT, and is the only non-0x80000-aligned bad block in the table.
  - Only the first 1024 bytes of the BBT contain bogus info - the
latter half of the BBT is all correct

It seems like the original BBT somehow had 0-2 bits corrupted at the
low end of each of its bytes, either while in memory or when the BBT
was written to NAND.  Any ideas on what I can do to isolate the
problem?  Thanks in advance!

More info on this board:
- MPC 8313 SoC
- 1GB Samsung NAND flash (K9K8G08U0B)
- Linux 2.6.31
- U-Boot 2009.06

--=20
Matthew L. Creech

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
