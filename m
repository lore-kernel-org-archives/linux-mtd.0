Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10A8C47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:35:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 673E7206CC
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:35:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gTQgiBOV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RtzcdxXF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 673E7206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GwTZs9QeJ/Gzrwv2iK+RHgQ+PxfYZGFuQ+DNqlpH630=; b=gTQgiBOVwalu/g
	a7Tjs2BfenGAtSboObJacWBHsXCDgFN5mHXeftlh6R2tt7pxfaJu6ZPblMV7+OUDkhkYD3ZcHqBiK
	aFYCd+ElxHksSX1ADSSqUbsoAKc8IvQCzew8nkGSc6sNQ69YJssZDxeFP8DT7SQ+wTPfciw4w4g2q
	C7zJJ9lt81JthUJbCG7xxYzLHjmflKuR5khbWpRiso0HmiE8asNVnICFTiobBzVzmpPk8LiQurjE9
	Izb+8dNXJWfjwoo+/0ue4BHJNiJk0Jf+kawc/glMyiABYrWqcyotpzEVa1fDJ4AIR0Ruv+shb8byC
	98d9AjesLjQV2tpvzgpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYHxM-0006tw-Bt; Mon, 11 May 2020 23:35:32 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYHua-0002Ho-QD
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 23:32:43 +0000
Received: by mail-pl1-x641.google.com with SMTP id s20so4579313plp.6
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 16:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BAOM+e7E09UCRtFcyL1Y8ySA2FJMAJp91jYWUtqelFM=;
 b=RtzcdxXFYwWt7VIJQ7CUWLMA2tfuSCdtpRvG/Ov6tYPy8QnIb2q2296TqkDm0D//cW
 HvQBnLISrV+I3ThF6CccbNt/akZafk7uSNnAjBeXcAXBhVy1XwBw5T3GO+LdvZfnVwMc
 duikki0L6PzZSK8MpfextPCShTX3WH/lSw2Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BAOM+e7E09UCRtFcyL1Y8ySA2FJMAJp91jYWUtqelFM=;
 b=mLY0N33rc7CWs/2lf1K5jQLiWy9e6hPY6Kxe/0yAbXmOYY6lyBDTjUqYQriB1YScfe
 Z0tZP4J7NrnX4uSugJStg6oq7Z/KfhMxz3ScTuREFPEO7y9mVO633KWlbXMSoBYUUlQ/
 opUomCrw22bbK84scFE3fqx78VaCS7zN9EDv/q4lAecVtPHrxRtTOv6hhfh1VCuNK+v1
 5E30XlbroasEBH69SpWRwqyb0vxb7tODPeCRVCkM8/GJ/7zxS0B8Wie61VBgZ1k3p4mo
 02BxkFY2//NTroLfHfwQi30kEH80cCjrCGtrB+QBtFQav0jezo4tBd8cA1EkgNZ+5nFW
 NWsQ==
X-Gm-Message-State: AOAM533EtNDxZl/udhTBaBblERyIQ+ZOEjRUtW2fhIszZqOBrVAOQKDo
 IfeSa03FdKjo6buJMQvp2zFUyw==
X-Google-Smtp-Source: ABdhPJy/VW1Qd7oiv/yX2J8VVrLBLlIqG3FBZdgdp8+t36dyUPXOIQFEjpNmo4hC/cJ26Lq+wRbLsg==
X-Received: by 2002:a17:902:4b:: with SMTP id 69mr4207650pla.99.1589239959859; 
 Mon, 11 May 2020 16:32:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id r31sm9010872pgl.86.2020.05.11.16.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 16:32:35 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v8 09/11] pstore/blk: Support non-block storage devices
Date: Mon, 11 May 2020 16:32:27 -0700
Message-Id: <20200511233229.27745-10-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200511233229.27745-1-keescook@chromium.org>
References: <20200511233229.27745-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_163240_902757_828EAF7A 
X-CRM114-Status: GOOD (  20.44  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
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
 fs/pstore/blk.c                          | 94 +++++++++++++-----------
 fs/pstore/zone.c                         |  8 +-
 include/linux/pstore_blk.h               | 38 ++++++++++
 include/linux/pstore_zone.h              |  6 ++
 5 files changed, 115 insertions(+), 48 deletions(-)

diff --git a/Documentation/admin-guide/pstore-blk.rst b/Documentation/admin-guide/pstore-blk.rst
index bef8c7436721..d45341e55e82 100644
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
+``struct pstore_device_info`` to register to pstore/blk.
+
+.. kernel-doc:: fs/pstore/blk.c
+   :identifiers: register_pstore_device
+
+.. kernel-doc:: include/linux/pstore_blk.h
+   :identifiers: pstore_device_info
+
 Compression and header
 ----------------------
 
diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 95436cff8976..a1bd7c1fdfa0 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -105,55 +105,23 @@ struct bdev_info {
 	_##name_;						\
 })
 
-/**
- * struct pstore_device_info - back-end pstore/blk driver structure.
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
-struct pstore_device_info {
-	unsigned long total_size;
-	unsigned int flags;
-	pstore_zone_read_op read;
-	pstore_zone_write_op write;
-	pstore_zone_write_op panic_write;
-};
-
-static int psblk_register_do(struct pstore_device_info *dev)
+static int __register_pstore_device(struct pstore_device_info *dev)
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
@@ -179,6 +147,7 @@ static int psblk_register_do(struct pstore_device_info *dev)
 	pstore_zone_info->max_reason = max_reason;
 	pstore_zone_info->read = dev->read;
 	pstore_zone_info->write = dev->write;
+	pstore_zone_info->erase = dev->erase;
 	pstore_zone_info->panic_write = dev->panic_write;
 	pstore_zone_info->name = KBUILD_MODNAME;
 	pstore_zone_info->owner = THIS_MODULE;
@@ -188,20 +157,51 @@ static int psblk_register_do(struct pstore_device_info *dev)
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
+int register_pstore_device(struct pstore_device_info *dev)
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
 
-static void psblk_unregister_do(struct pstore_device_info *dev)
+static void __unregister_pstore_device(struct pstore_device_info *dev)
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
+void unregister_pstore_device(struct pstore_device_info *dev)
+{
+	mutex_lock(&pstore_blk_lock);
+	__unregister_pstore_device(dev);
 	mutex_unlock(&pstore_blk_lock);
 }
+EXPORT_SYMBOL_GPL(unregister_pstore_device);
 
 /**
  * psblk_get_bdev() - open block device
@@ -399,9 +399,10 @@ static int __register_pstore_blk(struct pstore_blk_info *info)
 	dev.flags = info->flags;
 	dev.read = psblk_generic_blk_read;
 	dev.write = psblk_generic_blk_write;
+	dev.erase = NULL;
 	dev.panic_write = info->panic_write ? psblk_blk_panic_write : NULL;
 
-	ret = psblk_register_do(&dev);
+	ret = __register_pstore_device(&dev);
 	if (ret)
 		goto err_put_bdev;
 
@@ -445,7 +446,7 @@ static void __unregister_pstore_blk(unsigned int major)
 
 	WARN_ON(!mutex_is_locked(&pstore_blk_lock));
 	if (psblk_bdev && MAJOR(psblk_bdev->bd_dev) == major) {
-		psblk_unregister_do(&dev);
+		__unregister_pstore_device(&dev);
 		psblk_put_bdev(psblk_bdev, holder);
 		blkdev_panic_write = NULL;
 		psblk_bdev = NULL;
@@ -484,6 +485,13 @@ static void __exit pstore_blk_exit(void)
 	mutex_lock(&pstore_blk_lock);
 	if (psblk_bdev)
 		__unregister_pstore_blk(MAJOR(psblk_bdev->bd_dev));
+	else {
+		struct pstore_device_info dev = { };
+
+		if (pstore_zone_info)
+			dev.read = pstore_zone_info->read;
+		__unregister_pstore_device(&dev);
+	}
 	mutex_unlock(&pstore_blk_lock);
 }
 module_exit(pstore_blk_exit);
diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index 110a38242f74..bd8e194110fc 100644
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
index 0c40774e71e0..61e914522b01 100644
--- a/include/linux/pstore_blk.h
+++ b/include/linux/pstore_blk.h
@@ -49,6 +49,44 @@ struct pstore_blk_info {
 int  register_pstore_blk(struct pstore_blk_info *info);
 void unregister_pstore_blk(unsigned int major);
 
+/**
+ * struct pstore_device_info - back-end pstore/blk driver structure.
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
+struct pstore_device_info {
+	unsigned long total_size;
+	unsigned int flags;
+	pstore_zone_read_op read;
+	pstore_zone_write_op write;
+	pstore_zone_erase_op erase;
+	pstore_zone_write_op panic_write;
+};
+
+int  register_pstore_device(struct pstore_device_info *dev);
+void unregister_pstore_device(struct pstore_device_info *dev);
+
 /**
  * struct pstore_blk_config - the pstore_blk backend configuration
  *
diff --git a/include/linux/pstore_zone.h b/include/linux/pstore_zone.h
index e79a18e41064..1e35eaa33e5e 100644
--- a/include/linux/pstore_zone.h
+++ b/include/linux/pstore_zone.h
@@ -7,6 +7,7 @@
 
 typedef ssize_t (*pstore_zone_read_op)(char *, size_t, loff_t);
 typedef ssize_t (*pstore_zone_write_op)(const char *, size_t, loff_t);
+typedef ssize_t (*pstore_zone_erase_op)(size_t, loff_t);
 /**
  * struct pstore_zone_info - pstore/zone back-end driver structure
  *
@@ -27,6 +28,10 @@ typedef ssize_t (*pstore_zone_write_op)(const char *, size_t, loff_t);
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
 	pstore_zone_read_op read;
 	pstore_zone_write_op write;
+	pstore_zone_erase_op erase;
 	pstore_zone_write_op panic_write;
 };
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
