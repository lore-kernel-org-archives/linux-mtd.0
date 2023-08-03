Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96F5C0015E
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Aug 2023 09:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hg+FICeA7v6dlLDX0zOvDUPSp1DrsmiWf6rPk08N4mU=; b=OQMEa8a02hIdk5
	bbB0dCSaEOXFGGYVx4KprUd4zPKOZI5R8I4PrtjeIUWbh/6bPcW842cblktsrdxnvHwgXaag3t1oC
	fSD0Eib0KszEfx/LPKG9cGsprx1B4l4/lHs9siPKtCjYcxwOilDt4enrkRmsrbDSi6/KORznQUlec
	Hsw1jt7deE/W2bngSTbOs0tV0hYC8Dz0Kz8UXjZAlN92sveqzZkYtNVVb09ph5YGe12wNBzXZyk47
	KWsXLtV7a5PebHsnuEQ8curBmDxzqk6fjO7srB5NcxnQd7vfpnu3D9pE02TiVeGPI2YBjlwbeSeU7
	Bkt/0bnritoU6Mh75CJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRV71-007HVW-1G;
	Thu, 03 Aug 2023 09:59:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRV6x-007HUT-2b
	for linux-mtd@lists.infradead.org;
	Thu, 03 Aug 2023 09:59:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 40DA861D32
	for <linux-mtd@lists.infradead.org>; Thu,  3 Aug 2023 09:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C0DC43395
	for <linux-mtd@lists.infradead.org>; Thu,  3 Aug 2023 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691056754;
	bh=BFZpJsShnV7chFQ6j5N/0sdSDzzhIsWCO5shMzIbM/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f6TRORx24cAafVSY/2poXHwp7rxU18r1K2aJNN9yeq3kXCsxm4bI2hBcbOWs78KVq
	 HbsTA9sypvIIASMxyhj7/G84fO4EmdSEPdg9FH9UcSSEbnyiCCJRfeB8B1PPag+lcX
	 65F822tXdwVPsVCQ9ucJykAOer38/AAhlHNjDcCz8KVLUPFJoG38Kceta0YNqPbVq1
	 xZix6QfzbGfdiNe1rLUvmc7v0ysdO5RNr/maVjx0nkLz0SbFY4UHNT3ZspfACC/bpr
	 S3wuFm9JglB696Va/pFddQ/QMF7ATouYo1Lu24XYcnK0/xXuxQDBQ2oJw3amZw8Lze
	 Mx7I9EZeHORjA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4fe44955decso984363e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 03 Aug 2023 02:59:14 -0700 (PDT)
X-Gm-Message-State: ABy/qLb2hcB0Pm1xoCgneWypqLPEyQ62FPtozuU/RlG65YbyQlJmP9gP
	XbWOCkjGgC8DdN9LmByBbO5R5Fjh1LiFeuGjJHY=
X-Google-Smtp-Source: APBJJlFw2V3wcRa5v0Vnt1fPUZW5N5QfqaQ6cwXmzUW+1y1w1ET8IiAveXFEKGiBw1l2gDcoGbIc2BvfscEj5e4U4I4=
X-Received: by 2002:a05:6512:158b:b0:4fb:7624:85a5 with SMTP id
 bp11-20020a056512158b00b004fb762485a5mr3778949lfb.0.1691056752072; Thu, 03
 Aug 2023 02:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230718125847.3869700-1-ardb@kernel.org> <20230718125847.3869700-2-ardb@kernel.org>
 <ZMt4nkfpdCXxAkr5@gcabiddu-mobl1.ger.corp.intel.com>
In-Reply-To: <ZMt4nkfpdCXxAkr5@gcabiddu-mobl1.ger.corp.intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 3 Aug 2023 11:59:00 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGn70sGAHgOttKkC6n6jfVZ9Y61NZ9ffLmJV8MK2Kh8nQ@mail.gmail.com>
Message-ID: <CAMj1kXGn70sGAHgOttKkC6n6jfVZ9Y61NZ9ffLmJV8MK2Kh8nQ@mail.gmail.com>
Subject: Re: [RFC PATCH 01/21] crypto: scomp - Revert "add support for deflate
 rfc1950 (zlib)"
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Eric Biggers <ebiggers@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Haren Myneni <haren@us.ibm.com>, Nick Terrell <terrelln@fb.com>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
	Richard Weinberger <richard@nod.at>, David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, qat-linux <qat-linux@intel.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_025915_946838_3A27CCA6 
X-CRM114-Status: GOOD (  22.66  )
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

Hello Giovanni,

On Thu, 3 Aug 2023 at 11:51, Giovanni Cabiddu
<giovanni.cabiddu@intel.com> wrote:
>
> Hi Ard,
>
> On Tue, Jul 18, 2023 at 01:58:27PM +0100, Ard Biesheuvel wrote:
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
> Support for zlib-deflate was added for [1] but that work was not
> completed.
>

Any clue why zlib_deflate was chosen in this case?

/me also notes that this is another occurrence of the antipattern
where we use an asynchronous API and subsequently sleep on the
completion.

> Based on [2], either we leave this SW implementation or we remove the HW
> implementations in the QAT [3] and in the Hisilicon Zip [4] drivers.
>

That would work for me as well - dead code is just busywork.

> [1] https://patchwork.kernel.org/project/linux-btrfs/patch/1467083180-111750-1-git-send-email-weigang.li@intel.com/
> [2] https://lore.kernel.org/lkml/ZIw%2Fjtxdg6O1O0j3@gondor.apana.org.au/
> [3] https://elixir.bootlin.com/linux/latest/source/drivers/crypto/intel/qat/qat_common/qat_comp_algs.c#L457
> [4] https://elixir.bootlin.com/linux/latest/source/drivers/crypto/hisilicon/zip/zip_crypto.c#L754
>
> Regards,
>
> --
> Giovanni

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
