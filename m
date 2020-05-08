Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34266C38A2A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 06:41:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E16E720735
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 06:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iqlYSckz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YOTmAQDD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E16E720735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXp4E86Mh6AwbRtcr3PSuaqAJxWXIX6z4e/W5Cp+6RE=; b=iqlYSckz8b0V+b
	cvV6XnsT2wTbaO8JZLjrxicPOIPPBE7AgxYOtZo/Q6pZqjh/92myIR/yNZogzkBYOpPk4WQc6gpFL
	+HjqwTyqwBpgSLZZ95bS1W/Z8CODCYJWQdmw4mB4FfiUQiU25wwp9Zld/x4sqYO5koqRuiuVIsxgK
	qlDxwOHei09wEHCbiRuyfbVW2lpbVzNo0eENaPkR6kFan2VEDADD8xJHTvw80JTfYXvDMpUZDqG8/
	Jaf6hHzGOSTDfH56rCH6lPNjSUppAtl9LbzcTZyCFaI19b8zy1l3LE0rXUM6wowXO83TvyDG9VDLF
	m81dfCdkFkgASRHugFXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWwhc-00015S-3j; Fri, 08 May 2020 06:41:44 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWwgG-0008Fz-9Y
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 06:40:26 +0000
Received: by mail-pl1-x643.google.com with SMTP id t7so312978plr.0
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2020 23:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Evg0cSfiErrWrWXRVHVoB8qTvQxJorMZa+nTiI2uOKQ=;
 b=YOTmAQDDPSfcMR5VuDLMAP67K3PEk9dn3b690OtKYLyH/gHytaunOWZ7r7d1mWcLoo
 sixCsI/O3xEYx70LGAkmeTgSHZ2GkSGSznwUIJP7xQFBHC6q16vo+1DQLdgEySMj/7Tx
 KFY/TJ6zr8mkoHjN8zYM0yKsELtiox1MeSxMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Evg0cSfiErrWrWXRVHVoB8qTvQxJorMZa+nTiI2uOKQ=;
 b=g9eqbpDmtyLX5UJZxC2qU+cvxVwDUVTJvWNzpxmx0yujREjsJ98wMtfD54OfWOalDA
 M8x2U2fE56leqfU+TOV1tem1vDCg+RaaunPv3sWLDWuKBzz6vTjYKGZnifsrXBxEn3kP
 9aUYXmwbDkBkwWO3d2jzwm4JoM3MO43Gh/PCETiCxev68artWUFI7igJRMF0twWPCmvN
 6C5f55xd3hBw5Uf3IK4bKQM+OPPCkiw3JlUIJkdCXzyzadLiAtgYLCc5oOPBRQlIt2uv
 SCHPsHLTlHoVyZeAmg9/04wO9eCzyfRp7hXeus4L7g1HUzcySlPhIYRbhDHsO6WwXMsx
 ELEA==
X-Gm-Message-State: AGi0PuaLu+oMpF5poF2i4d/0MbT0IB+WqKvo8mOHIu6rrUnlBvw/BG4E
 EFsJc/5S+Gq4tULqZs714q/Bhg==
X-Google-Smtp-Source: APiQypJWCRCfVDfNOfjNyIx9b2IMABYnPTndrbFIOKbG5o9RKYzoJdSpHv3/6ZBwrmrgb9v/Ufv6hA==
X-Received: by 2002:a17:902:7c16:: with SMTP id
 x22mr993971pll.244.1588920018918; 
 Thu, 07 May 2020 23:40:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id ce21sm1516074pjb.51.2020.05.07.23.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:40:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v4 05/12] pstore/blk: Add support for pmsg frontend
Date: Thu,  7 May 2020 23:39:57 -0700
Message-Id: <20200508064004.57898-6-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508064004.57898-1-keescook@chromium.org>
References: <20200508064004.57898-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_234020_469106_A32FC0F2 
X-CRM114-Status: GOOD (  24.18  )
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

Add pmsg support to pstore/blk (through pstore/zone). To enable, pmsg_size
must be greater than 0 and a multiple of 4096.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Link: https://lore.kernel.org/r/1585126506-18635-5-git-send-email-liaoweixiong@allwinnertech.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/Kconfig           |  12 ++
 fs/pstore/blk.c             |   9 ++
 fs/pstore/zone.c            | 268 ++++++++++++++++++++++++++++++++++--
 include/linux/pstore_zone.h |   2 +
 4 files changed, 281 insertions(+), 10 deletions(-)

diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
index 92ba73bd0b62..f18cd126d83f 100644
--- a/fs/pstore/Kconfig
+++ b/fs/pstore/Kconfig
@@ -224,3 +224,15 @@ config PSTORE_BLK_MAX_REASON
 
 	  NOTE that, both Kconfig and module parameters can configure
 	  pstore/blk, but module parameters have priority over Kconfig.
+
+config PSTORE_BLK_PMSG_SIZE
+	int "Size in Kbytes of pmsg to store"
+	depends on PSTORE_BLK
+	depends on PSTORE_PMSG
+	default 64
+	help
+	  This just sets size of pmsg (pmsg_size) for pstore/blk. The size is
+	  in KB and must be a multiple of 4.
+
+	  NOTE that, both Kconfig and module parameters can configure
+	  pstore/blk, but module parameters have priority over Kconfig.
diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index d1c3074aa128..401e5ba66a5f 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -24,6 +24,14 @@ module_param(max_reason, int, 0400);
 MODULE_PARM_DESC(max_reason,
 		 "maximum reason for kmsg dump (default 2: Oops and Panic)");
 
+#if IS_ENABLED(CONFIG_PSTORE_PMSG)
+static long pmsg_size = CONFIG_PSTORE_BLK_PMSG_SIZE;
+#else
+static long pmsg_size = -1;
+#endif
+module_param(pmsg_size, long, 0400);
+MODULE_PARM_DESC(pmsg_size, "pmsg size in kbytes");
+
 /*
  * blkdev - The block device to use.
  *
@@ -124,6 +132,7 @@ static int psblk_register_do(struct psblk_device *dev)
 	}
 
 	verify_size(kmsg_size, 4096, dev->flags & PSTORE_FLAGS_DMESG);
+	verify_size(pmsg_size, 4096, dev->flags & PSTORE_FLAGS_PMSG);
 #undef verify_size
 
 	pstore_zone_info->total_size = dev->total_size;
diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index 6c25c443c8e2..f472b06a6c14 100644
--- a/fs/pstore/zone.c
+++ b/fs/pstore/zone.c
@@ -23,12 +23,14 @@
  *
  * @sig: signature to indicate header (PSZ_SIG xor PSZONE-type value)
  * @datalen: length of data in @data
+ * @start: offset into @data where the beginning of the stored bytes begin
  * @data: zone data.
  */
 struct psz_buffer {
 #define PSZ_SIG (0x43474244) /* DBGC */
 	uint32_t sig;
 	atomic_t datalen;
+	atomic_t start;
 	uint8_t data[];
 };
 
@@ -84,9 +86,11 @@ struct pstore_zone {
  * struct psz_context - all about running state of pstore/zone
  *
  * @opszs: oops/panic storage zones
+ * @ppsz: pmsg storage zone
  * @oops_max_cnt: max count of @opszs
  * @oops_read_cnt: counter to read oops zone
  * @oops_write_cnt: counter to write
+ * @pmsg_read_cnt: counter to read pmsg zone
  * @oops_counter: counter to oops
  * @panic_counter: counter to panic
  * @recovered: whether finish recovering data from storage
@@ -97,9 +101,11 @@ struct pstore_zone {
  */
 struct psz_context {
 	struct pstore_zone **opszs;
+	struct pstore_zone *ppsz;
 	unsigned int oops_max_cnt;
 	unsigned int oops_read_cnt;
 	unsigned int oops_write_cnt;
+	unsigned int pmsg_read_cnt;
 	/*
 	 * the counter should be recovered when recover.
 	 * It records the oops/panic times after burning rather than booting.
@@ -139,6 +145,11 @@ static inline int buffer_datalen(struct pstore_zone *zone)
 	return atomic_read(&zone->buffer->datalen);
 }
 
+static inline int buffer_start(struct pstore_zone *zone)
+{
+	return atomic_read(&zone->buffer->start);
+}
+
 static inline bool is_on_panic(void)
 {
 	struct psz_context *cxt = &psz_cxt;
@@ -146,10 +157,10 @@ static inline bool is_on_panic(void)
 	return atomic_read(&cxt->on_panic);
 }
 
-static ssize_t psz_zone_read(struct pstore_zone *zone, char *buf,
+static ssize_t psz_zone_read_buffer(struct pstore_zone *zone, char *buf,
 		size_t len, unsigned long off)
 {
-	if (!buf || !zone->buffer)
+	if (!buf || !zone || !zone->buffer)
 		return -EINVAL;
 	if (off > zone->buffer_size)
 		return -EINVAL;
@@ -158,6 +169,18 @@ static ssize_t psz_zone_read(struct pstore_zone *zone, char *buf,
 	return len;
 }
 
+static int psz_zone_read_oldbuf(struct pstore_zone *zone, char *buf,
+		size_t len, unsigned long off)
+{
+	if (!buf || !zone || !zone->oldbuf)
+		return -EINVAL;
+	if (off > zone->buffer_size)
+		return -EINVAL;
+	len = min_t(size_t, len, zone->buffer_size - off);
+	memcpy(buf, zone->oldbuf->data + off, len);
+	return 0;
+}
+
 static int psz_zone_write(struct pstore_zone *zone,
 		enum psz_flush_mode flush_mode, const char *buf,
 		size_t len, unsigned long off)
@@ -413,6 +436,93 @@ static int psz_recover_oops(struct psz_context *cxt)
 	return ret;
 }
 
+static int psz_recover_zone(struct psz_context *cxt, struct pstore_zone *zone)
+{
+	struct pstore_zone_info *info = cxt->pstore_zone_info;
+	struct psz_buffer *oldbuf, tmpbuf;
+	int ret = 0;
+	char *buf;
+	ssize_t rcnt, len, start, off;
+
+	if (!zone || zone->oldbuf)
+		return 0;
+
+	if (is_on_panic()) {
+		/* save data as much as possible */
+		psz_flush_dirty_zone(zone);
+		return 0;
+	}
+
+	if (unlikely(!info->read))
+		return -EINVAL;
+
+	len = sizeof(struct psz_buffer);
+	rcnt = info->read((char *)&tmpbuf, len, zone->off);
+	if (rcnt != len) {
+		pr_debug("read zone %s failed\n", zone->name);
+		return (int)rcnt < 0 ? (int)rcnt : -EIO;
+	}
+
+	if (tmpbuf.sig != zone->buffer->sig) {
+		pr_debug("no valid data in zone %s\n", zone->name);
+		return 0;
+	}
+
+	if (zone->buffer_size < atomic_read(&tmpbuf.datalen) ||
+		zone->buffer_size < atomic_read(&tmpbuf.start)) {
+		pr_info("found overtop zone: %s: off %lld, size %zu\n",
+				zone->name, zone->off, zone->buffer_size);
+		/* just keep going */
+		return 0;
+	}
+
+	if (!atomic_read(&tmpbuf.datalen)) {
+		pr_debug("found erased zone: %s: off %lld, size %zu, datalen %d\n",
+				zone->name, zone->off, zone->buffer_size,
+				atomic_read(&tmpbuf.datalen));
+		return 0;
+	}
+
+	pr_debug("found nice zone: %s: off %lld, size %zu, datalen %d\n",
+			zone->name, zone->off, zone->buffer_size,
+			atomic_read(&tmpbuf.datalen));
+
+	len = atomic_read(&tmpbuf.datalen) + sizeof(*oldbuf);
+	oldbuf = kzalloc(len, GFP_KERNEL);
+	if (!oldbuf)
+		return -ENOMEM;
+
+	memcpy(oldbuf, &tmpbuf, sizeof(*oldbuf));
+	buf = (char *)oldbuf + sizeof(*oldbuf);
+	len = atomic_read(&oldbuf->datalen);
+	start = atomic_read(&oldbuf->start);
+	off = zone->off + sizeof(*oldbuf);
+
+	/* get part of data */
+	rcnt = info->read(buf, len - start, off + start);
+	if (rcnt != len - start) {
+		pr_err("read zone %s failed\n", zone->name);
+		ret = (int)rcnt < 0 ? (int)rcnt : -EIO;
+		goto free_oldbuf;
+	}
+
+	/* get the rest of data */
+	rcnt = info->read(buf + len - start, start, off);
+	if (rcnt != start) {
+		pr_err("read zone %s failed\n", zone->name);
+		ret = (int)rcnt < 0 ? (int)rcnt : -EIO;
+		goto free_oldbuf;
+	}
+
+	zone->oldbuf = oldbuf;
+	psz_flush_dirty_zone(zone);
+	return 0;
+
+free_oldbuf:
+	kfree(oldbuf);
+	return ret;
+}
+
 /**
  * psz_recovery() - recover data from storage
  * @cxt: the context of pstore/zone
@@ -432,6 +542,10 @@ static inline int psz_recovery(struct psz_context *cxt)
 	if (ret)
 		goto recover_fail;
 
+	ret = psz_recover_zone(cxt, cxt->ppsz);
+	if (ret)
+		goto recover_fail;
+
 	pr_debug("recover end!\n");
 	atomic_set(&cxt->recovered, 1);
 	return 0;
@@ -446,9 +560,17 @@ static int psz_pstore_open(struct pstore_info *psi)
 	struct psz_context *cxt = psi->data;
 
 	cxt->oops_read_cnt = 0;
+	cxt->pmsg_read_cnt = 0;
 	return 0;
 }
 
+static inline bool psz_old_ok(struct pstore_zone *zone)
+{
+	if (zone && zone->oldbuf && atomic_read(&zone->oldbuf->datalen))
+		return true;
+	return false;
+}
+
 static inline bool psz_ok(struct pstore_zone *zone)
 {
 	if (zone && zone->buffer && buffer_datalen(zone))
@@ -473,6 +595,25 @@ static inline int psz_oops_erase(struct psz_context *cxt,
 	return psz_zone_write(zone, FLUSH_META, NULL, 0, 0);
 }
 
+static inline int psz_record_erase(struct psz_context *cxt,
+		struct pstore_zone *zone)
+{
+	if (unlikely(!psz_old_ok(zone)))
+		return 0;
+
+	kfree(zone->oldbuf);
+	zone->oldbuf = NULL;
+	/*
+	 * if there are new data in zone buffer, that means the old data
+	 * are already invalid. It is no need to flush 0 (erase) to
+	 * block device.
+	 */
+	if (!buffer_datalen(zone))
+		return psz_zone_write(zone, FLUSH_META, NULL, 0, 0);
+	psz_flush_dirty_zone(zone);
+	return 0;
+}
+
 static int psz_pstore_erase(struct pstore_record *record)
 {
 	struct psz_context *cxt = record->psi->data;
@@ -482,6 +623,8 @@ static int psz_pstore_erase(struct pstore_record *record)
 		if (record->id >= cxt->oops_max_cnt)
 			return -EINVAL;
 		return psz_oops_erase(cxt, cxt->opszs[record->id], record);
+	case PSTORE_TYPE_PMSG:
+		return psz_record_erase(cxt, cxt->ppsz);
 	default:
 		return -EINVAL;
 	}
@@ -502,8 +645,10 @@ static void psz_write_kmsg_hdr(struct pstore_zone *zone,
 	hdr->reason = record->reason;
 	if (hdr->reason == KMSG_DUMP_OOPS)
 		hdr->counter = ++cxt->oops_counter;
-	else
+	else if (hdr->reason == KMSG_DUMP_PANIC)
 		hdr->counter = ++cxt->panic_counter;
+	else
+		hdr->counter = 0;
 }
 
 static inline int notrace psz_oops_write_record(struct psz_context *cxt,
@@ -553,6 +698,53 @@ static int notrace psz_oops_write(struct psz_context *cxt,
 	return 0;
 }
 
+static int notrace psz_record_write(struct pstore_zone *zone,
+		struct pstore_record *record)
+{
+	size_t start, rem;
+	int cnt = record->size;
+	bool is_full_data = false;
+	char *buf = record->buf;
+
+	if (!zone || !record)
+		return -ENOSPC;
+
+	if (atomic_read(&zone->buffer->datalen) >= zone->buffer_size)
+		is_full_data = true;
+
+	if (unlikely(cnt > zone->buffer_size)) {
+		buf += cnt - zone->buffer_size;
+		cnt = zone->buffer_size;
+	}
+
+	start = buffer_start(zone);
+	rem = zone->buffer_size - start;
+	if (unlikely(rem < cnt)) {
+		psz_zone_write(zone, FLUSH_PART, buf, rem, start);
+		buf += rem;
+		cnt -= rem;
+		start = 0;
+		is_full_data = true;
+	}
+
+	atomic_set(&zone->buffer->start, cnt + start);
+	psz_zone_write(zone, FLUSH_PART, buf, cnt, start);
+
+	/**
+	 * psz_zone_write will set datalen as start + cnt.
+	 * It work if actual data length lesser than buffer size.
+	 * If data length greater than buffer size, pmsg will rewrite to
+	 * beginning of zone, which make buffer->datalen wrongly.
+	 * So we should reset datalen as buffer size once actual data length
+	 * greater than buffer size.
+	 */
+	if (is_full_data) {
+		atomic_set(&zone->buffer->datalen, zone->buffer_size);
+		psz_zone_write(zone, FLUSH_META, NULL, 0, 0);
+	}
+	return 0;
+}
+
 static int notrace psz_pstore_write(struct pstore_record *record)
 {
 	struct psz_context *cxt = record->psi->data;
@@ -564,6 +756,8 @@ static int notrace psz_pstore_write(struct pstore_record *record)
 	switch (record->type) {
 	case PSTORE_TYPE_DMESG:
 		return psz_oops_write(cxt, record);
+	case PSTORE_TYPE_PMSG:
+		return psz_record_write(cxt->ppsz, record);
 	default:
 		return -EINVAL;
 	}
@@ -579,6 +773,13 @@ static struct pstore_zone *psz_read_next_zone(struct psz_context *cxt)
 			return zone;
 	}
 
+	if (cxt->pmsg_read_cnt == 0) {
+		cxt->pmsg_read_cnt++;
+		zone = cxt->ppsz;
+		if (psz_old_ok(zone))
+			return zone;
+	}
+
 	return NULL;
 }
 
@@ -629,7 +830,7 @@ static ssize_t psz_oops_read(struct pstore_zone *zone,
 			return -ENOMEM;
 	}
 
-	size = psz_zone_read(zone, record->buf + hlen, size,
+	size = psz_zone_read_buffer(zone, record->buf + hlen, size,
 			sizeof(struct psz_oops_header) < 0);
 	if (unlikely(size < 0)) {
 		kfree(record->buf);
@@ -639,6 +840,32 @@ static ssize_t psz_oops_read(struct pstore_zone *zone,
 	return size + hlen;
 }
 
+static ssize_t psz_record_read(struct pstore_zone *zone,
+		struct pstore_record *record)
+{
+	size_t len;
+	struct psz_buffer *buf;
+
+	if (!zone || !record)
+		return -ENOSPC;
+
+	buf = (struct psz_buffer *)zone->oldbuf;
+	if (!buf)
+		return -ENOMSG;
+
+	len = atomic_read(&buf->datalen);
+	record->buf = kmalloc(len, GFP_KERNEL);
+	if (!record->buf)
+		return -ENOMEM;
+
+	if (unlikely(psz_zone_read_oldbuf(zone, record->buf, len, 0))) {
+		kfree(record->buf);
+		return -ENOMSG;
+	}
+
+	return len;
+}
+
 static ssize_t psz_pstore_read(struct pstore_record *record)
 {
 	struct psz_context *cxt = record->psi->data;
@@ -663,6 +890,9 @@ static ssize_t psz_pstore_read(struct pstore_record *record)
 		readop = psz_oops_read;
 		record->id = cxt->oops_read_cnt - 1;
 		break;
+	case PSTORE_TYPE_PMSG:
+		readop = psz_record_read;
+		break;
 	default:
 		goto next_zone;
 	}
@@ -718,8 +948,10 @@ static struct pstore_zone *psz_init_zone(enum pstore_type_id type,
 	zone->type = type;
 	zone->buffer_size = size - sizeof(struct psz_buffer);
 	zone->buffer->sig = type ^ PSZ_SIG;
+	zone->oldbuf = NULL;
 	atomic_set(&zone->dirty, 0);
 	atomic_set(&zone->buffer->datalen, 0);
+	atomic_set(&zone->buffer->start, 0);
 
 	*off += size;
 
@@ -803,6 +1035,8 @@ static void psz_free_all_zones(struct psz_context *cxt)
 {
 	if (cxt->opszs)
 		psz_free_zones(&cxt->opszs, &cxt->oops_max_cnt);
+	if (cxt->ppsz)
+		psz_free_zone(&cxt->ppsz);
 }
 
 static int psz_alloc_zones(struct psz_context *cxt)
@@ -810,18 +1044,26 @@ static int psz_alloc_zones(struct psz_context *cxt)
 	struct pstore_zone_info *info = cxt->pstore_zone_info;
 	loff_t off = 0;
 	int err;
-	size_t size;
+	size_t off_size = 0;
 
-	size = info->total_size;
-	cxt->opszs = psz_init_zones(PSTORE_TYPE_DMESG, &off, size,
+	off_size += info->pmsg_size;
+	cxt->ppsz = psz_init_zone(PSTORE_TYPE_PMSG, &off, info->pmsg_size);
+	if (IS_ERR(cxt->ppsz)) {
+		err = PTR_ERR(cxt->ppsz);
+		goto free_out;
+	}
+
+	cxt->opszs = psz_init_zones(PSTORE_TYPE_DMESG, &off,
+			info->total_size - off_size,
 			info->kmsg_size, &cxt->oops_max_cnt);
 	if (IS_ERR(cxt->opszs)) {
 		err = PTR_ERR(cxt->opszs);
-		goto fail_out;
+		goto free_out;
 	}
 
 	return 0;
-fail_out:
+free_out:
+	psz_free_all_zones(cxt);
 	return err;
 }
 
@@ -844,7 +1086,7 @@ int register_pstore_zone(struct pstore_zone_info *info)
 		return -EINVAL;
 	}
 
-	if (!info->kmsg_size) {
+	if (!info->kmsg_size && !info->pmsg_size) {
 		pr_warn("at least one of the records be non-zero\n");
 		return -EINVAL;
 	}
@@ -871,6 +1113,7 @@ int register_pstore_zone(struct pstore_zone_info *info)
 
 	check_size(total_size, 4096);
 	check_size(kmsg_size, SECTOR_SIZE);
+	check_size(pmsg_size, SECTOR_SIZE);
 
 #undef check_size
 
@@ -897,6 +1140,7 @@ int register_pstore_zone(struct pstore_zone_info *info)
 	pr_debug("register %s with properties:\n", info->name);
 	pr_debug("\ttotal size : %ld Bytes\n", info->total_size);
 	pr_debug("\toops size : %ld Bytes\n", info->kmsg_size);
+	pr_debug("\tpmsg size : %ld Bytes\n", info->pmsg_size);
 
 	err = psz_alloc_zones(cxt);
 	if (err) {
@@ -925,6 +1169,10 @@ int register_pstore_zone(struct pstore_zone_info *info)
 			pr_cont(",panic_write");
 		pr_cont(")");
 	}
+	if (info->pmsg_size) {
+		cxt->pstore.flags |= PSTORE_FLAGS_PMSG;
+		pr_cont(" pmsg");
+	}
 	pr_cont("\n");
 
 	err = pstore_register(&cxt->pstore);
diff --git a/include/linux/pstore_zone.h b/include/linux/pstore_zone.h
index a6a79ff1351b..39c2cb944123 100644
--- a/include/linux/pstore_zone.h
+++ b/include/linux/pstore_zone.h
@@ -17,6 +17,7 @@ typedef ssize_t (*psz_write_op)(const char *, size_t, loff_t);
  * @kmsg_size:	The size of oops/panic zone. Zero means disabled, otherwise,
  *		it must be multiple of SECTOR_SIZE(512 Bytes).
  * @max_reason: Maximum kmsg dump reason to store.
+ * @pmsg_size:	The size of pmsg zone which is the same as @kmsg_size.
  * @read:	The general read operation. Both of the function parameters
  *		@size and @offset are relative value to storage.
  *		On success, the number of bytes should be returned, others
@@ -33,6 +34,7 @@ struct pstore_zone_info {
 	unsigned long total_size;
 	unsigned long kmsg_size;
 	int max_reason;
+	unsigned long pmsg_size;
 	psz_read_op read;
 	psz_write_op write;
 	psz_write_op panic_write;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
