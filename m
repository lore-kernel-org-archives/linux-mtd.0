Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FqZ5O-0006YI-0R
	for linux-mtd@lists.infradead.org; Wed, 14 Jun 2006 13:23:31 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5EHLJrL014928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2006 13:21:19 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.6/NCO/VER7.0) with ESMTP id
	k5EHLJIe222270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2006 13:21:19 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k5EHLIxA029588
	for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2006 13:21:18 -0400
Received: from dyn-9-152-251-70.boeblingen.de.ibm.com
	(dyn-9-152-251-70.boeblingen.de.ibm.com [9.152.251.70])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5EHLIjn029491
	for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2006 13:21:18 -0400
Subject: [MTD] UBI: Unsorted Block Images
From: Frank Haverkamp <haver@vnet.ibm.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Wed, 14 Jun 2006 19:21:16 +0200
Message-Id: <1150305676.5675.18.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[MTD] UBI: Unsorted Block Images

UBI (Latin: "where?") manages multiple logical volumes on a single
flash device, specifically supporting NAND flash devices. UBI provides
a flexible partitioning concept which still allows for wear-levelling
across the whole flash device.

In a sense, UBI may be compared to the Logical Volume Manager
(LVM). Whereas LVM maps logical sector numbers to physical HDD sector
numbers, UBI maps logical eraseblocks to physical eraseblocks.

More information may be found in the UBI design documentation:
ubidesign.pdf. Which can be found here: 
http://www.linux-mtd.infradead.org/doc/ubi.html

Partitioning/Re-partitioning

  An UBI volume occupies a certain number of erase blocks. This is
  limited by a configured maximum volume size, which could also be
  viewed as the partition size. Each individual UBI volume's size can
  be changed independently of the other UBI volumes, provided that the
  sum of all volume sizes doesn't exceed a certain limit.

  UBI supports dynamic volumes and static volumes. Static volumes are
  read-only and their contents are protected by CRC check sums.

Bad eraseblocks handling

  UBI transparently handles bad eraseblocks. When a physical
  eraseblock becomes bad, it is substituted by a good physical
  eraseblock, and the user does not even notice this.

Scrubbing

  On a NAND flash bit flips can occur on any write operation,
  sometimes also on read. If bit flips persist on the device, at first
  they can still be corrected by ECC, but once they accumulate,
  correction will become impossible. Thus it is best to actively scrub
  the affected eraseblock, by first copying it to a free eraseblock
  and then erasing the original. The UBI layer performs this type of
  scrubbing under the covers, transparently to the UBI volume users.

Erase Counts

  UBI maintains an erase count header per eraseblock. This frees
  higher-level layers (like file systems) from doing this and allows
  for centralized erase count management instead. The erase counts are
  used by the wear-levelling algorithm in the UBI layer. The algorithm
  itself is exchangeable.

Booting from NAND

  For booting directly from NAND flash the hardware must at least be
  capable of fetching and executing a small portion of the NAND
  flash. Some NAND flash controllers have this kind of support. They
  usually limit the window to a few kilobytes in erase block 0. This
  "initial program loader" (IPL) must then contain sufficient logic to
  load and execute the next boot phase.

  Due to bad eraseblocks, which may be randomly scattered over the
  flash device, it is problematic to store the "secondary program
  loader" (SPL) statically. Also, due to bit-flips it may become
  corrupted over time. UBI allows to solve this problem gracefully by
  storing the SPL in a small static UBI volume.

UBI volumes vs. static partitions

  UBI volumes are still very similar to static MTD partitions:

    * both consist of eraseblocks (logical eraseblocks in case of UBI
      volumes, and physical eraseblocks in case of static partitions;
    * both support three basic operations - read, write, erase.

  But UBI volumes have the following advantages over traditional
  static MTD partitions:

    * there are no eraseblock wear-leveling constraints in case of UBI
      volumes, so the user should not care about this;
    * there are no bit-flips and bad eraseblocks in case of UBI volumes.

  So, UBI volumes may be considered as flash devices with relaxed
  restrictions.

Where can it be found?

  Documentation, kernel code and applications can be found in the MTD
  gits. 

What are the applications for?

  The applications help to create binary flash images for two
  purposes: pfi files (partial flash images) for in-system update of
  UBI volumes, and plain binary images, with or without OOB data in
  case of NAND, for a manufacturing step. Furthermore some tools
  are/and will be created that allow flash content analysis after a
  system has crashed.

Who did UBI?

  The original ideas, where UBI is based on, were developed by Andreas
  Arnez, Frank Haverkamp and Thomas Gleixner. Josh W. Boyer and
  some others were involved too. The implementation of the kernel
  layer was done by Artem B. Bityutskiy. The user-space applications
  and tools were written by Oliver Lohmann with contributions from
  Frank Haverkamp, Andreas Arnez, and Artem. Joern Engel contributed a
  patch which modifies JFFS2 so that it can be run on a UBI
  volume. Thomas Gleixner did modifications to the NAND layer and also
  some to JFFS2 to make it work.
