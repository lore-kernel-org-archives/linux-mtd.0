Received: from [81.6.214.140] (helo=mail.infocell-its.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DHB10-0007aE-A0
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2005 20:32:04 -0500
Message-ID: <424CA4EA.8090904@infocell-its.com>
Date: Fri, 01 Apr 2005 02:33:30 +0100
From: Zeri Virgo <zerivirgo@infocell-its.com>
MIME-Version: 1.0
To: Dan Brown <dan_brown@ieee.org>
References: <4249C357.2040600@ieee.org> <424C1C58.3000905@infocell-its.com>
	<424C5F16.8010809@ieee.org>
In-Reply-To: <424C5F16.8010809@ieee.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [UPDATE] DOCBoot support for NFTL-based DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 > - What size is your DOC?
64MB (MD2202-D64)

 > - How big is your firmware area?  (I'm assuming you resized it using
 > the DOS-based tools)
Well, I used dformat on a different chip as suggested, but that was with
the unpatched kernel, so the chip probing failed (but didn't crash).
I'm now using a fresh one - I didn't think I should _have_ to resize the 
firmware area first, should I? I'll try the patched kernel with a 
resized-firmware-area chip tomorrow....ZZZ

 > - Did the diskonchip driver work for you without crashing before my
 > latest changes?
Yes, I've been using 2.6.11.5 with the diskonchip driver compiled in -
see first dmesg section below...

 > - Can you tell me what kind of crash it is?
See second dmesg section below. Looks like it's falling over around 
where the ECC errors were occurring.

Sorry I haven't offered any real help on this!

- Zeri

------------------Unpatched 2.6.11.5------------------------
DiskOnChip found at 0xd0000
DiskOnChip 2000 responds to DWORD access
Detected 2 chips per floor.
NAND device: Manufacturer ID: 0xec, Chip ID:0x75 (Samsung NAND 32MiB
3,3V 8-bit)
2 NAND chips detected
ECC error scanning DOC at 0x18000
Found DiskOnChip ANAND Media Header at 0x18000
ECC error scanning DOC at 0x1c000
Found DiskOnChip ANAND Media Header at 0x1c000
	DataOrgID		= ANAND
	NumEraseUnits		= 4090
	FirstPhysicalEUM	= 6
	Formatted Size		= 66928640
	UnitSizeFactor		= 255
Bad block table at page 193, version 0x55
Bad block table at page 225, version 0x55
Creating 1 MTD partitions on "DiskOnChip 2000 (NFTL Model)":
0x00020000-0x4000000 : " DiskOnChip BDTL partition"
Found alias of DOC at 0xd0000 to 0xd2000
Found alias of DOC at 0xd0000 to 0xd4000
Found alias of DOC at 0xd0000 to 0xd6000
Possible DiskOnChip at 0xe4000 failed TOGGLE test, dropping.
...
------------------------------------------------------------


------------------Patched 2.6.11.5------------------------
DiskOnChip found at 0xd0000
DiskOnChip 2000 responds to DWORD access
Detected 2 chips per floor.
NAND device: Manufacturer ID: 0xec, Chip ID:0x75 (Samsung NAND 32MiB
3,3V 8-bit)
2 NAND chips detected
Unable to handle kernel NULL pointer dereference at virtual address 00000004
  printing eip:
c8861dcd
*pde = 00000000
Oops: 0000 [#1]
...
Call Trace:
  [<c015c3bb>] d_lookup+0x1b/0x40
  [<c010daa6>] recalc_task_prio+0x96/0x170
  [<c010dbd1>] activate_task+0x51/0x70
  [<c8861d4c>] nand_read+0x2c/0x30 [nand]
  [<c88581ae>] find_media_headers+0x3e/0x150 [diskonchip]
  [<c885834f>] nftl_scan_bbt+0x8f/0x360 [diskonchip]
  [<c8863cb6>] nand_scan+0x466/0x940 [nand]
  [<c885815e>] doc2000_count_chips+0x4e/0x60 [diskonchip]
  [<c8858e0b>] init_nanddoc+0x34b/0xad0 [diskonchip]
  [<c01273e2>] sys_init_module+0x132/0x1b0
  [<c0102277>] syscall_call+0x7/0xb
---------------------------------------------------------------
