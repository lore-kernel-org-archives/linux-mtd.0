Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CE9C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 15:39:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F8D361051
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 15:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F8D361051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K44qMUFBVtn81wTgOFb9RosN+nF7aoxFYmVD7W5g98g=; b=Ebuys/b/aGejTn
	asq+H8nM3xMEeGbBY64N1D5foFIwaXLwjLANxM8agkIfasfXKNbm7gvANDPoHy2Vo1Q6uM/gg26tl
	wuxOAnlvruawqQdvqbu09gItrPqt7bS7vQT2jWMOYdRi0ttvOxGs9kxTAfDVek27ycp1bGJMDtpRp
	EIzc1fau7XCuPQHf0V8xdRsmeymhgKJbljjquN3pTCh8YBnBfaiKB/V8fIZB6rWj54hKuUCUvS7q0
	GpeRN2fOyeMpcZbKShIcA+X99TOTOqM25FfOcafTiVejWnzGAWdXIvuD2eRo46th10d35EkqF9GJI
	0y6N0Trj8R69DJftZcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlYe0-00B8RD-0w; Fri, 12 Nov 2021 15:39:12 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlYds-00B8Np-K6
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 15:39:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C32E360002;
 Fri, 12 Nov 2021 15:39:00 +0000 (UTC)
Date: Fri, 12 Nov 2021 16:38:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] mtd: rawnand: fsmc: Force to use 8 bits access when
 expected
Message-ID: <20211112163859.23a2487a@xps13>
In-Reply-To: <20211112143855.2678989-3-herve.codina@bootlin.com>
References: <20211112143855.2678989-1-herve.codina@bootlin.com>
 <20211112143855.2678989-3-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_073904_979179_E59CC35B 
X-CRM114-Status: GOOD (  20.65  )
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

SGkgSGVydsOpLAoKaGVydmUuY29kaW5hQGJvb3RsaW4uY29tIHdyb3RlIG9uIEZyaSwgMTIgTm92
IDIwMjEgMTU6Mzg6NTMgKzAxMDA6Cgo+IFNvbWUgZGF0YSB0cmFuc2ZlcnMgYXJlIGV4cGVjdGVk
IG9uIDggYml0cyBieSB0aGUgbmFuZCBjb3JlLgo+IFRoZSBmc21jIGRyaXZlciBkaWQgbm90IGNo
ZWNrIHRoaXMgY29uc3RyYWludCBhbmQgdGhlc2UgdHJhbnNmZXJzCj4gY2FuIGJlIGRvbmUgb24g
MzIgYml0cyBkZXBlbmRpbmcgb24gYnVmZmVyIGFsaWdubWVudCBhbmQgdHJhbnNmZXJzCj4gZGF0
YSBzaXplLgo+IAo+IFRoaXMgcGF0Y2ggZW5zdXJlcyB0aGF0IHRoZXNlIHRyYW5zZmVycyB3aWxs
IGJlIDhiaXRzIHRyYW5zZmVycyBpbgo+IGFsbCBjYXNlcy4KCkkgYmVsaWV2ZSB0aGVyZSBpcyBh
IG1pc3VuZGVyc3RhbmRpbmcgaGVyZTogTkFORCBidXNlcyAtYmV0d2VlbiB0aGUKTkFORCBjb250
cm9sbGVyIGFuZCB0aGUgTkFORCBjaGlwLSBhcmUgZWl0aGVyIDgtYml0IG9yIDE2LWJpdCB3aWRl
IGFuZAp0aGUgYW1vdW50IG9mIGJ5dGVzIHRoYXQgeW91IHdpbGwgcmV0cmlldmUgcGVyIHJlZ2lz
dGVyIHJlYWQgaXMgbm90CnJlbGF0ZWQgdG8gaXQuCgpXaGVuIHRoZSBjb250cm9sbGVyIHN1cHBv
cnRzIDE2LWJpdCBhY2Nlc3NlcywgdGhlcmUgYXJlIGNlcnRhaW4Kb3BlcmF0aW9ucyB0aGF0IG11
c3QgYmUgcGVyZm9ybWVkIHVzaW5nIG9ubHkgdGhlIGxvd2VzdCA4IGJpdHMgb2YgdGhlCk5BTkQg
YnVzLCBzdWNoIGFzIHJlYWRpbmcgYSBzdGF0dXMgWzFdLiBJbiB0aGlzIGNhc2UsIHRoZSBjb250
cm9sbGVyCm11c3QgaGF2ZSBhIHdheSB0byBkaXNhYmxlIHRoZSAxNi1iaXQgbW9kZSB0ZW1wb3Jh
cmlseS4gU2VlIFsyXSBhbmQgWzNdCmZvciBhbiBleGFtcGxlLiBSZWFkaW5nIHdpdGggcmVhZGIo
KSBvciByZWFkbCgpIHdpbGwgSU1ITyBub3QgaW1wYWN0IHRoZQphbW91bnQgb2YgZGF0YSBsaW5l
cyB1c2VkIGZvciB0aGUgb3BlcmF0aW9uLgoKPiBTaWduZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEg
PGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KClsxXSBodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jI0w2
NzMKWzJdIE1hcnZlbGwgTkFORCBjb250cm9sbGVyIGNhbiBjaGFuZ2UgdGhlIHVzZWQgd2lkdGgg
b2YgdGhlIGJ1cwpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNl
L2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jI0wxNzc3ClszXSAuLi4gd2hpbGUg
c3RpbGwgZG9pbmcgMzItYml0IGFjY2Vzc2VzCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMjTDkw
NgoKVGhhbmtzLApNaXF1w6hsCgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9mc21jX25h
bmQuYyB8IDE1ICsrKysrKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9mc21jX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbWNfbmFuZC5jCj4gaW5kZXgg
NjU4ZjBjYmU3Y2U4Li43ZjA1N2NmZWU2YzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvZnNtY19uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9mc21jX25hbmQu
Ywo+IEBAIC01NDAsMTIgKzU0MCwxMiBAQCBzdGF0aWMgaW50IGRtYV94ZmVyKHN0cnVjdCBmc21j
X25hbmRfZGF0YSAqaG9zdCwgdm9pZCAqYnVmZmVyLCBpbnQgbGVuLAo+ICAgKiBAbGVuOgludW1i
ZXIgb2YgYnl0ZXMgdG8gd3JpdGUKPiAgICovCj4gIHN0YXRpYyB2b2lkIGZzbWNfd3JpdGVfYnVm
KHN0cnVjdCBmc21jX25hbmRfZGF0YSAqaG9zdCwgY29uc3QgdTggKmJ1ZiwKPiAtCQkJICAgaW50
IGxlbikKPiArCQkJICAgaW50IGxlbiwgYm9vbCBmb3JjZV84Yml0KQo+ICB7Cj4gIAlpbnQgaTsK
PiAgCj4gIAlpZiAoSVNfQUxJR05FRCgodWludHB0cl90KWJ1Ziwgc2l6ZW9mKHUzMikpICYmCj4g
LQkgICAgSVNfQUxJR05FRChsZW4sIHNpemVvZih1MzIpKSkgewo+ICsJICAgIElTX0FMSUdORUQo
bGVuLCBzaXplb2YodTMyKSkgJiYgIWZvcmNlXzhiaXQpIHsKPiAgCQl1MzIgKnAgPSAodTMyICop
YnVmOwo+ICAKPiAgCQlsZW4gPSBsZW4gPj4gMjsKPiBAQCAtNTYzLDEyICs1NjMsMTMgQEAgc3Rh
dGljIHZvaWQgZnNtY193cml0ZV9idWYoc3RydWN0IGZzbWNfbmFuZF9kYXRhICpob3N0LCBjb25z
dCB1OCAqYnVmLAo+ICAgKiBAYnVmOglidWZmZXIgdG8gc3RvcmUgZGF0ZQo+ICAgKiBAbGVuOglu
dW1iZXIgb2YgYnl0ZXMgdG8gcmVhZAo+ICAgKi8KPiAtc3RhdGljIHZvaWQgZnNtY19yZWFkX2J1
ZihzdHJ1Y3QgZnNtY19uYW5kX2RhdGEgKmhvc3QsIHU4ICpidWYsIGludCBsZW4pCj4gK3N0YXRp
YyB2b2lkIGZzbWNfcmVhZF9idWYoc3RydWN0IGZzbWNfbmFuZF9kYXRhICpob3N0LCB1OCAqYnVm
LCBpbnQgbGVuLAo+ICsJCQkgIGJvb2wgZm9yY2VfOGJpdCkKPiAgewo+ICAJaW50IGk7Cj4gIAo+
ICAJaWYgKElTX0FMSUdORUQoKHVpbnRwdHJfdClidWYsIHNpemVvZih1MzIpKSAmJgo+IC0JICAg
IElTX0FMSUdORUQobGVuLCBzaXplb2YodTMyKSkpIHsKPiArCSAgICBJU19BTElHTkVEKGxlbiwg
c2l6ZW9mKHUzMikpICYmICFmb3JjZV84Yml0KSB7Cj4gIAkJdTMyICpwID0gKHUzMiAqKWJ1ZjsK
PiAgCj4gIAkJbGVuID0gbGVuID4+IDI7Cj4gQEAgLTY0Niw3ICs2NDcsOCBAQCBzdGF0aWMgaW50
IGZzbWNfZXhlY19vcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCBzdHJ1Y3QgbmFuZF9v
cGVyYXRpb24gKm9wLAo+ICAJCQkJCQkgIGluc3RyLT5jdHguZGF0YS5sZW4pOwo+ICAJCQllbHNl
Cj4gIAkJCQlmc21jX3JlYWRfYnVmKGhvc3QsIGluc3RyLT5jdHguZGF0YS5idWYuaW4sCj4gLQkJ
CQkJICAgICAgaW5zdHItPmN0eC5kYXRhLmxlbik7Cj4gKwkJCQkJICAgICAgaW5zdHItPmN0eC5k
YXRhLmxlbiwKPiArCQkJCQkgICAgICBpbnN0ci0+Y3R4LmRhdGEuZm9yY2VfOGJpdCk7Cj4gIAkJ
CWJyZWFrOwo+ICAKPiAgCQljYXNlIE5BTkRfT1BfREFUQV9PVVRfSU5TVFI6Cj4gQEAgLTY1Niw3
ICs2NTgsOCBAQCBzdGF0aWMgaW50IGZzbWNfZXhlY19vcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlw
LCBjb25zdCBzdHJ1Y3QgbmFuZF9vcGVyYXRpb24gKm9wLAo+ICAJCQkJCQkgICBpbnN0ci0+Y3R4
LmRhdGEubGVuKTsKPiAgCQkJZWxzZQo+ICAJCQkJZnNtY193cml0ZV9idWYoaG9zdCwgaW5zdHIt
PmN0eC5kYXRhLmJ1Zi5vdXQsCj4gLQkJCQkJICAgICAgIGluc3RyLT5jdHguZGF0YS5sZW4pOwo+
ICsJCQkJCSAgICAgICBpbnN0ci0+Y3R4LmRhdGEubGVuLAo+ICsJCQkJCSAgICAgICBpbnN0ci0+
Y3R4LmRhdGEuZm9yY2VfOGJpdCk7Cj4gIAkJCWJyZWFrOwo+ICAKPiAgCQljYXNlIE5BTkRfT1Bf
V0FJVFJEWV9JTlNUUjoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
