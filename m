Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BA7C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 09:40:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 301E3206C0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 09:40:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o9YhWOqt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 301E3206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvcYr+MnEohqaxlLQAGQnthapa9BwzAAX2iiMyH7skM=; b=o9YhWOqtkSwnmu
	+Sq+uMyY2pTEpVVY+Zzx8OUzTJ4wCnK0+ibNJURSyp/s39KoRe9RUwkgEil8Dv1s7ZaB94Lqk3a85
	ryqbkVkcFLn5CLx+/S0S0TmjLHW8Cle0jGFy+/oKRtjkmim1Y5mAEul4Unk4m3Ks7hUEodg5fGf1o
	3lfb0/iiF1SyKfV6B3dYEIPLPGkQU4883Mb3rgSYkuCavK4BJm4bkQGMyWz3c0Dc9H3TJh7Iw1P3B
	90deFO6k3JiXHEslGg2VknOb8xFMGqwA8Gk6tal5IE894AgDd8sQyFJqS5QjmQ1m3y9AbHgxXEdd9
	5e0V0E57gH20GgMIHMmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTMiZ-0004Hj-2Y; Tue, 28 Apr 2020 09:39:55 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTMiV-0004Gp-Dv
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 09:39:53 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1927424000C;
 Tue, 28 Apr 2020 09:39:47 +0000 (UTC)
Date: Tue, 28 Apr 2020 11:39:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 5/9] mtd: rawnand: onfi: Define the number of
 parameter pages
Message-ID: <20200428113947.726908e6@xps13>
In-Reply-To: <20200428113815.49c47d7f@collabora.com>
References: <20200424164042.26572-1-miquel.raynal@bootlin.com>
 <20200424164042.26572-6-miquel.raynal@bootlin.com>
 <20200425102519.367cf1ea@collabora.com>
 <20200428113628.0f9cd8d7@xps13>
 <20200428113815.49c47d7f@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_023951_745300_4FBAFBB0 
X-CRM114-Status: GOOD (  21.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CkJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlIG9u
IFR1ZSwgMjggQXByCjIwMjAgMTE6Mzg6MTUgKzAyMDA6Cgo+IE9uIFR1ZSwgMjggQXByIDIwMjAg
MTE6MzY6MjggKzAyMDAKPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
PiB3cm90ZToKPiAKPiA+IEhpIEJvcmlzLAo+ID4gCj4gPiBCb3JpcyBCcmV6aWxsb24gPGJvcmlz
LmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZSBvbiBTYXQsIDI1IEFwcgo+ID4gMjAyMCAx
MDoyNToxOSArMDIwMDoKPiA+ICAgCj4gPiA+IE9uIEZyaSwgMjQgQXByIDIwMjAgMTg6NDA6Mzgg
KzAyMDAKPiA+ID4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3Jv
dGU6Cj4gPiA+ICAgICAKPiA+ID4gPiBVc2UgYSBtYWNybyB0byBkZWZpbmUgdGhlIG51bWJlciBv
ZiBwYXJhbWV0ZXIgcGFnZSBpbnN0ZWFkIG9mCj4gPiA+ID4gaGFyZGNvZGluZyBpdCBldmVyeXdo
ZXJlLgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfb25maS5jIHwgMTAgKysrKysrLS0tLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX29uZmkuYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfb25maS5jCj4gPiA+ID4gaW5kZXggN2Q5YTMxMzA0NDNhLi45ZmUzOWFkYmRl
NGMgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9vbmZpLmMK
PiA+ID4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX29uZmkuYwo+ID4gPiA+IEBA
IC0xNiw2ICsxNiw4IEBACj4gPiA+ID4gIAo+ID4gPiA+ICAjaW5jbHVkZSAiaW50ZXJuYWxzLmgi
Cj4gPiA+ID4gIAo+ID4gPiA+ICsjZGVmaW5lIE9ORklfUEFSQU1fUEFHRVMgMwo+ID4gPiA+ICsK
PiA+ID4gPiAgdTE2IG9uZmlfY3JjMTYodTE2IGNyYywgdTggY29uc3QgKnAsIHNpemVfdCBsZW4p
Cj4gPiA+ID4gIHsKPiA+ID4gPiAgCWludCBpOwo+ID4gPiA+IEBAIC0xNTYsNyArMTU4LDcgQEAg
aW50IG5hbmRfb25maV9kZXRlY3Qoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiA+ID4gPiAgCQly
ZXR1cm4gMDsKPiA+ID4gPiAgCj4gPiA+ID4gIAkvKiBPTkZJIGNoaXA6IGFsbG9jYXRlIGEgYnVm
ZmVyIHRvIGhvbGQgaXRzIHBhcmFtZXRlciBwYWdlICovCj4gPiA+ID4gLQlwID0ga3phbGxvYygo
c2l6ZW9mKCpwKSAqIDMpLCBHRlBfS0VSTkVMKTsKPiA+ID4gPiArCXAgPSBremFsbG9jKChzaXpl
b2YoKnApICogT05GSV9QQVJBTV9QQUdFUyksIEdGUF9LRVJORUwpOwo+ID4gPiA+ICAJaWYgKCFw
KQo+ID4gPiA+ICAJCXJldHVybiAtRU5PTUVNOwo+ID4gPiA+ICAKPiA+ID4gPiBAQCAtMTY2LDcg
KzE2OCw3IEBAIGludCBuYW5kX29uZmlfZGV0ZWN0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4g
PiA+ID4gIAkJZ290byBmcmVlX29uZmlfcGFyYW1fcGFnZTsKPiA+ID4gPiAgCX0KPiA+ID4gPiAg
Cj4gPiA+ID4gLQlmb3IgKGkgPSAwOyBpIDwgMzsgaSsrKSB7Cj4gPiA+ID4gKwlmb3IgKGkgPSAw
OyBpIDwgT05GSV9QQVJBTV9QQUdFUzsgaSsrKSB7Cj4gPiA+ID4gIAkJcmV0ID0gbmFuZF9yZWFk
X2RhdGFfb3AoY2hpcCwgJnBbaV0sIHNpemVvZigqcCksIHRydWUpOwo+ID4gPiA+ICAJCWlmIChy
ZXQpIHsKPiA+ID4gPiAgCQkJcmV0ID0gMDsKPiA+ID4gPiBAQCAtMTgxLDggKzE4Myw4IEBAIGlu
dCBuYW5kX29uZmlfZGV0ZWN0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gPiA+ID4gIAkJfQo+
ID4gPiA+ICAJfQo+ID4gPiA+ICAKPiA+ID4gPiAtCWlmIChpID09IDMpIHsKPiA+ID4gPiAtCQlj
b25zdCB2b2lkICpzcmNidWZzWzNdID0ge3AsIHAgKyAxLCBwICsgMn07Cj4gPiA+ID4gKwlpZiAo
aSA9PSBPTkZJX1BBUkFNX1BBR0VTKSB7Cj4gPiA+ID4gKwkJY29uc3Qgdm9pZCAqc3JjYnVmc1tP
TkZJX1BBUkFNX1BBR0VTXSA9IHtwLCBwICsgMSwgcCArIDJ9Owo+ID4gPiA+ICAgICAgICAKPiA+
ID4gCj4gPiA+IE1heWJlIGluaXRpYWxpemUgdGhlIHNyY2J1ZnMgYXJyYXkgdXNpbmcgYSBmb3Ig
bG9vcCBzbyB5b3UgY2FuIGVhc2lseQo+ID4gPiBjaGFuZ2UgT05GSV9QQVJBTV9QQUdFUyB3aXRo
b3V0IGhhdmluZyB0byB0b3VjaCB0aGUgY29kZS4gTG9va3MgZ29vZAo+ID4gPiBvdGhlcndpc2Us
IHNvCj4gPiA+IAo+ID4gPiBSZXZpZXdlZC1ieTogQm9yaXMgQnJlaWxsb24gPGJvcmlzLmJyZXpp
bGxvbkBjb2xsYWJvcmEuY29tPgo+ID4gPiAgICAgCj4gPiAKPiA+IEFncmVlZCwgaGVyZSBpcyB0
aGUgc25pcHBldCBvZiBjb2RlIHRoYXQgSSBjaGFuZ2VkOgo+ID4gCj4gPiBAQCAtMTgxLDExICsx
ODMsMTUgQEAgaW50IG5hbmRfb25maV9kZXRlY3Qoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiA+
ICAgICAgICAgICAgICAgICB9Cj4gPiAgICAgICAgIH0KPiA+ICAKPiA+IC0gICAgICAgaWYgKGkg
PT0gMykgewo+ID4gLSAgICAgICAgICAgICAgIGNvbnN0IHZvaWQgKnNyY2J1ZnNbM10gPSB7cCwg
cCArIDEsIHAgKyAyfTsKPiA+ICsgICAgICAgaWYgKGkgPT0gT05GSV9QQVJBTV9QQUdFUykgewo+
ID4gKyAgICAgICAgICAgICAgIGNvbnN0IHZvaWQgKnNyY2J1ZnNbT05GSV9QQVJBTV9QQUdFU107
Cj4gPiArICAgICAgICAgICAgICAgaW50IGo7ICAKPiAKPiAJCSAgXnVuc2lnbmVkIGludAoKT2sK
Cj4gCj4gPiArCj4gPiArICAgICAgICAgICAgICAgZm9yIChqID0gMDsgaiA8IE9ORklfUEFSQU1f
UEFHRVM7IGorKykKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHNyY2J1ZnNbal0gPSBwICsg
ajsKPiA+ICAKPiA+ICAgICAgICAgICAgICAgICBwcl93YXJuKCJDb3VsZCBub3QgZmluZCBhIHZh
bGlkIE9ORkkgcGFyYW1ldGVyIHBhZ2UsIHRyeWluZyBiaXQtd2lzZSBtYWpvcml0eSB0byByZWNv
dmVyIGl0XG4iKTsKPiA+IC0gICAgICAgICAgICAgICBuYW5kX2JpdF93aXNlX21ham9yaXR5KHNy
Y2J1ZnMsIEFSUkFZX1NJWkUoc3JjYnVmcyksIHAsCj4gPiArICAgICAgICAgICAgICAgbmFuZF9i
aXRfd2lzZV9tYWpvcml0eShzcmNidWZzLCBPTkZJX1BBUkFNX1BBR0VTLCBwLAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKCpwKSk7Cj4gPiAgCj4gPiAg
ICAgICAgICAgICAgICAgY3JjID0gb25maV9jcmMxNihPTkZJX0NSQ19CQVNFLCAodTggKilwLCAy
NTQpOwo+ID4gCj4gPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobCAgCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
