Received: from woody.esisar.inpg.fr ([195.220.37.21] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17A91u-00060V-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 13:46:18 +0100
Received: from isar.esisar.inpg.fr (isar.esisar.inpg.fr [195.220.37.100])
	by woody.esisar.inpg.fr (Postfix) with ESMTP id 63437EE173
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 13:47:15 +0200 (MEST)
Received: from ES0325 (es0325.esisar.inpg.fr [195.220.37.146])
	by isar.esisar.inpg.fr (Postfix) with SMTP id 021496F44
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 14:43:28 +0200 (MET DST)
Reply-To: <Gregory.Janiszewski@esisar.inpg.fr>
From: "Gregory Janiszewski" <Gregory.Janiszewski@esisar.inpg.fr>
To: <linux-mtd@lists.infradead.org>
Subject: Installation of DoC, HELP...
Date: Tue, 21 May 2002 14:41:53 +0200
Message-ID: <000001c200c4$e306aa10$9225dcc3@ES0325>
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

Hi,

I've got a big problem, I can't install my DoC2000 under Linux.
I work with the RedHat 7.3, with a 2.4.18 kernel.

I follow the step described in the "mtd-jffs-HOWTO.txt" document for a 2.4.x
kernel, with the latest mtd cvs.

The kernel seems to work fine but I can't access the DoC with a fdisk or
mk2fs commands.
I've got this dmesg :

*******************
Possible DiskOnChip with unknown ChipID BF found at 0xc8000
Possible DiskOnChip with unknown ChipID FF found at 0xca000
DiskOnChip 2000 found at address 0xCC000
Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba TH58V128DC)
3 flash chips found. Total DiskOnChip size: 48 MiB
mtd: Giving out device 0 to DiskOnChip 2000
Possible DiskOnChip with unknown ChipID FF found at 0xce000
Possible DiskOnChip with unknown ChipID FF found at 0xd0000
Possible DiskOnChip with unknown ChipID FF found at 0xd2000
Possible DiskOnChip with unknown ChipID FF found at 0xd4000
Possible DiskOnChip with unknown ChipID FF found at 0xd6000
Possible DiskOnChip with unknown ChipID FF found at 0xd8000
Possible DiskOnChip with unknown ChipID FF found at 0xda000
Possible DiskOnChip with unknown ChipID FF found at 0xdc000
Possible DiskOnChip with unknown ChipID FF found at 0xde000
Possible DiskOnChip with unknown ChipID F8 found at 0xe0000
Possible DiskOnChip with unknown ChipID 97 found at 0xe2000
Possible DiskOnChip with unknown ChipID 63 found at 0xe4000
Possible DiskOnChip with unknown ChipID F0 found at 0xe6000
Possible DiskOnChip with unknown ChipID FF found at 0xe8000
Possible DiskOnChip with unknown ChipID FF found at 0xea000
Possible DiskOnChip with unknown ChipID FF found at 0xec000
Possible DiskOnChip with unknown ChipID FF found at 0xee000
NFTL driver: nftlcore.c $Revision: 1.86 $, nftlmount.c $Revision: 1.28 $
NFTL: UnitSizeFactor 0x00 detected. This violates the spec but we think we
know what it means...
Cannot calculate an NFTL geometry to match size of 0x17780.
Using C:1001 H:16 S:6 (== 0x17760 sects)
 nftla: nftla1

*********************

I use a PCI evaluation board with a MD2202-D48-X DoC2000.
RedHat 7.3 on a Pentium 4.


So I try to format and partition the Doc with "fdisk /dev/nftla", but the
command "freeze", nothing append ???

Maybe you have an url that explain step by step, how to install a DoC2000 ?
I need your help, thank you.



Gregory JANISZEWSKI
