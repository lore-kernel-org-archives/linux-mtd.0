Return-Path: <SRS0=UdE+=DA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6777C2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 20:45:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82DCA20897
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 20:45:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eQuYAO5B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82DCA20897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bp9RNXy+kiuoH/YU/YofioUabyfzVJhJ2cefDQ5ot0g=; b=eQuYAO5BoIGTPQRNvJV3f6LB6
	CleLOAGVOc+hoJ6L6kC/OB11E4/G+Ca6iJr8rRGKRlrFr7Jp7ACFGilQWYv5LlP0MLVePdipaYVFI
	IO/Q2mPnktc44FYKXkAoc0xYbLi6RuVgZI8GxAyYRAzW6mhdmjAArZNCjRO+OuG3EfS7SpM2iBLfi
	QgJfFuuvKNBqsNQ0bn0n9/i1AZOQFUOWx1u0Hos7WwDpyroTBjwE59P6QIpN02uNThC48Dw1Qx/8L
	83juXJqcLSw7JdIgWCZ4M2fOi78Zd4jPBR76vuUP5wyKpdmp7xA6GkXLPxoP3EdNdP55QZvmOtBja
	7EjoduROg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLBcx-0007lR-G7; Wed, 23 Sep 2020 20:44:35 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLBcv-0007kw-Ch
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2020 20:44:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 0338129C28A
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH 3/5] libfs: Add generic function for setting dentry_ops
Organization: Collabora
References: <20200923010151.69506-1-drosen@google.com>
 <20200923010151.69506-4-drosen@google.com>
Date: Wed, 23 Sep 2020 16:44:28 -0400
In-Reply-To: <20200923010151.69506-4-drosen@google.com> (Daniel Rosenberg's
 message of "Wed, 23 Sep 2020 01:01:49 +0000")
Message-ID: <87ft785ikz.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_164433_517437_51377920 
X-CRM114-Status: GOOD (  23.66  )
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Chao Yu <chao@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Daniel Rosenberg <drosen@google.com> writes:

> This adds a function to set dentry operations at lookup time that will
> work for both encrypted files and casefolded filenames.
>
> A filesystem that supports both features simultaneously can use this
> function during lookup preperations to set up its dentry operations once
> fscrypt no longer does that itself.
>
> Currently the casefolding dentry operation are always set because the
> feature is toggleable on empty directories. Since we don't know what
> set of functions we'll eventually need, and cannot change them later,
> we add just add them.
>
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/libfs.c         | 49 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fs.h |  1 +
>  2 files changed, 50 insertions(+)
>
> diff --git a/fs/libfs.c b/fs/libfs.c
> index fc34361c1489..83303858f1fe 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1449,4 +1449,53 @@ int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
>  	return 0;
>  }
>  EXPORT_SYMBOL(generic_ci_d_hash);
> +
> +static const struct dentry_operations generic_ci_dentry_ops = {
> +	.d_hash = generic_ci_d_hash,
> +	.d_compare = generic_ci_d_compare,
> +};
> +#endif
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
> + * casefolding and encryption of the dentry name.
> + */
> +void generic_set_encrypted_ci_d_ops(struct dentry *dentry)
> +{
> +#ifdef CONFIG_FS_ENCRYPTION
> +	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME) {
> +#ifdef CONFIG_UNICODE
> +		if (dentry->d_sb->s_encoding) {
> +			d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
> +			return;
> +		}
>  #endif
> +		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
> +		return;
> +	}
> +#endif
> +#ifdef CONFIG_UNICODE
> +	if (dentry->d_sb->s_encoding) {
> +		d_set_d_op(dentry, &generic_ci_dentry_ops);
> +		return;
> +	}
> +#endif
> +}

I think this is harder to read than necessary.  What do you think about
just splitting the three cases like the following:

void generic_set_encrypted_ci_d_ops(struct dentry *dentry) {

#if defined(CONFIG_FS_ENCRYPTION) && defined(CONFIG_UNICODE)
    if (encoding && encryption) {
    	d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
            return;
    }
#endif

#if defined (CONFIG_FS_ENCRYPTION)
    if (encryption) {
    	d_set_d_op(dentry, &generic_encrypted_dentry_ops);
        return;
    }
#endif

#if defined (CONFIG_UNICODE)
    if (encoding) {
    	d_set_d_op(dentry, &generic_ci_dentry_ops);
        return;
    }
#endif
}

> +EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index bc5417c61e12..6627896db835 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -3277,6 +3277,7 @@ extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
>  extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
>  				const char *str, const struct qstr *name);
>  #endif
> +extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
>  
>  #ifdef CONFIG_MIGRATION
>  extern int buffer_migrate_page(struct address_space *,

-- 
Gabriel Krisman Bertazi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
