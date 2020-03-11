Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C2DC10DCE
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 02:50:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4148320637
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 02:50:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JdobiTRN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1ystG14"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4148320637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ad3DO74jyqVyYX0sDIl3jZ7DjRfdvJqc/f+r0dw/QA=; b=JdobiTRN6op7fg
	yvJQCWwXeRiwo0DaKoL+EhF3kVwIk6DhxSCXOZ/RtjMwNLnicnqJXsnoYzN8WZQZ8kSviyjAA0X+E
	DbFrwrevCgW3/JLLuy2ujTmFM0JsFX8h9JVtJ55VFtaFXFhH2q4iU/UY8UbenO8ixqY/YfbHfpHDQ
	GLRh4j38raq2h+7WN0wAaavlOwWjD8LFo4Lsi6s/ufjJ/YP6uCxILDqG97YpYk/14LCz+sV5j4YbT
	K6OVqrMhNLCa2xTS0H0uEmV0NXhMSEDGfLro7Y1wZrJ05IerGi6zo3dElyo4ljdLsz+HVVQxXyIr8
	uVAfNkMDg30uYRt2qeNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBrRr-0001sZ-9W; Wed, 11 Mar 2020 02:50:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBrRo-0001ry-B0
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 02:50:18 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EEDF220637;
 Wed, 11 Mar 2020 02:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583895015;
 bh=WtFMlLzPcU5BhKbuP+2KrYUwWQYx4yq+ffF9gx1TB4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q1ystG146lhrdx1ECKnmJ+Gnq00mbVBlMiA9vl3KTF2QmR+GOfMmrR5MUFTybatwD
 ThRVdbuIcu+qHCl2Wz2aEBWCuC4NftqLMjxqT/L71EMNo6OcqflzJzuhbLoePIfyuA
 VrMxS7K+quWwG8SXU9sNgRZ+IAiV6J6SxXax9fNI=
Date: Tue, 10 Mar 2020 19:50:13 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: Re: [PATCH] fscrypt: don't evict dirty inodes after removing key
Message-ID: <20200311025013.GB46757@gmail.com>
References: <20200305084138.653498-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305084138.653498-1-ebiggers@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_195016_401517_25D49698 
X-CRM114-Status: GOOD (  20.15  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Mar 05, 2020 at 12:41:38AM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> After FS_IOC_REMOVE_ENCRYPTION_KEY removes a key, it syncs the
> filesystem and tries to get and put all inodes that were unlocked by the
> key so that unused inodes get evicted via fscrypt_drop_inode().
> Normally, the inodes are all clean due to the sync.
> 
> However, after the filesystem is sync'ed, userspace can modify and close
> one of the files.  (Userspace is *supposed* to close the files before
> removing the key.  But it doesn't always happen, and the kernel can't
> assume it.)  This causes the inode to be dirtied and have i_count == 0.
> Then, fscrypt_drop_inode() failed to consider this case and indicated
> that the inode can be dropped, causing the write to be lost.
> 
> On f2fs, other problems such as a filesystem freeze could occur due to
> the inode being freed while still on f2fs's dirty inode list.
> 
> Fix this bug by making fscrypt_drop_inode() only drop clean inodes.
> 
> I've written an xfstest which detects this bug on ext4, f2fs, and ubifs.
> 
> Fixes: b1c0ec3599f4 ("fscrypt: add FS_IOC_REMOVE_ENCRYPTION_KEY ioctl")
> Cc: <stable@vger.kernel.org> # v5.4+
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/crypto/keysetup.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
> index 65cb09fa6ead..08c9f216a54d 100644
> --- a/fs/crypto/keysetup.c
> +++ b/fs/crypto/keysetup.c
> @@ -538,6 +538,15 @@ int fscrypt_drop_inode(struct inode *inode)
>  		return 0;
>  	mk = ci->ci_master_key->payload.data[0];
>  
> +	/*
> +	 * With proper, non-racy use of FS_IOC_REMOVE_ENCRYPTION_KEY, all inodes
> +	 * protected by the key were cleaned by sync_filesystem().  But if
> +	 * userspace is still using the files, inodes can be dirtied between
> +	 * then and now.  We mustn't lose any writes, so skip dirty inodes here.
> +	 */
> +	if (inode->i_state & I_DIRTY_ALL)
> +		return 0;
> +
>  	/*
>  	 * Note: since we aren't holding ->mk_secret_sem, the result here can
>  	 * immediately become outdated.  But there's no correctness problem with
> -- 

Applied to fscrypt.git#for-stable for 5.6.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
