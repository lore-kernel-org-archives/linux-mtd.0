Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870C2C54E4A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:33:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14D7B2078A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NWGukyxy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lULMh5wQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14D7B2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WrxTqvgu+7+JlSP0qA1Xlk+cU/uvGzDpH8govPpmu8=; b=NWGukyxyiH4NMr
	wHy+CM+6sI8WkpTfkkuh4uhaktV2K97Lz/wrVoc2CcYJTSELyeDKx5D8S1uWjsuLnaM3Qe1lNwau0
	UIyhvCI0jf1bXG7dh89ILcrkdZ1yx+gZKcZ68/eLvlXMXyxQReMn4mO9XFHxVKlYfQGaygRn0Q9xs
	JVArU4FMrX0+Azd5qpjpV3QuCpcF3rFyRkcE1Cm/yWXa/6CJJr0FEwDn4EkBRXKkiQO3q8fOVOVec
	M/TH9cwDptOSSQlNXU2CZzudasIW+FX71X8rLu45fzNiOYwYdvAt/LNh6+oqfDF7RNadjgS5PtOz7
	j4EDiCFQMdGwAEWI1Qpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYHvM-00031q-9X; Mon, 11 May 2020 23:33:28 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYHuV-0002DX-Bi
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 23:32:37 +0000
Received: by mail-pg1-x543.google.com with SMTP id f6so5277515pgm.1
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 16:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3OIJKyVWwmfriKQYywcAnHlWtxZW1UFIlObKgtyysrE=;
 b=lULMh5wQoc8iSvqz3OgPYZnBLv+EkNYzkXb7NRz2c0k3VfPVqkvFj9BdVlfKEj/cNx
 ET0GB0hfBzFeTp8nLhn+T0rApc+81zE6P3rIRFwmjzpFW+98t67KZCCao4kjCilMyxXP
 GFs6oinz8HVbMhN69Lbh7BUBOiPJeKtySWdJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3OIJKyVWwmfriKQYywcAnHlWtxZW1UFIlObKgtyysrE=;
 b=dTivleWdFPKUFOXZOlTAGgPDAOt2kWonXp7E3tag6qvAT1w7gmhbdDLfHy8unSL3WJ
 gyHFImHRxdemDcmSc0HNwdfzdBQGBP6s6bR0EDuQdqrp5ieFAeTd/8FJSKMh00FqaRPW
 m0WV+rheLIYQzkcP8dT3rehVmPGpBJjmivrRuPekNgzf7tEa4qw4jRixmbXYpaAFOpCR
 q9jNEZ4kDAL4koKQC7heGBMBIlTmPs1Lk/E3V8DkF872PQGyuTyCZBsiFTJUYtlyl5h6
 NrgjDV1sO42tWMULuIgP/s0ANz8ME8/8D4gqEwCb06Ztpfg+sGD9XmzVDpIpaBeBv5bj
 3ghA==
X-Gm-Message-State: AOAM533gR48ABJj/mvDLl9i9tsRxifbkQryk1LN4w4iuFN9d1wfd28FW
 0nfJdcLBiqZKG+39v60+43jZyQ==
X-Google-Smtp-Source: ABdhPJwriOIkYHxCh36bdmLk+KtaHhNEVNkUYl0qKcdUI6IFuZVgQ1iC7ODcket/qCGCafCY5KGIOA==
X-Received: by 2002:a63:3c0a:: with SMTP id j10mr6534733pga.35.1589239954438; 
 Mon, 11 May 2020 16:32:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id v9sm10932719pju.3.2020.05.11.16.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 16:32:31 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v8 04/11] pstore/zone,blk: Add console frontend support
Date: Mon, 11 May 2020 16:32:22 -0700
Message-Id: <20200511233229.27745-5-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200511233229.27745-1-keescook@chromium.org>
References: <20200511233229.27745-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_163235_408540_41F815CD 
X-CRM114-Status: GOOD (  25.20  )
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

Support backend for console. To enable console backend, just make
console_size be greater than 0 and a multiple of 4096.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Link: https://lore.kernel.org/r/1585126506-18635-6-git-send-email-liaoweixiong@allwinnertech.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/Kconfig           | 18 +++++++--
 fs/pstore/blk.c             | 12 +++++-
 fs/pstore/zone.c            | 81 ++++++++++++++++++++++++++++++++++---
 include/linux/pstore_zone.h |  4 +-
 4 files changed, 105 insertions(+), 10 deletions(-)

diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
index ef01c48f0ff7..126aa6c3ecf2 100644
--- a/fs/pstore/Kconfig
+++ b/fs/pstore/Kconfig
@@ -180,11 +180,11 @@ config PSTORE_BLK_BLKDEV
 	help
 	  Which block device should be used for pstore/blk.
 
-	  It accept the following variants:
+	  It accepts the following variants:
 	  1) <hex_major><hex_minor> device number in hexadecimal representation,
 	     with no leading 0x, for example b302.
-	  2) /dev/<disk_name> represents the device number of disk
-	  3) /dev/<disk_name><decimal> represents the device number
+	  2) /dev/<disk_name> represents the device name of disk
+	  3) /dev/<disk_name><decimal> represents the device name and number
 	     of partition - device number of disk plus the partition number
 	  4) /dev/<disk_name>p<decimal> - same as the above, this form is
 	     used when disk name of partitioned disk ends with a digit.
@@ -236,3 +236,15 @@ config PSTORE_BLK_PMSG_SIZE
 
 	  NOTE that, both Kconfig and module parameters can configure
 	  pstore/blk, but module parameters have priority over Kconfig.
+
+config PSTORE_BLK_CONSOLE_SIZE
+	int "Size in Kbytes of console log to store"
+	depends on PSTORE_BLK
+	depends on PSTORE_CONSOLE
+	default 64
+	help
+	  This just sets size of console log (console_size) to store via
+	  pstore/blk. The size is in KB and must be a multiple of 4.
+
+	  NOTE that, both Kconfig and module parameters can configure
+	  pstore/blk, but module parameters have priority over Kconfig.
diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index e3fa29988b0f..0b88c0bcd36c 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -35,6 +35,14 @@ static long pmsg_size = -1;
 module_param(pmsg_size, long, 0400);
 MODULE_PARM_DESC(pmsg_size, "pmsg size in kbytes");
 
+#if IS_ENABLED(CONFIG_PSTORE_CONSOLE)
+static long console_size = CONFIG_PSTORE_BLK_CONSOLE_SIZE;
+#else
+static long console_size = -1;
+#endif
+module_param(console_size, long, 0400);
+MODULE_PARM_DESC(console_size, "console size in kbytes");
+
 /*
  * blkdev - the block device to use for pstore storage
  *
@@ -91,7 +99,8 @@ struct bdev_info {
  *		whole disk).
  *		On success, the number of bytes should be returned, others
  *		means error.
- * @write:	The same as @read.
+ * @write:	The same as @read, but the following error number:
+ *		-EBUSY means try to write again later.
  * @panic_write:The write operation only used for panic case. It's optional
  *		if you do not care panic log. The parameters and return value
  *		are the same as @read.
@@ -142,6 +151,7 @@ static int psblk_register_do(struct pstore_device_info *dev)
 
 	verify_size(kmsg_size, 4096, dev->flags & PSTORE_FLAGS_DMESG);
 	verify_size(pmsg_size, 4096, dev->flags & PSTORE_FLAGS_PMSG);
+	verify_size(console_size, 4096, dev->flags & PSTORE_FLAGS_CONSOLE);
 #undef verify_size
 
 	pstore_zone_info->total_size = dev->total_size;
diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index fe6fde96d722..33c99dc5f980 100644
--- a/fs/pstore/zone.c
+++ b/fs/pstore/zone.c
@@ -91,10 +91,12 @@ struct pstore_zone {
  *
  * @kpszs: kmsg dump storage zones
  * @ppsz: pmsg storage zone
+ * @cpsz: console storage zone
  * @kmsg_max_cnt: max count of @kpszs
  * @kmsg_read_cnt: counter of total read kmsg dumps
  * @kmsg_write_cnt: counter of total kmsg dump writes
  * @pmsg_read_cnt: counter of total read pmsg zone
+ * @console_read_cnt: counter of total read console zone
  * @oops_counter: counter of oops dumps
  * @panic_counter: counter of panic dumps
  * @recovered: whether finished recovering data from storage
@@ -106,10 +108,12 @@ struct pstore_zone {
 struct psz_context {
 	struct pstore_zone **kpszs;
 	struct pstore_zone *ppsz;
+	struct pstore_zone *cpsz;
 	unsigned int kmsg_max_cnt;
 	unsigned int kmsg_read_cnt;
 	unsigned int kmsg_write_cnt;
 	unsigned int pmsg_read_cnt;
+	unsigned int console_read_cnt;
 	/*
 	 * These counters should be calculated during recovery.
 	 * It records the oops/panic times after crashes rather than boots.
@@ -129,6 +133,9 @@ struct psz_context {
 };
 static struct psz_context pstore_zone_cxt;
 
+static void psz_flush_all_dirty_zones(struct work_struct *);
+static DECLARE_DELAYED_WORK(psz_cleaner, psz_flush_all_dirty_zones);
+
 /**
  * enum psz_flush_mode - flush mode for psz_zone_write()
  *
@@ -237,6 +244,9 @@ static int psz_zone_write(struct pstore_zone *zone,
 	return 0;
 dirty:
 	atomic_set(&zone->dirty, true);
+	/* flush dirty zones nicely */
+	if (wcnt == -EBUSY && !is_on_panic())
+		schedule_delayed_work(&psz_cleaner, msecs_to_jiffies(500));
 	return -EBUSY;
 }
 
@@ -293,6 +303,21 @@ static int psz_move_zone(struct pstore_zone *old, struct pstore_zone *new)
 	return 0;
 }
 
+static void psz_flush_all_dirty_zones(struct work_struct *work)
+{
+	struct psz_context *cxt = &pstore_zone_cxt;
+	int ret = 0;
+
+	if (cxt->ppsz)
+		ret |= psz_flush_dirty_zone(cxt->ppsz);
+	if (cxt->cpsz)
+		ret |= psz_flush_dirty_zone(cxt->cpsz);
+	if (cxt->kpszs)
+		ret |= psz_flush_dirty_zones(cxt->kpszs, cxt->kmsg_max_cnt);
+	if (ret && cxt->pstore_zone_info)
+		schedule_delayed_work(&psz_cleaner, msecs_to_jiffies(1000));
+}
+
 static int psz_kmsg_recover_data(struct psz_context *cxt)
 {
 	struct pstore_zone_info *info = cxt->pstore_zone_info;
@@ -548,6 +573,10 @@ static inline int psz_recovery(struct psz_context *cxt)
 	if (ret)
 		goto recover_fail;
 
+	ret = psz_recover_zone(cxt, cxt->cpsz);
+	if (ret)
+		goto recover_fail;
+
 	pr_debug("recover end!\n");
 	atomic_set(&cxt->recovered, 1);
 	return 0;
@@ -563,6 +592,7 @@ static int psz_pstore_open(struct pstore_info *psi)
 
 	cxt->kmsg_read_cnt = 0;
 	cxt->pmsg_read_cnt = 0;
+	cxt->console_read_cnt = 0;
 	return 0;
 }
 
@@ -627,8 +657,9 @@ static int psz_pstore_erase(struct pstore_record *record)
 		return psz_kmsg_erase(cxt, cxt->kpszs[record->id], record);
 	case PSTORE_TYPE_PMSG:
 		return psz_record_erase(cxt, cxt->ppsz);
-	default:
-		return -EINVAL;
+	case PSTORE_TYPE_CONSOLE:
+		return psz_record_erase(cxt, cxt->cpsz);
+	default: return -EINVAL;
 	}
 }
 
@@ -691,9 +722,10 @@ static int notrace psz_kmsg_write(struct psz_context *cxt,
 		return -ENOSPC;
 
 	ret = psz_kmsg_write_record(cxt, record);
-	if (!ret) {
+	if (!ret && is_on_panic()) {
+		/* ensure all data are flushed to storage when panic */
 		pr_debug("try to flush other dirty zones\n");
-		psz_flush_dirty_zones(cxt->kpszs, cxt->kmsg_max_cnt);
+		psz_flush_all_dirty_zones(NULL);
 	}
 
 	/* always return 0 as we had handled it on buffer */
@@ -755,9 +787,18 @@ static int notrace psz_pstore_write(struct pstore_record *record)
 			record->reason == KMSG_DUMP_PANIC)
 		atomic_set(&cxt->on_panic, 1);
 
+	/*
+	 * if on panic, do not write except panic records
+	 * Fix case that panic_write prints log which wakes up console backend.
+	 */
+	if (is_on_panic() && record->type != PSTORE_TYPE_DMESG)
+		return -EBUSY;
+
 	switch (record->type) {
 	case PSTORE_TYPE_DMESG:
 		return psz_kmsg_write(cxt, record);
+	case PSTORE_TYPE_CONSOLE:
+		return psz_record_write(cxt->cpsz, record);
 	case PSTORE_TYPE_PMSG:
 		return psz_record_write(cxt->ppsz, record);
 	default:
@@ -782,6 +823,13 @@ static struct pstore_zone *psz_read_next_zone(struct psz_context *cxt)
 			return zone;
 	}
 
+	if (cxt->console_read_cnt == 0) {
+		cxt->console_read_cnt++;
+		zone = cxt->cpsz;
+		if (psz_old_ok(zone))
+			return zone;
+	}
+
 	return NULL;
 }
 
@@ -892,6 +940,8 @@ static ssize_t psz_pstore_read(struct pstore_record *record)
 		readop = psz_kmsg_read;
 		record->id = cxt->kmsg_read_cnt - 1;
 		break;
+	case PSTORE_TYPE_CONSOLE:
+		fallthrough;
 	case PSTORE_TYPE_PMSG:
 		readop = psz_record_read;
 		break;
@@ -952,6 +1002,8 @@ static void psz_free_all_zones(struct psz_context *cxt)
 		psz_free_zones(&cxt->kpszs, &cxt->kmsg_max_cnt);
 	if (cxt->ppsz)
 		psz_free_zone(&cxt->ppsz);
+	if (cxt->cpsz)
+		psz_free_zone(&cxt->cpsz);
 }
 
 static struct pstore_zone *psz_init_zone(enum pstore_type_id type,
@@ -1053,6 +1105,15 @@ static int psz_alloc_zones(struct psz_context *cxt)
 		goto free_out;
 	}
 
+	off_size += info->console_size;
+	cxt->cpsz = psz_init_zone(PSTORE_TYPE_CONSOLE, &off,
+			info->console_size);
+	if (IS_ERR(cxt->cpsz)) {
+		err = PTR_ERR(cxt->cpsz);
+		cxt->cpsz = NULL;
+		goto free_out;
+	}
+
 	cxt->kpszs = psz_init_zones(PSTORE_TYPE_DMESG, &off,
 			info->total_size - off_size,
 			info->kmsg_size, &cxt->kmsg_max_cnt);
@@ -1087,7 +1148,7 @@ int register_pstore_zone(struct pstore_zone_info *info)
 		return -EINVAL;
 	}
 
-	if (!info->kmsg_size && !info->pmsg_size) {
+	if (!info->kmsg_size && !info->pmsg_size && !info->console_size) {
 		pr_warn("at least one record size must be non-zero\n");
 		return -EINVAL;
 	}
@@ -1110,6 +1171,7 @@ int register_pstore_zone(struct pstore_zone_info *info)
 	check_size(total_size, 4096);
 	check_size(kmsg_size, SECTOR_SIZE);
 	check_size(pmsg_size, SECTOR_SIZE);
+	check_size(console_size, SECTOR_SIZE);
 
 #undef check_size
 
@@ -1136,6 +1198,7 @@ int register_pstore_zone(struct pstore_zone_info *info)
 	pr_debug("\ttotal size : %ld Bytes\n", info->total_size);
 	pr_debug("\tkmsg size : %ld Bytes\n", info->kmsg_size);
 	pr_debug("\tpmsg size : %ld Bytes\n", info->pmsg_size);
+	pr_debug("\tconsole size : %ld Bytes\n", info->console_size);
 
 	err = psz_alloc_zones(cxt);
 	if (err) {
@@ -1169,6 +1232,10 @@ int register_pstore_zone(struct pstore_zone_info *info)
 		cxt->pstore.flags |= PSTORE_FLAGS_PMSG;
 		pr_cont(" pmsg");
 	}
+	if (info->console_size) {
+		cxt->pstore.flags |= PSTORE_FLAGS_CONSOLE;
+		pr_cont(" console");
+	}
 	pr_cont("\n");
 
 	err = pstore_register(&cxt->pstore);
@@ -1210,6 +1277,10 @@ void unregister_pstore_zone(struct pstore_zone_info *info)
 	/* Stop incoming writes from pstore. */
 	pstore_unregister(&cxt->pstore);
 
+	/* Flush any pending writes. */
+	psz_flush_all_dirty_zones(NULL);
+	flush_delayed_work(&psz_cleaner);
+
 	/* Clean up allocations. */
 	kfree(cxt->pstore.buf);
 	cxt->pstore.buf = NULL;
diff --git a/include/linux/pstore_zone.h b/include/linux/pstore_zone.h
index 29c367a3bd80..904ee67f4ba2 100644
--- a/include/linux/pstore_zone.h
+++ b/include/linux/pstore_zone.h
@@ -18,11 +18,12 @@ typedef ssize_t (*pstore_zone_write_op)(const char *, size_t, loff_t);
  *		it must be multiple of SECTOR_SIZE(512 Bytes).
  * @max_reason: Maximum kmsg dump reason to store.
  * @pmsg_size:	The size of pmsg zone which is the same as @kmsg_size.
+ * @console_size:The size of console zone which is the same as @kmsg_size.
  * @read:	The general read operation. Both of the function parameters
  *		@size and @offset are relative value to storage.
  *		On success, the number of bytes should be returned, others
  *		means error.
- * @write:	The same as @read.
+ * @write:	The same as @read, but -EBUSY means try to write again later.
  * @panic_write:The write operation only used for panic case. It's optional
  *		if you do not care panic log. The parameters and return value
  *		are the same as @read.
@@ -35,6 +36,7 @@ struct pstore_zone_info {
 	unsigned long kmsg_size;
 	int max_reason;
 	unsigned long pmsg_size;
+	unsigned long console_size;
 	pstore_zone_read_op read;
 	pstore_zone_write_op write;
 	pstore_zone_write_op panic_write;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
