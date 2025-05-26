Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B33C54FB3
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 09:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgnTt+B8LctEzgnvn5WB+x+QJeYwRZfDSPJCbzdH5DU=; b=dncseuEQ8mzs6N
	uatG+szn/xMvjPxOFnThwQbptWjpjT19uIqVx1EQ23cs8tSqIBBolSfLXxPejMHqFMXGV9i5Bi9+o
	QC4JCt9MdXjgYoYSmCpF4PkXu6YZJRhHK6MsFUXNQ/ou6RoAeqEZ+Ok0JtzeMWaHBq+VM2wLAFKow
	aUQl2aHlsIOzUXhj23WOYxaqHUVB5LRTde0GAwQyuAsnWBjdlk3vA34BGlxZtCPccSqpepVydYKla
	yKueUa+ixc4MhsAqwHyTifDeqnBrU3LZ/xGC5O1EgdqvVmNmgv2nzqzVsqKFk4Djve2bSblk9tgoC
	I87eCePn/zcrqZ+dt15g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJU7b-00000008VL0-3njm;
	Mon, 26 May 2025 09:27:51 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJU7Y-00000008VKY-0k2j
	for linux-mtd@lists.infradead.org;
	Mon, 26 May 2025 09:27:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F01B43256;
	Mon, 26 May 2025 09:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748251666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Opa0z6GUCpMMB0xKiw3CdjHTRvy78s9FU8V6fF56RAM=;
	b=EvXbi/X0RcTrPnKhu5//sNlbalc0CuLlG1QBS8zessNsqCpGsPkHpFbHUkBXMSBTyuiKjF
	nEbhvl7Sh9YORKhnBF3V5obwFFNFHQj0roo8LJN/Lk3Tt5JT/ARJiND67GqmYrZeScEeLn
	PfjEE/asaLQGu/+O0F/q0a6z6tBEk1JyGfl76ycOi/s7sqfk/+a+hr+9b0Tap1mCqX00jc
	2vsHMiNyOXQ4xtmXt7B0xeP4OvOZed7T+pPSvmI7EdEFYOgwnjYVlVejkeEz0Mj7P4CJ0H
	QO8YQbjuquJEbRBwabvQKcOM4bOd6beg7K133wAjF0s2GACKHrhPkeX38yKZ4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,  Md Sadre Alam
 <quic_mdalam@quicinc.com>,  Varadarajan Narayanan
 <quic_varada@quicinc.com>,  Sricharan Ramabadhran
 <quic_srichara@quicinc.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: nand: qpic_common: prevent out of bounds
 access of BAM arrays
In-Reply-To: <20250525-qpic-snand-avoid-mem-corruption-v1-2-5fe528def7fb@gmail.com>
	(Gabor Juhos's message of "Sun, 25 May 2025 19:05:36 +0200")
References: <20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com>
	<20250525-qpic-snand-avoid-mem-corruption-v1-2-5fe528def7fb@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 11:27:45 +0200
Message-ID: <87cybv2032.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeduieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepjhegghekhiejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepqhhuihgtpghmuggrlhgrmhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehquhhitggpvhgrrhgruggrsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepqhhuihgtpghsrhhitghhrghrrgesqhhuihgti
 hhntgdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_022748_823040_980DED8D 
X-CRM114-Status: GOOD (  25.57  )
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

SGkgR2Fib3IsCgpPbiAyNS8wNS8yMDI1IGF0IDE5OjA1OjM2ICswMiwgR2Fib3IgSnVob3MgPGo0
Zzh5N0BnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgY29tbW9uIFFQSUMgY29kZSBkb2VzIG5vdCBk
byBhbnkgYm91bmRhcnkgY2hlY2tpbmcgd2hlbiBpdCBoYW5kbGVzCj4gdGhlIGNvbW1hbmQgZWxl
bWVudHMgYW5kIHNjYXR0ZXIgZ2F0ZXIgbGlzdCBhcnJheXMgb2YgYSBCQU0gdHJhbnNhY3Rpb24s
Cj4gdGh1cyBpdCBhbGxvd3MgdG8gYWNjZXNzIG91dCBvZiBib3VuZHMgZWxlbWVudHMgaW4gdGhv
c2UuCj4KPiBBbHRob3VnaCBpdCBpcyB0aGUgcmVzcG9uc2liaWxpdHkgb2YgdGhlIGdpdmVuIGRy
aXZlciB0byBhbGxvY2F0ZSBlbm91Z2gKPiBzcGFjZSBmb3IgYWxsIHBvc3NpYmxlIEJBTSB0cmFu
c2FjdGlvbiB2YXJpYXRpb25zLCBob3dldmVyIHRoZXJlIGNhbiBiZQo+IG1pc3Rha2VzIGluIHRo
ZSBkcml2ZXIgY29kZSB3aGljaCBjYW4gbGVhZCB0byBoaWRkZW4gbWVtb3J5IGNvcnJ1cHRpb24K
PiBpc3N1ZXMgd2hpY2ggYXJlIGhhcmQgdG8gZGVidWcuCj4KPiBUaGlzIGtpbmQgb2YgcHJvYmxl
bSBoYXMgYmVlbiBvYnNlcnZlZCBkdXJpbmcgdGVzdGluZyB0aGUgJ3NwaS1xcGljLXNuYW5kJwo+
IGRyaXZlci4gQWx0aG91Z2ggdGhlIGRyaXZlciBoYXMgYmVlbiBmaXhlZCB3aXRoIGEgcHJlY2Vk
aW5nIHBhdGNoLCBidXQgaXQKPiBzdGlsbCBtYWtlcyBzZW5zZSB0byByZWR1Y2UgdGhlIGNoYW5j
ZSBvZiBoYXZpbmcgc3VjaCBlcnJvcnMgYWdhaW4gbGF0ZXIuCj4KPiBJbiBvcmRlciB0byBwcmV2
ZW50IHN1Y2ggZXJyb3JzLCBjaGFuZ2UgdGhlIHFjb21fYWxsb2NfYmFtX3RyYW5zYWN0aW9uKCkK
PiBmdW5jdGlvbiB0byBzdG9yZSB0aGUgbnVtYmVyIG9mIGVsZW1lbnRzIG9mIHRoZSBhcnJheXMg
aW4gdGhlCj4gJ2JhbV90cmFuc2FjdGlvbicgc3RydWN1dHJlIGR1cmluZyBhbGxvY2F0aW9uLiBB
bHNvLCBhZGQgc2FuaXR5IGNoZWNrcyB0bwo+IHRoZSBxY29tX3ByZXBfYmFtX2RtYV9kZXNjX3tj
bWQsZGF0YX0oKSBmdW5jdGlvbnMgdG8gYXZvaWQgdXNpbmcgb3V0IG9mCj4gYm91bmRzIGluZGlj
ZXMgZm9yIHRoZSBhcnJheXMuCj4KPiBUZXN0ZWQgd2l0aCB0aGUgJ3NwaS1xcGljLXNuYW5kJyBk
cml2ZXIgb25seS4KPgo+IFNpZ25lZC1vZmYtYnk6IEdhYm9yIEp1aG9zIDxqNGc4eTdAZ21haWwu
Y29tPgo+IC0tLQo+IFByZWZlcmFibHksIHRoaXMgc2hvdWxkIGdvIGluIHZpYSB0aGUgU1BJIHRy
ZWUgYWxvbmcgd2l0aCB0aGUgcHJldmlvdXMKPiBwYXRjaC4gSXQgaXMgbm90IGEgc3RyaWN0IHJl
cXVpcmVtZW50IHRob3VnaCwgaW4gdGhlIGNhc2UgaXQgZ2V0cwo+IGluY2x1ZGVkIHNlcGFyYXRl
bHkgdGhyb3VnaCB0aGUgbXRkIHRyZWUgaXQgcmV2ZWFscyB0aGUgYnVnIGZpeGVkIGluCj4gdGhl
IGZpcnN0IHBhdGNoLgoKU29ycnksIGRpZG4ndCBzZWUgdGhhdCBpbiB0aGUgZmlyc3QgcGxhY2Uu
IEZpbmUgYnkgbWUuCgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3FwaWNfY29tbW9uLmMgICAg
ICAgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKystLS0tCj4gIGluY2x1ZGUvbGludXgvbXRk
L25hbmQtcXBpYy1jb21tb24uaCB8ICA4ICsrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzIg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3FwaWNfY29tbW9uLmMgYi9kcml2ZXJzL210ZC9uYW5kL3FwaWNfY29tbW9uLmMKPiBp
bmRleCBlMGVkMjViNWFmZWE5YjI4OWI3NjdjZDNkOWMyZDc1NzJlZDUyMDA4Li5mYjFmODFlNGJk
YWNhYTNlODE2NjBhMjBlMTY0OTI2YzY0NjMzNTEzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvcXBpY19jb21tb24uYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcXBpY19jb21tb24u
Ywo+IEBAIC0xNSw2ICsxNSwxMyBAQAo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICAjaW5j
bHVkZSA8bGludXgvbXRkL25hbmQtcXBpYy1jb21tb24uaD4KPiAgCj4gK3N0YXRpYyBpbmxpbmUg
aW50IHFjb21fZXJyX2JhbV9hcnJheV9mdWxsKHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAq
bmFuZGMsCj4gKwkJCQkJICBjb25zdCBjaGFyICpuYW1lKQo+ICt7Cj4gKwlkZXZfZXJyKG5hbmRj
LT5kZXYsICJCQU0gJXMgYXJyYXkgaXMgZnVsbFxuIiwgbmFtZSk7Cj4gKwlyZXR1cm4gLUVJTlZB
TDsKPiArfQoKVGhpcyBpcyByYXRoZXIgdW5jb21tb24sIEkgZG9uJ3Qga25vdyBpZiBpdCdzIHZl
cnkgcmVsZXZhbnQgdG8gZG8KdGhhdC4gUGxlYXNlIGRyb3AgdGhpcyBzdGF0aWMgaW5saW5lIGZ1
bmN0aW9uLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
