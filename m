Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF61AC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Oct 2022 23:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XX4MdzPRE57nToum9C24zfG6a+XdSO/YYRIrUfPnVZw=; b=WlCTqw4El9bETK
	9EDI7zVpKchj8ats0M9486zLt/Q+8YekuhOs16JKfxtpQbbbW3XJDqaoe/efhFrMXeNXfaTTa7yE0
	qk0dx1w+vCYRE9IraJSc4Ro6vtFCG+5YO4gz8GOM7ID8h5vsYmygRPZSAerOTNO3I+GEbcByknhpd
	PRM1wQgKoavMU3NFn2YN0UqFw8P3GtuVCkHvtipOiRwY5dbyNXA9pDmt6IDyZQvl3lfSiZzCV9vka
	GTZcPjpDQvVtHnRcGk1G22zeS98YALUGwfpRhpQdXvx4pfzz/r4gkiVZ/6VAwmp8qFloU0nXobPUz
	kwLagAiCb3GYDweA9ADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiOG3-0066vx-2W; Tue, 11 Oct 2022 23:01:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiOFz-0066ud-2L; Tue, 11 Oct 2022 23:01:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 40993B817C0;
	Tue, 11 Oct 2022 23:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9723CC433D6;
	Tue, 11 Oct 2022 23:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665529308;
	bh=gCI+X2WOw4l6GrJak35sDaAf8gDE0fXgutS5wo82m0c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AJFptayVxOqteJVOLykn7hUdHTEFBSFYdPDnURZs6EbQ5lnc5EDwMPEWLIY2Zkc6k
	 ToDJ69GFb03nJ1ZHa3Bu1XZh90AT8husNifCGxqExcBTtq73zRbzdbLGz1yV1PS0BR
	 YgADbRNTz4kaxl1FPtL5h69IOLIEA3uAgLFu6LoZOj6vAhrzGGJogNzed4iTNoQ9kU
	 RplOVmj/pT0WrloWUBcPNyJldLUtdrL9BReJJkpTFUke93m8zD4dIphjguaBr6M6BU
	 xC/9Fc6Zmo9mtTlbNcRQZT+mur3mj5hpEnCkCHrxZUfVSrUfpxEhWQqxTOA+fraPtq
	 COtQHCYR1WDtw==
Date: Tue, 11 Oct 2022 16:01:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev, Andreas Noever
 <andreas.noever@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christoph
 =?UTF-8?B?QsO2aG13YWxkZXI=?= <christoph.boehmwalder@linbit.com>, Christoph
 Hellwig <hch@lst.de>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Daniel Borkmann <daniel@iogearbox.net>, Dave Airlie <airlied@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Florian Westphal
 <fw@strlen.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "H . Peter
 Anvin" <hpa@zytor.com>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller
 <deller@gmx.de>, Herbert Xu <herbert@gondor.apana.org.au>, Huacai Chen
 <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>, "James E . J .
 Bottomley" <jejb@linux.ibm.com>, Jan Kara <jack@suse.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>, Johannes Berg
 <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>, Jozsef
 Kadlecsik <kadlec@netfilter.org>, KP Singh <kpsingh@kernel.org>, Kees Cook
 <keescook@chromium.org>, Marco Elver <elver@google.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Pablo
 Neira Ayuso <pablo@netfilter.org>, Paolo Abeni <pabeni@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Theodore Ts'o <tytso@mit.edu>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>, Ulf Hansson
 <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, WANG
 Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Yury Norov
 <yury.norov@gmail.com>, dri-devel@lists.freedesktop.org,
 kasan-dev@googlegroups.com, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v6 0/7] treewide cleanup of random integer usage
Message-ID: <20221011160144.1c0dc2af@kernel.org>
In-Reply-To: <20221010230613.1076905-1-Jason@zx2c4.com>
References: <20221010230613.1076905-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_160151_420012_871C171D 
X-CRM114-Status: GOOD (  15.69  )
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

On Mon, 10 Oct 2022 17:06:06 -0600 Jason A. Donenfeld wrote:
> - If you want a secure or an insecure random u64, use get_random_u64().
> - If you want a secure or an insecure random u32, use get_random_u32().
>   * The old function prandom_u32() has been deprecated for a while now
>     and is just a wrapper around get_random_u32(). Same for
>     get_random_int().
> - If you want a secure or an insecure random u16, use get_random_u16().
> - If you want a secure or an insecure random u8, use get_random_u8().
> - If you want secure or insecure random bytes, use get_random_bytes().
>   * The old function prandom_bytes() has been deprecated for a while now
>     and has long been a wrapper around get_random_bytes().
> - If you want a non-uniform random u32, u16, or u8 bounded by a certain
>   open interval maximum, use prandom_u32_max().
>   * I say "non-uniform", because it doesn't do any rejection sampling or
>     divisions. Hence, it stays within the prandom_* namespace.

Acked-by: Jakub Kicinski <kuba@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
