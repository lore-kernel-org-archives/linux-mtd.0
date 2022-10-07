Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CED5C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AV6BPyX2EO/vRfKl5f9IzJvKkU/12db0N76fUJSE6Ss=; b=ha6PV6FkgQHhic
	u4OVeyGRHkOND6f1uYqYS31c5ygHDqI6IaKR5vKJU4cCKzQySdTiLmkFbGb6AXx+ke09ef2yns9QC
	yAKhpkjQuEPRTyev27JQ3paagNON2hM4tk0bk7OikrgkzA+llG0VBlLTcgWmSHgBwH+Rc1WxurxXV
	3iOwa7zbVv3FcLlqAB5zXhaQnQyQVjt4X3RFBMcYBwQAr4Q8ki1PRj7RyUXfsRSGSyRSSHkexJ+zd
	xqCKKjwXSiuWb7NcBElbYcBEBddJS8aA80ZytDAON6T2LK65GcYY0amqWALZmfdzrrCmJ4I9Y3M7p
	Iu10uST63EQfEh0Ys2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogqu4-009ryF-1W; Fri, 07 Oct 2022 17:12:52 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogqty-009rvp-ST
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 17:12:49 +0000
Received: by mail-pf1-x42a.google.com with SMTP id p14so1110670pfq.5
        for <linux-mtd@lists.infradead.org>; Fri, 07 Oct 2022 10:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r+ar3rF5Nifj4ZH0w5BLPJvorwhCPz9FpYPvkQg1fFY=;
        b=lnyLGuYmjS75CgXIYPygwDolRfcdA6yOcav2EBBasADUNmB+X4q/LGyG3GplPLKF4D
         kbVVCg/8bBMxcfD9rLKmUEYYLhbyeB5zPm6ZDbYMckDnSVVJGqQeX6zA9l/IbMFC0x6e
         tEj8qeloPyDPz0HyArmtPjFAzjrVIlk8ES+6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r+ar3rF5Nifj4ZH0w5BLPJvorwhCPz9FpYPvkQg1fFY=;
        b=DqzFS3t2asq2OC34HdQmNtJPS7HTXK+ys4KhI05GuugYL9L1dxyj8BOV9+NdCNBd6O
         HXTOVNFZDvV6qm3OUtqh6HUw0CRqqeWJL3ir2fKn3j+unwN4WwUIr3DW3perB+mjCkaG
         kacDaTyn+kuENc2aJmay/beY7cQCiDL5gWA1BTX/goxbXOZwP82t3dgnMzBKuma9X6Yf
         wtdJby6ieRaI4yIxNmyG3t0iUSs2BwdbJOde1+PDPjnGZdDIh0IMtMFb3KvBxJIJ85vX
         HImdk90yA7BlDgF24Me+8Dbyz0ibGzxnoX2vqCvWWctI1/f9rFYR9OQlgvksGBA3fOMF
         RbJw==
X-Gm-Message-State: ACrzQf1JH9Uya0v6YCTMyHqct5UknMF6M+LUAj4tiWZeZ7WS9CGAW1un
	Cz06TDleqEsx2Aq4LPs9ZSM46w==
X-Google-Smtp-Source: AMsMyM6NgkBv0EiGuqEVmoxPIoEcqTWg64Tia/kXPXFAx+JliGbPe67OXQDl8cE35IpUxu9mDvbMUg==
X-Received: by 2002:a63:8149:0:b0:459:4e80:56bc with SMTP id t70-20020a638149000000b004594e8056bcmr5537842pgd.538.1665162764512;
        Fri, 07 Oct 2022 10:12:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o68-20020a62cd47000000b00540a8074c9dsm1849097pfg.166.2022.10.07.10.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 10:12:43 -0700 (PDT)
Date: Fri, 7 Oct 2022 10:12:42 -0700
From: Kees Cook <keescook@chromium.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Christoph Hellwig <hch@lst.de>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dave Airlie <airlied@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Huacai Chen <chenhuacai@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jakub Kicinski <kuba@kernel.org>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>,
	Jan Kara <jack@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	KP Singh <kpsingh@kernel.org>, Marco Elver <elver@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Theodore Ts'o <tytso@mit.edu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>,
	Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v3 3/5] treewide: use get_random_u32() when possible
Message-ID: <202210071010.52C672FA9@keescook>
References: <20221006165346.73159-1-Jason@zx2c4.com>
 <20221006165346.73159-4-Jason@zx2c4.com>
 <848ed24c-13ef-6c38-fd13-639b33809194@csgroup.eu>
 <CAHmME9raQ4E00r9r8NyWJ17iSXE_KniTG0onCNAfMmfcGar1eg@mail.gmail.com>
 <f10fcfbf-2da6-cf2d-6027-fbf8b52803e9@csgroup.eu>
 <6396875c-146a-acf5-dd9e-7f93ba1b4bc3@csgroup.eu>
 <CAHmME9pE4saqnwxhsAwt-xegYGjsavPOGnHCbZhUXD7kaJ+GAA@mail.gmail.com>
 <501b0fc3-6c67-657f-781e-25ee0283bc2e@csgroup.eu>
 <Y0Ayvov/KQmrIwTS@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0Ayvov/KQmrIwTS@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_101246_955247_2A376B4E 
X-CRM114-Status: GOOD (  38.62  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 07, 2022 at 08:07:58AM -0600, Jason A. Donenfeld wrote:
> On Fri, Oct 07, 2022 at 04:57:24AM +0000, Christophe Leroy wrote:
> > =

> > =

> > Le 07/10/2022 =E0 01:36, Jason A. Donenfeld a =E9crit=A0:
> > > On 10/6/22, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> > >>
> > >>
> > >> Le 06/10/2022 =E0 19:31, Christophe Leroy a =E9crit :
> > >>>
> > >>>
> > >>> Le 06/10/2022 =E0 19:24, Jason A. Donenfeld a =E9crit :
> > >>>> Hi Christophe,
> > >>>>
> > >>>> On Thu, Oct 6, 2022 at 11:21 AM Christophe Leroy
> > >>>> <christophe.leroy@csgroup.eu> wrote:
> > >>>>> Le 06/10/2022 =E0 18:53, Jason A. Donenfeld a =E9crit :
> > >>>>>> The prandom_u32() function has been a deprecated inline wrapper =
around
> > >>>>>> get_random_u32() for several releases now, and compiles down to =
the
> > >>>>>> exact same code. Replace the deprecated wrapper with a direct ca=
ll to
> > >>>>>> the real function. The same also applies to get_random_int(), wh=
ich is
> > >>>>>> just a wrapper around get_random_u32().
> > >>>>>>
> > >>>>>> Reviewed-by: Kees Cook <keescook@chromium.org>
> > >>>>>> Acked-by: Toke H=F8iland-J=F8rgensen <toke@toke.dk> # for sch_ca=
ke
> > >>>>>> Acked-by: Chuck Lever <chuck.lever@oracle.com> # for nfsd
> > >>>>>> Reviewed-by: Jan Kara <jack@suse.cz> # for ext4
> > >>>>>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > >>>>>> ---
> > >>>>>
> > >>>>>> diff --git a/arch/powerpc/kernel/process.c
> > >>>>>> b/arch/powerpc/kernel/process.c
> > >>>>>> index 0fbda89cd1bb..9c4c15afbbe8 100644
> > >>>>>> --- a/arch/powerpc/kernel/process.c
> > >>>>>> +++ b/arch/powerpc/kernel/process.c
> > >>>>>> @@ -2308,6 +2308,6 @@ void notrace __ppc64_runlatch_off(void)
> > >>>>>>     unsigned long arch_align_stack(unsigned long sp)
> > >>>>>>     {
> > >>>>>>         if (!(current->personality & ADDR_NO_RANDOMIZE) &&
> > >>>>>> randomize_va_space)
> > >>>>>> -             sp -=3D get_random_int() & ~PAGE_MASK;
> > >>>>>> +             sp -=3D get_random_u32() & ~PAGE_MASK;
> > >>>>>>         return sp & ~0xf;
> > >>>>>
> > >>>>> Isn't that a candidate for prandom_u32_max() ?
> > >>>>>
> > >>>>> Note that sp is deemed to be 16 bytes aligned at all time.
> > >>>>
> > >>>> Yes, probably. It seemed non-trivial to think about, so I didn't. =
But
> > >>>> let's see here... maybe it's not too bad:
> > >>>>
> > >>>> If PAGE_MASK is always ~(PAGE_SIZE-1), then ~PAGE_MASK is
> > >>>> (PAGE_SIZE-1), so prandom_u32_max(PAGE_SIZE) should yield the same
> > >>>> thing? Is that accurate? And holds across platforms (this comes up=
 a
> > >>>> few places)? If so, I'll do that for a v4.
> > >>>>
> > >>>
> > >>> On powerpc it is always (from arch/powerpc/include/asm/page.h) :
> > >>>
> > >>> /*
> > >>>    * Subtle: (1 << PAGE_SHIFT) is an int, not an unsigned long. So =
if we
> > >>>    * assign PAGE_MASK to a larger type it gets extended the way we =
want
> > >>>    * (i.e. with 1s in the high bits)
> > >>>    */
> > >>> #define PAGE_MASK      (~((1 << PAGE_SHIFT) - 1))
> > >>>
> > >>> #define PAGE_SIZE        (1UL << PAGE_SHIFT)
> > >>>
> > >>>
> > >>> So it would work I guess.
> > >>
> > >> But taking into account that sp must remain 16 bytes aligned, would =
it
> > >> be better to do something like ?
> > >>
> > >> 	sp -=3D prandom_u32_max(PAGE_SIZE >> 4) << 4;
> > >>
> > >> 	return sp;
> > > =

> > > Does this assume that sp is already aligned at the beginning of the
> > > function? I'd assume from the function's name that this isn't the
> > > case?
> > =

> > Ah you are right, I overlooked it.
> =

> So I think to stay on the safe side, I'm going to go with
> `prandom_u32_max(PAGE_SIZE)`. Sound good?

Given these kinds of less mechanical changes, it may make sense to split
these from the "trivial" conversions in a treewide patch. The chance of
needing a revert from the simple 1:1 conversions is much lower than the
need to revert by-hand changes.

The Cocci script I suggested in my v1 review gets 80% of the first
patch, for example.

-- =

Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
