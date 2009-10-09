Received: from mail-gx0-f210.google.com ([209.85.217.210])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MwCBg-0003Lm-Kc
	for linux-mtd@lists.infradead.org; Fri, 09 Oct 2009 09:55:08 +0000
Received: by gxk2 with SMTP id 2so1539359gxk.4
	for <linux-mtd@lists.infradead.org>;
	Fri, 09 Oct 2009 02:54:59 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: Add nand_ecc test module
Date: Fri,  9 Oct 2009 18:54:55 +0900
Message-Id: <1255082095-22158-1-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <>
References: <>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Akinobu Mita <akinobu.mita@gmail.com>
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

If the test fails, this creates create these files in debugfs:

/sys/kernel/debug/nand-ecc-test-crashers/

        <testname>
        <testname>-error

<testname> contains data
<testname>-error contains error_data

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/mtd/nand/nand_ecc.c       |   25 ++++-
 drivers/mtd/tests/Makefile        |    1 +
 drivers/mtd/tests/nand_ecc-test.c |  200 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand_ecc.h      |    6 +
 4 files changed, 227 insertions(+), 5 deletions(-)
 create mode 100644 drivers/mtd/tests/nand_ecc-test.c

diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index db7ae9d..809fb53 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -150,20 +150,19 @@ static const char addressbits[256] = {
 };
 
 /**
- * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
+ * __nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
  *			 block
- * @mtd:	MTD block structure
  * @buf:	input buffer with raw data
+ * @eccsize:	data bytes per ecc step (256 or 512)
  * @code:	output buffer with ECC
  */
-int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
+void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize,
 		       unsigned char *code)
 {
 	int i;
 	const uint32_t *bp = (uint32_t *)buf;
 	/* 256 or 512 bytes/ecc  */
-	const uint32_t eccsize_mult =
-			(((struct nand_chip *)mtd->priv)->ecc.size) >> 8;
+	const uint32_t eccsize_mult = eccsize >> 8;
 	uint32_t cur;		/* current value in buffer */
 	/* rp0..rp15..rp17 are the various accumulated parities (per byte) */
 	uint32_t rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7;
@@ -412,6 +411,22 @@ int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 		    (invparity[par & 0x55] << 2) |
 		    (invparity[rp17] << 1) |
 		    (invparity[rp16] << 0);
+}
+EXPORT_SYMBOL(__nand_calculate_ecc);
+
+/**
+ * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
+ *			 block
+ * @mtd:	MTD block structure
+ * @buf:	input buffer with raw data
+ * @code:	output buffer with ECC
+ */
+int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
+		       unsigned char *code)
+{
+	__nand_calculate_ecc(buf,
+			((struct nand_chip *)mtd->priv)->ecc.size, code);
+
 	return 0;
 }
 EXPORT_SYMBOL(nand_calculate_ecc);
diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
index c1d5013..0c23b29 100644
--- a/drivers/mtd/tests/Makefile
+++ b/drivers/mtd/tests/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_MTD_TESTS) += mtd_speedtest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_stresstest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_subpagetest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_torturetest.o
+obj-$(CONFIG_MTD_TESTS) += nand_ecc-test.o
diff --git a/drivers/mtd/tests/nand_ecc-test.c b/drivers/mtd/tests/nand_ecc-test.c
new file mode 100644
index 0000000..143630c
--- /dev/null
+++ b/drivers/mtd/tests/nand_ecc-test.c
@@ -0,0 +1,200 @@
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/debugfs.h>
+#include <linux/list.h>
+#include <linux/slab.h>
+#include <linux/random.h>
+#include <linux/string.h>
+#include <linux/bitops.h>
+#include <linux/jiffies.h>
+
+void inject_single_bit_error(void *data, size_t size)
+{
+	unsigned long offset = random32() % (size * BITS_PER_BYTE);
+
+	__change_bit(offset, data);
+}
+
+static struct dentry *ecc_test_dir;
+
+struct ecc_test_blob {
+	struct dentry *dir;
+	struct debugfs_blob_wrapper blob;
+};
+
+static struct ecc_test_blob *create_ecc_test_blob(const char *name, void *data,
+						size_t size)
+{
+	struct ecc_test_blob *blob;
+
+	blob = kmalloc(sizeof(*blob), GFP_KERNEL);
+	if (!blob)
+		return NULL;
+
+	blob->blob.size = size;
+	blob->blob.data = kmemdup(data, size, GFP_KERNEL);
+	if (!blob->blob.data)
+		goto err1;
+
+	blob->dir = debugfs_create_blob(name, S_IRUSR, ecc_test_dir,
+						&blob->blob);
+	if (!blob->dir)
+		goto err2;
+
+	return blob;
+err2:
+	kfree(blob->blob.data);
+err1:
+	kfree(blob);
+
+	return NULL;
+}
+
+static void remove_ecc_test_blob(struct ecc_test_blob *blob)
+{
+	debugfs_remove(blob->dir);
+	kfree(blob->blob.data);
+	kfree(blob);
+}
+
+static LIST_HEAD(ecc_test_crashers);
+
+struct ecc_test_crasher {
+	struct list_head list;
+
+	struct ecc_test_blob *data;
+	struct ecc_test_blob *error_data;
+};
+
+/*
+ * Create these files in debugfs:
+ *
+ * /sys/kernel/debug/nand-ecc-test-crashers/
+ *	<name>		binary blob specified with data
+ *	<name>-error	binary blob specified with error_data
+ */
+static int register_ecc_test_crasher(const char *name, void *data,
+				void *error_data, size_t size)
+{
+	struct ecc_test_crasher *crasher;
+	char *error_name;
+
+	crasher = kmalloc(sizeof(*crasher), GFP_KERNEL);
+	if (!crasher)
+		return -ENOMEM;
+
+	crasher->data = create_ecc_test_blob(name, data, size);
+	if (!crasher->data)
+		goto err1;
+
+	error_name = kasprintf(GFP_KERNEL, "%s-error", name);
+	if (!error_name)
+		goto err2;
+
+	crasher->error_data = create_ecc_test_blob(error_name, error_data,
+							size);
+	kfree(error_name);
+
+	if (!crasher->error_data)
+		goto err3;
+
+	list_add(&crasher->list, &ecc_test_crashers);
+
+	return 0;
+err3:
+	remove_ecc_test_blob(crasher->error_data);
+err2:
+	remove_ecc_test_blob(crasher->data);
+err1:
+	kfree(crasher);
+
+	return -ENOMEM;
+}
+
+static void unregister_ecc_test_crasher(struct ecc_test_crasher *crasher)
+{
+	list_del(&crasher->list);
+
+	remove_ecc_test_blob(crasher->error_data);
+	remove_ecc_test_blob(crasher->data);
+	kfree(crasher);
+}
+
+#if defined(CONFIG_MTD_NAND) || defined(CONFIG_MTD_NAND_MODULE)
+
+#include <linux/mtd/nand_ecc.h>
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
+	register_ecc_test_crasher(testname, data, error_data, size);
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
+	ecc_test_dir = debugfs_create_dir("nand-ecc-test-crashers", NULL);
+	if (!ecc_test_dir)
+		return -ENOMEM;
+
+	nand_ecc_test(256);
+	nand_ecc_test(512);
+
+	return 0;
+}
+
+static void __exit ecc_test_exit(void)
+{
+	while (!list_empty(&ecc_test_crashers)) {
+		struct ecc_test_crasher *crasher;
+
+		crasher = list_first_entry(&ecc_test_crashers,
+					struct ecc_test_crasher, list);
+		unregister_ecc_test_crasher(crasher);
+	}
+	debugfs_remove_recursive(ecc_test_dir);
+}
+
+module_init(ecc_test_init);
+module_exit(ecc_test_exit);
+
+MODULE_DESCRIPTION("ECC test module");
+MODULE_AUTHOR("Akinobu Mita");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mtd/nand_ecc.h b/include/linux/mtd/nand_ecc.h
index 052ea8c..9cb10ff 100644
--- a/include/linux/mtd/nand_ecc.h
+++ b/include/linux/mtd/nand_ecc.h
@@ -16,6 +16,12 @@
 struct mtd_info;
 
 /*
+ * Calculate 3 byte ECC code for eccsize byte block
+ */
+void __nand_calculate_ecc(const u_char *dat, unsigned int eccsize,
+				u_char *ecc_code);
+
+/*
  * Calculate 3 byte ECC code for 256 byte block
  */
 int nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code);
-- 
1.5.4.3
