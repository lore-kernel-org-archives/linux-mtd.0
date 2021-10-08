Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FC4C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 08:35:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B2756103C
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 08:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B2756103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NHrmpLfbNeJvvzeEV4iIIR2nEMkqQ1LVOcVDgL2MP5s=; b=NzXx1glauRk35S
	0ngCNiyF+ZAteH2unFbHeOPrzkEH8I5dw3FFNya6WBsyf7DCWw7RUpQQ4OlFxV1FYaXlM7xaog8ky
	hx2GVIaVS/SjX53PfOeO4pQT5QsK0tG32Ypg9PFPbgNm3wY2j1QjsagYKcYYCCJoz/IWc6VUd6oI0
	yirztt/f+7dQPjF0I0w0/R36jdJ2Q6rEau3gfdPo9znIvNjeCbOHpXmz0oXhV4mW28KKCnGZ1fkuV
	Se1h0ErNmpMO1ymh5jwhfv6miT0lDkkNkBKBJzOzI3VmP2N8Wp27p0OnYqCnNNF4NCLKJ4VjeprEI
	kloZcJtFDjIozpjCJKQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYlL6-0022i0-1b; Fri, 08 Oct 2021 08:34:48 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYlL3-0022hD-7B
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 08:34:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D66471C000B;
 Fri,  8 Oct 2021 08:34:41 +0000 (UTC)
Date: Fri, 8 Oct 2021 10:34:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joachim Wiberg <troglobit@gmail.com>
Cc: linux-mtd@lists.infradead.org, Joern Engel <joern@lazybastard.org>
Subject: Re: [PATCH 1/1] mtd: block2mtd: add support for an optional custom
 MTD label
Message-ID: <20211008103440.4bdb4c0e@xps13>
In-Reply-To: <87wnmnrkft.fsf@gmail.com>
References: <20211005080359.170360-1-troglobit@gmail.com>
 <20211008092748.6b47fce6@xps13> <87wnmnrkft.fsf@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_013445_419441_7EFEC6C9 
X-CRM114-Status: GOOD (  29.89  )
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

SGkgSm9hY2hpbSwKCnRyb2dsb2JpdEBnbWFpbC5jb20gd3JvdGUgb24gRnJpLCAwOCBPY3QgMjAy
MSAxMDoyNjo0NiArMDIwMDoKCj4gSGkgTWlxdcOobCEKPiAKPiBPbiBGcmksIE9jdCAwOCwgMjAy
MSBhdCAwOToyNywgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3Jv
dGU6Cj4gPiB0cm9nbG9iaXRAZ21haWwuY29tIHdyb3RlIG9uIFR1ZSwgIDUgT2N0IDIwMjEgMTA6
MDM6NTkgKzAyMDA6ICAKPiA+PiBbc25pcF0KPiA+PiBAQCAtMzA0LDcgKzMwNyw3IEBAIHN0YXRp
YyBzdHJ1Y3QgYmxvY2sybXRkX2RldiAqYWRkX2RldmljZShjaGFyICpkZXZuYW1lLCBpbnQgZXJh
c2Vfc2l6ZSwKPiA+PiAgCj4gPj4gIAlsaXN0X2FkZCgmZGV2LT5saXN0LCAmYmxrbXRkX2Rldmlj
ZV9saXN0KTsKPiA+PiAgCXByX2luZm8oIm10ZCVkOiBbJXNdIGVyYXNlX3NpemUgPSAlZEtpQiBb
JWRdXG4iLAo+ID4+IC0JCWRldi0+bXRkLmluZGV4LAo+ID4+ICsJCWRldi0+bXRkLmluZGV4LCBs
YWJlbCA/IGxhYmVsIDogIAo+ID4gQ2FuIHlvdSBwdXQgdGhpcyBvbiB0aGUgbmV4dCBsaW5lPyAg
Cj4gCj4gU3VyZSB0aGluZyEKPiAKPiA+PiBAQCAtMzgxLDggKzM4NCw4IEBAIHN0YXRpYyBpbnQg
YmxvY2sybXRkX3NldHVwMihjb25zdCBjaGFyICp2YWwpCj4gPj4gIAkvKiA4MCBmb3IgZGV2aWNl
LCAxMiBmb3IgZXJhc2Ugc2l6ZSwgODAgZm9yIG5hbWUsIDggZm9yIHRpbWVvdXQgKi8KPiA+PiAg
CWNoYXIgYnVmWzgwICsgMTIgKyA4MCArIDhdOwo+ID4+ICAJY2hhciAqc3RyID0gYnVmOwo+ID4+
IC0JY2hhciAqdG9rZW5bMl07Cj4gPj4gLQljaGFyICpuYW1lOwo+ID4+ICsJY2hhciAqdG9rZW5b
M107ICAKPiA+IFRoaXMgbnVtYmVyIGRlc2VydmVzIGEgZGVmaW5lIGFuZCBzaG91bGQgYmUgdXNl
ZCBsYXRlciBvbiBhcyB3ZWxsLiAgCj4gCj4gT0ssIEknbGwgc2VlIHdoYXQgSSBjYW4gZG8sIGl0
J3MgZm9yIHRoZSBwb3NpdGlvbmFsIG1vZHVsZSBhcmd1bWVudHMsCj4gc28gYSBGT09fTUFYX0FS
R1Mgb3Igc3RoLCBJIGd1ZXNzIC4uLgo+IAo+ID4+IEBAIC0zOTUsNyArMzk4LDcgQEAgc3RhdGlj
IGludCBibG9jazJtdGRfc2V0dXAyKGNvbnN0IGNoYXIgKnZhbCkKPiA+PiAgCXN0cmNweShzdHIs
IHZhbCk7Cj4gPj4gIAlraWxsX2ZpbmFsX25ld2xpbmUoc3RyKTsKPiA+PiAgCj4gPj4gLQlmb3Ig
KGkgPSAwOyBpIDwgMjsgaSsrKQo+ID4+ICsJZm9yIChpID0gMDsgaSA8IDM7IGkrKykgIAo+IAo+
IHVzZWQgaGVyZSBhcyB3ZWxsIC4uLgo+IAo+ID4+ICAJCXRva2VuW2ldID0gc3Ryc2VwKCZzdHIs
ICIsIik7ICAKPiAKPiBCdXQgd2hhdCBhYm91dCBlYWNoIHNlcGFyYXRlIGFyZywgaXMgdGhlcmUg
YW55IGNvbnZlbnRpb24/ICBJJ2xsIHNlZQo+IHdoYXQgSSBjYW4gZmluZCBpbiBvdGhlciBtb2R1
bGVzLgo+IAo+ID4+ICAJaWYgKHN0cikgewo+ID4+IEBAIC00MTQsNyArNDE3LDcgQEAgc3RhdGlj
IGludCBibG9jazJtdGRfc2V0dXAyKGNvbnN0IGNoYXIgKnZhbCkKPiA+PiAgCQlyZXR1cm4gMDsK
PiA+PiAgCX0KPiA+PiAgCj4gPj4gLQlpZiAodG9rZW5bMV0pIHsKPiA+PiArCWlmICh0b2tlblsx
XSAmJiBzdHJsZW4odG9rZW5bMV0pKSB7ICAKPiA+Cj4gPiBUaGlzIGNoYW5nZSBpcyBub3QgcmVs
YXRlZCB0byB5b3VyIGNvbW1pdCBJIGJlbGlldmUsIHBsZWFzZSBzcGxpdCBpZgo+ID4gbXkgYXNz
dW1wdGlvbiBpcyByaWdodC4gIAo+IAo+IFdlbGwsIGl0J3MgYSBsb2dpY2FsIGNvbnNlcXVlbmNl
IG9mIGFkZGluZyBhbm90aGVyIG1vZHVsZSBhcmd1bWVudCwgYnV0Cj4geW91J3JlIHJpZ2h0LCB0
aGlzIGNvdWxkIGJlIGhpdCBiZWZvcmUgYXMgd2VsbCBpZiBzb21lb25lIGFkZGVkIG11bHRpcGxl
Cj4gY29tbWFzIHdpdGhvdXQgYXJndW1lbnQuICAoVGhhdCBicmVha3MgZXJhc2Vfc2l6ZSBkZWZh
dWx0IHZhbHVlLikKCkluIHRoaXMgY2FzZSB5b3UgY2FuIGtlZXAgdGhpcyBjaGFuZ2UgaW4gdGhl
IGNvbW1pdCBidXQgeW91IG5lZWQgdG8KZXhwbGFpbiBpdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2Uu
Cgo+IE1heWJlIHRoaXMgYW5kIHRoZSBkZWZpbmVzIGZpdCBpbiB0aGUgc2FtZSBzZXBhcmF0ZSAi
Y2xlYW51cCIgcGF0Y2g/Cj4gCj4gPj4gLQlhZGRfZGV2aWNlKG5hbWUsIGVyYXNlX3NpemUsIHRp
bWVvdXQpOwo+ID4+ICsJaWYgKHRva2VuWzJdKSB7Cj4gPj4gKwkJbGFiZWwgPSB0b2tlblsyXTsK
PiA+PiArCQlwcl9pbmZvKCJVc2luZyBjdXN0b20gTVREIGxhYmVsICclcycgZm9yIGRldiAlc1xu
IiwgbGFiZWwsIG5hbWUpOyAgCj4gPiBOb3Qgc3VyZSB0aGlzIHF1YWxpZmllcyBhcyBhbiBpbmZv
IGxvZyBtZXNzYWdlLCBwZXJoYXBzIGEgZGVidWcgb25lCj4gPiB3b3VsZCBiZSBtb3JlIGFwcHJv
cHJpYXRlPyAgCj4gCj4gT0shICAoSnVzdCB0cmllZCB0byBmb2xsb3cgdGhlIHNhbWUgbG9nIGxl
dmVsIHVzZWQgZm9yIGVyYXNlX3NpemUuKQoKT2sgdGhlbiBrZWVwIHRoZSBkcml2ZXIgY29uc2lz
dGVudCwgaXQncyBub3QgYSBiaXQgZGVhbCBhbmQgd2UgY2FuCmxvd2VyIHRoZSBsZXZlbCBsYXRl
ciBpZiBpdCdzIHRvbyBub2lzeS4KCj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LCBJJ2xsIHBv
c3QgYSB2MiBsYXRlciB0b2RheSwgb3IgZHVyaW5nIHRoZQo+IHdlZWtlbmQgOikKPiAKPiBDaGVl
cnMKPiAgL0pvYWNoaW0KPiAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
