Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F614C64E7A
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:19:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF8842467C
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:19:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VmtgdlX7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mnDJefE5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF8842467C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hQN4b4wjmGRr4KmsR7LzzjISF8TsDUmmu5TyXz7x3SM=; b=VmtgdlX77Nc7kyCSfsQBfCLrN
	SD+MP7xKuq5u+LCs4JrB/oay3Q4DtcmeHZaqoi9HJwImk27flaCM/TM2C5xPuu8hsjkBXfhR8xZgL
	5goqlqbP9BRWyDNqZkjNoOa5AMzJX3M/uZjjhU/QwqbirIw7+fOIfF/w/9fX+7fGCouQYhs4JvHQM
	IvggfYikwEKJtHkLO5Rlep7qHx5ds/vUZiwmEOJhxPk0VCpBjEBdgmo1uQDM6vIhfDw4xcKv3Hf9O
	tbCAF8h8b1rf3U3Ylp9brGgT90a+v7ViVa0oLS4gk9cdUtTn4UZLBrkE0nIGaN9QrQmc0/VWuMmOX
	goJKUbOzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj2vO-00021l-Jw; Sat, 28 Nov 2020 16:18:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2sv-0000pU-Fr
 for linux-mtd@merlin.infradead.org; Sat, 28 Nov 2020 16:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=aXV3aDcarMWm87S3K48qh326Jqh2T5iEz0okUiuykIU=; b=mnDJefE5ahlSIoE5urgBKySUIU
 uEPnl4x1lcSNMxaHfc9Ks85/A9bo2wCHhP4dN+YIeObfQgQwOzXlrHncvaxkUpDWBghClWDwXPUvM
 93fk/ibotGYTNi7/wsYCQFGtvoG9xZFesfX3WOe3IhjPcq/fxsiuSyhSkaFEGmD9wUdu2blFiWIer
 Vh8aIiXiMJB9Pyr/5lbQdP9erEVm9FZZPn5Qi1dFSZeDrNTddRfgOyf56jOWNAPQytejd6XoBYzbA
 xLehRf0mtTRdDlSJUqD+hM9eU6WfglKqH9fRCo2LqBXinPHL9vq000qd4I1rM4JDpKAS9aZOHCeLF
 1UN8nJhw==;
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2st-0000GO-Cm; Sat, 28 Nov 2020 16:15:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 17/45] init: refactor name_to_dev_t
Date: Sat, 28 Nov 2020 17:14:42 +0100
Message-Id: <20201128161510.347752-18-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128161510.347752-1-hch@lst.de>
References: <20201128161510.347752-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Split each case into a self-contained helper, and move the block
dependent code entirely under the pre-existing #ifdef CONFIG_BLOCK.
This allows to remove the blk_lookup_devt stub in genhd.h.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Acked-by: Tejun Heo <tj@kernel.org>
---
 include/linux/genhd.h |   7 +-
 init/do_mounts.c      | 183 +++++++++++++++++++++---------------------
 2 files changed, 91 insertions(+), 99 deletions(-)

diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 22f5b9fd96f8bf..ca5e356084c353 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -388,18 +388,13 @@ static inline void bd_unlink_disk_holder(struct block_device *bdev,
 }
 #endif /* CONFIG_SYSFS */
 
+dev_t blk_lookup_devt(const char *name, int partno);
 #ifdef CONFIG_BLOCK
 void printk_all_partitions(void);
-dev_t blk_lookup_devt(const char *name, int partno);
 #else /* CONFIG_BLOCK */
 static inline void printk_all_partitions(void)
 {
 }
-static inline dev_t blk_lookup_devt(const char *name, int partno)
-{
-	dev_t devt = MKDEV(0, 0);
-	return devt;
-}
 #endif /* CONFIG_BLOCK */
 
 #endif /* _LINUX_GENHD_H */
diff --git a/init/do_mounts.c b/init/do_mounts.c
index b5f9604d0c98a2..aef2f24461c7f1 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -90,7 +90,6 @@ static int match_dev_by_uuid(struct device *dev, const void *data)
 	return 0;
 }
 
-
 /**
  * devt_from_partuuid - looks up the dev_t of a partition by its UUID
  * @uuid_str:	char array containing ascii UUID
@@ -186,7 +185,83 @@ static int match_dev_by_label(struct device *dev, const void *data)
 
 	return 0;
 }
-#endif
+
+static dev_t devt_from_partlabel(const char *label)
+{
+	struct device *dev;
+	dev_t devt = 0;
+
+	dev = class_find_device(&block_class, NULL, label, &match_dev_by_label);
+	if (dev) {
+		devt = dev->devt;
+		put_device(dev);
+	}
+
+	return devt;
+}
+
+static dev_t devt_from_devname(const char *name)
+{
+	dev_t devt = 0;
+	int part;
+	char s[32];
+	char *p;
+
+	if (strlen(name) > 31)
+		return 0;
+	strcpy(s, name);
+	for (p = s; *p; p++) {
+		if (*p == '/')
+			*p = '!';
+	}
+
+	devt = blk_lookup_devt(s, 0);
+	if (devt)
+		return devt;
+
+	/*
+	 * Try non-existent, but valid partition, which may only exist after
+	 * opening the device, like partitioned md devices.
+	 */
+	while (p > s && isdigit(p[-1]))
+		p--;
+	if (p == s || !*p || *p == '0')
+		return 0;
+
+	/* try disk name without <part number> */
+	part = simple_strtoul(p, NULL, 10);
+	*p = '\0';
+	devt = blk_lookup_devt(s, part);
+	if (devt)
+		return devt;
+
+	/* try disk name without p<part number> */
+	if (p < s + 2 || !isdigit(p[-2]) || p[-1] != 'p')
+		return 0;
+	p[-1] = '\0';
+	return blk_lookup_devt(s, part);
+}
+#endif /* CONFIG_BLOCK */
+
+static dev_t devt_from_devnum(const char *name)
+{
+	unsigned maj, min, offset;
+	dev_t devt = 0;
+	char *p, dummy;
+
+	if (sscanf(name, "%u:%u%c", &maj, &min, &dummy) == 2 ||
+	    sscanf(name, "%u:%u:%u:%c", &maj, &min, &offset, &dummy) == 3) {
+		devt = MKDEV(maj, min);
+		if (maj != MAJOR(devt) || min != MINOR(devt))
+			return 0;
+	} else {
+		devt = new_decode_dev(simple_strtoul(name, &p, 16));
+		if (*p)
+			return 0;
+	}
+
+	return devt;
+}
 
 /*
  *	Convert a name into device number.  We accept the following variants:
@@ -218,101 +293,23 @@ static int match_dev_by_label(struct device *dev, const void *data)
  *	name contains slashes, the device name has them replaced with
  *	bangs.
  */
-
 dev_t name_to_dev_t(const char *name)
 {
-	char s[32];
-	char *p;
-	dev_t res = 0;
-	int part;
-
+	if (strcmp(name, "/dev/nfs") == 0)
+		return Root_NFS;
+	if (strcmp(name, "/dev/cifs") == 0)
+		return Root_CIFS;
+	if (strcmp(name, "/dev/ram") == 0)
+		return Root_RAM0;
 #ifdef CONFIG_BLOCK
-	if (strncmp(name, "PARTUUID=", 9) == 0) {
-		name += 9;
-		res = devt_from_partuuid(name);
-		if (!res)
-			goto fail;
-		goto done;
-	} else if (strncmp(name, "PARTLABEL=", 10) == 0) {
-		struct device *dev;
-
-		dev = class_find_device(&block_class, NULL, name + 10,
-					&match_dev_by_label);
-		if (!dev)
-			goto fail;
-
-		res = dev->devt;
-		put_device(dev);
-		goto done;
-	}
+	if (strncmp(name, "PARTUUID=", 9) == 0)
+		return devt_from_partuuid(name + 9);
+	if (strncmp(name, "PARTLABEL=", 10) == 0)
+		return devt_from_partlabel(name + 10);
+	if (strncmp(name, "/dev/", 5) == 0)
+		return devt_from_devname(name + 5);
 #endif
-
-	if (strncmp(name, "/dev/", 5) != 0) {
-		unsigned maj, min, offset;
-		char dummy;
-
-		if ((sscanf(name, "%u:%u%c", &maj, &min, &dummy) == 2) ||
-		    (sscanf(name, "%u:%u:%u:%c", &maj, &min, &offset, &dummy) == 3)) {
-			res = MKDEV(maj, min);
-			if (maj != MAJOR(res) || min != MINOR(res))
-				goto fail;
-		} else {
-			res = new_decode_dev(simple_strtoul(name, &p, 16));
-			if (*p)
-				goto fail;
-		}
-		goto done;
-	}
-
-	name += 5;
-	res = Root_NFS;
-	if (strcmp(name, "nfs") == 0)
-		goto done;
-	res = Root_CIFS;
-	if (strcmp(name, "cifs") == 0)
-		goto done;
-	res = Root_RAM0;
-	if (strcmp(name, "ram") == 0)
-		goto done;
-
-	if (strlen(name) > 31)
-		goto fail;
-	strcpy(s, name);
-	for (p = s; *p; p++)
-		if (*p == '/')
-			*p = '!';
-	res = blk_lookup_devt(s, 0);
-	if (res)
-		goto done;
-
-	/*
-	 * try non-existent, but valid partition, which may only exist
-	 * after revalidating the disk, like partitioned md devices
-	 */
-	while (p > s && isdigit(p[-1]))
-		p--;
-	if (p == s || !*p || *p == '0')
-		goto fail;
-
-	/* try disk name without <part number> */
-	part = simple_strtoul(p, NULL, 10);
-	*p = '\0';
-	res = blk_lookup_devt(s, part);
-	if (res)
-		goto done;
-
-	/* try disk name without p<part number> */
-	if (p < s + 2 || !isdigit(p[-2]) || p[-1] != 'p')
-		goto fail;
-	p[-1] = '\0';
-	res = blk_lookup_devt(s, part);
-	if (res)
-		goto done;
-
-fail:
-	return 0;
-done:
-	return res;
+	return devt_from_devnum(name);
 }
 EXPORT_SYMBOL_GPL(name_to_dev_t);
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
