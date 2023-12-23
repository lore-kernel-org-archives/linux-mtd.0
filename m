Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13F1C3DA6E
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Dec 2023 15:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=32MS8smXpUnNIQZWwTb8NAz234+3i0tPjm3KeSsgcD8=; b=fFCToF/Tai+UxO
	KDqUQHdra4uSBqkD8t17B2KQX0QAVuzgAIDnd+AS64o1SaXMkAojmmBiNdousdsidmUD0bA0JwCzf
	uwb5FFkqX7ZoLiwVaZmIXZ6q1WEAHcsQPkbpTEAKzUoZjbeBpPEDLlo9edGucpKl8j3PZxSPV0bDV
	h86R86AkVIOexeD6Dl0pL5r7QKll5KuVTzAkCiCRUhwjR20EY0m73iBIF4cMEFPBHIQwlFHyatn5A
	jV5tMNkuO8GCJ8MElyQ1P/dQxhKjAU3X71kixcwiqoaPJNBv92ModXTZObCZu7QkqSxFMVhtoLTby
	sUazbX71cKWtMwRTbuTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rH43L-0087FG-01;
	Sat, 23 Dec 2023 15:36:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rH43G-0087Ep-0H
	for linux-mtd@lists.infradead.org;
	Sat, 23 Dec 2023 15:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 696DECE01DD;
	Sat, 23 Dec 2023 15:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDA3C433C7;
	Sat, 23 Dec 2023 15:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703345790;
	bh=Ho1EszqwI0wE1B1/PMEe80cbefmCuK5iTTKpuBzHd0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NsOv68yv+cb3ou8kcwnUxC8c0MA2UhlsYmJxQdQa7xEJLYP/aTWReGaXvlfYHyTFA
	 GMbpoTp5Hdmv2X43KDuzCFFeYpgaX7VocsElUwZwdD355df38wsWpAQtQBbJdjrt7+
	 T4fXwNWYOnNkAEhc1hhTRBvQycFlvHS09VDi8DCSpeyB8aQbnH/X4o/QKxeWoh7d86
	 1R+5AKjE7RrCj7hrK0VELBSv9MnLWVffjmEmZjxlbAZeeSyT/K/ZzJrN/yboOpsvhz
	 +0+ktFxWt/iz1PH2fCvs+iWjL8zmDpj/Jf5vmGkzZ50LY0JDNLky6GepnoxRV46Tu4
	 o1uDUr2dFeMSw==
Date: Sat, 23 Dec 2023 09:36:25 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: richard@nod.at, terrelln@fb.com, linux-fscrypt@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/2] ubifs: ubifs_symlink: Fix memleak of
 inode->i_link in error path
Message-ID: <20231223153625.GC901@quark.localdomain>
References: <20231222085446.781838-1-chengzhihao1@huawei.com>
 <20231222085446.781838-3-chengzhihao1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222085446.781838-3-chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231223_073634_380590_EB52AC42 
X-CRM114-Status: GOOD (  16.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Dec 22, 2023 at 04:54:46PM +0800, Zhihao Cheng wrote:
> For error handling path in ubifs_symlink(), inode will be marked as
> bad first, then iput() is invoked. If inode->i_link is initialized by
> fscrypt_encrypt_symlink() in encryption scenario, inode->i_link won't
> be freed by callchain ubifs_free_inode -> fscrypt_free_inode in error
> handling path, because make_bad_inode() has changed 'inode->i_mode' as
> 'S_IFREG'.
> Following kmemleak is easy to be reproduced by injecting error in
> ubifs_jnl_update() when doing symlink in encryption scenario:
>  unreferenced object 0xffff888103da3d98 (size 8):
>   comm "ln", pid 1692, jiffies 4294914701 (age 12.045s)
>   backtrace:
>    kmemdup+0x32/0x70
>    __fscrypt_encrypt_symlink+0xed/0x1c0
>    ubifs_symlink+0x210/0x300 [ubifs]
>    vfs_symlink+0x216/0x360
>    do_symlinkat+0x11a/0x190
>    do_syscall_64+0x3b/0xe0
> There are two ways fixing it:
>  1. Remove make_bad_inode() in error handling path. We can do that
>     because ubifs_evict_inode() will do same processes for good
>     symlink inode and bad symlink inode, for inode->i_nlink checking
>     is before is_bad_inode().
>  2. Free inode->i_link before marking inode bad.
> Method 2 is picked, it has less influence, personally, I think.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2c58d548f570 ("fscrypt: cache decrypted symlink target in ->i_link")
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> Suggested-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  fs/ubifs/dir.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 3b13c648d490..e413a9cf8ee3 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -1234,6 +1234,8 @@ static int ubifs_symlink(struct mnt_idmap *idmap, struct inode *dir,
>  	dir_ui->ui_size = dir->i_size;
>  	mutex_unlock(&dir_ui->ui_mutex);
>  out_inode:
> +	/* Free inode->i_link before inode is marked as bad. */
> +	fscrypt_free_inode(inode);
>  	make_bad_inode(inode);
>  	iput(inode);
>  out_fname:

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
