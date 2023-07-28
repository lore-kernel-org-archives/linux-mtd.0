Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6059C0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 09:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvRWY01CwVpfXFOqXN2gQuX5J948BoeYKWLA8bGE8JM=; b=aEZ3+6HzrGm+z9
	xpVUX32E/jtiVZR/JnzX7FWYxP+8HT0NJXmJBLhCwfj9emeEUFZHSXY6vzzuOpKLxVvMdpuVZps+d
	0sT5qzhnscXh/BBwnARRDejHkwCPOwzmzztmzEAGsQEc4hujKIirE2X9wkgeiOwOuTIanH0wE4Rn+
	2alrCpw/lDZjWatdQ5q6B3wijW4IPvPnjbsS/ww/7cBO/LvNEZ8oC4rbUP3oBa4asl5yuT5gT+L9J
	zGE224FMn5KOxlU97J+Ohk8xDqKtXnNhtXqhhTqm/l+cWaWdsjN5sbGaQgQY/eyprbRx4OtTPic8W
	MRfSkcxZsbbVQXwKpZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKEU-002iYc-2U;
	Fri, 28 Jul 2023 09:58:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKES-002iXu-0o
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 09:58:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 066C9620B3
	for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2023 09:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6301C433AD
	for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2023 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690538275;
	bh=oJaH4FPNITgFoQ+abPo51cru9bJTKsgeWccgWhkv5cE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SUoVrrVL6fuFu9dh/fQxhreLndwtivej2cw8a+pevy2EpHU+QjJYN4XWPf/xfVkFF
	 HX9jFeNC2xSBe5QYPhMsk2oZgjV02lgtYWIc+GeJFb9Vw0R2PT4+vJmLahM1r9i0Nj
	 4yvyhCgjGeBSSHWTWWO3pKHYX12kUh0IpZ7nuYzXRwL8L1aWNF8rsVgyXae8BiBMl2
	 MTIpT59ZpxB9s2JK7kzGvqTd8NdggCK0QPZn/d0TGUKIUyv3DvKVPCXyGO+2ZYdUAi
	 zjzxxOXvK9RN19dlk7XHr8W4zFX7tOgc2fLardbWjO0l4ZdL4FVN/3Qk8r50UDks5F
	 B1sGZ7gJbjeXA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so6271621fa.3
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2023 02:57:55 -0700 (PDT)
X-Gm-Message-State: ABy/qLbvyf2kgreXwZ90K6KD1EsTPjnB5M5N1Si+P+hX5fzEVBQBYQFJ
	AF9JJlWUbDc24EV4q2bL0VUL6e4GcD+GZmu6kqk=
X-Google-Smtp-Source: APBJJlGdvD0o+yLEzMNCc0c1pu2cw3CoX/pd5F5+PU3DAnRSXj0L5yohZi4+WeMBmC3e6J8LoSkPbHQyHGUQqY1xvjk=
X-Received: by 2002:a2e:97d7:0:b0:2b6:fa60:85a1 with SMTP id
 m23-20020a2e97d7000000b002b6fa6085a1mr1402058ljj.21.1690538273864; Fri, 28
 Jul 2023 02:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230718125847.3869700-1-ardb@kernel.org> <ZMOQiPadP2jggZ2i@gondor.apana.org.au>
In-Reply-To: <ZMOQiPadP2jggZ2i@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 28 Jul 2023 11:57:42 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFRAhoyRD8mGe4xKZ-xGord2vwPXHCM7O8DPOpYWcgnJw@mail.gmail.com>
Message-ID: <CAMj1kXFRAhoyRD8mGe4xKZ-xGord2vwPXHCM7O8DPOpYWcgnJw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230728_025800_334892_0770E63B 
X-CRM114-Status: GOOD (  18.94  )
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

On Fri, 28 Jul 2023 at 11:56, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Tue, Jul 18, 2023 at 02:58:26PM +0200, Ard Biesheuvel wrote:
> >
> > Patch #2 removes the support for on-the-fly allocation of destination
> > buffers and scatterlists from the Intel QAT driver. This is never used,
> > and not even implemented by all drivers (the HiSilicon ZIP driver does
> > not support it). The diffstat of this patch makes a good case why the
> > caller should be in charge of allocating the memory, not the driver.
>
> The implementation in qat may not be optimal, but being able to
> allocate memory in the algorithm is a big plus for IPComp at least.
>
> Being able to allocate memory page by page as you decompress
> means that:
>
> 1. We're not affected by memory fragmentation.
> 2. We don't waste memory by always allocating for the worst case.
>

So will IPcomp be able to simply assign those pages to the SKB afterwards?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
