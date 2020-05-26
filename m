Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A5AC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 09:07:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C4AE2073B
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 09:07:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PDtzxxtV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mykernel.net header.i=cgxu519@mykernel.net header.b="dbxhPhdX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C4AE2073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mykernel.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Message-ID:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zVAOrZvUUDEQ5Vtm5FJtM3ElmFEW/jC8MU38Eho1X/0=; b=PDtzxxtVkosBEk
	z4H0t4U8K34Nzm4gAshBEuHffaLKepbcymj5Il2XvqqqYxDptLjv4ezGLUuBKwXzzTE8GP5JfnOD5
	UwCSaDLbsa0693jyEd16eP6o1WsIP/TYHr4U3HNYPAcZjdEvP8E+Nrn5pdOwCEDKofRP2mIs1BHwA
	c3Usq1mksGUyGkNPNNAhAvVlzqM2w7F21GNynbxkk6v/Kc6rzcIOVjjHoJaZk0R41vHK1Fd6EnNhk
	ory5bT35wkdl8WEuPXyrSs0CWuinNQRv5YfyGGvWXMEdGbSzSgWMwbut99n0gk2NIRxn2C5F5ENZ1
	lfauADaNJcBr+OyqXjaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdVYo-0007ix-6f; Tue, 26 May 2020 09:07:46 +0000
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdVYh-0007h6-7Y
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 09:07:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1590484041; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=S8fTNDTBE6jcKzh6POK1vHc8SPOpsrf4+aktdQezaGoy7LzfmNo08QR9tj78phWUu1DZm3v+HXl/8FYscjPIlt5qB3GrZz56YHVbKiZwGRW4jQqgRhOujDkUYgGH1T79n/2QoKVn64FvZ4Oe2VnG7/ML/obZTmCniKtXk2s92yM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1590484041;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=xsg08CeIuJP72KyYhjFecTAqJQrSgUFEKTOKeEwG1Cs=; 
 b=fVzME/pvn9ynGXc2OeyMetyo+tH7bUfv6GAF8roo2h7rRQNk3at0D3KiL1qKA6w7fhQq6sKyYji/pMDSQDo+Ryo5IzDXsIIyqlzkOO1YabBb9mpB3Ao7mX7Z0q2PP34aAvNx2HZbjB78n7j67caTByReu/wVAAK+iZrLH2Qwgvc=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1590484041; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=xsg08CeIuJP72KyYhjFecTAqJQrSgUFEKTOKeEwG1Cs=;
 b=dbxhPhdXarLR8V59JRyRkNf/AVpMF6rD9fYIs/ZXSqDllJmJV1Q0cnotx1W09N5r
 H99edeTkGvKucBj6hnq2ddHKOmubKRkI4Z8VpMkwGk/NhVe1D/V2D3orJS7NP9gLOT7
 FZ3yslrrXKXBAcJW/5srI56ZnrVxEBk/ILDdcuxA=
Received: from localhost.localdomain (218.18.229.179 [218.18.229.179]) by
 mx.zoho.com.cn with SMTPS id 1590484040348662.1719693793673;
 Tue, 26 May 2020 17:07:20 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: richard@nod.at
Message-ID: <20200526090712.23447-1-cgxu519@mykernel.net>
Subject: [PATCH] ubifs: code cleanup by removing ifdef macro surrounding
Date: Tue, 26 May 2020 17:07:12 +0800
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-ZohoCNMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_020742_360893_113B1BD2 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Chengguang Xu <cgxu519@mykernel.net>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Define ubifs_listxattr and ubifs_xattr_handlers to NULL
when CONFIG_UBIFS_FS_XATTR is not enabled, then we can
remove many ugly ifdef macros in the code.

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
---
Only compile tested.

 fs/ubifs/dir.c   | 2 --
 fs/ubifs/file.c  | 4 ----
 fs/ubifs/super.c | 2 --
 fs/ubifs/ubifs.h | 6 ++++--
 4 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index ef85ec167a84..ab4faebc798e 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1636,9 +1636,7 @@ const struct inode_operations ubifs_dir_inode_operations = {
 	.rename      = ubifs_rename,
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
-#ifdef CONFIG_UBIFS_FS_XATTR
 	.listxattr   = ubifs_listxattr,
-#endif
 	.update_time = ubifs_update_time,
 	.tmpfile     = ubifs_tmpfile,
 };
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 743928efffc1..e5e2d55d353e 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1649,9 +1649,7 @@ const struct address_space_operations ubifs_file_address_operations = {
 const struct inode_operations ubifs_file_inode_operations = {
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
-#ifdef CONFIG_UBIFS_FS_XATTR
 	.listxattr   = ubifs_listxattr,
-#endif
 	.update_time = ubifs_update_time,
 };
 
@@ -1659,9 +1657,7 @@ const struct inode_operations ubifs_symlink_inode_operations = {
 	.get_link    = ubifs_get_link,
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
-#ifdef CONFIG_UBIFS_FS_XATTR
 	.listxattr   = ubifs_listxattr,
-#endif
 	.update_time = ubifs_update_time,
 };
 
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 7fc2f3f07c16..f4295840a710 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2168,9 +2168,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	if (c->max_inode_sz > MAX_LFS_FILESIZE)
 		sb->s_maxbytes = c->max_inode_sz = MAX_LFS_FILESIZE;
 	sb->s_op = &ubifs_super_operations;
-#ifdef CONFIG_UBIFS_FS_XATTR
 	sb->s_xattr = ubifs_xattr_handlers;
-#endif
 	fscrypt_set_ops(sb, &ubifs_crypt_operations);
 
 	mutex_lock(&c->umount_mutex);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index bff682309fbe..74849e39c1a3 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1999,17 +1999,19 @@ int ubifs_getattr(const struct path *path, struct kstat *stat,
 int ubifs_check_dir_empty(struct inode *dir);
 
 /* xattr.c */
-extern const struct xattr_handler *ubifs_xattr_handlers[];
-ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size);
 int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
 		    size_t size, int flags, bool check_lock);
 ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 			size_t size);
 
 #ifdef CONFIG_UBIFS_FS_XATTR
+extern const struct xattr_handler *ubifs_xattr_handlers[];
+ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size);
 void ubifs_evict_xattr_inode(struct ubifs_info *c, ino_t xattr_inum);
 int ubifs_purge_xattrs(struct inode *host);
 #else
+#define ubifs_listxattr NULL
+#define ubifs_xattr_handlers NULL
 static inline void ubifs_evict_xattr_inode(struct ubifs_info *c,
 					   ino_t xattr_inum) { }
 static inline int ubifs_purge_xattrs(struct inode *host)
-- 
2.20.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
