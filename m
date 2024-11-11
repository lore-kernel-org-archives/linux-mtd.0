Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD46D12D7E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+ReBg26CxgakjcoOWDaRNltXpendPqd2kxDPbubIak=; b=pFsSOjvMp7zWNO
	LLyIh0aQuQv9Yr2s0MrFUPZoeeqbHAfFGHfEnPSDceuZWSVnFQcauzHt8wC4oX/GWs3/+pjU7WuIV
	jRKgFf/dbzE35Duh8ckjBGV1KXDtUBGOlKngjZqkuzxwWLT8G5YO0kg4RAzX8QdlfSgePUXLv24UQ
	rFRRIvLG2bXRwN+pm1rPux4Fdke1iWZuTg7s6yNTMzsi7Ikoa9n1lhpD94HtnTuaO5NaX8zKHHzPQ
	4jSLv7x3wn5sKYlMEHp4jvqAM0oET0BNIfMMD0abO+FpC7ypppY1fvUs3qzIEYcfbXO0O/R9zHhir
	UNcC5ZtOcv7iisyuj/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOWe-0000000GbAA-3TbL;
	Mon, 11 Nov 2024 07:07:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOV4-0000000GZsb-2I6c
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ASSvAD+oEPDMDh2tgaFcptJqBJmK8ek7UiC4ZbwJiA0=; b=hMayLlhCQHty4Z/j9GccU5qZBb
	ySWfJYk2REMXlCPShIbNn79zdfEpu5jyGUBnTG6Mng9EE8rrE6ic8eqLeR7YfTcSF7QeNNubeSV26
	q4fCwuc435FY8x87TtWeddl8ycCNeoIE2IZu4Qmuqa91a0HYIuFki7SYJSUY2CXTiPxnB2h91ozHG
	qB6k9oav0+yWt6XN7ZU/p6cMLY7IisKW5MS6WUW4kWov77yp6Ltk9fYDs4i97xjR8egXWG5qgP3yL
	aLCxfNJfgumcjnR1GVU5jEg0Epm/xlaMflnji9N9wC8Dg74905FpnypGpcylQNR3lwRDvSdpWUvsF
	lXynooEg==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUf-0000000CmJl-1gjo
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:56 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Xn0r46FsMz1hwTg;
	Mon, 11 Nov 2024 15:03:16 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B20D714011F;
	Mon, 11 Nov 2024 15:05:04 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:04 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 008/102] ubifs-utils: Extract UBI opening/closing/volume_check_empty functions into a new source file
Date: Mon, 11 Nov 2024 15:02:11 +0800
Message-ID: <20241111070346.1314122-9-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070550_859328_D0A772E6 
X-CRM114-Status: GOOD (  24.20  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Move UBI opening/closing/volume_check_empty functions into common/super.c.
These functions will be used in fsck.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am           |   1 +
 ubifs-utils/common/super.c          | 123 ++++++++++++++++++++++++++++++++++++
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 114 ---------------------------------
 3 files changed, 124 insertions(+), 114 deletions(-)
 create mode 100644 ubifs-utils/common/super.c

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 8af65be7..90cc7005 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -15,6 +15,7 @@ common_SOURCES = \
 	ubifs-utils/common/key.h \
 	ubifs-utils/common/lpt.h \
 	ubifs-utils/common/lpt.c \
+	ubifs-utils/common/super.c \
 	ubifs-utils/common/sign.h \
 	include/mtd/ubifs-media.h
 
diff --git a/ubifs-utils/common/super.c b/ubifs-utils/common/super.c
new file mode 100644
index 00000000..eee0197d
--- /dev/null
+++ b/ubifs-utils/common/super.c
@@ -0,0 +1,123 @@
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+
+#include "defs.h"
+
+/**
+ * open_ubi - open the libubi.
+ * @c: the UBIFS file-system description object
+ * @node: name of the UBI volume character device to fetch information about
+ *
+ * This function opens libubi, and initialize device & volume information
+ * according to @node. Returns %0 in case of success and %-1 in case of failure.
+ */
+int open_ubi(struct ubifs_info *c, const char *node)
+{
+	struct stat st;
+
+	if (stat(node, &st) || !S_ISCHR(st.st_mode))
+		return -1;
+
+	c->libubi = libubi_open();
+	if (!c->libubi)
+		return -1;
+	if (ubi_get_vol_info(c->libubi, node, &c->vi))
+		goto out_err;
+	if (ubi_get_dev_info1(c->libubi, c->vi.dev_num, &c->di))
+		goto out_err;
+
+	return 0;
+
+out_err:
+	close_ubi(c);
+	return -1;
+}
+
+void close_ubi(struct ubifs_info *c)
+{
+	if (c->libubi) {
+		libubi_close(c->libubi);
+		c->libubi = NULL;
+	}
+}
+
+/**
+ * open_target - open the output target.
+ * @c: the UBIFS file-system description object
+ *
+ * Open the output target. The target can be an UBI volume
+ * or a file.
+ *
+ * Returns %0 in case of success and %-1 in case of failure.
+ */
+int open_target(struct ubifs_info *c)
+{
+	if (c->libubi) {
+		c->dev_fd = open(c->dev_name, O_RDWR | O_EXCL);
+
+		if (c->dev_fd == -1)
+			return sys_errmsg("cannot open the UBI volume '%s'",
+					   c->dev_name);
+		if (ubi_set_property(c->dev_fd, UBI_VOL_PROP_DIRECT_WRITE, 1)) {
+			close(c->dev_fd);
+			return sys_errmsg("ubi_set_property(set direct_write) failed");
+		}
+	} else {
+		c->dev_fd = open(c->dev_name, O_CREAT | O_RDWR | O_TRUNC,
+			      S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH);
+		if (c->dev_fd == -1)
+			return sys_errmsg("cannot create output file '%s'",
+					   c->dev_name);
+	}
+	return 0;
+}
+
+
+/**
+ * close_target - close the output target.
+ * @c: the UBIFS file-system description object
+ *
+ * Close the output target. If the target was an UBI
+ * volume, also close libubi.
+ *
+ * Returns %0 in case of success and %-1 in case of failure.
+ */
+int close_target(struct ubifs_info *c)
+{
+	if (c->dev_fd >= 0) {
+		if (c->libubi && ubi_set_property(c->dev_fd, UBI_VOL_PROP_DIRECT_WRITE, 0))
+			return sys_errmsg("ubi_set_property(clear direct_write) failed");
+		if (close(c->dev_fd) == -1)
+			return sys_errmsg("cannot close the target '%s'", c->dev_name);
+	}
+	return 0;
+}
+
+/**
+ * check_volume_empty - check if the UBI volume is empty.
+ * @c: the UBIFS file-system description object
+ *
+ * This function checks if the UBI volume is empty by looking if its LEBs are
+ * mapped or not.
+ *
+ * Returns %0 in case of success, %1 is the volume is not empty,
+ * and a negative error code in case of failure.
+ */
+int check_volume_empty(struct ubifs_info *c)
+{
+	int lnum, err;
+
+	for (lnum = 0; lnum < c->vi.rsvd_lebs; lnum++) {
+		err = ubi_is_mapped(c->dev_fd, lnum);
+		if (err < 0)
+			return err;
+		if (err == 1)
+			return 1;
+	}
+	return 0;
+}
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 8bff44b2..2181595e 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -518,44 +518,6 @@ static long long get_bytes(const char *str)
 	return bytes;
 }
 
-void close_ubi(struct ubifs_info *c)
-{
-	if (c->libubi) {
-		libubi_close(c->libubi);
-		c->libubi = NULL;
-	}
-}
-
-/**
- * open_ubi - open the libubi.
- * @c: the UBIFS file-system description object
- * @node: name of the UBI volume character device to fetch information about
- *
- * This function opens libubi, and initialize device & volume information
- * according to @node. Returns %0 in case of success and %-1 in case of failure.
- */
-int open_ubi(struct ubifs_info *c, const char *node)
-{
-	struct stat st;
-
-	if (stat(node, &st) || !S_ISCHR(st.st_mode))
-		return -1;
-
-	c->libubi = libubi_open();
-	if (!c->libubi)
-		return -1;
-	if (ubi_get_vol_info(c->libubi, node, &c->vi))
-		goto out_err;
-	if (ubi_get_dev_info1(c->libubi, c->vi.dev_num, &c->di))
-		goto out_err;
-
-	return 0;
-
-out_err:
-	close_ubi(c);
-	return -1;
-}
-
 static void select_default_compr(void)
 {
 	if (c->encrypted) {
@@ -2821,82 +2783,6 @@ static int write_orphan_area(void)
 }
 
 /**
- * check_volume_empty - check if the UBI volume is empty.
- * @c: the UBIFS file-system description object
- *
- * This function checks if the UBI volume is empty by looking if its LEBs are
- * mapped or not.
- *
- * Returns %0 in case of success, %1 is the volume is not empty,
- * and a negative error code in case of failure.
- */
-int check_volume_empty(struct ubifs_info *c)
-{
-	int lnum, err;
-
-	for (lnum = 0; lnum < c->vi.rsvd_lebs; lnum++) {
-		err = ubi_is_mapped(c->dev_fd, lnum);
-		if (err < 0)
-			return err;
-		if (err == 1)
-			return 1;
-	}
-	return 0;
-}
-
-/**
- * open_target - open the output target.
- * @c: the UBIFS file-system description object
- *
- * Open the output target. The target can be an UBI volume
- * or a file.
- *
- * Returns %0 in case of success and %-1 in case of failure.
- */
-int open_target(struct ubifs_info *c)
-{
-	if (c->libubi) {
-		c->dev_fd = open(c->dev_name, O_RDWR | O_EXCL);
-
-		if (c->dev_fd == -1)
-			return sys_errmsg("cannot open the UBI volume '%s'",
-					   c->dev_name);
-		if (ubi_set_property(c->dev_fd, UBI_VOL_PROP_DIRECT_WRITE, 1)) {
-			close(c->dev_fd);
-			return sys_errmsg("ubi_set_property(set direct_write) failed");
-		}
-	} else {
-		c->dev_fd = open(c->dev_name, O_CREAT | O_RDWR | O_TRUNC,
-			      S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH);
-		if (c->dev_fd == -1)
-			return sys_errmsg("cannot create output file '%s'",
-					   c->dev_name);
-	}
-	return 0;
-}
-
-
-/**
- * close_target - close the output target.
- * @c: the UBIFS file-system description object
- *
- * Close the output target. If the target was an UBI
- * volume, also close libubi.
- *
- * Returns %0 in case of success and %-1 in case of failure.
- */
-int close_target(struct ubifs_info *c)
-{
-	if (c->dev_fd >= 0) {
-		if (c->libubi && ubi_set_property(c->dev_fd, UBI_VOL_PROP_DIRECT_WRITE, 0))
-			return sys_errmsg("ubi_set_property(clear direct_write) failed");
-		if (close(c->dev_fd) == -1)
-			return sys_errmsg("cannot close the target '%s'", c->dev_name);
-	}
-	return 0;
-}
-
-/**
  * init - initialize things.
  */
 static int init(void)
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
