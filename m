Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE132C282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 14:24:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C01C20872
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 14:24:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HlApjCyt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C01C20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Y3+JZh2N97MWxMT7NJJ6zcegGTRxSN/Z47wGKFWMpw=; b=HlApjCytC+QsY4
	RaXv8kHgUylh96rb0CDhciS+hh6raOw2WRz9rsrkdTMw/IbLR+vlUCyOQLwE4T3OoJLFF5I5GF1Sh
	+GkEb/53BFb6KoZQ/U8RIDL9LIMEq8WzK+JRw2Lk/Hu3OG7ZRJy+7gEaFcLOt/djKDi66q+qeKa2H
	AMCG0z7i93yyRuXRcBRALH34ePSiRjB5oy8KQKyLR7c2zhsIk/yKV6LU7Drbi0vINrupj/wXkHKEW
	pG2alFlSjj/DEOvUjG2fTU0lCsRmnILsEC/1iBU23YW/ZFwxAzZx2rAzIJfh3KOpDOKDcOtTty67Y
	IwRfp8xePdl5Yl4r8A2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGlUd-0001Lg-Qz; Wed, 17 Apr 2019 14:24:55 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGlUX-0001Ga-4X
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 14:24:54 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-109.corp.google.com
 [104.133.0.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x3HEOawa011053
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Apr 2019 10:24:36 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id E7C39420497; Wed, 17 Apr 2019 10:24:35 -0400 (EDT)
Date: Wed, 17 Apr 2019 10:24:35 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 5/5] fscrypt: fix race where ->lookup() marks
 plaintext dentry as ciphertext
Message-ID: <20190417142435.GE4686@mit.edu>
References: <20190320183913.12686-1-ebiggers@kernel.org>
 <20190320183913.12686-6-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190320183913.12686-6-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_072449_648590_40FBFBA0 
X-CRM114-Status: GOOD (  13.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Gao Xiang <gaoxiang25@huawei.com>, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sarthak Kukreti <sarthakkukreti@chromium.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 20, 2019 at 11:39:13AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> ->lookup() in an encrypted directory begins as follows:
> 
> 1. fscrypt_prepare_lookup():
>     a. Try to load the directory's encryption key.
>     b. If the key is unavailable, mark the dentry as a ciphertext name
>        via d_flags.
> 2. fscrypt_setup_filename():
>     a. Try to load the directory's encryption key.
>     b. If the key is available, encrypt the name (treated as a plaintext
>        name) to get the on-disk name.  Otherwise decode the name
>        (treated as a ciphertext name) to get the on-disk name.
> 
> But if the key is concurrently added, it may be found at (2a) but not at
> (1a).  In this case, the dentry will be wrongly marked as a ciphertext
> name even though it was actually treated as plaintext.
> 
> This will cause the dentry to be wrongly invalidated on the next lookup,
> potentially causing problems.  For example, if the racy ->lookup() was
> part of sys_mount(), then the new mount will be detached when anything
> tries to access it.  This is despite the mountpoint having a plaintext
> path, which should remain valid now that the key was added.
> 
> Of course, this is only possible if there's a userspace race.  Still,
> the additional kernel-side race is confusing and unexpected.
> 
> Close the kernel-side race by changing fscrypt_prepare_lookup() to also
> set the on-disk filename (step 2b), consistent with the d_flags update.
> 
> Fixes: 28b4c263961c ("ext4 crypto: revalidate dentry after adding or removing the key")
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good, applied.

					- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
