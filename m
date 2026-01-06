Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18645C47BC5
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jan 2026 07:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9tOc2JxzUMLE2mhkhUanLrC+l/VutaaOGvU2FQnKSY=; b=VpYhfqrRzn8ky+
	SkpPv2wBNhP0P4g5jvmSvxoNLsQmaHvmCM0JqPIpHCCo/9oi5UEB2XBhVdzBMN3Kos/FDEaz+MHR7
	iGShBlOf9Aua1BF66gRxYLH8A1GFtePq2Ax1uuFI6Qw5QgM9lAqzpjJKiUljJdqVn295Bdr4dZi/2
	5k4vz6F5l7ZshN+gatJO6+AOgT4vTlKqyjZbIvCXSpy07MgUGbh8njn+qNUQCejMR/PlzANys+n2Z
	Aofgy0Jp4DjN//+XrWq9G8/9kl7OmndLMm1y2BjtZLE5YT9k6IwjeAMBEOuBowibYsSeLJEZS9m2N
	cUuAb3TGFiNC9R/MzHXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1qn-0000000CZ8a-1QzV;
	Tue, 06 Jan 2026 07:51:33 +0000
Received: from [2001:4bb8:2af:87cb:5562:685f:c094:6513] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1ql-0000000CZ5u-3DNg;
	Tue, 06 Jan 2026 07:51:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>,
	Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	gfs2@lists.linux.dev,
	io-uring@vger.kernel.org,
	devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: [PATCH 09/11] fs: refactor file_update_time_flags
Date: Tue,  6 Jan 2026 08:50:03 +0100
Message-ID: <20260106075008.1610195-10-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106075008.1610195-1-hch@lst.de>
References: <20260106075008.1610195-1-hch@lst.de>
MIME-Version: 1.0
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

Split all the inode timestamp flags into a helper.  This not only
makes the code a bit more readable, but also optimizes away the
further checks as soon as know we need an update.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/inode.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 01e4f6b9b46e..d2bfe302e647 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2378,31 +2378,30 @@ struct timespec64 current_time(struct inode *inode)
 }
 EXPORT_SYMBOL(current_time);
 
+static inline bool need_cmtime_update(struct inode *inode)
+{
+	struct timespec64 now = current_time(inode), ts;
+
+	ts = inode_get_mtime(inode);
+	if (!timespec64_equal(&ts, &now))
+		return true;
+	ts = inode_get_ctime(inode);
+	if (!timespec64_equal(&ts, &now))
+		return true;
+	return IS_I_VERSION(inode) && inode_iversion_need_inc(inode);
+}
+
 static int file_update_time_flags(struct file *file, unsigned int flags)
 {
 	struct inode *inode = file_inode(file);
-	struct timespec64 now, ts;
-	bool need_update = false;
-	int ret = 0;
+	int ret;
 
 	/* First try to exhaust all avenues to not sync */
 	if (IS_NOCMTIME(inode))
 		return 0;
 	if (unlikely(file->f_mode & FMODE_NOCMTIME))
 		return 0;
-
-	now = current_time(inode);
-
-	ts = inode_get_mtime(inode);
-	if (!timespec64_equal(&ts, &now))
-		need_update = true;
-	ts = inode_get_ctime(inode);
-	if (!timespec64_equal(&ts, &now))
-		need_update = true;
-	if (IS_I_VERSION(inode) && inode_iversion_need_inc(inode))
-		need_update = true;
-
-	if (!need_update)
+	if (!need_cmtime_update(inode))
 		return 0;
 
 	flags &= IOCB_NOWAIT;
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
