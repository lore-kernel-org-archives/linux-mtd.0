Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76936C83013
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jul 2025 07:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/hADb0fyWY1KlmuJxakEaps1/var8rhUs5piLKVvVM=; b=0vELLXbTv/1hRK
	GX5MYTDtSPXkleaNJcdqYn5wHzDisSfU9tTaq/xFOn/5OL4vrCL4AaAd+KM23vomQmYWW+m7JMyfT
	LeygYhQzEvf8PcOgA/t+E6slVWNzHrGjXvJgeX4UB/Lyb6UoQtRduTojVo81TY7JebWPtPqi9FZNG
	PyJTM3VkuxkKvcXIGlovJWc4cGx4YQQSUJZ1AIO+QtaXIOBr7GkaMCsF0Njt/dBosQOlUqfTek6ie
	I/7vR8ugQKetL46kWKnocpcj33+ImEefj88DTDgP3vCVWC8yk/lqj7ZGQSEf5IOHx1m1QFrzDOGqh
	YEJ+XYHg69aq30D6H9ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsDP-00000007XOi-3vFq;
	Wed, 02 Jul 2025 07:49:11 +0000
Received: from relay16.mail.gandi.net ([2001:4b98:dc4:8::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsCS-00000007XI4-2cPe
	for linux-mtd@lists.infradead.org;
	Wed, 02 Jul 2025 07:48:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE69F449E7;
	Wed,  2 Jul 2025 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751442489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FjGikRjaB+jO1uDjOO0DjL+ti5fz5Aw/2bvXKkr4ak4=;
	b=OwIxVvlZy5LxGK4FXI4zX/t+d9G0wKbfB3U8Du/5RVNNCOyIa38P4SPyY4yBlpGZ0AC9eL
	voNgIzfSQEqP9qLa22x2wjPykl46YEIiuh2Xhupo51qzUmXzQi9utPiCazlbQ0iBeisnwp
	PtNYqJrFh3cKII6ij0iu433zX+5tI4lDnGB8gbi2nrT3zLcnSBzU+uPZR/VYlj8oOGastt
	9djwEeNezT70Ce0uxU8q7VTUqlYJdUg5h3rhlnOYbm6soUg31p1st1hbV7LlF2AwX1tmT6
	BkSnHpqmNsPi04gOg99iBjZcks1yGSLDZ2mPVlRFsTG+JGP2zbjrLxpHQenowg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-mtd@lists.infradead.org,
  linux-renesas-soc@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: renesas: Add missing check after DMA map
In-Reply-To: <20250702071722.24921-3-fourier.thomas@gmail.com> (Thomas
	Fourier's message of "Wed, 2 Jul 2025 09:17:22 +0200")
References: <20250702071722.24921-3-fourier.thomas@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 02 Jul 2025 09:48:07 +0200
Message-ID: <878ql7nidk.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehfohhurhhivghrrdhthhhomhgrshesghhmrghilhdrtghomhdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpt
 hhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_004813_113737_F3FCA1FD 
X-CRM114-Status: GOOD (  12.32  )
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

SGkgVGhvbWFzLAoKT24gMDIvMDcvMjAyNSBhdCAwOToxNzoyMiArMDIsIFRob21hcyBGb3VyaWVy
IDxmb3VyaWVyLnRob21hc0BnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgRE1BIG1hcCBmdW5jdGlv
bnMgY2FuIGZhaWwgYW5kIHNob3VsZCBiZSB0ZXN0ZWQgZm9yIGVycm9ycy4KPgo+IEZpeGVzOiBk
ODcwMWZlODkwZWMgKCJtdGQ6IHJhd25hbmQ6IHJlbmVzYXM6IEFkZCBuZXcgTkFORCBjb250cm9s
bGVyIGRyaXZlciIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgRm91cmllciA8Zm91cmllci50aG9tYXNAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9yZW5lc2FzLW5hbmQtY29udHJvbGxlci5jIHwgOCArKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcmVuZXNhcy1uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3JlbmVzYXMtbmFuZC1jb250cm9sbGVyLmMKPiBpbmRleCA0NGY2NjAzNzM2ZDEuLmY0
YTc3NTU3MTczMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9yZW5lc2FzLW5h
bmQtY29udHJvbGxlci5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcmVuZXNhcy1uYW5k
LWNvbnRyb2xsZXIuYwo+IEBAIC00MjYsNiArNDI2LDEwIEBAIHN0YXRpYyBpbnQgcm5hbmRjX3Jl
YWRfcGFnZV9od19lY2Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdTggKmJ1ZiwKPiAgCS8qIENv
bmZpZ3VyZSBETUEgKi8KPiAgCWRtYV9hZGRyID0gZG1hX21hcF9zaW5nbGUocm5hbmRjLT5kZXYs
IHJuYW5kYy0+YnVmLCBtdGQtPndyaXRlc2l6ZSwKPiAgCQkJCSAgRE1BX0ZST01fREVWSUNFKTsK
PiArCWlmIChkbWFfbWFwcGluZ19lcnJvcihybmFuZGMtPmRldiwgZG1hX2FkZHIpKSB7Cj4gKwkJ
ZGV2X2VycihybmFuZGMtPmRldiwgIkRNQSBtYXBwaW5nIGZhaWxlZC5cbiIpOwoKVGhpcyBlcnJv
ciBtZXNzYWdlIGlzIG5vdCBpbmZvcm1hdGl2ZSwgcGxlYXNlIGRyb3AKaXQuIGRtYV9tYXBwaW5n
X2Vycm9yKCkgZG9lcyBnaXZlIG1vcmUgaW5mb3JtYXRpb24gaWYgeW91IGVuYWJsZSBzb21lCkRN
QSBERUJVRyBLY29uZmlnIHN5bWJvbCBhbHJlYWR5LgoKPiArCQlyZXR1cm4gLUVOT01FTTsKPiAr
CX0KPiAgCXdyaXRlbChkbWFfYWRkciwgcm5hbmRjLT5yZWdzICsgRE1BX0FERFJfTE9XX1JFRyk7
Cj4gIAl3cml0ZWwobXRkLT53cml0ZXNpemUsIHJuYW5kYy0+cmVncyArIERNQV9DTlRfUkVHKTsK
PiAgCXdyaXRlbChETUFfVExWTF9NQVgsIHJuYW5kYy0+cmVncyArIERNQV9UTFZMX1JFRyk7Cj4g
QEAgLTYwNiw2ICs2MTAsMTAgQEAgc3RhdGljIGludCBybmFuZGNfd3JpdGVfcGFnZV9od19lY2Mo
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3QgdTggKmJ1ZiwKPiAgCS8qIENvbmZpZ3VyZSBE
TUEgKi8KPiAgCWRtYV9hZGRyID0gZG1hX21hcF9zaW5nbGUocm5hbmRjLT5kZXYsICh2b2lkICop
cm5hbmRjLT5idWYsIG10ZC0+d3JpdGVzaXplLAo+ICAJCQkJICBETUFfVE9fREVWSUNFKTsKPiAr
CWlmIChkbWFfbWFwcGluZ19lcnJvcihybmFuZGMtPmRldiwgZG1hX2FkZHIpKSB7Cj4gKwkJZGV2
X2VycihybmFuZGMtPmRldiwgIkRNQSBtYXBwaW5nIGZhaWxlZC5cbiIpOwoKRGl0dG8uCgo+ICsJ
CXJldHVybiAtRU5PTUVNOwo+ICsJfQo+ICAJd3JpdGVsKGRtYV9hZGRyLCBybmFuZGMtPnJlZ3Mg
KyBETUFfQUREUl9MT1dfUkVHKTsKPiAgCXdyaXRlbChtdGQtPndyaXRlc2l6ZSwgcm5hbmRjLT5y
ZWdzICsgRE1BX0NOVF9SRUcpOwo+ICAJd3JpdGVsKERNQV9UTFZMX01BWCwgcm5hbmRjLT5yZWdz
ICsgRE1BX1RMVkxfUkVHKTsKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
