Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CudHd-0006WQ-Px
	for linux-mtd@lists.infradead.org; Fri, 28 Jan 2005 16:04:03 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e3.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j0SL3uZW003259
	for <linux-mtd@lists.infradead.org>; Fri, 28 Jan 2005 16:03:56 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0SL3uwd078280
	for <linux-mtd@lists.infradead.org>; Fri, 28 Jan 2005 16:03:56 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j0SL3u3T027292
	for <linux-mtd@lists.infradead.org>; Fri, 28 Jan 2005 16:03:56 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 28 Jan 2005 15:03:52 -0600
Message-Id: <1106946232.7542.33.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: haverkam@de.ibm.com
Subject: NAND partitioning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

>From what I understand, partitioning on NAND is the same as partitioning
on NOR.  A map driver calls add_mtd_partitions passing a mtd_partition
structure which has the partitions listed with name, physical offset
into the chip, and a size.

I stumbled upon the docboot directory today and read the README.  Seems
that M-Systems marks the eraseblocks for their 1st and 2nd stage boot
loaders using a special marker in the OOB area.  I assume that map
drivers that use such devices simply make partitions for these areas and
leave them be for the most part.

After thinking about that for a bit, why would one need to create
separate partitions for that?  Could JFFS2 grok a "binary eraseblock"
marker instead?  It would essentially ignore the data such an
eraseblock.

Some might be asking, "What's wrong with normal partitioning?"  Well,
given that NAND is somewhat unreliable it might be advantageous to use
JFFS2 across the entire device.  If normal partitions are used, they
limit the amount of wear-leveling that JFFS2 can do on the device.
Basically you only get wear-leveling within that partition.  The higher
the number of partitions, the worse wear-leveling you get across the
chip.

This concept extends to any sort of "binary" data that one would want on
the device.  To access the data contained in said eraseblocks, one could
write a device driver that understood the data and presented it to the
user via a MTD device.

Thoughts?

josh
