Return-Path: <SRS0=r2JG=TA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477CEC43219
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 14:29:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1765120835
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 14:29:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NVZdUeB7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZTzPuiq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1765120835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gyw3LcIkNNx1vB6jmT+3Svdg/W+E4dTwcWTJYOUBQLg=; b=NVZ
	dUeB77naDzd9cjPjAP58ueBr59hTTBTix28KggvGBR4qNCpmTv6IC33RQhMuM8NYsbFeuaWdQfM6B
	Dsat3/0fYGJh+JQylRgbaJTfYG6w/5IGG+iIQNcv8yhjzKz40Fe9zEo5rGT058+y9PTJw02bK3qwQ
	gL5AyEPAUFZxqpEWm3Um6wXu0w6ApgyJZ9+hhliJOw4QU92LYFWdFd3LRektyUOaXhumVzM53Ob1D
	/c3fQHIC58zzgjYX9QZDdSzPvCXW4VtLnYP22Gjphcx/MRPjwZ7CfFhyiPQ/hIys0K4EPznA6e+wL
	tlC0f5I2pSylwM2nHuTT9bW90Iv5zYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLTkv-0007t1-OF; Tue, 30 Apr 2019 14:29:13 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLTks-0007sa-9C
 for linux-mtd@lists.infradead.org; Tue, 30 Apr 2019 14:29:11 +0000
Received: by mail-pl1-x644.google.com with SMTP id z8so6819346pln.4
 for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2019 07:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gb2/qo4daIM4/XD26mQy9x/AtGcglrtxYaVLVttfznM=;
 b=rZTzPuiqcsSaDWwRFjcznNaRL9JbSxWVykC81b4a5zNPB0MgbpfZCPYQuMJZhzoO8S
 4Bni0xV/aea/YGX0BMNBvrj7EN0mlTaqu9OL1Gu3HFd6Ee/2x2mYcDNHXrDdzQIh0PCR
 jCRAH5OC/qrKncxtIrna01UP0LeJqznC/1HNAFVCj8geU8Bx11eUCaEHY3K1i+M8gapX
 nMBtVd8INq+r7cc9XH+mtmD28ruwpwynt8CeJjuIY6BP63lptbUSnZ4K2/XNLQRF6Q5B
 fBLoJtsro0/r7HFZKdi+rFFt7cOCu3ll6nhjvNzo6daBhe4mMzN78bRUfttYBbY9POFQ
 jNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gb2/qo4daIM4/XD26mQy9x/AtGcglrtxYaVLVttfznM=;
 b=kJdkaSliPV/I6oxqJx0WZpUvio3qBtEN/PFslQ+x1t3jNvgJ+oYdPdMVMAzdgfF0gq
 K3S6wNwNxPXzElB5tm/uDt14aNZhGmgF9B/OARPGf3FSC6A/qc/hu4KTvzbHVqz/BPTe
 FatpBSm3iyngymaM/Qwnbdg2OLFv65Y3AT0Xa0Z+pA2/pXH77P3v55OPx50FbUYbweA1
 xuHpubQXiA2N/vyv97pfrebQ5f55X6E+z9am6qmLX91TJDyEevUGa2L5nMrsGknEnp0w
 XhB2/qY9QHI8TCiIw9goBcNVxI/M36eGB4jIEc1Uaam6PZLZvrNXn+PeHb3yyEL4eZkV
 oTkg==
X-Gm-Message-State: APjAAAUQjZ+St30B+wPbf/84jaizTkqo5/DzG6IxT2XBqCXkUXKnLXXX
 nT+GNnl4aEag+RacVU4hVmZGMf2h
X-Google-Smtp-Source: APXvYqx0wRs5VjHk6+IjX8yLFiTwu9iGdA9DOCwU/HCgf9V0IJNyo7XIczIiihHMfM7Nzz7TftkBwA==
X-Received: by 2002:a17:902:112a:: with SMTP id
 d39mr61897298pla.47.1556634547834; 
 Tue, 30 Apr 2019 07:29:07 -0700 (PDT)
Received: from localhost.localdomain (fpa056d502.hygk105.ap.nuro.jp.
 [160.86.213.2])
 by smtp.gmail.com with ESMTPSA id h4sm38600666pgv.61.2019.04.30.07.29.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 07:29:06 -0700 (PDT)
From: Yuichi Nakai <xoxyuxu@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: wbuf->offs must be aligned to max_write_size
Date: Tue, 30 Apr 2019 23:28:23 +0900
Message-Id: <20190430142823.28044-1-xoxyuxu@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_072910_322379_97387768 
X-CRM114-Status: GOOD (  17.19  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Yuichi Nakai <xoxyuxu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UBIFS has a journal recovery function.
It is useful for devices that experience a power failure.

And as per comment of ubifs_wbuf_sync_nolock(), wbuf is optimized for
performance by writing aligned max_write_size.

In following environment, checking offset is not aligned to max_write_buffer.

- Using a SPI-NOR device with a write buffer size over 256 bytes
  For example: Micron MT28EW01GABA, its write buffer is 512 words
- LEB hedaer size is 64 bytes
- UBI header size is 64 bytes

So if write buffer command make a crrupt data in a block,
is_last_write() and no_more_nodes() can not check correctly.

This patch adjusts wbuf writes to max_write_size, taking into account
leb_start. The recovery process also checks the data at the corrected
alignment position.

Signed-off-by: Yuichi Nakai <xoxyuxu@gmail.com>
---
 fs/ubifs/debug.c    |  2 +-
 fs/ubifs/io.c       | 16 +++++++++-------
 fs/ubifs/misc.h     | 13 +++++++++++++
 fs/ubifs/recovery.c |  6 +++---
 4 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index c49ff50fdceb..d8c1fa6d182d 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2565,7 +2565,7 @@ static int corrupt_data(const struct ubifs_info *c, const void *buf,
 
 	from = prandom_u32() % len;
 	/* Corruption span max to end of write unit */
-	to = min(len, ALIGN(from + 1, c->max_write_size));
+	to = min(len, ubifs_align_max_write(c, from + 1));
 
 	ubifs_warn(c, "filled bytes %u-%u with %s", from, to - 1,
 		   ffs ? "0xFFs" : "random data");
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index d124117efd42..06ccaeb4c5d9 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -564,7 +564,8 @@ int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
 	ubifs_assert(c, wbuf->size % c->min_io_size == 0);
 	ubifs_assert(c, !c->ro_media && !c->ro_mount);
 	if (c->leb_size - wbuf->offs >= c->max_write_size)
-		ubifs_assert(c, !((wbuf->offs + wbuf->size) % c->max_write_size));
+		ubifs_assert(c, !((c->leb_start + wbuf->offs + wbuf->size)
+					% c->max_write_size));
 
 	if (c->ro_error)
 		return -EROFS;
@@ -595,8 +596,8 @@ int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
 	 */
 	if (c->leb_size - wbuf->offs < c->max_write_size)
 		wbuf->size = c->leb_size - wbuf->offs;
-	else if (wbuf->offs & (c->max_write_size - 1))
-		wbuf->size = ALIGN(wbuf->offs, c->max_write_size) - wbuf->offs;
+	else if ((c->leb_start + wbuf->offs) & (c->max_write_size - 1))
+		wbuf->size = ubifs_align_max_write(wbuf->offs) - wbuf->offs;
 	else
 		wbuf->size = c->max_write_size;
 	wbuf->avail = wbuf->size;
@@ -636,8 +637,8 @@ int ubifs_wbuf_seek_nolock(struct ubifs_wbuf *wbuf, int lnum, int offs)
 	wbuf->offs = offs;
 	if (c->leb_size - wbuf->offs < c->max_write_size)
 		wbuf->size = c->leb_size - wbuf->offs;
-	else if (wbuf->offs & (c->max_write_size - 1))
-		wbuf->size = ALIGN(wbuf->offs, c->max_write_size) - wbuf->offs;
+	else if ((c->leb_start + wbuf->offs) & (c->max_write_size - 1))
+		wbuf->size = ubifs_align_max_write(wbuf->offs) - wbuf->offs;
 	else
 		wbuf->size = c->max_write_size;
 	wbuf->avail = wbuf->size;
@@ -746,7 +747,8 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	ubifs_assert(c, !c->ro_media && !c->ro_mount);
 	ubifs_assert(c, !c->space_fixup);
 	if (c->leb_size - wbuf->offs >= c->max_write_size)
-		ubifs_assert(c, !((wbuf->offs + wbuf->size) % c->max_write_size));
+		ubifs_assert(c, !((c->leb_start + wbuf->offs + wbuf->size)
+					% c->max_write_size));
 
 	if (c->leb_size - wbuf->offs - wbuf->used < aligned_len) {
 		err = -ENOSPC;
@@ -813,7 +815,7 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 		len -= wbuf->avail;
 		aligned_len -= wbuf->avail;
 		written += wbuf->avail;
-	} else if (wbuf->offs & (c->max_write_size - 1)) {
+	} else if ((c->leb_start + wbuf->offs) & (c->max_write_size - 1)) {
 		/*
 		 * The write-buffer offset is not aligned to
 		 * @c->max_write_size and @wbuf->size is less than
diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
index 6f87237fdbf4..269350749ce7 100644
--- a/fs/ubifs/misc.h
+++ b/fs/ubifs/misc.h
@@ -290,4 +290,17 @@ static inline int ubifs_next_log_lnum(const struct ubifs_info *c, int lnum)
 
 const char *ubifs_assert_action_name(struct ubifs_info *c);
 
+/**
+ * ubifs_align_max_write -
+ * @c: UBIFS file-system description object
+ * @offs: logical eraseblock offset to aligned to
+ *
+ * This function calcurates offset which aligned to size of max_write_size
+ * from start of LEB .
+ */
+static inline int ubifs_align_max_write(const struct ubifs_info *c, int offs)
+{
+	return (c->leb_start + offs) & (c->max_write_size - 1) - c->leb_start ;
+}
+
 #endif /* __UBIFS_MISC_H__ */
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 8526b7ec4707..33fbfb5921ed 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -420,7 +420,7 @@ static int is_last_write(const struct ubifs_info *c, void *buf, int offs)
 	 * Round up to the next @c->max_write_size boundary i.e. @offs is in
 	 * the last wbuf written. After that should be empty space.
 	 */
-	empty_offs = ALIGN(offs + 1, c->max_write_size);
+	empty_offs = ubifs_align_max_write(offs + 1);
 	check_len = c->leb_size - empty_offs;
 	p = buf + empty_offs - offs;
 	return is_empty(p, check_len);
@@ -474,7 +474,7 @@ static int no_more_nodes(const struct ubifs_info *c, void *buf, int len,
 	int skip, dlen = le32_to_cpu(ch->len);
 
 	/* Check for empty space after the corrupt node's common header */
-	skip = ALIGN(offs + UBIFS_CH_SZ, c->max_write_size) - offs;
+	skip = ubifs_align_max_write(offs + UBIFS_CH_SZ) - offs;
 	if (is_empty(buf + skip, len - skip))
 		return 1;
 	/*
@@ -486,7 +486,7 @@ static int no_more_nodes(const struct ubifs_info *c, void *buf, int len,
 		return 0;
 	}
 	/* Now we know the corrupt node's length we can skip over it */
-	skip = ALIGN(offs + dlen, c->max_write_size) - offs;
+	skip = ubifs_align_max_write(offs + dlen) - offs;
 	/* After which there should be empty space */
 	if (is_empty(buf + skip, len - skip))
 		return 1;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
