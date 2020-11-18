Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438B5C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 18:34:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 888C22076E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 18:34:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lcEK+VaF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyK8uf67"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 888C22076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2HapZyGkAfZGTrACAjsdXLvuV5NcsNZCp0b9emqF/O0=; b=lcEK+VaFRdzPTZjktwASdf1xG
	bQT9WxdGszdph/ZGqLlQNLvaE5TuEMjjatblkrh4+nRhVTVBNWAdUSDPJAQKCi/S0UPmUtjcYwlmX
	KbvIZw6tYd1AILHtMuYYLuZEBdC67KytrqaTw10uswczT1RAtXn5Np5hBKvLOh9hm5PImVwzMA94g
	bJgNEALxKTpgQXR6bZnYqhM4hxddnCy2TodEUEry3k80YW6n/k2PHbSWaPDXStrQmDksyIt0k+/Xy
	XjQLykMF7VjHV1eT3JDhi5vM1a01bGEmuTm4VXLoUTD/tZ5RQgcWbtBplEYBGfXOIclV7tC96AGxT
	1VgvC43Vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfSGe-0001dt-5U; Wed, 18 Nov 2020 18:33:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfSGb-0001dP-Qp
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 18:33:18 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8D642076E;
 Wed, 18 Nov 2020 18:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605724396;
 bh=BjKcTAHgEEjZHw2S0jY4URW2XCqx1wgwKoGTacZch84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XyK8uf67iCtixRi8uO42elgp56Fhal5a2BOHB2UID2/arUXXL4CgZvP/zwwngPCR4
 oax/yC6Ha8U7UeA8AqYXGwDwVtZ/1eB4iJAEggskLBm0MPSR19hvxrH+/yac5zj1Vj
 Y2tg5TgPUUqJ1UCa4zmzEcGhGHFRUWGPfqfNeEXI=
Date: Wed, 18 Nov 2020 10:33:14 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v3 2/3] fscrypt: Have filesystems handle their d_ops
Message-ID: <X7Vo6mikGB8ile7C@sol.localdomain>
References: <20201118064245.265117-1-drosen@google.com>
 <20201118064245.265117-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118064245.265117-3-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_133317_961288_DAB889C4 
X-CRM114-Status: GOOD (  12.94  )
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

On Wed, Nov 18, 2020 at 06:42:44AM +0000, Daniel Rosenberg wrote:
> diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
> index 1fbe6c24d705..cb3cfa6329ba 100644
> --- a/fs/crypto/fname.c
> +++ b/fs/crypto/fname.c
> @@ -570,7 +570,3 @@ int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
>  	return valid;
>  }
>  EXPORT_SYMBOL_GPL(fscrypt_d_revalidate);
> -
> -const struct dentry_operations fscrypt_d_ops = {
> -	.d_revalidate = fscrypt_d_revalidate,
> -};

The declaration of fscrypt_d_ops in fs/crypto/fscrypt_private.h should be
removed too.

Otherwise this patch looks good; feel free to add:

	Acked-by: Eric Biggers <ebiggers@google.com>

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
