Received: from w228.z208176144.sjc-ca.dsl.cnc.net ([208.176.144.228]
	helo=ns1.pwrseries.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EUuUs-0000Z1-SE
	for linux-mtd@lists.infradead.org; Wed, 26 Oct 2005 19:15:58 -0400
Received: from [192.168.1.143] (w238.z208176144.sjc-ca.dsl.cnc.net
	[208.176.144.238])
	by ns1.pwrseries.com (8.12.8/8.12.8) with ESMTP id j9QM3Vj3012143
	for <linux-mtd@lists.infradead.org>; Wed, 26 Oct 2005 15:03:31 -0700
From: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 26 Oct 2005 15:28:21 -0700
MIME-Version: 1.0
Message-ID: <435FA095.5458.FEF746@dupre.avab.com>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: Diskonchip: loading grub firmware problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am having "issues" with loading the grub_firmware image onto my DOC-
2000 (MD2202-D128)  It appears to get written, but the system will 
not boot to grub.

I have managed (not without jumping through many hoops) to build grub 
patched with the grub-2003-11-10-doc.patch.  It appears to have been 
successful-- no compile errors and a resulting stage1/grub_firmware 
file.  I am not using the --enable-diskonchip-biosnetboot option, so 
it should be using the 19h bootstrap interrupt. So far so good.

When I use the m-systems utility
> dformat /win:c800 /bdkf0:grub_int.19h
it executes without error.  (note: grub_firmware was renamed to 8.3 
format to fit on boot floppy)

But when I power off and reboot I do not get grub or any grub 
messages.  The original "TrueFFS 5140 Inside" boot message no longer 
displays, but I do not get any of the grub boot messages either.

I tried playing around with the BIOS boot order settings, but the 
system always says there is no boot device available, or if there is 
one, attempts to boot from it rather than grub on the DOC.

I tried again using the doc_loadbios method instead:
$ ./doc_loadbios /dev/mtd0 ../../grub-20031110/stage1/grub_firmware
This however returns an error:
nand_erase: attempt to erase a bad block at page 0x00000000
ioctl(MEMERASE): Input/output error

The kernel log regarding detection of the DOC is below.  It correctly 
identifies the two known bad blocks.  But it also identifies block 
0x00000000 as "reserved".  Is this being incorrectly identified by 
doc_loadbios as "bad"?

Also the number of boot image blocks being "-1" seems odd to me.  And 
what of the INFTL message about "cannot calculate a geometry"?  
Although I have not tested it intensively, the DOC does appear to 
work correctly as an inftl device either mounted as a FAT formatted 
partition or EXT2.  I was even able to successfully use DOCBOOT.  I'd 
really like to get GRUB working though as it would be helpful to boot 
via tftp as well.

Here is what the kenel thinks about my DOC: 

user.info kernel: INFTL: inftlcore.c $Revision: 1.18 $, inftlmount.c 
$Revision: 1.16 $
user.notice kernel: DiskOnChip found at 0xc8000
user.debug kernel: Detected 2 chips per floor.
user.info kernel: NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 
(Samsung NAND 64MiB 3,3V 8-bit)
user.info kernel: 2 NAND chips detected
user.debug kernel: Bad block table found at page 262112, version 0x55
user.warn kernel: Bad block table not found for chip 0
user.debug kernel: nand_read_bbt: Reserved block at 0x00000000
user.debug kernel: nand_read_bbt: Bad block at 0x00080000
user.debug kernel: nand_read_bbt: Bad block at 0x03370000
user.debug kernel: nand_read_bbt: Reserved block at 0x07ffc000
user.info kernel: Found DiskOnChip BNAND Media Header at 0x4000
user.info kernel:     bootRecordID          = BNAND
user.warn kernel:     NoOfBootImageBlocks   = -1
user.warn kernel:     NoOfBinaryPartitions  = 1
user.warn kernel:     NoOfBDTLPartitions    = 1
user.warn kernel:     BlockMultiplerBits    = 0
user.warn kernel: ormatFlgs            = 1
user.warn kernel:     OsakVersion           = 5.1.4.0
user.warn kernel:     PercentUsed           = 98
user.info kernel:     PARTITION[0] ->
user.warn kernel:         virtualUnits    = 4
user.warn kernel:         firstUnit       = 2
user.warn kernel:         lastUnit        = 5
user.warn kernel:         flags           = 0x20000000
user.warn kernel:         spareUnits      = 0
user.info kernel:     PARTITION[1] ->
user.warn kernel:         virtualUnits    = 8019
user.warn kernel:         firstUnit       = 8
user.warn kernel:         lastUnit        = 8191
user.warn kernel:         flags           = 0xc0000000
user.warn kernel:         spareUnits      = 2
user.warn kernel: INFTL: cannot calculate a geometry to match size of 
0x3ea60.
user.warn kernel: INFTL: using C:1002 H:16 S:16 (== 0x3ea00 sects)
user.info kernel:  inftla: inftla1
user.notice kernel: Creating 2 MTD partitions on "DiskOnChip 2000 
(INFTL Model)":
user.notice kernel: 0x00008000-0x00018000 : " DiskOnChip BDK 
partition"
user.notice kernel: 0x00020000-0x08000000 : " DiskOnChip BDTL 
partition"
