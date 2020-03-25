Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3CCC18E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 08:58:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0771E2073E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 08:58:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RxYRz3Q0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0771E2073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j920b5bZNUx89YG3yn0D/X9S1pj5/qQSwJIarF4mA9Y=; b=RxYRz3Q0jhjOdRJfkijKMOSJN0
	EASfOGPivF/I6/sSidrLzsVqXyhHc94kMTlpbsqLq01sv/JncOOcyz2JmqAeGtTlLMe+wmBWUwCu0
	AbByzaen81Hb47ecA3TnQZgHUz+Iskf4s+v7ZPrhZAi3UqKil/HYUCCrDg3sj3eqYB3s4lyiZlxmA
	TcwAjuz2JR/gJhnWUfon0tuY1QoP+b5EkF8T8o5abnCRXwAFQqczU/Xskdb1oHbCZ/lA3eoqffikm
	kKje94AkKXm2EYkIUhsU8odWKI7tNWtmmTK6MPa7vcyNpNTvuKOIpmIPNMpgM596w2V/BnpsMrEBI
	wKXuhF8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH1rG-0001vD-JM; Wed, 25 Mar 2020 08:57:54 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH1p4-0008Ha-5K
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 08:55:43 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0433585-0.000252064-0.956389;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03302; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.H50xpyL_1585126516; 
Received: from
 PC-liaoweixiong.allwinnertech.com(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.H50xpyL_1585126516)
 by smtp.aliyun-inc.com(10.147.42.241);
 Wed, 25 Mar 2020 16:55:33 +0800
From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v3 08/11] pstore/zone: skip broken zone for MTD device
Date: Wed, 25 Mar 2020 16:55:03 +0800
Message-Id: <1585126506-18635-9-git-send-email-liaoweixiong@allwinnertech.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com>
References: <1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_015538_426997_1423A896 
X-CRM114-Status: GOOD (  17.45  )
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
Cc: WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

It's one of a series of patches to adapt to MTD device.

It's different with block device, the MTD device will make new broken
blocks (or bad block) while running. It's necessary for pstore/blk to
skip the broken block.

The MTD driver should return -ENOMSG if meets a bad block, which tells
pstore/zone to skip and try next one.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
---
 fs/pstore/pstore_blk.c      | 10 +++++--
 fs/pstore/pstore_zone.c     | 65 ++++++++++++++++++++++++++++++++++++---------
 include/linux/pstore_blk.h  |  3 ++-
 include/linux/pstore_zone.h | 12 ++++++---
 4 files changed, 71 insertions(+), 19 deletions(-)

diff --git a/fs/pstore/pstore_blk.c b/fs/pstore/pstore_blk.c
index 560e7b3f0945..d6949146135b 100644
--- a/fs/pstore/pstore_blk.c
+++ b/fs/pstore/pstore_blk.c
@@ -99,9 +99,12 @@
  *		means error.
  * @write:	The same as @read, but the following error number:
  *		-EBUSY means try to write again later.
+ *		-ENOMSG means to try next zone.
  * @panic_write:The write operation only used for panic case. It's optional
- *		if you do not care panic log. The parameters and return value
- *		are the same as @read.
+ *		if you do not care panic log. The parameters are relative
+ *		value to storage.
+ *		On success, the number of bytes should be returned, others
+ *		excluding -ENOMSG mean error. -ENOMSG means to try next zone.
  */
 struct psblk_device {
 	unsigned long total_size;
@@ -314,6 +317,9 @@ static ssize_t psblk_blk_panic_write(const char *buf, size_t size,
 	/* size and off must align to SECTOR_SIZE for block device */
 	ret = blkdev_panic_write(buf, off >> SECTOR_SHIFT,
 			size >> SECTOR_SHIFT);
+	/* try next zone */
+	if (ret == -ENOMSG)
+		return ret;
 	return ret ? -EIO : size;
 }
 
diff --git a/fs/pstore/pstore_zone.c b/fs/pstore/pstore_zone.c
index 1da4fc760d31..84ff53c1aaae 100644
--- a/fs/pstore/pstore_zone.c
+++ b/fs/pstore/pstore_zone.c
@@ -247,6 +247,9 @@ static int psz_zone_write(struct psz_zone *zone,
 
 	return 0;
 dirty:
+	/* no need to mark dirty if going to try next zone */
+	if (wcnt == -ENOMSG)
+		return -ENOMSG;
 	atomic_set(&zone->dirty, true);
 	/* flush dirty zones nicely */
 	if (wcnt == -EBUSY && !is_on_panic())
@@ -382,7 +385,11 @@ static int psz_recover_oops_meta(struct psz_context *cxt)
 			return -EINVAL;
 
 		rcnt = info->read((char *)buf, len, zone->off);
-		if (rcnt != len) {
+		if (rcnt == -ENOMSG) {
+			pr_debug("%s with id %lu may be broken, skip\n",
+					zone->name, i);
+			continue;
+		} else if (rcnt != len) {
 			pr_err("read %s with id %lu failed\n", zone->name, i);
 			return (int)rcnt < 0 ? (int)rcnt : -EIO;
 		}
@@ -717,24 +724,58 @@ static void psz_write_kmsg_hdr(struct psz_zone *zone,
 		hdr->counter = 0;
 }
 
+/*
+ * In case zone is broken, which may occur to MTD device, we try each zones,
+ * start at cxt->oops_write_cnt.
+ */
 static inline int notrace psz_oops_write_record(struct psz_context *cxt,
 		struct pstore_record *record)
 {
+	int ret = -EBUSY;
 	size_t size, hlen;
 	struct psz_zone *zone;
-	unsigned int zonenum;
+	unsigned int i;
 
-	zonenum = cxt->oops_write_cnt;
-	zone = cxt->opszs[zonenum];
-	if (unlikely(!zone))
-		return -ENOSPC;
-	cxt->oops_write_cnt = (zonenum + 1) % cxt->oops_max_cnt;
+	for (i = 0; i < cxt->oops_max_cnt; i++) {
+		unsigned int zonenum, len;
+
+		zonenum = (cxt->oops_write_cnt + i) % cxt->oops_max_cnt;
+		zone = cxt->opszs[zonenum];
+		if (unlikely(!zone))
+			return -ENOSPC;
 
-	pr_debug("write %s to zone id %d\n", zone->name, zonenum);
-	psz_write_kmsg_hdr(zone, record);
-	hlen = sizeof(struct psz_oops_header);
-	size = min_t(size_t, record->size, zone->buffer_size - hlen);
-	return psz_zone_write(zone, FLUSH_ALL, record->buf, size, hlen);
+		/* avoid destorying old data, allocate a new one */
+		len = zone->buffer_size + sizeof(*zone->buffer);
+		zone->oldbuf = zone->buffer;
+		zone->buffer = kzalloc(len, GFP_KERNEL);
+		if (!zone->buffer) {
+			zone->buffer = zone->oldbuf;
+			return -ENOMEM;
+		}
+		zone->buffer->sig = zone->oldbuf->sig;
+
+		pr_debug("write %s to zone id %d\n", zone->name, zonenum);
+		psz_write_kmsg_hdr(zone, record);
+		hlen = sizeof(struct psz_oops_header);
+		size = min_t(size_t, record->size, zone->buffer_size - hlen);
+		ret = psz_zone_write(zone, FLUSH_ALL, record->buf, size, hlen);
+		if (likely(!ret || ret != -ENOMSG)) {
+			cxt->oops_write_cnt = zonenum + 1;
+			cxt->oops_write_cnt %= cxt->oops_max_cnt;
+			/* no need to try next zone, free last zone buffer */
+			kfree(zone->oldbuf);
+			zone->oldbuf = NULL;
+			return ret;
+		}
+
+		pr_debug("zone %u may be broken, try next dmesg zone\n",
+				zonenum);
+		kfree(zone->buffer);
+		zone->buffer = zone->oldbuf;
+		zone->oldbuf = NULL;
+	}
+
+	return -EBUSY;
 }
 
 static int notrace psz_oops_write(struct psz_context *cxt,
diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
index d8f609e60288..828b0763d477 100644
--- a/include/linux/pstore_blk.h
+++ b/include/linux/pstore_blk.h
@@ -14,7 +14,8 @@
  * @start_sect: start sector to block device
  * @sects: sectors count on buf
  *
- * Return: On success, zero should be returned. Others mean error.
+ * Return: On success, zero should be returned. Others excluding -ENOMSG
+ * mean error. -ENOMSG means to try next zone.
  *
  * Panic write to block device must be aligned to SECTOR_SIZE.
  */
diff --git a/include/linux/pstore_zone.h b/include/linux/pstore_zone.h
index a138e8b7dc20..2bfa79bff97b 100644
--- a/include/linux/pstore_zone.h
+++ b/include/linux/pstore_zone.h
@@ -23,11 +23,15 @@
  * @read:	The general read operation. Both of the function parameters
  *		@size and @offset are relative value to storage.
  *		On success, the number of bytes should be returned, others
- *		means error.
- * @write:	The same as @read, but -EBUSY means try to write again later.
+ *		mean error.
+ * @write:	The same as @read, but the following error number:
+ *		-EBUSY means try to write again later.
+ *		-ENOMSG means to try next zone.
  * @panic_write:The write operation only used for panic case. It's optional
- *		if you do not care panic log. The parameters and return value
- *		are the same as @read.
+ *		if you do not care panic log. The parameters are relative
+ *		value to storage.
+ *		On success, the number of bytes should be returned, others
+ *		excluding -ENOMSG mean error. -ENOMSG means to try next zone.
  */
 struct psz_info {
 	struct module *owner;
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
