Received: from mail-gx0-f223.google.com ([209.85.217.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0sUS-00052c-7G
	for linux-mtd@lists.infradead.org; Thu, 22 Oct 2009 07:53:49 +0000
Received: by gxk23 with SMTP id 23so7723345gxk.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Oct 2009 00:53:43 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -v4 2/2] MTD: Add nand_ecc test module
Date: Thu, 22 Oct 2009 16:53:33 +0900
Message-Id: <1256198013-10003-2-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1256198013-10003-1-git-send-email-akinobu.mita@gmail.com>
References: <>
 <1256198013-10003-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	vimal singh <vimal.newwork@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This module tests NAND ECC functions.

The test is simple.

1. Create a 256 or 512 bytes block of data filled with random bytes (data)
2. Duplicate the data block and inject single bit error (error_data)
3. Try to correct error_data
4. Compare data and error_data

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: vimal singh <vimal.newwork@gmail.com>
---
 drivers/mtd/tests/Makefile          |    1 +
 drivers/mtd/tests/mtd_nandecctest.c |   87 +++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/tests/mtd_nandecctest.c

diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
index c1d5013..b44dcab 100644
--- a/drivers/mtd/tests/Makefile
+++ b/drivers/mtd/tests/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_MTD_TESTS) += mtd_speedtest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_stresstest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_subpagetest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_torturetest.o
+obj-$(CONFIG_MTD_TESTS) += mtd_nandecctest.o
diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
new file mode 100644
index 0000000..c1f3105
--- /dev/null
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -0,0 +1,87 @@
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/list.h>
+#include <linux/slab.h>
+#include <linux/random.h>
+#include <linux/string.h>
+#include <linux/bitops.h>
+#include <linux/jiffies.h>
+#include <linux/mtd/nand_ecc.h>
+
+#if defined(CONFIG_MTD_NAND) || defined(CONFIG_MTD_NAND_MODULE)
+
+static void inject_single_bit_error(void *data, size_t size)
+{
+	unsigned long offset = random32() % (size * BITS_PER_BYTE);
+
+	__change_bit(offset, data);
+}
+
+static unsigned char data[512];
+static unsigned char error_data[512];
+
+static int nand_ecc_test(const size_t size)
+{
+	unsigned char code[3];
+	unsigned char error_code[3];
+	char testname[30];
+
+	BUG_ON(sizeof(data) < size);
+
+	sprintf(testname, "nand-ecc-%zu", size);
+
+	get_random_bytes(data, size);
+
+	memcpy(error_data, data, size);
+	inject_single_bit_error(error_data, size);
+
+	__nand_calculate_ecc(data, size, code);
+	__nand_calculate_ecc(error_data, size, error_code);
+	__nand_correct_data(error_data, code, error_code, size);
+
+	if (!memcmp(data, error_data, size)) {
+		printk(KERN_INFO "mtd_nandecctest: ok - %s\n", testname);
+		return 0;
+	}
+
+	printk(KERN_ERR "mtd_nandecctest: not ok - %s\n", testname);
+
+	printk(KERN_DEBUG "hexdump of data:\n");
+	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 16, 4,
+			data, size, false);
+	printk(KERN_DEBUG "hexdump of error data:\n");
+	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 16, 4,
+			error_data, size, false);
+
+	return -1;
+}
+
+#else
+
+static int nand_ecc_test(const size_t size)
+{
+	return 0;
+}
+
+#endif
+
+static int __init ecc_test_init(void)
+{
+	srandom32(jiffies);
+
+	nand_ecc_test(256);
+	nand_ecc_test(512);
+
+	return 0;
+}
+
+static void __exit ecc_test_exit(void)
+{
+}
+
+module_init(ecc_test_init);
+module_exit(ecc_test_exit);
+
+MODULE_DESCRIPTION("NAND ECC function test module");
+MODULE_AUTHOR("Akinobu Mita");
+MODULE_LICENSE("GPL");
-- 
1.5.4.3
