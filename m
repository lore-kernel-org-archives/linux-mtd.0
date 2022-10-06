Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3EDC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 23:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OiAFAXRHqt8rCQxYiOs7i0nHTW7QuvUFLzQpiklLb+I=; b=zJCInRdSeam3a3
	C9twJrZiJDuxO0ZM7oWRoVCUHFrWdWvkI0Zydwv3GpTNY6bqwgvZVNir6rTTywfUtO73+fZFwb1XG
	rsDMfcdfw8+3LM/mQIpREM8kESQ/zK1QOo1uRvEBbYN12OgUg+KqfyhXSabcItaphoWWlav/wjjna
	4iGMR9JtRDEM3oIAxGUoCumExlx4EzSLtyd5LyAXGzF41RUqAbRMxqaPgH0o79Gq+p0zPwWrXggAG
	cpwWMuHqpTqnYqflL+J/O6S22inUzj40kt4YfJo4SfLjAgo2Ks1sq47ItuDhtjLbAzcMWq6T1OE0l
	kvZKSP+ohpy5Bbxi05zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogaQY-005zQt-Ag; Thu, 06 Oct 2022 23:37:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogaQU-005zOw-Em; Thu, 06 Oct 2022 23:37:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BC28DB821ED;
	Thu,  6 Oct 2022 23:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0358DC433D7;
	Thu,  6 Oct 2022 23:37:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="TcHt+d7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665099425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eDWvYu+uSvuLU1D2yrcps4Uxg3s4afpQR1DZP1HAENk=;
	b=TcHt+d7yPueTBYuwAAWxgvAdDHj64m9UG6PsgMMVrRyZJdh3MrfBnD2EXuRBSXN2AK0bce
	JQq/oT07fufzIxmebswTUezyu6iYB1SPu/a1sYeOsQdbYBA7W/PLHN/kvsFnjOB3CrTBCb
	jkr+TVwHNLRv1VXqfp1j0nzqaza9BYA=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c6c344ad (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 6 Oct 2022 23:37:05 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id mg6so2153107qvb.10;
        Thu, 06 Oct 2022 16:37:01 -0700 (PDT)
X-Gm-Message-State: ACrzQf06RiWAx5paZXtEqVMN7qxobqYvDMKH5STlU1pg2TxY7QfnDTcW
	zcrkexgk5ez2nH2zuoApeCjgMHtxpMcOeKLUBtE=
X-Google-Smtp-Source: AMsMyM5tvZWHSrcOLtkY/lX0Q7Qvr/oXlGj5vIRT4adjylKOfvaHnErU8AKkQNdqtGo/HZJDgntpViQRNpApZtsIptY=
X-Received: by 2002:a05:6102:2908:b0:398:ac40:d352 with SMTP id
 cz8-20020a056102290800b00398ac40d352mr1292105vsb.55.1665099409449; Thu, 06
 Oct 2022 16:36:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:6ed0:0:b0:3d9:6dfd:499 with HTTP; Thu, 6 Oct 2022
 16:36:48 -0700 (PDT)
In-Reply-To: <6396875c-146a-acf5-dd9e-7f93ba1b4bc3@csgroup.eu>
References: <20221006165346.73159-1-Jason@zx2c4.com> <20221006165346.73159-4-Jason@zx2c4.com>
 <848ed24c-13ef-6c38-fd13-639b33809194@csgroup.eu> <CAHmME9raQ4E00r9r8NyWJ17iSXE_KniTG0onCNAfMmfcGar1eg@mail.gmail.com>
 <f10fcfbf-2da6-cf2d-6027-fbf8b52803e9@csgroup.eu> <6396875c-146a-acf5-dd9e-7f93ba1b4bc3@csgroup.eu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Oct 2022 17:36:48 -0600
X-Gmail-Original-Message-ID: <CAHmME9pE4saqnwxhsAwt-xegYGjsavPOGnHCbZhUXD7kaJ+GAA@mail.gmail.com>
Message-ID: <CAHmME9pE4saqnwxhsAwt-xegYGjsavPOGnHCbZhUXD7kaJ+GAA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20221006_163714_851716_B0F84DFB 
X-CRM114-Status: GOOD (  25.56  )
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

T24gMTAvNi8yMiwgQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
PiB3cm90ZToKPgo+Cj4gTGUgMDYvMTAvMjAyMiDDoCAxOTozMSwgQ2hyaXN0b3BoZSBMZXJveSBh
IMOpY3JpdCA6Cj4+Cj4+Cj4+IExlIDA2LzEwLzIwMjIgw6AgMTk6MjQsIEphc29uIEEuIERvbmVu
ZmVsZCBhIMOpY3JpdCA6Cj4+PiBIaSBDaHJpc3RvcGhlLAo+Pj4KPj4+IE9uIFRodSwgT2N0IDYs
IDIwMjIgYXQgMTE6MjEgQU0gQ2hyaXN0b3BoZSBMZXJveQo+Pj4gPGNocmlzdG9waGUubGVyb3lA
Y3Nncm91cC5ldT4gd3JvdGU6Cj4+Pj4gTGUgMDYvMTAvMjAyMiDDoCAxODo1MywgSmFzb24gQS4g
RG9uZW5mZWxkIGEgw6ljcml0IDoKPj4+Pj4gVGhlIHByYW5kb21fdTMyKCkgZnVuY3Rpb24gaGFz
IGJlZW4gYSBkZXByZWNhdGVkIGlubGluZSB3cmFwcGVyIGFyb3VuZAo+Pj4+PiBnZXRfcmFuZG9t
X3UzMigpIGZvciBzZXZlcmFsIHJlbGVhc2VzIG5vdywgYW5kIGNvbXBpbGVzIGRvd24gdG8gdGhl
Cj4+Pj4+IGV4YWN0IHNhbWUgY29kZS4gUmVwbGFjZSB0aGUgZGVwcmVjYXRlZCB3cmFwcGVyIHdp
dGggYSBkaXJlY3QgY2FsbCB0bwo+Pj4+PiB0aGUgcmVhbCBmdW5jdGlvbi4gVGhlIHNhbWUgYWxz
byBhcHBsaWVzIHRvIGdldF9yYW5kb21faW50KCksIHdoaWNoIGlzCj4+Pj4+IGp1c3QgYSB3cmFw
cGVyIGFyb3VuZCBnZXRfcmFuZG9tX3UzMigpLgo+Pj4+Pgo+Pj4+PiBSZXZpZXdlZC1ieTogS2Vl
cyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4+Pj4+IEFja2VkLWJ5OiBUb2tlIEjDuGls
YW5kLUrDuHJnZW5zZW4gPHRva2VAdG9rZS5kaz4gIyBmb3Igc2NoX2Nha2UKPj4+Pj4gQWNrZWQt
Ynk6IENodWNrIExldmVyIDxjaHVjay5sZXZlckBvcmFjbGUuY29tPiAjIGZvciBuZnNkCj4+Pj4+
IFJldmlld2VkLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PiAjIGZvciBleHQ0Cj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25AengyYzQuY29tPgo+Pj4+PiAt
LS0KPj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNzLmMK
Pj4+Pj4gYi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYwo+Pj4+PiBpbmRleCAwZmJkYTg5
Y2QxYmIuLjljNGMxNWFmYmJlOCAxMDA2NDQKPj4+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5l
bC9wcm9jZXNzLmMKPj4+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNzLmMKPj4+
Pj4gQEAgLTIzMDgsNiArMjMwOCw2IEBAIHZvaWQgbm90cmFjZSBfX3BwYzY0X3J1bmxhdGNoX29m
Zih2b2lkKQo+Pj4+PiAgICB1bnNpZ25lZCBsb25nIGFyY2hfYWxpZ25fc3RhY2sodW5zaWduZWQg
bG9uZyBzcCkKPj4+Pj4gICAgewo+Pj4+PiAgICAgICAgaWYgKCEoY3VycmVudC0+cGVyc29uYWxp
dHkgJiBBRERSX05PX1JBTkRPTUlaRSkgJiYKPj4+Pj4gcmFuZG9taXplX3ZhX3NwYWNlKQo+Pj4+
PiAtICAgICAgICAgICAgIHNwIC09IGdldF9yYW5kb21faW50KCkgJiB+UEFHRV9NQVNLOwo+Pj4+
PiArICAgICAgICAgICAgIHNwIC09IGdldF9yYW5kb21fdTMyKCkgJiB+UEFHRV9NQVNLOwo+Pj4+
PiAgICAgICAgcmV0dXJuIHNwICYgfjB4ZjsKPj4+Pgo+Pj4+IElzbid0IHRoYXQgYSBjYW5kaWRh
dGUgZm9yIHByYW5kb21fdTMyX21heCgpID8KPj4+Pgo+Pj4+IE5vdGUgdGhhdCBzcCBpcyBkZWVt
ZWQgdG8gYmUgMTYgYnl0ZXMgYWxpZ25lZCBhdCBhbGwgdGltZS4KPj4+Cj4+PiBZZXMsIHByb2Jh
Ymx5LiBJdCBzZWVtZWQgbm9uLXRyaXZpYWwgdG8gdGhpbmsgYWJvdXQsIHNvIEkgZGlkbid0LiBC
dXQKPj4+IGxldCdzIHNlZSBoZXJlLi4uIG1heWJlIGl0J3Mgbm90IHRvbyBiYWQ6Cj4+Pgo+Pj4g
SWYgUEFHRV9NQVNLIGlzIGFsd2F5cyB+KFBBR0VfU0laRS0xKSwgdGhlbiB+UEFHRV9NQVNLIGlz
Cj4+PiAoUEFHRV9TSVpFLTEpLCBzbyBwcmFuZG9tX3UzMl9tYXgoUEFHRV9TSVpFKSBzaG91bGQg
eWllbGQgdGhlIHNhbWUKPj4+IHRoaW5nPyBJcyB0aGF0IGFjY3VyYXRlPyBBbmQgaG9sZHMgYWNy
b3NzIHBsYXRmb3JtcyAodGhpcyBjb21lcyB1cCBhCj4+PiBmZXcgcGxhY2VzKT8gSWYgc28sIEkn
bGwgZG8gdGhhdCBmb3IgYSB2NC4KPj4+Cj4+Cj4+IE9uIHBvd2VycGMgaXQgaXMgYWx3YXlzIChm
cm9tIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlLmgpIDoKPj4KPj4gLyoKPj4gICAqIFN1
YnRsZTogKDEgPDwgUEFHRV9TSElGVCkgaXMgYW4gaW50LCBub3QgYW4gdW5zaWduZWQgbG9uZy4g
U28gaWYgd2UKPj4gICAqIGFzc2lnbiBQQUdFX01BU0sgdG8gYSBsYXJnZXIgdHlwZSBpdCBnZXRz
IGV4dGVuZGVkIHRoZSB3YXkgd2Ugd2FudAo+PiAgICogKGkuZS4gd2l0aCAxcyBpbiB0aGUgaGln
aCBiaXRzKQo+PiAgICovCj4+ICNkZWZpbmUgUEFHRV9NQVNLICAgICAgKH4oKDEgPDwgUEFHRV9T
SElGVCkgLSAxKSkKPj4KPj4gI2RlZmluZSBQQUdFX1NJWkUgICAgICAgICgxVUwgPDwgUEFHRV9T
SElGVCkKPj4KPj4KPj4gU28gaXQgd291bGQgd29yayBJIGd1ZXNzLgo+Cj4gQnV0IHRha2luZyBp
bnRvIGFjY291bnQgdGhhdCBzcCBtdXN0IHJlbWFpbiAxNiBieXRlcyBhbGlnbmVkLCB3b3VsZCBp
dAo+IGJlIGJldHRlciB0byBkbyBzb21ldGhpbmcgbGlrZSA/Cj4KPiAJc3AgLT0gcHJhbmRvbV91
MzJfbWF4KFBBR0VfU0laRSA+PiA0KSA8PCA0Owo+Cj4gCXJldHVybiBzcDsKCkRvZXMgdGhpcyBh
c3N1bWUgdGhhdCBzcCBpcyBhbHJlYWR5IGFsaWduZWQgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUK
ZnVuY3Rpb24/IEknZCBhc3N1bWUgZnJvbSB0aGUgZnVuY3Rpb24ncyBuYW1lIHRoYXQgdGhpcyBp
c24ndCB0aGUKY2FzZT8KCkphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
