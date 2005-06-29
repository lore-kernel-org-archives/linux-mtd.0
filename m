Received: from gateway0.eecs.berkeley.edu ([169.229.60.93])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dngw5-0004gl-HN
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2005 14:05:23 -0400
Received: from [192.168.1.121] (adsl-69-109-178-37.dsl.pltn13.pacbell.net
	[69.109.178.37]) (authenticated bits=0)
	by gateway0.EECS.Berkeley.EDU (8.13.4/8.13.3) with ESMTP id
	j5TI4xsY000144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Jun 2005 11:05:00 -0700 (PDT)
Message-ID: <42C2E2CB.9030404@eecs.berkeley.edu>
Date: Wed, 29 Jun 2005 11:04:59 -0700
From: Andrew Schultz <alschult@eecs.berkeley.edu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Booting Linux 2.6 with DiskOnChip 2000 TSOP (INFTL)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I've spent a few days attempting to get a new 256MB DiskOnChip 2000 
TSOP working properly with Linux 2.6.11.  I have been using the MTD 
drivers that come with the vanilla version of the kernel and so far 
I can properly dformat, fdisk, format, and copy the file system so 
everything is cool with the kernel driver.

However, all my attempts to get grub/lilo/docboot to work in booting 
of the DOC have been in vain.  My first question is does the current 
grub patch actually have support for the TSOP (and INFTL devices in 
general)?  I found two previous posts in 2002 and 2003 
(http://lists.infradead.org/pipermail/linux-mtd/2003-November/008922.html 
and 
http://lists.infradead.org/pipermail/linux-mtd/2003-April/007487.html)
which seem to be inconclusive about the current support of INFTL 
devices and grub.

Secondly, if grub isn't known to work on these devices, does anyone 
have a procedure for getting lilo/docboot to work?  I followed the 
instructions from M-Systems about getting lilo to work, and while 
lilo installs the boot sector to the disk, it simply hangs with no 
output at boot.  I tried docboot, but that hangs with "Opening 
Docboot..." and now I can't boot anything off that chip.  Any 
experience (or even any success stories) would be greatly appreciated.

Andrew

For reference, here is what I have been doing with grub in case 
anyone can point out a problem:

1) In linux booted off a hard drive, dformat the chip (I've also 
tried using DOS dformat from a boot CD):

./dformat -winl:0000 -winh:d8000 -s:DOC514.EXB -empty -nodos -y
(the winl/winh stuff is a hack I have to do cause just -win:d8000 
causes a segfault)

2) Fdisk drive and dd a copy of my partition

fdisk (create one single linux partition which I have marked as 
bootable)
dd if=/dev/hda1 of=/dev/inftla1 bs=512

3) Grab the latest mtd source from CVS, build grub 0.97, copy 
stage2/pre_stage2 into mtd/grub, run make

4) Install the "grub_firmware" to the disk on chip (I've also tried 
this step first in lieu of step 1)

./dformat -winl:0000 -winh:d8000 -bdkf0:grub_firmware
