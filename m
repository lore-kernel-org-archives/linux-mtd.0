Return-Path: <SRS0=7p5O=AF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AAFC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 05:34:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 771EA2072E
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 05:34:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mhnAs2QV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 771EA2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lTgfqmm3wSJYaI6cqRV77+w25bj1fQvkA0oGhWJmGns=; b=mhnAs2QV/xfYLERUZFhiKwKu9
	gFxVnmV7mbPPVTkRyqEhYUQPGgaZWvbB7EThWZbd78l//dF8yWZZw1arii7kOKQ9SjQSw2ne/BV8v
	XaZ064Isa22ehvizHHHkidTxG63Kf6ppc9xbMu3qzmA1YdBPC2PPirnySXGilAeI1Ou4vnlvFjzpj
	3GD5xgr8FBMcm2somk1kx0eQV70m7yCfZRk5VAHNTtzVCy9tPDVEQxJXwBcz+Nx7tI+sEuanSQz5V
	JSniLs2yrMFVMj03JWqUYlS2+C6v9NaGuEvq5ex0nsgHurFTvDwy2hQMmOKiuqBVDpkjDzkW8R4Bk
	lDZI7gT1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jny2Z-0005vc-EN; Wed, 24 Jun 2020 05:33:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jny2W-0005uS-T6
 for linux-mtd@lists.infradead.org; Wed, 24 Jun 2020 05:33:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id B24E02A384C
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v9 2/4] fs: Add standard casefolding support
Organization: Collabora
References: <20200624043341.33364-1-drosen@google.com>
 <20200624043341.33364-3-drosen@google.com>
Date: Wed, 24 Jun 2020 01:33:36 -0400
In-Reply-To: <20200624043341.33364-3-drosen@google.com> (Daniel Rosenberg's
 message of "Tue, 23 Jun 2020 21:33:39 -0700")
Message-ID: <87bll9gh8v.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chao Yu <chao@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Daniel Rosenberg <drosen@google.com> writes:

> This adds general supporting functions for filesystems that use
> utf8 casefolding. It provides standard dentry_operations and adds the
> necessary structures in struct super_block to allow this standardization.
>
> Ext4 and F2fs will switch to these common implementations.
>
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/libfs.c         | 101 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fs.h |  22 ++++++++++
>  2 files changed, 123 insertions(+)
>
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 4d08edf19c782..f7345a5ed562f 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -20,6 +20,8 @@
>  #include <linux/fs_context.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/fsnotify.h>
> +#include <linux/unicode.h>
> +#include <linux/fscrypt.h>
>  
>  #include <linux/uaccess.h>
>  
> @@ -1363,3 +1365,102 @@ bool is_empty_dir_inode(struct inode *inode)
>  	return (inode->i_fop == &empty_dir_operations) &&
>  		(inode->i_op == &empty_dir_inode_operations);
>  }
> +
> +#ifdef CONFIG_UNICODE
> +/**
> + * needs_casefold - generic helper to determine if a filename should be casefolded
> + * @dir: Parent directory
> + *
> + * Generic helper for filesystems to use to determine if the name of a dentry
> + * should be casefolded. It does not make sense to casefold the no-key token of
> + * an encrypted filename.
> + *
> + * Return: if names will need casefolding
> + */
> +bool needs_casefold(const struct inode *dir)
> +{
> +	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding &&
> +			(!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir));
> +}
> +EXPORT_SYMBOL(needs_casefold);
> +
> +/**
> + * generic_ci_d_compare - generic d_compare implementation for casefolding filesystems
> + * @dentry:	dentry whose name we are checking against
> + * @len:	len of name of dentry
> + * @str:	str pointer to name of dentry
> + * @name:	Name to compare against
> + *
> + * Return: 0 if names match, 1 if mismatch, or -ERRNO
> + */
> +int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
> +			  const char *str, const struct qstr *name)
> +{
> +	const struct dentry *parent = READ_ONCE(dentry->d_parent);
> +	const struct inode *inode = READ_ONCE(parent->d_inode);
> +	const struct super_block *sb = dentry->d_sb;
> +	const struct unicode_map *um = sb->s_encoding;
> +	struct qstr qstr = QSTR_INIT(str, len);
> +	char strbuf[DNAME_INLINE_LEN];
> +	int ret;
> +
> +	if (!inode || !needs_casefold(inode))
> +		goto fallback;
> +	/*
> +	 * If the dentry name is stored in-line, then it may be concurrently
> +	 * modified by a rename.  If this happens, the VFS will eventually retry
> +	 * the lookup, so it doesn't matter what ->d_compare() returns.
> +	 * However, it's unsafe to call utf8_strncasecmp() with an unstable
> +	 * string.  Therefore, we have to copy the name into a temporary buffer.
> +	 */
> +	if (len <= DNAME_INLINE_LEN - 1) {
> +		memcpy(strbuf, str, len);
> +		strbuf[len] = 0;
> +		qstr.name = strbuf;
> +		/* prevent compiler from optimizing out the temporary buffer */
> +		barrier();
> +	}
> +	ret = utf8_strncasecmp(um, name, &qstr);
> +	if (ret >= 0)
> +		return ret;
> +
> +	if (sb_has_enc_strict_mode(sb))
> +		return -EINVAL;
> +fallback:
> +	if (len != name->len)
> +		return 1;
> +	return !!memcmp(str, name->name, len);
> +}
> +EXPORT_SYMBOL(generic_ci_d_compare);
> +
> +/**
> + * generic_ci_d_hash - generic d_hash implementation for casefolding filesystems
> + * @dentry:	dentry whose name we are hashing
> + * @str:	qstr of name whose hash we should fill in
> + *
> + * Return: 0 if hash was successful, or -ERRNO
> + */
> +int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
> +{
> +	const struct inode *inode = READ_ONCE(dentry->d_inode);
> +	struct super_block *sb = dentry->d_sb;
> +	const struct unicode_map *um = sb->s_encoding;
> +	int ret = 0;
> +
> +	if (!inode || !needs_casefold(inode))
> +		return 0;
> +
> +	ret = utf8_casefold_hash(um, dentry, str);
> +	if (ret < 0)
> +		goto err;
> +
> +	return 0;
> +err:
> +	if (sb_has_enc_strict_mode(sb))
> +		ret = -EINVAL;
> +	else
> +		ret = 0;
> +	return ret;
> +}

Maybe drop the err label and simplify:

  ret = utf8_casefold_hash(um, dentry, str);
  if (ret < 0 && sb_has_enc_strict_mode(sb))
     return -EINVAL;
  return 0;


> +EXPORT_SYMBOL(generic_ci_d_hash);
> +#endif
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 3f881a892ea74..261904e06873b 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1392,6 +1392,12 @@ extern int send_sigurg(struct fown_struct *fown);
>  #define SB_ACTIVE	(1<<30)
>  #define SB_NOUSER	(1<<31)
>  
> +/* These flags relate to encoding and casefolding */
> +#define SB_ENC_STRICT_MODE_FL	(1 << 0)
> +
> +#define sb_has_enc_strict_mode(sb) \
> +	(sb->s_encoding_flags & SB_ENC_STRICT_MODE_FL)
> +
>  /*
>   *	Umount options
>   */
> @@ -1461,6 +1467,10 @@ struct super_block {
>  #endif
>  #ifdef CONFIG_FS_VERITY
>  	const struct fsverity_operations *s_vop;
> +#endif
> +#ifdef CONFIG_UNICODE
> +	struct unicode_map *s_encoding;
> +	__u16 s_encoding_flags;
>  #endif
>  	struct hlist_bl_head	s_roots;	/* alternate root dentries for NFS */
>  	struct list_head	s_mounts;	/* list of mounts; _not_ for fs use */
> @@ -3385,6 +3395,18 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
>  
>  extern int generic_check_addressable(unsigned, u64);
>  
> +#ifdef CONFIG_UNICODE
> +extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
> +extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
> +				const char *str, const struct qstr *name);
> +extern bool needs_casefold(const struct inode *dir);
> +#else
> +static inline bool needs_casefold(const struct inode *dir)
> +{
> +	return 0;
> +}
> +#endif
> +
>  #ifdef CONFIG_MIGRATION
>  extern int buffer_migrate_page(struct address_space *,
>  				struct page *, struct page *,

-- 
Gabriel Krisman Bertazi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
