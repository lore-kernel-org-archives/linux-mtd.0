Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29977C4360F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 11:52:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC915218FD
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 11:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VeMJrx8k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC915218FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mbKAOXVR4qpFbIAh109CjHA7zr4jIMybXIK+zp8Ce9c=; b=VeMJrx8kJd8GAV
	N9w0vhAGm5PLH9in1cCRKBtW06w+5r5XUf+QiDSKNTZNJ1ye0TGssmW5iTw6uuIj2bN9ZdtpQ8TIY
	O1V/0TyDJA73bXxMDBd8AyAM4sWelB8EMzfg7FEVHiWjCRO90nypcy07l39e8erhDRk0XDdzY2yi+
	+7vLKoiiVlf00RZzSKwglQsOAiz9tEju1i50IeySurl79vMrTAQabNrS1cXkVFxckcnSu0WKx25RM
	f5QlL3EE5HEOOCxudQKC/oLD9MwXvu3EZg2JSvHvNyqBqlYJJDwSRR3AB00nydq2Dai3fX8Kzi1YI
	iZN8IjS0Fmsp9t7bvvgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6wFZ-0008IF-P4; Thu, 21 Mar 2019 11:52:45 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6wFO-00084L-Bz
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 11:52:41 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 129A586676;
 Thu, 21 Mar 2019 11:52:34 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-98.rdu2.redhat.com
 [10.10.121.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1A16608A5;
 Thu, 21 Mar 2019 11:52:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [RFC PATCH 3/6] cramfs: Convert to fs_context
From: David Howells <dhowells@redhat.com>
To: viro@zeniv.linux.org.uk
Date: Thu, 21 Mar 2019 11:52:31 +0000
Message-ID: <155316915190.30162.17108165049016006201.stgit@warthog.procyon.org.uk>
In-Reply-To: <155316911807.30162.12050856576466287021.stgit@warthog.procyon.org.uk>
References: <155316911807.30162.12050856576466287021.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 21 Mar 2019 11:52:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_045234_564424_5039A885 
X-CRM114-Status: GOOD (  20.66  )
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
Cc: dhowells@redhat.com, Nicolas Pitre <nico@linaro.org>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Nicolas Pitre <nico@linaro.org>
cc: linux-mtd@lists.infradead.org
cc: linux-block@vger.kernel.org
---

 fs/cramfs/inode.c |   69 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 39 insertions(+), 30 deletions(-)

diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index 9352487bd0fc..2ee89a353d64 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -24,6 +24,7 @@
 #include <linux/blkdev.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/super.h>
+#include <linux/fs_context.h>
 #include <linux/slab.h>
 #include <linux/vfs.h>
 #include <linux/mutex.h>
@@ -506,18 +507,19 @@ static void cramfs_kill_sb(struct super_block *sb)
 	kfree(sbi);
 }
 
-static int cramfs_remount(struct super_block *sb, int *flags, char *data)
+static int cramfs_reconfigure(struct fs_context *fc)
 {
-	sync_filesystem(sb);
-	*flags |= SB_RDONLY;
+	sync_filesystem(fc->root->d_sb);
+	fc->sb_flags |= SB_RDONLY;
 	return 0;
 }
 
-static int cramfs_read_super(struct super_block *sb,
-			     struct cramfs_super *super, int silent)
+static int cramfs_read_super(struct super_block *sb, struct fs_context *fc,
+			     struct cramfs_super *super)
 {
 	struct cramfs_sb_info *sbi = CRAMFS_SB(sb);
 	unsigned long root_offset;
+	bool silent = fc->sb_flags & SB_SILENT;
 
 	/* We don't know the real size yet */
 	sbi->size = PAGE_SIZE;
@@ -532,7 +534,7 @@ static int cramfs_read_super(struct super_block *sb,
 		/* check for wrong endianness */
 		if (super->magic == CRAMFS_MAGIC_WEND) {
 			if (!silent)
-				pr_err("wrong endianness\n");
+				errorf(fc, "cramfs: wrong endianness");
 			return -EINVAL;
 		}
 
@@ -544,22 +546,22 @@ static int cramfs_read_super(struct super_block *sb,
 		mutex_unlock(&read_mutex);
 		if (super->magic != CRAMFS_MAGIC) {
 			if (super->magic == CRAMFS_MAGIC_WEND && !silent)
-				pr_err("wrong endianness\n");
+				errorf(fc, "cramfs: wrong endianness");
 			else if (!silent)
-				pr_err("wrong magic\n");
+				errorf(fc, "cramfs: wrong magic");
 			return -EINVAL;
 		}
 	}
 
 	/* get feature flags first */
 	if (super->flags & ~CRAMFS_SUPPORTED_FLAGS) {
-		pr_err("unsupported filesystem features\n");
+		errorf(fc, "cramfs: unsupported filesystem features");
 		return -EINVAL;
 	}
 
 	/* Check that the root inode is in a sane state */
 	if (!S_ISDIR(super->root.mode)) {
-		pr_err("root is not a directory\n");
+		errorf(fc, "cramfs: root is not a directory");
 		return -EINVAL;
 	}
 	/* correct strange, hard-coded permissions of mkcramfs */
@@ -578,12 +580,12 @@ static int cramfs_read_super(struct super_block *sb,
 	sbi->magic = super->magic;
 	sbi->flags = super->flags;
 	if (root_offset == 0)
-		pr_info("empty filesystem");
+		infof(fc, "cramfs: empty filesystem");
 	else if (!(super->flags & CRAMFS_FLAG_SHIFTED_ROOT_OFFSET) &&
 		 ((root_offset != sizeof(struct cramfs_super)) &&
 		  (root_offset != 512 + sizeof(struct cramfs_super))))
 	{
-		pr_err("bad root offset %lu\n", root_offset);
+		errorf(fc, "cramfs: bad root offset %lu", root_offset);
 		return -EINVAL;
 	}
 
@@ -607,8 +609,7 @@ static int cramfs_finalize_super(struct super_block *sb,
 	return 0;
 }
 
-static int cramfs_blkdev_fill_super(struct super_block *sb, void *data,
-				    int silent)
+static int cramfs_blkdev_fill_super(struct super_block *sb, struct fs_context *fc)
 {
 	struct cramfs_sb_info *sbi;
 	struct cramfs_super super;
@@ -623,14 +624,13 @@ static int cramfs_blkdev_fill_super(struct super_block *sb, void *data,
 	for (i = 0; i < READ_BUFFERS; i++)
 		buffer_blocknr[i] = -1;
 
-	err = cramfs_read_super(sb, &super, silent);
+	err = cramfs_read_super(sb, fc, &super);
 	if (err)
 		return err;
 	return cramfs_finalize_super(sb, &super.root);
 }
 
-static int cramfs_mtd_fill_super(struct super_block *sb, void *data,
-				 int silent)
+static int cramfs_mtd_fill_super(struct super_block *sb, struct fs_context *fc)
 {
 	struct cramfs_sb_info *sbi;
 	struct cramfs_super super;
@@ -652,7 +652,7 @@ static int cramfs_mtd_fill_super(struct super_block *sb, void *data,
 
 	pr_info("checking physical address %pap for linear cramfs image\n",
 		&sbi->linear_phys_addr);
-	err = cramfs_read_super(sb, &super, silent);
+	err = cramfs_read_super(sb, fc, &super);
 	if (err)
 		return err;
 
@@ -947,32 +947,41 @@ static const struct inode_operations cramfs_dir_inode_operations = {
 };
 
 static const struct super_operations cramfs_ops = {
-	.remount_fs	= cramfs_remount,
 	.statfs		= cramfs_statfs,
 };
 
-static struct dentry *cramfs_mount(struct file_system_type *fs_type, int flags,
-				   const char *dev_name, void *data)
+static int cramfs_get_tree(struct fs_context *fc)
 {
-	struct dentry *ret = ERR_PTR(-ENOPROTOOPT);
+	int ret = -ENOPROTOOPT;
 
 	if (IS_ENABLED(CONFIG_CRAMFS_MTD)) {
-		ret = mount_mtd(fs_type, flags, dev_name, data,
-				cramfs_mtd_fill_super);
-		if (!IS_ERR(ret))
+		ret = vfs_get_mtd_super(fc, cramfs_mtd_fill_super);
+		if (ret < 0)
 			return ret;
 	}
-	if (IS_ENABLED(CONFIG_CRAMFS_BLOCKDEV)) {
-		ret = mount_bdev(fs_type, flags, dev_name, data,
-				 cramfs_blkdev_fill_super);
-	}
+	if (IS_ENABLED(CONFIG_CRAMFS_BLOCKDEV))
+		ret = vfs_get_block_super(fc, cramfs_blkdev_fill_super);
 	return ret;
 }
 
+static const struct fs_context_operations cramfs_context_ops = {
+	.get_tree	= cramfs_get_tree,
+	.reconfigure	= cramfs_reconfigure,
+};
+
+/*
+ * Set up the filesystem mount context.
+ */
+static int cramfs_init_fs_context(struct fs_context *fc)
+{
+	fc->ops = &cramfs_context_ops;
+	return 0;
+}
+
 static struct file_system_type cramfs_fs_type = {
 	.owner		= THIS_MODULE,
 	.name		= "cramfs",
-	.mount		= cramfs_mount,
+	.init_fs_context = cramfs_init_fs_context,
 	.kill_sb	= cramfs_kill_sb,
 	.fs_flags	= FS_REQUIRES_DEV,
 };


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
