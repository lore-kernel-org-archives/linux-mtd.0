Return-Path: <SRS0=YFz0=RR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4964AC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 17:18:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18DBF217F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 17:18:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J2fnonqV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="s6RyzB4s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18DBF217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JaA23W6jM9njV7yGcMuR+g4TUgwvSx2KKIMjq2eACWE=; b=J2fnonqVyxdiik
	uChwMab/Iyj/qda3Sbd/N4Rwrt7+MpeSW/amH2Tm4hq+ucxQl4zyfP5Wv/dm6+7iqXMbdlfnGudIu
	sv/KzXZPiEPjLneFo/I/keaSPd0zZG7tkMLvLjUqwo5imlzNHSth4umRb3OGVj7SPc2mPCDj5i6L5
	41Nx4U/DL7ufavIHfaO0f5/4lNGE1Sidswc2iXCi3R3JqX23SAfgiUNmKEHBczLKBeVAcg0GdJB8i
	nMaLB7HH49T94zVe/87wK9sjS84FyKZr7QSefeo7zWm+1BC43Jozy+HJLNWB4YFJPYgbtAMKC/lPo
	Q9tssJQQwo3B1WhomG8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4U03-0001vS-Ri; Thu, 14 Mar 2019 17:18:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4U02-0001vI-SG
 for linux-mtd@bombadil.infradead.org; Thu, 14 Mar 2019 17:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qJ1qY1YfCK0s/aBVTj6jZsg6UHyfmcBRzSmOBi0AGmY=; b=s6RyzB4sqoj4z82SioFyGsO+cu
 lZVZHbFq7pb/Cs2588to2c9mdpLrkY9o0u1Ay0zLQWkVFol41sqPnLBKp7lbDIjN0bLYMkWdBVI4R
 zF+YxO4wTxje6UQ4CiBEcl/+lpduVA3qbEYq6Nw7Ap3KwKmZTZXZCX8a02GLWJ0Tg7+OKf3mHN2PU
 +mVKhC9E5aatRi/bFg2HyT7nQVBKiJGkEEEYedlTtypGEew1ynFXYv4ykwCsVoWo+JKVwW6vFqsTA
 MjXEalEwL+GeEpsuQ2JEENEfMULjfx8G/qHAsyDmlK66eGyobaii7xiA66FGI+g/K77m4GZKLfABc
 Oxj9scmg==;
Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4Tzz-0004xR-FI
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2019 17:18:33 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id B9F0218013770;
 Thu, 14 Mar 2019 18:16:22 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] ubifs: Implement new mount option, fscrypt_key_required
Date: Thu, 14 Mar 2019 18:15:59 +0100
Message-Id: <20190314171559.27584-5-richard@nod.at>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190314171559.27584-1-richard@nod.at>
References: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
 <20190314171559.27584-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_171832_013724_E0AF5DB7 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: tytso@mit.edu, miklos@szeredi.hu, Richard Weinberger <richard@nod.at>,
 amir73il@gmail.com, linux-unionfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, paullawrence@google.com,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Usually fscrypt allows limited access to encrypted files even
if no key is available.
Encrypted filenames are shown and based on this names users
can unlink and move files.

This is not always what people expect. The fscrypt_key_required mount
option disables this feature.
If no key is present all access is denied with the -ENOKEY error code.

The side benefit of this is that we don't need ->d_revalidate().
Not having ->d_revalidate() makes an encrypted ubifs usable
as overlayfs upper directory.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/crypto.c |  2 +-
 fs/ubifs/dir.c    | 29 ++++++++++++++++++++++++++---
 fs/ubifs/super.c  | 15 +++++++++++++++
 fs/ubifs/ubifs.h  |  1 +
 4 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index 4aaedf2d7f44..a6a48c5dc058 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -76,7 +76,7 @@ int ubifs_decrypt(const struct inode *inode, struct ubifs_data_node *dn,
 }
 
 const struct fscrypt_operations ubifs_crypt_operations = {
-	.flags			= FS_CFLG_OWN_PAGES,
+	.flags			= FS_CFLG_OWN_PAGES | FS_CFLG_OWN_D_OPS,
 	.key_prefix		= "ubifs:",
 	.get_context		= ubifs_crypt_get_context,
 	.set_context		= ubifs_crypt_set_context,
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index b0cb913697c5..4d029f08b80d 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -208,6 +208,16 @@ static int dbg_check_name(const struct ubifs_info *c,
 	return 0;
 }
 
+static void ubifs_set_dentry_ops(struct inode *dir, struct dentry *dentry)
+{
+#ifdef CONFIG_FS_ENCRYPTION
+	struct ubifs_info *c = dir->i_sb->s_fs_info;
+
+	if (IS_ENCRYPTED(dir) && !c->fscrypt_key_required)
+		d_set_d_op(dentry, &fscrypt_d_ops);
+#endif
+}
+
 static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 				   unsigned int flags)
 {
@@ -224,7 +234,10 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 	if (err)
 		return ERR_PTR(err);
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
+	ubifs_set_dentry_ops(dir, dentry);
+
+	err = fscrypt_setup_filename(dir, &dentry->d_name,
+				     !c->fscrypt_key_required, &nm);
 	if (err)
 		return ERR_PTR(err);
 
@@ -240,6 +253,11 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 	}
 
 	if (nm.hash) {
+		if (c->fscrypt_key_required) {
+			inode = ERR_PTR(-ENOKEY);
+			goto done;
+		}
+
 		ubifs_assert(c, fname_len(&nm) == 0);
 		ubifs_assert(c, fname_name(&nm) == NULL);
 		dent_key_init_hash(c, &key, dir->i_ino, nm.hash);
@@ -529,6 +547,9 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 		if (err)
 			return err;
 
+		if (c->fscrypt_key_required && !dir->i_crypt_info)
+			return -ENOKEY;
+
 		err = fscrypt_fname_alloc_buffer(dir, UBIFS_MAX_NLEN, &fstr);
 		if (err)
 			return err;
@@ -798,7 +819,8 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 			return err;
 	}
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
+	err = fscrypt_setup_filename(dir, &dentry->d_name, !c->fscrypt_key_required,
+				     &nm);
 	if (err)
 		return err;
 
@@ -908,7 +930,8 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 			return err;
 	}
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
+	err = fscrypt_setup_filename(dir, &dentry->d_name,
+				     !c->fscrypt_key_required, &nm);
 	if (err)
 		return err;
 
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 8dc2818fdd84..e081b00236b6 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -445,6 +445,9 @@ static int ubifs_show_options(struct seq_file *s, struct dentry *root)
 			   ubifs_compr_name(c, c->mount_opts.compr_type));
 	}
 
+	if (c->fscrypt_key_required)
+		seq_puts(s, ",fscrypt_key_required");
+
 	seq_printf(s, ",assert=%s", ubifs_assert_action_name(c));
 	seq_printf(s, ",ubi=%d,vol=%d", c->vi.ubi_num, c->vi.vol_id);
 
@@ -952,6 +955,7 @@ enum {
 	Opt_assert,
 	Opt_auth_key,
 	Opt_auth_hash_name,
+	Opt_fscrypt_key_required,
 	Opt_ignore,
 	Opt_err,
 };
@@ -969,6 +973,7 @@ static const match_table_t tokens = {
 	{Opt_ignore, "ubi=%s"},
 	{Opt_ignore, "vol=%s"},
 	{Opt_assert, "assert=%s"},
+	{Opt_fscrypt_key_required, "fscrypt_key_required"},
 	{Opt_err, NULL},
 };
 
@@ -1008,6 +1013,7 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 {
 	char *p;
 	substring_t args[MAX_OPT_ARGS];
+	unsigned int old_fscrypt_key_required = c->fscrypt_key_required;
 
 	if (!options)
 		return 0;
@@ -1099,6 +1105,15 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 			if (!c->auth_hash_name)
 				return -ENOMEM;
 			break;
+		case Opt_fscrypt_key_required:
+			c->fscrypt_key_required = 1;
+
+			if (is_remount && (old_fscrypt_key_required != c->fscrypt_key_required)) {
+				ubifs_err(c, "fscrypt_key_required cannot changed by remount");
+				return -EINVAL;
+			}
+
+			break;
 		case Opt_ignore:
 			break;
 		default:
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 1ae12900e01d..71b03a6798ae 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1304,6 +1304,7 @@ struct ubifs_info {
 	unsigned int rw_incompat:1;
 	unsigned int assert_action:2;
 	unsigned int authenticated:1;
+	unsigned int fscrypt_key_required:1;
 
 	struct mutex tnc_mutex;
 	struct ubifs_zbranch zroot;
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
