Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C6FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 05:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gN5bIYmvrerVrv+cm66OKfYf3HF/HXq2uTmYbw3KawI=; b=a/EG0VPh17yYxG
	lLxS7HAAOmyv5bI7lAA7/vGSOUW/QFiVdnGS5q2Teo/iLAcxLy/VBYE2Yp5OFmMYEi5sVmxIxjZ5a
	PJ41Mmjk5qXAt5Z61QJnUHC0yDtwFHPAvOgqhBy5UkCBmA7Djo8IJruMS3dSxJCG/Hmr1JomLCSJm
	dt1ShT/nV4x+TbbP834V3kYMGNt1SuOFDGJy7rDZgED2zW9UD1UKWalPGODy0Ig2G8lsRmP+F6wJC
	PzERX8okepYThceO9onkjR5ibgB2Jfo4SJvO3fG7BybIadbR2BNt3OJ/q9DnmN2EOPtaexEg0EXIx
	GoThsLpAZxuNVx23Pruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nes51-003vZy-B8; Thu, 14 Apr 2022 05:31:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nes4z-003vYq-88
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 05:31:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C352B827CE;
 Thu, 14 Apr 2022 05:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E90C385A1;
 Thu, 14 Apr 2022 05:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649914295;
 bh=L5WfTzpjmjPzbWBOyi36W4xnedgDh3ktWaS0CuxYK2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gRf6aEfGzR7cjx2ARWlkHDkLhiYl21dZDhTgSJtG1yCo6JAZZQoZ3VD0ckT/44hy0
 IBgRPNsmLZf1C1+ya4UCWyPlFjo9/iWkLxeOYhvlrYhDPeGhgs6SKlm0TvUSnLM6tZ
 5htpQJu+7Ep7a2Mj0Ja+ZM+avjLOV41Ggqdd4SZFwbYDY4mXNVVVCTNNTNQ2UPAwDK
 ilCpygqNTadPdfUW6h8nbVonntqOeyYLI5YMaAXba7ghSpOk2x0Mkc2hpXxihFLZMg
 g8YAgbyBFpBPzblXAtfGGzy9pinnedmIJ/wjZ5Wq11DwNYN5BANzlUaLM41cX5G5X6
 GpystR7vfkPjA==
Date: Wed, 13 Apr 2022 22:31:33 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH] fscrypt: split up FS_CRYPTO_BLOCK_SIZE
Message-ID: <YlextfUbirO97Gl7@sol.localdomain>
References: <20220405010914.18519-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220405010914.18519-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_223141_472472_AC76C59E 
X-CRM114-Status: GOOD (  15.58  )
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

On Mon, Apr 04, 2022 at 06:09:14PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> FS_CRYPTO_BLOCK_SIZE is neither the filesystem block size nor the
> granularity of encryption.  Rather, it defines two logically separate
> constraints that both arise from the block size of the AES cipher:
> 
> - The alignment required for the lengths of file contents blocks
> - The minimum input/output length for the filenames encryption modes
> 
> Since there are way too many things called the "block size", and the
> connection with the AES block size is not easily understood, split
> FS_CRYPTO_BLOCK_SIZE into two constants FSCRYPT_CONTENTS_ALIGNMENT and
> FSCRYPT_FNAME_MIN_MSG_LEN that more clearly describe what they are.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/crypto/crypto.c      | 10 +++++-----
>  fs/crypto/fname.c       | 11 +++++++++--
>  fs/ubifs/ubifs.h        |  2 +-
>  include/linux/fscrypt.h | 12 +++++++++++-
>  4 files changed, 26 insertions(+), 9 deletions(-)

Applied to fscrypt.git#master for 5.19.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
