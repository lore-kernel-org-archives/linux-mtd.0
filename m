Received: from mail.deutaeit.de ([213.168.79.210])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DYg2r-000461-Ve
	for linux-mtd@lists.infradead.org; Thu, 19 May 2005 04:06:20 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.deutaeit.de (Postfix) with ESMTP id EC83D1C860
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2005 10:06:19 +0200 (CEST)
Received: from mail.deutaeit.de ([127.0.0.1])
	by localhost (eitserver [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12255-10 for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2005 10:06:13 +0200 (CEST)
Received: from shrek.eitintern.de (unknown [192.168.2.1])
	by mail.deutaeit.de (Postfix) with ESMTP id 14B441AF4C
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2005 10:06:13 +0200 (CEST)
From: Thorsten Haas <haas@deutaeit.de>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1116403535.2682.7.camel@shrek>
References: <1116403535.2682.7.camel@shrek>
Content-Type: text/plain
Date: Thu, 19 May 2005 10:06:12 +0200
Message-Id: <1116489972.2647.4.camel@shrek>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: CFI physmap - how to create partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mittwoch, den 18.05.2005, 10:05 +0200 schrieb Thorsten Haas:
> Hello everyone,
> 
> I have a board equipped with CFI-compatible NOR-flash, which is
> physmapped and detected by the kernel (/dev/mtd0 in /proc/mtd). Now I am
> trying to configure partitions. I read the HOWTO on
> ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd/mtd-jffs-HOWTO.txt,
> googled and browsed kernel code (2.6.8.11) and a daily mtd-snapshot
> (2005-05-15). From what i read, I understand:
> a) Command line partition table parsing is not functional with
> physmapped devices
> b) I need to create and fill a 'struct mtd_partition' and call
> physmap_configure() and physmap_set_partitions()
> Is this correct so far?
> 
> I've seen people writing board-dependent mapping drivers, thus
> clobbering the section "mapping driver for chip access". Is this
> actually the way to go? Well, I am not too lazy to write some code, but
> is there a more genric way?
> 
> Best regards,
> Thorsten Haas

Solved. I used mphysmap.c, because there are two banks of flash on my
board, but mphysmap.c does not support partitioning yet. Though,
physmap.c does provide commandline partition parsing.
Sadly, mtd-id's seem not to be well-documented. I looked the one for
mappings to the physical memory area up in the source. It's
"phys_mapped_flash". Huzaa.

Thus, I wrote some additional text into chapter "Making partitions with
CFI flash and working with multiple banks of FLASH" of
mtd-jffs-HOWTO.txt. ( retreived it from
ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd/mtd-jffs-HOWTO.txt )

Here's a patch to it:

*** mtd-jffs-HOWTO.txt  2005-05-18 16:05:16.000000000 +0200
--- mtd-jffs-HOWTO-new.txt      2005-05-18 16:05:01.000000000 +0200
***************
*** 515,528 ****
  Unlike a "regular" block device, you cannot launch fdisk and create
  partitions on /dev/mtdblock0,1,2,3...
  
! (As far as I know) CFI flash partitions have to be created and
! compiled in the physmap.c file.
! 
! The same goes for multiple banks of flash memory. (IS THIS CORRECT????
! Check and correct.)
! 
! An example of creating partitions can be found in the file
! mtd/kernel/sbc_mediagx.c
  
  An example of multiple banks of flash chips being mapped into separate
  /dev/mtdn devices can be found in the file mtd/kernel/octagon_5066.c
--- 515,554 ----
  Unlike a "regular" block device, you cannot launch fdisk and create
  partitions on /dev/mtdblock0,1,2,3...
  
! CFI flash partitions have to be created on the kernel command line or
! have to be hard-coded into the kernel source. Before command line
partition
! table parsing was available, people had to write board-specific
mapping
! drivers. You still can find some of these below 'Mapping drivers for
chip
! access' in the kernel configuration.
! 
! To make use of command line partition table parsing enable
! CONFIG_MTD_CMDLINE_PARTS in the kernel configuration.
! 
! The format for the command line is as follows:
! 
!  mtdparts=<mtddef>[;<mtddef]
!  <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
!  <partdef> := <size>[@offset][<name>][ro] 
!  <mtd-id>  := unique id used in mapping driver/device
!  <size>    := standard linux memsize OR "-" to denote all remaining
space
!  <name>    := (NAME)
! 
! Example:
! You have a CFI-flash (size 8M) mapped to the physical memory area at
! 0x38000000. Enable CONFIG_MTD_PHYSMAP, set start address to 0x38000000
and
! length to 0x800000.
! 
! You want two partitions like: one megabyte (not million bytes) to hold
a
! write-protected kernel image and the rest to hold a rootfs.
!   
! Add the following to the kernel command line:
! mtdparts=phys_mapped_flash:1M(kernel)ro,-(rootfs)
! 
! If you do not want to use command line partition table parsing you
might start
! off with the physmap.c file and create and compile the partitions
withing the
! kernel itself. You might chose to do so, or you might write a board
specific
! mapping 'driver', like mentioned above. An example of creating
partitions can
! be found in the file mtd/kernel/sbc_mediagx.c
  
  An example of multiple banks of flash chips being mapped into separate
  /dev/mtdn devices can be found in the file mtd/kernel/octagon_5066.c
***************
*** 530,536 ****
  registering the mtd device in "init_oct5066()". You may also add
  partitions to each bank by looking at code in mtd/kernel/sbc_mediagx.c
  
! 
  
  
  *** Mounting a JFFS(1 or 2) F/S as root device.
--- 556,591 ----
  registering the mtd device in "init_oct5066()". You may also add
  partitions to each bank by looking at code in mtd/kernel/sbc_mediagx.c
  
! Mapping multiple CFI flash devices into the physical memory map is
currently
! supported by CONFIG_MTD_MULTI_PHYSMAP. This lets you configure up to
four
! separate flash banks (file mphysmap.c). This also lets you have gaps
between
! flash chips, but partitioning support is not available out-of-the-box
yet, at
! least not from the command line. 
! 
! If you like to partition multiple banks of flash from the command
line, you do
! good to map your flash banks one after the other into the physical
memory area
! without leaving any gap between them. Let's assume you have two banks
of CFI
! flash (size 8M each) mapped to 0x38000000 and 0x38800000. Then do not
touch
! CONFIG_MTD_MULTI_PHYSMAP but configure CONFIG_MTD_PHYSMAP. Set the
starting
! address to 0x38000000 and length to 0x1000000 (16MBytes).
! On startup the kernel will still recognise two banks: 
!       
!  physmap flash device: 1000000 at 38000000
!  phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank
!  phys_mapped_flash: Found 1 x16 devices at 0x800000 in 16-bit bank.
! 
! Now you may use a commandline like:
! mtdparts=phys_mapped_flash:1M(kernel)ro,7M(rootfs),8M(moredata).
! 
! Et voila, the kernel will create partitions:
! 
!  Creating 3 MTD partitions on "phys_mapped_flash":
!  0x00000000-0x00100000 : "kernel"
!  mtd: Giving out device 0 to kernel
!  0x00100000-0x00800000 : "root"
!  mtd: Giving out device 1 to root
!  0x00800000-0x01000000 : "moredata"
!  mtd: Giving out device 2 to moredata
  
  
  *** Mounting a JFFS(1 or 2) F/S as root device.
