Received: from 212.68.198.130.brutele.be ([212.68.198.130] helo=mail.boat.be)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zxLm-0005a7-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2002 11:48:58 +0100
Received: from idefix.boat.be (idefix.boat.be [192.168.1.2])
	by mail.boat.be (Postfix) with ESMTP id 749211E87
	for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2002 10:56:40 +0200 (CEST)
Received: from roadie.boat.be (roadie.boat.be [192.168.1.14])
	by idefix.boat.be (8.11.0/8.10.1) with ESMTP id g9BB94h23211
	for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2002 13:09:04 +0200
Subject: DoC trouble on wafer PC
From: Robert Sprockeels <robert.sprockeels@boat.be>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 11 Oct 2002 12:48:58 +0200
Message-Id: <1034333338.2619.81.camel@roadie.boat.be>
Mime-Version: 1.0
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

Hi all,

As a DoC newbie, I searched the mailing list archives for the problem I
encounter without success. So, here goes (sorry if this question has
already been answered x^10 times...).

I want to use a 16Mb DoC 2000 device to boot from on a wafer PC (Geode
GX-1-300, 64Mb RAM). I followed the recommendations as in the
mtd-jffs-HOWTO but seem to have a slight problem.

I try this with LEAF Bering rc3 (leaf.sourceforge.net), an embedded
Linux with kernel version 2.4.18. I use the modules approach, since this
allows me to "play around until it works" ;-)

So, in sequence I load (with insmod, no modprobe available):
mtdcore.o
nftl.o
docecc.o
doc2000.o

A cat /proc/mtd reports:
dev:    size   erasesize  name
mtd0: 01000000 00004000 "DiskOnChip 2000"

dmesg also reports that the device was found:
DiskOnChip 2000 found at address 0xD6000
Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba TH58V128DC)
1 flash chips found; Total DiskOnChip size: 16 MiB
 nftla: nftla1

I have both /dev/mtd and /dev/mtd0 devices, and also /dev/nftla and
/dev/nftla[1-4]

I try to look on the device if there is already something on it, but get
this message:

# sfdisk -l /dev/nftla
/dev/nftla: Device not configured

sfdisk: cannot open /dev/nftla for reading

Any ideas, recommendations or pointers to help me over this barrier? Do
I need to format the DoC device before I can access it?

Robert
