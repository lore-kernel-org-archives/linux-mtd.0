Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TA1jH-0007n4-TM
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2012 16:48:34 +0000
Received: by dajq27 with SMTP id q27so1930937daj.36
 for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2012 09:48:25 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next v4 1/5] mtd: mtd_nandecctest: support injecting bit
 error for ecc code
Date: Sat,  8 Sep 2012 01:48:06 +0900
Message-Id: <1347036490-18258-2-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1347036490-18258-1-git-send-email-akinobu.mita@gmail.com>
References: <1347036490-18258-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently inject_single_bit_error() is used to inject single bit error
into randomly selected bit position of the 256 or 512 bytes data block.

Later change will add tests which inject bit errors into the ecc code.
Unfortunately, inject_single_bit_error() doesn't work for the ecc code
which is not a multiple of sizeof(unsigned long).

Because bit fliping at random position is done by __change_bit().
For example, flipping bit position 0 by __change_bit(0, addr) modifies
3rd byte (32bit) or 7th byte (64bit) on big-endian systems.

Using little-endian version of bitops can fix this issue.  But
little-endian version of __change_bit is not yet available.
So this defines __change_bit_le() locally in a similar fashion to
asm-generic/bitops/le.h and use it.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
* v4
- remove include asm/byteorder.h
- add comment for __change_bit_le()

 drivers/mtd/tests/mtd_nandecctest.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index d3e8873..d90daf8 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -9,11 +9,25 @@
 
 #if defined(CONFIG_MTD_NAND) || defined(CONFIG_MTD_NAND_MODULE)
 
+/*
+ * The reason for this __change_bit_le() instead of __change_bit() is to inject
+ * bit error properly within the region which is not a multiple of
+ * sizeof(unsigned long) on big-endian systems
+ */
+#ifdef __LITTLE_ENDIAN
+#define __change_bit_le(nr, addr) __change_bit(nr, addr)
+#elif defined(__BIG_ENDIAN)
+#define __change_bit_le(nr, addr) \
+		__change_bit((nr) ^ ((BITS_PER_LONG - 1) & ~0x7), addr)
+#else
+#error "Unknown byte order"
+#endif
+
 static void inject_single_bit_error(void *data, size_t size)
 {
-	unsigned long offset = random32() % (size * BITS_PER_BYTE);
+	unsigned int offset = random32() % (size * BITS_PER_BYTE);
 
-	__change_bit(offset, data);
+	__change_bit_le(offset, data);
 }
 
 static void dump_data_ecc(void *error_data, void *error_ecc, void *correct_data,
-- 
1.7.11.4
