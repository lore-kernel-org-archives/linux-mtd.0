Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N4toc-0001Ks-Q7
	for linux-mtd@lists.infradead.org; Mon, 02 Nov 2009 10:07:19 +0000
From: Jan Blunck <jblunck@suse.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 26/27] BKL: Remove BKL from ubifs
Date: Mon,  2 Nov 2009 11:05:06 +0100
Message-Id: <1257156307-24175-27-git-send-email-jblunck@suse.de>
In-Reply-To: <1257156307-24175-1-git-send-email-jblunck@suse.de>
References: <1257156307-24175-1-git-send-email-jblunck@suse.de>
Cc: Matthew Wilcox <matthew@wil.cx>, Artem Bityutskiy <dedekind@infradead.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
	Jens Axboe <jens.axboe@oracle.com>, Jan Blunck <jblunck@suse.de>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

BKL is only used in get_sb. It is safe to remove it.

Signed-off-by: Jan Blunck <jblunck@suse.de>
---
 fs/ubifs/super.c |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 04a0fc9..333e181 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2029,8 +2029,6 @@ static int ubifs_get_sb(struct file_system_type *fs_type, int flags,
 	struct super_block *sb;
 	int err;
 
-	lock_kernel();
-
 	dbg_gen("name %s, flags %#x", name, flags);
 
 	/*
@@ -2042,7 +2040,6 @@ static int ubifs_get_sb(struct file_system_type *fs_type, int flags,
 	if (IS_ERR(ubi)) {
 		ubifs_err("cannot open \"%s\", error %d",
 			  name, (int)PTR_ERR(ubi));
-		unlock_kernel();
 		return PTR_ERR(ubi);
 	}
 	ubi_get_volume_info(ubi, &vi);
@@ -2080,14 +2077,12 @@ static int ubifs_get_sb(struct file_system_type *fs_type, int flags,
 	ubi_close_volume(ubi);
 
 	simple_set_mnt(mnt, sb);
-	unlock_kernel();
 	return 0;
 
 out_deact:
 	deactivate_locked_super(sb);
 out_close:
 	ubi_close_volume(ubi);
-	unlock_kernel();
 	return err;
 }
 
-- 
1.6.4.2
