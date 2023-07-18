Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71CAEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5qyJBrY6VIoQtHib5j1Td8gUTSBfOdQTZ6lxDYZk8s=; b=O3UeadRgBUUig+
	Mg4hUieWTlQ6QeWkj3scizon+l1NtrDvBj22toRJe/jWxteS4gVj2/98dc5JWY99Y3pZSfojRGczx
	4KgFNi0RR3QXC9qTG4iy5/b3mohGIJo/xrxPcIRgzWUSWvrM5t9rR63TLNZkr383ane9RLDrrFweS
	xWeHSvHK3SurX1aOo1hwnLGB0rpj9X42cNC1ML9n3rZ2O++ZLsmNARqrN9byZKUhYZ5S1TwfNifLK
	D56ymyQnKMcbhqxfi1Eqt/KKdqg+I78ROsI3jl/7yYlOGzyq5wICU5bU9APbhv/5p8A4KtV0OP5Zt
	riC5bC6Ji/mktNjrLduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0cv-005iaD-11;
	Wed, 19 Jul 2023 06:25:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0ct-005iZX-24
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aLC7t3CMDZ7VOXGMg9tZxQQGZ66gO6mRYQQcpnwKHxM=; b=dj6dW9Mff3irQzCnLRS0etQe69
	Jaf964+T4wGp05ehug2voyIkaZ1pDoEkaA7oml1HMhROT3kOwc/OO00Au9KfP9IBOk2cLdwe1fgcW
	wTYU05EJiIIDK47TYcV8YMOmNHaHPNjk6FEepZrysewqSbFzHIGbkE2wUgSWPuH1y6ph5cR3R9ji+
	7SnVF6QiJf7fzjW4UyFPDUyq7IT6EwThOuSducawMKZbjXo0FFmXoDWh1KjjeEoFY2H1zWP3+QN1C
	pGD9OVFxoxBhbxKJleXvX0dbAo4LkSwp/65ZgQdsxKYcE9yneR0sm8b9o+CVJugtw1HzX0IFbmiPp
	m/WED2hQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLtFQ-00C9aR-2M
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 22:32:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 777A861295;
	Tue, 18 Jul 2023 22:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41861C433C7;
	Tue, 18 Jul 2023 22:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689719561;
	bh=7Gbf5E8xcaK5OEKWGb4CHdLczRMlJnuQEgylfRoJijU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufuwLPWCK8dWV8FkCqtCEz1epizX5iOUu9r0pzjEB8rAo3vv70aUHG7DaVTyC0KRg
	 9GffXUB6RPQfiH4Pwwly5QDNxRzp24n52b7+3LD9ARpF8rJiXrkrBeyyZXIPCRwCL3
	 YnFduPkPfkN/Xgp87N8DLRjyb4cFcZH/W6xsrlYbCUBOsPO7LPaSINVyNCf7nN7z43
	 VbtnrwxtgFI9aorRlk+A+3KII5/Vn0DPycSXnFotjqn6aFg9SWYv2fXiVGJgnhvXsX
	 jEkhDeNqSzOymSxwFCvBFlJkeTEmz1CT/UJjdF6RKWm+b8SD1lfeb02J5lyYQ8cZJU
	 KTXuktmKYxzVQ==
Date: Tue, 18 Jul 2023 15:32:39 -0700
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
Message-ID: <20230718223239.GB1005@sol.localdomain>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-2-ardb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718125847.3869700-2-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_233250_080653_47A44018 
X-CRM114-Status: GOOD (  21.07  )
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

On Tue, Jul 18, 2023 at 02:58:27PM +0200, Ard Biesheuvel wrote:
> This reverts commit a368f43d6e3a001e684e9191a27df384fbff12f5.
> 
> "zlib-deflate" was introduced 6 years ago, but it does not have any
> users. So let's remove the generic implementation and the test vectors,
> but retain the "zlib-deflate" entry in the testmgr code to avoid
> introducing warning messages on systems that implement zlib-deflate in
> hardware.
> 
> Note that RFC 1950 which forms the basis of this algorithm dates back to
> 1996, and predates RFC 1951, on which the existing IPcomp is based and
> which we have supported in the kernel since 2003. So it seems rather
> unlikely that we will ever grow the need to support zlib-deflate.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  crypto/deflate.c | 61 +++++-----------
>  crypto/testmgr.c |  8 +--
>  crypto/testmgr.h | 75 --------------------
>  3 files changed, 18 insertions(+), 126 deletions(-)

So if this is really unused, it's probably fair to remove it on that basis.
However, it's not correct to claim that DEFLATE is obsoleted by zlib (the data
format).  zlib is just DEFLATE plus a checksum, as is gzip.

Many users of zlib or gzip use an external checksum and therefore would be
better served by DEFLATE, avoiding a redundant builtin checksum.  Typically,
people have chosen zlib or gzip simply because their compression library
defaulted to it, they didn't understand the difference, and they overlooked that
they're paying the price for a redundant builtin checksum.

An example of someone doing it right is EROFS, which is working on adding
DEFLATE support (not zlib or gzip!):
https://lore.kernel.org/r/20230713001441.30462-1-hsiangkao@linux.alibaba.com

Of course, they are using the library API instead of the clumsy crypto API.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
