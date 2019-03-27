Return-Path: <SRS0=crBW=R6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8D7C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2019 23:46:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 940152146F
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2019 23:46:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J1KBwMxw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 940152146F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSx5ndGiuZUEbGlB26v7K4iVlbLUGZcu3IVtg6XJRjo=; b=J1KBwMxwTVvP4T
	AvLcQsqgybU9T9Jz68dS0lQvU9ztZCtpGvTv59weuFPpPsPaFmZ9IXtl2ceTaAj36vNrwL1DSR9u9
	lmB977hufIvRMsgFONoA7SewVBSiIc1PH++4w9tZCiyQeJNyT+d5motmru66EMCBLg/BpoKkXoKow
	4fzB03v+qaWtU4j1z69wYXVoP5JwSD4cs1exn4C8Ek/FDl9iESQ4P+h0MQOJgYM00wj2pFACsTsIh
	Hp19S/uTs73gmX5xzDt30KtOxcUiZCZEDMAeedRGCy58C1I5FvCkUhZ+XvW5MVASkFfTMBkwfjkDw
	KyRMUgrzai3uNzo2xbUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9IFh-0004DK-Co; Wed, 27 Mar 2019 23:46:37 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9IFc-00045E-9J
 for linux-mtd@lists.infradead.org; Wed, 27 Mar 2019 23:46:36 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CCAFF307D98E;
 Wed, 27 Mar 2019 23:46:31 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-98.rdu2.redhat.com
 [10.10.121.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90C4960F9B;
 Wed, 27 Mar 2019 23:46:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [RFC PATCH 47/68] vfs: Convert romfs to use the new mount API
From: David Howells <dhowells@redhat.com>
To: viro@zeniv.linux.org.uk
Date: Wed, 27 Mar 2019 23:46:27 +0000
Message-ID: <155373038782.7602.3687455217702268098.stgit@warthog.procyon.org.uk>
In-Reply-To: <155372999953.7602.13784796495137723805.stgit@warthog.procyon.org.uk>
References: <155372999953.7602.13784796495137723805.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 27 Mar 2019 23:46:31 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_164633_014277_525F7BCF 
X-CRM114-Status: GOOD (  19.05  )
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
Cc: linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dhowells@redhat.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Convert the romfs filesystem to the new internal mount API as the old
one will be obsoleted and removed.  This allows greater flexibility in
communication of mount parameters between userspace, the VFS and the
filesystem.

See Documentation/filesystems/mount_api.txt for more information.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-mtd@lists.infradead.org
cc: linux-block@vger.kernel.org
---

 fs/romfs/super.c |   46 ++++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/fs/romfs/super.c b/fs/romfs/super.c
index 6ccb51993a76..627c2b64ff03 100644
--- a/fs/romfs/super.c
+++ b/fs/romfs/super.c
@@ -65,7 +65,7 @@
 #include <linux/slab.h>
 #include <linux/init.h>
 #include <linux/blkdev.h>
-#include <linux/parser.h>
+#include <linux/fs_context.h>
 #include <linux/mount.h>
 #include <linux/namei.h>
 #include <linux/statfs.h>
@@ -430,10 +430,10 @@ static int romfs_statfs(struct dentry *dentry, struct kstatfs *buf)
 /*
  * remounting must involve read-only
  */
-static int romfs_remount(struct super_block *sb, int *flags, char *data)
+static int romfs_reconfigure(struct fs_context *fc)
 {
-	sync_filesystem(sb);
-	*flags |= SB_RDONLY;
+	sync_filesystem(fc->root->d_sb);
+	fc->sb_flags |= SB_RDONLY;
 	return 0;
 }
 
@@ -441,7 +441,6 @@ static const struct super_operations romfs_super_ops = {
 	.alloc_inode	= romfs_alloc_inode,
 	.destroy_inode	= romfs_destroy_inode,
 	.statfs		= romfs_statfs,
-	.remount_fs	= romfs_remount,
 };
 
 /*
@@ -464,7 +463,7 @@ static __u32 romfs_checksum(const void *data, int size)
 /*
  * fill in the superblock
  */
-static int romfs_fill_super(struct super_block *sb, void *data, int silent)
+static int romfs_fill_super(struct super_block *sb, struct fs_context *fc)
 {
 	struct romfs_super_block *rsb;
 	struct inode *root;
@@ -511,8 +510,8 @@ static int romfs_fill_super(struct super_block *sb, void *data, int silent)
 
 	if (rsb->word0 != ROMSB_WORD0 || rsb->word1 != ROMSB_WORD1 ||
 	    img_size < ROMFH_SIZE) {
-		if (!silent)
-			pr_warn("VFS: Can't find a romfs filesystem on dev %s.\n",
+		if (!(fc->sb_flags & SB_SILENT))
+			errorf(fc, "VFS: Can't find a romfs filesystem on dev %s.\n",
 			       sb->s_id);
 		goto error_rsb_inval;
 	}
@@ -525,7 +524,7 @@ static int romfs_fill_super(struct super_block *sb, void *data, int silent)
 	storage = sb->s_mtd ? "MTD" : "the block layer";
 
 	len = strnlen(rsb->name, ROMFS_MAXFN);
-	if (!silent)
+	if (!(fc->sb_flags & SB_SILENT))
 		pr_notice("Mounting image '%*.*s' through %s\n",
 			  (unsigned) len, (unsigned) len, rsb->name, storage);
 
@@ -555,23 +554,34 @@ static int romfs_fill_super(struct super_block *sb, void *data, int silent)
 /*
  * get a superblock for mounting
  */
-static struct dentry *romfs_mount(struct file_system_type *fs_type,
-			int flags, const char *dev_name,
-			void *data)
+static int romfs_get_tree(struct fs_context *fc)
 {
-	struct dentry *ret = ERR_PTR(-EINVAL);
+	int ret = -EINVAL;
 
 #ifdef CONFIG_ROMFS_ON_MTD
-	ret = mount_mtd(fs_type, flags, dev_name, data, romfs_fill_super);
+	ret = vfs_get_mtd_super(fc, romfs_fill_super);
 #endif
 #ifdef CONFIG_ROMFS_ON_BLOCK
-	if (ret == ERR_PTR(-EINVAL))
-		ret = mount_bdev(fs_type, flags, dev_name, data,
-				  romfs_fill_super);
+	if (ret == -EINVAL)
+		ret = vfs_get_block_super(fc, romfs_fill_super);
 #endif
 	return ret;
 }
 
+static const struct fs_context_operations romfs_context_ops = {
+	.get_tree	= romfs_get_tree,
+	.reconfigure	= romfs_reconfigure,
+};
+
+/*
+ * Set up the filesystem mount context.
+ */
+static int romfs_init_fs_context(struct fs_context *fc)
+{
+	fc->ops = &romfs_context_ops;
+	return 0;
+}
+
 /*
  * destroy a romfs superblock in the appropriate manner
  */
@@ -594,7 +604,7 @@ static void romfs_kill_sb(struct super_block *sb)
 static struct file_system_type romfs_fs_type = {
 	.owner		= THIS_MODULE,
 	.name		= "romfs",
-	.mount		= romfs_mount,
+	.init_fs_context = romfs_init_fs_context,
 	.kill_sb	= romfs_kill_sb,
 	.fs_flags	= FS_REQUIRES_DEV,
 };


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
