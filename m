Received: from koko.iders.ca ([206.45.72.61])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MZswY-000117-OD
	for linux-mtd@lists.infradead.org; Sat, 08 Aug 2009 20:55:15 +0000
Received: from [200.123.101.231] (zen.iders.ca [200.123.101.231])
	by koko.iders.ca (Postfix) with ESMTP id 064BA3E400A
	for <linux-mtd@lists.infradead.org>;
	Sat,  8 Aug 2009 15:54:56 -0500 (CDT)
Message-ID: <4A7DE61F.6010605@iders.ca>
Date: Sat, 08 Aug 2009 15:54:55 -0500
From: Andrew McKay <amckay@iders.ca>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Block erasure on MT29F16G08DAA issue
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey guys,

I'm having issues with MT29F16G08DAA parts with MTD on Linux.  I have found a 
strange issue with block erasure failures.  The part seems to get in a state 
where if a block fails erasure, all pages with-in that block (including the OOB 
area) will read all 0x00.  I realize that internally the part may write all bits 
to 0 to prevent over erasure of already erased bits, however if the device is 
powercycled, the data that was in that block before the erase is still there.

Here is a dump of what I'm seeing.

/mnt/zen/mtd-utils # ./nanddump -s 0x29a00000 -l 0x1000 -p /dev/mtd12
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 204
Number of bbt blocks: 0
Block size 262144, page size 4096, OOB size 128
Dumping data starting at 0x29a00000 and ending at 0x29a01000...
0x29a00000: 03 00 00 00 09 75 00 00 ff ff 2e 73 76 6e 00 00
0x29a00010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00100: 00 00 00 00 00 00 00 00 00 00 ff ff ed 41 00 00
0x29a00110: 00 00 00 00 00 00 00 00 0a d6 7c 4a 0b d6 7c 4a
0x29a00120: 0b d6 7c 4a ff ff ff ff ff ff ff ff ff ff ff ff
0x29a00130: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x29a00140: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x29a00150: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[SNIP]
0x29a00f40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x29a00f50: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x29a00f60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x29a00f70: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x29a00f80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x29a00f90: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x29a00fa0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x29a00fb0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x29a00fc0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x29a00fd0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x29a00fe0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x29a00ff0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff cb 19 00 00 1d 75 00 30 09 75 00 80 00 00
   OOB Data: 00 00 25 7c 05 c4 06 00 00 00 f9 ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff 00 c3 a9 6a 67 ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff


/mnt/zen/mtd-utils # ./flash_erase /dev/mtd12 0x29a00000
Erase Total 1 Unnand_erase: start = 0x29a00000, len = 262144
its
Performing Flash Erase of length 262144 at offset 0x29a00000single_erase_cmd
nand_erase: Failed erase, page 0x00029a00

MTD Erase failure: Input/output error


/mnt/zen/mtd-utils # ./nanddump -s 0x29a00000 -l 0x1000 -p /dev/mtd12
ECC failed: 0
ECC corrected:ECC: BAD
  0
Number of baECC: BAD
d blocks: 204
NECC: BAD
umber of bbt bloECC: BAD
cks: 0
Block siECC: BAD
ze 262144, page ECC: BAD
size 4096, OOB sECC: BAD
ize 128
DumpingECC: BAD
  data starting aECC: BAD
t 0x29a00000 andECC: BAD
  ending at 0x29aECC: BAD
01000...
ECC: BAD
ECC: BAD
ECC: BAD
ECC: BAD
ECC: BAD
ECC: 16 uncorrectable bitflip(s) at offset 0x29a00000
0x29a00000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00110: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00120: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00130: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00140: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00150: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[SNIP]
0x29a00f40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00f50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00f60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00f70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00f90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00fa0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00fb0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00fc0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00fd0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00fe0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x29a00ff0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
   OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
   OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
   OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
   OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
   OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
   OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
   OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
   OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
/mnt/zen/mtd-utils #

The big issue here is that I've also testing writing to this block after a 
failed erasure, and I can't seem to write to it either.  I tried forcing the 
block to all zeros after the failed erase, and on reboot the previous data is 
still in the block.  This means that when MTD is told to mark this block as bad, 
the write of the first two bytes in the first two pages of the block also fails. 
  Therefore the page never gets marked bad.  Eventually an erase will work and 
the block goes back to a "working" state.  However it'll end up in this strange 
state again at some point.

Has anyone seen this happen before with NAND parts?  Is there a way to avoid 
this?  I have tried issuing a RESET command to the part after a failed erase, 
but all the pages in the block stay in this strange state.  The only thing that 
seems to recover the device is to power cycle it.

I suppose I could change to using a BBT that is written to the NAND device, 
hopefully then the bad blocks would be kept track of.  Though I've never had an 
issue with marking blocks bad by writing the first two bytes of the first two 
pages to 0x00 and have Linux build a BBT on the fly during boot-up.

Thanks,
Andrew McKay
Iders Inc.
