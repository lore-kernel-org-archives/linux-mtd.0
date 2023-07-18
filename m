Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93444EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQzWDJbfGjalqxKclMmX6++ScZsELNr4uMlnYzT6UZI=; b=r45SQOHjSpyhij
	CaLag1Un4krgHM+jXtdAKIIBzU8p9GG1gFXtWXA6qN7aQIox0VNtLAQ8+2rpe0pFtwSKEdKlixgNP
	+LZFT1VwFTbU1o8Jd4dbD5KjKKoL6MgC7uHwz56uYzahxHi3QImWA6TohBulF22bSn9z8UgQbxhVp
	h85R0wadbpurYLc06ChNjLM7PM7QVgwq8MdUcKh75qUlDuPWv1K10p8qTju8EWd6G3tSohemNemuE
	WdnxFwtbpCcjZt38x1WqBsbNkEzbC84kZM+GKvo3feKpMHri7IY/+oTZLW4+kbs+k1nsfWC26NfLU
	we9r9qrak0mzhXzDqY7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzTD-005Aux-2L;
	Wed, 19 Jul 2023 05:11:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzT5-005ApN-0e
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hZolT1oKAvY3bdE2kPRKmoghnM8CM/kbHakDSPmzpjo=; b=M6gXt0U6mLEE9DyNzzepGbJvdn
	AtAfyTa3cRwzL2GoFhZLYVhn0lWHa79OUI4dIayizqe17xRc2YGQFTStQdp29YafcPwBRJavWMLj5
	Q/vTWUNEL/yP7fcT38XlV+IEHvNbqGj9HknS0b3KVDzTitQCveXxNiMeAJw1NoqDLsMy9CB9roAVh
	rSwz0qsGZi9dKysacuR4PYWABFj2de1rBF7SPvsW2IaYb8Nag7iITh/uIp1CboLP7LrupwgMzqwZ9
	0GRv2rKMzmZG3bOMU0g8nvplvzaSpq/BrWPj30vD1d0YkxYFSUW7jTK6SkMD4EJK9lUROSy44YXI+
	hFb2au4w==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLtat-00CARF-0P
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 22:55:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 718EA61280;
	Tue, 18 Jul 2023 22:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BC9C433C8;
	Tue, 18 Jul 2023 22:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689720892;
	bh=1hPBVUZKx9DcSFz9qEiAQCMaCu6XICTp5tPsfBL3VTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nZENGkevC8W/gj/0tZ9tVvAElZY3lwTUMr999oZl+jwvHVvtSMgDpH1KbGMEAU4qs
	 GdpVYRatm0rSzVuAMU4XHsXzxbuISlJXTbyX6Ak0+tmkqQfllCv6T0ItKeE5MMHk1i
	 p33MlEu6cwmh6M4Wxxhhb5pd4+W3wYK2dE/YtpA2o5B+XvJOMq1ia1u6cYxrdVIx0U
	 mYPIoJrkuqKmEMSsiz1ZArYA01s/aryDGYYvNiRUoqAk6VAHtXJ1FOfnqL0xq3TBGo
	 uBMtWz1SprpEJs7h1FI0mxBwReuRTZEjdlXn/cq6JQTFCphSKiIDvhQXXnaOHRyuA3
	 6utEntLUgpgtg==
Date: Tue, 18 Jul 2023 15:54:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	Kees Cook <keescook@chromium.org>, Haren Myneni <haren@us.ibm.com>,
	Nick Terrell <terrelln@fb.com>, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jens Axboe <axboe@kernel.dk>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Richard Weinberger <richard@nod.at>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	qat-linux@intel.com, linuxppc-dev@lists.ozlabs.org,
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [RFC PATCH 01/21] crypto: scomp - Revert "add support for
 deflate rfc1950 (zlib)"
Message-ID: <20230718225450.GD1005@sol.localdomain>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-2-ardb@kernel.org>
 <20230718223239.GB1005@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718223239.GB1005@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_235459_904154_79A5869C 
X-CRM114-Status: GOOD (  27.80  )
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

On Tue, Jul 18, 2023 at 03:32:39PM -0700, Eric Biggers wrote:
> On Tue, Jul 18, 2023 at 02:58:27PM +0200, Ard Biesheuvel wrote:
> > This reverts commit a368f43d6e3a001e684e9191a27df384fbff12f5.
> > 
> > "zlib-deflate" was introduced 6 years ago, but it does not have any
> > users. So let's remove the generic implementation and the test vectors,
> > but retain the "zlib-deflate" entry in the testmgr code to avoid
> > introducing warning messages on systems that implement zlib-deflate in
> > hardware.
> > 
> > Note that RFC 1950 which forms the basis of this algorithm dates back to
> > 1996, and predates RFC 1951, on which the existing IPcomp is based and
> > which we have supported in the kernel since 2003. So it seems rather
> > unlikely that we will ever grow the need to support zlib-deflate.
> > 
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  crypto/deflate.c | 61 +++++-----------
> >  crypto/testmgr.c |  8 +--
> >  crypto/testmgr.h | 75 --------------------
> >  3 files changed, 18 insertions(+), 126 deletions(-)
> 
> So if this is really unused, it's probably fair to remove it on that basis.
> However, it's not correct to claim that DEFLATE is obsoleted by zlib (the data
> format).  zlib is just DEFLATE plus a checksum, as is gzip.
> 
> Many users of zlib or gzip use an external checksum and therefore would be
> better served by DEFLATE, avoiding a redundant builtin checksum.  Typically,
> people have chosen zlib or gzip simply because their compression library
> defaulted to it, they didn't understand the difference, and they overlooked that
> they're paying the price for a redundant builtin checksum.
> 
> An example of someone doing it right is EROFS, which is working on adding
> DEFLATE support (not zlib or gzip!):
> https://lore.kernel.org/r/20230713001441.30462-1-hsiangkao@linux.alibaba.com
> 
> Of course, they are using the library API instead of the clumsy crypto API.
> 

Ah, I misread this patch, sorry.  It's actually removing support for zlib (the
data format) from the scomp API, leaving just DEFLATE.  That's fine too; again,
it ultimately just depends on what is actually being used via the scomp API.
But similarly you can't really claim that zlib is obsoleted by DEFLATE just
because of the RFC dates.  As I mentioned, many people do use zlib (the data
format), often just because it's the default of zlib (the library) and they
didn't know any better.  For example, btrfs compression supports zlib.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
