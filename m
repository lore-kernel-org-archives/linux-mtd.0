Return-Path: <SRS0=7p5O=AF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE23C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 05:58:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A4CD2085B
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 05:58:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D4io2Pf0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbxsf9ik"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A4CD2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hblo8S7gfHcgdDvCLruj5ussyOGLUi6Wo2QIQAwJQh8=; b=D4io2Pf0Q5SWiVVXv0vV8u7TG
	kEtk37sf7rYjO+mIfO7Skrl+w4mludZW9OZkjt3cZj/iZ4BCm/rpua6Hl2U4hB7HIjV1GX5IhVcy3
	ZlgJKOPXfI4joiHafveiqPqFKBLQ0KQyXNm/OMHC02kQU11boRii+KzRh+RG2ZMQ9uZQ5BKTFmdlT
	K89yXou66Ywc2nABp4jpJ9WLdR4Sz5bO0UByxE3s5o17A5gcZm7MaW6u/iH9ZPbRSskmhj1VTGxL5
	fFv9O194dciMrWK8GcW6VzRURZuZM7MJ9v78xofPwT0qacxPvhISap5yBsEdnhM7eM2jjFfG1hqAQ
	bCVjYlJPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnyPJ-0006Hn-Hn; Wed, 24 Jun 2020 05:57:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnyPG-0006Gy-TG
 for linux-mtd@lists.infradead.org; Wed, 24 Jun 2020 05:57:11 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DCC22085B;
 Wed, 24 Jun 2020 05:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592978229;
 bh=2lsFqyU8P0hr8E82YY+KRZpjYFvt+d061bicFKiQlRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lbxsf9ik4Ybnb1VNbbAkDP+AkNKZAjMqErfEG+Qv5FJjpqdXBrE0v20o6fKaxGDjU
 6IbwyTMIIAryhYBDmhFPRgTRIvcrOwKn8x8VQtZkIfd6G07QWTXk8aEvAPsrzSaFLQ
 hTu4hRjCUpgjrPNmucpIRCRbHtnLrLbiJjgdLxRY=
Date: Tue, 23 Jun 2020 22:57:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v9 2/4] fs: Add standard casefolding support
Message-ID: <20200624055707.GG844@sol.localdomain>
References: <20200624043341.33364-1-drosen@google.com>
 <20200624043341.33364-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624043341.33364-3-drosen@google.com>
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

On Tue, Jun 23, 2020 at 09:33:39PM -0700, Daniel Rosenberg wrote:
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

Note that the '!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir)' check can
be racy, because a process can be looking up a no-key token in a directory while
concurrently another process initializes the directory's ->i_crypt_info, causing
fscrypt_has_encryption_key(dir) to suddenly start returning true.

In my rework of filename handling in f2fs, I actually ended up removing all
calls to needs_casefold(), thus avoiding this race.  f2fs now decides whether
the name is going to need casefolding early on, in __f2fs_setup_filename(),
where it knows in a race-free way whether the filename is a no-key token or not.

Perhaps ext4 should work the same way?  It did look like there would be some
extra complexity due to how the ext4 directory hashing works in comparison to
f2fs's, but I haven't had a chance to properly investigate it.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
