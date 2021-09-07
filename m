Return-Path: <SRS0=sITD=N5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CEBC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 21:42:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A84E610C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 21:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A84E610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9pECY1J46uAbzqyxBy3U0+RIV/NpqMHu5vIbCgyM0T4=; b=0oLiS7bl80d1SX
	2JycAEpWOygMlFpH022oic51z6E+CqmeA/oDr3SD0jTirFGDfr0c25aVwiXK8w5nIGLC1pXxpE9k/
	VUAYgObk2DmOaeLUYzjH+SsKNuIEV6fxwAOjc9HiG+GwglWHUDtMIQpnXLZ1fy5v1iC/qMmEDsLNJ
	YysgWWJiG067NQl+gqSAW0DUn4aCk2sis+hI4DDMfhkn7aGx7I32EA6thM2+0UJ1Y0DOXy0rtEU5x
	VOn5R8fQqDmT/shjMdUTQPzt2P5BcWpjJi4uvFzO7b4WSpHEMwef8Ox4n73zPTZ4BIJOG9WYV9hyK
	vQkPlyOqLcdV9nLhclrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNiqX-004oIv-Ml; Tue, 07 Sep 2021 21:41:37 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNiq8-004oC9-Me
 for linux-mtd@lists.infradead.org; Tue, 07 Sep 2021 21:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631050859;
 bh=kWZ78VBSWxFcbUf6kabzO2DbnWdWyGeN3XeY5rhy2vw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=bfEwvLfsw0E+u5F+pORreEB4yQTTBaI95VyqoWd4UN1mImJSzAX+YRxk7bKnOzuGp
 MhXe/JNJnVDGZ/LtPVEWJDiNzEjkrb4Po5xlCz+ob+HauW5fAAHKafDk3qTg2eHYzA
 ETPJIHWcCf6sHEgkyllzptUVq+vdQ2K7F8AMMUYI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from corona.crabdance.com ([173.228.106.131]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mq2nA-1mj3M02WkU-00nBfp; Tue, 07 Sep 2021 23:40:59 +0200
Received: by corona.crabdance.com (Postfix, from userid 1000)
 id 390B1899915; Tue,  7 Sep 2021 14:40:43 -0700 (PDT)
From: Stefan Schaeckeler <schaecsn@gmx.net>
To: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Stefan Schaeckeler <schaecsn@gmx.net>,
 Stefan Schaeckeler <sschaeck@cisco.com>
Subject: [PATCH 1/1] ubifs: ubifs to export filesystem error counters
Date: Tue,  7 Sep 2021 14:40:34 -0700
Message-Id: <20210907214034.11676-2-schaecsn@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907214034.11676-1-schaecsn@gmx.net>
References: <20210907214034.11676-1-schaecsn@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jXi2kbpUZnyp78T+zMG4FCJlGT+JufVc5+/C/spkX8ymuUR7MaM
 cRMYbO57zrn/N4USoJZpw9HdepbyjZ/uggAtWRvqz8r0xmmQr3QikZLJqdhcweKI28FVmoP
 2ZLtYioIyqHdTgzKrJjudTlvRC855FxePfa4pCYKiTYPzM/pdSoTdZX+WqO52V+dpbKJiI+
 67yJ/LaSr5IYeYlyvwSzQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JFne9iDOlvk=:Md07mO/9L1kvUsgRw1sRDE
 7h9EOcwP/wgtcwTMpOA3E7MiYx6eH5eI9yXbGN0jmc7OCol/ehHI0fUrk8YTmRDUFANgrtyci
 I288ojsoLj1TO6OTyle3DD1FYUpf0smiOoCpaUwt1c4o71051xf4B1IxylZ+Vr5skj6uBCQ4f
 bxQ0TFtNSri9eAouitHTxKgC5xU9TYfSt9cIAbfny4rokMh0eLmC0spOsOrbOa/U3mopOxkqh
 Szz9r95CX8lfmF44RoXNJobhLkIRKJlGCynOy5t/xpnZOCo90gE4dFQ3n5ISdWCGfEXa9NlK7
 F92HatmmpU4a+Cio1Wd8eR8tqkk2OndD+l7B1JntHO5IGofbFDMGtKQrVaY6WA4e6h0jOihMS
 SUCqWTtUQrQJivislNSnkmPMLoA8H4dpKmawzVZG8Vz5GmXUb/hRZQUK4c3z/O3Zrdj7eUyF3
 DF8rEsPEutVC0Ez00uMMlv6XWdcpsIYnDl6FJnDRCvCCKDw2LuNAlHs2zxu7s00sVhb3BnrDv
 9TBuzTH9PX6NFuOrJ1DxCl8+iiXPmS2llKsdlWHgDSO78Y8nqhz5H9Y5yVwZ2fUFTLuoHz6TH
 cwgZ06TFf/pY8dNbMNTsl39pwYKYfbYfAKEHPMCwf/ayRORxoj6WfirgWG/XRQ3W2XOaspnfW
 pie4UOyhn32chbbaHMqEIxCd/BHSruQof88EbedOBpYM9FTBVj9iyzs4T6KAv4EZkNutDiW/m
 UNsnj9UWcD6wno8Z7pVNhoSLpbQT40LXl4lkO9bSwi/IlRJpHzxXil1757ttsjlMGIv2LsFxE
 di106v2nCGP+EWyIh1HbNUxk1bVhrnuEK4y0hpdbqvop+c0Ffy3nMSkpt2bC6O1BP5PfOthMi
 RLvnLxRke0Y9/F2Eg2/Sfx31KlxNTL0OF3OiggvhK3OmhfUOvTK56a3v9gdsGS6mYWuu8Eqz/
 DLNkAJN3EyVGHIMGmiGSUNetD9ywA10xOc0IQcRuYX9RIdzQhxlAlNTEUPYgEYFtlU/PICKFX
 9u9JOJzM6Pk79uaUy8OL96/18CE2Lp0zdu4rlkhukL3dZZmUWdBs126QU/52vMqW9yrPEyW2l
 J6pZVUcac2vVSewCZwxSDCxxCO5h5XNO3PEuMc3fuviGnBe4qVtLEVM2w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_144113_106259_C1C1CAE3 
X-CRM114-Status: GOOD (  24.54  )
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

The counters are reset to 0 with a remount. Writing anything into the
counters also clears them.

Signed-off-by: Stefan Schaeckeler <sschaeck@cisco.com>
---
 fs/ubifs/Makefile |   2 +-
 fs/ubifs/io.c     |   6 ++
 fs/ubifs/super.c  |  17 ++++-
 fs/ubifs/sysfs.c  | 187 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/sysfs.h  |  39 ++++++++++
 fs/ubifs/ubifs.h  |  11 +++
 6 files changed, 260 insertions(+), 2 deletions(-)
 create mode 100644 fs/ubifs/sysfs.c
 create mode 100644 fs/ubifs/sysfs.h

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
index 00b61dba62b7..0b158e420cc1 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -238,6 +238,8 @@ int ubifs_check_node(const struct ubifs_info *c, const void *buf, int len,
 		if (!quiet)
 			ubifs_err(c, "bad magic %#08x, expected %#08x",
 				  magic, UBIFS_NODE_MAGIC);
+		if (c->stats)
+			c->stats->magic_errors++;
 		err = -EUCLEAN;
 		goto out;
 	}
@@ -246,6 +248,8 @@ int ubifs_check_node(const struct ubifs_info *c, const void *buf, int len,
 	if (type < 0 || type >= UBIFS_NODE_TYPES_CNT) {
 		if (!quiet)
 			ubifs_err(c, "bad node type %d", type);
+		if (c->stats)
+			c->stats->node_errors++;
 		goto out;
 	}

@@ -270,6 +274,8 @@ int ubifs_check_node(const struct ubifs_info *c, const void *buf, int len,
 		if (!quiet)
 			ubifs_err(c, "bad CRC: calculated %#08x, read %#08x",
 				  crc, node_crc);
+		if (c->stats)
+			c->stats->crc_errors++;
 		err = -EUCLEAN;
 		goto out;
 	}
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index f0fb25727d96..50b934854a84 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -24,6 +24,7 @@
 #include <linux/mount.h>
 #include <linux/math64.h>
 #include <linux/writeback.h>
+#include "sysfs.h"
 #include "ubifs.h"

 static int ubifs_default_version_set(const char *val, const struct kernel_param *kp)
@@ -1264,6 +1265,10 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		return err;

+	err = ubifs_sysfs_register(c);
+	if (err)
+		goto out_debugging;
+
 	err = check_volume_empty(c);
 	if (err)
 		goto out_free;
@@ -1641,6 +1646,8 @@ static int mount_ubifs(struct ubifs_info *c)
 	vfree(c->sbuf);
 	kfree(c->bottom_up_buf);
 	kfree(c->sup_node);
+	ubifs_sysfs_unregister(c);
+out_debugging:
 	ubifs_debugging_exit(c);
 	return err;
 }
@@ -1684,6 +1691,7 @@ static void ubifs_umount(struct ubifs_info *c)
 	kfree(c->bottom_up_buf);
 	kfree(c->sup_node);
 	ubifs_debugging_exit(c);
+	ubifs_sysfs_unregister(c);
 }

 /**
@@ -2436,14 +2444,20 @@ static int __init ubifs_init(void)

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
@@ -2462,6 +2476,7 @@ static void __exit ubifs_exit(void)
 	WARN_ON(atomic_long_read(&ubifs_clean_zn_cnt) != 0);

 	dbg_debugfs_exit();
+	ubifs_sysfs_exit();
 	ubifs_compressors_exit();
 	unregister_shrinker(&ubifs_shrinker_info);

diff --git a/fs/ubifs/sysfs.c b/fs/ubifs/sysfs.c
new file mode 100644
index 000000000000..bac53a0f0451
--- /dev/null
+++ b/fs/ubifs/sysfs.c
@@ -0,0 +1,187 @@
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
+
+#include "sysfs.h"
+#include "ubifs.h"
+
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
+UBIFS_ATTR_FUNC(errors_magic, 0644);
+UBIFS_ATTR_FUNC(errors_crc, 0644);
+UBIFS_ATTR_FUNC(errors_node, 0644);
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
+		return snprintf(buf, PAGE_SIZE, "%u\n",
+				sbi->stats->magic_errors);
+	case attr_errors_node:
+		return snprintf(buf, PAGE_SIZE, "%u\n",
+				sbi->stats->node_errors);
+	case attr_errors_crc:
+		return snprintf(buf, PAGE_SIZE, "%u\n",
+				sbi->stats->crc_errors);
+	}
+	return 0;
+};
+
+
+static ssize_t ubifs_attr_store(struct kobject *kobj,
+			       struct attribute *attr,
+			       const char *buf, size_t len)
+{
+	struct ubifs_info *sbi = container_of(kobj, struct ubifs_info,
+					      kobj);
+
+	struct ubifs_attr *a = container_of(attr, struct ubifs_attr, attr);
+
+	switch (a->attr_id) {
+	case attr_errors_magic:
+		sbi->stats->magic_errors = 0;
+		break;
+	case attr_errors_node:
+		sbi->stats->node_errors = 0;
+		break;
+	case attr_errors_crc:
+		sbi->stats->crc_errors = 0;
+		break;
+	}
+	return len;
+}
+
+
+static void ubifs_sb_release(struct kobject *kobj)
+{
+	struct ubifs_info *c = container_of(kobj, struct ubifs_info, kobj);
+
+	complete(&c->kobj_unregister);
+}
+
+
+static const struct sysfs_ops ubifs_attr_ops = {
+	.show	= ubifs_attr_show,
+	.store	= ubifs_attr_store,
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
+		goto out_last;
+	}
+
+	c->kobj.kset = &ubifs_kset;
+	init_completion(&c->kobj_unregister);
+
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
diff --git a/fs/ubifs/sysfs.h b/fs/ubifs/sysfs.h
new file mode 100644
index 000000000000..a10a82585af8
--- /dev/null
+++ b/fs/ubifs/sysfs.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This file is part of UBIFS.
+ *
+ * Copyright (C) 2021 Cisco Systems
+ *
+ * Author: Stefan Schaeckeler
+ */
+
+#ifndef __UBIFS_SYSFS_H__
+#define __UBIFS_SYSFS_H__
+
+struct ubifs_info;
+
+/*
+ * The UBIFS sysfs directory name pattern and maximum name length (3 for "ubi"
+ * + 1 for "_" and plus 2x2 for 2 UBI numbers and 1 for the trailing zero byte.
+ */
+#define UBIFS_DFS_DIR_NAME "ubi%d_%d"
+#define UBIFS_DFS_DIR_LEN  (3 + 1 + 2*2 + 1)
+
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
+int ubifs_sysfs_init(void);
+void ubifs_sysfs_exit(void);
+int ubifs_sysfs_register(struct ubifs_info *c);
+void ubifs_sysfs_unregister(struct ubifs_info *c);
+
+#endif
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index c38066ce9ab0..bfc0f20b41a1 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -27,12 +27,15 @@
 #include <linux/security.h>
 #include <linux/xattr.h>
 #include <linux/random.h>
+#include <linux/sysfs.h>
+#include <linux/completion.h>
 #include <crypto/hash_info.h>
 #include <crypto/hash.h>
 #include <crypto/algapi.h>

 #include <linux/fscrypt.h>

+#include "sysfs.h"
 #include "ubifs-media.h"

 /* Version of this UBIFS implementation */
@@ -1251,6 +1254,10 @@ struct ubifs_debug_info;
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
@@ -1286,6 +1293,9 @@ struct ubifs_info {
 	spinlock_t cs_lock;
 	wait_queue_head_t cmt_wq;

+	struct kobject kobj;
+	struct completion kobj_unregister;
+
 	unsigned int big_lpt:1;
 	unsigned int space_fixup:1;
 	unsigned int double_hash:1;
@@ -1493,6 +1503,7 @@ struct ubifs_info {
 	struct ubifs_mount_opts mount_opts;

 	struct ubifs_debug_info *dbg;
+	struct ubifs_stats_info *stats;
 };

 extern struct list_head ubifs_infos;
--
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
