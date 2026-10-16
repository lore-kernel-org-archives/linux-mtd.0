Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6DECCA464
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 09:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vUYVanCNm3Kfc5B4swjYdmXFOiNiWibqGchTK+BWGHc=; b=iL8njwj0Tg2UxN
	J45fYPWTWY4RznYQLWH4ZAMRU+EPKBEgIcst61iELmrJ2Oi/vRnolOlXQAzANFcIWJf/MC0IRzH3c
	5o6dklQge5oPjk9K57oTNM/fhgyUn5aawWL97nPrwqDZoK+SXiK/L0iQQ5i2Yls6IxWVFlguEbIcI
	btOkzpiq3uNZ1RXLZ+PAPk5/n9oqnPqzhW6T6kAQ5x/b/iWDlA6Q9uPC9uaLtK1T/rIpKqTmAzDnr
	97zx8JqfzEQqDnR1qzlMVxRo4menb8FrzYr9dfLzK0HzF9OLxZHwYyqdPoFs4uHFYnEEBbe8Kq++Z
	hc2+sE7VL51pQ5D5iJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe01-00000002RV7-2jYi;
	Fri, 16 Oct 2026 09:13:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe00-00000002RSK-1hzE
	for linux-mtd@bombadil.infradead.org;
	Fri, 16 Oct 2026 09:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CXrbmsDMEhEoRFaph3IxS440XZqWmmsl+j+3MjGaHrk=; b=ZkIzn/V8oM29eJX3xRtgwpaRoo
	n8EHqx0K9Y8Qi5EUBS2ST41Ba6/zdnCcD5gxLvcQ6fPpBOAJyfGARO6zaGQI5855mvH1/afzcqjmP
	KG9qldz03z5Zd2BO5PgdfBuBbC49huQHx3GtgRH88MVqtiO0VrI/LYnFzBKtrSu2AwoSu5VTYeOnk
	P+YuQGvIF2hMOQcfLpDpEmJf7RfYgdyrkfXeAA2zrnDJLMgrnHGlTWTZGMazyegmxGhmQxdiTfoxH
	c3A3XskpXdr//D9KqDCazxMWZKJOGGJ77WcZnNAyvH1QRTcNS5UpW9Jt5rIU3BZgegz1J7iJRr+bx
	DNbOV9iA==;
Received: from smtp.h3c.com ([60.191.123.56] helo=h3cspam01-ex.h3c.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHdzr-00000001J18-0PaT
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 09:13:06 +0000
Received: from mail.maildlp.com ([172.25.15.155])
	by h3cspam01-ex.h3c.com with ESMTP id 69G9CKlJ023180;
	Fri, 16 Oct 2026 17:12:25 +0800 (+08)
	(envelope-from lin.nan@h3c.com)
Received: from DAG6EX09-BJD.srv.huawei-3com.com (unknown [10.153.34.11])
	by mail.maildlp.com (Postfix) with ESMTP id DA56A2284EA4;
	Fri, 16 Oct 2026 17:15:23 +0800 (CST)
Received: from localhost.localdomain (10.142.164.48) by
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.27; Fri, 16 Oct 2026 17:12:25 +0800
From: Nan Lin <lin.nan@h3c.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <lin.nan@h3c.com>, <wangxiaoqing@h3c.com>, <zhou.kete@h3c.com>
Subject: [PATCH] ubifs: zero stale data beyond EOF before file size grows
Date: Fri, 16 Oct 2026 17:04:58 +0800
Message-ID: <20261016090458.1891272-1-lin.nan@h3c.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Originating-IP: [10.142.164.48]
X-ClientProxiedBy: BJSMTP02-EX.srv.huawei-3com.com (10.63.20.133) To
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11)
X-DNSRBL: 
X-MAIL: h3cspam01-ex.h3c.com 69G9CKlJ023180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_101304_313539_1B60AE3B 
X-CRM114-Status: GOOD (  17.91  )
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

mmap writes can dirty the page cache beyond EOF without changing
i_size. A later extending write or ftruncate turns that region into a
hole, but UBIFS never zeroes the partial page at the old EOF, so reads
expose the stale data.

Zero the tail of the old-EOF folio in all three size-extending paths:
ubifs_write_begin() for writes starting beyond EOF, do_setattr()
before truncate_setsize() grows the size, and ubifs_vm_page_mkwrite()
so mmap writes cannot leave such a tail behind. This mirrors what
block_page_mkwrite() does for buffer_head filesystems and what ext4
does on size extension.

All zeroing takes the old-EOF folio lock without ui->ui_mutex, keeping
the folio_lock -> ui_mutex order of ->writepage() and
->page_mkwrite(); the reverse order deadlocks.

Signed-off-by: Nan Lin <lin.nan@h3c.com>
---
 fs/ubifs/file.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index e73c28b12f97..e09b17d36495 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -202,6 +202,53 @@ static void release_existing_page_budget(struct ubifs_info *c)
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
+ * Must be called without ui->ui_mutex held: we block on the old-EOF
+ * folio lock, and ->writepage() and ->page_mkwrite() hold that folio
+ * lock while taking ui_mutex; the reverse order deadlocks.
+ */
+static void ubifs_zero_eof_hole(struct inode *inode, loff_t new_end)
+{
+	loff_t old_size = i_size_read(inode);
+	unsigned int from, to;
+	struct folio *folio;
+
+	if (new_end <= old_size)
+		return;
+
+	folio = filemap_lock_folio(inode->i_mapping, old_size >> PAGE_SHIFT);
+	if (IS_ERR(folio))
+		return;
+
+	/*
+	 * Re-read i_size under the folio lock: a concurrent truncate may
+	 * have shrunk the file, turning this folio into valid data.
+	 */
+	old_size = i_size_read(inode);
+	if (new_end <= old_size)
+		goto out;
+
+	from = old_size & (PAGE_SIZE - 1);
+	if (!from)
+		goto out;
+	to = (old_size >> PAGE_SHIFT) == (new_end >> PAGE_SHIFT) ?
+	     new_end & (PAGE_SIZE - 1) : PAGE_SIZE;
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
@@ -423,6 +470,14 @@ static int ubifs_write_begin(const struct kiocb *iocb,
 	if (unlikely(c->ro_error))
 		return -EROFS;
 
+	/*
+	 * The write starts beyond EOF: zero the stale tail of the old-EOF
+	 * folio before budgeting takes ui->ui_mutex. do_readpage() only
+	 * sanitizes the write folio, not the old-EOF folio.
+	 */
+	if (pos > inode->i_size)
+		ubifs_zero_eof_hole(inode, pos);
+
 	/* Try out the fast-path part first */
 	folio = __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
 			mapping_gfp_mask(mapping));
@@ -1220,6 +1275,10 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
 
 	if (attr->ia_valid & ATTR_SIZE) {
 		dbg_gen("size %lld -> %lld", inode->i_size, new_size);
+
+		/* Must run before the size change loses the old boundary. */
+		ubifs_zero_eof_hole(inode, new_size);
+
 		truncate_setsize(inode, new_size);
 	}
 
@@ -1494,6 +1553,7 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 	struct timespec64 now = current_time(inode);
 	struct ubifs_budget_req req = { .new_page = 1 };
 	int err, update_time;
+	loff_t i_size;
 
 	dbg_gen("ino %llu, pg %lu, i_size %lld",	inode->i_ino, folio->index,
 		i_size_read(inode));
@@ -1553,6 +1613,19 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 		filemap_dirty_folio(folio->mapping, folio);
 	}
 
+	/*
+	 * Zero the part of the EOF folio beyond i_size so mmap writes
+	 * cannot leave a stale tail behind (see ubifs_zero_eof_hole()).
+	 * For a page-aligned i_size the mkwrite entry check has already
+	 * returned SIGBUS, so @from is always non-zero here.
+	 */
+	i_size = i_size_read(inode);
+	if (folio->index == (i_size >> PAGE_SHIFT)) {
+		unsigned int from = i_size & (PAGE_SIZE - 1);
+
+		folio_zero_range(folio, from, PAGE_SIZE - from);
+	}
+
 	if (update_time) {
 		int release;
 		struct ubifs_inode *ui = ubifs_inode(inode);
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
