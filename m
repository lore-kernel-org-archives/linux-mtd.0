Received: from mail-ew0-f228.google.com ([209.85.219.228])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mzlrb-0006VB-Hw
	for linux-mtd@lists.infradead.org; Mon, 19 Oct 2009 06:37:08 +0000
Received: by ewy28 with SMTP id 28so3977662ewy.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Oct 2009 23:37:02 -0700 (PDT)
Date: Mon, 19 Oct 2009 15:36:53 +0900
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2 -v2] MTD: Add nand_ecc test module
Message-ID: <20091019063653.GA4486@localhost.localdomain>
References: <1255932706-23824-1-git-send-email-akinobu.mita@gmail.com>
	<1255932706-23824-2-git-send-email-akinobu.mita@gmail.com>
	<20091019061550.GA23854@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091019061550.GA23854@localhost.localdomain>
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

* v2 changes
- remove ifdef
- make inject_single_bit_error static

This module tests NAND ECC functions.

The test is simple.

1. Create a 256 or 512 bytes block of data filled with random bytes (data)
2. Duplicate the data block and inject single bit error (error_data)
3. Try to correct error_data
4. Compare data and error_data

This test is added into new MTD test group called MTD NAND test
which requires MTD NAND device support.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/Kconfig               |    6 +++
 drivers/mtd/tests/Makefile        |    1 +
 drivers/mtd/tests/nand_ecc-test.c |   76 +++++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/tests/nand_ecc-test.c

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index ecf90f5..abe5c7f 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -33,6 +33,12 @@ config MTD_TESTS
 	  should normally be compiled as kernel modules. The modules perform
 	  various checks and verifications when loaded.
 
+config MTD_NAND_TESTS
+	tristate "MTD NAND tests support"
+	depends on MTD_TESTS && MTD_NAND
+	help
+	  This option enables MTD tests which require NAND Device support.
+
 config MTD_CONCAT
 	tristate "MTD concatenating support"
 	help
diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
index c1d5013..3994d5a 100644
--- a/drivers/mtd/tests/Makefile
+++ b/drivers/mtd/tests/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_MTD_TESTS) += mtd_speedtest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_stresstest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_subpagetest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_torturetest.o
+obj-$(CONFIG_MTD_NAND_TESTS) += nand_ecc-test.o
diff --git a/drivers/mtd/tests/nand_ecc-test.c b/drivers/mtd/tests/nand_ecc-test.c
new file mode 100644
index 0000000..6244f80
--- /dev/null
+++ b/drivers/mtd/tests/nand_ecc-test.c
@@ -0,0 +1,76 @@
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
+		printk(KERN_INFO "nand_ecc-test: ok - %s\n", testname);
+		return 0;
+	}
+
+	printk(KERN_ERR "nand_ecc-test: not ok - %s\n", testname);
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
+MODULE_DESCRIPTION("ECC test module");
+MODULE_AUTHOR("Akinobu Mita");
+MODULE_LICENSE("GPL");
-- 
1.5.4.3
