Return-Path: <SRS0=3QOd=O6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CB7C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Oct 2021 04:25:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73CB160F58
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Oct 2021 04:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73CB160F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dBo0Qw6T/xjC/gZ1npTNr8GT+VcECrawoVad4jZ1X+s=; b=WzqVWM4PRc8ULA
	dsBa4bun+ilhEzT1CTz0j+hFUgbV6rQ+ksvw0y69tBfvqGy6orISALrE1Ukri9SlSPprJe4R7y3+D
	THx9f09Nk6Dp7maCI83S2qtDhxV29nOCXf4PE8wuk2YFmVXuY2Dw93mhwXseTkq2nokslBNCfTC/7
	rcAi8NYi+HV+2bAXLIcCZDWMoICIwm6T6iIfIRuPbSmwcEqPSsIs6zbVwffdHUh4f8OJUHJPCalBt
	hMvTOuuJPl7S/OCm79sNqEJdofIPrN+D5ktKH8+YC7swCOG0/j1tK1CBAdNMMox4rxmSWaIn0vorn
	uhT8AskYDp9UvunhWN4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZQNo-006LdJ-K1; Sun, 10 Oct 2021 04:24:20 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZQNk-006LcW-KS
 for linux-mtd@lists.infradead.org; Sun, 10 Oct 2021 04:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633839839;
 bh=zoB3awKwl7yGR9qqPV4bKFJwWlxjjGQsecyl+hMO49U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=FeR8u6PfOWeQwy12CO6GzIy3XogSRXhldScub+Ibwf2Z0aJhQorn5ndR2M7xmBcwC
 jBmpiMHcV6KHMqUkjZGo39qG/e7qm7zu+jZ/iEaBTiKhBRh5H2bSnyi6YfWWjGjl4b
 K6jz8C2OCRc4txwsI/k44+FRYMsrh/5VwkIMe5RI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from corona.crabdance.com ([173.228.106.131]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N4Qwg-1mioGG2Tpe-011OcA; Sun, 10 Oct 2021 06:23:59 +0200
Received: by corona.crabdance.com (Postfix, from userid 1000)
 id AEA34899826; Sat,  9 Oct 2021 21:23:50 -0700 (PDT)
From: Stefan Schaeckeler <schaecsn@gmx.net>
To: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Stefan Schaeckeler <schaecsn@gmx.net>,
 Stefan Schaeckeler <sschaeck@cisco.com>
Subject: [PATCH v2] ubifs: ubifs to export filesystem error counters
Date: Sat,  9 Oct 2021 21:22:39 -0700
Message-Id: <20211010042239.2888-1-schaecsn@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:aY+ojOOe6oAhMJp3Srkg9n8xDOygYx4ucWhHYDfUft3VFckXhs6
 o1sN3GxUIkObJ7EbhiMV9z9bO/cr66rpggCjkfw9bf6DRDvdnLAG8SbXzzkTvuka6/IwMxj
 oy0al/OpySEDlJBjovmgP74n4Q3TnBiQlSJuioFa25uqsrsrfC/nznFEFDpdkhl3xgFHvhs
 sL8xDNNX7pD/UAo6V0kkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:z76qK7X0m6I=:VfmalSbRd59EpgASNDjG2B
 JktUgZjx/NcWIO6ywqCd74/HQGkok9u2AVduaAqvIKR9cxJXt70KQbZCj6l4lujxAEi1aF3W4
 +ckRAIvuC3gl9N+o2qqh2N+byCHE+zb5SJLxM2r8VAroI3F97e4Ox9cyfW2e7PdNN9ej3QqEJ
 KicK2KS4eE31TIGNqHoeQAZCpLdeXfyKHxYB/XfYk9mavRqpvdD6oO7LWYFmGqyXwyd+2B7Bb
 98+vhqpL9SXgwEjHsHfUaA5HOrdCIbAsqiolx3KEqsMiUX/A6WcQCRL6qSRirel018pIQqbDf
 C/6GGkjQsHk1ZJDoduWLk66GjU4+G9+FbxTuSljHA1ZxZ55sfgszkPJXeLbJn7M05dnWOEyUt
 olRQe0bCy6CEX2mke2vJh59exLdtjhS/JZHYGawo4MiAigHAyF3Cfgv3RIcQQTSV/jXVkPnC2
 Bd0OtQQzaeYGabCr3zaBSvPRqMIwSCEH8yjCFwDQVcv2mk1HeroEC4Q2fLYn2CO0GvVNwNtPf
 aZQSfZ2YzwihzIUwk9e/TSQSZF9F7+Tfn+ZIaMS4G663qGALF1pmMxdH0TKE8/7/UJnso6AQx
 Yh6vZL3+6sC56y7IZktrlEamRXbwlW1tV0a6ML6V7NAddusreGkPabj8Ua1yyVMs6yWGwcdnt
 paV4G+MtDHfLWgGCgwSnX1fMnYaiP2Dm8x2ZLnGzUDx7TH2Z+KK0GNZMpzuXeMNNUDzVJjXEx
 +caeAQhpRzv8cCrQ8VHgbE6ehAXpKkYUuNo4wr9kvQzkI/Ly1dxuHLwVYiG/vMY/nVzHIfmWI
 5pf76gRgIC4Ibsvf8X91ue5z/I1OAZNajRd9PtwCSb5++rikDCxt/zuGmxghkUYW6ahJr7Fh0
 wXCQ1rWRvcj47b/3bATd7C7yrvS+PMVgt+DvGSDkpwGcD06jX0BoymuhLhHm5X+UI6dpttMZa
 PyYkP5eccST0Z+TorlouytOkBa7zXvSwH1g0QyPC6hHGs5DxPtPIs9aJ8Cn86HhZyADf4UbU5
 0X9gUJV2MFSHjPUOGkIx4uNwOJYT0DMqxcLDgMuCLGLn5MtT4KXD1cHOBSmunEurpluF17Vau
 TauKwI2XW92Zs8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_212417_069954_ED8B2256 
X-CRM114-Status: GOOD (  25.05  )
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

Not all ubifs filesystem errors are propagated to userspace.

Export bad magic, bad node and crc errors via sysfs. This allows userspace
to notice filesystem errors:

 /sys/fs/ubifs/ubiX_Y/errors_magic
 /sys/fs/ubifs/ubiX_Y/errors_node
 /sys/fs/ubifs/ubiX_Y/errors_crc

The counters are reset to 0 with a remount.

Signed-off-by: Stefan Schaeckeler <sschaeck@cisco.com>
---
Changes in v2:
  - merged sysfs.h header into ubifs.h.
  - io.c: wrapped incrementing error counters into new functions
    record_*_error().
  - sysfs.c: removed sysfs write callback for clearing stats.
  - sysfs.c: ubifs_sysfs_register(): free c->stats on error.
  - sysfs.c: ubifs_attr_show(): use sysfs_emit().

 fs/ubifs/Makefile |   2 +-
 fs/ubifs/io.c     |  21 +++++++
 fs/ubifs/super.c  |  16 ++++-
 fs/ubifs/sysfs.c  | 153 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/ubifs.h  |  35 +++++++++++
 5 files changed, 225 insertions(+), 2 deletions(-)
 create mode 100644 fs/ubifs/sysfs.c

diff --git a/fs/ubifs/Makefile b/fs/ubifs/Makefile
index 5c4b845754a7..314c80b24a76 100644
--- a/fs/ubifs/Makefile
+++ b/fs/ubifs/Makefile
@@ -5,7 +5,7 @@ ubifs-y += shrinker.o journal.o file.o dir.o super.o sb.o io.o
 ubifs-y += tnc.o master.o scan.o replay.o log.o commit.o gc.o orphan.o
 ubifs-y += budget.o find.o tnc_commit.o compress.o lpt.o lprops.o
 ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o debug.o
-ubifs-y += misc.o
+ubifs-y += misc.o sysfs.o
 ubifs-$(CONFIG_FS_ENCRYPTION) += crypto.o
 ubifs-$(CONFIG_UBIFS_FS_XATTR) += xattr.o
 ubifs-$(CONFIG_UBIFS_FS_AUTHENTICATION) += auth.o
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 00b61dba62b7..789a7813f3fa 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -194,6 +194,24 @@ int ubifs_is_mapped(const struct ubifs_info *c, int lnum)
 	return err;
 }

+static void record_magic_error(struct ubifs_stats_info *stats)
+{
+	if (stats)
+		stats->magic_errors++;
+}
+
+static void record_node_error(struct ubifs_stats_info *stats)
+{
+	if (stats)
+		stats->node_errors++;
+}
+
+static void record_crc_error(struct ubifs_stats_info *stats)
+{
+	if (stats)
+		stats->crc_errors++;
+}
+
 /**
  * ubifs_check_node - check node.
  * @c: UBIFS file-system description object
@@ -238,6 +256,7 @@ int ubifs_check_node(const struct ubifs_info *c, const void *buf, int len,
 		if (!quiet)
 			ubifs_err(c, "bad magic %#08x, expected %#08x",
 				  magic, UBIFS_NODE_MAGIC);
+		record_magic_error(c->stats);
 		err = -EUCLEAN;
 		goto out;
 	}
@@ -246,6 +265,7 @@ int ubifs_check_node(const struct ubifs_info *c, const void *buf, int len,
 	if (type < 0 || type >= UBIFS_NODE_TYPES_CNT) {
 		if (!quiet)
 			ubifs_err(c, "bad node type %d", type);
+		record_node_error(c->stats);
 		goto out;
 	}

@@ -270,6 +290,7 @@ int ubifs_check_node(const struct ubifs_info *c, const void *buf, int len,
 		if (!quiet)
 			ubifs_err(c, "bad CRC: calculated %#08x, read %#08x",
 				  crc, node_crc);
+		record_crc_error(c->stats);
 		err = -EUCLEAN;
 		goto out;
 	}
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index f0fb25727d96..a4e3a143fb1b 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1264,6 +1264,10 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		return err;

+	err = ubifs_sysfs_register(c);
+	if (err)
+		goto out_debugging;
+
 	err = check_volume_empty(c);
 	if (err)
 		goto out_free;
@@ -1641,6 +1645,8 @@ static int mount_ubifs(struct ubifs_info *c)
 	vfree(c->sbuf);
 	kfree(c->bottom_up_buf);
 	kfree(c->sup_node);
+	ubifs_sysfs_unregister(c);
+out_debugging:
 	ubifs_debugging_exit(c);
 	return err;
 }
@@ -1684,6 +1690,7 @@ static void ubifs_umount(struct ubifs_info *c)
 	kfree(c->bottom_up_buf);
 	kfree(c->sup_node);
 	ubifs_debugging_exit(c);
+	ubifs_sysfs_unregister(c);
 }

 /**
@@ -2436,14 +2443,20 @@ static int __init ubifs_init(void)

 	dbg_debugfs_init();

+	err = ubifs_sysfs_init();
+	if (err)
+		goto out_dbg;
+
 	err = register_filesystem(&ubifs_fs_type);
 	if (err) {
 		pr_err("UBIFS error (pid %d): cannot register file system, error %d",
 		       current->pid, err);
-		goto out_dbg;
+		goto out_sysfs;
 	}
 	return 0;

+out_sysfs:
+	ubifs_sysfs_exit();
 out_dbg:
 	dbg_debugfs_exit();
 	ubifs_compressors_exit();
@@ -2462,6 +2475,7 @@ static void __exit ubifs_exit(void)
 	WARN_ON(atomic_long_read(&ubifs_clean_zn_cnt) != 0);

 	dbg_debugfs_exit();
+	ubifs_sysfs_exit();
 	ubifs_compressors_exit();
 	unregister_shrinker(&ubifs_shrinker_info);

diff --git a/fs/ubifs/sysfs.c b/fs/ubifs/sysfs.c
new file mode 100644
index 000000000000..0b6f79b6e2e8
--- /dev/null
+++ b/fs/ubifs/sysfs.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * This file is part of UBIFS.
+ *
+ * Copyright (C) 2021 Cisco Systems
+ *
+ * Author: Stefan Schaeckeler
+ */
+
+
+#include <linux/fs.h>
+#include "ubifs.h"
+
+enum attr_id_t {
+	attr_errors_magic,
+	attr_errors_node,
+	attr_errors_crc,
+};
+
+struct ubifs_attr {
+	struct attribute attr;
+	enum attr_id_t attr_id;
+};
+
+#define UBIFS_ATTR(_name, _mode, _id)					\
+static struct ubifs_attr ubifs_attr_##_name = {				\
+	.attr = {.name = __stringify(_name), .mode = _mode },		\
+	.attr_id = attr_##_id,						\
+}
+
+#define UBIFS_ATTR_FUNC(_name, _mode) UBIFS_ATTR(_name, _mode, _name)
+
+UBIFS_ATTR_FUNC(errors_magic, 0444);
+UBIFS_ATTR_FUNC(errors_crc, 0444);
+UBIFS_ATTR_FUNC(errors_node, 0444);
+
+#define ATTR_LIST(name) (&ubifs_attr_##name.attr)
+
+static struct attribute *ubifs_attrs[] = {
+	ATTR_LIST(errors_magic),
+	ATTR_LIST(errors_node),
+	ATTR_LIST(errors_crc),
+	NULL,
+};
+
+static ssize_t ubifs_attr_show(struct kobject *kobj,
+			       struct attribute *attr, char *buf)
+{
+	struct ubifs_info *sbi = container_of(kobj, struct ubifs_info,
+					      kobj);
+
+	struct ubifs_attr *a = container_of(attr, struct ubifs_attr, attr);
+
+	switch (a->attr_id) {
+	case attr_errors_magic:
+		return sysfs_emit(buf, "%u\n", sbi->stats->magic_errors);
+	case attr_errors_node:
+		return sysfs_emit(buf, "%u\n", sbi->stats->node_errors);
+	case attr_errors_crc:
+		return sysfs_emit(buf, "%u\n", sbi->stats->crc_errors);
+	}
+	return 0;
+};
+
+static void ubifs_sb_release(struct kobject *kobj)
+{
+	struct ubifs_info *c = container_of(kobj, struct ubifs_info, kobj);
+
+	complete(&c->kobj_unregister);
+}
+
+static const struct sysfs_ops ubifs_attr_ops = {
+	.show	= ubifs_attr_show,
+};
+
+static struct kobj_type ubifs_sb_ktype = {
+	.default_attrs	= ubifs_attrs,
+	.sysfs_ops	= &ubifs_attr_ops,
+	.release	= ubifs_sb_release,
+};
+
+static struct kobj_type ubifs_ktype = {
+	.sysfs_ops	= &ubifs_attr_ops,
+};
+
+static struct kset ubifs_kset = {
+	.kobj	= {.ktype = &ubifs_ktype},
+};
+
+int ubifs_sysfs_register(struct ubifs_info *c)
+{
+	int ret, n;
+	char dfs_dir_name[UBIFS_DFS_DIR_LEN+1];
+
+	c->stats = kzalloc(sizeof(struct ubifs_stats_info), GFP_KERNEL);
+	if (!c->stats) {
+		ret = -ENOMEM;
+		goto out_last;
+	}
+	n = snprintf(dfs_dir_name, UBIFS_DFS_DIR_LEN + 1, UBIFS_DFS_DIR_NAME,
+		     c->vi.ubi_num, c->vi.vol_id);
+
+	if (n == UBIFS_DFS_DIR_LEN) {
+		/* The array size is too small */
+		ret = -EINVAL;
+		goto out_free;
+	}
+
+	c->kobj.kset = &ubifs_kset;
+	init_completion(&c->kobj_unregister);
+
+	ret = kobject_init_and_add(&c->kobj, &ubifs_sb_ktype, NULL,
+				   "%s", dfs_dir_name);
+	if (ret)
+		goto out_put;
+
+	return 0;
+
+out_put:
+	kobject_put(&c->kobj);
+	wait_for_completion(&c->kobj_unregister);
+out_free:
+	kfree(c->stats);
+out_last:
+	ubifs_err(c, "cannot create sysfs entry for ubifs%d_%d, error %d\n",
+		  c->vi.ubi_num, c->vi.vol_id, ret);
+	return ret;
+}
+
+void ubifs_sysfs_unregister(struct ubifs_info *c)
+{
+	kobject_del(&c->kobj);
+	kobject_put(&c->kobj);
+	wait_for_completion(&c->kobj_unregister);
+
+	kfree(c->stats);
+}
+
+int __init ubifs_sysfs_init(void)
+{
+	int ret;
+
+	kobject_set_name(&ubifs_kset.kobj, "ubifs");
+	ubifs_kset.kobj.parent = fs_kobj;
+	ret = kset_register(&ubifs_kset);
+
+	return ret;
+}
+
+void ubifs_sysfs_exit(void)
+{
+	kset_unregister(&ubifs_kset);
+}
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index c38066ce9ab0..f55828c0a300 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -27,6 +27,8 @@
 #include <linux/security.h>
 #include <linux/xattr.h>
 #include <linux/random.h>
+#include <linux/sysfs.h>
+#include <linux/completion.h>
 #include <crypto/hash_info.h>
 #include <crypto/hash.h>
 #include <crypto/algapi.h>
@@ -155,6 +157,13 @@
 #define UBIFS_HMAC_ARR_SZ 0
 #endif

+/*
+ * The UBIFS sysfs directory name pattern and maximum name length (3 for "ubi"
+ * + 1 for "_" and plus 2x2 for 2 UBI numbers and 1 for the trailing zero byte.
+ */
+#define UBIFS_DFS_DIR_NAME "ubi%d_%d"
+#define UBIFS_DFS_DIR_LEN  (3 + 1 + 2*2 + 1)
+
 /*
  * Lockdep classes for UBIFS inode @ui_mutex.
  */
@@ -990,6 +999,18 @@ struct ubifs_budg_info {
 	int dent_budget;
 };

+/**
+ * ubifs_stats_info - per-FS statistics information.
+ * @magic_errors: number of bad magic numbers (will be reset with a new mount).
+ * @node_errors: number of bad nodes (will be reset with a new mount).
+ * @crc_errors: number of bad crcs (will be reset with a new mount).
+ */
+struct ubifs_stats_info {
+	unsigned int magic_errors;
+	unsigned int node_errors;
+	unsigned int crc_errors;
+};
+
 struct ubifs_debug_info;

 /**
@@ -1251,6 +1272,10 @@ struct ubifs_debug_info;
  * @mount_opts: UBIFS-specific mount options
  *
  * @dbg: debugging-related information
+ * @stats: statistics exported over sysfs
+ *
+ * @kobj: kobject for /sys/fs/ubifs/
+ * @kobj_unregister: completion to unregister sysfs kobject
  */
 struct ubifs_info {
 	struct super_block *vfs_sb;
@@ -1286,6 +1311,9 @@ struct ubifs_info {
 	spinlock_t cs_lock;
 	wait_queue_head_t cmt_wq;

+	struct kobject kobj;
+	struct completion kobj_unregister;
+
 	unsigned int big_lpt:1;
 	unsigned int space_fixup:1;
 	unsigned int double_hash:1;
@@ -1493,6 +1521,7 @@ struct ubifs_info {
 	struct ubifs_mount_opts mount_opts;

 	struct ubifs_debug_info *dbg;
+	struct ubifs_stats_info *stats;
 };

 extern struct list_head ubifs_infos;
@@ -2072,6 +2101,12 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf, int in_len,
 int ubifs_decompress(const struct ubifs_info *c, const void *buf, int len,
 		     void *out, int *out_len, int compr_type);

+/* sysfs.c */
+int ubifs_sysfs_init(void);
+void ubifs_sysfs_exit(void);
+int ubifs_sysfs_register(struct ubifs_info *c);
+void ubifs_sysfs_unregister(struct ubifs_info *c);
+
 #include "debug.h"
 #include "misc.h"
 #include "key.h"
--
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
