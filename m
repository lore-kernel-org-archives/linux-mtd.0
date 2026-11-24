Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F67606A323
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 23:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yC5qO68g;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W3y88tmj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QevumYSfL+aRhJ/NCI5C850NpJLqwLrYgrfZA4HfZms=; b=yC5qO68gxK+1hmHSc0BV9+ju1n
	sV1fQHmpdf48MZQTtmF80DC7irF7cJUaHAcbqABM5OyjE1r2Ytxv873rKYFGCetG2WW8px4hqOpNo
	Pd1qHAxgqa51JbOjT7VUEYlh6GWaT8Vf9MVgxmC7rdN7Mmn3CJhBe4VRbQvE2Ya3AxbXhL2cO8Ogv
	fKk31DTb3RCcCGe9cemVyfGnhGH4nX6JSq+PsFT6cl3efKtfC9S60G7KtlQ0tVutMZp4smQJXQgJz
	ISydXwPlQ/Rd92cU8PuNLkyY4hq9CY00KhCy8hREgM7+ZblvLyL/Kz0zehdE+0W4DXbdrIdypQLJm
	dXetjhSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzg8-000000083WG-1E6n;
	Tue, 24 Nov 2026 23:12:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzg6-000000083WA-0aCo
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 23:11:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 87ED843EA2;
	Tue, 24 Nov 2026 23:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03D61F000C6;
	Tue, 24 Nov 2026 23:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795561917;
	bh=QXxayGQ5zDJmW5qRYFz3W+oneeyzIOwcisMq8eZ3yFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W3y88tmj+TqN3sWdK2x05TghZqa+qDv9MXmU3/QPFA2AT98lD6/qJZ3933xeNZZUL
	 mFbgAjZxP3YQfFNGN/E6aq6xHvwq3926/J7i7Ox/gvjyfKu/Jlr/F+6FE6JUy3P4Is
	 6MdPs7dA0CFFOn8AwQK+1AsBSZLa2HZ0FGDt6VcRVLyFogg1MgzTckmIzazFX4Qe7P
	 iFc01fx5AJywo5WpZQFnkHf0EnpzryblgxonC0zrk1gaPk9SkFDRC8a32P1yoFcKpj
	 7HJT1DGrf8SZho5WvdsGUF3oCPgBlo4X/7mshT91A9EhlmNM3yivKhK6IJrlXuYV1U
	 dUiEIUxoIk7dg==
Date: Tue, 24 Nov 2026 15:11:55 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Thorsten Blum <blum@kernel.org>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	"Theodore Y. Ts'o" <tytso@mit.edu>, linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, linux-fscrypt@vger.kernel.org
Subject: Re: [PATCH 0/4] fscrypt: Add FSTR() helper macro and convert
 initializers
Message-ID: <20261124231155.GB2001@quark>
References: <20261118002845.574426-6-blum@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118002845.574426-6-blum@kernel.org>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 01:28:46AM +0100, Thorsten Blum wrote:
> Similar to QSTR(), add FSTR() to initialize struct fscrypt_str from a
> NUL-terminated string without specifying its length.
> 
> Use the helper for 8 initializers in btrfs, F2FS, and UBIFS, replacing
> hard-coded lengths and explicit strlen() calls.
> 
> Thorsten Blum (4):
>   fscrypt: Add FSTR() helper macro
>   btrfs: Use FSTR() for the "default" name
>   f2fs: Use FSTR() in f2fs_do_make_empty_dir()
>   ubifs: Use FSTR() in ubifs_xattr_{set,get,remove}()
> 
>  fs/btrfs/inode.c        | 3 +--
>  fs/btrfs/ioctl.c        | 3 +--
>  fs/btrfs/super.c        | 3 +--
>  fs/f2fs/dir.c           | 7 ++-----
>  fs/ubifs/xattr.c        | 6 +++---
>  include/linux/fscrypt.h | 1 +
>  6 files changed, 9 insertions(+), 14 deletions(-)

Applied to https://git.kernel.org/pub/scm/fs/fscrypt/linux.git/log/?h=for-next

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
