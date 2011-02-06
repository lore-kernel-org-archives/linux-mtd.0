Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm8Xb-0001xN-OZ
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 17:36:54 +0000
Received: from eru.research.nokia.com (esdhcp034110.research.nokia.com
	[172.21.34.110])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p16Han89014624
	for <linux-mtd@lists.infradead.org>; Sun, 6 Feb 2011 19:36:49 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/5] UBI: try to reveal buggy MTD drivers
Date: Sun,  6 Feb 2011 19:39:09 +0200
Message-Id: <1297013953-28886-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1297013953-28886-1-git-send-email-dedekind1@gmail.com>
References: <1297013953-28886-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When reading data from the flash, corrupt the buffer we are about to
read to. The idea is to fix the following possible situation:

1. The buffer contains data from previous operation, e.g., read from
   another PEB previously. The data looks like expected, e.g., if we
   just do not read anything and return - the caller would not
   notice this. E.g., if we are reading a VID header, the buffer may
   contain a valid VID header from another PEB.
2. The driver is buggy and returns use success or -EBADMSG or
   -EUCLEAN, but it does not actually put any data to the buffer.

This may confuse UBI or upper layers - they may think the buffer
contains valid data while in fact it is just old data.

Thus, try to reveal such buggy MTD drivers with simple debugging
code which fills the read buffer with 0x12 constant.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 65915a6..339a74f 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -146,6 +146,28 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 	if (err)
 		return err;
 
+	/*
+	 * Deliberately corrupt the buffer to improve robustness. Indeed, if we
+	 * do not do this, the following may happen:
+	 * 1. The buffer contains data from previous operation, e.g., read from
+	 *    another PEB previously. The data looks like expected, e.g., if we
+	 *    just do not read anything and return - the caller would not
+	 *    notice this. E.g., if we are reading a VID header, the buffer may
+	 *    contain a valid VID header from another PEB.
+	 * 2. The driver is buggy and returns us success or -EBADMSG or
+	 *    -EUCLEAN, but it does not actually put any data to the buffer.
+	 *
+	 * This may confuse UBI or upper layers - they may think the buffer
+	 * contains valid data while in fact it is just old data. This is
+	 * especially possible because UBI (and UBIFS) relies on CRC, and
+	 * treats data as correct even in case of ECC errors if the CRC is
+	 * correct.
+	 *
+	 * Try to prevent this situation by changing the first byte of the
+	 * buffer.
+	 */
+	*((uint8_t *)buf) ^= 0xFF;
+
 	addr = (loff_t)pnum * ubi->peb_size + offset;
 retry:
 	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf);
-- 
1.7.2.3
