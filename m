Received: from mail.udm.ru ([217.14.192.20] helo=aps.mark-itt.ru)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ZskC-0001FG-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2001 12:33:53 +0100
Received: from [195.161.198.29] (HELO 195.161.198.29)
  by aps.mark-itt.ru (CommuniGate Pro SMTP 3.4.8)
  with ESMTP id 13841889 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2001 16:39:43 +0500
Date: Thu, 23 Aug 2001 16:42:42 +0400
From: ASA <atris@mail.ru>
Reply-To: ASA <atris@mail.ru>
Message-ID: <1776086221.20010823164242@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: BLKRRPART bug in NFTL?
In-reply-To: <E15ZVks-00081M-00@pentafluge.infradead.org>
References: <E15ZVks-00081M-00@pentafluge.infradead.org>
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

tried anybody to use *fdisk on DiskOnChip2000 from ramdisk
and got expected results?

I'm automating linux installation, so such thing is needed...

My system consists of:
hardware:
  special embedded motherboard with AMD 486DX4-100
  8 MB RAM
  DiskOnChip 2000 (8 MB flash)
software:
  linux kernel 2.4.1 with MTD 20010730 snapshot
  root filesystem on /dev/ram0 (loaded via cmdline: initrd=inird.gz root=/dev/ram0)

All is based on debian potato (2.2; glibc 2.1; some utils, including
  sfdisk, are upgraded in order to proper work with 2.4 kernel)

Symptoms are:
after executing

  #deleting any partition for sanity
  dd if=/dev/zero of=/dev/nftla bs=512 count=1
  # BLKRRPART ioctl (reread partition information)
  sfdisk -R /dev/nftla

  # making 5 and 3 megs partitions on 8 MiB DOC
  echo ",5000,L,*;,,L;;" | sfdisk -f /dev/nftla

  # make sure partition information is reread
  sfdisk -R /dev/nftla

the root filesystem (ramdisk) is screwed up!

again, after clean reboot only invoking
BLKRRPART ioctl is enough to break ramdisk

in the same configuration, operating with hard disks instead of DOC
is absolutely .

Also, to reproduce this bug in other environment (only the kernel is
the same) I tried to put my kernel (2.4.1+MTD-20010730) on the debian
installation diskette and after using cfdisk ramdisk was screwed again...

-- 
Best regards,
 ASA                            mailto:atris@mail.ru
