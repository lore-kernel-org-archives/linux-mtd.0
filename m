Received: from igloo.df.lth.se ([194.47.250.47] helo=df.lth.se)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FBD7w-0000MX-Gx
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 10:39:07 -0500
Received: from festis.df.lth.se (UNKNOWN@festis.df.lth.se [194.47.250.37])
	by df.lth.se (8.13.1/8.13.1) with ESMTP id k1KFcvFQ025162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Feb 2006 16:38:57 +0100 (CET)
Received: from festis.df.lth.se (hagar@localhost.localdomain [127.0.0.1])
	by festis.df.lth.se (8.13.4/8.13.4/Debian-3) with ESMTP id
	k1KFcv9E008055
	for <linux-mtd@lists.infradead.org>; Mon, 20 Feb 2006 16:38:57 +0100
Received: (from hagar@localhost)
	by festis.df.lth.se (8.13.4/8.13.4/Submit) id k1KFcvXA008054
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 16:38:57 +0100
Date: Mon, 20 Feb 2006 16:38:57 +0100
From: =?iso-8859-1?Q?H=E5kan?= Kvist <hagar@df.lth.se>
To: linux-mtd@lists.infradead.org
Message-ID: <20060220153856.GA8027@festis.df.lth.se>
References: <20060217094403.GA20803@festis.df.lth.se>
	<20060217152524.GA21805@festis.df.lth.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060217152524.GA21805@festis.df.lth.se>
Subject: Re: Problems with getting a nand-flash chip to work
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 17, 2006 at 04:25:25PM +0100, Håkan Kvist wrote:
> On Fri, Feb 17, 2006 at 10:44:03AM +0100, Håkan Kvist wrote:

[..]

> I belive that I forget to mention that the chip that we are currently 
> using is the 512 Mbit chip from STMicroelectronics.
> 
> I also have tested the to write directly to the nand with the 
> mtd_debug utility.
> 
> I've filled the first 4 blocks (65535 bytes) with data, and I can read
> it back successfully and verify that it is identical to what I wrote.
> 
> What is the next thing I should look into?

Now I have erased the flash with "flash_eraseall -j /dev/mtdx",
then the nanddump utility was used to dump the contens of the flash to
a file.

According to the documentation on the linux-mtd homepage the first
oob-area of every page should look like this 
(03 20 is ERASEBLOCK_CLEANMARKER):

          xx xx xx xx xx xx xx xx  85 19 03 20 08 00 00 00

and what I got is (05 20 is ERASEBLOCK_HEADER)
         
          xx xx xx xx xx xx xx xx  85 19 05 20 18 00 00 00

Is that correct?

The state of the flash after a flash_erasell -j, should be a
filesystem that can be mounted directly, without doing any erasing,
right?

As the result from doing mtd_eraseall isn't cleanmarker blocks it is
perhpahs not so strange that mount complains about that 
cleanmarker nodes aren't to be found.

And as posted before, I get the following when running
  mount -t JFFS2 /dev/mtdX /mnt

========== Output from mount (just the last rows)
mtd->read(0x400 bytes from 0x3fec000) returned ECC error
nand_read_oob: from = 0x03fec000, len = 64
nand_isbad_bbt(): bbt info for offs 0x03ff0000: (block 4092) 0x00
nand_read_oob: from = 0x03ff0000, len = 48
jffs2_check_nand_cleanmarker_ebh(): Cleanmarker node not 
detected in block at 03ff0000
nand_read_ecc: from = 0x03ff0000, len = 1024
nand_read_ecc: Failed ECC read, page 0x0001ff80
mtd->read(0x400 bytes from 0x3ff0000) returned ECC error
nand_read_oob: from = 0x03ff0000, len = 64
JFFS2: Erase block at 0x03ff0000 is not formatted. It will be erased
nand_isbad_bbt(): bbt info for offs 0x03ff4000: (block 4093) 0x00
nand_read_oob: from = 0x03ff4000, len = 48
jffs2_check_nand_cleanmarker_ebh(): Cleanmarker node not detected 
in block at 03ff4000
nand_read_ecc: from = 0x03ff4000, len = 1024
nand_read_ecc: Failed ECC read, page 0x0001ffa0
nand_read_ecc: Failed ECC read, page 0x0001ffa1
mtd->read(0x400 bytes from 0x3ff4000) returned ECC error
nand_read_oob: from = 0x03ff4000, len = 64
JFFS2: Erase block at 0x03ff4000 is not formatted. It will be erased
nand_isbad_bbt(): bbt info for offs 0x03ff8000: (block 4094) 0x00
nand_read_oob: from = 0x03ff8000, len = 48
nand_read_ecc: from = 0x03ff8000, len = 1024
nand_read_ecc: Failed ECC read, page 0x0001ffc0
mtd->read(0x400 bytes from 0x3ff8000) returned ECC error
nand_read_oob: from = 0x03ff8000, len = 64
nand_isbad_bbt(): bbt info for offs 0x03ffc000: (block 4095) 0x00
nand_read_oob: from = 0x03ffc000, len = 48
nand_read_ecc: from = 0x03ffc000, len = 1024
nand_read_ecc: Failed ECC read, page 0x0001ffe0
nand_read_ecc: Failed ECC read, page 0x0001ffe1
mtd->read(0x400 bytes from 0x3ffc000) returned ECC error
nand_read_oob: from = 0x03ffc000, len = 64
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 0, bad_blocks 1, c->nr_blocks 4096
mount: Mounting /dev/mtdblock1 on /mnt/flash failed: Input/output error


========== Output from hexdump|tail -20
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
*
00000200  ff ff ff ff ff ff ff ff  85 19 05 20 18 00 00 00
00000210  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
*
00000410  ff ff ff ff ff ff ff ff  64 93 3c ed 00 00 00 00
00000420  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
*
00000620  ff ff ff ff ff ff ff ff  00 00 00 00 00 00 00 00
00000630  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
*
00004400  ff ff ff ff ff ff ff ff  85 19 05 20 18 00 00 00
00004410  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
*
00004610  ff ff ff ff ff ff ff ff  64 93 3c ed 00 00 00 00
00004620  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
*
00004820  ff ff ff ff ff ff ff ff  00 00 00 00 00 00 00 00
00004830  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff



best regards
Håkan
