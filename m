Received: from node3.inaccessnetworks.com ([212.205.200.118]
	helo=inaccessnetworks.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fup4S-0006IW-Nd
	for linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 07:16:08 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by inaccessnetworks.com (8.13.6/8.13.5) with ESMTP id k5QBFv73001079
	for <linux-mtd@lists.infradead.org>; Mon, 26 Jun 2006 14:15:57 +0300
Received: from inaccessnetworks.com ([127.0.0.1])
	by localhost (host11.inaccessnetworks.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 00581-12 for <linux-mtd@lists.infradead.org>;
	Mon, 26 Jun 2006 14:15:57 +0300 (EEST)
Received: from priv.inaccessnetworks.com (orion.priv.inaccessnetworks.com
	[192.168.1.2])
	by inaccessnetworks.com (8.13.6/8.13.5) with ESMTP id k5QBFsSp001074
	for <linux-mtd@lists.infradead.org>; Mon, 26 Jun 2006 14:15:54 +0300
Received: from draco (draco.priv.inaccessnetworks.com [192.168.1.3])
	by priv.inaccessnetworks.com (8.12.1/8.12.1) with ESMTP id
	k5QBFsBJ030172
	for <linux-mtd@lists.infradead.org>; Mon, 26 Jun 2006 14:15:54 +0300
Received: from amanous by draco with local (Exim 4.50) id 1Fup4M-0000qR-46
	for linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 14:15:54 +0300
Date: Mon, 26 Jun 2006 14:15:53 +0300
To: linux-mtd@lists.infradead.org
Subject: Partition with multiple erasesize blocks
Message-ID: <20060626111553.GA1664@inaccessnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: Angelos Manousarides <amanous@inaccessnetworks.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a PXA-based board with intel P30 flash, top type (4 small sectors at the
end, sized 0x10000, all the other flash large sectors sized 0x40000). I define
from command line the partition sizes, using command line ATAG. The entire
flash has size 0x4000000 (64MB), with two erase regions:

erase region 0: offset=0x0,size=0x40000,blocks=255
erase region 1: offset=0x3fc0000,size=0x10000,blocks=4

If I try this configuration:

3 cmdlinepart partitions found on MTD device mrg110-6
Creating 3 MTD partitions on "mrg110-6":
0x00000000-0x00040000 : "u-boot"
0x00040000-0x00280000 : "kernel"
0x00280000-0x04000000 : "filesystem"

The linux filesystem (last partition) does not behave correctly at the limit,
and I suspect that the problem arises when the last small sectors are used for
the first time. If I do this:

dd if=/dev/zero of=/foobar

The command hangs, and once I saw a driver crash in zlib() calls.

If I try this setup:

Creating 3 MTD partitions on "mrg110-6":
0x00000000-0x00040000 : "u-boot"
0x00040000-0x00280000 : "kernel"
0x00280000-0x03fc0000 : "filesystem"

Thus, using an address space with a single erase size, the above tests
completes successfully. The command finishes with a "out of space" error.

I added some printk()'s in the kernel and saw that in the first case a single
erase size is defined with is not right. This is not a surprise of course (code
from add_mtd_partitions(), drivers/mtd/mtdpart.c):

if (master->numeraseregions>1) {
    /* Deal with variable erase size stuff */
    int i;
    struct mtd_erase_region_info *regions = master->eraseregions;

    /* Find the first erase regions which is part of this partition. */
    for (i=0; i < master->numeraseregions && slave->offset >= regions[i].offset; i++)
        ;

    for (i--; i < master->numeraseregions && slave->offset + slave->mtd.size > regions[i].offset; i++) {
        if (slave->mtd.erasesize < regions[i].erasesize) {
            slave->mtd.erasesize = regions[i].erasesize;
        }
    }
} else {
    /* Single erase size */
    slave->mtd.erasesize = master->erasesize;
}


Shouldn't this code allocate and set the mtd->eraseregions accordingly, with
the proper size and offsets of the new partition?

My kernel is 2.6.13 with some stuff backported from 2.6.16 in order to support
the P30 chip, but I saw that even the latest mtd code has the exact same code
for add_mtd_partitions.

Even worse, for this board I want to support 4 chips in 2 flash banks with
mdtconcat, which means that I need not only the partition code to support
partitions with multiple erase regions, but the concat code to support multiple
erase regions as well. Is there any luck?

--
Angelos Manousaridis
