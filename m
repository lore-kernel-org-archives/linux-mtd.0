Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5011CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Dec 2021 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJRUqSWJaMNa0EMSm1gIuDQDT9Zqo9MYDrO+j74jWo4=; b=fRwsdlmAWxxE7o
	iwsbPHLhfwlxQOiMi5Ru9DVEwJkPYY/GLWOff52dqoN4y+5JIkE7RmqxcqYHItbZKKRknovoOPfpq
	XQVRsJ1jA4Jp9Jyp6eoHRgyPZIlYwU7DkfLuhodRylvIcmhVa0zIuRUBaNP2ulCLz8R8v4wrWCWYE
	ONXFldtYdkazsYkDiqc7pBPbxyFR2kAZq5ZtyX8fzQl2HxnirdpawaWFg9B5het6Ro4aFFEKphwxA
	2rbnQ6bXkHamxuEogmxtPnDxNH2MGw2tjQmY7MOevCofxvIxcX3BAZhnKyd5rIVCnZYfL7musakLj
	bnOiwjg1FEKhizRgUTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvcIa-001Mrz-2b; Fri, 10 Dec 2021 09:34:40 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvcIV-001MqK-B3; Fri, 10 Dec 2021 09:34:37 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E38ACFF80C;
 Fri, 10 Dec 2021 09:34:27 +0000 (UTC)
Date: Fri, 10 Dec 2021 10:34:26 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "xiangsheng.hou" <xiangsheng.hou@mediatek.com>
Cc: <broonie@kernel.org>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <donghunt@amazon.com>, <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: Re: [RFC,v4,2/5] mtd: nand: ecc: mtk: Convert to the ECC
 infrastructure
Message-ID: <20211210103426.0850d8d5@xps13>
In-Reply-To: <c7367dccd7b159ed36fd7d19fef25b0df8c5782d.camel@mediatek.com>
References: <20211130083202.14228-1-xiangsheng.hou@mediatek.com>
 <20211130083202.14228-3-xiangsheng.hou@mediatek.com>
 <20211209113209.71fe8ea7@xps13>
 <c7367dccd7b159ed36fd7d19fef25b0df8c5782d.camel@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_013435_679687_A25F3610 
X-CRM114-Status: GOOD (  28.53  )
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

SGVsbG8sCgp4aWFuZ3NoZW5nLmhvdUBtZWRpYXRlay5jb20gd3JvdGUgb24gRnJpLCAxMCBEZWMg
MjAyMSAxNzowOToxNCArMDgwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIFRodSwgMjAyMS0xMi0w
OSBhdCAxMTozMiArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIFhpYW5nc2hlbmcs
Cj4gPiAKPiA+IHhpYW5nc2hlbmcuaG91QG1lZGlhdGVrLmNvbSB3cm90ZSBvbiBUdWUsIDMwIE5v
diAyMDIxIDE2OjMxOjU5ICswODAwOgo+ID4gICAKPiA+ID4gCj4gPiA+ICtzdGF0aWMgdm9pZCBt
dGtfZWNjX25vX2JibV9zd2FwKHN0cnVjdCBuYW5kX2RldmljZSAqYSwgdTggKmIsIHU4Cj4gPiA+
ICpjKQo+ID4gPiArewo+ID4gPiArCS8qIG5vcCAqLyAgCj4gPiAKPiA+IElzIHRoaXMgcmVhbGx5
IHVzZWZ1bD8gIAo+IAo+IEZvciA1MTIgYnl0ZXMgcGFnZSBzaXplLCBpdCBpcyBubyBuZWVkIHRv
IGRvIEJCTSBzd2FwIGR1ZSB0byB0aGUgRUNDCj4gZW5naW5lIHN0ZXAgc2l6ZSB3aWxsIGJlIDUx
MiBieXRlcy4KPiAKPiBIb3dldmVyLCB0aGVyZSBoYXZlIDUxMiBieXRlcyBTTEMgTkFORCBwYWdl
IHNpemUgaW4gaGlzdG9yeSwgYWx0aG91Z2gKPiBoYXZlIG5vdCBzZWVuIHN1Y2ggU1BJL1BhcmFs
bGVsIE5BTkQgZGV2aWNlIGZvciBub3cuCj4gCj4gRG8geW91IHRoaW5rIHRoZXJlIG5vIG5lZWQg
dG8gY29uc2lkZXIgdGhpcyBzbWFsbCBwYWdlIGRldmljZT8KCkFjdHVhbGx5IEkgd2FzIHRhbGtp
bmcgYWJvdXQgdGhlIGVtcHR5IGhlbHBlciBpdHNlbGYuIEJ1dCBsZXQncyBrZWVwCnRoYXQgYXNp
ZGUgZm9yIG5vdywgaXQncyBmaW5lLgoKPiAKPiA+ICAgCj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4g
K3N0YXRpYyB2b2lkIG10a19lY2NfYmJtX3N3YXAoc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kLCB1
OAo+ID4gPiAqZGF0YWJ1ZiwgdTggKm9vYmJ1ZikKPiA+ID4gK3sKPiA+ID4gKwlzdHJ1Y3QgbXRr
X2VjY19lbmdpbmUgKmVuZyA9IG5hbmRfdG9fZWNjX2N0eChuYW5kKTsKPiA+ID4gKwlpbnQgc3Rl
cF9zaXplID0gbmFuZC0+ZWNjLmN0eC5jb25mLnN0ZXBfc2l6ZTsKPiA+ID4gKwl1MzIgYmJtX3Bv
cyA9IGVuZy0+YmJtX2N0bC5wb3NpdGlvbjsKPiA+ID4gKwo+ID4gPiArCWJibV9wb3MgKz0gZW5n
LT5iYm1fY3RsLnNlY3Rpb24gKiBzdGVwX3NpemU7Cj4gPiA+ICsKPiA+ID4gKwlzd2FwKG9vYmJ1
ZlswXSwgZGF0YWJ1ZltiYm1fcG9zXSk7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyB2
b2lkIG10a19lY2Nfc2V0X2JibV9jdGwoc3RydWN0IG10a19lY2NfYmJtX2N0bCAqYmJtX2N0bCwK
PiA+ID4gKwkJCQlzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQpCj4gPiA+ICt7Cj4gPiA+ICsJaWYg
KG5hbmRkZXZfcGFnZV9zaXplKG5hbmQpID09IDUxMikgewo+ID4gPiArCQliYm1fY3RsLT5iYm1f
c3dhcCA9IG10a19lY2Nfbm9fYmJtX3N3YXA7Cj4gPiA+ICsJfSBlbHNlIHsKPiA+ID4gKwkJYmJt
X2N0bC0+YmJtX3N3YXAgPSBtdGtfZWNjX2JibV9zd2FwOwo+ID4gPiArCQliYm1fY3RsLT5zZWN0
aW9uID0gbmFuZGRldl9wYWdlX3NpemUobmFuZCkgLwo+ID4gPiArCQkJCSAgIG10a19lY2NfZGF0
YV9sZW4obmFuZCk7Cj4gPiA+ICsJCWJibV9jdGwtPnBvc2l0aW9uID0gbmFuZGRldl9wYWdlX3Np
emUobmFuZCkgJQo+ID4gPiArCQkJCSAgICBtdGtfZWNjX2RhdGFfbGVuKG5hbmQpOwo+ID4gPiAr
CX0KPiA+ID4gK30KPiA+ID4gCj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgZGV2aWNlICpt
dGtfZWNjX2dldF9lbmdpbmVfZGV2KHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ID4gK3sKPiA+ID4g
KwlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICplY2NwZGV2Owo+ID4gPiArCXN0cnVjdCBkZXZpY2Vf
bm9kZSAqbnA7Cj4gPiA+ICsKPiA+ID4gKwkvKgo+ID4gPiArCSAqIFRoZSBkZXZpY2Ugbm9kZSBp
cyBvbmx5IHRoZSBob3N0IGNvbnRyb2xsZXIsCj4gPiA+ICsJICogbm90IHRoZSBhY3R1YWwgRUND
IGVuZ2luZSB3aGVuIHBpcGVsaW5lZCBjYXNlLgo+ID4gPiArCSAqLwo+ID4gPiArCW5wID0gb2Zf
cGFyc2VfcGhhbmRsZShkZXYtPm9mX25vZGUsICJuYW5kLWVjYy1lbmdpbmUiLCAwKTsKPiA+ID4g
KwlpZiAoIW5wKQo+ID4gPiArCQlyZXR1cm4gTlVMTDsKPiA+ID4gKwo+ID4gPiArCWVjY3BkZXYg
PSBvZl9maW5kX2RldmljZV9ieV9ub2RlKG5wKTsKPiA+ID4gKwlpZiAoIWVjY3BkZXYpIHsKPiA+
ID4gKwkJb2Zfbm9kZV9wdXQobnApOwo+ID4gPiArCQlyZXR1cm4gTlVMTDsKPiA+ID4gKwl9Cj4g
PiA+ICsKPiA+ID4gKwlwbGF0Zm9ybV9kZXZpY2VfcHV0KGVjY3BkZXYpOwo+ID4gPiArCW9mX25v
ZGVfcHV0KG5wKTsKPiA+ID4gKwo+ID4gPiArCXJldHVybiAmZWNjcGRldi0+ZGV2Owo+ID4gPiAr
fSAgCj4gPiAKPiA+IEFzIHRoaXMgd2lsbCBiZSB0aGUgZXhhY3Qgc2FtZSBmdW5jdGlvbiBmb3Ig
YWxsIHRoZSBwaXBlbGluZWQKPiA+IGVuZ2luZXMsCj4gPiBJIGFtIHRlbXB0ZWQgdG8gcHV0IHRo
aXMgaW4gdGhlIGNvcmUuIEknbGwgc29vbiBzZW5kIGEgaXRlcmF0aW9uLAo+ID4gc3RheQo+ID4g
dHVuZWQuCj4gPiAgIAo+IAo+IExvb2sgZm9yd2FyZCB0byB0aGUgZnVuY3Rpb24uCgpJIHNlbnQg
dGhlIG5ldyB2ZXJzaW9uIHllc3RlcmRheSBidXQgSQoqIGZvcmdvdCB0byBDQzogeW91CiogZm9y
Z290IGFib3V0IHRoYXQgZnVuY3Rpb24gYXMgd2VsbAoKTGV0J3MgaWdub3JlIHRoaXMgY29tbWVu
dCBmb3Igbm93LCBzZW5kIHlvdXIgZHJpdmVyIHdpdGggdGhlIHNhbWUKZnVuY3Rpb24gaW4gaXQg
YW5kIEknbGwgY2xlYW4gdGhhdCB1cCBsYXRlci4KCkhlcmUgaXMgdGhlIG5ldyBpdGVyYXRpb24s
IHNvcnJ5IGZvciBmb3JnZXR0aW5nIHRvIHNlbmQgaXQgdG8geW91IGFzCndlbGw6Cmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIxMTIwOTE3NDA0Ni41MzUyMjktMS1taXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tL1QvCkFuZCBoZXJlIGlzIGEgR2l0aHViIGJyYW5jaCBhcyB3ZWxs
OgpodHRwczovL2dpdGh1Yi5jb20vbWlxdWVscmF5bmFsL2xpbnV4L3RyZWUvZWNjLWVuZ2luZQoK
PiA+ID4gKwkJCQlzdHJ1Y3QgbmFuZF9wYWdlX2lvX3JlcSAqcmVxKQo+ID4gPiArewo+ID4gPiAr
CXN0cnVjdCBtdGtfZWNjX2VuZ2luZSAqZW5nID0gbmFuZF90b19lY2NfY3R4KG5hbmQpOwo+ID4g
PiArCWludCBzdGVwX3NpemUgPSBuYW5kLT5lY2MuY3R4LmNvbmYuc3RlcF9zaXplOwo+ID4gPiAr
CXZvaWQgKmRhdGFidWYsICpvb2JidWY7Cj4gPiA+ICsJaW50IGk7Cj4gPiA+ICsKPiA+ID4gKwlp
ZiAocmVxLT50eXBlID09IE5BTkRfUEFHRV9XUklURSkgewo+ID4gPiArCQlkYXRhYnVmID0gKHZv
aWQgKilyZXEtPmRhdGFidWYub3V0Owo+ID4gPiArCQlvb2JidWYgPSAodm9pZCAqKXJlcS0+b29i
YnVmLm91dDsKPiA+ID4gKwo+ID4gPiArCQkvKgo+ID4gPiArCQkgKiBDb252ZXJ0IHRoZSBzb3Vy
Y2UgZGF0YWJ1ZiBhbmQgb29iYnVmIHRvIE1USyBFQ0MKPiA+ID4gKwkJICogb24tZmxhc2ggZGF0
YSBmb3JtYXQuCj4gPiA+ICsJCSAqLwo+ID4gPiArCQlmb3IgKGkgPSAwOyBpIDwgZW5nLT5uc3Rl
cHM7IGkrKykgewo+ID4gPiArCQkJaWYgKGkgPT0gZW5nLT5iYm1fY3RsLnNlY3Rpb24pCj4gPiA+
ICsJCQkJZW5nLT5iYm1fY3RsLmJibV9zd2FwKG5hbmQsCj4gPiA+ICsJCQkJCQkgICAgICBkYXRh
YnVmLCBvb2JidWYpOyAgCj4gPiAKPiA+IERvIHlvdSByZWFsbHkgbmVlZCB0aGlzIHN3YXA/IElz
bid0IHRoZSBvdmVyYWxsIG1vdmUgZW5vdWdoIHRvIHB1dAo+ID4gdGhlCj4gPiBCQk0gYXQgdGhl
IHJpZ2h0IHBsYWNlPwo+ID4gICAKPiAKPiBGb3IgT1BTX1JBVyBtb2RlLCBuZWVkIG9yZ2FuaXpl
IGZsYXNoIGRhdGEgaW4gdGhlIE1USyBFQ0MgZW5naW5lIGRhdGEKPiBmb3JtYXQuIE90aGVyIG9w
ZXJhdGlvbiBpbiB0aGlzIGZ1bmN0aW9uIG9ubHkgb3JnYW5pemUgZGF0YSBieSBzZWN0aW9uCj4g
YW5kIG5vdCBpbmNsdWRlIEJCTSBzd2FwLgo+IAo+IEZvciBvdGhlciBtb2RlLCB0aGlzIGZ1bmN0
aW9uIHdpbGwgbm90IGJlIGNhbGxlZC4KCkNhbiB5b3UgdHJ5IHRvIGV4cGxhaW4gdGhpcyB3aXRo
IGFuIGFzY2lpIHNjaGVtYSBhZ2Fpbj8gSSdtIHNvcnJ5IGJ1dCBJCmRvbid0IGZvbGxvdyBpdC4g
SXMgdGhlIEJCTSBwbGFjZWQgaW4gdGhlIGZpcnN0IGJ5dGVzIG9mIHRoZSBmaXJzdCBvb2IKYXJl
YSBieSB0aGUgZW5naW5lPyBPciBpcyBpdCBwbGFjZSBzb21ld2hlcmUgZWxzZT8KCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
