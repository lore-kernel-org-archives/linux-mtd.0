Received: from mail-ea0-x22f.google.com ([2a00:1450:4013:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq6yX-0000Mn-Eh
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 19:58:44 +0000
Received: by mail-ea0-f175.google.com with SMTP id z10so1799491ead.20
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2013 11:58:19 -0800 (PST)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: b32955@freescale.com,
	dwmw2@infradead.org,
	dedekind1@gmail.com
Subject: [PATCH v1] mtd: gpmi: Bitflip support in erased regions
Date: Mon,  9 Dec 2013 20:58:10 +0100
Message-Id: <1386619091-23992-1-git-send-email-eliedebrauwer@gmail.com>
Cc: Elie De Brauwer <eliedebrauwer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixed cc to linux-mtd, please ignore my previous version.

Hello all,

I bumped into an issue on a custom board with an i.MX28 and a Micron 
MT29F4G08 NAND flash. My system running a 3.9.0 failed to boot during 
upgrade testing  due to UBI errors related to a bitflips in NAND:

[    3.831323] UBI warning: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
[    3.845026] UBI warning: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
[    3.858710] UBI warning: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
[    3.872408] UBI error: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read 16384 bytes
...
[    4.011529] UBIFS error (pid 36): ubifs_recover_leb: corrupt empty space LEB 27:237568, corruption starts at 9815
[    4.021897] UBIFS error (pid 36): ubifs_scanned_corruption: corruption at LEB 27:247383
[    4.030000] UBIFS error (pid 36): ubifs_scanned_corruption: first 6569 bytes from LEB 27:247383

Diving a bit deeper with nanddump:
root@(none):~# nanddump -a  /dev/mtd8  > /dev/null
ECC failed: 8
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 262144, page size 4096, OOB size 224
Dumping data starting at 0x00000000 and ending at 0x1ea00000...
ECC: 1 corrected bitflip(s) at offset 0x042c2000
ECC: 1 uncorrectable bitflip(s) at offset 0x06efe000
root@(none):~# nanddump  -s 116129792 -c --noecc     -l 262144 /dev/mtd8 
...
0x06efe6a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 7f  |................|

Which is points to a well know 'corrupt empty space' issue, which appears 
every now and then:
 - http://permalink.gmane.org/gmane.linux.drivers.mtd/46617
 - http://lists.infradead.org/pipermail/linux-mtd/2012-January/039254.html

Hence I went on a quest to teach my NAND driver how to do this, gpmi-nand in 
question. The problem is that although on properly written data which gets
streamed through the BCH block we get 16 bit ecc, if we erase block we git
like 0 bit ecc, since erase is a command, not a stream of data travelling 
through the BCH block. The BCH block (see i.MX28 reference manual chapters 
15 GPMI and 16 BCH) can tell us of protected chunks:
 - if they are error free (if ecc data is present)
 - the amount of bitflips they contain (if ecc data is present)
 - if they are fully erased (all 0xFF's)
 - if they are uncorrectable (# bitflips > ecc_strength, or 0xFF with 
bitflips).
In the current situation as soon as a single bitflip exists in a region 
where the parity information is all 0xFF (looking like it's erased) the 
block is marked as uncorrectable. Which is a pity since I can peform this 
kind of ECC by hand.

Quote datasheet:
"As the BCH decoder reads the data and parity blocks, it records a special condition, i.e.,
that all of the bits of a payload data block or metadata block are one, including any associated
parity bytes. The all-ones case for both parity and data indicates an erased block in the
NAND device."

Fortunately we can more or less tune this parameter by using the 
ERASE_THRESHOLD in HW_BCH_MODE register:
"This value indicates the maximum number of zero bits on a flash page for 
it to be considered erased. For SLC NAND devices, this value should be 
programmed to 0 (meaning that the entire page should consist of bytes of 
0xFF. For MLC NAND devices, bit errors may occur on reads (even on blank 
pages), so this threshold can be used to tune the erased page checking 
algorithm."

So as my solution I'm setting this erase threshold to the ecc_strength 
derived from the geometry, meaning that I will tolerate the same number of 
bitflips the BCH block would consider correctable.
The side effect is that whever I'm reading a page (gpmi_ecc_read_page() ) 
which the BCH block marked as "erased" I need to take a software approach. 
The software approach is inspired on what is currently
done in the omap2 driver (but not free from discussion). At that point I 
now that the page can contain up to ecc_strenght bitflips, so I need to 
count and correct them if necessary. This obviously gives a slight overhead
 when compared to a normal read of erased pages but is more polite towards 
upper layers.
On the other hand, the upper layers should also show some intelligence when 
it comes to reading erased pages which doesn't make much sense either. 

I considered alternatives based upon the 'let it fails as it does now, and 
try to intelligently figure out whether or not it's an erased page or not' 
possibly using additional byte in the metadata or something based
on fuzzy rules, but this is actually the solution which ended up giving 
most certainty. 

I have tested this on a 3.9/i.MX28 and after applying this patch my board 
went from a stubbornly-whining-about-corrupt-empty-space to happily 
mounting the partition and even the trace of my stuck bit disappeared:

root@(none):~# nanddump -a  /dev/mtd8  > /dev/null
ECC failed: 0
ECC corrected: 1
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 262144, page size 4096, OOB size 224
Dumping data starting at 0x00000000 and ending at 0x1ea00000...
ECC: 1 corrected bitflip(s) at offset 0x042c2000


I have also seen Pekon is eagerly trying to get the code removed from omap2,
 (e.g.  http://lists.infradead.org/pipermail/linux-mtd/2013-July/047548.html ) 
but even though his set of patches is currently in their 4th version I 
haven't seen any proper solution to handling bitflips in erased pages 
without iterating through them. 

Any suggestions or feedback is welcomed.
E.


Elie De Brauwer (1):
  mtd: gpmi: Deal with bitflips in erased regions regions

 drivers/mtd/nand/gpmi-nand/bch-regs.h  |    1 +
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |    7 ++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   40 +++++++++++++++++++++++++++++---
 3 files changed, 45 insertions(+), 3 deletions(-)

-- 
1.7.10.4
