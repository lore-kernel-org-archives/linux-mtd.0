Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB31DC001DE
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 10:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cb5MblpPKk3cm3mQsTpebHquey4uJlfqZ9FQ+xWWA3c=; b=uFq9sBXI1lyb8r
	PfPy6flGCz95WJMmF9ISf+sxMDVka98GfjRPD2BO56t4ynFNWVgsg4GW9pW2PN2ETbO/JPA8RIBGG
	S11Y3E6H7qwGrRGcu99+cz/YmZX4gIktJjuJ+82poXXDeWXkd21hYSrECRnlXAuYS9E1ZzPhgK6oG
	Zo3DEPDCuoX1YhwfeZWDlqljYgcKaG3uK9erxdj2C7Kchq5VBjKrLxx3961Q6kkVACapOTylZ/a+a
	xAnuCl+lzCWjfIftcasqvhW/RTdYAxVVCECyLxgXFSYkrL9dK+L5fnLjtk+ADcO2xmGGD+BlVyJwi
	/HksIYvBtmYZ+od/eyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKJw-002lIf-39;
	Fri, 28 Jul 2023 10:03:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKJu-002lDo-1E
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 10:03:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 87615620EA
	for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2023 10:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACA3C43395
	for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2023 10:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690538617;
	bh=Mwb3geMIex9bief6/MfEaJk/1F/fz+2cfnXdqIIS7kA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tXpHkr01M64W1DlXlgN/uXAgQO8lbyiEuO9Cf0SA6Q2RwpJdglx+2A0vRRYDmqeFx
	 QkTSlvyPqmqL5v2RGTmtZIQCphoyH1AMpe/MzjMnZbgbsn7ANvRddsPz5dfpMpeuOG
	 6l12lZNR0KLb31OrfsB25kBIZZCHOOCZrMFkKSzf3Sn9GeITMm80WpBC25fbo/MeiH
	 Is2QOewf3opADVOZGSDdpl0GZlOCa0klQ0zI98I6Yqddd2IP316tAkQeY8FyfGyUD1
	 jRK4ZYBZDSKe9POSmHbsNwVOrkLU/PqrDqdXT/BM+hMIHzatm8aiKxo28ex5ebGkj2
	 BmUzcKu/wrcCA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b9cdba1228so10381811fa.2
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2023 03:03:37 -0700 (PDT)
X-Gm-Message-State: ABy/qLZJinJUqmAOTSjGsySopIkBwCrEX/6MkojCyBWfQX/hIWcKtReg
	5FXPlnfdhlmnqCWsGiQuM6sx4zUQLb8GIVdelSo=
X-Google-Smtp-Source: APBJJlFx+dQYWLD4Q57imF/9JvEvN5dBgTWOloOyttLP1mjqjiHeaGuGhb9mmggYpjQLqdnp9xDE77NZuZ6h+uNdIwc=
X-Received: by 2002:a2e:828f:0:b0:2b7:7c:d5a1 with SMTP id y15-20020a2e828f000000b002b7007cd5a1mr1160535ljg.23.1690538615123;
 Fri, 28 Jul 2023 03:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230718125847.3869700-1-ardb@kernel.org> <ZMOQiPadP2jggZ2i@gondor.apana.org.au>
 <CAMj1kXFRAhoyRD8mGe4xKZ-xGord2vwPXHCM7O8DPOpYWcgnJw@mail.gmail.com> <ZMORcmIA/urS8OI4@gondor.apana.org.au>
In-Reply-To: <ZMORcmIA/urS8OI4@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 28 Jul 2023 12:03:23 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFnr64b7SA1zYvSOrXazdH_O5G=i4re=taQa9hAeRbh-w@mail.gmail.com>
Message-ID: <CAMj1kXFnr64b7SA1zYvSOrXazdH_O5G=i4re=taQa9hAeRbh-w@mail.gmail.com>
Subject: Re: [RFC PATCH 00/21] crypto: consolidate and clean up compression APIs
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, 
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
X-CRM114-CacheID: sfid-20230728_030338_468111_FA5D8A55 
X-CRM114-Status: GOOD (  14.02  )
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

On Fri, 28 Jul 2023 at 11:59, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Fri, Jul 28, 2023 at 11:57:42AM +0200, Ard Biesheuvel wrote:
> >
> > So will IPcomp be able to simply assign those pages to the SKB afterwards?
>
> Yes that is the idea.  The network stack is very much in love with
> SG lists :)
>

Fair enough. But my point remains: this requires a lot of boilerplate
on the part of the driver, and it would be better if we could do this
in the acomp generic layer.

Does the IPcomp case always know the decompressed size upfront?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
