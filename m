Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTMWc-0006dI-VO
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2010 22:42:16 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/6] mtd: add writebufsize field to mtd_info struct
Date: Thu, 16 Dec 2010 23:42:14 +0100
Message-Id: <1292539339-25111-2-git-send-email-agust@denx.de>
In-Reply-To: <292342500.2538.65.camel@localhost>
References: <292342500.2538.65.camel@localhost>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This field will be used to indicate the write buffer size
of the MTD device. UBI will set it's minimal I/O unit size
(min_io_size) to the indicated write buffer size. By this
change we intend to fix failed recovery of UBIFS partitions
we currently observe on NOR flash when mounting the partition
after unclean unmount.

Currently the min_io_size is set to mtd->writesize (which is 1
byte for NOR flash). But flash programming is often done from
prepared write buffer containing multiple bytes and is performed
in one programming operation which could be interrupted by a power
cut or a system reset causing corrupted (partially written) areas
in a flash sector. Knowing the size of potentially corrupted areas
UBIFS scanning and recovery algorithms are able to perform
successful recovery.

In case of NOR flash minimal I/O size must be equal to the
maximal size of the write buffer used by embedded flash
programming algorithm. In case of NAND flash mtd->writebufsize
should be equivalent to mtd->writesize.

The subsequent patches will add mtd->writebufsize initialization
where needed.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 include/linux/mtd/mtd.h |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index fe8d77e..3c6db0c 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -144,6 +144,19 @@ struct mtd_info {
 	 */
 	uint32_t writesize;
 
+	/*
+	 * Size of the write buffer used by the MTD.
+	 * MTD devices having a write buffer can write multiple writesize
+	 * chunks at a time. E.g. while writing 4 * writesize bytes to a
+	 * device with 2 * writesize bytes buffer the MTD driver can (but
+	 * doesn't have to) do 2 writesize operations, but not 4.
+	 * In case of NAND flash writebufsize should be equivalent to
+	 * writesize. In case of NOR flash writebufsize is the size of the
+	 * write buffer used by the MTD device to program multiple bytes
+	 * at a time (in one programming operation).
+	 */
+	uint32_t writebufsize;
+
 	uint32_t oobsize;   // Amount of OOB data per block (e.g. 16)
 	uint32_t oobavail;  // Available OOB bytes per block
 
-- 
1.7.1
