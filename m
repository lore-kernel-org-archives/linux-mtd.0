Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BB6C352A2
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 12:28:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A74020720
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 12:28:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="et9reH0Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A74020720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=erhoXCGBXCkK1WVF5vJ0awB+A3RkAidPVlHXIIUE87s=; b=et9reH0QcCWvyIoIsVTPzkZP9V
	GBh2cOpGjgm5nC1mQhNKCwP336TMdbAXlMqVpBmxDmSS1ZzOEluY2WTY9PX/epA7bG89MsO+yBM23
	B8RKJnBun8My6SwIICXiXL8hm/nTKHcWxpG+XhaGdJNHSxH4sx+qBCWgwmZ0sCA1D5xRHapyLF4lD
	P/+jkn2+rHFwdUHc+nE3XlDuqvewzNtQQkdvmqnuKAF+2zAZNkWgoOT/oOmT0pteD6HVXQTPBMM2t
	n+NXFD4tiPmbfGwRZyYWkuVLFc5ufaAORLix3olR+e/ePyQiJ2n7NUjw2R+OjOz2t+BawmESvH0Jr
	4bKqbr3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j02kZ-0005Bk-V1; Fri, 07 Feb 2020 12:28:47 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j02iE-0002rS-3e
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 12:26:26 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06713013|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.234295-0.0201346-0.74557;
 DS=CONTINUE|ham_system_inform|0.0919446-0.0026769-0.905378;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03309; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.GlaQplc_1581078351; 
Received: from
 PC-liaoweixiong.allwinnertech.com(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.GlaQplc_1581078351)
 by smtp.aliyun-inc.com(10.147.41.137);
 Fri, 07 Feb 2020 20:26:06 +0800
From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v2 08/11] blkoops: respect for device to pick recorders
Date: Fri,  7 Feb 2020 20:25:52 +0800
Message-Id: <1581078355-19647-9-git-send-email-liaoweixiong@allwinnertech.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_042622_795256_930850AF 
X-CRM114-Status: GOOD (  15.07  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

It's one of a series of patches for adaptive to MTD device.

MTD device is not block device. The sector of flash (MTD device) will be
broken if erase over limited cycles. Avoid damaging block so fast, we
can not write to a sector frequently. So, the recorders of pstore/blk
like console and ftrace recorder should not be supported.

Besides, mtd device need aligned write/erase size. To avoid
over-erasing/writing flash, we should keep a aligned cache and read old
data to cache before write/erase, which make codes more complex. So,
pmsg do not be supported now because it writes misaligned.

How about dmesg? Luckly, pstore/blk keeps several aligned chunks for
dmesg and uses one by one for wear balance.

So, MTD device for pstore should pick recorders, that is why the patch
here.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
---
 Documentation/admin-guide/pstore-block.rst |  9 +++++++++
 fs/pstore/blkoops.c                        | 29 +++++++++++++++++++++--------
 include/linux/blkoops.h                    | 14 +++++++++++++-
 3 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/pstore-block.rst b/Documentation/admin-guide/pstore-block.rst
index be865dfc1a28..299142b3d8e6 100644
--- a/Documentation/admin-guide/pstore-block.rst
+++ b/Documentation/admin-guide/pstore-block.rst
@@ -166,6 +166,15 @@ It is only required by block device which is registered by
 ``blkoops_register_blkdev``.  It's the major device number of registered
 devices, by which blkoops can get the matching driver for @blkdev.
 
+flags
+~~~~~
+
+Refer to macro starting with *BLKOOPS_DEV_SUPPORT_* which is defined in
+*linux/blkoops.h*. They tell us that which pstore/blk recorders this device
+supports. Default zero means all recorders for compatible, witch is the same
+as BLKOOPS_DEV_SUPPORT_ALL. Recorder works only when chunk size is not zero
+and device support.
+
 total_size
 ~~~~~~~~~~
 
diff --git a/fs/pstore/blkoops.c b/fs/pstore/blkoops.c
index c76bab671b0b..01170b344f00 100644
--- a/fs/pstore/blkoops.c
+++ b/fs/pstore/blkoops.c
@@ -128,9 +128,16 @@ int blkoops_register_device(struct blkoops_device *bo_dev)
 		return -ENOMEM;
 	}
 
-#define verify_size(name, defsize, alignsize) {				\
-		long _##name_ = (name);					\
-		if (_##name_ < 0)					\
+	/* zero means all recorders for compatible */
+	if (bo_dev->flags == BLKOOPS_DEV_SUPPORT_DEFAULT)
+		bo_dev->flags = BLKOOPS_DEV_SUPPORT_ALL;
+#define verify_size(name, defsize, alignsize, enable) {			\
+		long _##name_;						\
+		if (!(enable))						\
+			_##name_ = 0;					\
+		else if ((name) >= 0)					\
+			_##name_ = (name);				\
+		else							\
 			_##name_ = (defsize);				\
 		_##name_ = _##name_ <= 0 ? 0 : (_##name_ * 1024);	\
 		if (_##name_ & ((alignsize) - 1)) {			\
@@ -142,10 +149,14 @@ int blkoops_register_device(struct blkoops_device *bo_dev)
 		bzinfo->name = _##name_;				\
 	}
 
-	verify_size(dmesg_size, DEFAULT_DMESG_SIZE, 4096);
-	verify_size(pmsg_size, DEFAULT_PMSG_SIZE, 4096);
-	verify_size(console_size, DEFAULT_CONSOLE_SIZE, 4096);
-	verify_size(ftrace_size, DEFAULT_FTRACE_SIZE, 4096);
+	verify_size(dmesg_size, DEFAULT_DMESG_SIZE, 4096,
+			bo_dev->flags & BLKOOPS_DEV_SUPPORT_DMESG);
+	verify_size(pmsg_size, DEFAULT_PMSG_SIZE, 4096,
+			bo_dev->flags & BLKOOPS_DEV_SUPPORT_PMSG);
+	verify_size(console_size, DEFAULT_CONSOLE_SIZE, 4096,
+			bo_dev->flags & BLKOOPS_DEV_SUPPORT_CONSOLE);
+	verify_size(ftrace_size, DEFAULT_FTRACE_SIZE, 4096,
+			bo_dev->flags & BLKOOPS_DEV_SUPPORT_FTRACE);
 #undef verify_size
 	dump_oops = !!(dump_oops < 0 ? DEFAULT_DUMP_OOPS : dump_oops);
 
@@ -336,6 +347,7 @@ static ssize_t blkoops_blk_panic_write(const char *buf, size_t size,
  * register block device to blkoops
  * @major: the major device number of registering device
  * @panic_write: the write interface for panic case.
+ * @flags: Refer to macro starting with BLKOOPS_DEV_SUPPORT.
  *
  * It is ONLY used for block device to register to blkoops. In this case,
  * the module parameter @blkdev must be valid. Generic read/write interfaces
@@ -349,7 +361,7 @@ static ssize_t blkoops_blk_panic_write(const char *buf, size_t size,
  * panic occurs but pstore/blk does not recover yet, the first zone of dmesg
  * will be used.
  */
-int blkoops_register_blkdev(unsigned int major,
+int blkoops_register_blkdev(unsigned int major, unsigned int flags,
 		blkoops_blk_panic_write_op panic_write)
 {
 	struct block_device *bdev;
@@ -372,6 +384,7 @@ int blkoops_register_blkdev(unsigned int major,
 	if (bo_dev.total_size == 0)
 		goto err_put_bdev;
 	bo_dev.panic_write = panic_write ? blkoops_blk_panic_write : NULL;
+	bo_dev.flags = flags;
 	bo_dev.read = blkoops_generic_blk_read;
 	bo_dev.write = blkoops_generic_blk_write;
 
diff --git a/include/linux/blkoops.h b/include/linux/blkoops.h
index 71c596fd4cc8..bc7665d14a98 100644
--- a/include/linux/blkoops.h
+++ b/include/linux/blkoops.h
@@ -6,6 +6,7 @@
 #include <linux/types.h>
 #include <linux/blkdev.h>
 #include <linux/pstore_blk.h>
+#include <linux/bitops.h>
 
 /**
  * struct blkoops_device - backend blkoops driver structure.
@@ -14,6 +15,10 @@
  * blkoops_register_device(). If block device, you are strongly recommended
  * to use blkoops_register_blkdev().
  *
+ * @flags:
+ *	Refer to macro starting with BLKOOPS_DEV_SUPPORT_. These macros tell
+ *	us that which pstore/blk recorders this device supports. Zero means
+ *	all recorders for compatible.
  * @total_size:
  *	The total size in bytes pstore/blk can use. It must be greater than
  *	4096 and be multiple of 4096.
@@ -38,6 +43,13 @@
  *	On error, negative number should be returned.
  */
 struct blkoops_device {
+	unsigned int flags;
+#define BLKOOPS_DEV_SUPPORT_ALL		UINT_MAX
+#define BLKOOPS_DEV_SUPPORT_DEFAULT	(0)
+#define BLKOOPS_DEV_SUPPORT_DMESG	BIT(0)
+#define BLKOOPS_DEV_SUPPORT_PMSG	BIT(1)
+#define BLKOOPS_DEV_SUPPORT_CONSOLE	BIT(2)
+#define BLKOOPS_DEV_SUPPORT_FTRACE	BIT(3)
 	unsigned long total_size;
 	blkz_read_op read;
 	blkz_write_op write;
@@ -54,7 +66,7 @@ typedef int (*blkoops_blk_panic_write_op)(const char *buf, sector_t start_sect,
 
 int  blkoops_register_device(struct blkoops_device *bo_dev);
 void blkoops_unregister_device(struct blkoops_device *bo_dev);
-int  blkoops_register_blkdev(unsigned int major,
+int  blkoops_register_blkdev(unsigned int major, unsigned int flags,
 		blkoops_blk_panic_write_op panic_write);
 void blkoops_unregister_blkdev(unsigned int major);
 int  blkoops_blkdev_info(dev_t *devt, sector_t *nr_sects, sector_t *start_sect);
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
