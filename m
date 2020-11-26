Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EDFC63777
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 23:35:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8711F21D1A
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 23:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NMVLfcD2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8711F21D1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vqpRhLCDEd0JGhREk+xwrMxx7Ytvvp4N1+jlE3B7RHs=; b=NMVLfcD22k2Bvi8jxnHaCPCoK
	gMK5GS0pHRUsLrTJcaYyHsRuaL/rdbYeyj7Ap22MaQYyYnSDKhEc3u3v4jmcwQM2DQ9LsQ5MKisQA
	qBsrG8O7D0/hcqSp2u5/khUV34yIErGfRMAn9BZiGo50mTIXegJ3sW/reiw907zI9MAzlxacgQzx/
	olCRiSsdTKds6GGI4SemBcLeRF4eta/2cUKbFnmM5FpEb3TRb9Buk2hsiXW4ZRQFmXM7r5IRuMbTU
	8rmHfZlPtCO9P1vTictTLVSGvwy0+jfN7d9ET+vC0pmD4PtBeh4rQZG9IkTa5tcLRlWypLZrvUbeZ
	U8JxWU3Lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiQmB-0007uA-Ph; Thu, 26 Nov 2020 23:34:11 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiQlq-0007lV-7R
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 23:33:54 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 5647B180C6DDC;
 Fri, 27 Nov 2020 00:33:39 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Be9LC0iaFSmU; Fri, 27 Nov 2020 00:33:38 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OF5vAhagXaIq; Fri, 27 Nov 2020 00:33:38 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miklos@szeredi.hu
Subject: [PATCH 3/7] fuse: Make cuse_parse_one a common helper
Date: Fri, 27 Nov 2020 00:32:56 +0100
Message-Id: <20201126233300.10714-4-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126233300.10714-1-richard@nod.at>
References: <20201126233300.10714-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_183350_591629_FEA58E44 
X-CRM114-Status: GOOD (  23.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This function will be used by MUSE too, let's share it.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/fuse/Kconfig  |  4 +++
 fs/fuse/Makefile |  1 +
 fs/fuse/cuse.c   | 58 +--------------------------------------
 fs/fuse/fuse_i.h |  2 ++
 fs/fuse/helper.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+), 57 deletions(-)
 create mode 100644 fs/fuse/helper.c

diff --git a/fs/fuse/Kconfig b/fs/fuse/Kconfig
index 40ce9a1c12e5..9c8cc1e7b3a5 100644
--- a/fs/fuse/Kconfig
+++ b/fs/fuse/Kconfig
@@ -18,9 +18,13 @@ config FUSE_FS
 	  If you want to develop a userspace FS, or if you want to use
 	  a filesystem based on FUSE, answer Y or M.
 
+config FUSE_HELPER
+	def_bool n
+
 config CUSE
 	tristate "Character device in Userspace support"
 	depends on FUSE_FS
+	select FUSE_HELPER
 	help
 	  This FUSE extension allows character devices to be
 	  implemented in userspace.
diff --git a/fs/fuse/Makefile b/fs/fuse/Makefile
index 8c7021fb2cd4..7a5768cce6be 100644
--- a/fs/fuse/Makefile
+++ b/fs/fuse/Makefile
@@ -9,5 +9,6 @@ obj-$(CONFIG_VIRTIO_FS) += virtiofs.o
 
 fuse-y := dev.o dir.o file.o inode.o control.o xattr.o acl.o readdir.o
 fuse-$(CONFIG_FUSE_DAX) += dax.o
+fuse-$(CONFIG_FUSE_HELPER) += helper.o
 
 virtiofs-y := virtio_fs.o
diff --git a/fs/fuse/cuse.c b/fs/fuse/cuse.c
index 45082269e698..fe8515844064 100644
--- a/fs/fuse/cuse.c
+++ b/fs/fuse/cuse.c
@@ -199,62 +199,6 @@ struct cuse_devinfo {
 	const char		*name;
 };
 
-/**
- * cuse_parse_one - parse one key=value pair
- * @pp: i/o parameter for the current position
- * @end: points to one past the end of the packed string
- * @keyp: out parameter for key
- * @valp: out parameter for value
- *
- * *@pp points to packed strings - "key0=val0\0key1=val1\0" which ends
- * at @end - 1.  This function parses one pair and set *@keyp to the
- * start of the key and *@valp to the start of the value.  Note that
- * the original string is modified such that the key string is
- * terminated with '\0'.  *@pp is updated to point to the next string.
- *
- * RETURNS:
- * 1 on successful parse, 0 on EOF, -errno on failure.
- */
-static int cuse_parse_one(char **pp, char *end, char **keyp, char **valp)
-{
-	char *p = *pp;
-	char *key, *val;
-
-	while (p < end && *p == '\0')
-		p++;
-	if (p == end)
-		return 0;
-
-	if (end[-1] != '\0') {
-		pr_err("info not properly terminated\n");
-		return -EINVAL;
-	}
-
-	key = val = p;
-	p += strlen(p);
-
-	if (valp) {
-		strsep(&val, "=");
-		if (!val)
-			val = key + strlen(key);
-		key = strstrip(key);
-		val = strstrip(val);
-	} else
-		key = strstrip(key);
-
-	if (!strlen(key)) {
-		pr_err("zero length info key specified\n");
-		return -EINVAL;
-	}
-
-	*pp = p;
-	*keyp = key;
-	if (valp)
-		*valp = val;
-
-	return 1;
-}
-
 /**
  * cuse_parse_dev_info - parse device info
  * @p: device info string
@@ -275,7 +219,7 @@ static int cuse_parse_devinfo(char *p, size_t len, struct cuse_devinfo *devinfo)
 	int rc;
 
 	while (true) {
-		rc = cuse_parse_one(&p, end, &key, &val);
+		rc = fuse_kv_parse_one(&p, end, &key, &val);
 		if (rc < 0)
 			return rc;
 		if (!rc)
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index d23954908610..8eba93cd8fb8 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1225,5 +1225,7 @@ void fuse_dax_cancel_work(struct fuse_conn *fc);
 /* file.c */
 struct page **fuse_pages_alloc(unsigned int npages, gfp_t flags,
 			       struct fuse_page_desc **desc);
+/* helper.c */
+int fuse_kv_parse_one(char **pp, char *end, char **keyp, char **valp);
 
 #endif /* _FS_FUSE_I_H */
diff --git a/fs/fuse/helper.c b/fs/fuse/helper.c
new file mode 100644
index 000000000000..0c828daf8e8a
--- /dev/null
+++ b/fs/fuse/helper.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Helper functions used by CUSE and MUSE
+ *
+ * Copyright (C) 2008-2009  SUSE Linux Products GmbH
+ * Copyright (C) 2008-2009  Tejun Heo <tj@kernel.org>
+ *
+ */
+
+#include <linux/string.h>
+#include <linux/module.h>
+
+#include "fuse_i.h"
+
+/**
+ * fuse_kv_parse_one - parse one key=value pair
+ * @pp: i/o parameter for the current position
+ * @end: points to one past the end of the packed string
+ * @keyp: out parameter for key
+ * @valp: out parameter for value
+ *
+ * *@pp points to packed strings - "key0=val0\0key1=val1\0" which ends
+ * at @end - 1.  This function parses one pair and set *@keyp to the
+ * start of the key and *@valp to the start of the value.  Note that
+ * the original string is modified such that the key string is
+ * terminated with '\0'.  *@pp is updated to point to the next string.
+ *
+ * RETURNS:
+ * 1 on successful parse, 0 on EOF, -errno on failure.
+ */
+int fuse_kv_parse_one(char **pp, char *end, char **keyp, char **valp)
+{
+	char *p = *pp;
+	char *key, *val;
+
+	while (p < end && *p == '\0')
+		p++;
+	if (p == end)
+		return 0;
+
+	if (end[-1] != '\0') {
+		pr_err("info not properly terminated\n");
+		return -EINVAL;
+	}
+
+	key = val = p;
+	p += strlen(p);
+
+	if (valp) {
+		strsep(&val, "=");
+		if (!val)
+			val = key + strlen(key);
+		key = strstrip(key);
+		val = strstrip(val);
+	} else
+		key = strstrip(key);
+
+	if (!strlen(key)) {
+		pr_err("zero length info key specified\n");
+		return -EINVAL;
+	}
+
+	*pp = p;
+	*keyp = key;
+	if (valp)
+		*valp = val;
+
+	return 1;
+}
+EXPORT_SYMBOL_GPL(fuse_kv_parse_one);
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
