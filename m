Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8WGW-0007DY-Ss
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 13:00:34 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq8so8483394pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 06:00:32 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 07/11] mtd: mtd_nandecctest: generalize injecting bit
 errors function for ecc code
Date: Mon,  3 Sep 2012 22:00:02 +0900
Message-Id: <1346677206-13621-8-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1346677206-13621-1-git-send-email-akinobu.mita@gmail.com>
References: <1346677206-13621-1-git-send-email-akinobu.mita@gmail.com>
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

In order to inject deliberate bit errors into the ecc code which only
has 3 bytes, this adjusts the bitops usage in inject_single_bit_error()
which is currently only used for injecting into the 256 or 512 bytes
data block.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/tests/mtd_nandecctest.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index d3e8873..0274f73 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -7,13 +7,22 @@
 #include <linux/slab.h>
 #include <linux/mtd/nand_ecc.h>
 
+#include <asm/byteorder.h>
+
 #if defined(CONFIG_MTD_NAND) || defined(CONFIG_MTD_NAND_MODULE)
 
+#ifdef __LITTLE_ENDIAN
+#define __change_bit_le(nr, addr) __change_bit(nr, addr)
+#else
+#define __change_bit_le(nr, addr) \
+		__change_bit((nr) ^ ((BITS_PER_LONG - 1) & ~0x7), addr)
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
