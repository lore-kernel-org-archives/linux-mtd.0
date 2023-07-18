Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F42C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 08:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpfdrrhmRCTpg6uHEGEEBdY2nkfBrR+yfC0qsm9BElg=; b=Mp0KHmpYlUW6Ki
	tAG0h/lD85SIvdzymqMpjha+hV6ECS5EWBY6B5A3BOM3X0yz6PUwNS6uGTu5ZfDUvbv2Rqfd5skQP
	dVZHYIVzO3txzc8zmF4/mC14/dKJMdomzW9tsen/8iPWlGlO8PpT70vUSCFbno1yDkcRSnxS67tUz
	WEcGRuwQANM2zayxY3cwIu1QUWUPpTm9B9vLpYhSwHdZW6kwHujf4/dflqDg2JhrW+Aq1dgSCrEAx
	6zzcVeq71Vv9KS0/Z1SLqY80C/ha6TBYdr66qxNO5szTKMAvGM+KH0gpAgL5PCf7D5J/dkB9+ge2T
	jrtH7XnlNsnfqMh7JAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2O2-006Hno-34;
	Wed, 19 Jul 2023 08:18:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2O2-006Hn1-0Z
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eTL/TCTWAlbYr0Elj5mhsej8bo/B/cWKjNRqDEv/FGA=; b=dAwc8YyZDNWHjPkfEnGOS2EIWG
	YmUnzhWeTiMctHDHukyRGWM/uHO5raKAklJaHJ8CEohkBpsp7O5/I6spC7t13B2VmNvzb3XK1eHHj
	8AtUgoKFJ6EzxiDci+MBhd7oKAkGKXo/JMFXa7KXOM3p5nHH9x64YyIfIKWKi2ynx/pI5xr8RgkPP
	CfSxqgq6gp3rybusjYgzRIG2GeRHM1+uz8Q9fsBefkh6xFwkEb+QxvcTv8FyUEuj6anNywwo8eRn6
	q4Ma4aFN7WvjJsNLcB+O+pg+ig9Q68R46XF9y9j9zCCPbweAtIrfhiKPkDoC+beuNEsFvc1++GgWq
	7K6jL9kA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLtmj-00CDi6-2r
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 23:07:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26DAD614E9
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 23:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F45C4339A
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 23:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689721627;
	bh=+Pd8n6b3Bgde2sfLuTMJEdG3inSaboDgyN2R66pO+Cc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rbODd0eCkMojMdEsT2JG+DPQ5FfVcqjO+7TpaLSAITlHBKbP8U5e58LV5FWFBRUVd
	 WfqtFLFPPQLBI+WPyuMGATfmm8+J0uFQJTLKlLbH9TiCN9639o12nq+YJVNSQMYjF3
	 FGmaUehU1XG17oDii9iC9SAEy4rTkasUr+Y04Pcv/VZ+0YArgAhZB99N8buGKADRBJ
	 LYRHsl2hQRSIsn8KC+LLc8NDcS7nrGUW9UGRFo1Q8ScX1Afl7wGan1l3BVCFlU6WkM
	 vGsLFim7pfqlnxvDigXrfzxNxmdbDg2Bt/X2KpPLyeaCtSy8DvI3aGq9xkLL6VVsa3
	 nN1xZb5T64iiQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b73564e98dso96492141fa.3
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 16:07:06 -0700 (PDT)
X-Gm-Message-State: ABy/qLY4v5dWFrBeS+3fCuH7T60HnoP1dmOn4eOZXm4f2pJZUDpU8agl
	DG9TB+u5DMKf3yWGc8WPuv6kdzXKV3tHJxMDRnc=
X-Google-Smtp-Source: APBJJlE2SEtdQ0viGgTX1RHV1Jf09uAG1PnJ2kbrstQtKT8l+bPM54I0W1KpO3/vBtrnR6qoOuKC/wwAZ5RCUS+NTqM=
X-Received: by 2002:a2e:968c:0:b0:2b5:8f85:bf67 with SMTP id
 q12-20020a2e968c000000b002b58f85bf67mr476772lji.53.1689721624966; Tue, 18 Jul
 2023 16:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230718125847.3869700-1-ardb@kernel.org> <20230718125847.3869700-2-ardb@kernel.org>
 <20230718223239.GB1005@sol.localdomain> <20230718225450.GD1005@sol.localdomain>
In-Reply-To: <20230718225450.GD1005@sol.localdomain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 19 Jul 2023 01:06:53 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGR=1vA5T+iiRBSiabMqZxdCar_mXLOfcWPW0G1eHiXPA@mail.gmail.com>
Message-ID: <CAMj1kXGR=1vA5T+iiRBSiabMqZxdCar_mXLOfcWPW0G1eHiXPA@mail.gmail.com>
Subject: Re: [RFC PATCH 01/21] crypto: scomp - Revert "add support for deflate
 rfc1950 (zlib)"
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	Kees Cook <keescook@chromium.org>, Haren Myneni <haren@us.ibm.com>, Nick Terrell <terrelln@fb.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, 
	Richard Weinberger <richard@nod.at>, David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, qat-linux@intel.com, 
	linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_000714_441650_355E533A 
X-CRM114-Status: GOOD (  34.39  )
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

On Wed, 19 Jul 2023 at 00:54, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Tue, Jul 18, 2023 at 03:32:39PM -0700, Eric Biggers wrote:
> > On Tue, Jul 18, 2023 at 02:58:27PM +0200, Ard Biesheuvel wrote:
> > > This reverts commit a368f43d6e3a001e684e9191a27df384fbff12f5.
> > >
> > > "zlib-deflate" was introduced 6 years ago, but it does not have any
> > > users. So let's remove the generic implementation and the test vectors,
> > > but retain the "zlib-deflate" entry in the testmgr code to avoid
> > > introducing warning messages on systems that implement zlib-deflate in
> > > hardware.
> > >
> > > Note that RFC 1950 which forms the basis of this algorithm dates back to
> > > 1996, and predates RFC 1951, on which the existing IPcomp is based and
> > > which we have supported in the kernel since 2003. So it seems rather
> > > unlikely that we will ever grow the need to support zlib-deflate.
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > >  crypto/deflate.c | 61 +++++-----------
> > >  crypto/testmgr.c |  8 +--
> > >  crypto/testmgr.h | 75 --------------------
> > >  3 files changed, 18 insertions(+), 126 deletions(-)
> >
> > So if this is really unused, it's probably fair to remove it on that basis.
> > However, it's not correct to claim that DEFLATE is obsoleted by zlib (the data
> > format).  zlib is just DEFLATE plus a checksum, as is gzip.
> >
> > Many users of zlib or gzip use an external checksum and therefore would be
> > better served by DEFLATE, avoiding a redundant builtin checksum.  Typically,
> > people have chosen zlib or gzip simply because their compression library
> > defaulted to it, they didn't understand the difference, and they overlooked that
> > they're paying the price for a redundant builtin checksum.
> >
> > An example of someone doing it right is EROFS, which is working on adding
> > DEFLATE support (not zlib or gzip!):
> > https://lore.kernel.org/r/20230713001441.30462-1-hsiangkao@linux.alibaba.com
> >
> > Of course, they are using the library API instead of the clumsy crypto API.
> >
>
> Ah, I misread this patch, sorry.  It's actually removing support for zlib (the
> data format) from the scomp API, leaving just DEFLATE.  That's fine too; again,
> it ultimately just depends on what is actually being used via the scomp API.
> But similarly you can't really claim that zlib is obsoleted by DEFLATE just
> because of the RFC dates.  As I mentioned, many people do use zlib (the data
> format), often just because it's the default of zlib (the library) and they
> didn't know any better.  For example, btrfs compression supports zlib.
>

I am not suggesting either is obsolete. I am merely pointing out that
zlib-deflate is as old as plain deflate, and so we could have
implemented both at the same time when IPcomp support was added, but
we never bothered.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
