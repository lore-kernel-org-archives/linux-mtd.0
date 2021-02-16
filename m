Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46B0C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 18:22:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71E7464E04
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 18:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71E7464E04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6jKwgJgm7NCwJnj27oq3R0K37w4Sv0MbmJ4quCQo3Xo=; b=ZQ1ceqgjtvtXKji75qHI9NpnQ
	gnhA+SnSZ5qWGk7BUyrBLfNUu7pwlwyCc/sIkXFs6DJ5cVhcZOmLBWQWqwT4Op12TeVmIdevA4wgC
	jzh3qYHwm0cRD/AvCGRYCvEh3kp2hy6OIfRBl738FjDgfSVlDVoHXeBwdockxViC/SU+naIehg4nL
	QL/fSW3QcRiIm0fIqi5x+46mK+Wl3WVYOm+xxj9uS1OLSRHPZLefyFaAaGLO++u+7WMkqld6FfOzB
	sZw2UUWO2VPSzQczFZNyTLVOtsIpuz6jUdmoC5V3nfDCxYTpUw5n5Ic3+7bEP/RfyNHy0H9YEdR44
	u15nXtLKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC4yC-0006K0-4K; Tue, 16 Feb 2021 18:21:11 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC4xQ-0005uH-TN
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 18:20:25 +0000
IronPort-SDR: XTicbpHe9+gV0w5jyojySAPEdt9BJn2NSgdHigZfz31podwJuN+Iji+El1fWAfzc9Fc9WMJUhH
 w6d1ld47TEZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="202169505"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="202169505"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:20:19 -0800
IronPort-SDR: EJDvaIYhpYaOsjZ4Zo4lOXQNJuSKBX49wghtYeuI3k9XGC2OhUkGgmg9wbiJ6iX2P3pY/zpBh/
 BxGieHQeqd5A==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="399609303"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:20:16 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC PATCH 9/9] mtd: use refcount to prevent corruption
Date: Tue, 16 Feb 2021 20:19:25 +0200
Message-Id: <20210216181925.650082-10-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210216181925.650082-1-tomas.winkler@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_132023_311976_463191C8 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: linux-mtd@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When underlying device is removed mtd core will crash
in case user space is holding open handle.
Need to use proper refcounting so device is release
only when has no users.

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
 drivers/mtd/mtdcore.c   | 63 +++++++++++++++++++++++++----------------
 drivers/mtd/mtdcore.h   |  1 +
 drivers/mtd/mtdpart.c   | 13 +++++----
 include/linux/mtd/mtd.h |  2 +-
 4 files changed, 47 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2d6423d89a17..a3dacc7104a9 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -93,9 +93,31 @@ static void mtd_release(struct device *dev)
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
+	pr_debug("%s %s\n", __func__, mtd->name);
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
@@ -619,7 +641,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	}
 
 	mtd->index = i;
-	mtd->usecount = 0;
+	kref_init(&mtd->refcnt);
 
 	/* default value if not set by driver */
 	if (mtd->bitflip_threshold == 0)
@@ -719,6 +741,8 @@ int del_mtd_device(struct mtd_info *mtd)
 	int ret;
 	struct mtd_notifier *not;
 
+	pr_debug("%s %s\n", __func__, mtd->name);
+
 	mutex_lock(&mtd_table_mutex);
 
 	debugfs_remove_recursive(mtd->dbg.dfs_dir);
@@ -733,23 +757,8 @@ int del_mtd_device(struct mtd_info *mtd)
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
@@ -984,20 +993,23 @@ int __get_mtd_device(struct mtd_info *mtd)
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
@@ -1055,14 +1067,15 @@ void __put_mtd_device(struct mtd_info *mtd)
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


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
