Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3951C2BA83
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 03:56:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A15E420842
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 03:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FyZpSu4g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDjwA1UU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A15E420842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gbybGxgVG7mt1BKnGlJ8PwHIM/a3uOebdI775BRbiFY=; b=FyZpSu4gDnhH9P
	ubxuyFMMMfJ4EVWT1Zz7BjtNAGkA6vQiUnyVTSvojr4f0aHeSEitmflM6wPNr9BDlQ6iemaQLwv+e
	zX6lsN5awdfTLE5m5PMwYy0z3+NMXm3z4mGcFVeMZBexF39Xv0HSIvst3xlyGUH8vi891nOfyGfHu
	Qm8NtCPNj3RpC1pL3YgODGO6ey3dmN8Hr7wGvvwIWrjIrN0Iz2F49q6XnPZbEqcpVNrwE0s9+C495
	DhqBtrx76KKNaGv37Z/lt/ACgurS6mM8XT5nEkDVrNPwjUbUVIOWWEaHOpjdV2GPx8+rpMGHgIWu+
	hHj1oF/H1/erRs10pHAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1j7t-0007KV-Dz; Wed, 12 Feb 2020 03:55:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1j7q-0007K9-9V
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2020 03:55:47 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5566B206D7;
 Wed, 12 Feb 2020 03:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581479745;
 bh=QRHIt8kBfhFwG/eebDuW7D9CmPyDjyjrXyg9CDC5NUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QDjwA1UUCb18CDvTZAWN3AWxXhe8SylkHRngDpUO6Eo0l9UqmK2TbcwHSvmdzSIdq
 8lpBsW3LIAzLnS9/lpjvbuepoMDAj1jRGvX2twIB172UT2z1b0FdwMXW2zw4q/ykCV
 QH0qbBpDSO+kDk6Nfy2KrHxMmTeVcqviduLNqrp8=
Date: Tue, 11 Feb 2020 19:55:43 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v7 2/8] fs: Add standard casefolding support
Message-ID: <20200212035543.GD870@sol.localdomain>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200208013552.241832-3-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_195546_374501_3391B0B3 
X-CRM114-Status: GOOD (  18.22  )
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Chao Yu <chao@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 07, 2020 at 05:35:46PM -0800, Daniel Rosenberg wrote:
> This adds general supporting functions for filesystems that use
> utf8 casefolding. It provides standard dentry_operations and adds the
> necessary structures in struct super_block to allow this standardization.
> 
> Ext4 and F2fs are switch to these implementations.

I think you mean that ext4 and f2fs *will be switched* to these implementations?
It's later in the series, not in this patch.

> +#ifdef CONFIG_UNICODE
> +bool needs_casefold(const struct inode *dir)
> +{
> +	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding &&
> +			(!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir));
> +}
> +EXPORT_SYMBOL(needs_casefold);

Can you add kerneldoc comments to all the new functions that are exported to
modules?

> +struct hash_ctx {
> +	struct utf8_itr_context ctx;
> +	unsigned long hash;
> +};
> +
> +static int do_generic_ci_hash(struct utf8_itr_context *ctx, int byte, int pos)
> +{
> +	struct hash_ctx *hctx = container_of(ctx, struct hash_ctx, ctx);
> +
> +	hctx->hash = partial_name_hash((unsigned char)byte, hctx->hash);
> +	return 0;
> +}
> +
> +int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
> +{
> +	const struct inode *inode = READ_ONCE(dentry->d_inode);
> +	struct super_block *sb = dentry->d_sb;
> +	const struct unicode_map *um = sb->s_encoding;
> +	int ret = 0;
> +	struct hash_ctx hctx;
> +
> +	if (!inode || !needs_casefold(inode))
> +		return 0;
> +
> +	hctx.hash = init_name_hash(dentry);
> +	hctx.ctx.actor = do_generic_ci_hash;
> +	ret = utf8_casefold_iter(um, str, &hctx.ctx);
> +	if (ret < 0)
> +		goto err;
> +	str->hash = end_name_hash(hctx.hash);
> +
> +	return 0;
> +err:
> +	if (sb_has_enc_strict_mode(sb))
> +		ret = -EINVAL;
> +	return ret;
> +}
> +EXPORT_SYMBOL(generic_ci_d_hash);
> +#endif

This breaks the !strict_mode case by starting to fail lookups of names that
aren't valid Unicode, instead of falling back to the standard case-sensitive
behavior.

There is an xfstest for casefolding; is this bug not caught by it (in which case
the test needs to be improved)?  Or did you just not run it?

> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 6eae91c0668f9..a260afbc06d22 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1382,6 +1382,12 @@ extern int send_sigurg(struct fown_struct *fown);
>  #define SB_ACTIVE	(1<<30)
>  #define SB_NOUSER	(1<<31)
>  
> +/* These flags relate to encoding and casefolding */
> +#define SB_ENC_STRICT_MODE_FL	(1 << 0)

It would be helpful if the comment mentioned that these flags are stored on-disk
(and therefore can't be re-numbered, unlike the other flags defined nearby).

> +#ifdef CONFIG_UNICODE
> +	struct unicode_map *s_encoding;
> +	__u16 s_encoding_flags;
>  #endif

This isn't a UAPI header, so 's_encoding_flags' should use u16, not __u16.

And for that matter, 's_encoding_flags' will be pointer-sized due to padding
anyway, so maybe just make it 'unsigned int'?

> +static inline bool needs_casefold(const struct inode *dir)
> +{
> +	return 0;
> +}
> +#endif

Use false instead of 0 for 'bool'.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
