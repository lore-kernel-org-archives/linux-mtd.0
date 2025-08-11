Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D8BC87FD2
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 06:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOHc9W+L2DnwGsV9hsNF3fdCVjsczVEAyD4+cqaqOXI=; b=z61YUV+1L3B45t
	VTdlKgCfeApTZptyjCMVBwidRlOeqLO+bw1SCD9zhPk5AISXESixm5Tq9AAmIczcpN3xY1bJhlyCT
	kqZvGLdyBBj+Of2frKBQy3g7MzUcAUKlaUq8K8PpuhXWRCk1WOOTY45R5GuHsXElKZkOp1ueOqIVV
	1S04SJ6ySE6HwFjmlV3ADlcaZo9DwH98Zsg7/hG/bhn3tLRM1sjHbKCKXgQtE5sV30MI4PH8sLQWO
	Qdxx8jAvZBJT7u+mPl+/JipG/YZ6tnzUdX5IzlTyU7Qzo9NQq+7hh9fxNkjs2LMUrnshg2JRRVXFd
	veISKKj7cwFATAcqc6KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulMAG-00000006cD9-0yzz;
	Mon, 11 Aug 2025 06:37:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulMAE-00000006cCj-0XQ7
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 06:37:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47C9F45244
	for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 06:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A830C4CEF6
	for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 06:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754894265;
	bh=7d8t96b0qezUmXbQCCOoNOM2QKR/WsFqklcLiZwHGPA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zp5dLXu+Lq/q5B8Okvor9u08lpxr+S+HVBhmpMPd80dtJr1sFHquR6PDKVi2+AZmn
	 uhcjbvWUigWIavAXi7mNszMvkQ1iugom96haN6Unb56Xbw5EtGNljF1vcQJXEHH5Pl
	 ifJB0Ely/hijj0/aXhXTBk5CQlOtilYJokdVI9sJC1KM4khk17lXKKPkCwg/NqoLVD
	 kwx9QW7NxCZY682bOmlQIj31P0T+1hZvl+Zyp6Dm/8W3/Eovid9plWakw7Eyw35Kt7
	 3rgjbjIkCZeufls/05fsLSmF10c5j1zBJ2RUzkXAdYyIn1ejIDQVwa8hRNqKsbcbk7
	 +2zV2W+eJuzhg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61568fbed16so6253799a12.3
        for <linux-mtd@lists.infradead.org>; Sun, 10 Aug 2025 23:37:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEvKlxV3NJOghFg6JyOJayIT0XB+LUqNFG/HEWaYR+KIam5iZ6ndUjfIHyzPDm5eqNtKf6yD2vm74=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdi9Q39H5RrvFSMUoGtzh2IS/+1+IqAC0esiyZYjNHzHBbKgYz
	HteIJWhYDiKgtlk5/PgxhIJRfjW3Xr1Xdj8PCRv6/b5WV6I+/MibkW9h5O28DiVr51dm9BECwHk
	svblYAj0sO3uNE9GfypMHqYD+jwVqIeU=
X-Google-Smtp-Source: AGHT+IGfEMnAcApCso1Pq2FL+AFwDit+/6rHiFN1Xv32lctHH6W1GNaPJ2XUoinBbz1h7eQmwl0i3f08hpe/cuPyR80=
X-Received: by 2002:a17:907:86a0:b0:af9:621f:c219 with SMTP id
 a640c23a62f3a-af9c6525a5cmr1030367866b.51.1754894263682; Sun, 10 Aug 2025
 23:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <6b6ddac4728d3debcf2dbb7db82c6b69f9b4956f.1754890670.git.zhoubinbin@loongson.cn>
In-Reply-To: <6b6ddac4728d3debcf2dbb7db82c6b69f9b4956f.1754890670.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 11 Aug 2025 14:37:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H49xGqd-Y+ffwwwVaES5ZGoCWp2dN_tSETFtBjsjgbC9A@mail.gmail.com>
X-Gm-Features: Ac12FXxbTT750dgKQ0qF-YxJ472Kiw5CWbv592pJMs2LDxPid6stBAPMaKfL9uI
Message-ID: <CAAhV-H49xGqd-Y+ffwwwVaES5ZGoCWp2dN_tSETFtBjsjgbC9A@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] mtd: rawnand: loongson: Add 6-byte NAND ID reading support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_233746_205546_62C1FF80 
X-CRM114-Status: GOOD (  22.55  )
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

SGksIEJpbmJpbiwKCk9uIE1vbiwgQXVnIDExLCAyMDI1IGF0IDI6MDLigK9QTSBCaW5iaW4gWmhv
dSA8emhvdWJpbmJpbkBsb29uZ3Nvbi5jbj4gd3JvdGU6Cj4KPiBGcm9tOiBLZWd1YW5nIFpoYW5n
IDxrZWd1YW5nLnpoYW5nQGdtYWlsLmNvbT4KPgo+IExvb25nc29uLTFDIGFuZCBMb29uZ3Nvbi0y
SyBTb0NzIHN1cHBvcnQgTkFORCBmbGFzaCBjaGlwcyB3aXRoIDYtYnl0ZSBJRC4KPiBIb3dldmVy
LCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBvbmx5IGhhbmRsZXMgNS1ieXRlIElEIHdoaWNo
IGNhbiBsZWFkCj4gdG8gaW5jb3JyZWN0IGNoaXAgZGV0ZWN0aW9uLgo+Cj4gRXh0ZW5kIGxvb25n
c29uX25hbmRfcmVhZF9pZF90eXBlX2V4ZWMoKSB0byBzdXBwb3J0IDYtYnl0ZSBOQU5EIElELgo+
Cj4gU2lnbmVkLW9mZi1ieTogS2VndWFuZyBaaGFuZyA8a2VndWFuZy56aGFuZ0BnbWFpbC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogQmluYmluIFpob3UgPHpob3ViaW5iaW5AbG9vbmdzb24uY24+Cj4g
LS0tCj4gIC4uLi9tdGQvbmFuZC9yYXcvbG9vbmdzb24tbmFuZC1jb250cm9sbGVyLmMgICB8IDI5
ICsrKysrKysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9v
bmdzb24tbmFuZC1jb250cm9sbGVyLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9sb29uZ3Nvbi1u
YW5kLWNvbnRyb2xsZXIuYwo+IGluZGV4IGI1YTdiZTBmY2FjYy4uOTdjZDU2NjQyMGE4IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2xvb25nc29uLW5hbmQtY29udHJvbGxlci5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9vbmdzb24tbmFuZC1jb250cm9sbGVyLmMK
PiBAQCAtNTAsNiArNTAsOSBAQAo+ICAjZGVmaW5lIExPT05HU09OX05BTkRfQ09MX0FERFJfQ1lD
ICAgICAyVQo+ICAjZGVmaW5lIExPT05HU09OX05BTkRfTUFYX0FERFJfQ1lDICAgICA1VQo+Cj4g
KyNkZWZpbmUgTE9PTkdTT05fTkFORF9SRUFEX0lEX1NMRUVQX1VTICAgICAgICAgMTAwMAo+ICsj
ZGVmaW5lIExPT05HU09OX05BTkRfUkVBRF9JRF9USU1FT1VUX1VTICAgICAgIDUwMDAKPiArCj4g
ICNkZWZpbmUgQklUU19QRVJfV09SRCAgICAgICAgICAgICAgICAgICg0ICogQklUU19QRVJfQllU
RSkKPgo+ICBzdHJ1Y3QgbG9vbmdzb25fbmFuZF9ob3N0Owo+IEBAIC03Myw2ICs3Niw4IEBAIHN0
cnVjdCBsb29uZ3Nvbl9uYW5kX29wIHsKPiAgfTsKPgo+ICBzdHJ1Y3QgbG9vbmdzb25fbmFuZF9k
YXRhIHsKPiArICAgICAgIHVuc2lnbmVkIGludCBtYXhfaWRfY3ljbGU7Cj4gKyAgICAgICB1bnNp
Z25lZCBpbnQgaWRfY3ljbGVfZmllbGQ7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgc3RhdHVzX2Zp
ZWxkOwo+ICAgICAgICAgdW5zaWduZWQgaW50IG9wX3Njb3BlX2ZpZWxkOwo+ICAgICAgICAgdW5z
aWduZWQgaW50IGhvbGRfY3ljbGU7Cj4gQEAgLTQ1OCwxMCArNDYzLDEwIEBAIHN0YXRpYyBpbnQg
bG9vbmdzb25fbmFuZF9yZWFkX2lkX3R5cGVfZXhlYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBj
b25zdCBzdHJ1Y3QKPiAgICAgICAgIHN0cnVjdCBsb29uZ3Nvbl9uYW5kX29wIG9wID0ge307Cj4g
ICAgICAgICBpbnQgaSwgcmV0Owo+ICAgICAgICAgdW5pb24gewo+IC0gICAgICAgICAgICAgICBj
aGFyIGlkc1s1XTsKPiArICAgICAgICAgICAgICAgY2hhciBpZHNbNl07Cj4gICAgICAgICAgICAg
ICAgIHN0cnVjdCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaW50IGlkbDsKPiAtICAgICAg
ICAgICAgICAgICAgICAgICBjaGFyIGlkaDsKPiArICAgICAgICAgICAgICAgICAgICAgICB1MTYg
aWRoOwo+ICAgICAgICAgICAgICAgICB9Owo+ICAgICAgICAgfSBuYW5kX2lkOwo+Cj4gQEAgLTQ2
OSwxMSArNDc0LDE2IEBAIHN0YXRpYyBpbnQgbG9vbmdzb25fbmFuZF9yZWFkX2lkX3R5cGVfZXhl
YyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCBzdHJ1Y3QKPiAgICAgICAgIGlmIChyZXQp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiAtICAgICAgIG5hbmRfaWQuaWRsID0g
cmVhZGwoaG9zdC0+cmVnX2Jhc2UgKyBMT09OR1NPTl9OQU5EX0lETCk7Cj4gLSAgICAgICBuYW5k
X2lkLmlkaCA9IHJlYWRiKGhvc3QtPnJlZ19iYXNlICsgTE9PTkdTT05fTkFORF9JREhfU1RBVFVT
KTsKPiArICAgICAgIHJldCA9IHJlZ21hcF9yZWFkX3BvbGxfdGltZW91dChob3N0LT5yZWdtYXAs
IExPT05HU09OX05BTkRfSURMLCBuYW5kX2lkLmlkbCwgbmFuZF9pZC5pZGwsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTE9PTkdTT05fTkFORF9SRUFEX0lEX1NMRUVQ
X1VTLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIExPT05HU09OX05B
TkRfUkVBRF9JRF9USU1FT1VUX1VTKTsKVGhlIGxhc3QgdHdvIGxpbmVzIGNhbiBiZSBtZXJnZWQu
CgpIdWFjYWkKCj4gKyAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0
Owo+Cj4gLSAgICAgICBmb3IgKGkgPSAwOyBpIDwgbWluKHNpemVvZihuYW5kX2lkLmlkcyksIG9w
Lm9yaWdfbGVuKTsgaSsrKQo+IC0gICAgICAgICAgICAgICBvcC5idWZbaV0gPSBuYW5kX2lkLmlk
c1tzaXplb2YobmFuZF9pZC5pZHMpIC0gMSAtIGldOwo+ICsgICAgICAgbmFuZF9pZC5pZGggPSBy
ZWFkdyhob3N0LT5yZWdfYmFzZSArIExPT05HU09OX05BTkRfSURIX1NUQVRVUyk7Cj4gKwo+ICsg
ICAgICAgZm9yIChpID0gMDsgaSA8IG1pbihob3N0LT5kYXRhLT5tYXhfaWRfY3ljbGUsIG9wLm9y
aWdfbGVuKTsgaSsrKQo+ICsgICAgICAgICAgICAgICBvcC5idWZbaV0gPSBuYW5kX2lkLmlkc1to
b3N0LT5kYXRhLT5tYXhfaWRfY3ljbGUgLSAxIC0gaV07Cj4KPiAgICAgICAgIHJldHVybiByZXQ7
Cj4gIH0KPiBAQCAtNjc2LDYgKzY4NiwxMCBAQCBzdGF0aWMgaW50IGxvb25nc29uX25hbmRfY29u
dHJvbGxlcl9pbml0KHN0cnVjdCBsb29uZ3Nvbl9uYW5kX2hvc3QgKmhvc3QpCj4gICAgICAgICBp
ZiAoSVNfRVJSKGhvc3QtPnJlZ21hcCkpCj4gICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJy
X3Byb2JlKGRldiwgUFRSX0VSUihob3N0LT5yZWdtYXApLCAiZmFpbGVkIHRvIGluaXQgcmVnbWFw
XG4iKTsKPgo+ICsgICAgICAgaWYgKGhvc3QtPmRhdGEtPmlkX2N5Y2xlX2ZpZWxkKQo+ICsgICAg
ICAgICAgICAgICByZWdtYXBfdXBkYXRlX2JpdHMoaG9zdC0+cmVnbWFwLCBMT09OR1NPTl9OQU5E
X1BBUkFNLCBob3N0LT5kYXRhLT5pZF9jeWNsZV9maWVsZCwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGhvc3QtPmRhdGEtPm1heF9pZF9jeWNsZSA8PCBfX2Zmcyhob3N0LT5k
YXRhLT5pZF9jeWNsZV9maWVsZCkpOwo+ICsKPiAgICAgICAgIGNoYW4gPSBkbWFfcmVxdWVzdF9j
aGFuKGRldiwgInJ4dHgiKTsKPiAgICAgICAgIGlmIChJU19FUlIoY2hhbikpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihjaGFuKSwgImZhaWxlZCB0
byByZXF1ZXN0IERNQSBjaGFubmVsXG4iKTsKPiBAQCAtODAwLDYgKzgxNCw3IEBAIHN0YXRpYyB2
b2lkIGxvb25nc29uX25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
IH0KPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGxvb25nc29uX25hbmRfZGF0YSBsczFiX25hbmRf
ZGF0YSA9IHsKPiArICAgICAgIC5tYXhfaWRfY3ljbGUgPSA1LAo+ICAgICAgICAgLnN0YXR1c19m
aWVsZCA9IEdFTk1BU0soMTUsIDgpLAo+ICAgICAgICAgLmhvbGRfY3ljbGUgPSAweDIsCj4gICAg
ICAgICAud2FpdF9jeWNsZSA9IDB4YywKPiBAQCAtODA3LDYgKzgyMiw4IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgbG9vbmdzb25fbmFuZF9kYXRhIGxzMWJfbmFuZF9kYXRhID0gewo+ICB9Owo+Cj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbG9vbmdzb25fbmFuZF9kYXRhIGxzMWNfbmFuZF9kYXRhID0g
ewo+ICsgICAgICAgLm1heF9pZF9jeWNsZSA9IDYsCj4gKyAgICAgICAuaWRfY3ljbGVfZmllbGQg
PSBHRU5NQVNLKDE0LCAxMiksCj4gICAgICAgICAuc3RhdHVzX2ZpZWxkID0gR0VOTUFTSygyMywg
MTYpLAo+ICAgICAgICAgLm9wX3Njb3BlX2ZpZWxkID0gR0VOTUFTSygyOSwgMTYpLAo+ICAgICAg
ICAgLmhvbGRfY3ljbGUgPSAweDIsCj4gLS0KPiAyLjQ3LjMKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
