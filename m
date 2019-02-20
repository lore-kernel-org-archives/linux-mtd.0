Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0001C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 10:18:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B04FC2146E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 10:18:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EdnU47/t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B04FC2146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CQA6bI9lHOTiuOE2/efOPUEMz45C0K3Okm1p9RTIzS0=; b=EdnU47/taawx0H
	1Z/qmFBT0IE/EaQRc/yY47eUEyETnYmG+B1/XedaB+dk5JFdMtqoMfeL++XrMe1VZ+3fGBjjC4bzh
	d5xdybpO/bwWhstC1GxAO0Spx7qkwzY4OsLJQlBGJWZETiLw50Hb4pYg+ZPRVOK4CQsTmCQ2CiYBE
	1+PGuYCnyRFUJ5D4qm+F9ZA0AtRocIbcfwVE0hfcqoLATfAfOc2YlF9cQn2HqK2Dxu4Nd2G9G2V9/
	tUmbhKaSe1R6wUvPUiblqwG29zwVtx/auLRl0Xt8QBeaG8d2hoqBH2gmii/0BMrybCUdma1Q8CpvH
	vfdT3rgkBgnRaLd9PPFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwOxS-0000AZ-Tv; Wed, 20 Feb 2019 10:18:30 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwOxG-00005n-UW
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 10:18:29 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id AA18F4BEA9421B77F0D0;
 Wed, 20 Feb 2019 18:18:15 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.408.0; Wed, 20 Feb 2019
 18:18:09 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] jffs2: alloc spaces for inode & dirent together
Date: Wed, 20 Feb 2019 18:22:27 +0800
Message-ID: <20190220102227.8148-1-houtao1@huawei.com>
X-Mailer: git-send-email 2.16.2.dirty
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_021819_479151_CDBB0213 
X-CRM114-Status: GOOD (  17.93  )
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
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, gaoyongliang@huawei.com, houtao1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Now in jffs2_create() or its similar, the spaces used for jffs2_raw_inode
and jffs2_raw_dirent are allocated separatedly. And it may lead to
dead-lock between file creation thread and GC procedure thread as
shown in the following case:

CPU 1:                      CPU 2:
in jffs2_create()           in jffs2_garbage_collect_pass()
    inode->i_state |= I_NEW

jffs2_new_inode
    // write a jffs2_raw_inode
    jffs2_write_dnode succeed

			    mutex_lock(&c->alloc_sem)
			    // trying to GC the newly-written jffs2_raw_inode
			    inum = ic->ino
			    nlink = ic->pino_nlink (> 0)

			    jffs2_gc_fetch_inode
				jffs2_iget
				    iget_locked
					// wait on clearing of I_NEW
					wait_on_inode

    // for dirent
    jffs2_reserve_space
        // wait for alloc_sem and deadlock occurs
        mutex_lock(&c->alloc_sem)

And the deadlock also may occur in a single file creation thread
which has written jffs2_raw_inode, is trying to allocate space
for jffs2_raw_dirent, has acquired alloc_sem and is waiting for
the clear of I_NEW flag in the inode it just creates.

Fix the problem by allocating spaces for jffs2_raw_inode and
jffs2_raw_dirent together, so the GC procedure will not trying
to garbage collect jffs2_raw_inode of the newly-creating inode
until the write of its inode & dirent node complete. The downside
of the solution is it may waste some flash space if there is no
continuous space for inode & dirent.

Because jffs2_init_security() & jffs2_init_acl_post() may write
xattr to flash, and these functions don't depends on the write of
jffs2_raw_inode, so moving them before the space allocation of
inode & dirent, but after the creating of vfs inode.

The alternative fix is skipping the newly-creating inode, pushing
back the current GC jeb and picking up a new jeb. But it sometimes
may loop between repeatedly pushing back a jeb (has newly-creating
inodes) and picking up a new jeb (also has newly-creating inodes
and may be the same jeb) when there are many file creation threads.

Fixes: e72e6497e748 ("jffs2: Fix NFS race by using insert_inode_locked()")
Cc: stable@vger.kernel.org
Reported-by: gaoyongliang@huawei.com
Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 fs/jffs2/dir.c   | 167 +++++++++++++++++++++++++++----------------------------
 fs/jffs2/write.c |  39 ++++++-------
 2 files changed, 103 insertions(+), 103 deletions(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index e02f85e516cb..d8cfe15255b3 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -307,6 +307,8 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 	struct jffs2_full_dirent *fd;
 	int namelen;
 	uint32_t alloclen;
+	uint32_t reqlen;
+	uint32_t sumsize;
 	int ret, targetlen = strlen(target);
 
 	/* FIXME: If you care. We'd need to use frags for the target
@@ -315,37 +317,41 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 		return -ENAMETOOLONG;
 
 	ri = jffs2_alloc_raw_inode();
-
 	if (!ri)
 		return -ENOMEM;
 
 	c = JFFS2_SB_INFO(dir_i->i_sb);
 
-	/* Try to reserve enough space for both node and dirent.
-	 * Just the node will do for now, though
-	 */
-	namelen = dentry->d_name.len;
-	ret = jffs2_reserve_space(c, sizeof(*ri) + targetlen, &alloclen,
-				  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
-
-	if (ret) {
-		jffs2_free_raw_inode(ri);
-		return ret;
-	}
-
 	inode = jffs2_new_inode(dir_i, S_IFLNK | S_IRWXUGO, ri);
-
 	if (IS_ERR(inode)) {
 		jffs2_free_raw_inode(ri);
-		jffs2_complete_reservation(c);
 		return PTR_ERR(inode);
 	}
-
 	inode->i_op = &jffs2_symlink_inode_operations;
+	inode->i_size = targetlen;
 
 	f = JFFS2_INODE_INFO(inode);
+	/* No process could find the inode now, so it's OK to release it */
+	mutex_unlock(&f->sem);
+
+	ret = jffs2_init_security(inode, dir_i, &dentry->d_name);
+	if (ret)
+		goto free_ri_fail;
+
+	ret = jffs2_init_acl_post(inode);
+	if (ret)
+		goto free_ri_fail;
+
+	/* Try to reserve enough space for both node and dirent */
+	namelen = dentry->d_name.len;
+	reqlen = sizeof(*ri) + targetlen + sizeof(*rd) + namelen;
+	sumsize = JFFS2_SUMMARY_INODE_SIZE + JFFS2_SUMMARY_DIRENT_SIZE(namelen);
+	ret = jffs2_reserve_space(c, reqlen, &alloclen, ALLOC_NORMAL, sumsize);
+	if (ret)
+		goto free_ri_fail;
+
+	mutex_lock(&f->sem);
 
-	inode->i_size = targetlen;
 	ri->isize = ri->dsize = ri->csize = cpu_to_je32(inode->i_size);
 	ri->totlen = cpu_to_je32(sizeof(*ri) + inode->i_size);
 	ri->hdr_crc = cpu_to_je32(crc32(0, ri, sizeof(struct jffs2_unknown_node)-4));
@@ -386,20 +392,11 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 	f->metadata = fn;
 	mutex_unlock(&f->sem);
 
-	jffs2_complete_reservation(c);
-
-	ret = jffs2_init_security(inode, dir_i, &dentry->d_name);
-	if (ret)
-		goto fail;
-
-	ret = jffs2_init_acl_post(inode);
-	if (ret)
-		goto fail;
-
-	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &alloclen,
-				  ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
-	if (ret)
+	ret = jffs2_prealloc_raw_node_refs(c, c->nextblock, 1);
+	if (ret) {
+		jffs2_complete_reservation(c);
 		goto fail;
+	}
 
 	rd = jffs2_alloc_raw_dirent();
 	if (!rd) {
@@ -452,6 +449,8 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 	d_instantiate_new(dentry, inode);
 	return 0;
 
+ free_ri_fail:
+	jffs2_free_raw_inode(ri);
  fail:
 	jffs2_iget_failed(c, inode);
 	return ret;
@@ -469,6 +468,8 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	struct jffs2_full_dirent *fd;
 	int namelen;
 	uint32_t alloclen;
+	uint32_t reqlen;
+	uint32_t sumsize;
 	int ret;
 
 	mode |= S_IFDIR;
@@ -479,23 +480,9 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, umode_t mode
 
 	c = JFFS2_SB_INFO(dir_i->i_sb);
 
-	/* Try to reserve enough space for both node and dirent.
-	 * Just the node will do for now, though
-	 */
-	namelen = dentry->d_name.len;
-	ret = jffs2_reserve_space(c, sizeof(*ri), &alloclen, ALLOC_NORMAL,
-				  JFFS2_SUMMARY_INODE_SIZE);
-
-	if (ret) {
-		jffs2_free_raw_inode(ri);
-		return ret;
-	}
-
 	inode = jffs2_new_inode(dir_i, mode, ri);
-
 	if (IS_ERR(inode)) {
 		jffs2_free_raw_inode(ri);
-		jffs2_complete_reservation(c);
 		return PTR_ERR(inode);
 	}
 
@@ -508,6 +495,25 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	set_nlink(inode, 2);
 	/* but ic->pino_nlink is the parent ino# */
 	f->inocache->pino_nlink = dir_i->i_ino;
+	mutex_unlock(&f->sem);
+
+	ret = jffs2_init_security(inode, dir_i, &dentry->d_name);
+	if (ret)
+		goto free_ri_fail;
+
+	ret = jffs2_init_acl_post(inode);
+	if (ret)
+		goto free_ri_fail;
+
+	/* Try to reserve enough space for both node and dirent */
+	namelen = dentry->d_name.len;
+	reqlen = sizeof(*ri) + sizeof(*rd) + namelen;
+	sumsize = JFFS2_SUMMARY_INODE_SIZE + JFFS2_SUMMARY_DIRENT_SIZE(namelen);
+	ret = jffs2_reserve_space(c, reqlen, &alloclen, ALLOC_NORMAL, sumsize);
+	if (ret)
+		goto free_ri_fail;
+
+	mutex_lock(&f->sem);
 
 	ri->data_crc = cpu_to_je32(0);
 	ri->node_crc = cpu_to_je32(crc32(0, ri, sizeof(*ri)-8));
@@ -529,20 +535,11 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	f->metadata = fn;
 	mutex_unlock(&f->sem);
 
-	jffs2_complete_reservation(c);
-
-	ret = jffs2_init_security(inode, dir_i, &dentry->d_name);
-	if (ret)
-		goto fail;
-
-	ret = jffs2_init_acl_post(inode);
-	if (ret)
-		goto fail;
-
-	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &alloclen,
-				  ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
-	if (ret)
+	ret = jffs2_prealloc_raw_node_refs(c, c->nextblock, 1);
+	if (ret) {
+		jffs2_complete_reservation(c);
 		goto fail;
+	}
 
 	rd = jffs2_alloc_raw_dirent();
 	if (!rd) {
@@ -596,6 +593,8 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	d_instantiate_new(dentry, inode);
 	return 0;
 
+ free_ri_fail:
+	jffs2_free_raw_inode(ri);
  fail:
 	jffs2_iget_failed(c, inode);
 	return ret;
@@ -638,6 +637,8 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	union jffs2_device_node dev;
 	int devlen = 0;
 	uint32_t alloclen;
+	uint32_t reqlen;
+	uint32_t sumsize;
 	int ret;
 
 	ri = jffs2_alloc_raw_inode();
@@ -649,29 +650,34 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	if (S_ISBLK(mode) || S_ISCHR(mode))
 		devlen = jffs2_encode_dev(&dev, rdev);
 
-	/* Try to reserve enough space for both node and dirent.
-	 * Just the node will do for now, though
-	 */
-	namelen = dentry->d_name.len;
-	ret = jffs2_reserve_space(c, sizeof(*ri) + devlen, &alloclen,
-				  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
-
-	if (ret) {
-		jffs2_free_raw_inode(ri);
-		return ret;
-	}
-
 	inode = jffs2_new_inode(dir_i, mode, ri);
-
 	if (IS_ERR(inode)) {
 		jffs2_free_raw_inode(ri);
-		jffs2_complete_reservation(c);
 		return PTR_ERR(inode);
 	}
 	inode->i_op = &jffs2_file_inode_operations;
 	init_special_inode(inode, inode->i_mode, rdev);
 
 	f = JFFS2_INODE_INFO(inode);
+	mutex_unlock(&f->sem);
+
+	ret = jffs2_init_security(inode, dir_i, &dentry->d_name);
+	if (ret)
+		goto free_ri_fail;
+
+	ret = jffs2_init_acl_post(inode);
+	if (ret)
+		goto free_ri_fail;
+
+	/* reserve enough space for both node and dirent */
+	namelen = dentry->d_name.len;
+	reqlen = sizeof(*ri) + devlen + sizeof(*rd) + namelen;
+	sumsize = JFFS2_SUMMARY_INODE_SIZE + JFFS2_SUMMARY_DIRENT_SIZE(namelen);
+	ret = jffs2_reserve_space(c, reqlen, &alloclen, ALLOC_NORMAL, sumsize);
+	if (ret)
+		goto free_ri_fail;
+
+	mutex_lock(&f->sem);
 
 	ri->dsize = ri->csize = cpu_to_je32(devlen);
 	ri->totlen = cpu_to_je32(sizeof(*ri) + devlen);
@@ -698,20 +704,11 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	f->metadata = fn;
 	mutex_unlock(&f->sem);
 
-	jffs2_complete_reservation(c);
-
-	ret = jffs2_init_security(inode, dir_i, &dentry->d_name);
-	if (ret)
-		goto fail;
-
-	ret = jffs2_init_acl_post(inode);
-	if (ret)
-		goto fail;
-
-	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &alloclen,
-				  ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
-	if (ret)
+	ret = jffs2_prealloc_raw_node_refs(c, c->nextblock, 1);
+	if (ret) {
+		jffs2_complete_reservation(c);
 		goto fail;
+	}
 
 	rd = jffs2_alloc_raw_dirent();
 	if (!rd) {
@@ -767,6 +764,8 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	d_instantiate_new(dentry, inode);
 	return 0;
 
+ free_ri_fail:
+	jffs2_free_raw_inode(ri);
  fail:
 	jffs2_iget_failed(c, inode);
 	return ret;
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index cda9a361368e..663bb7c39ada 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -445,18 +445,30 @@ int jffs2_do_create(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
 	struct jffs2_raw_dirent *rd;
 	struct jffs2_full_dnode *fn;
 	struct jffs2_full_dirent *fd;
+	uint32_t reqlen;
+	uint32_t sumsize;
 	uint32_t alloclen;
 	int ret;
 
-	/* Try to reserve enough space for both node and dirent.
-	 * Just the node will do for now, though
-	 */
-	ret = jffs2_reserve_space(c, sizeof(*ri), &alloclen, ALLOC_NORMAL,
-				JFFS2_SUMMARY_INODE_SIZE);
-	jffs2_dbg(1, "%s(): reserved 0x%x bytes\n", __func__, alloclen);
+	ret = jffs2_init_security(&f->vfs_inode, &dir_f->vfs_inode, qstr);
+	if (ret)
+		return ret;
+
+	ret = jffs2_init_acl_post(&f->vfs_inode);
 	if (ret)
 		return ret;
 
+	/* Try to reserve enough space for both node and dirent */
+	reqlen = sizeof(*ri) + sizeof(*rd) + qstr->len;
+	sumsize = JFFS2_SUMMARY_INODE_SIZE +
+		  JFFS2_SUMMARY_DIRENT_SIZE(qstr->len);
+	ret = jffs2_reserve_space(c, reqlen, &alloclen, ALLOC_NORMAL, sumsize);
+	if (ret) {
+		jffs2_dbg(1, "jffs2_reserve_space() for dnode & dirent failed\n");
+		return ret;
+	}
+	jffs2_dbg(1, "%s(): reserved 0x%x bytes\n", __func__, alloclen);
+
 	mutex_lock(&f->sem);
 
 	ri->data_crc = cpu_to_je32(0);
@@ -480,21 +492,10 @@ int jffs2_do_create(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
 	f->metadata = fn;
 
 	mutex_unlock(&f->sem);
-	jffs2_complete_reservation(c);
-
-	ret = jffs2_init_security(&f->vfs_inode, &dir_f->vfs_inode, qstr);
-	if (ret)
-		return ret;
-	ret = jffs2_init_acl_post(&f->vfs_inode);
-	if (ret)
-		return ret;
-
-	ret = jffs2_reserve_space(c, sizeof(*rd)+qstr->len, &alloclen,
-				ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(qstr->len));
 
+	ret = jffs2_prealloc_raw_node_refs(c, c->nextblock, 1);
 	if (ret) {
-		/* Eep. */
-		jffs2_dbg(1, "jffs2_reserve_space() for dirent failed\n");
+		jffs2_complete_reservation(c);
 		return ret;
 	}
 
-- 
2.16.2.dirty


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
