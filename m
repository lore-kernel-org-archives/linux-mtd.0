Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4705AC282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 07:19:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15BF421019
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 07:19:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BkY9BAYO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15BF421019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fBh1hM23H7FHDZBjU6I3bsfXfu6ENH8veYA7X3CAEN8=; b=BkY9BAYOTyjoS3
	ciDJ8pe46SLbppVloxWxJGuvS2hTU8LfvxniZHouHWEmqrwaow7hSrK8lwm4r7sDwGzlutMnDwcQ+
	lCB84xY1Qd/jkniC1REAGRUZ03/OA7qoTITVwDKAKpZObX1M7s6YJ7ZdoqX6S1/W2Zu6mp0h2rGpW
	+L+qLPKA2ZRlHL37kZxSU2VdMwHrWYQAdEliJLVd/Tu8/2DmTgeVw0Ys7JF6vgjs5RovcZO0EcMAU
	34Hr7aCKYpMgzjLXCOZra5XReljVU5Ct9r5tlnVIk05sceyZm+iTPaOCaIlk9Szdrr/po6u7jDHN8
	9H2j4vkI7Bx/kh0a+K/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmCor-000778-Iz; Wed, 23 Jan 2019 07:19:29 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmCoo-00076R-01
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 07:19:27 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E471136CEFC1D88072A9;
 Wed, 23 Jan 2019 15:19:17 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.408.0; Wed, 23 Jan 2019
 15:19:12 +0800
From: Yufen Yu <yuyufen@huawei.com>
To: <dwmw2@infradead.org>, <richard.weinberger@gmail.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] jffs2: safely remove obsolete dirent from the f->dents list
Date: Wed, 23 Jan 2019 15:22:49 +0800
Message-ID: <20190123072249.103847-1-yuyufen@huawei.com>
X-Mailer: git-send-email 2.16.2.dirty
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_231926_373347_DEC911DF 
X-CRM114-Status: GOOD (  19.36  )
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
Cc: Joakim.Tjernlund@infinera.com, houtao1@huawei.com, viro@zeniv.linux.org.uk,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We may delete a bunch of directory entries, operating such as:
getdents(), unlink(), getdents()..., until the end of the directory.
jffs2 handles f_pos on the directory merely as the position on the
f->dents list. So, the next getdents() may skip some entries
before f_pos, if we remove some entries from the list between two
getdents(), resulting in some entries of the directory cannot be deleted.

Commit 15953580e79b is introduced to resolve this bug by not
removing delete entries from the list immediately.

However, when CONFIG_JFFS2_SUMMARY is not set, it can cause the
following issues:

* 'deletion' dirents is always in the f->dents list, wasting memory
    resource. For example:
        There is a file named 'file1'. Then we rename it:
        mv file1 file2;
        mv file2 file3;
        ...
        mv file99999 file1000000

    All of file1~file1000000 dirents always in the f->dents list.

* Though, the list we're traversing is already ordered by CRC,
it could waste much CPU time when the list is very long.

To fix, we define two variables in struct jffs2_inode_info: nr_dir_opening,
obsolete_count, and two new functions: jffs2_dir_open(), jffs2_dir_release().

When open a directory, jffs2_dir_open() will increase nr_dir_opening,
which will be decreased by jffs2_dir_release(). if the value is 0,
it means nobody open the dir and nobody in getdents()/seek() semantics.
Thus, we can remove all obsolete dirent from the list.

When delete a file, jffs2_do_unlink() can remove the dirent directly if
nobody open the directory(i.e. nr_dir_opending == 0). Otherwise, it just
increase obsolete_count, denoting obsolete dirent count of the list.

Fixes: 15953580e79b ("[JFFS2] Improve getdents vs. f_pos handling on NOR flash.")
Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 fs/jffs2/dir.c             | 49 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/jffs2/jffs2_fs_i.h      |  7 +++++++
 fs/jffs2/super.c           |  4 ++++
 fs/jffs2/write.c           | 30 +++++++++++++++++++---------
 include/uapi/linux/jffs2.h |  4 ++++
 5 files changed, 85 insertions(+), 9 deletions(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index f20cff1194bb..aed872dcd0ca 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -37,6 +37,8 @@ static int jffs2_mknod (struct inode *,struct dentry *,umode_t,dev_t);
 static int jffs2_rename (struct inode *, struct dentry *,
 			 struct inode *, struct dentry *,
 			 unsigned int);
+static int jffs2_dir_release (struct inode *, struct file *);
+static int jffs2_dir_open (struct inode *, struct file *);
 
 const struct file_operations jffs2_dir_operations =
 {
@@ -45,6 +47,8 @@ const struct file_operations jffs2_dir_operations =
 	.unlocked_ioctl=jffs2_ioctl,
 	.fsync =	jffs2_fsync,
 	.llseek =	generic_file_llseek,
+	.open =		jffs2_dir_open,
+	.release =	jffs2_dir_release,
 };
 
 
@@ -865,3 +869,48 @@ static int jffs2_rename (struct inode *old_dir_i, struct dentry *old_dentry,
 	return 0;
 }
 
+static int jffs2_dir_open(struct inode *dir_i, struct file *filp)
+{
+#ifndef CONFIG_JFFS2_SUMMARY
+	struct jffs2_inode_info *dir_f = JFFS2_INODE_INFO(dir_i);
+	atomic_inc(&dir_f->nr_dir_opening);
+#endif
+
+	return 0;
+}
+
+static int jffs2_dir_release(struct inode *dir_i, struct file *filp)
+{
+#ifndef CONFIG_JFFS2_SUMMARY
+	struct jffs2_inode_info *dir_f = JFFS2_INODE_INFO(dir_i);
+
+	BUG_ON(atomic_read(&dir_f->nr_dir_opening) <= 0);
+
+	mutex_lock(&dir_f->sem);
+	/* jffs2_dir_open may increase nr_dir_opening after
+	 * atomic_dec_and_test() returning true.
+	 * However, it cannot traverse the list until hold
+	 * mutex dir_f->sem lock, so that we can go on
+	 * removing.*/
+	if (atomic_dec_and_test(&dir_f->nr_dir_opening) &&
+			dir_f->obsolete_count > JFFS2_OBS_DIRENT_LIMIT) {
+		struct jffs2_full_dirent **prev = &dir_f->dents;
+
+		/* remove all obsolete dirent from the list, which
+		 * can save memory space and reduce CPU time for
+		 * traverse the list */
+		while(*prev) {
+			if ((*prev)->raw == NULL && (*prev)->ino == 0) {
+				struct jffs2_full_dirent *this = *prev;
+				*prev = this->next;
+				jffs2_free_full_dirent(this);
+			} else
+				prev = &((*prev)->next);
+		}
+		dir_f->obsolete_count = 0;
+	}
+	mutex_unlock(&dir_f->sem);
+#endif
+
+	return 0;
+}
diff --git a/fs/jffs2/jffs2_fs_i.h b/fs/jffs2/jffs2_fs_i.h
index 2e4a86763c07..a4da25d16cb4 100644
--- a/fs/jffs2/jffs2_fs_i.h
+++ b/fs/jffs2/jffs2_fs_i.h
@@ -50,6 +50,13 @@ struct jffs2_inode_info {
 
 	uint16_t flags;
 	uint8_t usercompr;
+
+	/* obsolete dirent count in the list of 'dents' */
+	uint8_t  obsolete_count;
+
+	/* Directory open refcount */
+	atomic_t nr_dir_opening;
+
 	struct inode vfs_inode;
 };
 
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 87bdf0f4cba1..bf181b0ade9c 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -41,6 +41,10 @@ static struct inode *jffs2_alloc_inode(struct super_block *sb)
 	f = kmem_cache_alloc(jffs2_inode_cachep, GFP_KERNEL);
 	if (!f)
 		return NULL;
+
+	atomic_set(&f->nr_dir_opening, 0);
+	f->obsolete_count = 0;
+
 	return &f->vfs_inode;
 }
 
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index cda9a361368e..780b4fd9af51 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -600,29 +600,41 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
 	} else {
 		uint32_t nhash = full_name_hash(NULL, name, namelen);
 
-		fd = dir_f->dents;
+		struct jffs2_full_dirent **prev = &dir_f->dents;
+
 		/* We don't actually want to reserve any space, but we do
 		   want to be holding the alloc_sem when we write to flash */
 		mutex_lock(&c->alloc_sem);
 		mutex_lock(&dir_f->sem);
 
-		for (fd = dir_f->dents; fd; fd = fd->next) {
-			if (fd->nhash == nhash &&
-			    !memcmp(fd->name, name, namelen) &&
-			    !fd->name[namelen]) {
+		while((*prev) && (*prev)->nhash <= nhash) {
+			if ((*prev)->nhash == nhash &&
+			    !memcmp((*prev)->name, name, namelen) &&
+			    !(*prev)->name[namelen]) {
 
+				fd = *prev;
 				jffs2_dbg(1, "Marking old dirent node (ino #%u) @%08x obsolete\n",
 					  fd->ino, ref_offset(fd->raw));
 				jffs2_mark_node_obsolete(c, fd->raw);
-				/* We don't want to remove it from the list immediately,
-				   because that screws up getdents()/seek() semantics even
-				   more than they're screwed already. Turn it into a
-				   node-less deletion dirent instead -- a placeholder */
 				fd->raw = NULL;
 				fd->ino = 0;
+
+				/* if nr_dir_openning is 0, we think nobody open the dir, and
+				 * nobody being in getdents()/seek() semantics. Thus, we can
+				 * safely remove this obsolete dirent from the list. Otherwise,
+				 * we just increase obsolete_count, and finally delete it in
+				 * jffs2_dir_release() */
+				if (atomic_read(&dir_f->nr_dir_opening) == 0) {
+					*prev = fd->next;
+					jffs2_free_full_dirent(fd);
+				} else
+					dir_f->obsolete_count++;
+
 				break;
 			}
+			prev = &((*prev)->next);
 		}
+
 		mutex_unlock(&dir_f->sem);
 	}
 
diff --git a/include/uapi/linux/jffs2.h b/include/uapi/linux/jffs2.h
index a18b719f49d4..dff3ac2d6b0c 100644
--- a/include/uapi/linux/jffs2.h
+++ b/include/uapi/linux/jffs2.h
@@ -35,6 +35,10 @@
 */
 #define JFFS2_MAX_NAME_LEN 254
 
+/* The obsolete dirent of dents list limit. When the number over
+ * this limit, we can remove the obsoleted dents. */
+#define JFFS2_OBS_DIRENT_LIMIT 64
+
 /* How small can we sensibly write nodes? */
 #define JFFS2_MIN_DATA_LEN 128
 
-- 
2.14.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
