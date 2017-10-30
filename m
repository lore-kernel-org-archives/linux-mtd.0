Received: from pb-smtp1.pobox.com ([64.147.108.70] helo=sasl.smtp.pobox.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9F7M-0000Mb-Dg
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 18:49:03 +0000
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v3 0/5] unconfuse get_unmapped_area and point/unpoint driver
 methods
Date: Mon, 30 Oct 2017 14:48:28 -0400
Message-Id: <20171030184833.20709-1-nicolas.pitre@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series improves or implements the point and unpoint driver methods
and reimplements mtd_get_unmapped_area() in terms of those. Because
mtd->_point() provides a superset of what mtd->_get_unmapped_area() does
then there is no reason for having both. Or worse: having one but not
the other.

This is motivated by my work on XIP cramfs for both MMU and !MMU systems
where I do need the more complete point functionality. And it just looks
like the right thing to do.

This is also available on top of Linux v4.14-rc3 via git here:

  http://git.linaro.org/people/nicolas.pitre/linux mtd_point


Changes from v2:

- Minor commit log additions to patch 2 and 3.
- Added Boris Brezillon's ACK tags.
- Added Chris Brandt's Tested-by tags.

Changes from v1:

- Fix retlen computation in mtdram.c:ram_point().
- Added Richard Weinberger's REviewd-by tags.


diffstat:

 drivers/mtd/chips/map_ram.c  | 34 ++++++++++++++++++++--------------
 drivers/mtd/chips/map_rom.c  | 34 +++++++++++++++++++++-------------
 drivers/mtd/devices/mtdram.c | 36 ++++++++++++++++++++++--------------
 drivers/mtd/mtdconcat.c      | 27 ---------------------------
 drivers/mtd/mtdcore.c        | 17 ++++++++++++-----
 drivers/mtd/mtdpart.c        | 14 --------------
 include/linux/mtd/mtd.h      |  4 ----
 7 files changed, 75 insertions(+), 91 deletions(-)
