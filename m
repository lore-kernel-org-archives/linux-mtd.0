Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215BFE732C0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Sep 2023 11:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HlSOsPCom2cnx5o0ePv763BLTaLCOVoQTHsYz936ako=; b=4qzA+wKElka3Q8
	ttBgmKKyXrGo3RDz01RFvCMfgYTMJQmvt/ogNNHuEyP98oFNjmg2zYhxSEG5RhTgi2ikLFpbqkNsF
	IryZy62qFazJ0P/aKv6cM1bbjMr5bQcskxYngfIRmKpTiH4m5nrZZADaWhyhI+tkbV9sIVpPtLulL
	hhBuDBNGdV2jtsBz/UsbUiYQ9dtg94OBtVHYNsuKzGvNbkh8fgQJqmcLFYjZdon4vBfQUMR6TyBlg
	3JBDHSnBzwFrU33ApUnTLVVJ6+Xs0HqNt1BpwzTq+nAXyJ0QZE9BUd+udLWsp59GY218u6Q0y5VYy
	vrZTLuCa8H/ivg/0tLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlopc-0033mx-1M;
	Thu, 28 Sep 2023 11:05:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlopR-0033f1-2W
	for linux-mtd@lists.infradead.org;
	Thu, 28 Sep 2023 11:05:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0DD8EB81BB9;
	Thu, 28 Sep 2023 11:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE9BC433C7;
	Thu, 28 Sep 2023 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695899107;
	bh=H0o2l6yZgbuV+AHtD4UZSzh1xRcgDyq1popfRqn5BpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lRPGkEbLGP0ZilgxwHKoK5aa3Diu6rGwzQIj4aLFkIQjfUt+EgtEy1nJXYP/627YU
	 ICEyhlyn0yeIxNQphxQSK88BktMCjTMQAg2uX0JZS4eeWeIuKYUOzW6rI77YSgVm9Y
	 Jxl0oMN+olO4Gr3qaW+oMVTT/vUEumTwP96IeqGlhkdyQTYdlXrxwMCqPc7wgXFTMF
	 3IDKvaFuLOaICQho3lWkxJjsy81ss0wr6kOIOmzgllwv/h4OkF5m0tEFC8MVMQiWDb
	 RqCfzmWaH2s6A7gTKcfqTsFrtHS7SCH0wKnJ8kl/DJJ65E6MAnHSt5dne/AUwqfNSX
	 eeEf4W3OXyuBQ==
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 46/87] fs/jffs2: convert to new inode {a,m}time accessors
Date: Thu, 28 Sep 2023 07:02:55 -0400
Message-ID: <20230928110413.33032-45-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928110413.33032-1-jlayton@kernel.org>
References: <20230928110300.32891-1-jlayton@kernel.org>
 <20230928110413.33032-1-jlayton@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_040510_366821_CF32EAE8 
X-CRM114-Status: GOOD (  13.57  )
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

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/jffs2/dir.c      | 35 ++++++++++++++++++++---------------
 fs/jffs2/file.c     |  4 ++--
 fs/jffs2/fs.c       | 20 ++++++++++----------
 fs/jffs2/os-linux.h |  4 ++--
 4 files changed, 34 insertions(+), 29 deletions(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index 091ab0eaabbe..2b2938970da3 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -204,8 +204,8 @@ static int jffs2_create(struct mnt_idmap *idmap, struct inode *dir_i,
 	if (ret)
 		goto fail;
 
-	dir_i->i_mtime = inode_set_ctime_to_ts(dir_i,
-					       ITIME(je32_to_cpu(ri->ctime)));
+	inode_set_mtime_to_ts(dir_i,
+			      inode_set_ctime_to_ts(dir_i, ITIME(je32_to_cpu(ri->ctime))));
 
 	jffs2_free_raw_inode(ri);
 
@@ -238,7 +238,8 @@ static int jffs2_unlink(struct inode *dir_i, struct dentry *dentry)
 	if (dead_f->inocache)
 		set_nlink(d_inode(dentry), dead_f->inocache->pino_nlink);
 	if (!ret)
-		dir_i->i_mtime = inode_set_ctime_to_ts(dir_i, ITIME(now));
+		inode_set_mtime_to_ts(dir_i,
+				      inode_set_ctime_to_ts(dir_i, ITIME(now)));
 	return ret;
 }
 /***********************************************************************/
@@ -272,7 +273,8 @@ static int jffs2_link (struct dentry *old_dentry, struct inode *dir_i, struct de
 		set_nlink(d_inode(old_dentry), ++f->inocache->pino_nlink);
 		mutex_unlock(&f->sem);
 		d_instantiate(dentry, d_inode(old_dentry));
-		dir_i->i_mtime = inode_set_ctime_to_ts(dir_i, ITIME(now));
+		inode_set_mtime_to_ts(dir_i,
+				      inode_set_ctime_to_ts(dir_i, ITIME(now)));
 		ihold(d_inode(old_dentry));
 	}
 	return ret;
@@ -423,8 +425,8 @@ static int jffs2_symlink (struct mnt_idmap *idmap, struct inode *dir_i,
 		goto fail;
 	}
 
-	dir_i->i_mtime = inode_set_ctime_to_ts(dir_i,
-					       ITIME(je32_to_cpu(rd->mctime)));
+	inode_set_mtime_to_ts(dir_i,
+			      inode_set_ctime_to_ts(dir_i, ITIME(je32_to_cpu(rd->mctime))));
 
 	jffs2_free_raw_dirent(rd);
 
@@ -568,8 +570,8 @@ static int jffs2_mkdir (struct mnt_idmap *idmap, struct inode *dir_i,
 		goto fail;
 	}
 
-	dir_i->i_mtime = inode_set_ctime_to_ts(dir_i,
-					       ITIME(je32_to_cpu(rd->mctime)));
+	inode_set_mtime_to_ts(dir_i,
+			      inode_set_ctime_to_ts(dir_i, ITIME(je32_to_cpu(rd->mctime))));
 	inc_nlink(dir_i);
 
 	jffs2_free_raw_dirent(rd);
@@ -610,7 +612,8 @@ static int jffs2_rmdir (struct inode *dir_i, struct dentry *dentry)
 	ret = jffs2_do_unlink(c, dir_f, dentry->d_name.name,
 			      dentry->d_name.len, f, now);
 	if (!ret) {
-		dir_i->i_mtime = inode_set_ctime_to_ts(dir_i, ITIME(now));
+		inode_set_mtime_to_ts(dir_i,
+				      inode_set_ctime_to_ts(dir_i, ITIME(now)));
 		clear_nlink(d_inode(dentry));
 		drop_nlink(dir_i);
 	}
@@ -746,8 +749,8 @@ static int jffs2_mknod (struct mnt_idmap *idmap, struct inode *dir_i,
 		goto fail;
 	}
 
-	dir_i->i_mtime = inode_set_ctime_to_ts(dir_i,
-					       ITIME(je32_to_cpu(rd->mctime)));
+	inode_set_mtime_to_ts(dir_i,
+			      inode_set_ctime_to_ts(dir_i, ITIME(je32_to_cpu(rd->mctime))));
 
 	jffs2_free_raw_dirent(rd);
 
@@ -868,16 +871,18 @@ static int jffs2_rename (struct mnt_idmap *idmap,
 		 * caller won't do it on its own since we are returning an error.
 		 */
 		d_invalidate(new_dentry);
-		new_dir_i->i_mtime = inode_set_ctime_to_ts(new_dir_i,
-							   ITIME(now));
+		inode_set_mtime_to_ts(new_dir_i,
+				      inode_set_ctime_to_ts(new_dir_i, ITIME(now)));
 		return ret;
 	}
 
 	if (d_is_dir(old_dentry))
 		drop_nlink(old_dir_i);
 
-	old_dir_i->i_mtime = inode_set_ctime_to_ts(old_dir_i, ITIME(now));
-	new_dir_i->i_mtime = inode_set_ctime_to_ts(new_dir_i, ITIME(now));
+	inode_set_mtime_to_ts(old_dir_i,
+			      inode_set_ctime_to_ts(old_dir_i, ITIME(now)));
+	inode_set_mtime_to_ts(new_dir_i,
+			      inode_set_ctime_to_ts(new_dir_i, ITIME(now)));
 
 	return 0;
 }
diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index 11c66793960e..62ea76da7fdf 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -317,8 +317,8 @@ static int jffs2_write_end(struct file *filp, struct address_space *mapping,
 			inode->i_size = pos + writtenlen;
 			inode->i_blocks = (inode->i_size + 511) >> 9;
 
-			inode->i_mtime = inode_set_ctime_to_ts(inode,
-							       ITIME(je32_to_cpu(ri->ctime)));
+			inode_set_mtime_to_ts(inode,
+					      inode_set_ctime_to_ts(inode, ITIME(je32_to_cpu(ri->ctime))));
 		}
 	}
 
diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 0403efab4089..d175cccb7c55 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -113,8 +113,8 @@ int jffs2_do_setattr (struct inode *inode, struct iattr *iattr)
 
 
 	ri->isize = cpu_to_je32((ivalid & ATTR_SIZE)?iattr->ia_size:inode->i_size);
-	ri->atime = cpu_to_je32(I_SEC((ivalid & ATTR_ATIME)?iattr->ia_atime:inode->i_atime));
-	ri->mtime = cpu_to_je32(I_SEC((ivalid & ATTR_MTIME)?iattr->ia_mtime:inode->i_mtime));
+	ri->atime = cpu_to_je32(I_SEC((ivalid & ATTR_ATIME)?iattr->ia_atime:inode_get_atime(inode)));
+	ri->mtime = cpu_to_je32(I_SEC((ivalid & ATTR_MTIME)?iattr->ia_mtime:inode_get_mtime(inode)));
 	ri->ctime = cpu_to_je32(I_SEC((ivalid & ATTR_CTIME)?iattr->ia_ctime:inode_get_ctime(inode)));
 
 	ri->offset = cpu_to_je32(0);
@@ -147,9 +147,9 @@ int jffs2_do_setattr (struct inode *inode, struct iattr *iattr)
 		return PTR_ERR(new_metadata);
 	}
 	/* It worked. Update the inode */
-	inode->i_atime = ITIME(je32_to_cpu(ri->atime));
+	inode_set_atime_to_ts(inode, ITIME(je32_to_cpu(ri->atime)));
 	inode_set_ctime_to_ts(inode, ITIME(je32_to_cpu(ri->ctime)));
-	inode->i_mtime = ITIME(je32_to_cpu(ri->mtime));
+	inode_set_mtime_to_ts(inode, ITIME(je32_to_cpu(ri->mtime)));
 	inode->i_mode = jemode_to_cpu(ri->mode);
 	i_uid_write(inode, je16_to_cpu(ri->uid));
 	i_gid_write(inode, je16_to_cpu(ri->gid));
@@ -282,8 +282,8 @@ struct inode *jffs2_iget(struct super_block *sb, unsigned long ino)
 	i_uid_write(inode, je16_to_cpu(latest_node.uid));
 	i_gid_write(inode, je16_to_cpu(latest_node.gid));
 	inode->i_size = je32_to_cpu(latest_node.isize);
-	inode->i_atime = ITIME(je32_to_cpu(latest_node.atime));
-	inode->i_mtime = ITIME(je32_to_cpu(latest_node.mtime));
+	inode_set_atime_to_ts(inode, ITIME(je32_to_cpu(latest_node.atime)));
+	inode_set_mtime_to_ts(inode, ITIME(je32_to_cpu(latest_node.mtime)));
 	inode_set_ctime_to_ts(inode, ITIME(je32_to_cpu(latest_node.ctime)));
 
 	set_nlink(inode, f->inocache->pino_nlink);
@@ -386,8 +386,8 @@ void jffs2_dirty_inode(struct inode *inode, int flags)
 	iattr.ia_mode = inode->i_mode;
 	iattr.ia_uid = inode->i_uid;
 	iattr.ia_gid = inode->i_gid;
-	iattr.ia_atime = inode->i_atime;
-	iattr.ia_mtime = inode->i_mtime;
+	iattr.ia_atime = inode_get_atime(inode);
+	iattr.ia_mtime = inode_get_mtime(inode);
 	iattr.ia_ctime = inode_get_ctime(inode);
 
 	jffs2_do_setattr(inode, &iattr);
@@ -475,8 +475,8 @@ struct inode *jffs2_new_inode (struct inode *dir_i, umode_t mode, struct jffs2_r
 	inode->i_mode = jemode_to_cpu(ri->mode);
 	i_gid_write(inode, je16_to_cpu(ri->gid));
 	i_uid_write(inode, je16_to_cpu(ri->uid));
-	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
-	ri->atime = ri->mtime = ri->ctime = cpu_to_je32(I_SEC(inode->i_mtime));
+	simple_inode_init_ts(inode);
+	ri->atime = ri->mtime = ri->ctime = cpu_to_je32(I_SEC(inode_get_mtime(inode)));
 
 	inode->i_blocks = 0;
 	inode->i_size = 0;
diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index 50727a1ff931..86ab014a349c 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -36,8 +36,8 @@ struct kvec;
 #define JFFS2_NOW() JFFS2_CLAMP_TIME(ktime_get_real_seconds())
 #define I_SEC(tv) JFFS2_CLAMP_TIME((tv).tv_sec)
 #define JFFS2_F_I_CTIME(f) I_SEC(inode_get_ctime(OFNI_EDONI_2SFFJ(f)))
-#define JFFS2_F_I_MTIME(f) I_SEC(OFNI_EDONI_2SFFJ(f)->i_mtime)
-#define JFFS2_F_I_ATIME(f) I_SEC(OFNI_EDONI_2SFFJ(f)->i_atime)
+#define JFFS2_F_I_MTIME(f) I_SEC(inode_get_mtime(OFNI_EDONI_2SFFJ(f)))
+#define JFFS2_F_I_ATIME(f) I_SEC(inode_get_atime(OFNI_EDONI_2SFFJ(f)))
 #define sleep_on_spinunlock(wq, s)				\
 	do {							\
 		DECLARE_WAITQUEUE(__wait, current);		\
-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
