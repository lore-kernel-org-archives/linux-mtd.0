Return-Path: <SRS0=UdE+=DA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B104C4363D
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 06:00:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0843F23444
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 06:00:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Gq2ka/3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ma7PADmZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0843F23444
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3ROUJc32+wD4pcAcSmfPYP6IfsuPO0vXaPEMCLryyFA=; b=0Gq2ka/3A9+VF4ZOcfMTiZjyz
	sgE5kh4c78Bl/D+kk8pSt/wh9i06WxBNMtB1OnBxxnQlxL7gDnnJ+jnQa5mhCmO7HYcOnfxYp6kWp
	LkFB0S20CccrAtfySeJUz9cfWJLfxuppOBEjlcEfnpptR4a8VZTYQ0Ohj20ZAh5ArSpl7aZar+rr/
	1u8MjK9VdTAUx1aCLVn+7xLbMWxzB/On0dlD/GPDVNR+m9/zbjRTCospHdHPYtaLO/0QuYldRaD95
	1Z6lV3K2uNOq97dh46tu3+x5nCMGYOS310pLP+G0vl9aHN00ouXOUBDUMGvoGPWubsAwNXHPnz4dj
	uuGYinUnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKxop-0000sT-Rp; Wed, 23 Sep 2020 05:59:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKxoo-0000rv-5f
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2020 05:59:55 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73F0123444;
 Wed, 23 Sep 2020 05:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600840792;
 bh=I/8XzISzbBcCgYVmxLepZyG9w1CITHS3v+J9bySyNa0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ma7PADmZA95LLBo9KrXphWNWVsOVp+R73XlXBBcLHitEY4X5VwCFJSVq7vuCYgC3V
 HIT9jQdNXpRYH0Rkj3vSz4V7G9BGteBdDqsxV/pAjN1mmz6khsLf9uFQEZlx+JA+bt
 9uHpKQjziJ+IY+pVDK+nuHCnTz8A3CoT7WQ/HOGU=
Date: Tue, 22 Sep 2020 22:59:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH 2/5] fscrypt: Export fscrypt_d_revalidate
Message-ID: <20200923055950.GC9538@sol.localdomain>
References: <20200923010151.69506-1-drosen@google.com>
 <20200923010151.69506-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923010151.69506-3-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_015954_280094_A737991B 
X-CRM114-Status: GOOD (  20.81  )
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

On Wed, Sep 23, 2020 at 01:01:48AM +0000, Daniel Rosenberg wrote:
> This is in preparation for shifting the responsibility of setting the
> dentry_operations to the filesystem, allowing it to maintain its own
> operations.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/crypto/fname.c       | 3 ++-
>  include/linux/fscrypt.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
> index 011830f84d8d..d45db23ff6c4 100644
> --- a/fs/crypto/fname.c
> +++ b/fs/crypto/fname.c
> @@ -541,7 +541,7 @@ EXPORT_SYMBOL_GPL(fscrypt_fname_siphash);
>   * Validate dentries in encrypted directories to make sure we aren't potentially
>   * caching stale dentries after a key has been added.
>   */
> -static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
> +int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
>  {
>  	struct dentry *dir;
>  	int err;
> @@ -580,6 +580,7 @@ static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
>  
>  	return valid;
>  }
> +EXPORT_SYMBOL_GPL(fscrypt_d_revalidate);
>  
>  const struct dentry_operations fscrypt_d_ops = {
>  	.d_revalidate = fscrypt_d_revalidate,
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index 991ff8575d0e..265b1e9119dc 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -207,6 +207,7 @@ int fscrypt_fname_disk_to_usr(const struct inode *inode,
>  bool fscrypt_match_name(const struct fscrypt_name *fname,
>  			const u8 *de_name, u32 de_name_len);
>  u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name);
> +extern int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);

Please don't use 'extern' here.

Also FYI, Jeff Layton has sent this same patch as part of the ceph support for
fscrypt: https://lkml.kernel.org/linux-fscrypt/20200914191707.380444-4-jlayton@kernel.org

I'd like to apply one of them for 5.10 to get it out of the way for both
patchsets, but I'd like for the commit message to mention both users.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
