Received: from canuck.infradead.org ([2001:8b0:10b:4::1])
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ7PN-0001Ng-00
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 14:19:21 +0100
Received: from mail.deutaeit.de ([213.168.79.210])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ7PJ-0000DG-Re
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 09:19:19 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.deutaeit.de (Postfix) with ESMTP id BA08D1AE3D
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2005 15:19:14 +0200 (CEST)
Received: from mail.deutaeit.de ([127.0.0.1])
	by localhost (eitserver [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23078-09 for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2005 15:19:08 +0200 (CEST)
Received: from shrek.eitintern.de (unknown [192.168.2.1])
	by mail.deutaeit.de (Postfix) with ESMTP id F2FD11AE39
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2005 15:19:07 +0200 (CEST)
From: Thorsten Haas <haas@deutaeit.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 20 May 2005 15:19:08 +0200
Message-Id: <1116595148.2718.32.camel@shrek>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: physmap - flash_eraseall: /dev/mtd1: Permission denied
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello everyone.

I have a board equipped with two flash banks that are consecutively
mapped into the physical memory area. (8MB Intel 28F640J3, at 0x38000000
and 0x38800000, NOR flash).

I like to use both flash banks from linux, but whatever approach I use,
something goes wrong. Mostly I can not erase the banks/partitions and
thus I am not able to write to them.
I've read the howto and googled a lot, but I still cannot figure out
what I am doing wrong. Here are the approaches I tried:

#1: Approach: use physmap.c and several commandline-configured
partitions.
#1: Problem: partitions are not eraseable.

#2: Approach: use physmap.c and two commandline-configured partitions,
each of the size of a flash bank.
#2: Problem: Second partition is not eraseable. (First can be
read/erased/written.)

#3: Approach: use mphysmap.c and two mappings. no partitions.
#3: Problem: second flash bank not erasable.

Here's output of dmesg, /proc/partitions, /proc/mtd and whatever might
be helpful. I am using linux-2.6.11.8 (and mtd cvs snapshot concerning
mphysmap.c).

Sorry for the length and thanks in advance. I would be happy about any
hint or further question about any configuration. If you need any
further or specific information, please just ask me and I will
reconfigure the kernel and look for what you need.

============ Data to approach #1: ==========================
Commandline:
mtdparts=phys_mapped_flash:5632k(root),1024k(kernel),1408k(initrd),128k(reset),8M(jffs2)

Here comes the problem: partitions not eraeable
# flash_eraseall  /dev/mtd0
flash_eraseall: /dev/mtd0: Permission denied
# flash_eraseall  /dev/mtd4
flash_eraseall: /dev/mtd0: Permission denied

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00580000 00020000 "root"
mtd1: 00100000 00020000 "kernel"
mtd2: 00160000 00020000 "initrd"
mtd3: 00020000 00020000 "reset"
mtd4: 00800000 00020000 "jffs2"

# flash_info /dev/mtd0
Device /dev/mtd0 has 0 erase regions
# flash_info /dev/mtd1
Device /dev/mtd1 has 0 erase regions
# flash_info /dev/mtd2
Device /dev/mtd2 has 0 erase regions
# flash_info /dev/mtd3
Device /dev/mtd3 has 0 erase regions
# flash_info /dev/mtd4
Device /dev/mtd4 has 0 erase regions

Question: Is this okay? Zero erase regions?


============ Data to approach #2: ==========================
Commandline: mtdparts=phys_mapped_flash:8M(root),8M(jffs2)

First bank seems okay:
# flash_erase /dev/mtd0 0x0 0x40
Erase Total 64 Units
Performing Flash Erase of length 131072 at offset 0x7e0000 done

Here comes the problem: second bank not eraseable.
# flash_erase /dev/mtd1 0x0 0x40
File open error

# cat /proc/partitions
major minor  #blocks  name
  31     0       8192 mtdblock0
  31     1       8192 mtdblock1

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00800000 00020000 "root"
mtd1: 00800000 00020000 "jffs2"

Question: What did i do wrong (why is the second bank not eraseable)?

============ Data to approach #3: ==========================
Here's the problem: First bank eraseable, second isn't.
# flash_erase /dev/mtd1
File open error

# cat /proc/partitions
major minor  #blocks  name
  31     0       8192 mtdblock0
  31     1       8192 mtdblock1

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00800000 00020000 "bootcs"
mtd1: 00800000 00020000 "romcs1"

# flash_info /dev/mtd1
Device /dev/mtd1 has 1 erase regions
Region 0 is at 0x0 with size 0x20000 and has 0x40 blocks

snippet from dmesg:
cfi_cmdset_0001: Erase suspend on write enabled
0: offset=0x0,size=0x20000,blocks=64
romcs1: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
0: offset=0x0,size=0x20000,blocks=64
=========================================
