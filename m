Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EDBC63798
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 18:22:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACB4822210
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 18:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="thXkS1pw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIyHtChu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACB4822210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pOR8kqtnsCSqvXXOl9DpxjqmPEGsPpoYvzN1KFD8CZA=; b=thXkS1pwCWBOYaXsnt8taGzcJ
	Psj+zxjCJEYET3t+1UkiG2Pdae5ggyFLA8+u2SSbRp+6LDmscC94Rn2btDM1GB+JyqmzfyMpfq3tL
	nSYRsR9BlBDiIJc6qTP1kj+wVqxs1YAmsJE00kGK3CCZb7tdr/tKVj95Ly6B+tY76m2+zguu7ntZk
	vaDn/RbiY8JfNRyCoBm2u8xGBX3OOkU8M4g9H3lAZzSSXrcg/lWBnyS8Fw2kXPbOt4kksOuK0ZZQP
	b64Dkl7jV4I7OOVd0XIdnZdd8L3pyD0QtI0G4F6ATp1u1ayC1ARTwJkJH+xebHjWUEJgfcY7arxqh
	ZWEBsSIqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf5ax-00044A-KA; Tue, 17 Nov 2020 18:20:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf5XA-0002Ky-ER
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 18:16:54 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8B352222E;
 Tue, 17 Nov 2020 18:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605637011;
 bh=LYmQa3sjmY4vGoc9PzmWfJg6D+u8panQLU6mw2v2bU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BIyHtChuKC/1Z2hfN01FJL2lQedY2Jopd9Xk6ljOb8WSU5039BmyYLu1lS/JerWeZ
 P+zilHNPhlrTLNiM1v44Y5EagbQsJhPY2JHB3h9CWIqeujkTkuhcWx5hjeDSPcyMf4
 ccWF5nBSvvcF0BXkSIJq0FUknVkLg8jyR9SxjF2Y=
Date: Tue, 17 Nov 2020 10:16:49 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v2 1/3] libfs: Add generic function for setting dentry_ops
Message-ID: <X7QTkSyiMojM6T10@sol.localdomain>
References: <20201117040315.28548-1-drosen@google.com>
 <20201117040315.28548-2-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117040315.28548-2-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_131652_724628_80171320 
X-CRM114-Status: GOOD (  26.92  )
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
Cc: kernel-team@android.com, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 04:03:13AM +0000, Daniel Rosenberg wrote:
> 
> Currently the casefolding dentry operation are always set if the
> filesystem defines an encoding because the features is toggleable on
> empty directories. Since we don't know what set of functions we'll
> eventually need, and cannot change them later, we add just add them.

This isn't a very useful explanation, since encryption can be toggled on empty
directories too (at least from off to on --- not the other way).  Why is
casefolding different?

> +static const struct dentry_operations generic_ci_dentry_ops = {
> +	.d_hash = generic_ci_d_hash,
> +	.d_compare = generic_ci_d_compare,
> +};
>  #endif
> +
> +#ifdef CONFIG_FS_ENCRYPTION
> +static const struct dentry_operations generic_encrypted_dentry_ops = {
> +	.d_revalidate = fscrypt_d_revalidate,
> +};
> +#endif
> +
> +#if IS_ENABLED(CONFIG_UNICODE) && IS_ENABLED(CONFIG_FS_ENCRYPTION)
> +static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
> +	.d_hash = generic_ci_d_hash,
> +	.d_compare = generic_ci_d_compare,
> +	.d_revalidate = fscrypt_d_revalidate,
> +};
> +#endif
> +
> +/**
> + * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
> + * @dentry:	dentry to set ops on
> + *
> + * This function sets the dentry ops for the given dentry to handle both
> + * casefolded and encrypted dentry names.
> + *
> + * Encryption requires d_revalidate to remove nokey names once the key is present.
> + * Casefolding is toggleable on an empty directory. Since we can't change the
> + * operations later on, we just add the casefolding ops if the filesystem defines an
> + * encoding.
> + */

There are some overly long lines here (> 80 columns).

But more importantly this still isn't a good explanation.  Encryption can also
be enabled on empty directories; what makes casefolding different?

It's also not obvious why so many different copies of the dentry operations
needed, instead of just using generic_encrypted_ci_dentry_ops on all.

If I'm still struggling to understand this after following these patches for a
long time, I expect everyone else will have trouble too...

Here's a suggestion which I think explains it a lot better.  It's still possible
I'm misunderstanding something, though, so please check it carefully:

/**
 * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
 * @dentry:	dentry to set ops on
 *
 * Casefolded directories need d_hash and d_compare set, so that the dentries
 * contained in them are handled case-insensitively.  Note that these operations
 * are needed on the parent directory rather than on the dentries in it, and the
 * casefolding flag can be enabled on an empty directory later but the
 * dentry_operations can't be changed later.  As a result, if the filesystem has
 * casefolding support enabled at all, we have to give all dentries the
 * casefolding operations even if their inode doesn't have the casefolding flag
 * currently (and thus the casefolding ops would be no-ops for now).
 *
 * Encryption works differently in that the only dentry operation it needs is
 * d_revalidate, which it only needs on dentries that have the no-key name flag.
 * The no-key flag can't be set "later", so we don't have to worry about that.
 *
 * Finally, to maximize compatibility with overlayfs (which isn't compatible
 * with certain dentry operations) and to avoid taking an unnecessary
 * performance hit, we use custom dentry_operations for each possible
 * combination rather always installing all operations.
 */

> +void generic_set_encrypted_ci_d_ops(struct dentry *dentry)
> +{
> +#ifdef CONFIG_FS_ENCRYPTION
> +	bool needs_encrypt_ops = dentry->d_flags & DCACHE_NOKEY_NAME;
> +#endif
> +#ifdef CONFIG_UNICODE
> +	bool needs_ci_ops = dentry->d_sb->s_encoding;
> +#endif
> +#if defined(CONFIG_FS_ENCRYPTION) && defined(CONFIG_UNICODE)
> +	if (needs_encrypt_ops && needs_ci_ops) {
> +		d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
> +			return;
> +	}

The return statement above has the wrong indentation level.

> +#endif
> +#ifdef CONFIG_FS_ENCRYPTION
> +	if (needs_encrypt_ops) {
> +		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
> +		return;
> +	}
> +#endif
> +#ifdef CONFIG_UNICODE
> +	if (needs_ci_ops) {
> +		d_set_d_op(dentry, &generic_ci_dentry_ops);
> +		return;
> +	}
> +#endif
> +}
> +EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 8667d0cdc71e..11345e66353b 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -3202,6 +3202,7 @@ extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
>  extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
>  				const char *str, const struct qstr *name);
>  #endif
> +extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
>  
>  #ifdef CONFIG_MIGRATION
>  extern int buffer_migrate_page(struct address_space *,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
