Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A92C7EE2C
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tx3HyOp7S0NAPXpAeRpEWqfRN/S0qTl5cYCxbb2Zeb4=; b=Nu7IIhMvM/DHP9
	4RUpZHcMPDB8kyZEv8T7Ld+LG7uK6H4c8SsaKuQvtUa4kNFkLvXfTElN4fw8Yoop71/VoQ5erlCc0
	QNhHti1b84Cx51IlfV4WoReeGTVcFN9H0fS5JecHma8mVBLL3EI1T2UM3XdamxBvWpATV3qRKHnSE
	QvuI3b0M55urky3BPZPZfd/l6qFEUQunfp/FauaLB3SOljTgwgVnrVZh1uytlRBX1OVtjwCcyw46N
	LGAjdgH/bhghP904tLuc+Y0TNyoF85/Y77JQqln4XOAqki2wC35S3tQ/8mXKNSiUicHbbdn/axxdY
	90xJztQjk0/IGtxN3nmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXLw-005WPQ-0F;
	Fri, 25 Aug 2023 13:59:56 +0000
Received: from out-252.mta1.migadu.com ([95.215.58.252])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXLt-005WNz-17
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 13:59:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692971991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WRD02daxOp9FNChzaFYS1lXdVleuK5a0no8X9tPyoYM=;
	b=KOUX30U5aMel7ZOrU6vyW+bfFawd12zc010HOkye0FIA5XwWQ8KuInrnnmEFvcM8/s51Q/
	AaOybn5P1rP9UUeek73yc4I2uwInaXUHDAuF9iPRuAYZ+C8EXUIDSwZm4Bf0ZiLG750HKq
	BEWS22oRahJI/f4a4TxHtu+cFMHMdVg=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Cc: Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>,
	Clay Harris <bugs@claycon.org>,
	Dave Chinner <david@fromorbit.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-cachefs@redhat.com,
	ecryptfs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	codalist@coda.cs.cmu.edu,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	linux-mm@kvack.org,
	linux-nilfs@vger.kernel.org,
	devel@lists.orangefs.org,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-mtd@lists.infradead.org,
	Wanpeng Li <wanpengli@tencent.com>
Subject: [PATCH 10/29] vfs: add S_NOWAIT for nowait time update
Date: Fri, 25 Aug 2023 21:54:12 +0800
Message-Id: <20230825135431.1317785-11-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_065953_550285_6CBE1FA6 
X-CRM114-Status: GOOD (  12.01  )
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

From: Hao Xu <howeyxu@tencent.com>

Add a new time flag S_NOWAIT to support nowait time update. Deliver it
to specific filesystem and error out -EAGAIN when it would block.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/inode.c         | 9 +++++----
 fs/xfs/xfs_iops.c  | 8 +++++++-
 include/linux/fs.h | 1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index e83b836f2d09..eb3db34a3e6e 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1966,12 +1966,13 @@ int touch_atime(const struct path *path, bool nowait)
 	struct vfsmount *mnt = path->mnt;
 	struct inode *inode = d_inode(path->dentry);
 	struct timespec64 now;
+	int ret = 0;
 
 	if (!atime_needs_update(path, inode))
-		return 0;
+		return ret;
 
 	if (!sb_start_write_trylock(inode->i_sb))
-		return 0;
+		return ret;
 
 	if (__mnt_want_write(mnt) != 0)
 		goto skip_update;
@@ -1985,11 +1986,11 @@ int touch_atime(const struct path *path, bool nowait)
 	 * of the fs read only, e.g. subvolumes in Btrfs.
 	 */
 	now = current_time(inode);
-	inode_update_time(inode, &now, S_ATIME);
+	ret = inode_update_time(inode, &now, S_ATIME | (nowait ? S_NOWAIT : 0));
 	__mnt_drop_write(mnt);
 skip_update:
 	sb_end_write(inode->i_sb);
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(touch_atime);
 
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 24718adb3c16..bf1d4c31f009 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1053,7 +1053,13 @@ xfs_vn_update_time(
 	if (error)
 		return error;
 
-	xfs_ilock(ip, XFS_ILOCK_EXCL);
+	if (flags & S_NOWAIT) {
+		if (!xfs_ilock_nowait(ip, XFS_ILOCK_EXCL))
+			return -EAGAIN;
+	} else {
+		xfs_ilock(ip, XFS_ILOCK_EXCL);
+	}
+
 	if (flags & S_CTIME)
 		inode->i_ctime = *now;
 	if (flags & S_MTIME)
diff --git a/include/linux/fs.h b/include/linux/fs.h
index ed60b3d70d1e..f8c267ee5cb7 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2198,6 +2198,7 @@ enum file_time_flags {
 	S_MTIME = 2,
 	S_CTIME = 4,
 	S_VERSION = 8,
+	S_NOWAIT = 16,
 };
 
 extern bool atime_needs_update(const struct path *, struct inode *);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
