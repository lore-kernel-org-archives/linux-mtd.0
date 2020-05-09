Return-Path: <SRS0=nfTR=6X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99046C54E4A
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 23:47:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 690BF21582
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 23:47:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NwtB7JCC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P8QtgpwN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 690BF21582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0m94+3RBYJblYnGETPQOFV+1K7ZsopN4+2qD0B1NMg=; b=NwtB7JCCDAm9DZ
	rnpltrdAFS+gp5qW6q+H6JY+rq0H1U7XqS2pkT3R1qQWeC3VCT6cXaDGKqWwRLtf5f3gP85sPgvX7
	OCbKv+Eez/SL3lBU8WRXStlk0wCMnJD0pGVKnxfgPs8apKAHiUJfOF3rDQcEUn/UHhPpRD0T7jS8s
	x4AebtuBEIdF+wQNuFh3WO//Cp1243IQqZeMxeTK811O7b0kVk7YsgpoDEC7R3hO85IjcmOIu00uT
	+DyWYevNE/W+upCPQKLsa8XlqKRLlBMxVOOyQ3UxzyBdHldCj+lAeutLK6GriX2Oobcl6Q7sSk3dN
	mocT0UpBcCDPFiyESJHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXZBd-0008Ry-9b; Sat, 09 May 2020 23:47:17 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXZBD-0007uQ-Ta
 for linux-mtd@lists.infradead.org; Sat, 09 May 2020 23:46:54 +0000
Received: by mail-pj1-x1044.google.com with SMTP id e6so5923330pjt.4
 for <linux-mtd@lists.infradead.org>; Sat, 09 May 2020 16:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bYst0a3JOnFIaCaINGPLSe73qBi5ZdkwCooNlH5uc50=;
 b=P8QtgpwN2s4KNy1O8B2/UKePJb2MPdfQaMJ1CYHfs2PeKd5zSoRbOOW9VVWq+2KcM0
 D/LKBpoa/0dNzHQBpplBcvwNIRHOU6x+6ccL9DwcTT3k1BvXYaLNEWMfZbZ1BKbJMTFo
 MKu6vM2kK78CdwX4NqCacHxKnBubus/WFlMWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bYst0a3JOnFIaCaINGPLSe73qBi5ZdkwCooNlH5uc50=;
 b=GNON3+ZziCx8br8510i0o9vmbtgnlVJoOp7pQrmIftofYTMl7CWNBneDlG4CsxHsyv
 SawYsVlYY1p4ZZWDSuFlAi1fw06gPFkZxgsWv1bcQjptKNMnSSoqEHTYesWHyaX3nVbC
 QPq7sizxOSgIZoIUbWazC8EwZK0BF58JNgzOgJ01+WWlamIZooYvAIxmwJrfQZMahJ6k
 1j0U4QIbZ0QM6KB6U/v32WcWF6QgJGTRvi17m3dZf15TGDPCbIVd0RTzDs76AdZaaoYW
 mlOAC36BSSbrXUKyQ9Y2RSeWzdvwg0J7RUhVuZuAscFRaLqRTo72OY1hj56uOKN0xiVb
 hevQ==
X-Gm-Message-State: AGi0PuaONplGB1xlVy6xXJd6HvZFI53CPoyUQzNuLo3qrSxiI+AApCJS
 kYBCxYr1gLHu3c77Yyp906LJ3g==
X-Google-Smtp-Source: APiQypL0g87Czpw8Ps6IRtK9NMz7KkLFboGy1rwMPsfG49y6Sf4v25+GCAucffMk5NHZmt6xLUK55A==
X-Received: by 2002:a17:90a:2344:: with SMTP id
 f62mr12465395pje.152.1589068011192; 
 Sat, 09 May 2020 16:46:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o40sm5928322pjb.18.2020.05.09.16.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 16:46:49 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v6 16/18] pstore/blk: Support non-block storage devices
Date: Sat,  9 May 2020 16:41:01 -0700
Message-Id: <20200509234103.46544-17-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509234103.46544-1-keescook@chromium.org>
References: <20200509234103.46544-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_164651_981740_169A0F98 
X-CRM114-Status: GOOD (  20.69  )
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Rob Herring <robh@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: WeiXiong Liao <liaoweixiong@allwinnertech.com>

Add support for non-block devices (e.g. MTD). A non-block driver calls
pstore_blk_register_device() to register iself.

In addition, pstore/zone is updated to handle non-block devices,
where an erase must be done before a write. Without this, there is no
way to remove records stored to an MTD.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Link: https://lore.kernel.org/r/1585126506-18635-11-git-send-email-liaoweixiong@allwinnertech.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/admin-guide/pstore-blk.rst | 17 ++++-
 fs/pstore/blk.c                          | 96 +++++++++++++-----------
 fs/pstore/zone.c                         |  8 +-
 include/linux/pstore_blk.h               | 37 +++++++++
 include/linux/pstore_zone.h              |  6 ++
 5 files changed, 115 insertions(+), 49 deletions(-)

diff --git a/Documentation/admin-guide/pstore-blk.rst b/Documentation/admin-guide/pstore-blk.rst
index bef8c7436721..faf9991879aa 100644
--- a/Documentation/admin-guide/pstore-blk.rst
+++ b/Documentation/admin-guide/pstore-blk.rst
@@ -7,8 +7,8 @@ Introduction
 ------------
 
 pstore block (pstore/blk) is an oops/panic logger that writes its logs to a
-block device before the system crashes. You can get these log files by
-mounting pstore filesystem like::
+block device and non-block device before the system crashes. You can get
+these log files by mounting pstore filesystem like::
 
     mount -t pstore pstore /sys/fs/pstore
 
@@ -24,8 +24,8 @@ Configurations for user determine how pstore/blk works, such as pmsg_size,
 kmsg_size and so on. All of them support both Kconfig and module parameters,
 but module parameters have priority over Kconfig.
 
-Configurations for driver are all about block device, such as total_size
-of block device and read/write operations.
+Configurations for driver are all about block device and non-block device,
+such as total_size of block device and read/write operations.
 
 Configurations for user
 -----------------------
@@ -152,6 +152,15 @@ driver uses ``register_pstore_blk`` to register to pstore/blk.
 .. kernel-doc:: fs/pstore/blk.c
    :identifiers: register_pstore_blk
 
+A non-block device driver uses ``register_pstore_device`` with
+``struct psblk_device`` to register to pstore/blk.
+
+.. kernel-doc:: fs/pstore/blk.c
+   :identifiers: register_pstore_device
+
+.. kernel-doc:: include/linux/pstore_blk.h
+   :identifiers: psblk_device
+
 Compression and header
 ----------------------
 
diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 134c5e0c67c1..3e67bd4557ea 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -104,55 +104,23 @@ static struct bdev_info {
 	_##name_;						\
 })
 
-/**
- * struct psblk_device - back-end pstore/blk driver structure.
- *
- * @total_size: The total size in bytes pstore/blk can use. It must be greater
- *		than 4096 and be multiple of 4096.
- * @flags:	Refer to macro starting with PSTORE_FLAGS defined in
- *		linux/pstore.h. It means what front-ends this device support.
- *		Zero means all backends for compatible.
- * @read:	The general read operation. Both of the function parameters
- *		@size and @offset are relative value to bock device (not the
- *		whole disk).
- *		On success, the number of bytes should be returned, others
- *		means error.
- * @write:	The same as @read, but the following error number:
- *		-EBUSY means try to write again later.
- *		-ENOMSG means to try next zone.
- * @panic_write:The write operation only used for panic case. It's optional
- *		if you do not care panic log. The parameters are relative
- *		value to storage.
- *		On success, the number of bytes should be returned, others
- *		excluding -ENOMSG mean error. -ENOMSG means to try next zone.
- */
-struct psblk_device {
-	unsigned long total_size;
-	unsigned int flags;
-	psz_read_op read;
-	psz_write_op write;
-	psz_write_op panic_write;
-};
-
-static int psblk_register_do(struct psblk_device *dev)
+static int __register_pstore_device(struct psblk_device *dev)
 {
 	int ret;
 
-	if (!dev || !dev->total_size || !dev->read || !dev->write)
+	if (WARN_ON(!mutex_is_locked(&pstore_blk_lock)))
 		return -EINVAL;
 
-	mutex_lock(&pstore_blk_lock);
+	if (!dev || !dev->total_size || !dev->read || !dev->write)
+		return -EINVAL;
 
 	/* someone already registered before */
-	if (pstore_zone_info) {
-		mutex_unlock(&pstore_blk_lock);
+	if (pstore_zone_info)
 		return -EBUSY;
-	}
+
 	pstore_zone_info = kzalloc(sizeof(struct pstore_zone_info), GFP_KERNEL);
-	if (!pstore_zone_info) {
-		mutex_unlock(&pstore_blk_lock);
+	if (!pstore_zone_info)
 		return -ENOMEM;
-	}
 
 	/* zero means not limit on which backends to attempt to store. */
 	if (!dev->flags)
@@ -178,6 +146,7 @@ static int psblk_register_do(struct psblk_device *dev)
 	pstore_zone_info->max_reason = max_reason;
 	pstore_zone_info->read = dev->read;
 	pstore_zone_info->write = dev->write;
+	pstore_zone_info->erase = dev->erase;
 	pstore_zone_info->panic_write = dev->panic_write;
 	pstore_zone_info->name = KBUILD_MODNAME;
 	pstore_zone_info->owner = THIS_MODULE;
@@ -187,20 +156,51 @@ static int psblk_register_do(struct psblk_device *dev)
 		kfree(pstore_zone_info);
 		pstore_zone_info = NULL;
 	}
+	return ret;
+}
+/**
+ * register_pstore_device() - register non-block device to pstore/blk
+ *
+ * @dev: non-block device information
+ *
+ * Return:
+ * * 0		- OK
+ * * Others	- something error.
+ */
+int register_pstore_device(struct psblk_device *dev)
+{
+	int ret;
+
+	mutex_lock(&pstore_blk_lock);
+	ret = __register_pstore_device(dev);
 	mutex_unlock(&pstore_blk_lock);
+
 	return ret;
 }
+EXPORT_SYMBOL_GPL(register_pstore_device);
 
-static void psblk_unregister_do(struct psblk_device *dev)
+void __unregister_pstore_device(struct psblk_device *dev)
 {
-	mutex_lock(&pstore_blk_lock);
+	WARN_ON(!mutex_is_locked(&pstore_blk_lock));
 	if (pstore_zone_info && pstore_zone_info->read == dev->read) {
 		unregister_pstore_zone(pstore_zone_info);
 		kfree(pstore_zone_info);
 		pstore_zone_info = NULL;
 	}
+}
+
+/**
+ * unregister_pstore_device() - unregister non-block device from pstore/blk
+ *
+ * @dev: non-block device information
+ */
+void unregister_pstore_device(struct psblk_device *dev)
+{
+	mutex_lock(&pstore_blk_lock);
+	__unregister_pstore_device(dev);
 	mutex_unlock(&pstore_blk_lock);
 }
+EXPORT_SYMBOL_GPL(unregister_pstore_device);
 
 /**
  * psblk_get_bdev() - open block device
@@ -407,11 +407,12 @@ static int __register_pstore_blk(unsigned int major, unsigned int flags,
 
 	dev.total_size = psblk_bdev_size(bdev);
 	dev.flags = flags;
-	dev.panic_write = panic_write ? psblk_blk_panic_write : NULL;
 	dev.read = psblk_generic_blk_read;
 	dev.write = psblk_generic_blk_write;
+	dev.erase = NULL;
+	dev.panic_write = panic_write ? psblk_blk_panic_write : NULL;
 
-	ret = psblk_register_do(&dev);
+	ret = __register_pstore_device(&dev);
 	if (ret)
 		goto err_put_bdev;
 
@@ -462,7 +463,7 @@ void __unregister_pstore_blk(unsigned int major)
 
 	WARN_ON(!mutex_is_locked(&pstore_blk_lock));
 	if (psblk_bdev && MAJOR(psblk_bdev->bd_dev) == major) {
-		psblk_unregister_do(&dev);
+		__unregister_pstore_device(&dev);
 		psblk_put_bdev(psblk_bdev, holder);
 		blkdev_panic_write = NULL;
 		psblk_bdev = NULL;
@@ -536,6 +537,13 @@ static void __exit pstore_blk_exit(void)
 	mutex_lock(&pstore_blk_lock);
 	if (psblk_bdev)
 		__unregister_pstore_blk(MAJOR(psblk_bdev->bd_dev));
+	else {
+		struct psblk_device dev = { };
+
+		if (pstore_zone_info)
+			dev.read = pstore_zone_info->read;
+		__unregister_pstore_device(&dev);
+	}
 	mutex_unlock(&pstore_blk_lock);
 }
 module_exit(pstore_blk_exit);
diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index 17c9a0439d6e..b04257f8420f 100644
--- a/fs/pstore/zone.c
+++ b/fs/pstore/zone.c
@@ -661,15 +661,21 @@ static inline int psz_kmsg_erase(struct psz_context *cxt,
 	struct psz_buffer *buffer = zone->buffer;
 	struct psz_kmsg_header *hdr =
 		(struct psz_kmsg_header *)buffer->data;
+	size_t size;
 
 	if (unlikely(!psz_ok(zone)))
 		return 0;
+
 	/* this zone is already updated, no need to erase */
 	if (record->count != hdr->counter)
 		return 0;
 
+	size = buffer_datalen(zone) + sizeof(*zone->buffer);
 	atomic_set(&zone->buffer->datalen, 0);
-	return psz_zone_write(zone, FLUSH_META, NULL, 0, 0);
+	if (cxt->pstore_zone_info->erase)
+		return cxt->pstore_zone_info->erase(size, zone->off);
+	else
+		return psz_zone_write(zone, FLUSH_META, NULL, 0, 0);
 }
 
 static inline int psz_record_erase(struct psz_context *cxt,
diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
index 8aae922caa27..de87373da3ff 100644
--- a/include/linux/pstore_blk.h
+++ b/include/linux/pstore_blk.h
@@ -7,6 +7,41 @@
 #include <linux/pstore.h>
 #include <linux/pstore_zone.h>
 
+/**
+ * struct psblk_device - back-end pstore/blk driver structure.
+ *
+ * @total_size: The total size in bytes pstore/blk can use. It must be greater
+ *		than 4096 and be multiple of 4096.
+ * @flags:	Refer to macro starting with PSTORE_FLAGS defined in
+ *		linux/pstore.h. It means what front-ends this device support.
+ *		Zero means all backends for compatible.
+ * @read:	The general read operation. Both of the function parameters
+ *		@size and @offset are relative value to bock device (not the
+ *		whole disk).
+ *		On success, the number of bytes should be returned, others
+ *		means error.
+ * @write:	The same as @read, but the following error number:
+ *		-EBUSY means try to write again later.
+ *		-ENOMSG means to try next zone.
+ * @erase:	The general erase operation for device with special removing
+ *		job. Both of the function parameters @size and @offset are
+ *		relative value to storage.
+ *		Return 0 on success and others on failure.
+ * @panic_write:The write operation only used for panic case. It's optional
+ *		if you do not care panic log. The parameters are relative
+ *		value to storage.
+ *		On success, the number of bytes should be returned, others
+ *		excluding -ENOMSG mean error. -ENOMSG means to try next zone.
+ */
+struct psblk_device {
+	unsigned long total_size;
+	unsigned int flags;
+	psz_read_op read;
+	psz_write_op write;
+	psz_erase_op erase;
+	psz_write_op panic_write;
+};
+
 /**
  * typedef psblk_panic_write_op - panic write operation to block device
  *
@@ -22,6 +57,8 @@
 typedef int (*psblk_panic_write_op)(const char *buf, sector_t start_sect,
 		sector_t sects);
 
+int register_pstore_device(struct psblk_device *dev);
+void psblk_unregister_device(struct psblk_device *dev);
 int  register_pstore_blk(unsigned int major, unsigned int flags,
 		psblk_panic_write_op panic_write);
 void unregister_pstore_blk(unsigned int major);
diff --git a/include/linux/pstore_zone.h b/include/linux/pstore_zone.h
index ddb3dfea4ea6..2c031a25ee5f 100644
--- a/include/linux/pstore_zone.h
+++ b/include/linux/pstore_zone.h
@@ -7,6 +7,7 @@
 
 typedef ssize_t (*psz_read_op)(char *, size_t, loff_t);
 typedef ssize_t (*psz_write_op)(const char *, size_t, loff_t);
+typedef ssize_t (*psz_erase_op)(size_t, loff_t);
 /**
  * struct pstore_zone_info - pstore/zone back-end driver structure
  *
@@ -27,6 +28,10 @@ typedef ssize_t (*psz_write_op)(const char *, size_t, loff_t);
  * @write:	The same as @read, but the following error number:
  *		-EBUSY means try to write again later.
  *		-ENOMSG means to try next zone.
+ * @erase:	The general erase operation for device with special removing
+ *		job. Both of the function parameters @size and @offset are
+ *		relative value to storage.
+ *		Return 0 on success and others on failure.
  * @panic_write:The write operation only used for panic case. It's optional
  *		if you do not care panic log. The parameters are relative
  *		value to storage.
@@ -45,6 +50,7 @@ struct pstore_zone_info {
 	unsigned long ftrace_size;
 	psz_read_op read;
 	psz_write_op write;
+	psz_erase_op erase;
 	psz_write_op panic_write;
 };
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
