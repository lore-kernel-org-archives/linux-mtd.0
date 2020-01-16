Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F35C33CB1
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 10:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AAC82073A
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 10:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gkp3u4oH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AAC82073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Hg+e/mYm/cVNIO1JIimZtuCXeVC5Ah0G4rDYbNzwBag=; b=Gkp3u4oHETD4Pmyw6AkkhF+62N
	rs1fYq8j02CPxFZjW9j1T/iEP2nwphE4GfVloIgY14xM4gs5lbeRJ1BDHnG11ofhaAz4tmbTRR/ha
	NWLjPEXKbI2R2DYAYL5gNqz0UFmA5hj4/14WktK60g758c8XOb+hAYEz4+NjoP1fu4pmzxuG2ZEGW
	9dxOCxUWBKZ9gulbvdoGG9q50DFSpQfSasrbkzbzfVbdc/PHfokJbm3Rq+EizXA4hFA5tb6qIZlyW
	rSmcP28jG59Ddd6B3MltwHtK/9vATRwLLIVWGX+Trzd7YwBk/qNpiuT6MtfcPrcCWwAuGwj8FJIQF
	HhiOySaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is20H-000868-Rl; Thu, 16 Jan 2020 10:03:53 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is1xv-00062J-TA
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2020 10:01:36 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06712966|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.405886-0.0232577-0.570856;
 DS=CONTINUE|ham_regular_dialog|0.0837547-0.000396562-0.915849;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03309; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.Gd3Kgdg_1579168866; 
Received: from
 PC-liaoweixiong.allwinnertech.com(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.Gd3Kgdg_1579168866)
 by smtp.aliyun-inc.com(10.147.42.241);
 Thu, 16 Jan 2020 18:01:23 +0800
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
Subject: [PATCH 09/11] pstore/blk: blkoops: support special removing jobs for
 dmesg.
Date: Thu, 16 Jan 2020 18:00:29 +0800
Message-Id: <1579168831-16399-10-git-send-email-liaoweixiong@allwinnertech.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1579168831-16399-1-git-send-email-liaoweixiong@allwinnertech.com>
References: <1579168831-16399-1-git-send-email-liaoweixiong@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_020128_154397_59CBF3AD 
X-CRM114-Status: GOOD (  14.51  )
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

MTD device is not block device. To write to flash device on MTD, erase
must to be done before. However, pstore/blk just set datalen as 0 when
remove, which is not enough for mtd device. That's why this patch here,
to support special jobs when removing pstore/blk record.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
---
 Documentation/admin-guide/pstore-block.rst |  9 +++++++++
 fs/pstore/blkoops.c                        |  4 +++-
 fs/pstore/blkzone.c                        |  9 ++++++++-
 include/linux/blkoops.h                    | 10 ++++++++++
 include/linux/pstore_blk.h                 | 11 +++++++++++
 5 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/pstore-block.rst b/Documentation/admin-guide/pstore-block.rst
index f4fc205406aa..e351b0ebd8e5 100644
--- a/Documentation/admin-guide/pstore-block.rst
+++ b/Documentation/admin-guide/pstore-block.rst
@@ -197,6 +197,15 @@ negative number will be returned. The following return numbers mean more:
 1. -EBUSY: pstore/blk should try again later.
 #. -ENEXT: this zone is used or broken, pstore/blk should try next one.
 
+erase
+~~~~~
+
+It's generic erase API for pstore/blk, which is requested by non-block device.
+It will be called while pstore record is removing. It's required only when the
+device has special removing jobs. For example, MTD device tries to erase block.
+
+Normally zero should be returned, otherwise it indicates an error.
+
 panic_write (for non-block device)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/fs/pstore/blkoops.c b/fs/pstore/blkoops.c
index 85008a839a17..3d57a3126c7b 100644
--- a/fs/pstore/blkoops.c
+++ b/fs/pstore/blkoops.c
@@ -179,6 +179,7 @@ int blkoops_register_device(struct blkoops_device *bo_dev)
 	bzinfo->dump_oops = dump_oops;
 	bzinfo->read = bo_dev->read;
 	bzinfo->write = bo_dev->write;
+	bzinfo->erase = bo_dev->erase;
 	bzinfo->panic_write = bo_dev->panic_write;
 	bzinfo->name = "blkoops";
 	bzinfo->owner = THIS_MODULE;
@@ -398,10 +399,11 @@ int blkoops_register_blkdev(unsigned int major, unsigned int flags,
 	bo_dev.total_size = blkoops_bdev_size(bdev);
 	if (bo_dev.total_size == 0)
 		goto err_put_bdev;
-	bo_dev.panic_write = panic_write ? blkoops_blk_panic_write : NULL;
 	bo_dev.flags = flags;
 	bo_dev.read = blkoops_generic_blk_read;
 	bo_dev.write = blkoops_generic_blk_write;
+	bo_dev.erase = NULL;
+	bo_dev.panic_write = panic_write ? blkoops_blk_panic_write : NULL;
 
 	ret = blkoops_register_device(&bo_dev);
 	if (ret)
diff --git a/fs/pstore/blkzone.c b/fs/pstore/blkzone.c
index 7c6bf14f7e7d..46f7aff07ffe 100644
--- a/fs/pstore/blkzone.c
+++ b/fs/pstore/blkzone.c
@@ -608,11 +608,18 @@ static inline bool blkz_ok(struct blkz_zone *zone)
 static inline int blkz_dmesg_erase(struct blkz_context *cxt,
 		struct blkz_zone *zone)
 {
+	size_t size;
+
 	if (unlikely(!blkz_ok(zone)))
 		return 0;
 
 	atomic_set(&zone->buffer->datalen, 0);
-	return blkz_zone_write(zone, FLUSH_META, NULL, 0, 0);
+
+	size = buffer_datalen(zone) + sizeof(*zone->buffer);
+	if (cxt->bzinfo->erase)
+		return cxt->bzinfo->erase(size, zone->off);
+	else
+		return blkz_zone_write(zone, FLUSH_META, NULL, 0, 0);
 }
 
 static inline int blkz_record_erase(struct blkz_context *cxt,
diff --git a/include/linux/blkoops.h b/include/linux/blkoops.h
index bc7665d14a98..11cb3036ad5f 100644
--- a/include/linux/blkoops.h
+++ b/include/linux/blkoops.h
@@ -33,6 +33,15 @@
  *	number means more:
  *	  -EBUSY: pstore/blk should try again later.
  *	  -ENEXT: this zone is used or broken, pstore/blk should try next one.
+ * @erase:
+ *	The general (not panic) erase operation. It will be call while pstore
+ *	record is removing. It's required only when device have special
+ *	removing jobs, for example, MTD device try to erase block.
+ *
+ *	Both of the @size and @offset parameters on this interface are
+ *	the relative size of the space provided, not the whole disk/flash.
+ *
+ *	On success, 0 should be returned. Others mean error.
  * @panic_write:
  *	The write operation only used for panic.
  *
@@ -53,6 +62,7 @@ struct blkoops_device {
 	unsigned long total_size;
 	blkz_read_op read;
 	blkz_write_op write;
+	blkz_erase_op erase;
 	blkz_write_op panic_write;
 };
 
diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
index bbbe4fe37f7c..9641969f888f 100644
--- a/include/linux/pstore_blk.h
+++ b/include/linux/pstore_blk.h
@@ -46,6 +46,15 @@
  *	number means more:
  *	  -EBUSY: pstore/blk should try again later.
  *	  -ENEXT: this zone is used or broken, pstore/blk should try next one.
+ * @erase:
+ *	The general (not panic) erase operation. It will be call while pstore
+ *	record is removing. It's required only when device have special
+ *	removing jobs, for example, MTD device try to erase block.
+ *
+ *	Both of the @size and @offset parameters on this interface are
+ *	the relative size of the space provided, not the whole disk/flash.
+ *
+ *	On success, 0 should be returned. Others mean error.
  * @panic_write:
  *	The write operation only used for panic. It's optional if you do not
  *	care panic record. If panic occur but blkzone do not recover yet, the
@@ -59,6 +68,7 @@
  */
 typedef ssize_t (*blkz_read_op)(char *, size_t, loff_t);
 typedef ssize_t (*blkz_write_op)(const char *, size_t, loff_t);
+typedef ssize_t (*blkz_erase_op)(size_t, loff_t);
 struct blkz_info {
 	struct module *owner;
 	const char *name;
@@ -71,6 +81,7 @@ struct blkz_info {
 	int dump_oops;
 	blkz_read_op read;
 	blkz_write_op write;
+	blkz_erase_op erase;
 	blkz_write_op panic_write;
 };
 
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
