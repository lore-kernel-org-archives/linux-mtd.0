Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AD3C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 17:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAkN0J6PqgxzjEPqUQ8UxqqlPOhj5RykJjSbvPwv+sU=; b=d0ipLshOdLWF0/
	CzDTB1dMZBGkz2BYk9uP4UJc6MVmGiAPHoGdIeUhzJ3CvyNOSXnXCOZq4c3eShiPN7+74ttzNY1qQ
	n3GELP1LwpGgCWip/WfeD+Y41HfruH1OXZnZADIaP8werf28XXfkpQgJVQSNl2/k3KSWtoPgQHVkO
	SI+r7w+ojHFruMHIcwxaQoHEzDMaOILDgtyx+GsKA+7xBAaq0dGVKwva8faPlWAQW9sMfKyyrRkSe
	IrZsQbHvytTOJOSqxHweabau7ZsGwtKhe4rv2WgOCp3di4C16YM2NAz7x2vwXyQNomtfCyFIjd2hG
	i9fcURR7Bm/QL33mxqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ograZ-009z5f-PL; Fri, 07 Oct 2022 17:56:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ograV-009z2q-5E; Fri, 07 Oct 2022 17:56:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5F174B818F6;
	Fri,  7 Oct 2022 17:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63F0C433D7;
	Fri,  7 Oct 2022 17:56:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="f8gITOWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665165391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nK/H0hVDBIBg7GodmLmaWI9qS4fvsGkmZJoRHEB4Sqs=;
	b=f8gITOWuIwqHaHfAd2Ip5iMe8yRrocgJ4MTv+syk8BIYaorE//Q+fvXw/I7Wb9QIt67mY7
	sXmAQixgC0HtGsR77BaUpuASQ/P2J6ViTMRZs6w1NXyDA3Tn8jOyTwjjjCV8bnJYFxdwV5
	RGF0qzBCT4wpILO3WXYw3dx9t9cPRE4=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1a87e0a2 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 7 Oct 2022 17:56:31 +0000 (UTC)
Date: Fri, 7 Oct 2022 11:56:18 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Kees Cook <keescook@chromium.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
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
	Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v3 3/5] treewide: use get_random_u32() when possible
Message-ID: <Y0BoQmVauPLC2uW5@zx2c4.com>
References: <20221006165346.73159-1-Jason@zx2c4.com>
 <20221006165346.73159-4-Jason@zx2c4.com>
 <848ed24c-13ef-6c38-fd13-639b33809194@csgroup.eu>
 <CAHmME9raQ4E00r9r8NyWJ17iSXE_KniTG0onCNAfMmfcGar1eg@mail.gmail.com>
 <f10fcfbf-2da6-cf2d-6027-fbf8b52803e9@csgroup.eu>
 <6396875c-146a-acf5-dd9e-7f93ba1b4bc3@csgroup.eu>
 <CAHmME9pE4saqnwxhsAwt-xegYGjsavPOGnHCbZhUXD7kaJ+GAA@mail.gmail.com>
 <501b0fc3-6c67-657f-781e-25ee0283bc2e@csgroup.eu>
 <Y0Ayvov/KQmrIwTS@zx2c4.com>
 <202210071010.52C672FA9@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202210071010.52C672FA9@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_105643_499058_DF29F535 
X-CRM114-Status: GOOD (  43.78  )
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

T24gRnJpLCBPY3QgMDcsIDIwMjIgYXQgMTA6MTI6NDJBTSAtMDcwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IE9uIEZyaSwgT2N0IDA3LCAyMDIyIGF0IDA4OjA3OjU4QU0gLTA2MDAsIEphc29uIEEuIERv
bmVuZmVsZCB3cm90ZToKPiA+IE9uIEZyaSwgT2N0IDA3LCAyMDIyIGF0IDA0OjU3OjI0QU0gKzAw
MDAsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gPiA+IAo+ID4gPiAKPiA+ID4gTGUgMDcvMTAv
MjAyMiDDoCAwMTozNiwgSmFzb24gQS4gRG9uZW5mZWxkIGEgw6ljcml0wqA6Cj4gPiA+ID4gT24g
MTAvNi8yMiwgQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3
cm90ZToKPiA+ID4gPj4KPiA+ID4gPj4KPiA+ID4gPj4gTGUgMDYvMTAvMjAyMiDDoCAxOTozMSwg
Q2hyaXN0b3BoZSBMZXJveSBhIMOpY3JpdCA6Cj4gPiA+ID4+Pgo+ID4gPiA+Pj4KPiA+ID4gPj4+
IExlIDA2LzEwLzIwMjIgw6AgMTk6MjQsIEphc29uIEEuIERvbmVuZmVsZCBhIMOpY3JpdCA6Cj4g
PiA+ID4+Pj4gSGkgQ2hyaXN0b3BoZSwKPiA+ID4gPj4+Pgo+ID4gPiA+Pj4+IE9uIFRodSwgT2N0
IDYsIDIwMjIgYXQgMTE6MjEgQU0gQ2hyaXN0b3BoZSBMZXJveQo+ID4gPiA+Pj4+IDxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+ID4gPiA+Pj4+PiBMZSAwNi8xMC8yMDIyIMOg
IDE4OjUzLCBKYXNvbiBBLiBEb25lbmZlbGQgYSDDqWNyaXQgOgo+ID4gPiA+Pj4+Pj4gVGhlIHBy
YW5kb21fdTMyKCkgZnVuY3Rpb24gaGFzIGJlZW4gYSBkZXByZWNhdGVkIGlubGluZSB3cmFwcGVy
IGFyb3VuZAo+ID4gPiA+Pj4+Pj4gZ2V0X3JhbmRvbV91MzIoKSBmb3Igc2V2ZXJhbCByZWxlYXNl
cyBub3csIGFuZCBjb21waWxlcyBkb3duIHRvIHRoZQo+ID4gPiA+Pj4+Pj4gZXhhY3Qgc2FtZSBj
b2RlLiBSZXBsYWNlIHRoZSBkZXByZWNhdGVkIHdyYXBwZXIgd2l0aCBhIGRpcmVjdCBjYWxsIHRv
Cj4gPiA+ID4+Pj4+PiB0aGUgcmVhbCBmdW5jdGlvbi4gVGhlIHNhbWUgYWxzbyBhcHBsaWVzIHRv
IGdldF9yYW5kb21faW50KCksIHdoaWNoIGlzCj4gPiA+ID4+Pj4+PiBqdXN0IGEgd3JhcHBlciBh
cm91bmQgZ2V0X3JhbmRvbV91MzIoKS4KPiA+ID4gPj4+Pj4+Cj4gPiA+ID4+Pj4+PiBSZXZpZXdl
ZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4gPiA+ID4+Pj4+PiBBY2tl
ZC1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHRva2UuZGs+ICMgZm9yIHNjaF9j
YWtlCj4gPiA+ID4+Pj4+PiBBY2tlZC1ieTogQ2h1Y2sgTGV2ZXIgPGNodWNrLmxldmVyQG9yYWNs
ZS5jb20+ICMgZm9yIG5mc2QKPiA+ID4gPj4+Pj4+IFJldmlld2VkLWJ5OiBKYW4gS2FyYSA8amFj
a0BzdXNlLmN6PiAjIGZvciBleHQ0Cj4gPiA+ID4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBB
LiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNvbT4KPiA+ID4gPj4+Pj4+IC0tLQo+ID4gPiA+Pj4+
Pgo+ID4gPiA+Pj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvY2Vzcy5j
Cj4gPiA+ID4+Pj4+PiBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvY2Vzcy5jCj4gPiA+ID4+Pj4+
PiBpbmRleCAwZmJkYTg5Y2QxYmIuLjljNGMxNWFmYmJlOCAxMDA2NDQKPiA+ID4gPj4+Pj4+IC0t
LSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvY2Vzcy5jCj4gPiA+ID4+Pj4+PiArKysgYi9hcmNo
L3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYwo+ID4gPiA+Pj4+Pj4gQEAgLTIzMDgsNiArMjMwOCw2
IEBAIHZvaWQgbm90cmFjZSBfX3BwYzY0X3J1bmxhdGNoX29mZih2b2lkKQo+ID4gPiA+Pj4+Pj4g
ICAgIHVuc2lnbmVkIGxvbmcgYXJjaF9hbGlnbl9zdGFjayh1bnNpZ25lZCBsb25nIHNwKQo+ID4g
PiA+Pj4+Pj4gICAgIHsKPiA+ID4gPj4+Pj4+ICAgICAgICAgaWYgKCEoY3VycmVudC0+cGVyc29u
YWxpdHkgJiBBRERSX05PX1JBTkRPTUlaRSkgJiYKPiA+ID4gPj4+Pj4+IHJhbmRvbWl6ZV92YV9z
cGFjZSkKPiA+ID4gPj4+Pj4+IC0gICAgICAgICAgICAgc3AgLT0gZ2V0X3JhbmRvbV9pbnQoKSAm
IH5QQUdFX01BU0s7Cj4gPiA+ID4+Pj4+PiArICAgICAgICAgICAgIHNwIC09IGdldF9yYW5kb21f
dTMyKCkgJiB+UEFHRV9NQVNLOwo+ID4gPiA+Pj4+Pj4gICAgICAgICByZXR1cm4gc3AgJiB+MHhm
Owo+ID4gPiA+Pj4+Pgo+ID4gPiA+Pj4+PiBJc24ndCB0aGF0IGEgY2FuZGlkYXRlIGZvciBwcmFu
ZG9tX3UzMl9tYXgoKSA/Cj4gPiA+ID4+Pj4+Cj4gPiA+ID4+Pj4+IE5vdGUgdGhhdCBzcCBpcyBk
ZWVtZWQgdG8gYmUgMTYgYnl0ZXMgYWxpZ25lZCBhdCBhbGwgdGltZS4KPiA+ID4gPj4+Pgo+ID4g
PiA+Pj4+IFllcywgcHJvYmFibHkuIEl0IHNlZW1lZCBub24tdHJpdmlhbCB0byB0aGluayBhYm91
dCwgc28gSSBkaWRuJ3QuIEJ1dAo+ID4gPiA+Pj4+IGxldCdzIHNlZSBoZXJlLi4uIG1heWJlIGl0
J3Mgbm90IHRvbyBiYWQ6Cj4gPiA+ID4+Pj4KPiA+ID4gPj4+PiBJZiBQQUdFX01BU0sgaXMgYWx3
YXlzIH4oUEFHRV9TSVpFLTEpLCB0aGVuIH5QQUdFX01BU0sgaXMKPiA+ID4gPj4+PiAoUEFHRV9T
SVpFLTEpLCBzbyBwcmFuZG9tX3UzMl9tYXgoUEFHRV9TSVpFKSBzaG91bGQgeWllbGQgdGhlIHNh
bWUKPiA+ID4gPj4+PiB0aGluZz8gSXMgdGhhdCBhY2N1cmF0ZT8gQW5kIGhvbGRzIGFjcm9zcyBw
bGF0Zm9ybXMgKHRoaXMgY29tZXMgdXAgYQo+ID4gPiA+Pj4+IGZldyBwbGFjZXMpPyBJZiBzbywg
SSdsbCBkbyB0aGF0IGZvciBhIHY0Lgo+ID4gPiA+Pj4+Cj4gPiA+ID4+Pgo+ID4gPiA+Pj4gT24g
cG93ZXJwYyBpdCBpcyBhbHdheXMgKGZyb20gYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhZ2Uu
aCkgOgo+ID4gPiA+Pj4KPiA+ID4gPj4+IC8qCj4gPiA+ID4+PiAgICAqIFN1YnRsZTogKDEgPDwg
UEFHRV9TSElGVCkgaXMgYW4gaW50LCBub3QgYW4gdW5zaWduZWQgbG9uZy4gU28gaWYgd2UKPiA+
ID4gPj4+ICAgICogYXNzaWduIFBBR0VfTUFTSyB0byBhIGxhcmdlciB0eXBlIGl0IGdldHMgZXh0
ZW5kZWQgdGhlIHdheSB3ZSB3YW50Cj4gPiA+ID4+PiAgICAqIChpLmUuIHdpdGggMXMgaW4gdGhl
IGhpZ2ggYml0cykKPiA+ID4gPj4+ICAgICovCj4gPiA+ID4+PiAjZGVmaW5lIFBBR0VfTUFTSyAg
ICAgICh+KCgxIDw8IFBBR0VfU0hJRlQpIC0gMSkpCj4gPiA+ID4+Pgo+ID4gPiA+Pj4gI2RlZmlu
ZSBQQUdFX1NJWkUgICAgICAgICgxVUwgPDwgUEFHRV9TSElGVCkKPiA+ID4gPj4+Cj4gPiA+ID4+
Pgo+ID4gPiA+Pj4gU28gaXQgd291bGQgd29yayBJIGd1ZXNzLgo+ID4gPiA+Pgo+ID4gPiA+PiBC
dXQgdGFraW5nIGludG8gYWNjb3VudCB0aGF0IHNwIG11c3QgcmVtYWluIDE2IGJ5dGVzIGFsaWdu
ZWQsIHdvdWxkIGl0Cj4gPiA+ID4+IGJlIGJldHRlciB0byBkbyBzb21ldGhpbmcgbGlrZSA/Cj4g
PiA+ID4+Cj4gPiA+ID4+IAlzcCAtPSBwcmFuZG9tX3UzMl9tYXgoUEFHRV9TSVpFID4+IDQpIDw8
IDQ7Cj4gPiA+ID4+Cj4gPiA+ID4+IAlyZXR1cm4gc3A7Cj4gPiA+ID4gCj4gPiA+ID4gRG9lcyB0
aGlzIGFzc3VtZSB0aGF0IHNwIGlzIGFscmVhZHkgYWxpZ25lZCBhdCB0aGUgYmVnaW5uaW5nIG9m
IHRoZQo+ID4gPiA+IGZ1bmN0aW9uPyBJJ2QgYXNzdW1lIGZyb20gdGhlIGZ1bmN0aW9uJ3MgbmFt
ZSB0aGF0IHRoaXMgaXNuJ3QgdGhlCj4gPiA+ID4gY2FzZT8KPiA+ID4gCj4gPiA+IEFoIHlvdSBh
cmUgcmlnaHQsIEkgb3Zlcmxvb2tlZCBpdC4KPiA+IAo+ID4gU28gSSB0aGluayB0byBzdGF5IG9u
IHRoZSBzYWZlIHNpZGUsIEknbSBnb2luZyB0byBnbyB3aXRoCj4gPiBgcHJhbmRvbV91MzJfbWF4
KFBBR0VfU0laRSlgLiBTb3VuZCBnb29kPwo+IAo+IEdpdmVuIHRoZXNlIGtpbmRzIG9mIGxlc3Mg
bWVjaGFuaWNhbCBjaGFuZ2VzLCBpdCBtYXkgbWFrZSBzZW5zZSB0byBzcGxpdAo+IHRoZXNlIGZy
b20gdGhlICJ0cml2aWFsIiBjb252ZXJzaW9ucyBpbiBhIHRyZWV3aWRlIHBhdGNoLiBUaGUgY2hh
bmNlIG9mCj4gbmVlZGluZyBhIHJldmVydCBmcm9tIHRoZSBzaW1wbGUgMToxIGNvbnZlcnNpb25z
IGlzIG11Y2ggbG93ZXIgdGhhbiB0aGUKPiBuZWVkIHRvIHJldmVydCBieS1oYW5kIGNoYW5nZXMu
Cj4gCj4gVGhlIENvY2NpIHNjcmlwdCBJIHN1Z2dlc3RlZCBpbiBteSB2MSByZXZpZXcgZ2V0cyA4
MCUgb2YgdGhlIGZpcnN0Cj4gcGF0Y2gsIGZvciBleGFtcGxlLgoKSSdsbCBzcGxpdCB0aGluZ3Mg
dXAgaW50byBhIG1lY2hhbmljYWwgc3RlcCBhbmQgYSBub24tbWVjaGFuaWNhbCBzdGVwLgpHb29k
IGlkZWEuCgpKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
