Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uFOj-0002UY-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2001 16:15:38 +0100
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14uFNH-0008Bh-00
	for mtd-list@infradead.org; Mon, 30 Apr 2001 16:14:07 +0100
Received: from 209-184-180-125.faxtell.net ([209.184.180.125] helo=eventlog.faxtell.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14uFNE-0008Bb-00
	for mtd@infradead.org; Mon, 30 Apr 2001 16:14:04 +0100
Message-ID: <004f01c0d188$4688c5e0$88b4b8d1@ShuhIII>
Reply-To: "Shuh C. Chang" <schang@3inet.com>
From: schang@3inet.com (Shuh C Chang)
To: <mtd@infradead.org>
References: <21813.988381415@redhat.com>
Subject: Is DOC Address 0xC8000 Something Special?
Date: Mon, 30 Apr 2001 10:14:39 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Dear MTD fans:

I would like to ask the developers in this list if any of you have ever
experienced a DiskOnChip (DOC) problem not being recognized at address
0xC8000 ONLY by docprobe.

By accident, we found that, for some reason, docprobe.c fails to detect
the DOC address set at 0xC8000.  Is it a special address that needs special
treatment?  I checked the source code of docprobe.c but couldn't find
anything suspecious.  I then begin to suspect that if this is because of the
eval board (directly from M-System) that we are using.  Did any of you
experience the same problem with other (non-M-System) boards?  Can you shed
some light on this?

The same problem (not recognizing DOC) occurs for both fixed address probe
(C8000 in config) as well as autoprobe (0000 in config).  Strangely,
docprobe works well (again, both fixed and auto probe) at two other DOC
addresses: 0xD0000 and 0xD8000.

We are using M-System's eval boards: "91-PB-010-00 REV C" (newer board) and
"91-PB-001-00 REV B" (older board), which can only be physically set at
three addresses: C8000, D0000 and D8000.  The Linux kernel that we use is
2.4.2.

Based on our tests, the same docprobe code produces a slightly different
results using these two different eval boards from M-System.  The older
board basically produces the same results as the new board except that it's
missing the formatting part in the output.   It looks like that when the
newer board is used, docprobe can detect that the DOC is not properly
formatted yet and then does format the "chain" and "block".  When the older
board is used, docprobe can not detect the format, and therefore requires a
manual nftl format later (based on the well known "Could not find valid boot
record" and "Could not mount NFTL device" messages).

Here are the dmesg snips for these tests based on the newer board.

======== Auto Probe for DOC Address C8000 ================
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Using configured probe address 0xc8000
Possible DiskOnChip with unknown ChipID EA found at 0xc8000
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $

======== Fixed Probe for DOC Address C8000 ================
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Using configured probe address 0xc8000
Possible DiskOnChip with unknown ChipID EA found at 0xc8000

======== Auto Probe for DOC Address D0000 ================
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Possible DiskOnChip with unknown ChipID EA found at 0xc8000
Possible DiskOnChip with unknown ChipID 00 found at 0xca000
Possible DiskOnChip with unknown ChipID FF found at 0xcc000
Possible DiskOnChip with unknown ChipID FF found at 0xce000
DiskOnChip Millennium found at address 0xD0000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
1 flash chips found. Total DiskOnChip size: 8 Mbytes
Possible DiskOnChip with unknown ChipID FF found at 0xd2000
Possible DiskOnChip with unknown ChipID FF found at 0xd4000
Possible DiskOnChip with unknown ChipID FF found at 0xd6000
Possible DiskOnChip with unknown ChipID FF found at 0xd8000
Possible DiskOnChip with unknown ChipID FF found at 0xda000
Possible DiskOnChip with unknown ChipID FF found at 0xdc000
Possible DiskOnChip with unknown ChipID FF found at 0xde000
Possible DiskOnChip with unknown ChipID FF found at 0xe0000
Possible DiskOnChip with unknown ChipID FF found at 0xe2000
Possible DiskOnChip with unknown ChipID FF found at 0xe4000
Possible DiskOnChip with unknown ChipID FF found at 0xe6000
Possible DiskOnChip with unknown ChipID FF found at 0xe8000
Possible DiskOnChip with unknown ChipID FF found at 0xea000
Possible DiskOnChip with unknown ChipID FF found at 0xec000
Possible DiskOnChip with unknown ChipID FF found at 0xee000
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $
Block 1015: free but referenced in chain 16
Formatting chain at block 16
Formatting block 16
Formatting block 1015
Block 1016: free but referenced in chain 17
Formatting chain at block 17
Formatting block 17
Formatting block 1016
Block 1019: free but referenced in chain 20
Formatting chain at block 20
Formatting block 20
Formatting block 1019
Block 1020: free but referenced in chain 21
Formatting chain at block 21
Formatting block 21
Formatting block 1020
Block 1021: free but referenced in chain 22
Formatting chain at block 22
Formatting block 22
Formatting block 1021
Block 35: referencing block 24 already in another chain
Formatting chain at block 35
Formatting block 35
Block 36: referencing block 25 already in another chain
Formatting chain at block 36
Formatting block 36
Block 37: referencing block 26 already in another chain
Formatting chain at block 37
Formatting block 37
Block 41: referencing block 32 already in another chain
Formatting chain at block 41
Formatting block 41
Block 46: referencing block 42 already in another chain
Formatting chain at block 46
Formatting block 46
 nftla: nftla1

======== Fixed Probe for DOC Address D0000 ================
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Using configured probe address 0xd0000
DiskOnChip Millennium found at address 0xD0000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
1 flash chips found. Total DiskOnChip size: 8 Mbytes
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $
Block 1021: free but referenced in chain 22
Formatting chain at block 22
Formatting block 22
Formatting block 1021
 nftla: nftla1

======== Auto Probe for DOC Address D8000 ================
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Possible DiskOnChip with unknown ChipID EA found at 0xc8000
Possible DiskOnChip with unknown ChipID 00 found at 0xca000
Possible DiskOnChip with unknown ChipID FF found at 0xcc000
Possible DiskOnChip with unknown ChipID FF found at 0xce000
Possible DiskOnChip with unknown ChipID FF found at 0xd0000
Possible DiskOnChip with unknown ChipID FF found at 0xd2000
Possible DiskOnChip with unknown ChipID FF found at 0xd4000
Possible DiskOnChip with unknown ChipID FF found at 0xd6000
DiskOnChip Millennium found at address 0xD8000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
1 flash chips found. Total DiskOnChip size: 8 Mbytes
Possible DiskOnChip with unknown ChipID FF found at 0xda000
Possible DiskOnChip with unknown ChipID FF found at 0xdc000
Possible DiskOnChip with unknown ChipID FF found at 0xde000
Possible DiskOnChip with unknown ChipID FF found at 0xe0000
Possible DiskOnChip with unknown ChipID FF found at 0xe2000
Possible DiskOnChip with unknown ChipID FF found at 0xe4000
Possible DiskOnChip with unknown ChipID FF found at 0xe6000
Possible DiskOnChip with unknown ChipID FF found at 0xe8000
Possible DiskOnChip with unknown ChipID FF found at 0xea000
Possible DiskOnChip with unknown ChipID FF found at 0xec000
Possible DiskOnChip with unknown ChipID FF found at 0xee000
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $
Block 1016: free but referenced in chain 17
Formatting chain at block 17
Formatting block 17
Formatting block 1016
Block 1021: free but referenced in chain 22
Formatting chain at block 22
Formatting block 22
Formatting block 1021
Block 36: referencing block 25 already in another chain
Formatting chain at block 36
Formatting block 36
 nftla: nftla1

===============================================

As an example, here is an output based on the old board:

======== Auto Probe for DOC Address D0000 (Old board) ==============
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Possible DiskOnChip with unknown ChipID EA found at 0xc8000
Possible DiskOnChip with unknown ChipID 00 found at 0xca000
Possible DiskOnChip with unknown ChipID FF found at 0xcc000
Possible DiskOnChip with unknown ChipID FF found at 0xce000
DiskOnChip Millennium found at address 0xD0000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
1 flash chips found. Total DiskOnChip size: 8 Mbytes
Possible DiskOnChip with unknown ChipID FF found at 0xd2000
Possible DiskOnChip with unknown ChipID FF found at 0xd4000
Possible DiskOnChip with unknown ChipID FF found at 0xd6000
Possible DiskOnChip with unknown ChipID FF found at 0xd8000
Possible DiskOnChip with unknown ChipID FF found at 0xda000
Possible DiskOnChip with unknown ChipID FF found at 0xdc000
Possible DiskOnChip with unknown ChipID FF found at 0xde000
Possible DiskOnChip with unknown ChipID FF found at 0xe0000
Possible DiskOnChip with unknown ChipID FF found at 0xe2000
Possible DiskOnChip with unknown ChipID FF found at 0xe4000
Possible DiskOnChip with unknown ChipID FF found at 0xe6000
Possible DiskOnChip with unknown ChipID FF found at 0xe8000
Possible DiskOnChip with unknown ChipID FF found at 0xea000
Possible DiskOnChip with unknown ChipID FF found at 0xec000
Possible DiskOnChip with unknown ChipID FF found at 0xee000
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $
Could not find valid boot record
Could not mount NFTL device

===============================================

As you can see, the old board requires a manual nftl format, but not the new
board.

Any clues?

Shuh Chang
schang@3inet.com







To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
