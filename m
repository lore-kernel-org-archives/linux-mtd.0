Return-Path: <SRS0=A5yI=4Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C06C10F00
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Mar 2020 05:24:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB53D206D5
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Mar 2020 05:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HhOi94kD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LuI8jDen"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB53D206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zll74h/dYUeBbiHxTSF86pNl0GwMwbYPX1w3U9pDV/M=; b=HhOi94kDVXVWlG
	hk0bo1mxEljl9oAn2BgnDRknNWHefgGQAWwX+m5KwXA+nWTsIGKRBJ59glRYPgogPE/zJKFsiJ+m1
	oc5mM7wdT4fWEqfzaXDJDoHHUvgFOwgP9VJlH1nCtufaSAXy6z40Gm/jY6S517LYhZ0ldxnKZuwo7
	UBGRH1g3LcHAPBQe/G+wt/pQzPOrQT/57YiWSRIi5JOP22VmG5i/DVUazu46V6i/1IqLjDAQYrofs
	0IfUPt6PcoUNl+V8xUCXqbr1pfZ/9vUbQBzg501vkY3lZVhaxafehIKyrVudQcI0DNHmgkW0sWlLh
	mDCTPEdvl2aD79eZV7eA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jARwr-0002S7-Fm; Sat, 07 Mar 2020 05:24:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jARwo-0002Rn-NK
 for linux-mtd@lists.infradead.org; Sat, 07 Mar 2020 05:24:28 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB0F0206D5;
 Sat,  7 Mar 2020 05:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583558666;
 bh=RX0pNoVLLIpZJez+whEJRUeQ38hXRUIlXOZTSFatJPY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LuI8jDenuD9MDJb74KTi0cYu7g+PgR49RKpNM1J4/DpdTFuMztsm5BcT7iCbZLRFR
 /xk7S67Q4yYrKb0E1hrPg3TXQNbpsfTzE7JQwl+jgOyWS8u1lVtbQtSln4IssFgpap
 4js7JvYIxcRaCBJVznAVegpJWiyX1eui7nOWa3w4=
Date: Fri, 6 Mar 2020 21:24:24 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v8 8/8] f2fs: Handle casefolding with Encryption
Message-ID: <20200307052424.GB1069@sol.localdomain>
References: <20200307023611.204708-1-drosen@google.com>
 <20200307023611.204708-9-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200307023611.204708-9-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_212426_816780_51D8C2C8 
X-CRM114-Status: GOOD (  12.43  )
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

On Fri, Mar 06, 2020 at 06:36:11PM -0800, Daniel Rosenberg wrote:
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
> @@ -632,7 +650,6 @@ int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
>  
>  	level = 0;
>  	slots = GET_DENTRY_SLOTS(new_name->len);
> -	dentry_hash = f2fs_dentry_hash(dir, new_name, NULL);
>  
>  	current_depth = F2FS_I(dir)->i_current_depth;
>  	if (F2FS_I(dir)->chash == dentry_hash) {
> @@ -718,17 +735,19 @@ int f2fs_add_dentry(struct inode *dir, struct fscrypt_name *fname,
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
> +	dentry_hash = f2fs_dentry_hash(dir, &new_name, fname);
>  	if (err == -EAGAIN)
>  		err = f2fs_add_regular_entry(dir, &new_name, fname->usr_fname,
> -							inode, ino, mode);
> +						dentry_hash, inode, ino, mode);
>  

Why are the changes to f2fs_add_dentry(), f2fs_add_regular_entry(), and
f2fs_add_inline_entry() being made?  Directories can't be modified through
no-key names, so there's no need to make this part of the code handle grabbing
the dentry hash from the struct fscrypt_name.  And both the on-disk and original
filenames were already passed to these functions.  So what else do we need?

> +static f2fs_hash_t __f2fs_dentry_hash(const struct inode *dir,
> +				const struct qstr *name_info,
> +				const struct fscrypt_name *fname)
>  {
>  	__u32 hash;
>  	f2fs_hash_t f2fs_hash;
> @@ -79,12 +80,17 @@ static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
>  	size_t len = name_info->len;
>  
>  	/* encrypted bigname case */
> -	if (fname && !fname->disk_name.name)
> +	if (fname && !fname->is_ciphertext_name)
>  		return cpu_to_le32(fname->hash);

Isn't this check backwards?  The hash is valid if fname->is_ciphertext_name, not
if !fname->is_ciphertext_name.

(Maybe the phrase "ciphertext name" is causing confusion, as we're now calling
them "no-key names" instead?  We could rename it, if that would help.)

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
