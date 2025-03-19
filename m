Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6D0C35FF3
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 02:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=grvciQesRRG4vGYvpngKWOcrxW58IwxMpoFyfeUIiQI=; b=BcAzJfucqvONR9
	7KTEH+kjeV5XgpBcRh4YSf10SYYVq2Xuf3gsQ4Ln+S++CvmgpNc25IFcWUuxJsjHwfCYRrHFKesQf
	0MzWStBedjxqLrWYu80lb7zJObNZdH8Tnw4aWfOv60CPbxXsv5L6y3QmCoBfFo0NT5ldSRbajHm4G
	qk/gzTzPLGaxqJuc763EI78dxE3925ZSNeFGhkwUbvpJjU+hkBBx2GriW3rSM467Lj2HjsDnfQ9/b
	ldhwIhVyzwK5PQrdfTcHLMVnJtZN36ziW5mh8DYMJs5sln0zsBsXg3E/QNo30ceVXrECAxPdUWvKg
	ECjbgMVMiwxqNS+sUt9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tujT0-00000007pHP-1qjK;
	Wed, 19 Mar 2025 02:47:38 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tujSa-00000007p99-2gnm
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 02:47:14 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZHY1B4sl5zCs9g;
	Wed, 19 Mar 2025 10:43:26 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F9E91800C8;
	Wed, 19 Mar 2025 10:47:02 +0800 (CST)
Received: from huawei.com (10.175.101.6) by kwepemg500010.china.huawei.com
 (7.202.181.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 19 Mar
 2025 10:47:01 +0800
From: Wang Zhaolong <wangzhaolong1@huawei.com>
To: <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [RFC 1/1] fs/jffs2: Avoid a possible deadlock in jffs2_wbuf_recover
Date: Wed, 19 Mar 2025 10:47:00 +0800
Message-ID: <20250319024700.10364-2-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20250319024700.10364-1-wangzhaolong1@huawei.com>
References: <20250319024700.10364-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg500010.china.huawei.com (7.202.181.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_194713_010833_FAC01372 
X-CRM114-Status: GOOD (  20.25  )
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

jffs2_wbuf_recover can deadlock when called from __jffs2_flush_wbuf
error path, because both functions try to acquire c->wbuf_sem.

 jffs2_write_end
   jffs2_write_inode_range
     jffs2_write_dnode
       jffs2_flash_writev
         down_write(&c->wbuf_sem)            # first hold lock
         __jffs2_flush_wbuf
           mtd_write()                       # return error
           jffs2_wbuf_recover
             jffs2_reserve_space_gc
               jffs2_do_reserve_space
                 jffs2_flush_wbuf_pad
                   down_write(&c->wbuf_sem)  # AA deadlock

Fix this by adding a wbuf_sem_held parameter to jffs2_reserve_space_gc
and jffs2_do_reserve_space, which can be used to indicate that the caller
already holds c->wbuf_sem. If this is the case, jffs2_do_reserve_space
will directly call __jffs2_flush_wbuf instead of going through
jffs2_flush_wbuf_pad, which would try to acquire the lock again.

Signed-off-by: Wang Zhaolong <wangzhaolong1@huawei.com>
---
 fs/jffs2/gc.c       | 12 ++++++------
 fs/jffs2/nodelist.h | 12 +++++++++++-
 fs/jffs2/nodemgmt.c | 16 ++++++++++------
 fs/jffs2/os-linux.h |  1 +
 fs/jffs2/wbuf.c     | 13 ++-----------
 fs/jffs2/write.c    |  4 ++--
 fs/jffs2/xattr.c    |  4 ++--
 7 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 1b833bbffcf5..d2c0b1a14294 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -608,11 +608,11 @@ static int jffs2_garbage_collect_pristine(struct jffs2_sb_info *c,
 	   don't want to force wastage of the end of a block if splitting would
 	   work. */
 	if (ic && alloclen > sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN)
 		alloclen = sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN;
 
-	ret = jffs2_reserve_space_gc(c, alloclen, &alloclen, rawlen);
+	ret = jffs2_reserve_space_gc(c, alloclen, &alloclen, rawlen, 0);
 	/* 'rawlen' is not the exact summary size; it is only an upper estimation */
 
 	if (ret)
 		return ret;
 
@@ -718,11 +718,11 @@ static int jffs2_garbage_collect_pristine(struct jffs2_sb_info *c,
 			jffs2_dbg(1, "Retrying failed write of REF_PRISTINE node.\n");
 
 			jffs2_dbg_acct_sanity_check(c,jeb);
 			jffs2_dbg_acct_paranoia_check(c, jeb);
 
-			ret = jffs2_reserve_space_gc(c, rawlen, &dummy, rawlen);
+			ret = jffs2_reserve_space_gc(c, rawlen, &dummy, rawlen, 0);
 						/* this is not the exact summary size of it,
 							it is only an upper estimation */
 
 			if (!ret) {
 				jffs2_dbg(1, "Allocated space at 0x%08x to retry failed write.\n",
@@ -792,11 +792,11 @@ static int jffs2_garbage_collect_metadata(struct jffs2_sb_info *c, struct jffs2_
 			  __func__, mdatalen);
 
 	}
 
 	ret = jffs2_reserve_space_gc(c, sizeof(ri) + mdatalen, &alloclen,
-				JFFS2_SUMMARY_INODE_SIZE);
+				JFFS2_SUMMARY_INODE_SIZE, 0);
 	if (ret) {
 		pr_warn("jffs2_reserve_space_gc of %zd bytes for garbage_collect_metadata failed: %d\n",
 			sizeof(ri) + mdatalen, ret);
 		goto out;
 	}
@@ -873,11 +873,11 @@ static int jffs2_garbage_collect_dirent(struct jffs2_sb_info *c, struct jffs2_er
 	rd.type = fd->type;
 	rd.node_crc = cpu_to_je32(crc32(0, &rd, sizeof(rd)-8));
 	rd.name_crc = cpu_to_je32(crc32(0, fd->name, rd.nsize));
 
 	ret = jffs2_reserve_space_gc(c, sizeof(rd)+rd.nsize, &alloclen,
-				JFFS2_SUMMARY_DIRENT_SIZE(rd.nsize));
+				JFFS2_SUMMARY_DIRENT_SIZE(rd.nsize), 0);
 	if (ret) {
 		pr_warn("jffs2_reserve_space_gc of %zd bytes for garbage_collect_dirent failed: %d\n",
 			sizeof(rd)+rd.nsize, ret);
 		return ret;
 	}
@@ -1097,11 +1097,11 @@ static int jffs2_garbage_collect_hole(struct jffs2_sb_info *c, struct jffs2_eras
 	ri.mtime = cpu_to_je32(JFFS2_F_I_MTIME(f));
 	ri.data_crc = cpu_to_je32(0);
 	ri.node_crc = cpu_to_je32(crc32(0, &ri, sizeof(ri)-8));
 
 	ret = jffs2_reserve_space_gc(c, sizeof(ri), &alloclen,
-				     JFFS2_SUMMARY_INODE_SIZE);
+				     JFFS2_SUMMARY_INODE_SIZE, 0);
 	if (ret) {
 		pr_warn("jffs2_reserve_space_gc of %zd bytes for garbage_collect_hole failed: %d\n",
 			sizeof(ri), ret);
 		return ret;
 	}
@@ -1343,11 +1343,11 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 		uint32_t datalen;
 		uint32_t cdatalen;
 		uint16_t comprtype = JFFS2_COMPR_NONE;
 
 		ret = jffs2_reserve_space_gc(c, sizeof(ri) + JFFS2_MIN_DATA_LEN,
-					&alloclen, JFFS2_SUMMARY_INODE_SIZE);
+					&alloclen, JFFS2_SUMMARY_INODE_SIZE, 0);
 
 		if (ret) {
 			pr_warn("jffs2_reserve_space_gc of %zd bytes for garbage_collect_dnode failed: %d\n",
 				sizeof(ri) + JFFS2_MIN_DATA_LEN, ret);
 			break;
diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index 2e98fa277dab..f3c494901cf4 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -383,11 +383,11 @@ extern uint32_t __jffs2_ref_totlen(struct jffs2_sb_info *c,
 /* nodemgmt.c */
 int jffs2_thread_should_wake(struct jffs2_sb_info *c);
 int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
 			uint32_t *len, int prio, uint32_t sumsize);
 int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize,
-			uint32_t *len, uint32_t sumsize);
+			uint32_t *len, uint32_t sumsize, int wbuf_sem_held);
 struct jffs2_raw_node_ref *jffs2_add_physical_node_ref(struct jffs2_sb_info *c, 
 						       uint32_t ofs, uint32_t len,
 						       struct jffs2_inode_cache *ic);
 void jffs2_complete_reservation(struct jffs2_sb_info *c);
 void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *raw);
@@ -471,10 +471,20 @@ int jffs2_do_mount_fs(struct jffs2_sb_info *c);
 int jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count);
 void jffs2_free_jeb_node_refs(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb);
 
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 /* wbuf.c */
+/* Meaning of pad argument:
+   0: Do not pad. Probably pointless - we only ever use this when we can't pad anyway.
+   1: Pad, do not adjust nextblock free_size
+   2: Pad, adjust nextblock free_size
+*/
+#define NOPAD		0
+#define PAD_NOACCOUNT	1
+#define PAD_ACCOUNTING	2
+
+int __jffs2_flush_wbuf(struct jffs2_sb_info *c, int pad);
 int jffs2_flush_wbuf_gc(struct jffs2_sb_info *c, uint32_t ino);
 int jffs2_flush_wbuf_pad(struct jffs2_sb_info *c);
 int jffs2_check_nand_cleanmarker(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb);
 int jffs2_write_nand_cleanmarker(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb);
 #endif
diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 3fb9f9807b66..0a1bf6947277 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -49,11 +49,11 @@ static int jffs2_rp_can_write(struct jffs2_sb_info *c)
 	jffs2_dbg(1, "forbid writing\n");
 	return 0;
 }
 
 static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize,
-				  uint32_t *len, uint32_t sumsize);
+				  uint32_t *len, uint32_t sumsizew, int buf_sem_held);
 
 /**
  *	jffs2_reserve_space - request physical space to write nodes to flash
  *	@c: superblock info
  *	@minsize: Minimum acceptable size of allocation
@@ -196,11 +196,11 @@ int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
 
 			mutex_lock(&c->alloc_sem);
 			spin_lock(&c->erase_completion_lock);
 		}
 
-		ret = jffs2_do_reserve_space(c, minsize, len, sumsize);
+		ret = jffs2_do_reserve_space(c, minsize, len, sumsize, 0);
 		if (ret) {
 			jffs2_dbg(1, "%s(): ret is %d\n", __func__, ret);
 		}
 	}
 
@@ -212,20 +212,20 @@ int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
 		mutex_unlock(&c->alloc_sem);
 	return ret;
 }
 
 int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize,
-			   uint32_t *len, uint32_t sumsize)
+			   uint32_t *len, uint32_t sumsize, int wbuf_sem_held)
 {
 	int ret;
 	minsize = PAD(minsize);
 
 	jffs2_dbg(1, "%s(): Requested 0x%x bytes\n", __func__, minsize);
 
 	while (true) {
 		spin_lock(&c->erase_completion_lock);
-		ret = jffs2_do_reserve_space(c, minsize, len, sumsize);
+		ret = jffs2_do_reserve_space(c, minsize, len, sumsize, wbuf_sem_held);
 		if (ret) {
 			jffs2_dbg(1, "%s(): looping, ret is %d\n",
 				  __func__, ret);
 		}
 		spin_unlock(&c->erase_completion_lock);
@@ -354,11 +354,11 @@ static int jffs2_find_nextblock(struct jffs2_sb_info *c)
 	return 0;
 }
 
 /* Called with alloc sem _and_ erase_completion_lock */
 static int jffs2_do_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
-				  uint32_t *len, uint32_t sumsize)
+				  uint32_t *len, uint32_t sumsize, int wbuf_sem_held)
 {
 	struct jffs2_eraseblock *jeb = c->nextblock;
 	uint32_t reserved_size;				/* for summary information at the end of the jeb */
 	int ret;
 
@@ -416,11 +416,15 @@ static int jffs2_do_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
 
 			if (jffs2_wbuf_dirty(c)) {
 				spin_unlock(&c->erase_completion_lock);
 				jffs2_dbg(1, "%s(): Flushing write buffer\n",
 					  __func__);
-				jffs2_flush_wbuf_pad(c);
+				if (wbuf_sem_held) {
+					__jffs2_flush_wbuf(c, PAD_NOACCOUNT);
+				} else {
+					jffs2_flush_wbuf_pad(c);
+				}
 				spin_lock(&c->erase_completion_lock);
 				jeb = c->nextblock;
 				goto restart;
 			}
 
diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index 86ab014a349c..c9dda7126850 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -76,10 +76,11 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
 #define jffs2_cleanmarker_oob(c) (0)
 #define jffs2_write_nand_cleanmarker(c,jeb) (-EIO)
 
 #define jffs2_flash_write(c, ofs, len, retlen, buf) jffs2_flash_direct_write(c, ofs, len, retlen, buf)
 #define jffs2_flash_read(c, ofs, len, retlen, buf) (mtd_read((c)->mtd, ofs, len, retlen, buf))
+#define __jffs2_flush_wbuf(c, pad) ({ do{} while(0); (void)(c), 0; })
 #define jffs2_flush_wbuf_pad(c) ({ do{} while(0); (void)(c), 0; })
 #define jffs2_flush_wbuf_gc(c, i) ({ do{} while(0); (void)(c), (void) i, 0; })
 #define jffs2_write_nand_badblock(c,jeb,bad_offset) (1)
 #define jffs2_nand_flash_setup(c) (0)
 #define jffs2_nand_flash_cleanup(c) do {} while(0)
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 4061e0ba7010..799559760dc1 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -384,11 +384,11 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 	}
 	/* OK... we're to rewrite (end-start) bytes of data from first_raw onwards.
 	   Either 'buf' contains the data, or we find it in the wbuf */
 
 	/* ... and get an allocation of space from a shiny new block instead */
-	ret = jffs2_reserve_space_gc(c, end-start, &len, JFFS2_SUMMARY_NOSUM_SIZE);
+	ret = jffs2_reserve_space_gc(c, end-start, &len, JFFS2_SUMMARY_NOSUM_SIZE, 1);
 	if (ret) {
 		pr_warn("Failed to allocate space for wbuf recovery. Data loss ensues.\n");
 		kfree(buf);
 		return;
 	}
@@ -566,20 +566,11 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 	jffs2_dbg(1, "wbuf recovery completed OK. wbuf_ofs 0x%08x, len 0x%x\n",
 		  c->wbuf_ofs, c->wbuf_len);
 
 }
 
-/* Meaning of pad argument:
-   0: Do not pad. Probably pointless - we only ever use this when we can't pad anyway.
-   1: Pad, do not adjust nextblock free_size
-   2: Pad, adjust nextblock free_size
-*/
-#define NOPAD		0
-#define PAD_NOACCOUNT	1
-#define PAD_ACCOUNTING	2
-
-static int __jffs2_flush_wbuf(struct jffs2_sb_info *c, int pad)
+int __jffs2_flush_wbuf(struct jffs2_sb_info *c, int pad)
 {
 	struct jffs2_eraseblock *wbuf_jeb;
 	int ret;
 	size_t retlen;
 
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index cda9a361368e..1764cf0466fc 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -137,11 +137,11 @@ struct jffs2_full_dnode *jffs2_write_dnode(struct jffs2_sb_info *c, struct jffs2
 			jffs2_dbg_acct_sanity_check(c,jeb);
 			jffs2_dbg_acct_paranoia_check(c, jeb);
 
 			if (alloc_mode == ALLOC_GC) {
 				ret = jffs2_reserve_space_gc(c, sizeof(*ri) + datalen, &dummy,
-							     JFFS2_SUMMARY_INODE_SIZE);
+							     JFFS2_SUMMARY_INODE_SIZE, 0);
 			} else {
 				/* Locking pain */
 				mutex_unlock(&f->sem);
 				jffs2_complete_reservation(c);
 
@@ -289,11 +289,11 @@ struct jffs2_full_dirent *jffs2_write_dirent(struct jffs2_sb_info *c, struct jff
 			jffs2_dbg_acct_sanity_check(c,jeb);
 			jffs2_dbg_acct_paranoia_check(c, jeb);
 
 			if (alloc_mode == ALLOC_GC) {
 				ret = jffs2_reserve_space_gc(c, sizeof(*rd) + namelen, &dummy,
-							     JFFS2_SUMMARY_DIRENT_SIZE(namelen));
+							     JFFS2_SUMMARY_DIRENT_SIZE(namelen), 0);
 			} else {
 				/* Locking pain */
 				mutex_unlock(&f->sem);
 				jffs2_complete_reservation(c);
 
diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index defb4162c3d5..b7b1eb8f012c 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -1241,11 +1241,11 @@ int jffs2_garbage_collect_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xatt
 		goto out;
 	}
 	old_ofs = ref_offset(xd->node);
 	totlen = PAD(sizeof(struct jffs2_raw_xattr)
 			+ xd->name_len + 1 + xd->value_len);
-	rc = jffs2_reserve_space_gc(c, totlen, &length, JFFS2_SUMMARY_XATTR_SIZE);
+	rc = jffs2_reserve_space_gc(c, totlen, &length, JFFS2_SUMMARY_XATTR_SIZE, 0);
 	if (rc) {
 		JFFS2_WARNING("jffs2_reserve_space_gc()=%d, request=%u\n", rc, totlen);
 		goto out;
 	}
 	rc = save_xattr_datum(c, xd);
@@ -1274,11 +1274,11 @@ int jffs2_garbage_collect_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_
 		goto out;
 
 	old_ofs = ref_offset(ref->node);
 	totlen = ref_totlen(c, c->gcblock, ref->node);
 
-	rc = jffs2_reserve_space_gc(c, totlen, &length, JFFS2_SUMMARY_XREF_SIZE);
+	rc = jffs2_reserve_space_gc(c, totlen, &length, JFFS2_SUMMARY_XREF_SIZE, 0);
 	if (rc) {
 		JFFS2_WARNING("%s: jffs2_reserve_space_gc() = %d, request = %u\n",
 			      __func__, rc, totlen);
 		goto out;
 	}
-- 
2.34.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
