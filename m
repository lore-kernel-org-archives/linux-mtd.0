From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Sat, 13 Nov 2010 15:08:29 +0200
Subject: [PATCH] UBI: improve UBI robustness
Message-ID: <mailman.17.1289654122.1530.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

When reading data from the flash, corrupt the buffer we are about to
read to before reading. The idea is to fix the following possible
situation:

1. The buffer contains data from previous operation, e.g., read from
   another PEB previously. The data looks like expected, e.g., if we
   just do not read anything and return - the caller would not
   notice this. E.g., if we are reading a VID header, the buffer may
   contain a valid VID header from another PEB.
2. The driver is buggy and returns use success or -EBADMSG or
   -EUCLEAN, but it does not actually put any data to the buffer.

This may confuse UBI or upper layers - they may think the buffer
contains valid data while in fact it is just old data. This is
especially possible because UBI (and UBIFS) relies on CRC, and
treats data as correct even in case of ECC errors if the CRC is
correct.

Try to prevent this situation by changing the first byte of the
buffer.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index c2960ac..9ab1a33 100644
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

-- 
Best Regards,
Artem Bityutskiy (?????????? ????????????????)
