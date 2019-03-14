Return-Path: <SRS0=YFz0=RR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB48DC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 17:49:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE6AF218A1
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 17:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fOBN6v4U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQCEhING"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE6AF218A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gU7CqmEAGX3K8bxB+w+c1v67vtIAnPU3u8tKLuuD2UE=; b=fOBN6v4UlT8Ay7
	dQG5i56MqYcB9+wCXWpK0VboWgKdysNpcL7BsSjPjn/m6Oe442Kn/0x6pLLfTbv4woa4pzQOEYuxG
	07b8Wzy665Ikh8AeyyztEbKIlU0f991W/LgnLnrzgBeFcz9OaMfWPLUqpOb1edVjzjLpb0n0b5fL8
	eW7u8MkZaQPAvG7JuDK+BGCEEdGEjCAsfOFW//YiQwfsSo3MCKs36gRwN4BGezQh6MziUiuFJedRl
	Sg5plYBrhqjG2Y68Rx02mX6qsCkACSqTmjw9tCUmNUfGA0wX63mCHeTZty/L/JqquipXNHQ8yQt1q
	w+yTEy6oF0nu4XQthkJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4UTo-0003mi-Sf; Thu, 14 Mar 2019 17:49:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4UTl-0003m1-1c
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2019 17:49:18 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CABA820811;
 Thu, 14 Mar 2019 17:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1552585756;
 bh=/NIPo9XCtB4XF2DnPmV03vCZZuL9qDnDUy2ol5LzEyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AQCEhINGwMnK5/+1z6GuDd1iGkJixjliBxfA9LxjyCXmJUFl/zj3+0NbIsfOx8VuW
 uSug/iDhdIjV/eQSV0OLRBnavUi0Kr1mQgUPu0VLKkyuCzr0Il+WhleC8sfMy4A9YO
 uF/IBH/CLR1bguCeaaecnGfcfCiyJ4r64Urfps04=
Date: Thu, 14 Mar 2019 10:49:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 4/4] ubifs: Implement new mount option,
 fscrypt_key_required
Message-ID: <20190314174913.GA30026@gmail.com>
References: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
 <20190314171559.27584-1-richard@nod.at>
 <20190314171559.27584-5-richard@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190314171559.27584-5-richard@nod.at>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_104917_126351_B16D239D 
X-CRM114-Status: GOOD (  26.62  )
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
Cc: tytso@mit.edu, miklos@szeredi.hu, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 paullawrence@google.com, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,

On Thu, Mar 14, 2019 at 06:15:59PM +0100, Richard Weinberger wrote:
> Usually fscrypt allows limited access to encrypted files even
> if no key is available.
> Encrypted filenames are shown and based on this names users
> can unlink and move files.

Actually, fscrypt doesn't allow moving files without the key.  It would only be
possible for cross-renames, i.e. renames with the RENAME_EXCHANGE flag.  So for
consistency with regular renames, fscrypt also forbids cross-renames if the key
for either the source or destination directory is missing.

So the main use case for the ciphertext view is *deleting* files.  For example,
deleting a user's home directory after that user has been removed from the
system.  Or the system freeing up space by deleting cache files from a user who
isn't currently logged in.

> 
> This is not always what people expect. The fscrypt_key_required mount
> option disables this feature.
> If no key is present all access is denied with the -ENOKEY error code.

The problem with this mount option is that it allows users to create undeletable
files.  So I'm not really convinced yet this is a good change.  And though the
fscrypt_key_required semantics are easier to implement, we'd still have to
support the existing semantics too, thus increasing the maintenance cost.

> 
> The side benefit of this is that we don't need ->d_revalidate().
> Not having ->d_revalidate() makes an encrypted ubifs usable
> as overlayfs upper directory.
> 

It would be preferable if we could get overlayfs to work without providing a
special mount option.

> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  fs/ubifs/crypto.c |  2 +-
>  fs/ubifs/dir.c    | 29 ++++++++++++++++++++++++++---
>  fs/ubifs/super.c  | 15 +++++++++++++++
>  fs/ubifs/ubifs.h  |  1 +
>  4 files changed, 43 insertions(+), 4 deletions(-)
> 

Shouldn't readlink() honor the mount option too?

> diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
> index 4aaedf2d7f44..a6a48c5dc058 100644
> --- a/fs/ubifs/crypto.c
> +++ b/fs/ubifs/crypto.c
> @@ -76,7 +76,7 @@ int ubifs_decrypt(const struct inode *inode, struct ubifs_data_node *dn,
>  }
>  
>  const struct fscrypt_operations ubifs_crypt_operations = {
> -	.flags			= FS_CFLG_OWN_PAGES,
> +	.flags			= FS_CFLG_OWN_PAGES | FS_CFLG_OWN_D_OPS,
>  	.key_prefix		= "ubifs:",
>  	.get_context		= ubifs_crypt_get_context,
>  	.set_context		= ubifs_crypt_set_context,
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index b0cb913697c5..4d029f08b80d 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -208,6 +208,16 @@ static int dbg_check_name(const struct ubifs_info *c,
>  	return 0;
>  }
>  
> +static void ubifs_set_dentry_ops(struct inode *dir, struct dentry *dentry)
> +{
> +#ifdef CONFIG_FS_ENCRYPTION
> +	struct ubifs_info *c = dir->i_sb->s_fs_info;
> +
> +	if (IS_ENCRYPTED(dir) && !c->fscrypt_key_required)
> +		d_set_d_op(dentry, &fscrypt_d_ops);
> +#endif
> +}
> +
>  static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
>  				   unsigned int flags)
>  {
> @@ -224,7 +234,10 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
>  	if (err)
>  		return ERR_PTR(err);
>  
> -	err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
> +	ubifs_set_dentry_ops(dir, dentry);
> +
> +	err = fscrypt_setup_filename(dir, &dentry->d_name,
> +				     !c->fscrypt_key_required, &nm);
>  	if (err)
>  		return ERR_PTR(err);
>  
> @@ -240,6 +253,11 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
>  	}
>  
>  	if (nm.hash) {
> +		if (c->fscrypt_key_required) {
> +			inode = ERR_PTR(-ENOKEY);
> +			goto done;
> +		}
> +
>  		ubifs_assert(c, fname_len(&nm) == 0);
>  		ubifs_assert(c, fname_name(&nm) == NULL);
>  		dent_key_init_hash(c, &key, dir->i_ino, nm.hash);
> @@ -529,6 +547,9 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
>  		if (err)
>  			return err;
>  
> +		if (c->fscrypt_key_required && !dir->i_crypt_info)
> +			return -ENOKEY;
> +

How about returning -ENOKEY when trying to open the directory in the first
place, rather than allowing getting to readdir()?  That would match the behavior
of regular files.

>  		err = fscrypt_fname_alloc_buffer(dir, UBIFS_MAX_NLEN, &fstr);
>  		if (err)
>  			return err;
> @@ -798,7 +819,8 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
>  			return err;
>  	}
>  
> -	err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
> +	err = fscrypt_setup_filename(dir, &dentry->d_name, !c->fscrypt_key_required,
> +				     &nm);
>  	if (err)
>  		return err;
>  
> @@ -908,7 +930,8 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
>  			return err;
>  	}
>  
> -	err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
> +	err = fscrypt_setup_filename(dir, &dentry->d_name,
> +				     !c->fscrypt_key_required, &nm);
>  	if (err)
>  		return err;
>  
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 8dc2818fdd84..e081b00236b6 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -445,6 +445,9 @@ static int ubifs_show_options(struct seq_file *s, struct dentry *root)
>  			   ubifs_compr_name(c, c->mount_opts.compr_type));
>  	}
>  
> +	if (c->fscrypt_key_required)
> +		seq_puts(s, ",fscrypt_key_required");
> +
>  	seq_printf(s, ",assert=%s", ubifs_assert_action_name(c));
>  	seq_printf(s, ",ubi=%d,vol=%d", c->vi.ubi_num, c->vi.vol_id);
>  
> @@ -952,6 +955,7 @@ enum {
>  	Opt_assert,
>  	Opt_auth_key,
>  	Opt_auth_hash_name,
> +	Opt_fscrypt_key_required,
>  	Opt_ignore,
>  	Opt_err,
>  };
> @@ -969,6 +973,7 @@ static const match_table_t tokens = {
>  	{Opt_ignore, "ubi=%s"},
>  	{Opt_ignore, "vol=%s"},
>  	{Opt_assert, "assert=%s"},
> +	{Opt_fscrypt_key_required, "fscrypt_key_required"},
>  	{Opt_err, NULL},
>  };
>  
> @@ -1008,6 +1013,7 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
>  {
>  	char *p;
>  	substring_t args[MAX_OPT_ARGS];
> +	unsigned int old_fscrypt_key_required = c->fscrypt_key_required;
>  
>  	if (!options)
>  		return 0;
> @@ -1099,6 +1105,15 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
>  			if (!c->auth_hash_name)
>  				return -ENOMEM;
>  			break;
> +		case Opt_fscrypt_key_required:
> +			c->fscrypt_key_required = 1;
> +
> +			if (is_remount && (old_fscrypt_key_required != c->fscrypt_key_required)) {
> +				ubifs_err(c, "fscrypt_key_required cannot changed by remount");
> +				return -EINVAL;
> +			}
> +
> +			break;
>  		case Opt_ignore:
>  			break;
>  		default:
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 1ae12900e01d..71b03a6798ae 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -1304,6 +1304,7 @@ struct ubifs_info {
>  	unsigned int rw_incompat:1;
>  	unsigned int assert_action:2;
>  	unsigned int authenticated:1;
> +	unsigned int fscrypt_key_required:1;
>  
>  	struct mutex tnc_mutex;
>  	struct ubifs_zbranch zroot;
> -- 
> 2.21.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
