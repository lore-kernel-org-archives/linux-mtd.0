Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1DDC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:39:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CB0B651DE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CB0B651DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xUBs6VaJRE0b5gyoOIqAVdTioWwMSaU3snLVLwboeTQ=; b=PcZLCUVFHHcoG/d7SvFkuTmBo
	CBRORVu00V8AQyQmIhJVynkwomF6MrXSJmIxWhXjHf0QNcE5fASL8r0S1tZonmw/n/bjdfpEPZ4VQ
	Y6v9YPBJbmla+GkpZIHSLAL4J2HJXzY00jhkOxa4dvw5BvHW01Fp5mRCUjJAVMp69ZcV2LzVY+peL
	NUkAqyTCDSA9EM3b4jqJJs1dd4qjsMZ2G1PuQfvtcscJlRBT1pAr6bc8bY3C5wvd+c3JSQG6hs2qe
	3Gu/nSxVQaQvMDEDn4NtxchwbFgkGPpIV2xPF2KFgNTJfsE8nIPk+EXwiZeLCRqi8lo/m0jG1WstP
	IqfQZ9e5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9Wk-00FW64-Dw; Mon, 08 Mar 2021 06:38:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9Q6-00FUyq-DL
 for linux-mtd@desiato.infradead.org; Mon, 08 Mar 2021 06:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=aiU3diHEDJO/QuJ8l/UZniaR2AVUiogB9KiYU6tnGi4=; b=thamKw1nRsmywrk4ImqyTNHydJ
 lfGKgvHQLRJ1iTrwd1FNzkrrJIjph8zFDMfmzsJMqrdUk1SFLdsw6McLeWvTQv/p44J7B2ub9OSb7
 ZmpSW18HKhnK+qXS3F0OEtunZkomPmZ+kYzf/mXlMMGndNBllwjMo/FGjAGNNL7K/XIH+jy9zLzW8
 0rCVPry2OFYmFG5Mtia5NpREeJa5A4wtEfbbD50/vbx2LctsPAJf0klawKaARgBE2xqW/geLSCNh3
 xwB9ndN6+1XPzUZEPnh5qyWPfBoTdRpbGvK9MqXcQeeEZWkVxegWK6sHAP2l0Zlm/KGfhoDPtTMcw
 rKL5/bSA==;
Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9Pf-00F81V-Ns
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:31:00 +0000
IronPort-SDR: 52cHWUdaZNviQP1q55FaF3oySwVmo9aH1Zpy0ZJZDzjDEr3914mwUiZojS+psWLcg7UbzkYtkv
 GUpUrgCy2sxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="188084543"
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="188084543"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:38 -0800
IronPort-SDR: dw16VgBnX99MAH347jLFNexdMxpQvor4XEEavslsTbxRWXr/M7CUNpy3JVaGAL8dE+SIAYUq4R
 96cgUwoBY47w==
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="409182040"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:35 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, linux-mtd@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>
Subject: [RFC PATCH 10/10 v2] mtd: use refcount to prevent corruption
Date: Mon,  8 Mar 2021 08:27:48 +0200
Message-Id: <20210308062748.208017-11-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308062748.208017-1-tomas.winkler@intel.com>
References: <20210308062748.208017-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_063050_303080_29A03F38 
X-CRM114-Status: GOOD (  18.99  )
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
Content-Type: multipart/mixed; boundary="===============5209657384924250888=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5209657384924250888==
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit

When underlying device is removed mtd core will crash
in case user space is holding open handle.
Need to use proper refcounting so device is release
only when has no users.


Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
V2:
1. define pr_fmt macro
 drivers/mtd/mtdcore.c   | 64 +++++++++++++++++++++++++----------------
 drivers/mtd/mtdcore.h   |  1 +
 drivers/mtd/mtdpart.c   | 13 +++++----
 include/linux/mtd/mtd.h |  2 +-
 4 files changed, 48 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2d6423d89a17..152aba9822a0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -7,6 +7,7 @@
  * Copyright © 2006      Red Hat UK Limited 
  */
 
+#define pr_fmt(fmt) "[" KBUILD_MODNAME ":%s:%d] " fmt, __func__, __LINE__
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/ptrace.h>
@@ -93,9 +94,31 @@ static void mtd_release(struct device *dev)
 	dev_t index = MTD_DEVT(mtd->index);
 
 	/* remove /dev/mtdXro node */
+	if (mtd_is_partition(mtd))
+		release_mtd_partition(mtd);
+
 	device_destroy(&mtd_class, index + 1);
 }
 
+static void mtd_device_release(struct kref *kref)
+{
+	struct mtd_info *mtd = container_of(kref, struct mtd_info, refcnt);
+
+	pr_debug("releasing %s\n", mtd->name);
+
+	if (mtd->nvmem) {
+		nvmem_unregister(mtd->nvmem);
+		mtd->nvmem = NULL;
+	}
+
+	idr_remove(&mtd_idr, mtd->index);
+	of_node_put(mtd_get_of_node(mtd));
+
+	device_unregister(&mtd->dev);
+
+	module_put(THIS_MODULE);
+}
+
 static ssize_t mtd_type_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -619,7 +642,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	}
 
 	mtd->index = i;
-	mtd->usecount = 0;
+	kref_init(&mtd->refcnt);
 
 	/* default value if not set by driver */
 	if (mtd->bitflip_threshold == 0)
@@ -719,6 +742,8 @@ int del_mtd_device(struct mtd_info *mtd)
 	int ret;
 	struct mtd_notifier *not;
 
+	pr_debug("%s %s\n", __func__, mtd->name);
+
 	mutex_lock(&mtd_table_mutex);
 
 	debugfs_remove_recursive(mtd->dbg.dfs_dir);
@@ -733,23 +758,8 @@ int del_mtd_device(struct mtd_info *mtd)
 	list_for_each_entry(not, &mtd_notifiers, list)
 		not->remove(mtd);
 
-	if (mtd->usecount) {
-		printk(KERN_NOTICE "Removing MTD device #%d (%s) with use count %d\n",
-		       mtd->index, mtd->name, mtd->usecount);
-		ret = -EBUSY;
-	} else {
-		/* Try to remove the NVMEM provider */
-		if (mtd->nvmem)
-			nvmem_unregister(mtd->nvmem);
-
-		device_unregister(&mtd->dev);
-
-		idr_remove(&mtd_idr, mtd->index);
-		of_node_put(mtd_get_of_node(mtd));
-
-		module_put(THIS_MODULE);
-		ret = 0;
-	}
+	kref_put(&mtd->refcnt, mtd_device_release);
+	ret = 0;
 
 out_error:
 	mutex_unlock(&mtd_table_mutex);
@@ -984,20 +994,23 @@ int __get_mtd_device(struct mtd_info *mtd)
 	if (!try_module_get(master->owner))
 		return -ENODEV;
 
+	kref_get(&mtd->refcnt);
+	pr_debug("get mtd %s %d\n", mtd->name, kref_read(&mtd->refcnt));
+
 	if (master->_get_device) {
 		err = master->_get_device(mtd);
 
 		if (err) {
+			kref_put(&mtd->refcnt, mtd_device_release);
 			module_put(master->owner);
 			return err;
 		}
 	}
 
-	master->usecount++;
-
 	while (mtd->parent) {
-		mtd->usecount++;
 		mtd = mtd->parent;
+		kref_get(&mtd->refcnt);
+		pr_debug("get mtd %s %d\n", mtd->name, kref_read(&mtd->refcnt));
 	}
 
 	return 0;
@@ -1055,14 +1068,15 @@ void __put_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
 
+	kref_put(&mtd->refcnt, mtd_device_release);
+	pr_debug("put mtd %s %d\n", mtd->name, kref_read(&mtd->refcnt));
+
 	while (mtd->parent) {
-		--mtd->usecount;
-		BUG_ON(mtd->usecount < 0);
 		mtd = mtd->parent;
+		kref_put(&mtd->refcnt, mtd_device_release);
+		pr_debug("put mtd %s %d\n", mtd->name, kref_read(&mtd->refcnt));
 	}
 
-	master->usecount--;
-
 	if (master->_put_device)
 		master->_put_device(master);
 
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index b5eefeabf310..b014861a06a6 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -12,6 +12,7 @@ int __must_check add_mtd_device(struct mtd_info *mtd);
 int del_mtd_device(struct mtd_info *mtd);
 int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
+void release_mtd_partition(struct mtd_info *mtd);
 
 struct mtd_partitions;
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 12ca4f19cb14..6d70b5d0e663 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -27,10 +27,17 @@
 
 static inline void free_partition(struct mtd_info *mtd)
 {
+	pr_err("free_partition \"%s\"\n", mtd->name);
 	kfree(mtd->name);
 	kfree(mtd);
 }
 
+void release_mtd_partition(struct mtd_info *mtd)
+{
+	list_del_init(&mtd->part.node);
+	free_partition(mtd);
+}
+
 static struct mtd_info *allocate_partition(struct mtd_info *parent,
 					   const struct mtd_partition *part,
 					   int partno, uint64_t cur_offset)
@@ -313,9 +320,6 @@ static int __mtd_del_partition(struct mtd_info *mtd)
 	if (err)
 		return err;
 
-	list_del(&child->part.node);
-	free_partition(mtd);
-
 	return 0;
 }
 
@@ -341,9 +345,6 @@ static int __del_mtd_partitions(struct mtd_info *mtd)
 			err = ret;
 			continue;
 		}
-
-		list_del(&child->part.node);
-		free_partition(child);
 	}
 
 	return err;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 157357ec1441..1217c9d8d69d 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -373,7 +373,7 @@ struct mtd_info {
 
 	struct module *owner;
 	struct device dev;
-	int usecount;
+	struct kref refcnt;
 	struct mtd_debug_info dbg;
 	struct nvmem_device *nvmem;
 
-- 
2.26.2



--===============5209657384924250888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5209657384924250888==--
