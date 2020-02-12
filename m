Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5088FC2BA83
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 05:47:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20F6120714
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 05:47:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AEjrQoRl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="16O0AgpG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20F6120714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHUNWGaOIJAnP4QicroLiYFG28K6spZpkGIDlY2sqI4=; b=AEjrQoRl6PrvkH
	QhvUQZXW3KV9RmYYf3LUHD5FGAC/Rrvkm1Ka02OBuGdjk+9z+9vX+4fjB2GXmzEjL1VRjerK8WnbT
	T4WweJOzHhc9rrWdRZ5UMYgaA/XO7/iVURPGy+jcwugCJ29luW/Aq2PxuNY/orUyel5Vxyh4GwacL
	wBkewbxt5wn8Q5Dw+C+2m8hYjIgaoRqsZnUiF4UKk6OQ/mG3ywj6s7WcMBBm5eNFPrQ4Inp9Ti8HV
	z/I9kQH3mNhMGCWfciFPVRNH2j90K67EwMG+8+/0TP7e+Zh4LpHGdU2mLiy3QWZKsHuoPUa7qAs5H
	VI/zzZ++2K1gP9oLbyzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1kru-0001El-GB; Wed, 12 Feb 2020 05:47:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1krr-0001EJ-CC
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2020 05:47:24 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D15620714;
 Wed, 12 Feb 2020 05:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581486442;
 bh=vfQCzX8Gzst/DyzbbP8Yb9hEeqTup17d6ibCA2atEQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=16O0AgpGnIblG8wXcW2EbHRzkj93++0mtvCGjFsyUCV76OVBn3s08Rm0Tzv10tDKX
 lVogvBzynO1bch/RJ/BUyPtnWFQPHyHktHkoCQZmBDMm5mY+WEzsP8LNaRpna7Nlxp
 fGy1pIz8XmPZ5U7MkLYBItDm8Mu67V3uwnIqWsJk=
Date: Tue, 11 Feb 2020 21:47:20 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v7 6/8] f2fs: Handle casefolding with Encryption
Message-ID: <20200212054720.GH870@sol.localdomain>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-7-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200208013552.241832-7-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_214723_461654_B0775B82 
X-CRM114-Status: GOOD (  13.64  )
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

On Fri, Feb 07, 2020 at 05:35:50PM -0800, Daniel Rosenberg wrote:
> @@ -173,24 +193,24 @@ static inline bool f2fs_match_name(struct f2fs_dentry_ptr *d,
>  {
>  #ifdef CONFIG_UNICODE
>  	struct inode *parent = d->inode;
> -	struct super_block *sb = parent->i_sb;
> -	struct qstr entry;
> +	unsigned char *name;
> +	int len;
>  #endif
>  
>  	if (de->hash_code != namehash)
>  		return false;
>  
>  #ifdef CONFIG_UNICODE
> -	entry.name = d->filename[bit_pos];
> -	entry.len = de->name_len;
> +	name = d->filename[bit_pos];
> +	len = de->name_len;

This is missing le16_to_cpu().

>  int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
>  				const struct qstr *orig_name,
> +				f2fs_hash_t dentry_hash,
>  				struct inode *inode, nid_t ino, umode_t mode)
>  {
>  	unsigned int bit_pos;
>  	unsigned int level;
>  	unsigned int current_depth;
>  	unsigned long bidx, block;
> -	f2fs_hash_t dentry_hash;
>  	unsigned int nbucket, nblock;
>  	struct page *dentry_page = NULL;
>  	struct f2fs_dentry_block *dentry_blk = NULL;
> @@ -632,7 +652,6 @@ int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
>  
>  	level = 0;
>  	slots = GET_DENTRY_SLOTS(new_name->len);
> -	dentry_hash = f2fs_dentry_hash(dir, new_name, NULL);

Why was the call to f2fs_dentry_hash() moved to the caller, but for
f2fs_add_inline_entry() a different approach was taken?

> @@ -718,17 +737,19 @@ int f2fs_add_dentry(struct inode *dir, struct fscrypt_name *fname,
>  				struct inode *inode, nid_t ino, umode_t mode)
>  {
>  	struct qstr new_name;
> +	f2fs_hash_t dentry_hash;
>  	int err = -EAGAIN;
>  
>  	new_name.name = fname_name(fname);
>  	new_name.len = fname_len(fname);
>  
>  	if (f2fs_has_inline_dentry(dir))
> -		err = f2fs_add_inline_entry(dir, &new_name, fname->usr_fname,
> +		err = f2fs_add_inline_entry(dir, &new_name, fname,
>  							inode, ino, mode);

I'm really confused.  Why are you passing around both new_name and fname?
We already have new_name == fname.disk_name.  So isn't just the
'struct fscrypt_name' sufficient?

> +static f2fs_hash_t __f2fs_dentry_hash(const struct inode *dir,
> +				const struct qstr *name_info,
> +				const struct fscrypt_name *fname)
>  {
>  	__u32 hash;
>  	f2fs_hash_t f2fs_hash;
> @@ -85,6 +86,11 @@ static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
>  	if (is_dot_dotdot(name_info))
>  		return 0;
>  
> +	if (IS_CASEFOLDED(dir) && IS_ENCRYPTED(dir)) {
> +		f2fs_hash = fscrypt_fname_siphash(dir, name_info);
> +		return f2fs_hash;
> +	}

This is missing cpu_to_le32().

Also, above we have:

        /* encrypted bigname case */
        if (fname && !fname->disk_name.name)
                return cpu_to_le32(fname->hash);

That won't work with encrypted+casefolded directories without the key, because
now sometimes the hash from the no-key name is needed even when the disk_name is
available.  This will cause a crash in fscrypt_fname_siphash() being called
without the key.  I think you want:

        if (fname && fname->is_ciphertext_name)
                return cpu_to_le32(fname->hash);

Can you please write xfstests for encrypt+casefold?

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
