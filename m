Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CC2D5E392
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOWfYSs/4GHx15Kxr3HElU1X2lqk0L8O0wucoq2w25E=; b=yKCHuaKO5LgKuX
	yG1coImkvb+3Qe+w+6MOdn500Sp72HsFdOe5AoLkJcISJwu2jiASAet7qaKHrvkA2mqPrf1UQ0dv0
	0sbaLt5yCZjF38LT/Exi3saI4pz7o7d3LRZFNaR9sBVSmAeQB5PNXpp9XofsEJ9yMMQ+cqhB4JUwr
	iQkd1zaOZC+PLqQV0OhvcQ3FClVzC+Cj3/CHr2NNGfTzBmwwm3qkIrFc32l3XZzeR5io4o0NoQFXc
	i6lOxLP1NufdFBzjP1gHOBjsuxKsqbqx4SrmFNvsT3df+cbHCBKgvUmtOWryzh/k8+wWpdsxDrM0a
	4+ZdvUplf1TWCOjXZV5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPaX-0000000GmTC-2OCg;
	Mon, 11 Nov 2024 08:15:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUQ-0000000GZHH-0mao
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NabOx94/xG/XT/X0O6/dEo7CgDWrOtOTXxRCGKebpUE=; b=CociXSW9XVlMZMrzEmk92TqXUT
	oPNPRN2QAO57Z1YhSEJ6jhrgTzJCYoPHaNGI0RLauO4GaZNvyGHXctRexjh8aqalbxijXbivodiMD
	y3Zctu4IattWIxDcA+Y2tJi27mn4Lotghbv5IeYqwlZDmyxzcOupjPKh0ipD/0wvQfoDb5zbO6kM3
	WaLGOh1T1boV4z8vJ/GrdJhtT4n/rDfU+j7/q9hNlImd9Gj4q4NP1mB05Rd5j2lGqUTz2c8sUF/f5
	U21VcAo+ZvqaIKEyk7e5+6B+B67QV3vxTQXRRByuy+8eb7J0M3qVGKVuqtmVyzeX3PoN9z4J4hbrz
	OGhKNBkg==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUK-0000000CmCq-3feu
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:32 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rH511bz1jy0s;
	Mon, 11 Nov 2024 15:03:27 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id BAFD514011F;
	Mon, 11 Nov 2024 15:05:14 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:14 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 027/102] ubifs-utils: Adapt io.c in libubifs
Date: Mon, 11 Nov 2024 15:02:30 +0800
Message-ID: <20241111070346.1314122-28-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070530_218149_F6C626B0 
X-CRM114-Status: GOOD (  27.57  )
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

Adapt io.c in libubifs, compared with linux kernel implementations:
 1. Modify io related functions(eg. ubifs_leb_read/ubifs_leb_write,
    etc.), adapt them with userspace io functions lseek/read/write.
 2. Remove some functions(eg. record_magic_error, ubifs_bg_wbufs_sync)
    which won't be used in fsck/mkfs.
 3. Replce ubifs_errc with ubifs_err, because there will be no SB_SILENT
    options in mkfs/fsck.
 4. Initiate wbuf->size as c->max_write_size.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 include/crc32.h           |   5 +
 ubifs-utils/libubifs/io.c | 364 ++++++++++++----------------------------------
 2 files changed, 95 insertions(+), 274 deletions(-)

diff --git a/include/crc32.h b/include/crc32.h
index 9c1f742c..f5271f37 100644
--- a/include/crc32.h
+++ b/include/crc32.h
@@ -10,4 +10,9 @@
 /* Return a 32-bit CRC of the contents of the buffer */
 extern uint32_t mtd_crc32(uint32_t val, const void *ss, int len);
 
+static inline uint32_t crc32(uint32_t val, const void *ss, int len)
+{
+	return mtd_crc32(val, ss, len);
+}
+
 #endif /* __CRC32_H__ */
diff --git a/ubifs-utils/libubifs/io.c b/ubifs-utils/libubifs/io.c
index 01d8eb17..6f170172 100644
--- a/ubifs-utils/libubifs/io.c
+++ b/ubifs-utils/libubifs/io.c
@@ -58,9 +58,11 @@
  * they are read from the flash media.
  */
 
-#include <linux/crc32.h>
-#include <linux/slab.h>
+#include "kmem.h"
+#include "crc32.h"
 #include "ubifs.h"
+#include "defs.h"
+#include "debug.h"
 
 /**
  * ubifs_ro_mode - switch UBIFS to read read-only mode.
@@ -72,7 +74,6 @@ void ubifs_ro_mode(struct ubifs_info *c, int err)
 	if (!c->ro_error) {
 		c->ro_error = 1;
 		c->no_chk_data_crc = 0;
-		c->vfs_sb->s_flags |= SB_RDONLY;
 		ubifs_warn(c, "switched to read-only mode, error %d", err);
 		dump_stack();
 	}
@@ -87,9 +88,26 @@ void ubifs_ro_mode(struct ubifs_info *c, int err)
 int ubifs_leb_read(const struct ubifs_info *c, int lnum, void *buf, int offs,
 		   int len, int even_ebadmsg)
 {
-	int err;
+	int err = 0;
+	off_t pos = (off_t)lnum * c->leb_size + offs;
+
+	if (!len)
+		return 0;
 
-	err = ubi_read(c->ubi, lnum, buf, offs, len);
+	/*
+	 * The %-EBADMSG may be ignored in some case, the buf may not be filled
+	 * with data in some buggy mtd drivers. So we'd better to reset the buf
+	 * content before reading.
+	 */
+	memset(buf, 0, len);
+	if (lseek(c->dev_fd, pos, SEEK_SET) != pos) {
+		err = -errno;
+		goto out;
+	}
+
+	if (read(c->dev_fd, buf, len) != len)
+		err = -errno;
+out:
 	/*
 	 * In case of %-EBADMSG print the error message only if the
 	 * @even_ebadmsg is true.
@@ -105,15 +123,27 @@ int ubifs_leb_read(const struct ubifs_info *c, int lnum, void *buf, int offs,
 int ubifs_leb_write(struct ubifs_info *c, int lnum, const void *buf, int offs,
 		    int len)
 {
-	int err;
+	int err = 0;
+	off_t pos = (off_t)lnum * c->leb_size + offs;
 
 	ubifs_assert(c, !c->ro_media && !c->ro_mount);
 	if (c->ro_error)
 		return -EROFS;
-	if (!dbg_is_tst_rcvry(c))
-		err = ubi_leb_write(c->ubi, lnum, buf, offs, len);
-	else
-		err = dbg_leb_write(c, lnum, buf, offs, len);
+	if (!c->libubi) {
+		err = -ENODEV;
+		goto out;
+	}
+
+	if (!len)
+		return 0;
+
+	if (lseek(c->dev_fd, pos, SEEK_SET) != pos) {
+		err = -errno;
+		goto out;
+	}
+	if (write(c->dev_fd, buf, len) != len)
+		err = -errno;
+out:
 	if (err) {
 		ubifs_err(c, "writing %d bytes to LEB %d:%d failed, error %d",
 			  len, lnum, offs, err);
@@ -125,15 +155,31 @@ int ubifs_leb_write(struct ubifs_info *c, int lnum, const void *buf, int offs,
 
 int ubifs_leb_change(struct ubifs_info *c, int lnum, const void *buf, int len)
 {
-	int err;
+	int err = 0;
+	off_t pos = (off_t)lnum * c->leb_size;
 
 	ubifs_assert(c, !c->ro_media && !c->ro_mount);
 	if (c->ro_error)
 		return -EROFS;
-	if (!dbg_is_tst_rcvry(c))
-		err = ubi_leb_change(c->ubi, lnum, buf, len);
-	else
-		err = dbg_leb_change(c, lnum, buf, len);
+	if (c->libubi) {
+		err = ubi_leb_change_start(c->libubi, c->dev_fd, lnum, len);
+		if (err) {
+			ubifs_err(c, "ubi_leb_change_start failed");
+			err = -errno;
+			goto out;
+		}
+	}
+
+	if (!len)
+		return 0;
+
+	if (lseek(c->dev_fd, pos, SEEK_SET) != pos) {
+		err = -errno;
+		goto out;
+	}
+	if (write(c->dev_fd, buf, len) != len)
+		err = -errno;
+out:
 	if (err) {
 		ubifs_err(c, "changing %d bytes in LEB %d failed, error %d",
 			  len, lnum, err);
@@ -145,15 +191,15 @@ int ubifs_leb_change(struct ubifs_info *c, int lnum, const void *buf, int len)
 
 int ubifs_leb_unmap(struct ubifs_info *c, int lnum)
 {
-	int err;
+	int err = 0;
 
 	ubifs_assert(c, !c->ro_media && !c->ro_mount);
 	if (c->ro_error)
 		return -EROFS;
-	if (!dbg_is_tst_rcvry(c))
-		err = ubi_leb_unmap(c->ubi, lnum);
-	else
-		err = dbg_leb_unmap(c, lnum);
+	if (!c->libubi)
+		return -ENODEV;
+	if (ubi_leb_unmap(c->dev_fd, lnum))
+		err = -errno;
 	if (err) {
 		ubifs_err(c, "unmap LEB %d failed, error %d", lnum, err);
 		ubifs_ro_mode(c, err);
@@ -164,15 +210,15 @@ int ubifs_leb_unmap(struct ubifs_info *c, int lnum)
 
 int ubifs_leb_map(struct ubifs_info *c, int lnum)
 {
-	int err;
+	int err = 0;
 
 	ubifs_assert(c, !c->ro_media && !c->ro_mount);
 	if (c->ro_error)
 		return -EROFS;
-	if (!dbg_is_tst_rcvry(c))
-		err = ubi_leb_map(c->ubi, lnum);
-	else
-		err = dbg_leb_map(c, lnum);
+	if (!c->libubi)
+		return -ENODEV;
+	if (ubi_leb_map(c->dev_fd, lnum))
+		err = -errno;
 	if (err) {
 		ubifs_err(c, "mapping LEB %d failed, error %d", lnum, err);
 		ubifs_ro_mode(c, err);
@@ -183,9 +229,12 @@ int ubifs_leb_map(struct ubifs_info *c, int lnum)
 
 int ubifs_is_mapped(const struct ubifs_info *c, int lnum)
 {
-	int err;
+	int err = 0;
 
-	err = ubi_is_mapped(c->ubi, lnum);
+	if (!c->libubi)
+		return -ENODEV;
+	if (ubi_is_mapped(c->dev_fd, lnum))
+		err = -errno;
 	if (err < 0) {
 		ubifs_err(c, "ubi_is_mapped failed for LEB %d, error %d",
 			  lnum, err);
@@ -194,24 +243,6 @@ int ubifs_is_mapped(const struct ubifs_info *c, int lnum)
 	return err;
 }
 
-static void record_magic_error(struct ubifs_stats_info *stats)
-{
-	if (stats)
-		stats->magic_errors++;
-}
-
-static void record_node_error(struct ubifs_stats_info *stats)
-{
-	if (stats)
-		stats->node_errors++;
-}
-
-static void record_crc_error(struct ubifs_stats_info *stats)
-{
-	if (stats)
-		stats->crc_errors++;
-}
-
 /**
  * ubifs_check_node - check node.
  * @c: UBIFS file-system description object
@@ -256,7 +287,6 @@ int ubifs_check_node(const struct ubifs_info *c, const void *buf, int len,
 		if (!quiet)
 			ubifs_err(c, "bad magic %#08x, expected %#08x",
 				  magic, UBIFS_NODE_MAGIC);
-		record_magic_error(c->stats);
 		err = -EUCLEAN;
 		goto out;
 	}
@@ -265,7 +295,6 @@ int ubifs_check_node(const struct ubifs_info *c, const void *buf, int len,
 	if (type < 0 || type >= UBIFS_NODE_TYPES_CNT) {
 		if (!quiet)
 			ubifs_err(c, "bad node type %d", type);
-		record_node_error(c->stats);
 		goto out;
 	}
 
@@ -290,7 +319,6 @@ int ubifs_check_node(const struct ubifs_info *c, const void *buf, int len,
 		if (!quiet)
 			ubifs_err(c, "bad CRC: calculated %#08x, read %#08x",
 				  crc, node_crc);
-		record_crc_error(c->stats);
 		err = -EUCLEAN;
 		goto out;
 	}
@@ -395,7 +423,7 @@ void ubifs_init_node(struct ubifs_info *c, void *node, int len, int pad)
 	}
 }
 
-void ubifs_crc_node(struct ubifs_info *c, void *node, int len)
+void ubifs_crc_node(__unused struct ubifs_info *c, void *node, int len)
 {
 	struct ubifs_ch *ch = node;
 	uint32_t crc;
@@ -488,61 +516,6 @@ void ubifs_prep_grp_node(struct ubifs_info *c, void *node, int len, int last)
 }
 
 /**
- * wbuf_timer_callback_nolock - write-buffer timer callback function.
- * @timer: timer data (write-buffer descriptor)
- *
- * This function is called when the write-buffer timer expires.
- */
-static enum hrtimer_restart wbuf_timer_callback_nolock(struct hrtimer *timer)
-{
-	struct ubifs_wbuf *wbuf = container_of(timer, struct ubifs_wbuf, timer);
-
-	dbg_io("jhead %s", dbg_jhead(wbuf->jhead));
-	wbuf->need_sync = 1;
-	wbuf->c->need_wbuf_sync = 1;
-	ubifs_wake_up_bgt(wbuf->c);
-	return HRTIMER_NORESTART;
-}
-
-/**
- * new_wbuf_timer_nolock - start new write-buffer timer.
- * @c: UBIFS file-system description object
- * @wbuf: write-buffer descriptor
- */
-static void new_wbuf_timer_nolock(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
-{
-	ktime_t softlimit = ms_to_ktime(dirty_writeback_interval * 10);
-	unsigned long long delta = dirty_writeback_interval;
-
-	/* centi to milli, milli to nano, then 10% */
-	delta *= 10ULL * NSEC_PER_MSEC / 10ULL;
-
-	ubifs_assert(c, !hrtimer_active(&wbuf->timer));
-	ubifs_assert(c, delta <= ULONG_MAX);
-
-	if (wbuf->no_timer)
-		return;
-	dbg_io("set timer for jhead %s, %llu-%llu millisecs",
-	       dbg_jhead(wbuf->jhead),
-	       div_u64(ktime_to_ns(softlimit), USEC_PER_SEC),
-	       div_u64(ktime_to_ns(softlimit) + delta, USEC_PER_SEC));
-	hrtimer_start_range_ns(&wbuf->timer, softlimit, delta,
-			       HRTIMER_MODE_REL);
-}
-
-/**
- * cancel_wbuf_timer_nolock - cancel write-buffer timer.
- * @wbuf: write-buffer descriptor
- */
-static void cancel_wbuf_timer_nolock(struct ubifs_wbuf *wbuf)
-{
-	if (wbuf->no_timer)
-		return;
-	wbuf->need_sync = 0;
-	hrtimer_cancel(&wbuf->timer);
-}
-
-/**
  * ubifs_wbuf_sync_nolock - synchronize write-buffer.
  * @wbuf: write-buffer to synchronize
  *
@@ -560,7 +533,6 @@ int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
 	struct ubifs_info *c = wbuf->c;
 	int err, dirt, sync_len;
 
-	cancel_wbuf_timer_nolock(wbuf);
 	if (!wbuf->used || wbuf->lnum == -1)
 		/* Write-buffer is empty or not seeked */
 		return 0;
@@ -658,70 +630,6 @@ int ubifs_wbuf_seek_nolock(struct ubifs_wbuf *wbuf, int lnum, int offs)
 }
 
 /**
- * ubifs_bg_wbufs_sync - synchronize write-buffers.
- * @c: UBIFS file-system description object
- *
- * This function is called by background thread to synchronize write-buffers.
- * Returns zero in case of success and a negative error code in case of
- * failure.
- */
-int ubifs_bg_wbufs_sync(struct ubifs_info *c)
-{
-	int err, i;
-
-	ubifs_assert(c, !c->ro_media && !c->ro_mount);
-	if (!c->need_wbuf_sync)
-		return 0;
-	c->need_wbuf_sync = 0;
-
-	if (c->ro_error) {
-		err = -EROFS;
-		goto out_timers;
-	}
-
-	dbg_io("synchronize");
-	for (i = 0; i < c->jhead_cnt; i++) {
-		struct ubifs_wbuf *wbuf = &c->jheads[i].wbuf;
-
-		cond_resched();
-
-		/*
-		 * If the mutex is locked then wbuf is being changed, so
-		 * synchronization is not necessary.
-		 */
-		if (mutex_is_locked(&wbuf->io_mutex))
-			continue;
-
-		mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);
-		if (!wbuf->need_sync) {
-			mutex_unlock(&wbuf->io_mutex);
-			continue;
-		}
-
-		err = ubifs_wbuf_sync_nolock(wbuf);
-		mutex_unlock(&wbuf->io_mutex);
-		if (err) {
-			ubifs_err(c, "cannot sync write-buffer, error %d", err);
-			ubifs_ro_mode(c, err);
-			goto out_timers;
-		}
-	}
-
-	return 0;
-
-out_timers:
-	/* Cancel all timers to prevent repeated errors */
-	for (i = 0; i < c->jhead_cnt; i++) {
-		struct ubifs_wbuf *wbuf = &c->jheads[i].wbuf;
-
-		mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);
-		cancel_wbuf_timer_nolock(wbuf);
-		mutex_unlock(&wbuf->io_mutex);
-	}
-	return err;
-}
-
-/**
  * ubifs_wbuf_write_nolock - write data to flash via write-buffer.
  * @wbuf: write-buffer
  * @buf: node to write
@@ -763,8 +671,6 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 		goto out;
 	}
 
-	cancel_wbuf_timer_nolock(wbuf);
-
 	if (c->ro_error)
 		return -EROFS;
 
@@ -925,9 +831,6 @@ exit:
 			goto out;
 	}
 
-	if (wbuf->used)
-		new_wbuf_timer_nolock(c, wbuf);
-
 	return 0;
 
 out:
@@ -1110,32 +1013,30 @@ int ubifs_read_node(const struct ubifs_info *c, void *buf, int type, int len,
 		return err;
 
 	if (type != ch->node_type) {
-		ubifs_errc(c, "bad node type (%d but expected %d)",
-			   ch->node_type, type);
+		ubifs_err(c, "bad node type (%d but expected %d)",
+			  ch->node_type, type);
 		goto out;
 	}
 
 	err = ubifs_check_node(c, buf, len, lnum, offs, 0, 0);
 	if (err) {
-		ubifs_errc(c, "expected node type %d", type);
+		ubifs_err(c, "expected node type %d", type);
 		return err;
 	}
 
 	l = le32_to_cpu(ch->len);
 	if (l != len) {
-		ubifs_errc(c, "bad node length %d, expected %d", l, len);
+		ubifs_err(c, "bad node length %d, expected %d", l, len);
 		goto out;
 	}
 
 	return 0;
 
 out:
-	ubifs_errc(c, "bad node at LEB %d:%d, LEB mapping status %d", lnum,
-		   offs, ubi_is_mapped(c->ubi, lnum));
-	if (!c->probing) {
-		ubifs_dump_node(c, buf, len);
-		dump_stack();
-	}
+	ubifs_err(c, "bad node at LEB %d:%d, LEB mapping status %d", lnum,
+		  offs, ubi_is_mapped(c->dev_fd, lnum));
+	ubifs_dump_node(c, buf, len);
+	dump_stack();
 	return -EINVAL;
 }
 
@@ -1166,12 +1067,12 @@ int ubifs_wbuf_init(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
 	wbuf->used = 0;
 	wbuf->lnum = wbuf->offs = -1;
 	/*
-	 * If the LEB starts at the max. write size aligned address, then
-	 * write-buffer size has to be set to @c->max_write_size. Otherwise,
-	 * set it to something smaller so that it ends at the closest max.
-	 * write size boundary.
+	 * Different from linux kernel, there is no way to get leb_start in
+	 * userspace, set write-buffer size as @c->max_write_size directly.
+	 * Since wbuf->lnum is initialized as -1, wbuf->size will always be
+	 * reset in ubifs_wbuf_seek_nolock, it won't be any problems.
 	 */
-	size = c->max_write_size - (c->leb_start % c->max_write_size);
+	size = c->max_write_size;
 	wbuf->avail = wbuf->size = size;
 	wbuf->sync_callback = NULL;
 	mutex_init(&wbuf->io_mutex);
@@ -1179,90 +1080,5 @@ int ubifs_wbuf_init(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
 	wbuf->c = c;
 	wbuf->next_ino = 0;
 
-	hrtimer_init(&wbuf->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	wbuf->timer.function = wbuf_timer_callback_nolock;
-	return 0;
-}
-
-/**
- * ubifs_wbuf_add_ino_nolock - add an inode number into the wbuf inode array.
- * @wbuf: the write-buffer where to add
- * @inum: the inode number
- *
- * This function adds an inode number to the inode array of the write-buffer.
- */
-void ubifs_wbuf_add_ino_nolock(struct ubifs_wbuf *wbuf, ino_t inum)
-{
-	if (!wbuf->buf)
-		/* NOR flash or something similar */
-		return;
-
-	spin_lock(&wbuf->lock);
-	if (wbuf->used)
-		wbuf->inodes[wbuf->next_ino++] = inum;
-	spin_unlock(&wbuf->lock);
-}
-
-/**
- * wbuf_has_ino - returns if the wbuf contains data from the inode.
- * @wbuf: the write-buffer
- * @inum: the inode number
- *
- * This function returns with %1 if the write-buffer contains some data from the
- * given inode otherwise it returns with %0.
- */
-static int wbuf_has_ino(struct ubifs_wbuf *wbuf, ino_t inum)
-{
-	int i, ret = 0;
-
-	spin_lock(&wbuf->lock);
-	for (i = 0; i < wbuf->next_ino; i++)
-		if (inum == wbuf->inodes[i]) {
-			ret = 1;
-			break;
-		}
-	spin_unlock(&wbuf->lock);
-
-	return ret;
-}
-
-/**
- * ubifs_sync_wbufs_by_inode - synchronize write-buffers for an inode.
- * @c: UBIFS file-system description object
- * @inode: inode to synchronize
- *
- * This function synchronizes write-buffers which contain nodes belonging to
- * @inode. Returns zero in case of success and a negative error code in case of
- * failure.
- */
-int ubifs_sync_wbufs_by_inode(struct ubifs_info *c, struct inode *inode)
-{
-	int i, err = 0;
-
-	for (i = 0; i < c->jhead_cnt; i++) {
-		struct ubifs_wbuf *wbuf = &c->jheads[i].wbuf;
-
-		if (i == GCHD)
-			/*
-			 * GC head is special, do not look at it. Even if the
-			 * head contains something related to this inode, it is
-			 * a _copy_ of corresponding on-flash node which sits
-			 * somewhere else.
-			 */
-			continue;
-
-		if (!wbuf_has_ino(wbuf, inode->i_ino))
-			continue;
-
-		mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);
-		if (wbuf_has_ino(wbuf, inode->i_ino))
-			err = ubifs_wbuf_sync_nolock(wbuf);
-		mutex_unlock(&wbuf->io_mutex);
-
-		if (err) {
-			ubifs_ro_mode(c, err);
-			return err;
-		}
-	}
 	return 0;
 }
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
