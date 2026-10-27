Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA727606A321
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2026 08:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1DG7ZgVh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FS4vfcDq4AVuDHcPAu+eg/YSfnRkgUhfw08wiGbXb/g=; b=1DG7ZgVhIkkgEsUJL7G+nbB9P/
	k4SdnG5IpFt7xMCplBVkSKsA/M0vJgWZJOPpZre2iXI0rug/znesNUr5uoJvI71ohfv97VbCgbRiz
	PZi9yRlbZJveyDINqMHgB7vIV8qHh6dA3DW5fqNC2W3qJok/LCrc+AC8BajDX0b4L5WuGDbutx8NL
	MbHIrod6UYnoPCKXej610cz5pZ73UHizFv4XRRHzVG6Zwqm2ygokX5dLxbW3sAAlYSVwhms+EeTYN
	miwoi3AlpkVlzf7CsankS39EbvrEmzhoBIyesbxuxVH3iMwnuS63sVCdKFAZ3MXJiAUJsoCCe4agI
	N+B801lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcKH-000000040lx-2VAf;
	Tue, 27 Oct 2026 08:14:33 +0000
Received: from smtp.h3c.com ([60.191.123.56] helo=h3cspam01-ex.h3c.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcKE-000000040jr-0j6S
	for linux-mtd@lists.infradead.org;
	Tue, 27 Oct 2026 08:14:32 +0000
Received: from mail.maildlp.com ([172.25.15.155])
	by h3cspam01-ex.h3c.com with ESMTP id 69R8EHK1090189;
	Tue, 27 Oct 2026 16:14:17 +0800 (+08)
	(envelope-from lin.nan@h3c.com)
Received: from DAG6EX09-BJD.srv.huawei-3com.com (unknown [10.153.34.11])
	by mail.maildlp.com (Postfix) with ESMTP id DB09C2284EA2;
	Tue, 27 Oct 2026 16:17:38 +0800 (CST)
Received: from localhost.localdomain (10.142.164.48) by
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.27; Tue, 27 Oct 2026 16:14:16 +0800
From: Nan Lin <lin.nan@h3c.com>
To: <chengzhihao1@huawei.com>
CC: <lin.nan@h3c.com>, <linux-mtd@lists.infradead.org>, <richard@nod.at>,
        <sashiko-reviews@lists.linux.dev>, <wangxiaoqing@h3c.com>,
        <zhou.kete@h3c.com>
Subject: [PATCH v5] ubifs: zero stale data beyond EOF before file size grows
Date: Tue, 27 Oct 2026 16:05:36 +0800
Message-ID: <20261027080536.3569047-1-lin.nan@h3c.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <0f05834a-7483-3e4e-0612-1d70e045b893@huawei.com>
References: <0f05834a-7483-3e4e-0612-1d70e045b893@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: BJSMTP01-EX.srv.huawei-3com.com (10.63.20.132) To
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam01-ex.h3c.com 69R8EHK1090189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_011430_534254_E2BC0E4C 
X-CRM114-Status: GOOD (  18.67  )
X-Spam-Score: 0.6 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mmap writes can dirty the page cache beyond EOF without changing
i_size. A later extending write or ftruncate turns that region into a
hole, but UBIFS never zeroes the partial page at the old EOF, so reads
expose the stale data.

Zero the tail of the cached old-EOF folio in both size-extending
paths: ubifs_write_iter() for writes starting beyond EOF, and
do_setattr() before truncate_setsize() grows the size. This mirrors
what ext4 does on size extension;

Restructure ubifs_write_iter() to match ext4_buffered_write_iter():
acquire inode_lock, perform write checks, call file_remove_privs() for
setuid/setgid clearing (UBIFS sets S_NOCMTIME so file_modified() is a
no-op), update mtime/ctime via update_mctime(), zero the EOF hole,
then execute the write with generic_perform_write(). This ensures
proper serialization and security handling.

All zeroing takes the old-EOF folio lock without ui->ui_mutex, keeping
the folio_lock -> ui_mutex order of ->writepage(); the reverse order
deadlocks.

UBIFS does not enable large folios, so the EOF folio is always a
single page today; nevertheless, use folio-relative arithmetic
(offset_in_folio(), folio_contains(), folio_size()) throughout so the
code is correct if that ever changes.

Signed-off-by: Nan Lin <lin.nan@h3c.com>

Changes since v4:
 - Use file_remove_privs() instead of kiocb_modified(), as UBIFS sets
   S_NOCMTIME making file_modified() a no-op (suggested by
   Zhihao Cheng).

Changes since v3:
 - Add inode_lock and move zero-eof after generic_write_checks(),
   matching ext4_buffered_write_iter structure
   (suggested by Sashiko AI review & Zhihao Cheng).
 - Add kiocb_modified() for setuid/setgid clearing.
 - Keep explicit update_mctime() as UBIFS sets S_NOCMTIME.

Changes since v2:
 - Move the extending-write check from ubifs_write_begin() to
   ubifs_write_iter(), mirroring ext4_write_checks() ->
   ext4_block_zero_eof(): the hole zeroing runs once per write()
   syscall instead of once per ->write_begin() iteration (suggested
   by Zhihao Cheng).
 - Drop the ubifs_vm_page_mkwrite() zeroing: like ext4
   (ext4_block_write_begin() with len = i_size - folio_pos),
   ->page_mkwrite() does not zero the tail beyond EOF, and mmap
   writes past EOF are the user's responsibility (suggested by
   Zhihao Cheng).

Changes since v1:
 - Both zeroing sites used PAGE_SIZE-relative arithmetic
   (offset_in_page()-style) while folio_zero_range() expects
   folio-relative offsets. UBIFS does not currently enable large
   folios, so PAGE_SIZE == folio_size() and the two coincide in
   practice, but switch to offset_in_folio()/folio_size() anyway so
   the code is correct if UBIFS ever opts into large folios
   (suggested by Sashiko AI review).

Note: The short-copy issue in ubifs_write_end() where i_size may
advance to pos + len on partial copies is pre-existing UBIFS behavior,
not introduced by this patch. It affects all buffered writes and
involves write_end() budget/ui_mutex handling; worth a dedicated
analysis/patch but outside the scope of this fix.
---
 fs/ubifs/file.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 76 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index e73c28b12f97..534e93793744 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -202,6 +202,44 @@ static void release_existing_page_budget(struct ubifs_info *c)
 	ubifs_release_budget(c, &req);
 }
 
+/**
+ * ubifs_zero_eof_hole - zero the stale tail of the old-EOF folio.
+ * @inode: inode whose size is about to grow
+ * @new_end: new end of the file, only used to bound the tail
+ *
+ * Zero the cached folio containing the old EOF for [old EOF,
+ * min(folio end, @new_end)) so a size extension does not expose stale
+ * data left beyond EOF by mmap writes.
+ *
+ * Context: inode_lock held, ui_mutex not held.  The old-EOF folio_lock
+ * must nest outside ui_mutex to match ->writepage()/->page_mkwrite().
+ */
+static void ubifs_zero_eof_hole(struct inode *inode, loff_t new_end)
+{
+	loff_t old_size = i_size_read(inode);
+	size_t from, to;
+	struct folio *folio;
+
+	if (new_end <= old_size)
+		return;
+
+	folio = filemap_lock_folio(inode->i_mapping, old_size >> PAGE_SHIFT);
+	if (IS_ERR(folio))
+		return;
+
+	from = offset_in_folio(folio, old_size);
+	if (!from)
+		goto out;
+	to = folio_contains(folio, new_end >> PAGE_SHIFT) ?
+	     offset_in_folio(folio, new_end) : folio_size(folio);
+	if (to > from)
+		folio_zero_range(folio, from, to - from);
+
+out:
+	folio_unlock(folio);
+	folio_put(folio);
+}
+
 static int write_begin_slow(struct address_space *mapping,
 			    loff_t pos, unsigned len, struct folio **foliop)
 {
@@ -1220,6 +1258,10 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
 
 	if (attr->ia_valid & ATTR_SIZE) {
 		dbg_gen("size %lld -> %lld", inode->i_size, new_size);
+
+		/* Zero before truncate_setsize() changes i_size. */
+		ubifs_zero_eof_hole(inode, new_size);
+
 		truncate_setsize(inode, new_size);
 	}
 
@@ -1433,11 +1475,41 @@ static int update_mctime(struct inode *inode)
 
 static ssize_t ubifs_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
-	int err = update_mctime(file_inode(iocb->ki_filp));
-	if (err)
-		return err;
+	struct inode *inode = file_inode(iocb->ki_filp);
+	ssize_t ret;
+
+	if (iocb->ki_flags & IOCB_NOWAIT)
+		return -EOPNOTSUPP;
 
-	return generic_file_write_iter(iocb, from);
+	inode_lock(inode);
+
+	ret = generic_write_checks(iocb, from);
+	if (ret <= 0)
+		goto out;
+
+	/* Clear setuid/setgid; skip file_modified() due to S_NOCMTIME. */
+	ret = file_remove_privs(iocb->ki_filp);
+	if (ret)
+		goto out;
+
+	/* Update mtime/ctime explicitly (VFS skips it for S_NOCMTIME). */
+	ret = update_mctime(inode);
+	if (ret)
+		goto out;
+
+	/*
+	 * Zero stale data beyond old EOF if extending.  At this point
+	 * ki_pos is final (O_APPEND/RWF_APPEND already resolved).
+	 */
+	if (iocb->ki_pos > i_size_read(inode))
+		ubifs_zero_eof_hole(inode, iocb->ki_pos);
+
+	ret = generic_perform_write(iocb, from);
+out:
+	inode_unlock(inode);
+	if (ret > 0)
+		ret = generic_write_sync(iocb, ret);
+	return ret;
 }
 
 static bool ubifs_dirty_folio(struct address_space *mapping,
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
