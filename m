Return-Path: <SRS0=bI2a=OD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87268C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 09:42:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53FFE60F6C
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 09:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53FFE60F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6MWVrXBEIig0T/RHc9iYoRuKGtwANUqFdwCHasLw7p0=; b=pgmHRrPU8/rBLO
	U+XtI8iy36CMnE+YCX4TFRHgZtQENWY+m3aRxUk9OLA8copZHDSmWcjCYa2eVZdJLmuzBJBzBmM62
	nm1hjpvVr1PJrOlbeLwkoYbVMXsiJSq9Onm4Xz34wUNFuLqD04rFT7zCsZp6RUn2JBXEccpOT7cop
	o+H2VcsOxoGBaD8eV1spS5mEZpwH8P3qWJMp3RLPYXzk0HtGmqsKtKZYL4xVzNcATP2sg5RvcsZNy
	jtHroQvMYXgGZSvQP4sJ7vzpF2h1q2/zjBSPi5huzfrfL1mudbtKsKWeoNyVkYlaU8bI+3CcNDwqV
	wv2Kz4xTOaf3FLyXFooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPiSx-0016bj-5K; Mon, 13 Sep 2021 09:41:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPiLc-00159P-NR
 for linux-mtd@lists.infradead.org; Mon, 13 Sep 2021 09:33:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C880961004;
 Mon, 13 Sep 2021 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1631525636;
 bh=GY8EbtbGrgePZfSn3NDCuLNemetE1SRK37HKfuiJrzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lXfVZu5j0ppumZyeQdoQvH4+bjWZ2qTjg+7G2oYG4+8A6qFXQ1t9Ht1Wy00W3Dxli
 OeFQkayIypGECabAt0QI2dN2J3NHxXZiJ1A5dQ2xtWflk3NdrQdcbdCjSSMPLDLUXt
 qr+gz75pyugwlAj99JLG6U0f/kVMoJzmSk2BcAZU=
Date: Mon, 13 Sep 2021 11:33:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: stable@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/4] backport fscrypt symlink fixes to 4.19
Message-ID: <YT8bAlnKAYXMqFpe@kroah.com>
References: <20210908215033.1122580-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210908215033.1122580-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_023356_838300_F69A9B4A 
X-CRM114-Status: GOOD (  10.83  )
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

On Wed, Sep 08, 2021 at 02:50:29PM -0700, Eric Biggers wrote:
> This series backports some patches that failed to apply to 4.19-stable
> due to the prototype of inode_operations::getattr having changed in
> v5.12, as well as several other conflicts.  Please apply to 4.19-stable.
> 
> Eric Biggers (4):
>   fscrypt: add fscrypt_symlink_getattr() for computing st_size
>   ext4: report correct st_size for encrypted symlinks
>   f2fs: report correct st_size for encrypted symlinks
>   ubifs: report correct st_size for encrypted symlinks
> 
>  fs/crypto/hooks.c               | 44 +++++++++++++++++++++++++++++++++
>  fs/ext4/symlink.c               | 11 ++++++++-
>  fs/f2fs/namei.c                 | 11 ++++++++-
>  fs/ubifs/file.c                 | 12 ++++++++-
>  include/linux/fscrypt_notsupp.h |  6 +++++
>  include/linux/fscrypt_supp.h    |  1 +
>  6 files changed, 82 insertions(+), 3 deletions(-)
> 
> -- 
> 2.33.0.153.gba50c8fa24-goog
> 

All now queued up, thanks!

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
