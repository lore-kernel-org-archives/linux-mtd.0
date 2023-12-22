Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3CEC41535
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Dec 2023 06:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7/7iUMJZ34CXvASOxvFQdie6Mm6oncvl6q8Ed6mGfY=; b=vJ4HKYwq/wvCXa
	skyctwRT8eZOosGQalsd8pcrp0hYq0W+iYOmwsV+oKxSTE8HuEwvirZO0jYcTNKDCFXKoXZbXYDKI
	z+wzDR9o2N+sjal+NJ10FOF5iBI0qrO1/9Cf7VbZC2j+RFINgU9pSSoLfGklCUBxGzFKZH5hV3xLB
	EpzKlGZYGKxTRUvWnaG6nDDWcRrgBA1WXDuPrTpadzBUI1RC9z8Ug9dvUDU+WgUkSsLc5wZzkYo3/
	46Oj0OkaTrmFpesoCRz/e7HyyV0ZK2nD+5SlJDw3NL0H7QdxZfagvsvykenH90AAhp2KgpKQyoZDf
	lf5aumcSHQdcY1WbmJsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGYw9-00546z-0a;
	Fri, 22 Dec 2023 06:23:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGYw6-00545X-1G
	for linux-mtd@lists.infradead.org;
	Fri, 22 Dec 2023 06:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 09338B82201;
	Fri, 22 Dec 2023 06:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74C9C433CB;
	Fri, 22 Dec 2023 06:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703226180;
	bh=/zizvjSiiPfXWF1a4DdpomnPmEmcl1/vKWWxE3HK9Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ty+f6nFCgO7EB3DwHUPSSnPEpZbZ1lQ6IQSOQSpWnT7XHSrb877stH1jB2DHTO8zS
	 JuIEnOjpIsz/gwS+IsW6H0jUIUG+xAbi8fI2C2ZLMbssUG7f3SDFlfXPHPG9psRwHm
	 zcCuRYfZASn7/Sx/j0MijC4Ajw2mQGD5E2OZsSNPFCQjBDbTPu2rkHQqL4hZQbfBnw
	 7WIeXHVDcgg3mxF/lU3uDVUw7cabKcj5DNibQUEasvf1nttMpUwgcbRALaah8E+BB9
	 yRb/U8AH6dbtBF+JY6zyuX/fFosUFPoh/kzsvnZ3poAOw//Dh7QN8gEhC3IiwvfM8V
	 1r/SEP9y1xUxg==
Date: Fri, 22 Dec 2023 00:22:56 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: richard@nod.at, terrelln@fb.com, ext-adrian.hunter@nokia.com,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] ubifs: ubifs_symlink: Fix memleak of inode->i_link
 in error path
Message-ID: <20231222062256.GA98205@quark.localdomain>
References: <20231222025025.2940450-1-chengzhihao1@huawei.com>
 <20231222025025.2940450-3-chengzhihao1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222025025.2940450-3-chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_222306_587218_A8640B4F 
X-CRM114-Status: GOOD (  18.88  )
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

On Fri, Dec 22, 2023 at 10:50:25AM +0800, Zhihao Cheng wrote:
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
> Fixes: 2c58d548f570 ("fscrypt: cache decrypted symlink target in ->i_link")
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> ---
>  fs/ubifs/dir.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 3b13c648d490..9baf029416d4 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -1234,6 +1234,9 @@ static int ubifs_symlink(struct mnt_idmap *idmap, struct inode *dir,
>  	dir_ui->ui_size = dir->i_size;
>  	mutex_unlock(&dir_ui->ui_mutex);
>  out_inode:
> +	/* Free inode->i_link before inode is marked as bad. */
> +	if (IS_ENCRYPTED(inode))
> +		fscrypt_free_inode(inode);
>  	make_bad_inode(inode);
>  	iput(inode);
>  out_fname:

fscrypt_free_inode() should be called unconditionally, because
fscrypt_free_inode() already checks for IS_ENCRYPTED().

Also, please add 'Cc: stable@vger.kernel.org' to your commit message.

Also, please add linux-fscrypt@vger.kernel.org to the recipients of this patch.

Anyway, thanks for catching this bug!  It's annoying that make_bad_inode()
changes the inode's type from a symlink to a regular file; normally an inode's
type can never change.  Your fix looks fine, though.  Thanks!

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
