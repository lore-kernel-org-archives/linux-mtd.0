Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA172C61DBE
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 13:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qf/r9RuA6w+acNXUjspNX2aX+kLSUBaRxZYCZvts9zo=; b=Y420o9lFUtQFHP
	eeFM0cUALfm0ttqAhdYrTNeLgrzLJ76Z6/eA9ojpoVtJI67XCuCm3S41HVt9vn8LF2QOKP2ogc83Y
	nVQcME1xPC6Z+ycMB+d71mZ4lxTr49CWv5mccXghI6enVLNEZdXhqV+gp/CF6q3B5/X8mrjmeFnXc
	5tazRmrinSbqeuGVq0I6lzkoXWDgZKNuz0UOMIVziqBTZ3G/9T3EU1stArGdi1b3dO/GSjDfy5UiT
	41jvh4+r7tHwq4DF5m5Xh4P7U6rnVChrwVx08wRONbUmsBaWSEKtGxncRj65EMT7nvngpWTQQ6uxA
	BjMxBvwDv5B1PCmuIDAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrQW-00000000svE-0p9h;
	Tue, 25 Aug 2026 13:42:56 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrQT-00000000suV-2kMv
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 13:42:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1624C1A1816;
	Tue, 25 Aug 2026 13:42:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D7634604C4;
	Tue, 25 Aug 2026 13:42:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4864F11C7A0D5;
	Tue, 25 Aug 2026 15:42:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787665365; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IyGOw4U4ix5P0wWcI0DA7kOT20fFy32UpdeDywIjYwA=;
	b=dGCzR00m9UIpEy5m7VlUEVwJdxrJnrQ+CrWjVndRowk/uUUXXg3pBKqXZNXccj48IH0YvJ
	dzbZDs9RE2dOBwLcSqs725Trr6vV9p/KeIVJM4nxFvqJMHMnGsmE/9hkDw3rCYqwXBZOOr
	Gq4ngQkcPJXqQXqqbWoRnbeuxo9EzXmHZXLivj6y+t5Bw9U0nldC++JSJl7Bdt8XYbxTR7
	cxvYC5HCYi5ale2ogffV1bwiWhLD0wRsM+NgRzcH8yUB+LqyTtqHgkPrCOtXYA5XfnkA1U
	jLa1ed52EwcN/+vjtXW5mCskKLIZVqKEAgYMO7Shf6TmN8SPS2CTzdMsjGrfFw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: afs: add size check to v2 partition
In-Reply-To: <20260824-mtd_break_looper-v1-1-e46d7f02faab@kroah.com> (Griffin
	Kroah-Hartman's message of "Mon, 24 Aug 2026 15:50:27 +0200")
References: <20260824-mtd_break_looper-v1-1-e46d7f02faab@kroah.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 25 Aug 2026 15:42:35 +0200
Message-ID: <87cxv6gvuc.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_064253_840504_F9F9A39F 
X-CRM114-Status: GOOD (  19.90  )
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

SGVsbG8gR3JpZmZpbiwKClRoYW5rcyBmb3IgdGhlIHBhdGNoIQoKT24gMjQvMDgvMjAyNiBhdCAx
NTo1MDoyNyArMDIsIEdyaWZmaW4gS3JvYWgtSGFydG1hbiA8Z3JpZmZpbkBrcm9haC5jb20+IHdy
b3RlOgoKPiBBZGQgYSBzaXplIGNoZWNrIHRvIHRoZSBsb29wIGluIGFmc19wYXJzZV92Ml9wYXJ0
aXRpb24oKSwgYXZvaWRpbmcKPiB3YWxraW5nIG91dCBvZiB0aGUgaW1naW5mb1tdIGFycmF5IGJv
dW5kcyBpZiBhIG1hbGljaW91cyBwYWNrZXQgZmFrZXMgYQoKInBhY2tldCIgcmVmZXJzIHRvIG5l
dHdvcmsgd29yZGluZywgd2hlcmVhcyBoZXJlLCBpbiB0aGUgTVREIHdvcmxkLCB3ZQp3b3VsZCBy
YXRoZXIgdGFsayBhYm91dCBhIG1hbGljaW91cyBpbWFnZS4KCj4gbGFyZ2UgcmVnaW9uIGNvdW50
Lgo+Cj4gQXNzaXN0ZWQtYnk6IGdraF9jbGFua2VyX3QxMDAwCj4gU2lnbmVkLW9mZi1ieTogR3Jp
ZmZpbiBLcm9haC1IYXJ0bWFuIDxncmlmZmluQGtyb2FoLmNvbT4KCkkgZ3Vlc3Mgc3VjaCBhIGZp
eCB3b3VsZCByZXF1aXJlIGEgRml4ZXMgdGFnLCBhcyB3ZWxsIGFzIENjJ2luZyB0aGUKc3RhYmxl
QHZnZXIua2VybmVsLm9yZyBhbGlhcy4KCj4gLS0tCj4gIGRyaXZlcnMvbXRkL3BhcnNlcnMvYWZz
LmMgfCAxMiArKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9wYXJzZXJzL2Fmcy5j
IGIvZHJpdmVycy9tdGQvcGFyc2Vycy9hZnMuYwo+IGluZGV4IDI2MTE2Njk0YzgyMS4uMmM2Zjg3
NjgzMTJjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvYWZzLmMKPiArKysgYi9k
cml2ZXJzL210ZC9wYXJzZXJzL2Fmcy5jCj4gQEAgLTI4NywxMiArMjg3LDE4IEBAIHN0YXRpYyBp
bnQgYWZzX3BhcnNlX3YyX3BhcnRpdGlvbihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKPiAgCQkgYmxv
Y2tfc3RhcnQsIGJsb2NrX2VuZCk7Cj4gIAo+ICAJZm9yIChpID0gMDsgaSA8IHJlZ2lvbl9jb3Vu
dDsgaSsrKSB7Cj4gLQkJdTMyIHJlZ2lvbl9sb2FkX2FkZHIgPSBpbWdpbmZvW3BhZCArIDMgKyBp
KjRdOwo+IC0JCXUzMiByZWdpb25fc2l6ZSA9IGltZ2luZm9bcGFkICsgNCArIGkqNF07Cj4gLQkJ
dTMyIHJlZ2lvbl9vZmZzZXQgPSBpbWdpbmZvW3BhZCArIDUgKyBpKjRdOwo+ICsJCXUzMiByZWdp
b25fbG9hZF9hZGRyOwo+ICsJCXUzMiByZWdpb25fc2l6ZTsKPiArCQl1MzIgcmVnaW9uX29mZnNl
dDsKPiAgCQl1MzIgcmVnaW9uX3N0YXJ0Owo+ICAJCXUzMiByZWdpb25fZW5kOwo+ICAKPiArCQlp
ZiAocGFkICsgNSArIGkqNCA+PSBBUlJBWV9TSVpFKGltZ2luZm8pKQo+ICsJCQlicmVhazsKPiAr
CQlyZWdpb25fbG9hZF9hZGRyID0gaW1naW5mb1twYWQgKyAzICsgaSo0XTsKPiArCQlyZWdpb25f
c2l6ZSA9IGltZ2luZm9bcGFkICsgNCArIGkqNF07Cj4gKwkJcmVnaW9uX29mZnNldCA9IGltZ2lu
Zm9bcGFkICsgNSArIGkqNF07Cj4gKwoKTG9va2luZyBhdCB0aGUgY29kZSwgSSBzZWUgdGhhdCBq
dXN0IGFib3ZlIHRoZSBsb29wIHRoZXJlIGlzIGFuIGFjdHVhbApjaGVjayBiYWlsaW5nIG91dCBl
YXJseSBpbiBjYXNlIHRoZSByZWdpb24gY291bnQgaXMgb3Zlcmx5IGJpZy4gSW4KcHJhY3RpY2U6
Ci0gcGFkIGNhbiBvbmx5IGJlIDAsIDEgb3IgMgotIGltZ2luZm8gYXJyYXkgc2l6ZSBpcyAzNgoK
VGhlIGNoZWNrIGlzOgoKICAgICAgICBpZiAocmVnaW9uX2NvdW50ID4gKEFSUkFZX1NJWkUoaW1n
aW5mbykgLSBwYWQgLSAzKSAvIDQpCiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKCkFu
ZCB0aGUgbG9vcCBnb2VzIGF0IG1vc3QgdGhyb3VnaDoKCiAgICAgICAgcGFkICsgNSArIChyZWdp
b25fY291bnQgLSAxKSAqIDQKClNvIHRoZSBvbmx5IHBvc3NpYmlsaXRpZXMgYXJlOgoKICAgICAg
ICBwYWQgfCBtYXgocmVnaW9uX2NvdW50KSB8IG1heChpbmRleCkKICAgICAgICAtLS0tKy0tLS0t
LS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0KICAgICAgICAwICAgfCA4ICAgICAgICAgICAgICAg
ICB8IDMzCiAgICAgICAgMSAgIHwgOCAgICAgICAgICAgICAgICAgfCAzNAogICAgICAgIDIgICB8
IDcgICAgICAgICAgICAgICAgIHwgMzEKCkl0IHNlZW1zIGxpa2Ugbm9uZSBvZiB0aG9zZSBzaXR1
YXRpb25zIGNvdWxkIGFjdHVhbGx5IGxlYWQgdG8gYQpyZWFjaGFibGUvZXhwbG9pdGFibGUgYnVn
LiBTbyB3aGlsZSBJIHVuZGVyc3RhbmQgdGhlIHdpc2ggZm9yIGEgbW9yZQpkZWZlbnNpdmUgaGFy
ZGVuaW5nLCB0aGUgY2hlY2sgeW91IGFkZCBzZWVtcyByZWR1bmRhbnQuIEkgd291bGQKdGhlcmVm
b3JlIHN1Z2dlc3QgdG8ganVzdCBrZWVwIHRoZSBkcml2ZXIgYXMtaXMuCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
