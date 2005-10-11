Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EPKP5-0001pd-Pp
	for linux-mtd@lists.infradead.org; Tue, 11 Oct 2005 09:43:14 -0400
Message-ID: <434BC152.6060105@ieee.org>
Date: Tue, 11 Oct 2005 09:42:42 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
References: <434A9F39.29129.1B3216A@localhost>
In-Reply-To: <434A9F39.29129.1B3216A@localhost>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: docboot: nandwrite:  Input file is not page aligned
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I can shed some light on some of these issues:

Joseph M Dupre (AVAB Inc.) wrote:
> I am trying to use the /mtd/docboot tool to place a boot image on a 
> DOC 2000 (INFTL version), but nandwrite is failing:
> 
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 08000000 00004000 "DiskOnChip 2000 (INFTL Model)"
> mtd1: 00a14000 00004000 " DiskOnChip BDK partition"
> mtd2: 075dc000 00004000 " DiskOnChip BDTL partition"
> # flash_eraseall /dev/mtd1
> erasing 16 Kibyte @ 74000 -- 4 % complete
> Skipping badblock @ 0x00078000
> Erasing 16 Kibyte @ a10000 -- 99 % complete.

First thing to note:  The "Skipping badblock" is reporting the location 
of the bad block *relative to the start of mtd1*, not relative to the 
start of the entire device.  More on this below.

> # nandwrite -o /dev/mtd1 doc_spl
> Input file is not page aligned: Success
> Data did not fit into device, due to bad blocks.
> : Success
> 
> First, what is this "Input file is not page aligned" error and how do 
> I make the doc_spl image so that it is page aligned?

This is odd.  Can you show me the output of the 'make' command (in 
particular, it prints some info on the # and types of sectors in 
doc_spl)?  Also, what is the exact size of your doc_spl?

> Second,  there is only one bad block on the 10MB BDK partition, so 
> there shouldn't be any problem loading my doc_spl which is only 1.9MB 
> (Unless nandwrite is not aware of bad blocks.) How do I fix that 
> issue?

This is a bug in nandwrite.  Only the first error message (not page 
aligned) is real.  The second one is a completely bogus consequence of 
the first.  Basically, the first error skips over the entire writing 
process to a piece of code designed to close down all the files.  It 
also checks the amount of unwritten data (in your case, ALL of it), and 
reports an error if any data was unwritten.  Ugh.

> Third,  when the kernel reads the bbt it reports two bad blocks:
> nand_read_bbt: Bad block at 0x00080000
> nand_read_bbt: Bad block at 0x03370000
> nand_read_bbt: Reserved block at 0x07ffc000
> That, in conjunction with the badblock reported by flash_eraseall, 
> indicates to me that the IPL is actually using 2 eraseblocks.
> (0x0080000 - 0x00078000 = 0x00008000)
> I thought the IPL is only supposed to be in the first erase block.  
> Is that correct?

Here's what's really happening:

  - The IPL does indeed take up just one block, the first block.
  - The MediaHeader takes up the second block.
  - /dev/mtd1 starts at the third block, at 0x8000.
  - Nandwrite reports a bad block at 0x78000 from the start of mtd1.
  - Adding in the start address of mtd1 we get 0x78000 + 0x8000 = 0x80000.
  - This agrees with the bbt scan.

Hopefully we can figure out your 'not page aligned' issue with some more 
info.

	-Dan
