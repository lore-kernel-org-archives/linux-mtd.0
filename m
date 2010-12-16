Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTMWh-0006eH-Db
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2010 22:42:22 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 6/6] UBI: use mtd->writebufsize to set minimal I/O unit size
Date: Thu, 16 Dec 2010 23:42:19 +0100
Message-Id: <1292539339-25111-7-git-send-email-agust@denx.de>
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

Previously we used mtd->writesize field to set UBI's minimal
I/O unit size. This sometimes caused UBIFS recovery issues
when mounting an uncleanly unmounted UBIFS partition on NOR
flash since mtd->writesize is 1 byte for NOR flash. The
MTD CFI driver however often performs writing multiple
bytes in one programming operation using the chip's write
buffer. We have to use the size of this write buffer as
a minimal I/O unit size for UBI on NOR flash to fix the
observed UBIFS recovery issues.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/mtd/ubi/build.c |   19 ++++++++++++++++++-
 1 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 5ebe280..c2d5310 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -672,7 +672,24 @@ static int io_init(struct ubi_device *ubi)
 		ubi->nor_flash = 1;
 	}
 
-	ubi->min_io_size = ubi->mtd->writesize;
+	/*
+	 * Sets minimal I/O unit size (min_io_size) for UBI. On NAND flash
+	 * min_io_size should be equivalent to ubi->mtd->writesize.
+	 * In case of NOR flash minimal I/O size must be equal to the size
+	 * of the write buffer used by internal flash programming algorithm.
+	 * This requirement results from the fact that the flash programming
+	 * operation could be interrupted by a power cut or a system reset
+	 * causing corrupted (partially written) areas in a NOR flash sector.
+	 * Knowing the size of potentially corrupted areas UBIFS scanning
+	 * and recovery algorithms are able to perform successful recovery.
+	 */
+	if (ubi->mtd->type == MTD_NANDFLASH)
+		ubi_assert(ubi->mtd->writebufsize == ubi->mtd->writesize);
+	else if (ubi->mtd->type == MTD_NORFLASH)
+		ubi_assert(ubi->mtd->writebufsize > 0);
+
+	ubi->min_io_size = ubi->mtd->writebufsize;
+
 	ubi->hdrs_min_io_size = ubi->mtd->writesize >> ubi->mtd->subpage_sft;
 
 	/*
-- 
1.7.1
