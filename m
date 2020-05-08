Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44ECCC38A2A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 06:43:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAD5F20735
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 06:43:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eNzwh0nB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B+2NiaP+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAD5F20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CbJNpjubS7UFAgmFQb8cAgPs9+T9ARz1jCOc7l3L2qE=; b=eNzwh0nBTJ5mI4
	e97OMI38zkfHOLMzwmjVZSGXHwMNKNIdJIkz+0cIlClECTmOZ8HBvfZnIfDN8in/7/StXLyquHyAB
	COI75kz4/fLETbWvWEgY0G6zvOH5sQpryIR47Uo7m3FSwM0bwiqeVlU/W1i3KQJGzqkGJzgiW4gfQ
	mce3g9jivgv50cmX/s+J4tFotdUePuf86VKkq2aA6ZtImQRtKqspMzcffscEYBU1x95qSYM8d5jbP
	zcCBQWsa2RUUxnuQPreeFvahuNzCxP49gl5/eMDqeDJ72Yi3C3PCU55QALnovohlTCs4vzvt/Kt4J
	8K18pAWR7/cjEKhRq8ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWwij-0001yy-8Q; Fri, 08 May 2020 06:42:53 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWwgF-0008FV-8q
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 06:40:26 +0000
Received: by mail-pg1-x543.google.com with SMTP id n11so418034pgl.9
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2020 23:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yqc5+lTdZ7/hveZ/nG7d1zCdQOMA74apmuUCZ1YxAJQ=;
 b=B+2NiaP+xiLYfJ4yHfFL2rq2QWDgFRejOO3ln/kf0gkmzVdVyKiqD7Tzpp/CVNurFG
 18oau2CmwfLj5y5ssNraWBLzayUxVbAp2zJoxhFgHD+wkWnW/pK1DysvkwS97tcSQef3
 SNmsWMydCtipJPMat8MoPU27CmeDT6kdej74k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yqc5+lTdZ7/hveZ/nG7d1zCdQOMA74apmuUCZ1YxAJQ=;
 b=AaT2KEjFrYE4dOXIt5HFht7Z3Mvn7YZOQKKbOsloj7F5pEFNVymqe+5R2b9ZCDGvd/
 l2sArD96BVfIDkRaVHdvP8IVZZl1meVIvcvGHeSNRSrjdNpTWXv2iHM7+2ARWwx143V3
 Go70SYHtxtFJUhFkALBlAtkbfb/g3zodN6IspsKzy4Q4TJGFWGBvBUCakPD8ZKJd1xIs
 bX0l5ne+E6yjByrHhwnqRKzLOXRuDlhpyKYtjPQvsmm7Ou1VTTpBgffBADFegYztwH5W
 e1vq6C3r4eqg7IVJjF6KtPcJwNC8phc8vcNqG7UuJr9BiOfDl1JUluoSGWCxe4JYb+V4
 ++TA==
X-Gm-Message-State: AGi0PuaRF0klgpAK4Lb9TAlXxzos9zUjxjF+DKWIEM5SoDay251wsQTJ
 TfTasTcGC2Q0u1Lz+dn5JPCoOQ==
X-Google-Smtp-Source: APiQypJgTk5wZFqGU6nOLv5D6XgByoX0jDytTshJCuujPEoMuR6iYvZclAad+BNWdh1PSQGvv+2lwA==
X-Received: by 2002:a05:6a00:12:: with SMTP id
 h18mr1223393pfk.293.1588920018360; 
 Thu, 07 May 2020 23:40:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z6sm707766pfb.87.2020.05.07.23.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:40:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v4 07/12] pstore/blk: Add ftrace frontend support
Date: Thu,  7 May 2020 23:39:59 -0700
Message-Id: <20200508064004.57898-8-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508064004.57898-1-keescook@chromium.org>
References: <20200508064004.57898-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_234019_348768_20DE4591 
X-CRM114-Status: GOOD (  21.37  )
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
 Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org,
 Anton Vorontsov <anton@enomsg.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-mtd@lists.infradead.org, Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: WeiXiong Liao <liaoweixiong@allwinnertech.com>

Support backend for ftrace. To enable ftrace backend, just make
ftrace_size be greater than 0 and a multiple of 4096.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Link: https://lore.kernel.org/r/1585126506-18635-7-git-send-email-liaoweixiong@allwinnertech.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/Kconfig           |  12 +++
 fs/pstore/blk.c             |   9 ++
 fs/pstore/zone.c            | 169 ++++++++++++++++++++++++++++++++++++
 include/linux/pstore_zone.h |   2 +
 4 files changed, 192 insertions(+)

diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
index f1484f751c5e..16a0440d8d5a 100644
--- a/fs/pstore/Kconfig
+++ b/fs/pstore/Kconfig
@@ -248,3 +248,15 @@ config PSTORE_BLK_CONSOLE_SIZE
 
 	  NOTE that, both Kconfig and module parameters can configure
 	  pstore/blk, but module parameters have priority over Kconfig.
+
+config PSTORE_BLK_FTRACE_SIZE
+	int "Size in Kbytes of ftarce to store"
+	depends on PSTORE_BLK
+	depends on PSTORE_FTRACE
+	default 64
+	help
+	  This just sets size of ftrace (ftrace_size) for pstore/blk. The
+	  size is in KB and must be a multiple of 4.
+
+	  NOTE that, both Kconfig and module parameters can configure
+	  pstore/blk, but module parameters have priority over Kconfig.
diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 813025ea7edd..5db811b7018d 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -40,6 +40,14 @@ static long console_size = -1;
 module_param(console_size, long, 0400);
 MODULE_PARM_DESC(console_size, "console size in kbytes");
 
+#if IS_ENABLED(CONFIG_PSTORE_FTRACE)
+static long ftrace_size = CONFIG_PSTORE_BLK_FTRACE_SIZE;
+#else
+static long ftrace_size = -1;
+#endif
+module_param(ftrace_size, long, 0400);
+MODULE_PARM_DESC(ftrace_size, "ftrace size in kbytes");
+
 /*
  * blkdev - The block device to use.
  *
@@ -143,6 +151,7 @@ static int psblk_register_do(struct psblk_device *dev)
 	verify_size(kmsg_size, 4096, dev->flags & PSTORE_FLAGS_DMESG);
 	verify_size(pmsg_size, 4096, dev->flags & PSTORE_FLAGS_PMSG);
 	verify_size(console_size, 4096, dev->flags & PSTORE_FLAGS_CONSOLE);
+	verify_size(ftrace_size, 4096, dev->flags & PSTORE_FLAGS_FTRACE);
 #undef verify_size
 
 	pstore_zone_info->total_size = dev->total_size;
diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index 0b952eea39fe..36d78c63bd20 100644
--- a/fs/pstore/zone.c
+++ b/fs/pstore/zone.c
@@ -88,11 +88,14 @@ struct pstore_zone {
  * @opszs: oops/panic storage zones
  * @ppsz: pmsg storage zone
  * @cpsz: console storage zone
+ * @fpszs: ftrace storage zones
  * @oops_max_cnt: max count of @opszs
  * @oops_read_cnt: counter to read oops zone
  * @oops_write_cnt: counter to write
  * @pmsg_read_cnt: counter to read pmsg zone
  * @console_read_cnt: counter to read console zone
+ * @ftrace_max_cnt: max count of @fpszs
+ * @ftrace_read_cnt: counter to read ftrace zone
  * @oops_counter: counter to oops
  * @panic_counter: counter to panic
  * @recovered: whether finish recovering data from storage
@@ -105,11 +108,14 @@ struct psz_context {
 	struct pstore_zone **opszs;
 	struct pstore_zone *ppsz;
 	struct pstore_zone *cpsz;
+	struct pstore_zone **fpszs;
 	unsigned int oops_max_cnt;
 	unsigned int oops_read_cnt;
 	unsigned int oops_write_cnt;
 	unsigned int pmsg_read_cnt;
 	unsigned int console_read_cnt;
+	unsigned int ftrace_max_cnt;
+	unsigned int ftrace_read_cnt;
 	/*
 	 * the counter should be recovered when recover.
 	 * It records the oops/panic times after burning rather than booting.
@@ -308,6 +314,7 @@ static void psz_flush_all_dirty_zones(struct work_struct *work)
 	psz_flush_dirty_zone(cxt->ppsz);
 	psz_flush_dirty_zone(cxt->cpsz);
 	psz_flush_dirty_zones(cxt->opszs, cxt->oops_max_cnt);
+	psz_flush_dirty_zones(cxt->fpszs, cxt->ftrace_max_cnt);
 }
 
 static int psz_recover_oops_data(struct psz_context *cxt)
@@ -542,6 +549,31 @@ static int psz_recover_zone(struct psz_context *cxt, struct pstore_zone *zone)
 	return ret;
 }
 
+static int psz_recover_zones(struct psz_context *cxt,
+		struct pstore_zone **zones, unsigned int cnt)
+{
+	int ret;
+	unsigned int i;
+	struct pstore_zone *zone;
+
+	if (!zones)
+		return 0;
+
+	for (i = 0; i < cnt; i++) {
+		zone = zones[i];
+		if (unlikely(!zone))
+			continue;
+		ret = psz_recover_zone(cxt, zone);
+		if (ret)
+			goto recover_fail;
+	}
+
+	return 0;
+recover_fail:
+	pr_debug("recover %s[%u] failed\n", zone->name, i);
+	return ret;
+}
+
 /**
  * psz_recovery() - recover data from storage
  * @cxt: the context of pstore/zone
@@ -569,6 +601,10 @@ static inline int psz_recovery(struct psz_context *cxt)
 	if (ret)
 		goto recover_fail;
 
+	ret = psz_recover_zones(cxt, cxt->fpszs, cxt->ftrace_max_cnt);
+	if (ret)
+		goto recover_fail;
+
 	pr_debug("recover end!\n");
 	atomic_set(&cxt->recovered, 1);
 	return 0;
@@ -585,6 +621,7 @@ static int psz_pstore_open(struct pstore_info *psi)
 	cxt->oops_read_cnt = 0;
 	cxt->pmsg_read_cnt = 0;
 	cxt->console_read_cnt = 0;
+	cxt->ftrace_read_cnt = 0;
 	return 0;
 }
 
@@ -651,6 +688,10 @@ static int psz_pstore_erase(struct pstore_record *record)
 		return psz_record_erase(cxt, cxt->ppsz);
 	case PSTORE_TYPE_CONSOLE:
 		return psz_record_erase(cxt, cxt->cpsz);
+	case PSTORE_TYPE_FTRACE:
+		if (record->id >= cxt->ftrace_max_cnt)
+			return -EINVAL;
+		return psz_record_erase(cxt, cxt->fpszs[record->id]);
 	default: return -EINVAL;
 	}
 }
@@ -792,6 +833,13 @@ static int notrace psz_pstore_write(struct pstore_record *record)
 		return psz_record_write(cxt->cpsz, record);
 	case PSTORE_TYPE_PMSG:
 		return psz_record_write(cxt->ppsz, record);
+	case PSTORE_TYPE_FTRACE: {
+		int zonenum = smp_processor_id();
+
+		if (!cxt->fpszs)
+			return -ENOSPC;
+		return psz_record_write(cxt->fpszs[zonenum], record);
+	}
 	default:
 		return -EINVAL;
 	}
@@ -807,6 +855,14 @@ static struct pstore_zone *psz_read_next_zone(struct psz_context *cxt)
 			return zone;
 	}
 
+	if (cxt->ftrace_read_cnt < cxt->ftrace_max_cnt)
+		/*
+		 * No need psz_old_ok(). Let psz_ftrace_read() do so for
+		 * combination. psz_ftrace_read() should traverse over
+		 * all zones in case of some zone without data.
+		 */
+		return cxt->fpszs[cxt->ftrace_read_cnt++];
+
 	if (cxt->pmsg_read_cnt == 0) {
 		cxt->pmsg_read_cnt++;
 		zone = cxt->ppsz;
@@ -881,6 +937,98 @@ static ssize_t psz_oops_read(struct pstore_zone *zone,
 	return size + hlen;
 }
 
+static int psz_ftrace_combine(char *src1_buf, size_t src1_size,
+		char *src2_buf, size_t src2_size,
+		char **dest_buf, size_t *dest_size)
+{
+	size_t src1_off, src2_off, total;
+	size_t src1_idx = 0, src2_idx = 0, merged_idx = 0;
+	void *merged_buf;
+	struct pstore_ftrace_record *mrec, *s1rec, *s2rec;
+	size_t record_size = sizeof(struct pstore_ftrace_record);
+
+	src1_off = src1_size % record_size;
+	src1_size -= src1_off;
+
+	src2_off = src2_size % record_size;
+	src2_size -= src2_off;
+
+	total = src1_size + src2_size;
+	merged_buf = kmalloc(total, GFP_KERNEL);
+	if (!merged_buf)
+		return -ENOMEM;
+
+	s1rec = (struct pstore_ftrace_record *)(src1_buf + src1_off);
+	s2rec = (struct pstore_ftrace_record *)(src2_buf + src2_off);
+	mrec = (struct pstore_ftrace_record *)(merged_buf);
+
+	while (src1_size > 0 && src2_size > 0) {
+		u64 s1_ts, s2_ts;
+
+		s1_ts = pstore_ftrace_read_timestamp(&s1rec[src1_idx]);
+		s2_ts = pstore_ftrace_read_timestamp(&s2rec[src2_idx]);
+		if (s1_ts < s2_ts) {
+			mrec[merged_idx++] = s1rec[src1_idx++];
+			src1_size -= record_size;
+		} else {
+			mrec[merged_idx++] = s2rec[src2_idx++];
+			src2_size -= record_size;
+		}
+	}
+
+	while (src1_size > 0) {
+		mrec[merged_idx++] = s1rec[src1_idx++];
+		src1_size -= record_size;
+	}
+
+	while (src2_size > 0) {
+		mrec[merged_idx++] = s2rec[src2_idx++];
+		src2_size -= record_size;
+	}
+
+	*dest_buf = merged_buf;
+	*dest_size = total;
+	return 0;
+}
+
+/* try to combine all ftrace zones */
+static ssize_t psz_ftrace_read(struct pstore_zone *zone,
+		struct pstore_record *record)
+{
+	struct psz_context *cxt = record->psi->data;
+	struct psz_buffer *buf;
+	char *dest;
+	size_t dest_size;
+	int ret;
+
+	if (!zone || !record)
+		return -ENOSPC;
+
+	if (!psz_old_ok(zone))
+		goto out;
+
+	buf = (struct psz_buffer *)zone->oldbuf;
+	if (!buf)
+		return -ENOMSG;
+
+	ret = psz_ftrace_combine(record->buf, record->size,
+			(char *)buf->data, atomic_read(&buf->datalen),
+			&dest, &dest_size);
+	if (unlikely(ret))
+		return ret;
+
+	kfree(record->buf);
+	record->buf = dest;
+	record->size = dest_size;
+
+out:
+	if (cxt->ftrace_read_cnt < cxt->ftrace_max_cnt)
+		/* then, read next ftrace zone */
+		return -ENOMSG;
+	record->id = 0;
+	return record->size ? record->size : -ENOMSG;
+}
+
 static ssize_t psz_record_read(struct pstore_zone *zone,
 		struct pstore_record *record)
 {
@@ -931,6 +1079,9 @@ static ssize_t psz_pstore_read(struct pstore_record *record)
 		readop = psz_oops_read;
 		record->id = cxt->oops_read_cnt - 1;
 		break;
+	case PSTORE_TYPE_FTRACE:
+		readop = psz_ftrace_read;
+		break;
 	case PSTORE_TYPE_CONSOLE:
 		fallthrough;
 	case PSTORE_TYPE_PMSG:
@@ -1082,6 +1233,8 @@ static void psz_free_all_zones(struct psz_context *cxt)
 		psz_free_zone(&cxt->ppsz);
 	if (cxt->cpsz)
 		psz_free_zone(&cxt->cpsz);
+	if (cxt->fpszs)
+		psz_free_zones(&cxt->fpszs, &cxt->ftrace_max_cnt);
 }
 
 static int psz_alloc_zones(struct psz_context *cxt)
@@ -1106,6 +1259,16 @@ static int psz_alloc_zones(struct psz_context *cxt)
 		goto free_out;
 	}
 
+	off_size += info->ftrace_size;
+	cxt->fpszs = psz_init_zones(PSTORE_TYPE_FTRACE, &off,
+			info->ftrace_size,
+			info->ftrace_size / nr_cpu_ids,
+			&cxt->ftrace_max_cnt);
+	if (IS_ERR(cxt->fpszs)) {
+		err = PTR_ERR(cxt->fpszs);
+		goto free_out;
+	}
+
 	cxt->opszs = psz_init_zones(PSTORE_TYPE_DMESG, &off,
 			info->total_size - off_size,
 			info->kmsg_size, &cxt->oops_max_cnt);
@@ -1168,6 +1331,7 @@ int register_pstore_zone(struct pstore_zone_info *info)
 	check_size(kmsg_size, SECTOR_SIZE);
 	check_size(pmsg_size, SECTOR_SIZE);
 	check_size(console_size, SECTOR_SIZE);
+	check_size(ftrace_size, SECTOR_SIZE);
 
 #undef check_size
 
@@ -1196,6 +1360,7 @@ int register_pstore_zone(struct pstore_zone_info *info)
 	pr_debug("\toops size : %ld Bytes\n", info->kmsg_size);
 	pr_debug("\tpmsg size : %ld Bytes\n", info->pmsg_size);
 	pr_debug("\tconsole size : %ld Bytes\n", info->console_size);
+	pr_debug("\tftrace size : %ld Bytes\n", info->ftrace_size);
 
 	err = psz_alloc_zones(cxt);
 	if (err) {
@@ -1232,6 +1397,10 @@ int register_pstore_zone(struct pstore_zone_info *info)
 		cxt->pstore.flags |= PSTORE_FLAGS_CONSOLE;
 		pr_cont(" console");
 	}
+	if (info->ftrace_size) {
+		cxt->pstore.flags |= PSTORE_FLAGS_FTRACE;
+		pr_cont(" ftrace");
+	}
 	pr_cont("\n");
 
 	err = pstore_register(&cxt->pstore);
diff --git a/include/linux/pstore_zone.h b/include/linux/pstore_zone.h
index da294e6d7661..94f441b8b616 100644
--- a/include/linux/pstore_zone.h
+++ b/include/linux/pstore_zone.h
@@ -19,6 +19,7 @@ typedef ssize_t (*psz_write_op)(const char *, size_t, loff_t);
  * @max_reason: Maximum kmsg dump reason to store.
  * @pmsg_size:	The size of pmsg zone which is the same as @kmsg_size.
  * @console_size:The size of console zone which is the same as @kmsg_size.
+ * @ftrace_size:The size of ftrace zone which is the same as @kmsg_size.
  * @read:	The general read operation. Both of the function parameters
  *		@size and @offset are relative value to storage.
  *		On success, the number of bytes should be returned, others
@@ -37,6 +38,7 @@ struct pstore_zone_info {
 	int max_reason;
 	unsigned long pmsg_size;
 	unsigned long console_size;
+	unsigned long ftrace_size;
 	psz_read_op read;
 	psz_write_op write;
 	psz_write_op panic_write;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
