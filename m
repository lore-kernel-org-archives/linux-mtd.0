Return-Path: <SRS0=11ri=LJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104DAC48BDF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 22:49:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B88F06128C
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 22:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B88F06128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vP9V0hOlwBSJnNFviWdY0Kw5d/BfEcPgBIxDtxeNHH4=; b=Kolqu/hUJJNKdY
	LI0U2Wq+mkoSMm3N2W8o1V0IwvE/kcjcERVncdw1k4pery5j7iCnBV22qhYhyeGY6G3+q17C+runW
	oEc6p7IWsavP2KTTRu+a3tdnurcQ6HF1ozMxLFDIDSxg4Tk8BIlXZG5cajc5QP8CSpDdRWpDP7IUF
	33i4IdYs/cqHKCrQg6PnGRWmxMltfcgtz1O9k2h2PoxI1GFUY5FDrpXjeeAsQur0ipBBQZo5LxeMw
	Lj8T6nKHANEXX609TvECZEKFp3kMvskDjqXsZGHxJmmBQQ9KsV0jlpg9K5mdQ1oqcTe7TVHoeppwI
	Gu9YJThgeIcXX84slCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltHrR-003gvd-GG; Tue, 15 Jun 2021 22:48:45 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltGUv-0036hl-S0
 for linux-mtd@lists.infradead.org; Tue, 15 Jun 2021 21:21:28 +0000
Received: by mail-pg1-x52c.google.com with SMTP id v7so165892pgl.2
 for <linux-mtd@lists.infradead.org>; Tue, 15 Jun 2021 14:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VgP/ujDj3JOk9fd8Bd57+T3WUDHouG7B5z46L4i6NYk=;
 b=JsVqLuvGYu2mYwxAtS146TEaTAE+aXtV/flGvHdgjCdhwD/TGJXes14dzW77cFf9IO
 4TzkvbFKZLRybxL5z2TxRDe4kKwYbiF8d74LVJta40kjKWyHWw7xjYh+eJF1PMVlLJ8Y
 m+FTJAJNmm5SjpdZ4gS8AN2vgtpAERBAnU9S8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VgP/ujDj3JOk9fd8Bd57+T3WUDHouG7B5z46L4i6NYk=;
 b=RirVY+AXIDZrCfla/wKgqQKND+62spDq2C3bkhBtT7t19+pWS03+q/UgrNCrr2azHw
 XPXujbFUPjC/ROoF2AYIio9csWSbmNTIwxm+M6plUflHXkRBpqdBIZ0ETMyFpeX1LN2n
 RyPlmtKUgIoOWywSO1faukJlWS1VvSn/8PrVsyV7jeJU+dpyHtTMS4VMANre3Be8/vL5
 fCWcD25P7bjObHfl0WRLmuxP2URfo1q3BpQt21p74Y8vsrrnf/r17blClmynsjKLLSTV
 hu8m0UaTQg9xFepqQK0YXfywsBiOtTiHQrT790F9xbKPSQxicFd/Rskx5HImxk54Z6Wa
 Wrfg==
X-Gm-Message-State: AOAM532sy9SxWZYZh+B7F3K6dgC3yNbTbCDI3nKwmJGXB4odoj66SHY6
 sJMOpWR/glJhmtRt3S/l2aLXWg==
X-Google-Smtp-Source: ABdhPJzfR0w4R6t/DNCrToE0zmEQPHUj7ZB04C22NS6NT9qyFsk1r2gCMRAOcClCy+TIfI3xzK2nEA==
X-Received: by 2002:a63:1c0a:: with SMTP id c10mr1480858pgc.306.1623792084311; 
 Tue, 15 Jun 2021 14:21:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d22sm55073pgb.15.2021.06.15.14.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 14:21:23 -0700 (PDT)
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
Subject: [PATCH v2 2/4] pstore/blk: Use the normal block device I/O path
Date: Tue, 15 Jun 2021 14:21:19 -0700
Message-Id: <20210615212121.1200820-3-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615212121.1200820-1-keescook@chromium.org>
References: <20210615212121.1200820-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=ce419b191f409d79c00afbb68a6ff8fff3d7fc44;
 i=SsOtgEq5qb4nZxhHBpq4SPkuFKirt6TdeGDEanJT//k=;
 m=AX20vtCwKnCA9lIRJQ6C3o1nYyFB2hBR6BVOnkiJdKA=;
 p=9gk70/7/z6XITBmbxTi/U6pZ/ZxycvfUbcloTA9Hj8M=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmDJGdAACgkQiXL039xtwCamshAAmSQ
 3hCEjnYiThOdJjPw57ZAOy8kw7cbbIk/lFC3Pmin2uDJNeIRc7HmBYGgpVliiq/Aw3yFOzLnRjVSX
 QHKduRGvoYPAUufJIvD2Q2+d5qxOkqwMaFATQKBUjgX661dO7Y/FZoYkpwKspPowP/mt3UJGmJbJL
 Ns8c20TwggjKt3aWUzD3riNWArIsz/ohIfY4uRGoB11aE5BW4l6MRPe1uCYum2jcykD3+C9L/lJ5A
 IEHOj9v0G/xJ7mDhgt1hUPdYnBidwbHVnxUailTuyc3kbu47rueUEnp2tp1p/yDCsmmg2arU2CU2/
 XRK9u1BkdVhB90GDcYqFrhNXPBRZvMka2MOZu0U7r/LgW1o01Eko0bP7x2pznyW40T7yRmi6qjbvA
 Z9PTzzw0CiFWgDj+AtjQps7leVobqYixiNM6ZEI8AsTt4Xppf4FHtv57JRMk9IybqmL4Mqa0hISo7
 vQiJNh8SPSaFMmGtCsqgv61ObZ3UD8xcM6wqMJa8wEfso9DurXQRnJT4HKiTjDxzSsEvYS/Urf2yI
 Ql81uUGbaaA+L01DqzN7POoDBBuS3rIF0TFGJVd8LGHGyMtD/ZgAql+wZG8qq4IRxigjnIfFZxcuc
 +4UyWKgTbEzw7Y339DNldPIjvZKI5Wf8+TtZNX0Qkh9XPi93fZLxeEfaD+NikMz4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_142125_994841_4DF5BAB8 
X-CRM114-Status: GOOD (  32.31  )
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

Stop poking into block layer internals and just open the block device
file an use kernel_read and kernel_write on it. Note that this means
the transformation from name_to_dev_t can't be used anymore when
pstore_blk is loaded as a module: a full filesystem device path name
must be used instead.

Co-developed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/blk.c | 261 +++++++++++++++---------------------------------
 1 file changed, 80 insertions(+), 181 deletions(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 91d7a848c85b..8f5bd656cc2d 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -8,15 +8,16 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include "../../block/blk.h"
 #include <linux/blkdev.h>
 #include <linux/string.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/pstore_blk.h>
+#include <linux/fs.h>
+#include <linux/file.h>
+#include <linux/init_syscalls.h>
 #include <linux/mount.h>
-#include <linux/uio.h>
 
 static long kmsg_size = CONFIG_PSTORE_BLK_KMSG_SIZE;
 module_param(kmsg_size, long, 0400);
@@ -60,23 +61,25 @@ MODULE_PARM_DESC(best_effort, "use best effort to write (i.e. do not require sto
  *
  * Usually, this will be a partition of a block device.
  *
- * blkdev accepts the following variants:
- * 1) <hex_major><hex_minor> device number in hexadecimal representation,
- *    with no leading 0x, for example b302.
- * 2) /dev/<disk_name> represents the device number of disk
- * 3) /dev/<disk_name><decimal> represents the device number
+ * blkdev accepts the following variants, when built as a module:
+ * 1) /dev/<disk_name> represents the device number of disk
+ * 2) /dev/<disk_name><decimal> represents the device number
  *    of partition - device number of disk plus the partition number
- * 4) /dev/<disk_name>p<decimal> - same as the above, that form is
+ * 3) /dev/<disk_name>p<decimal> - same as the above, that form is
  *    used when disk name of partitioned disk ends on a digit.
- * 5) PARTUUID=00112233-4455-6677-8899-AABBCCDDEEFF representing the
+ *
+ * blkdev accepts the following variants when built into the kernel:
+ * 1) <hex_major><hex_minor> device number in hexadecimal representation,
+ *    with no leading 0x, for example b302.
+ * 2) PARTUUID=00112233-4455-6677-8899-AABBCCDDEEFF representing the
  *    unique id of a partition if the partition table provides it.
  *    The UUID may be either an EFI/GPT UUID, or refer to an MSDOS
  *    partition using the format SSSSSSSS-PP, where SSSSSSSS is a zero-
  *    filled hex representation of the 32-bit "NT disk signature", and PP
  *    is a zero-filled hex representation of the 1-based partition number.
- * 6) PARTUUID=<UUID>/PARTNROFF=<int> to select a partition in relation to
+ * 3) PARTUUID=<UUID>/PARTNROFF=<int> to select a partition in relation to
  *    a partition with a known unique id.
- * 7) <major>:<minor> major and minor number of the device separated by
+ * 4) <major>:<minor> major and minor number of the device separated by
  *    a colon.
  */
 static char blkdev[80] = CONFIG_PSTORE_BLK_BLKDEV;
@@ -88,15 +91,9 @@ MODULE_PARM_DESC(blkdev, "block device for pstore storage");
  * during the register/unregister functions.
  */
 static DEFINE_MUTEX(pstore_blk_lock);
-static struct block_device *psblk_bdev;
+static struct file *psblk_file;
 static struct pstore_zone_info *pstore_zone_info;
 
-struct bdev_info {
-	dev_t devt;
-	sector_t nr_sects;
-	sector_t start_sect;
-};
-
 #define check_size(name, alignsize) ({				\
 	long _##name_ = (name);					\
 	_##name_ = _##name_ <= 0 ? 0 : (_##name_ * 1024);	\
@@ -216,203 +213,70 @@ void unregister_pstore_device(struct pstore_device_info *dev)
 }
 EXPORT_SYMBOL_GPL(unregister_pstore_device);
 
-/**
- * psblk_get_bdev() - open block device
- *
- * @holder:	Exclusive holder identifier
- * @info:	Information about bdev to fill in
- *
- * Return: pointer to block device on success and others on error.
- *
- * On success, the returned block_device has reference count of one.
- */
-static struct block_device *psblk_get_bdev(void *holder,
-					   struct bdev_info *info)
-{
-	struct block_device *bdev = ERR_PTR(-ENODEV);
-	fmode_t mode = FMODE_READ | FMODE_WRITE;
-	sector_t nr_sects;
-
-	lockdep_assert_held(&pstore_blk_lock);
-
-	if (pstore_zone_info)
-		return ERR_PTR(-EBUSY);
-
-	if (!blkdev[0])
-		return ERR_PTR(-ENODEV);
-
-	if (holder)
-		mode |= FMODE_EXCL;
-	bdev = blkdev_get_by_path(blkdev, mode, holder);
-	if (IS_ERR(bdev)) {
-		dev_t devt;
-
-		devt = name_to_dev_t(blkdev);
-		if (devt == 0)
-			return ERR_PTR(-ENODEV);
-		bdev = blkdev_get_by_dev(devt, mode, holder);
-		if (IS_ERR(bdev))
-			return bdev;
-	}
-
-	nr_sects = bdev_nr_sectors(bdev);
-	if (!nr_sects) {
-		pr_err("not enough space for '%s'\n", blkdev);
-		blkdev_put(bdev, mode);
-		return ERR_PTR(-ENOSPC);
-	}
-
-	if (info) {
-		info->devt = bdev->bd_dev;
-		info->nr_sects = nr_sects;
-		info->start_sect = get_start_sect(bdev);
-	}
-
-	return bdev;
-}
-
-static void psblk_put_bdev(struct block_device *bdev, void *holder)
-{
-	fmode_t mode = FMODE_READ | FMODE_WRITE;
-
-	lockdep_assert_held(&pstore_blk_lock);
-
-	if (!bdev)
-		return;
-
-	if (holder)
-		mode |= FMODE_EXCL;
-	blkdev_put(bdev, mode);
-}
-
 static ssize_t psblk_generic_blk_read(char *buf, size_t bytes, loff_t pos)
 {
-	struct block_device *bdev = psblk_bdev;
-	struct file file;
-	struct kiocb kiocb;
-	struct iov_iter iter;
-	struct kvec iov = {.iov_base = buf, .iov_len = bytes};
-
-	if (!bdev)
-		return -ENODEV;
-
-	memset(&file, 0, sizeof(struct file));
-	file.f_mapping = bdev->bd_inode->i_mapping;
-	file.f_flags = O_DSYNC | __O_SYNC | O_NOATIME;
-	file.f_inode = bdev->bd_inode;
-	file_ra_state_init(&file.f_ra, file.f_mapping);
-
-	init_sync_kiocb(&kiocb, &file);
-	kiocb.ki_pos = pos;
-	iov_iter_kvec(&iter, READ, &iov, 1, bytes);
-
-	return generic_file_read_iter(&kiocb, &iter);
+	return kernel_read(psblk_file, buf, bytes, &pos);
 }
 
 static ssize_t psblk_generic_blk_write(const char *buf, size_t bytes,
 		loff_t pos)
 {
-	struct block_device *bdev = psblk_bdev;
-	struct iov_iter iter;
-	struct kiocb kiocb;
-	struct file file;
-	ssize_t ret;
-	struct kvec iov = {.iov_base = (void *)buf, .iov_len = bytes};
-
-	if (!bdev)
-		return -ENODEV;
-
 	/* Console/Ftrace backend may handle buffer until flush dirty zones */
 	if (in_interrupt() || irqs_disabled())
 		return -EBUSY;
-
-	memset(&file, 0, sizeof(struct file));
-	file.f_mapping = bdev->bd_inode->i_mapping;
-	file.f_flags = O_DSYNC | __O_SYNC | O_NOATIME;
-	file.f_inode = bdev->bd_inode;
-
-	init_sync_kiocb(&kiocb, &file);
-	kiocb.ki_pos = pos;
-	iov_iter_kvec(&iter, WRITE, &iov, 1, bytes);
-
-	inode_lock(bdev->bd_inode);
-	ret = generic_write_checks(&kiocb, &iter);
-	if (ret > 0)
-		ret = generic_perform_write(&file, &iter, pos);
-	inode_unlock(bdev->bd_inode);
-
-	if (likely(ret > 0)) {
-		const struct file_operations f_op = {.fsync = blkdev_fsync};
-
-		file.f_op = &f_op;
-		kiocb.ki_pos += ret;
-		ret = generic_write_sync(&kiocb, ret);
-	}
-	return ret;
+	return kernel_write(psblk_file, buf, bytes, &pos);
 }
 
 /*
  * This takes its configuration only from the module parameters now.
- * See psblk_get_bdev() and blkdev.
  */
-static int __register_pstore_blk(void)
+static int __register_pstore_blk(const char *devpath)
 {
-	char bdev_name[BDEVNAME_SIZE];
-	struct block_device *bdev;
-	struct pstore_device_info dev;
-	struct bdev_info binfo;
-	void *holder = blkdev;
+	struct pstore_device_info dev = {
+		.read = psblk_generic_blk_read,
+		.write = psblk_generic_blk_write,
+	};
 	int ret = -ENODEV;
 
 	lockdep_assert_held(&pstore_blk_lock);
 
-	/* hold bdev exclusively */
-	memset(&binfo, 0, sizeof(binfo));
-	bdev = psblk_get_bdev(holder, &binfo);
-	if (IS_ERR(bdev)) {
-		pr_err("failed to open '%s'!\n", blkdev);
-		return PTR_ERR(bdev);
+	psblk_file = filp_open(devpath, O_RDWR | O_DSYNC | O_NOATIME | O_EXCL, 0);
+	if (IS_ERR(psblk_file)) {
+		ret = PTR_ERR(psblk_file);
+		pr_err("failed to open '%s': %d!\n", devpath, ret);
+		goto err;
 	}
 
-	/* only allow driver matching the @blkdev */
-	if (!binfo.devt) {
-		pr_debug("no major\n");
-		ret = -ENODEV;
-		goto err_put_bdev;
+	if (!S_ISBLK(file_inode(psblk_file)->i_mode)) {
+		pr_err("'%s' is not block device!\n", devpath);
+		goto err_fput;
 	}
 
-	/* psblk_bdev must be assigned before register to pstore/blk */
-	psblk_bdev = bdev;
-
-	memset(&dev, 0, sizeof(dev));
-	dev.total_size = binfo.nr_sects << SECTOR_SHIFT;
-	dev.read = psblk_generic_blk_read;
-	dev.write = psblk_generic_blk_write;
+	dev.total_size = i_size_read(I_BDEV(psblk_file->f_mapping->host)->bd_inode);
 
 	ret = __register_pstore_device(&dev);
 	if (ret)
-		goto err_put_bdev;
+		goto err_fput;
 
-	bdevname(bdev, bdev_name);
-	pr_info("attached %s (no dedicated panic_write!)\n", bdev_name);
 	return 0;
 
-err_put_bdev:
-	psblk_bdev = NULL;
-	psblk_put_bdev(bdev, holder);
+err_fput:
+	fput(psblk_file);
+err:
+	psblk_file = NULL;
+
 	return ret;
 }
 
-static void __unregister_pstore_blk(unsigned int major)
+static void __unregister_pstore_blk(struct file *device)
 {
 	struct pstore_device_info dev = { .read = psblk_generic_blk_read };
-	void *holder = blkdev;
 
 	lockdep_assert_held(&pstore_blk_lock);
-	if (psblk_bdev && MAJOR(psblk_bdev->bd_dev) == major) {
+	if (psblk_file && psblk_file == device) {
 		__unregister_pstore_device(&dev);
-		psblk_put_bdev(psblk_bdev, holder);
-		psblk_bdev = NULL;
+		fput(psblk_file);
+		psblk_file = NULL;
 	}
 }
 
@@ -430,13 +294,48 @@ int pstore_blk_get_config(struct pstore_blk_config *info)
 }
 EXPORT_SYMBOL_GPL(pstore_blk_get_config);
 
+
+#ifndef MODULE
+static const char devname[] = "/dev/pstore-blk";
+static __init const char *early_boot_devpath(const char *initial_devname)
+{
+	/*
+	 * During early boot the real root file system hasn't been
+	 * mounted yet, and no device nodes are present yet. Use the
+	 * same scheme to find the device that we use for mounting
+	 * the root file system.
+	 */
+	dev_t dev = name_to_dev_t(initial_devname);
+
+	if (!dev) {
+		pr_err("failed to resolve '%s'!\n", initial_devname);
+		return initial_devname;
+	}
+
+	init_unlink(devname);
+	init_mknod(devname, S_IFBLK | 0600, new_encode_dev(dev));
+
+	return devname;
+}
+#else
+static inline const char *early_boot_devpath(const char *initial_devname)
+{
+	return initial_devname;
+}
+#endif
+
 static int __init pstore_blk_init(void)
 {
 	int ret = 0;
 
 	mutex_lock(&pstore_blk_lock);
-	if (!pstore_zone_info && best_effort && blkdev[0])
-		ret = __register_pstore_blk();
+	if (!pstore_zone_info && best_effort && blkdev[0]) {
+		ret = __register_pstore_blk(early_boot_devpath(blkdev));
+		if (ret == 0 && pstore_zone_info)
+			pr_info("attached %s:%s (%zu) (no dedicated panic_write!)\n",
+				pstore_zone_info->name, blkdev,
+				pstore_zone_info->total_size);
+	}
 	mutex_unlock(&pstore_blk_lock);
 
 	return ret;
@@ -446,8 +345,8 @@ late_initcall(pstore_blk_init);
 static void __exit pstore_blk_exit(void)
 {
 	mutex_lock(&pstore_blk_lock);
-	if (psblk_bdev)
-		__unregister_pstore_blk(MAJOR(psblk_bdev->bd_dev));
+	if (psblk_file)
+		__unregister_pstore_blk(psblk_file);
 	else {
 		struct pstore_device_info dev = { };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
