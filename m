Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33171C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 21:23:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB5F923AF8
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 21:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB5F923AF8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZvyTpBGPKOMFRBDjcA2qC6Bq0k0JD4b9MHvZJxUKFyE=; b=INOtsPpB2Hd0D1X5/mYC2OfPR
	3PvIHnxMSo8WurxDyNswMqD3GpA0FnpNa5fULOLppMYVVel7y5haj7Ni86Yc2zn1v2TZWeyNWsAly
	pHlesaJQbWr4a531fX1CnVEdrEBVAqq26RHktecOuLZVWrf0TfgoOUe8X072vNiiOs8oqiVi1YOx6
	f/WPYz18UGCvU1pUwAPJEUfb3dXowMBYGy1ny+dJgjqiwyt1Tl8xfcoa0KZj0H2gS+NcVoD2JkRTC
	jrrvT3fa1OdAr9+fukqbMa2jSS8SDkNLhWPmZW8U0nPNbPjk7v/Jr2+j7aSRhSAaukmRVYI07qnHh
	oiTXvBmCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l33tM-0002Ei-HH; Fri, 22 Jan 2021 21:22:52 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l33t9-0002Bv-Kz
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2021 21:22:42 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 09420181CBE0E;
 Fri, 22 Jan 2021 22:22:36 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QOALdkXGjvJJ; Fri, 22 Jan 2021 22:22:35 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lq2PuT6KfwIP; Fri, 22 Jan 2021 22:22:34 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] ubifs: Don't add fscrypt context to xattrs
Date: Fri, 22 Jan 2021 22:22:27 +0100
Message-Id: <20210122212229.17072-3-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122212229.17072-1-richard@nod.at>
References: <20210122212229.17072-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_162240_102346_97005D15 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: richard@nod.at, david@sigma-star.at, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In UBIFS xattrs are inodes too, make sure that these inodes
don't get a fscrypt context.
Otherwise we will end up with undeletable xattrs which will
waste memory on the flash.

Cc: stable@vger.kernel.org
Fixes: d475a507457b ("ubifs: Add skeleton for fscrypto")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c   | 23 +++++++++++++----------
 fs/ubifs/ubifs.h |  2 +-
 fs/ubifs/xattr.c |  2 +-
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 04912dedca48..8a34e0118ee9 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -68,13 +68,14 @@ static int inherit_flags(const struct inode *dir, umode_t mode)
  * @c: UBIFS file-system description object
  * @dir: parent directory inode
  * @mode: inode mode flags
+ * @omit_fscrypt_ctx: Don't create a fscrypt context for this inode
  *
  * This function finds an unused inode number, allocates new inode and
  * initializes it. Returns new inode in case of success and an error code in
  * case of failure.
  */
 struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
-			      umode_t mode)
+			      umode_t mode, int omit_fscrypt_ctx)
 {
 	int err;
 	struct inode *inode;
@@ -99,10 +100,12 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 			 current_time(inode);
 	inode->i_mapping->nrpages = 0;
 
-	err = fscrypt_prepare_new_inode(dir, inode, &encrypted);
-	if (err) {
-		ubifs_err(c, "fscrypt_prepare_new_inode failed: %i", err);
-		goto out_iput;
+	if (!omit_fscrypt_ctx) {
+		err = fscrypt_prepare_new_inode(dir, inode, &encrypted);
+		if (err) {
+			ubifs_err(c, "fscrypt_prepare_new_inode failed: %i", err);
+			goto out_iput;
+		}
 	}
 
 	switch (mode & S_IFMT) {
@@ -309,7 +312,7 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 
 	sz_change = CALC_DENT_SIZE(fname_len(&nm));
 
-	inode = ubifs_new_inode(c, dir, mode);
+	inode = ubifs_new_inode(c, dir, mode, 0);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
 		goto out_fname;
@@ -385,7 +388,7 @@ static int do_tmpfile(struct inode *dir, struct dentry *dentry,
 		return err;
 	}
 
-	inode = ubifs_new_inode(c, dir, mode);
+	inode = ubifs_new_inode(c, dir, mode, 0);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
 		goto out_budg;
@@ -971,7 +974,7 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 
 	sz_change = CALC_DENT_SIZE(fname_len(&nm));
 
-	inode = ubifs_new_inode(c, dir, S_IFDIR | mode);
+	inode = ubifs_new_inode(c, dir, S_IFDIR | mode, 0);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
 		goto out_fname;
@@ -1058,7 +1061,7 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 
 	sz_change = CALC_DENT_SIZE(fname_len(&nm));
 
-	inode = ubifs_new_inode(c, dir, mode);
+	inode = ubifs_new_inode(c, dir, mode, 0);
 	if (IS_ERR(inode)) {
 		kfree(dev);
 		err = PTR_ERR(inode);
@@ -1140,7 +1143,7 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 
 	sz_change = CALC_DENT_SIZE(fname_len(&nm));
 
-	inode = ubifs_new_inode(c, dir, S_IFLNK | S_IRWXUGO);
+	inode = ubifs_new_inode(c, dir, S_IFLNK | S_IRWXUGO, 0);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
 		goto out_fname;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index fc2cdde3b549..dc9b6ba41e77 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1994,7 +1994,7 @@ int ubifs_update_time(struct inode *inode, struct timespec64 *time, int flags);
 
 /* dir.c */
 struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
-			      umode_t mode);
+			      umode_t mode, int omit_fscrypt_ctx);
 int ubifs_getattr(const struct path *path, struct kstat *stat,
 		  u32 request_mask, unsigned int flags);
 int ubifs_check_dir_empty(struct inode *dir);
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index a0b9b349efe6..430abe9e56af 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -110,7 +110,7 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	if (err)
 		return err;
 
-	inode = ubifs_new_inode(c, host, S_IFREG | S_IRWXUGO);
+	inode = ubifs_new_inode(c, host, S_IFREG | S_IRWXUGO, 1);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
 		goto out_budg;
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
