Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CACC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 17:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZQeyxIeDPevU5Ji6Tulf5VEarfpaNRuCNFy4VOpxqY=; b=QYD6FvO7trrM1b
	tqQGME+v/plqBudjNT/uGzT3VqwcGmNqPQKiXefxWMjXJHe+dowf2Pij/FnncziMsI8qo/mLQVRGJ
	I5SmCfzPN4uEMli3GalecolyBgLcB15YNR2nplLigQLuSHyGKFGP2/bOOeuKeKoSaYMp3nN+zsxIJ
	i8uhT36e0gHIBzDqzbSE2k77i38QIoE+XGXcBq3wvLLac11R+wYr9aJr8Y3eaXtSJ1xfjuRw2okEz
	VVtlV7dWNfqDDfkMmHIel5nXwwmIY+2+ZZ6NxD700lWIAeWVhNBw3rL/lbVSqhG0TYes0iDEKJInk
	T32gTKiTzIR4omyYTMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogUc8-0049d2-Qk; Thu, 06 Oct 2022 17:24:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogUc4-0049ZA-VS; Thu, 06 Oct 2022 17:24:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DC9361A3E;
	Thu,  6 Oct 2022 17:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A25C433D7;
	Thu,  6 Oct 2022 17:24:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nePovel1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665077082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hw+hnIMvKUNp0lwyCAgNJh72KYkKEhg87FRQTBs88Es=;
	b=nePovel1Lrwv8E5tqLRFnGFwiBxZ2n7/W/dtDooIL7+DqvFmVm/jtXBYpVHjty/NEZ8aCk
	oxvu6PHIjOnVPY0KsxiuHL31B6Zt2u2Br+FRrADatX9MrN91+oy0kpWf4AY4e4utheKw7f
	zZ5QYQpj8zDsC3zJybqaF78JFqPcgIE=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 79bb2e53 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 6 Oct 2022 17:24:42 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id p89so860906uap.12;
        Thu, 06 Oct 2022 10:24:39 -0700 (PDT)
X-Gm-Message-State: ACrzQf1MnG4ingLIKvXEeY+KsyU/atBRuWVBVwmpGmWqHjXyyEn+NA68
	mE55IwakwcBcijDE00sVsvw4ofcEU3MzAF4cT3w=
X-Google-Smtp-Source: AMsMyM5KG2gwBNORWG5lbntrblDeF/IiEaNCtjq1xHSusLtpHfgrAAJFtzxp/82W985F9k39J/OxSFTwH+6dW+Mrfqw=
X-Received: by 2002:ab0:6cb0:0:b0:3d7:1184:847f with SMTP id
 j16-20020ab06cb0000000b003d71184847fmr777504uaa.49.1665077067240; Thu, 06 Oct
 2022 10:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221006165346.73159-1-Jason@zx2c4.com> <20221006165346.73159-4-Jason@zx2c4.com>
 <848ed24c-13ef-6c38-fd13-639b33809194@csgroup.eu>
In-Reply-To: <848ed24c-13ef-6c38-fd13-639b33809194@csgroup.eu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Oct 2022 11:24:16 -0600
X-Gmail-Original-Message-ID: <CAHmME9raQ4E00r9r8NyWJ17iSXE_KniTG0onCNAfMmfcGar1eg@mail.gmail.com>
Message-ID: <CAHmME9raQ4E00r9r8NyWJ17iSXE_KniTG0onCNAfMmfcGar1eg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] treewide: use get_random_u32() when possible
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"patches@lists.linux.dev" <patches@lists.linux.dev>, Andreas Noever <andreas.noever@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	=?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	Christoph Hellwig <hch@lst.de>, Daniel Borkmann <daniel@iogearbox.net>, Dave Airlie <airlied@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Huacai Chen <chenhuacai@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	"James E . J . Bottomley" <jejb@linux.ibm.com>, Jan Kara <jack@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Berg <johannes@sipsolutions.net>, 
	Jonathan Corbet <corbet@lwn.net>, Jozsef Kadlecsik <kadlec@netfilter.org>, KP Singh <kpsingh@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Pablo Neira Ayuso <pablo@netfilter.org>, Paolo Abeni <pabeni@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, "Theodore Ts'o" <tytso@mit.edu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, 
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
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
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
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	=?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
	Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_102449_109424_3AA00E37 
X-CRM114-Status: GOOD (  24.35  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCk9uIFRodSwgT2N0IDYsIDIwMjIgYXQgMTE6MjEgQU0gQ2hyaXN0b3Bo
ZSBMZXJveQo8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToKPiBMZSAwNi8xMC8y
MDIyIMOgIDE4OjUzLCBKYXNvbiBBLiBEb25lbmZlbGQgYSDDqWNyaXQgOgo+ID4gVGhlIHByYW5k
b21fdTMyKCkgZnVuY3Rpb24gaGFzIGJlZW4gYSBkZXByZWNhdGVkIGlubGluZSB3cmFwcGVyIGFy
b3VuZAo+ID4gZ2V0X3JhbmRvbV91MzIoKSBmb3Igc2V2ZXJhbCByZWxlYXNlcyBub3csIGFuZCBj
b21waWxlcyBkb3duIHRvIHRoZQo+ID4gZXhhY3Qgc2FtZSBjb2RlLiBSZXBsYWNlIHRoZSBkZXBy
ZWNhdGVkIHdyYXBwZXIgd2l0aCBhIGRpcmVjdCBjYWxsIHRvCj4gPiB0aGUgcmVhbCBmdW5jdGlv
bi4gVGhlIHNhbWUgYWxzbyBhcHBsaWVzIHRvIGdldF9yYW5kb21faW50KCksIHdoaWNoIGlzCj4g
PiBqdXN0IGEgd3JhcHBlciBhcm91bmQgZ2V0X3JhbmRvbV91MzIoKS4KPiA+Cj4gPiBSZXZpZXdl
ZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4gPiBBY2tlZC1ieTogVG9r
ZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHRva2UuZGs+ICMgZm9yIHNjaF9jYWtlCj4gPiBB
Y2tlZC1ieTogQ2h1Y2sgTGV2ZXIgPGNodWNrLmxldmVyQG9yYWNsZS5jb20+ICMgZm9yIG5mc2QK
PiA+IFJldmlld2VkLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PiAjIGZvciBleHQ0Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBKYXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNvbT4KPiA+IC0t
LQo+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNo
L3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYwo+ID4gaW5kZXggMGZiZGE4OWNkMWJiLi45YzRjMTVh
ZmJiZTggMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYwo+ID4g
KysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNzLmMKPiA+IEBAIC0yMzA4LDYgKzIzMDgs
NiBAQCB2b2lkIG5vdHJhY2UgX19wcGM2NF9ydW5sYXRjaF9vZmYodm9pZCkKPiA+ICAgdW5zaWdu
ZWQgbG9uZyBhcmNoX2FsaWduX3N0YWNrKHVuc2lnbmVkIGxvbmcgc3ApCj4gPiAgIHsKPiA+ICAg
ICAgIGlmICghKGN1cnJlbnQtPnBlcnNvbmFsaXR5ICYgQUREUl9OT19SQU5ET01JWkUpICYmIHJh
bmRvbWl6ZV92YV9zcGFjZSkKPiA+IC0gICAgICAgICAgICAgc3AgLT0gZ2V0X3JhbmRvbV9pbnQo
KSAmIH5QQUdFX01BU0s7Cj4gPiArICAgICAgICAgICAgIHNwIC09IGdldF9yYW5kb21fdTMyKCkg
JiB+UEFHRV9NQVNLOwo+ID4gICAgICAgcmV0dXJuIHNwICYgfjB4ZjsKPgo+IElzbid0IHRoYXQg
YSBjYW5kaWRhdGUgZm9yIHByYW5kb21fdTMyX21heCgpID8KPgo+IE5vdGUgdGhhdCBzcCBpcyBk
ZWVtZWQgdG8gYmUgMTYgYnl0ZXMgYWxpZ25lZCBhdCBhbGwgdGltZS4KClllcywgcHJvYmFibHku
IEl0IHNlZW1lZCBub24tdHJpdmlhbCB0byB0aGluayBhYm91dCwgc28gSSBkaWRuJ3QuIEJ1dAps
ZXQncyBzZWUgaGVyZS4uLiBtYXliZSBpdCdzIG5vdCB0b28gYmFkOgoKSWYgUEFHRV9NQVNLIGlz
IGFsd2F5cyB+KFBBR0VfU0laRS0xKSwgdGhlbiB+UEFHRV9NQVNLIGlzCihQQUdFX1NJWkUtMSks
IHNvIHByYW5kb21fdTMyX21heChQQUdFX1NJWkUpIHNob3VsZCB5aWVsZCB0aGUgc2FtZQp0aGlu
Zz8gSXMgdGhhdCBhY2N1cmF0ZT8gQW5kIGhvbGRzIGFjcm9zcyBwbGF0Zm9ybXMgKHRoaXMgY29t
ZXMgdXAgYQpmZXcgcGxhY2VzKT8gSWYgc28sIEknbGwgZG8gdGhhdCBmb3IgYSB2NC4KCkphc29u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
