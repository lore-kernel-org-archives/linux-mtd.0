Received: from mail.udm.ru ([217.14.192.20] helo=aps.mark-itt.ru)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Rt5O-0006QN-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 Aug 2001 11:18:44 +0100
Received: from [195.161.198.29] (HELO 195.161.198.29)
  by aps.mark-itt.ru (CommuniGate Pro SMTP 3.4.8)
  with ESMTP id 13066743 for linux-mtd@lists.infradead.org; Wed, 01 Aug 2001 14:33:01 +0500
Date: Wed, 1 Aug 2001 14:34:42 +0400
From: ASA <atris@mail.ru>
Reply-To: ASA <atris@mail.ru>
Message-ID: <12120674119.20010801143442@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: got stuck with DoC 2000
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hello all,

 I'm trying to set up DiskOnChip 2000 in order to work with Linux 2.2.18.
 After downloading latest snapshot (20010730 by tuesday, ie yesterday)
 and applying 'mtd-2.2.17.patch' to the pure 2.2.18 kernel (from
 kernel.org) there was 5 rejected hunks but I handled them manually.

 then I created:
   /dev/mtd char 90,0
   /dev/nftl block 93,0
   /dev/nftl1 block 93,1
   /dev/nftl2 block 93,2
   /dev/nftl3 block 93,3
   /dev/nftl4 block 93,4

 configured kernel with: 'MTD Support' 'NFTL Support' and 'DOC 2000
 support' as modules

 after compiling, rebooting and trying
   insmod mtdcore.o
   insmod docprobe.o
 I got
   Possible DiskOnChip with unknown Chip ID FF found at 0xc8000
   Possible DiskOnChip with unknown Chip ID FF found at 0xcc000
   cannot find driver for DiskOnChip Millenium at 0xd0000
   cannot find driver for DiskOnChip Millenium at 0xd2000
   Possible DiskOnChip with unknown Chip ID FF found at 0xd4000
   Possible DiskOnChip with unknown Chip ID FF found at 0xd8000
   ...
   Possible DiskOnChip with unknown Chip ID FF found at 0xe8000
   Possible DiskOnChip with unknown Chip ID FF found at 0xec000
   
 and loading other modules has no effect. lsmod reports that they are
 loaded. I think that all of these not works:

 # cat /dev/mtd
 ... no such device
 # cat /dev/nftl
 ... no such device

 Compiling these modules as builtin parts of kernel has errors, mainly
 for drivers/mtd/chips/chipres.c at line 67. After quick digging this
 line was split and #ifdef KMOD ... #endif inserted. There was another
 two compilation errors due to unneeded modularization (fix: move last
 #endif to nearly end of text).
 After rebooting the same message about "Millenium" was remain and
 shown during bootup.

 Then I've thied the same patches on pure 2.2.17 kernel. No rejected
 hunks and so on... But during compilation as builtin there was
 linking error "unresolved symbol init_mtd_devices". After compiling
 as module and trying to "insmod mtd_core" - the same linking error.

 And, my DoC is working fine under MS DOS and acts as DoC 2000, not
 Millenium.

 Where I was wrong? Is there any detailed step-by-step instruction to
 set up DoC2000?

 I can use 2.4 kernel but I don't want this - I'm developing embedded
 device and do not want to enlarge system even by 150-200K. In fact,
 I cannot fit kernel 2.4 (even packed with UPX) and initrd with glibc
 2.1 together on single bootable standard-formatted floppy.

 Also, I'm limited to use only 2.2.18 or only 2.4.1 (but not 2.2.17,
 2.2.19, 2.4.2 ... 2.4.7, etc...) due to strict nature of RTLinux 3.0.

-- 
Best regards,
 ASA                          mailto:atris@mail.ru
