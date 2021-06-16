Return-Path: <SRS0=4SWJ=LK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F84EC48BE5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 16:43:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 634E460E0C
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 16:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 634E460E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24zMSNa4IuPuOLXogZ2OlSv/COI9x9HueOP7PVwAT7c=; b=ARc0oM1YNbXIQ0
	VaNKB+wRNdsBBDqRDnxiRINbWZysdKBs9IwahOMtzvj4jxfnzXOKvTZg2NTwpW9HsFikweMEclkzW
	fIp4MlSthk0guWj5tO+NLhwipOTFSRDPkx5FBneHnPlb40uTKyAN75hfodmrBAA8nJW8w1lRzmU3x
	KjKTiKaeh8iahdg1onjDwm4UbvAOgUheX6vHMpF0mcYypMrRahRYRLmyBIKzXrtlVfVn06RGia58b
	V5y01g1QNhvxTkC41bqGuDr8VRCOKtU+p/mu7LxCQI7HobhbhS+uJq7pKWciGfBnffsgqe0vTLACS
	BEDk0WSp+DdYOoyrfGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltYcX-007COy-R4; Wed, 16 Jun 2021 16:42:29 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltYax-007BvR-JS
 for linux-mtd@lists.infradead.org; Wed, 16 Jun 2021 16:40:54 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so4351690pjn.1
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jun 2021 09:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uK58C0QtDNcahqJUODnJkhg6UnfaTIghgCe8Hvo81CM=;
 b=HLSDT+7wUHY8LpTUjhJI1RoaqvvzJ8CbeGa1mlLDdidW+2R1M1TEhtvYM7yz+eWIrX
 KvQv9652FaY6AXcLIj1bqdc1ooiiyg/Zrd86bydD6vbzdb3xskLp+KBJcF3FR50cQB6n
 qKRguDajdMaWHfageonZo7jsoXdZh7+Dy0rD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uK58C0QtDNcahqJUODnJkhg6UnfaTIghgCe8Hvo81CM=;
 b=QRA0VA+TguVEkCfftaPALPFqdPcu+PImPGUi3gqUU+p4izeCHQWU1VPaqpxwpGEjXa
 OcS8A+cxcFJD7nOjjrOttO73Fdh7NluuqAH01mYqhOa4fMAUZDU/LOBTG6NRvXzdF3Gz
 IqQArn38x/Hv3WHp5UXaLhs9+l6D/b9EiPIGkvJ4bYvZuZdnbshdvX0DUaqgv+uixWlQ
 y5GpcmHAPNK1hBYlStFfNQFZEi/TReGjT7xz/K7Q7buZ5vgnrx15+VFPwLSLYDf30K0A
 370Oyul+GoDit5OpmCJ6LDSNTKxvUMFsRbSVvaSZL910S1/34V4BHKKHlALXkDO9MaSi
 uOJQ==
X-Gm-Message-State: AOAM531mOp+MF1NMJo9ANImChezVmLMRvC9sVO+UW0v+vnR0WDWi2ixO
 wmsMN0zvdeDfZbPPHn64Fw00dw==
X-Google-Smtp-Source: ABdhPJwlTj2cDO93OlRliFpEUmheK1SgPnMQrH2UNhETk3H6RxkXF0EXk5NDiMLaXRmE082Rijd1Sw==
X-Received: by 2002:a17:90b:190a:: with SMTP id
 mp10mr11930432pjb.145.1623861650375; 
 Wed, 16 Jun 2021 09:40:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x22sm2748199pjp.37.2021.06.16.09.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:40:49 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Christoph Hellwig <hch@lst.de>,
 Al Viro <viro@zeniv.linux.org.uk>, gmpy.liaowx@gmail.com,
 Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>,
 Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-doc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v3 5/5] pstore/blk: Include zone in pstore_device_info
Date: Wed, 16 Jun 2021 09:40:43 -0700
Message-Id: <20210616164043.1221861-6-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616164043.1221861-1-keescook@chromium.org>
References: <20210616164043.1221861-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=c97831fb0c8399e525140afebf8001d0f40da49a;
 i=OzHp+/X5c8B1qT+xdnUXKoWwSY89uY95adXbT6Ztj74=;
 m=WOqt0d4utZlTaiUKpB0qyaFAJBWPe3VuJCNaOBLEDLw=;
 p=wbFugwaR98gj5F6ZJcTti2VyGOc7eeRpR29pqb1+kEM=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmDKKYoACgkQiXL039xtwCYvsA/6ApV
 9oqn2tzk1t8uMGJIn3m65c8MwIVr818wTAMFJnW9u82WYoJCWvo32Qh0f3PmX43ZDi40Xi4WgHoU+
 DWoUxhSQhUU1j7C7XgrJN41FLiylFLPdPSgFKBl33CeDOOFMsYoB2prcRBpl5mdp+HzsSB+pHH2qZ
 pnVBhl8YGHq9YdTzQP9WefqTL8DrpbWpOzRQr3YsIpVlkwnbdnk47mnBTOmIrPevoE+HQfJZOsjJh
 ndvcUnLRCYIUuayQkXi2NuPTS2K61vW4rBMBzoHImcIYMtZbg1uLXTC9D1vJRRWwRh57FvUXXoxak
 jjaT+0CjnV/Ulq1oMiKmp2PYnrwztj4R0oydjQqtR0jE+Zd4e+GU2kF/YrNTERZCLTOhnM4j/RJjd
 R+7j5TQtwgppoqNLjWu2Z5+8ouJuKTQW3JSAUHCJGA7+Vrw5xcQSF2/3L4CRwQmS/HyOCrH8Ysan/
 jgQMjbFxVXh7o7K83BhbgYIYEtx7zYfshZ5ZRAQU6iccE14L30Gf2rvDf2b68f205OSKQlTS5+S5d
 WyaDqbN1qIqj98FEQR85QYGg2tdB11VTDSZWOTCXdGAmVOgepD12myNxG/FGm0yboZ/IGx60g2DwC
 uoGHNT2b4NMHEcO/j2BgYAhKLXy1nAJONBIDpaqy/avuWQlmCio+FEIHEmpJRyb4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_094051_700466_5295D144 
X-CRM114-Status: GOOD (  29.66  )
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

Information was redundant between struct pstore_zone_info and struct
pstore_device_info. Use struct pstore_zone_info, with member name "zone".

Additionally untangle the logic for the "best effort" block device
instance.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/mtdpstore.c    |  10 +--
 fs/pstore/blk.c            | 143 ++++++++++++++++++++-----------------
 include/linux/pstore_blk.h |  27 +------
 3 files changed, 87 insertions(+), 93 deletions(-)

diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
index a3ae8778f6a9..e13d42c0acb0 100644
--- a/drivers/mtd/mtdpstore.c
+++ b/drivers/mtd/mtdpstore.c
@@ -423,13 +423,13 @@ static void mtdpstore_notify_add(struct mtd_info *mtd)
 	longcnt = BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
 	cxt->badmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
 
-	cxt->dev.total_size = mtd->size;
 	/* just support dmesg right now */
 	cxt->dev.flags = PSTORE_FLAGS_DMESG;
-	cxt->dev.read = mtdpstore_read;
-	cxt->dev.write = mtdpstore_write;
-	cxt->dev.erase = mtdpstore_erase;
-	cxt->dev.panic_write = mtdpstore_panic_write;
+	cxt->dev.zone.read = mtdpstore_read;
+	cxt->dev.zone.write = mtdpstore_write;
+	cxt->dev.zone.erase = mtdpstore_erase;
+	cxt->dev.zone.panic_write = mtdpstore_panic_write;
+	cxt->dev.zone.total_size = mtd->size;
 
 	ret = register_pstore_device(&cxt->dev);
 	if (ret) {
diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index c373e0d73e6c..ccb82bcde7a8 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -70,7 +70,7 @@ MODULE_PARM_DESC(blkdev, "block device for pstore storage");
  */
 static DEFINE_MUTEX(pstore_blk_lock);
 static struct file *psblk_file;
-static struct pstore_zone_info *pstore_zone_info;
+static struct pstore_device_info *pstore_device_info;
 
 #define check_size(name, alignsize) ({				\
 	long _##name_ = (name);					\
@@ -91,7 +91,7 @@ static struct pstore_zone_info *pstore_zone_info;
 		_##name_ = 0;					\
 	/* Synchronize module parameters with resuls. */	\
 	name = _##name_ / 1024;					\
-	pstore_zone_info->name = _##name_;			\
+	dev->zone.name = _##name_;				\
 }
 
 static int __register_pstore_device(struct pstore_device_info *dev)
@@ -104,50 +104,42 @@ static int __register_pstore_device(struct pstore_device_info *dev)
 		pr_err("NULL device info\n");
 		return -EINVAL;
 	}
-	if (!dev->total_size) {
+	if (!dev->zone.total_size) {
 		pr_err("zero sized device\n");
 		return -EINVAL;
 	}
-	if (!dev->read) {
+	if (!dev->zone.read) {
 		pr_err("no read handler for device\n");
 		return -EINVAL;
 	}
-	if (!dev->write) {
+	if (!dev->zone.write) {
 		pr_err("no write handler for device\n");
 		return -EINVAL;
 	}
 
 	/* someone already registered before */
-	if (pstore_zone_info)
+	if (pstore_device_info)
 		return -EBUSY;
 
-	pstore_zone_info = kzalloc(sizeof(struct pstore_zone_info), GFP_KERNEL);
-	if (!pstore_zone_info)
-		return -ENOMEM;
-
 	/* zero means not limit on which backends to attempt to store. */
 	if (!dev->flags)
 		dev->flags = UINT_MAX;
 
+	/* Copy in module parameters. */
 	verify_size(kmsg_size, 4096, dev->flags & PSTORE_FLAGS_DMESG);
 	verify_size(pmsg_size, 4096, dev->flags & PSTORE_FLAGS_PMSG);
 	verify_size(console_size, 4096, dev->flags & PSTORE_FLAGS_CONSOLE);
 	verify_size(ftrace_size, 4096, dev->flags & PSTORE_FLAGS_FTRACE);
+	dev->zone.max_reason = max_reason;
+
+	/* Initialize required zone ownership details. */
+	dev->zone.name = KBUILD_MODNAME;
+	dev->zone.owner = THIS_MODULE;
+
+	ret = register_pstore_zone(&dev->zone);
+	if (ret == 0)
+		pstore_device_info = dev;
 
-	pstore_zone_info->total_size = dev->total_size;
-	pstore_zone_info->max_reason = max_reason;
-	pstore_zone_info->read = dev->read;
-	pstore_zone_info->write = dev->write;
-	pstore_zone_info->erase = dev->erase;
-	pstore_zone_info->panic_write = dev->panic_write;
-	pstore_zone_info->name = KBUILD_MODNAME;
-	pstore_zone_info->owner = THIS_MODULE;
-
-	ret = register_pstore_zone(pstore_zone_info);
-	if (ret) {
-		kfree(pstore_zone_info);
-		pstore_zone_info = NULL;
-	}
 	return ret;
 }
 /**
@@ -174,10 +166,9 @@ EXPORT_SYMBOL_GPL(register_pstore_device);
 static void __unregister_pstore_device(struct pstore_device_info *dev)
 {
 	lockdep_assert_held(&pstore_blk_lock);
-	if (pstore_zone_info && pstore_zone_info->read == dev->read) {
-		unregister_pstore_zone(pstore_zone_info);
-		kfree(pstore_zone_info);
-		pstore_zone_info = NULL;
+	if (pstore_device_info && pstore_device_info == dev) {
+		unregister_pstore_zone(&dev->zone);
+		pstore_device_info = NULL;
 	}
 }
 
@@ -211,12 +202,9 @@ static ssize_t psblk_generic_blk_write(const char *buf, size_t bytes,
 /*
  * This takes its configuration only from the module parameters now.
  */
-static int __register_pstore_blk(const char *devpath)
+static int __register_pstore_blk(struct pstore_device_info *dev,
+				 const char *devpath)
 {
-	struct pstore_device_info dev = {
-		.read = psblk_generic_blk_read,
-		.write = psblk_generic_blk_write,
-	};
 	struct inode *inode;
 	int ret = -ENODEV;
 
@@ -236,9 +224,9 @@ static int __register_pstore_blk(const char *devpath)
 	}
 
 	inode = I_BDEV(psblk_file->f_mapping->host)->bd_inode;
-	dev.total_size = i_size_read(inode);
+	dev->zone.total_size = i_size_read(inode);
 
-	ret = __register_pstore_device(&dev);
+	ret = __register_pstore_device(dev);
 	if (ret)
 		goto err_fput;
 
@@ -252,18 +240,6 @@ static int __register_pstore_blk(const char *devpath)
 	return ret;
 }
 
-static void __unregister_pstore_blk(struct file *device)
-{
-	struct pstore_device_info dev = { .read = psblk_generic_blk_read };
-
-	lockdep_assert_held(&pstore_blk_lock);
-	if (psblk_file && psblk_file == device) {
-		__unregister_pstore_device(&dev);
-		fput(psblk_file);
-		psblk_file = NULL;
-	}
-}
-
 /* get information of pstore/blk */
 int pstore_blk_get_config(struct pstore_blk_config *info)
 {
@@ -308,18 +284,63 @@ static inline const char *early_boot_devpath(const char *initial_devname)
 }
 #endif
 
+static int __init __best_effort_init(void)
+{
+	struct pstore_device_info *best_effort_dev;
+	int ret;
+
+	/* No best-effort mode requested. */
+	if (!best_effort)
+		return 0;
+
+	/* Reject an empty blkdev. */
+	if (!blkdev[0]) {
+		pr_err("blkdev empty with best_effort=Y\n");
+		return -EINVAL;
+	}
+
+	best_effort_dev = kzalloc(sizeof(*best_effort_dev), GFP_KERNEL);
+	if (!best_effort)
+		return -ENOMEM;
+
+	best_effort_dev->zone.read = psblk_generic_blk_read;
+	best_effort_dev->zone.write = psblk_generic_blk_write;
+
+	ret = __register_pstore_blk(best_effort_dev,
+				    early_boot_devpath(blkdev));
+	if (ret)
+		kfree(best_effort_dev);
+	else
+		pr_info("attached %s (%zu) (no dedicated panic_write!)\n",
+			blkdev, best_effort_dev->zone.total_size);
+
+	return ret;
+}
+
+static void __exit __best_effort_exit(void)
+{
+	/*
+	 * Currently, the only user of psblk_file is best_effort, so
+	 * we can assume that pstore_device_info is associated with it.
+	 * Once there are "real" blk devices, there will need to be a
+	 * dedicated pstore_blk_info, etc.
+	 */
+	if (psblk_file) {
+		struct pstore_device_info *dev = pstore_device_info;
+
+		__unregister_pstore_device(dev);
+		kfree(dev);
+		fput(psblk_file);
+		psblk_file = NULL;
+	}
+}
+
 static int __init pstore_blk_init(void)
 {
-	int ret = 0;
+	int ret;
 
 	mutex_lock(&pstore_blk_lock);
-	if (!pstore_zone_info && best_effort && blkdev[0]) {
-		ret = __register_pstore_blk(early_boot_devpath(blkdev));
-		if (ret == 0 && pstore_zone_info)
-			pr_info("attached %s:%s (%zu) (no dedicated panic_write!)\n",
-				pstore_zone_info->name, blkdev,
-				pstore_zone_info->total_size);
-	}
+	ret = __best_effort_init();
 	mutex_unlock(&pstore_blk_lock);
 
 	return ret;
@@ -329,15 +350,9 @@ late_initcall(pstore_blk_init);
 static void __exit pstore_blk_exit(void)
 {
 	mutex_lock(&pstore_blk_lock);
-	if (psblk_file)
-		__unregister_pstore_blk(psblk_file);
-	else {
-		struct pstore_device_info dev = { };
-
-		if (pstore_zone_info)
-			dev.read = pstore_zone_info->read;
-		__unregister_pstore_device(&dev);
-	}
+	__best_effort_exit();
+	/* If we've been asked to unload, unregister any remaining device. */
+	__unregister_pstore_device(pstore_device_info);
 	mutex_unlock(&pstore_blk_lock);
 }
 module_exit(pstore_blk_exit);
diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
index 99564f93d774..924ca07aafbd 100644
--- a/include/linux/pstore_blk.h
+++ b/include/linux/pstore_blk.h
@@ -10,36 +10,15 @@
 /**
  * struct pstore_device_info - back-end pstore/blk driver structure.
  *
- * @total_size: The total size in bytes pstore/blk can use. It must be greater
- *		than 4096 and be multiple of 4096.
  * @flags:	Refer to macro starting with PSTORE_FLAGS defined in
  *		linux/pstore.h. It means what front-ends this device support.
  *		Zero means all backends for compatible.
- * @read:	The general read operation. Both of the function parameters
- *		@size and @offset are relative value to bock device (not the
- *		whole disk).
- *		On success, the number of bytes should be returned, others
- *		means error.
- * @write:	The same as @read, but the following error number:
- *		-EBUSY means try to write again later.
- *		-ENOMSG means to try next zone.
- * @erase:	The general erase operation for device with special removing
- *		job. Both of the function parameters @size and @offset are
- *		relative value to storage.
- *		Return 0 on success and others on failure.
- * @panic_write:The write operation only used for panic case. It's optional
- *		if you do not care panic log. The parameters are relative
- *		value to storage.
- *		On success, the number of bytes should be returned, others
- *		excluding -ENOMSG mean error. -ENOMSG means to try next zone.
+ * @zone:	The struct pstore_zone_info details.
+ *
  */
 struct pstore_device_info {
-	unsigned long total_size;
 	unsigned int flags;
-	pstore_zone_read_op read;
-	pstore_zone_write_op write;
-	pstore_zone_erase_op erase;
-	pstore_zone_write_op panic_write;
+	struct pstore_zone_info zone;
 };
 
 int  register_pstore_device(struct pstore_device_info *dev);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
