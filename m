Return-Path: <SRS0=nfTR=6X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E07C28CBC
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 11:16:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5CF6214D8
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 11:16:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WaIgWclz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5CF6214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4R5PfRtLOGR2NpEKE929XLrXa2gpvaf37Jsq9juMT5k=; b=WaIgWclzfbmDMs1puyefqI60PS
	N08nGSj75eAb/WnZ5h+F2EH7C3k0drZpvMDwB8lF3NOKDXTN/MiMryNy8XpaXXnf4m7Hpl9yi20K4
	Y2OXIS+guMDQZJ1w0ZApzcOYq8kG/xuFhEikqLl0Gl0j9gO4DRhyfHH9gx9xBl1IDRx8t56d+ctJb
	lPYQ5jXVOZzQS24ViIij4giW/rpmxitXHVDt9Kom8twh6/rVfq38RZ0i9YfyeiCuhjDPt06/W9E34
	ttsRXbo+c7PecoUsppvhQvbltVwd4k8A69YTxwJrE1Ow57hM0XoooOlr1Xq/CGKMXQ+7wEDRL1K5J
	c+g37k3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXNT1-00016I-Bt; Sat, 09 May 2020 11:16:27 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXNRU-0005jo-6Q
 for linux-mtd@lists.infradead.org; Sat, 09 May 2020 11:14:55 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.155575-0.000220005-0.844205;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03311; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=20; RT=20; SR=0; TI=SMTPD_---.HVopGr-_1589022874; 
Received: from
 PC-liaoweixiong.allwinnertech.com(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.HVopGr-_1589022874)
 by smtp.aliyun-inc.com(10.147.44.129);
 Sat, 09 May 2020 19:14:46 +0800
From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>
Subject: [PATCH v5 06/12] pstore/blk: Add console frontend support
Date: Sat,  9 May 2020 19:14:08 +0800
Message-Id: <1589022854-19821-7-git-send-email-liaoweixiong@allwinnertech.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589022854-19821-1-git-send-email-liaoweixiong@allwinnertech.com>
References: <1589022854-19821-1-git-send-email-liaoweixiong@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_041452_442959_C463203C 
X-CRM114-Status: GOOD (  20.39  )
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

Support backend for console. To enable console backend, just make
console_size be greater than 0 and a multiple of 4096.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Link: https://lore.kernel.org/r/1585126506-18635-6-git-send-email-liaoweixiong@allwinnertech.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/Kconfig           | 12 +++++++
 fs/pstore/blk.c             | 12 ++++++-
 fs/pstore/zone.c            | 80 +++++++++++++++++++++++++++++++++++++++++----
 include/linux/pstore_zone.h |  4 ++-
 4 files changed, 100 insertions(+), 8 deletions(-)

diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
index f18cd126d83f..f1484f751c5e 100644
--- a/fs/pstore/Kconfig
+++ b/fs/pstore/Kconfig
@@ -236,3 +236,15 @@ config PSTORE_BLK_PMSG_SIZE
 
 	  NOTE that, both Kconfig and module parameters can configure
 	  pstore/blk, but module parameters have priority over Kconfig.
+
+config PSTORE_BLK_CONSOLE_SIZE
+	int "Size in Kbytes of console to store"
+	depends on PSTORE_BLK
+	depends on PSTORE_CONSOLE
+	default 64
+	help
+	  This just sets size of console (console_size) for pstore/blk. The
+	  size is in KB and must be a multiple of 4.
+
+	  NOTE that, both Kconfig and module parameters can configure
+	  pstore/blk, but module parameters have priority over Kconfig.
diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 02c0223f08fc..acdeb5d7b5f3 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -32,6 +32,14 @@
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
  * blkdev - The block device to use.
  *
@@ -83,7 +91,8 @@
  *		whole disk).
  *		On success, the number of bytes should be returned, others
  *		means error.
- * @write:	The same as @read.
+ * @write:	The same as @read, but the following error number:
+ *		-EBUSY means try to write again later.
  * @panic_write:The write operation only used for panic case. It's optional
  *		if you do not care panic log. The parameters and return value
  *		are the same as @read.
@@ -133,6 +142,7 @@ static int psblk_register_do(struct psblk_device *dev)
 
 	verify_size(kmsg_size, 4096, dev->flags & PSTORE_FLAGS_DMESG);
 	verify_size(pmsg_size, 4096, dev->flags & PSTORE_FLAGS_PMSG);
+	verify_size(console_size, 4096, dev->flags & PSTORE_FLAGS_CONSOLE);
 #undef verify_size
 
 	pstore_zone_info->total_size = dev->total_size;
diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index 89f7d2c42336..427b458aa675 100644
--- a/fs/pstore/zone.c
+++ b/fs/pstore/zone.c
@@ -87,10 +87,12 @@ struct pstore_zone {
  *
  * @opszs: oops/panic storage zones
  * @ppsz: pmsg storage zone
+ * @cpsz: console storage zone
  * @oops_max_cnt: max count of @opszs
  * @oops_read_cnt: counter to read oops zone
  * @oops_write_cnt: counter to write
  * @pmsg_read_cnt: counter to read pmsg zone
+ * @console_read_cnt: counter to read console zone
  * @oops_counter: counter to oops
  * @panic_counter: counter to panic
  * @recovered: whether finish recovering data from storage
@@ -102,10 +104,12 @@ struct pstore_zone {
 struct psz_context {
 	struct pstore_zone **opszs;
 	struct pstore_zone *ppsz;
+	struct pstore_zone *cpsz;
 	unsigned int oops_max_cnt;
 	unsigned int oops_read_cnt;
 	unsigned int oops_write_cnt;
 	unsigned int pmsg_read_cnt;
+	unsigned int console_read_cnt;
 	/*
 	 * the counter should be recovered when recover.
 	 * It records the oops/panic times after burning rather than booting.
@@ -125,6 +129,9 @@ struct psz_context {
 };
 static struct psz_context psz_cxt;
 
+static void psz_flush_all_dirty_zones(struct work_struct *);
+static DECLARE_DELAYED_WORK(psz_cleaner, psz_flush_all_dirty_zones);
+
 /**
  * enum psz_flush_mode - flush mode for psz_zone_write()
  *
@@ -235,6 +242,9 @@ static int psz_zone_write(struct pstore_zone *zone,
 	return 0;
 dirty:
 	atomic_set(&zone->dirty, true);
+	/* flush dirty zones nicely */
+	if (wcnt == -EBUSY && !is_on_panic())
+		schedule_delayed_work(&psz_cleaner, msecs_to_jiffies(500));
 	return -EBUSY;
 }
 
@@ -291,6 +301,21 @@ static int psz_move_zone(struct pstore_zone *old, struct pstore_zone *new)
 	return 0;
 }
 
+static void psz_flush_all_dirty_zones(struct work_struct *work)
+{
+	int ret = 0;
+	struct psz_context *cxt = &psz_cxt;
+
+	if (cxt->ppsz)
+		ret |= psz_flush_dirty_zone(cxt->ppsz);
+	if (cxt->cpsz)
+		ret |= psz_flush_dirty_zone(cxt->cpsz);
+	if (cxt->opszs)
+		ret |= psz_flush_dirty_zones(cxt->opszs, cxt->oops_max_cnt);
+	if (ret && cxt->pstore_zone_info)
+		schedule_delayed_work(&psz_cleaner, msecs_to_jiffies(1000));
+}
+
 static int psz_recover_oops_data(struct psz_context *cxt)
 {
 	struct pstore_zone_info *info = cxt->pstore_zone_info;
@@ -546,6 +571,10 @@ static inline int psz_recovery(struct psz_context *cxt)
 	if (ret)
 		goto recover_fail;
 
+	ret = psz_recover_zone(cxt, cxt->cpsz);
+	if (ret)
+		goto recover_fail;
+
 	pr_debug("recover end!\n");
 	atomic_set(&cxt->recovered, 1);
 	return 0;
@@ -561,6 +590,7 @@ static int psz_pstore_open(struct pstore_info *psi)
 
 	cxt->oops_read_cnt = 0;
 	cxt->pmsg_read_cnt = 0;
+	cxt->console_read_cnt = 0;
 	return 0;
 }
 
@@ -625,8 +655,9 @@ static int psz_pstore_erase(struct pstore_record *record)
 		return psz_oops_erase(cxt, cxt->opszs[record->id], record);
 	case PSTORE_TYPE_PMSG:
 		return psz_record_erase(cxt, cxt->ppsz);
-	default:
-		return -EINVAL;
+	case PSTORE_TYPE_CONSOLE:
+		return psz_record_erase(cxt, cxt->cpsz);
+	default: return -EINVAL;
 	}
 }
 
@@ -689,10 +720,10 @@ static int notrace psz_oops_write(struct psz_context *cxt,
 		return -ENOSPC;
 
 	ret = psz_oops_write_record(cxt, record);
-	if (!ret) {
+	if (!ret && is_on_panic()) {
+		/* ensure all data are flushed to storage when panic */
 		pr_debug("try to flush other dirty zones\n");
-		psz_flush_dirty_zones(cxt->opszs, cxt->oops_max_cnt);
-		psz_flush_dirty_zone(cxt->ppsz);
+		psz_flush_all_dirty_zones(NULL);
 	}
 
 	/* always return 0 as we had handled it on buffer */
@@ -754,9 +785,18 @@ static int notrace psz_pstore_write(struct pstore_record *record)
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
 		return psz_oops_write(cxt, record);
+	case PSTORE_TYPE_CONSOLE:
+		return psz_record_write(cxt->cpsz, record);
 	case PSTORE_TYPE_PMSG:
 		return psz_record_write(cxt->ppsz, record);
 	default:
@@ -781,6 +821,13 @@ static struct pstore_zone *psz_read_next_zone(struct psz_context *cxt)
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
 
@@ -891,6 +938,8 @@ static ssize_t psz_pstore_read(struct pstore_record *record)
 		readop = psz_oops_read;
 		record->id = cxt->oops_read_cnt - 1;
 		break;
+	case PSTORE_TYPE_CONSOLE:
+		fallthrough;
 	case PSTORE_TYPE_PMSG:
 		readop = psz_record_read;
 		break;
@@ -1039,6 +1088,8 @@ static void psz_free_all_zones(struct psz_context *cxt)
 		psz_free_zones(&cxt->opszs, &cxt->oops_max_cnt);
 	if (cxt->ppsz)
 		psz_free_zone(&cxt->ppsz);
+	if (cxt->cpsz)
+		psz_free_zone(&cxt->cpsz);
 }
 
 static int psz_alloc_zones(struct psz_context *cxt)
@@ -1055,6 +1106,14 @@ static int psz_alloc_zones(struct psz_context *cxt)
 		goto free_out;
 	}
 
+	off_size += info->console_size;
+	cxt->cpsz = psz_init_zone(PSTORE_TYPE_CONSOLE, &off,
+			info->console_size);
+	if (IS_ERR(cxt->cpsz)) {
+		err = PTR_ERR(cxt->cpsz);
+		goto free_out;
+	}
+
 	cxt->opszs = psz_init_zones(PSTORE_TYPE_DMESG, &off,
 			info->total_size - off_size,
 			info->kmsg_size, &cxt->oops_max_cnt);
@@ -1088,7 +1147,7 @@ int register_pstore_zone(struct pstore_zone_info *info)
 		return -EINVAL;
 	}
 
-	if (!info->kmsg_size && !info->pmsg_size) {
+	if (!info->kmsg_size && !info->pmsg_size && !info->console_size) {
 		pr_warn("at least one of the records be non-zero\n");
 		return -EINVAL;
 	}
@@ -1116,6 +1175,7 @@ int register_pstore_zone(struct pstore_zone_info *info)
 	check_size(total_size, 4096);
 	check_size(kmsg_size, SECTOR_SIZE);
 	check_size(pmsg_size, SECTOR_SIZE);
+	check_size(console_size, SECTOR_SIZE);
 
 #undef check_size
 
@@ -1143,6 +1203,7 @@ int register_pstore_zone(struct pstore_zone_info *info)
 	pr_debug("\ttotal size : %ld Bytes\n", info->total_size);
 	pr_debug("\toops size : %ld Bytes\n", info->kmsg_size);
 	pr_debug("\tpmsg size : %ld Bytes\n", info->pmsg_size);
+	pr_debug("\tconsole size : %ld Bytes\n", info->console_size);
 
 	err = psz_alloc_zones(cxt);
 	if (err) {
@@ -1175,6 +1236,10 @@ int register_pstore_zone(struct pstore_zone_info *info)
 		cxt->pstore.flags |= PSTORE_FLAGS_PMSG;
 		pr_cont(" pmsg");
 	}
+	if (info->console_size) {
+		cxt->pstore.flags |= PSTORE_FLAGS_CONSOLE;
+		pr_cont(" console");
+	}
 	pr_cont("\n");
 
 	err = pstore_register(&cxt->pstore);
@@ -1206,6 +1271,9 @@ void unregister_pstore_zone(struct pstore_zone_info *info)
 {
 	struct psz_context *cxt = &psz_cxt;
 
+	psz_flush_all_dirty_zones(NULL);
+	flush_delayed_work(&psz_cleaner);
+
 	pstore_unregister(&cxt->pstore);
 	kfree(cxt->pstore.buf);
 	cxt->pstore.bufsize = 0;
diff --git a/include/linux/pstore_zone.h b/include/linux/pstore_zone.h
index 39c2cb944123..da294e6d7661 100644
--- a/include/linux/pstore_zone.h
+++ b/include/linux/pstore_zone.h
@@ -18,11 +18,12 @@
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
 	psz_read_op read;
 	psz_write_op write;
 	psz_write_op panic_write;
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
