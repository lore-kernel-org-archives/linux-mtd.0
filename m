Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DEEC433FE
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Oct 2022 01:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8u6LFoM+YL2drLVZnqugXSYOvkv0fuq8aMfr60DLPM=; b=sX6c5nQi+F9CQv
	FCB9JPyFVT7W1+0ZKKbiiTPRghG2tdLT940ghSjRVHWZOwKxQ1WZhfHVHNnEp9uTTVaUzagzLgsBf
	CAnsbjGev0qxGMLz6duBurl1BlXlecO/+Laf8xff75E9mTYsZsqgQIc8Y35laW5peMPEtnVyjOfuB
	uJUSpTsGZVWxWGVCN9QWERz/KIMoNq5KrDF8jRQIpFJsbjJS70ufWL2QXC2pvIlBLayVXxFCPSdPw
	TFgucfoNqmUiNLLHZ8/Jle1y65OAYQG8qhz4VYR09aNNXxPrP9Kwx4DE/HeCigNHY/wiUtX5I8cBv
	dn9Zrf4+lRB2V+6Hhe+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogyef-00BHvM-CY; Sat, 08 Oct 2022 01:29:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogyeb-00BHtR-HJ; Sat, 08 Oct 2022 01:29:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 880ACCE1926;
	Sat,  8 Oct 2022 01:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C01C433C1;
	Sat,  8 Oct 2022 01:29:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="F0WFV840"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665192550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2a2X1YlfkZ0pGgKe1BT3qPauqYJUuDonzfwdbODwUj0=;
	b=F0WFV8408bfDyb840yWHYb2sS5Uszq0PMkkmtmrVRBUNL2FY49DLuZ3A8VZX01cjH92PRw
	963/yLDTfSbPjK9v/cSx6ClQtvwOaP31xlyhs5+LtAOzyMXtRqv5atZ8HOk8wnFIOFKYJl
	weXSG5WPTsM48QIVGdJf4b19sbZPAzo=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 08b122db (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 8 Oct 2022 01:29:09 +0000 (UTC)
Date: Fri, 7 Oct 2022 19:28:59 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	Andreas Noever <andreas.noever@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Christoph Hellwig <hch@lst.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
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
	KP Singh <kpsingh@kernel.org>, Kees Cook <keescook@chromium.org>,
	Marco Elver <elver@google.com>,
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
	Yury Norov <yury.norov@gmail.com>, dri-devel@lists.freedesktop.org,
	kasan-dev@googlegroups.com, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-parisc@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v4 2/6] treewide: use prandom_u32_max() when possible
Message-ID: <Y0DSW4AAX/yA3CdI@zx2c4.com>
References: <20221007180107.216067-1-Jason@zx2c4.com>
 <20221007180107.216067-3-Jason@zx2c4.com>
 <Y0CXYjV8qMpJxxBa@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0CXYjV8qMpJxxBa@magnolia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_182925_941137_D0C9E976 
X-CRM114-Status: GOOD (  29.64  )
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

T24gRnJpLCBPY3QgMDcsIDIwMjIgYXQgMDI6MTc6MjJQTSAtMDcwMCwgRGFycmljayBKLiBXb25n
IHdyb3RlOgo+IE9uIEZyaSwgT2N0IDA3LCAyMDIyIGF0IDEyOjAxOjAzUE0gLTA2MDAsIEphc29u
IEEuIERvbmVuZmVsZCB3cm90ZToKPiA+IFJhdGhlciB0aGFuIGluY3VycmluZyBhIGRpdmlzaW9u
IG9yIHJlcXVlc3RpbmcgdG9vIG1hbnkgcmFuZG9tIGJ5dGVzIGZvcgo+ID4gdGhlIGdpdmVuIHJh
bmdlLCB1c2UgdGhlIHByYW5kb21fdTMyX21heCgpIGZ1bmN0aW9uLCB3aGljaCBvbmx5IHRha2Vz
Cj4gPiB0aGUgbWluaW11bSByZXF1aXJlZCBieXRlcyBmcm9tIHRoZSBSTkcgYW5kIGF2b2lkcyBk
aXZpc2lvbnMuCj4gPiAKPiA+IFJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9t
aXVtLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBLUCBTaW5naCA8a3BzaW5naEBrZXJuZWwub3JnPgo+
ID4gUmV2aWV3ZWQtYnk6IENocmlzdG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0b3BoLmJvZWhtd2Fs
ZGVyQGxpbmJpdC5jb20+ICMgZm9yIGRyYmQKPiA+IFJldmlld2VkLWJ5OiBKYW4gS2FyYSA8amFj
a0BzdXNlLmN6PiAjIGZvciBleHQyLCBleHQ0LCBhbmQgc2JpdG1hcAo+ID4gU2lnbmVkLW9mZi1i
eTogSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+Cj4gPiAtLS0KPiAKPiA8c25p
cCwgc2tpcCB0byB0aGUgeGZzIHBhcnQ+Cj4gCj4gPiBkaWZmIC0tZ2l0IGEvZnMveGZzL2xpYnhm
cy94ZnNfYWxsb2MuYyBiL2ZzL3hmcy9saWJ4ZnMveGZzX2FsbG9jLmMKPiA+IGluZGV4IGUyYmRm
MDg5YzBhMy4uNjI2MTU5OWJiMzg5IDEwMDY0NAo+ID4gLS0tIGEvZnMveGZzL2xpYnhmcy94ZnNf
YWxsb2MuYwo+ID4gKysrIGIvZnMveGZzL2xpYnhmcy94ZnNfYWxsb2MuYwo+ID4gQEAgLTE1MjAs
NyArMTUyMCw3IEBAIHhmc19hbGxvY19hZ192ZXh0ZW50X2xhc3RibG9jaygKPiA+ICAKPiA+ICAj
aWZkZWYgREVCVUcKPiA+ICAJLyogUmFuZG9tbHkgZG9uJ3QgZXhlY3V0ZSB0aGUgZmlyc3QgYWxn
b3JpdGhtLiAqLwo+ID4gLQlpZiAocHJhbmRvbV91MzIoKSAmIDEpCj4gPiArCWlmIChwcmFuZG9t
X3UzMl9tYXgoMikpCj4gCj4gSSB3b25kZXIgaWYgdGhlc2UgdXNlY2FzZXMgKHBpY2tpbmcgMCBv
ciAxIHJhbmRvbWx5KSBvdWdodCB0byBoYXZlIGEKPiB0cml2aWFsIHdyYXBwZXIgdG8gbWFrZSBp
dCBtb3JlIG9idmlvdXMgdGhhdCB3ZSB3YW50IGJvb2xlYW4gc2VtYW50aWNzOgo+IAo+IHN0YXRp
YyBpbmxpbmUgYm9vbCBwcmFuZG9tX2Jvb2wodm9pZCkKPiB7Cj4gCXJldHVybiBwcmFuZG9tX3Uz
Ml9tYXgoMik7Cj4gfQo+IAo+IAlpZiAocHJhbmRvbV9ib29sKCkpCj4gCQl1c2VfY3JhenlfYWxn
b3JpdGhtKC4uLik7Cj4gCgpZZWEsIEkndmUgaGFkIGEgbG90IG9mIHNpbWlsYXIgaWRlYXMgdGhl
cmUuIFBhcnQgb2YgZG9pbmcgdGhpcyAoaW5pdGlhbCkKcGF0Y2hzZXQgaXMgdG8gZ2V0IGFuIGlu
dHVpdGl2ZSBzZW5zZSBvZiB3aGF0J3MgYWN0dWFsbHkgdXNlZCBhbmQgaG93Cm9mdGVuLiBPbiBt
eSBsaXN0IGZvciBpbnZlc3RpZ2F0aW9uIGFyZSBhIGdldF9yYW5kb21fdTMyX21heCgpIHRvIHJl
dHVybgp1bmlmb3JtIG51bWJlcnMgYnkgcmVqZWN0aW9uIHNhbXBsaW5nIChwcmFuZG9tX3UzMl9t
YXgoKSBkb2Vzbid0IGRvCnRoYXQgdW5pZm9ybWx5KSBhbmQgYWRkaW5nIGEgZnVuY3Rpb24gZm9y
IGJvb2xlYW5zIG9yIGJpdHMgPCA4LiBQb3NzaWJsZQppZGVhcyBmb3IgdGhlIGxhdHRlciBpbmNs
dWRlOgoKICAgYm9vbCBnZXRfcmFuZG9tX2Jvb2wodm9pZCk7CiAgIGJvb2wgZ2V0X3JhbmRvbV9i
b29sKHVuc2lnbmVkIGludCBwcm9iYWJpbGl0eSk7CiAgIGJvb2wgZ2V0X3JhbmRvbV9iaXRzKHU4
IGJpdHNfbGVzc190aGFuX2VpZ2h0KTsKCldpdGggdGhlIGNvcmUgb2YgYWxsIG9mIHRob3NlIGlu
dm9sdmluZyB0aGUgc2FtZSBiYXRjaGluZyBhcyB0aGUgY3VycmVudApnZXRfcmFuZG9tX3V7OCwx
NiwzMiw2NH0oKSBmdW5jdGlvbnMsIGJ1dCBhbHNvIGJ1ZmZlcmluZyB0aGUgbGF0ZXN0IGJ5dGUK
YW5kIG1hbmFnaW5nIGhvdyBtYW55IGJpdHMgYXJlIGxlZnQgaW4gaXQgdGhhdCBoYXZlbid0IGJl
ZW4gc2hpZnRlZCBvdXQKeWV0LgoKU28gQVBJLXdpc2UsIHRoZXJlIGFyZSBhIGZldyB3YXlzIHRv
IGdvLCBzbyBob3BlZnVsbHkgdGhpcyBzZXJpZXMgd2lsbApzdGFydCB0byBnaXZlIGEgZ29vZCBw
aWN0dXJlIG9mIHdoYXQncyBuZWVkZWQuCgpPbmUgdGhpbmcgSSd2ZSBub3RpY2VkIGlzIHRoYXQg
bW9zdCBvZiB0aGUgcHJhbmRvbV91MzJfbWF4KDIpCmludm9jYXRpb25zIGFyZSBpbiBkZWJ1ZyBv
ciB0ZXN0IGNvZGUsIHNvIHRoYXQgZG9lc24ndCBuZWVkIHRvIGJlCm9wdGltaXplZC4gQnV0IGtm
ZW5jZSBkb2VzIHRoYXQgdG9vIGluIGl0cyBob3QgcGF0aCwgc28gYQpnZXRfcmFuZG9tX2Jvb2wo
KSBmdW5jdGlvbiB0aGVyZSB3b3VsZCBpbiB0aGVvcnkgbGVhZCB0byBhbiA4eCBzcGVlZC11cC4K
QnV0IEkgZ3Vlc3MgSSBqdXN0IGhhdmUgdG8gdHJ5IHNvbWUgdGhpbmdzIGFuZCBzZWUuCgpBbnl3
YXksIHRoYXQgaXMgYSBsb25nIHdheSB0byBzYXksIEkgc2hhcmUgeW91IGN1cmlvc2l0eSBvbiB0
aGUgbWF0dGVyCmFuZCBJJ20gbG9va2luZyBpbnRvIGl0LgoKSmFzb24KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
