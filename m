Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB61C88E66
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mpk/mutiHpWeVTEp2RZ4QRQRcyNaBZDseO8CwJ+2KTY=; b=SAp9RaQM8VTuMh
	tHusn8SkrRwAO+a5TNT0vc6Xh1WIbWDG8sLidcBJC0IlbswLfTggFBTaSE8FgBPQyuXOk52RMl/DB
	51d6DOTSDfhl6r+cFZ693yg7j6MhsLaOrZS1by7nPPh8cjSjPdpNxahmH4B900nJrmr/gaJvtbac9
	xcNbECZrRqrZ+2MocoVJiTM6QsWE8ts61wv8/7uZDsTZFUgxJdah2e9dQO7lXwp1HFRxHE1cOHLAO
	XijTWP04U4y9PEJwBBE+bDE0+iiZW2UVOOVEWN1yKJCd94IZDONIdnoK0evD3SIPdmhYoDLhVwnhB
	zLEEksuKAEYSrT7EeUSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65bL-00000003VPa-36bI;
	Mon, 14 Sep 2026 12:15:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65bI-00000003VOp-2YxB
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 12:15:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 815A4C6220A;
	Mon, 14 Sep 2026 12:16:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62FF960323;
	Mon, 14 Sep 2026 12:15:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A183E11C7AF9D;
	Mon, 14 Sep 2026 14:15:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789388149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c/j2KSqoeXBO/q3tfC1ALuuQTrGhFj6j1QP0rTOkUU8=;
	b=ltcMcIpu7KTkiliv/Sa0/XOryVq+Iy4OOrpOQXGT2bqQF6+9WInj1c1ZBbTrmJ5ot6lWQm
	Stl2p/qa3c0UzIiZzikOiSv/uzemiocQXjLBEt1EkLLiruLlvqQ+xAHPTeyfy0Kkbh+SBi
	yPgJEoV3KwEtUjjvPKieD5XEoBZ4Gn9GNI1wcgbpIYFeMIDKOM6a1+MGA342Omian1E5s8
	yCWPVI9SpOZ0q0y7DspWzcMTCFSND9Q6X5KNJO8+QhCtIFUvVDm42CtmqCHUYu2+4E8XVa
	2xir+AEUZ4JBCqTSyMywT/x5Lujn6FuOnvy1rJD3quvJ/q78zI0DFjucYACBgg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Itai Handler <itai.handler@gmail.com>
Cc: mwalle@kernel.org,  pratyush@kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  vigneshr@ti.com,  richard@nod.at,
  takahiro.kuwano@infineon.com,  stable@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: take the flash lock in
 spi_nor_shutdown()
In-Reply-To: <20260914081149.1916589-3-itai.handler@gmail.com> (Itai Handler's
	message of "Mon, 14 Sep 2026 11:11:48 +0300")
References: <20260914081149.1916589-1-itai.handler@gmail.com>
	<20260914081149.1916589-3-itai.handler@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 14 Sep 2026 14:15:46 +0200
Message-ID: <87fqzcowp9.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_051556_813109_DDB87EB4 
X-CRM114-Status: GOOD (  30.18  )
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

T24gMTQvMDkvMjAyNiBhdCAxMToxMTo0OCArMDMsIEl0YWkgSGFuZGxlciA8aXRhaS5oYW5kbGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IHNwaV9ub3Jfc2h1dGRvd24oKSBjYWxscyBzcGlfbm9yX3Jl
c3RvcmUoKSB0byBwdXQgdGhlIGZsYXNoIGJhY2sgaW50bwo+IDMtYnl0ZSBhZGRyZXNzaW5nIGJl
Zm9yZSB0aGUgc3lzdGVtIHJlYm9vdHMgb3Iga2V4ZWNzLiBJdCBkb2VzIHNvCj4gd2l0aG91dCB0
YWtpbmcgbm9yLT5sb2NrLCB3aGljaCBldmVyeSBvdGhlciBwYXRoIHRoYXQgdGFsa3MgdG8gdGhl
IGNoaXAKPiBhY3F1aXJlcyB0aHJvdWdoIHNwaV9ub3JfcHJlcF9hbmRfbG9jaygpLgo+Cj4gZGV2
aWNlX3NodXRkb3duKCkgZG9lcyBub3QgZnJlZXplIHVzZXJzcGFjZSBhbmQgZG9lcyBub3Qgc3Rv
cCBrZXJuZWwKPiB0aHJlYWRzOyBpdCB3YWxrcyB0aGUgZGV2aWNlIGxpc3QgY2FsbGluZyAtPnNo
dXRkb3duIHdpdGggYWxsIENQVXMKPiBvbmxpbmUuIEFub3RoZXIgdGhyZWFkIGNhbiB0aGVyZWZv
cmUgYmUgaW4gdGhlIG1pZGRsZSBvZiBhbiBvcGVyYXRpb24sCj4gd2l0aCB0aGUgcmVzdG9yZSBy
dW5uaW5nIGNvbmN1cnJlbnRseSB3aXRoIGl0LiBBIHdyaXRlIGFuZCBhIHJlYWQgYXJlCj4gYm90
aCBkYW1hZ2VkLCBpbiBkaWZmZXJlbnQgd2F5cy4KPgo+IEEgcHJvZ3JhbSBvciBlcmFzZSBsZWF2
ZXMgdGhlIGZsYXNoIGJ1c3ksIGFuZCBhIGJ1c3kgZmxhc2ggYWNjZXB0cyBvbmx5Cj4gc3RhdHVz
IHJlZ2lzdGVyIHJlYWRzIGFuZCBpZ25vcmVzIGV2ZXJ5dGhpbmcgZWxzZSwgaW5jbHVkaW5nIHRo
ZSBFWDRCCj4gdGhhdCBzcGlfbm9yX3Jlc3RvcmUoKSBzZW5kcy4gTmVpdGhlciBzcGlfbm9yX3dy
aXRlX2VuYWJsZSgpIG5vcgo+IHNwaV9ub3Jfc2V0XzRieXRlX2FkZHJfbW9kZSgpIHJlYWRzIGFu
eXRoaW5nIGJhY2ssIHNvIHRoZSByZXN0b3JlCj4gcmVwb3J0cyBzdWNjZXNzIHdoaWxlIHRoZSBm
bGFzaCBpcyBsZWZ0IGluIDQtYnl0ZSBhZGRyZXNzaW5nLiBUaGUgbmV4dAo+IGJvb3Qgc3RhZ2Ug
dGhlbiBhZGRyZXNzZXMgaXQgd2l0aCAzIGJ5dGVzIGFuZCByZWFkcyB0aGUgd3JvbmcgZGF0YSwK
PiB3aGljaCBpcyB0aGUgZmFpbHVyZSBjb21taXQgNTliMzU2ZmZkMGIwICgibXRkOiBtMjVwODA6
IHJlc3RvcmUgdGhlCj4gc3RhdHVzIG9mIFNQSSBmbGFzaCB3aGVuIGV4aXRpbmciKSBpbnRyb2R1
Y2VkIHRoaXMgcmVzdG9yZSB0byBwcmV2ZW50Lgo+Cj4gQSByZWFkLCBieSBjb250cmFzdCwgZG9l
cyBub3QgaWdub3JlIHRoZSByZXN0b3JlIC0gaXQgaXMgY29ycnVwdGVkIGJ5Cj4gaXQuIHNwaV9u
b3JfcmVhZCgpIGhvbGRzIHRoZSBsb2NrIGFjcm9zcyBhIGxvb3AgdGhhdCBpc3N1ZXMgb25lCj4g
c3BpX25vcl9yZWFkX2RhdGEoKSBwZXIgY2h1bmssIGVhY2ggdXNpbmcgbm9yLT5hZGRyX25ieXRl
cy4KPiBzcGlfbm9yX3NldF80Ynl0ZV9hZGRyX21vZGUoKSB1cGRhdGVzIG5vci0+cGFyYW1zLT5h
ZGRyX25ieXRlcyBhbmQgbm90Cj4gbm9yLT5hZGRyX25ieXRlcywgc28gYSByZXN0b3JlIGxhbmRp
bmcgYmV0d2VlbiB0d28gY2h1bmtzIHN3aXRjaGVzIHRoZQo+IGNoaXAgdG8gMy1ieXRlIGFkZHJl
c3Npbmcgd2hpbGUgdGhlIGRyaXZlciBjYXJyaWVzIG9uIHNlbmRpbmcgNCBhZGRyZXNzCj4gYnl0
ZXMuIFRoZSByZXN0IG9mIHRoZSB0cmFuc2ZlciBpcyBhZGRyZXNzZWQgd3JvbmdseSBhbmQgcmV0
dXJucyB3cm9uZwo+IGRhdGEsIGFuZCBub3RoaW5nIHJlcG9ydHMgYW4gZXJyb3IuIEEgcmVzdG9y
ZSBtYXkgYWxzbyBzb2Z0IHJlc2V0IHRoZQo+IGNoaXAgaW4gdGhlIG1pZGRsZSBvZiB0aGF0IHNh
bWUgcmVhZC4KPgo+IFRha2Ugbm9yLT5sb2NrIGZvciB0aGUgcmVzdG9yZSwgc28gaXQgcnVucyBi
ZXR3ZWVuIG9wZXJhdGlvbnMgaW5zdGVhZCBvZgo+IGR1cmluZyBvbmU6IGEgcHJvZ3JhbSBvciBl
cmFzZSBoYXMgZmluaXNoZWQgd2FpdGluZyBvbiB0aGUgY2hpcCwgYW5kIGEKPiByZWFkIGhhcyBp
c3N1ZWQgaXRzIGxhc3QgY2h1bmsuIFRoaXMgaXMgYSBsb2NraW5nIGZpeCByYXRoZXIgdGhhbiBh
Cj4gbWlzc2luZyB3YWl0IC0gZWFjaCBvcGVyYXRpb24gYWxyZWFkeSB3YWl0cyBmb3IgY29tcGxl
dGlvbiBhdCB0aGUgc2l0ZQo+IHRoYXQgc3RhcnRlZCBpdC4KPgo+IFRoaXMgbmFycm93cyB0aGUg
cmFjZSB3aXRob3V0IGNsb3NpbmcgaXQuIFRoZSByZXN0b3JlIHN0aWxsIHJ1bnMgd2hpbGUKPiBN
VEQgdXNlcnMgYXJlIGF0dGFjaGVkLCBzbyBhbiBvcGVyYXRpb24gdGhhdCBzdGFydHMgYWZ0ZXIg
aXQgaGFzCj4gY29tcGxldGVkIHdpbGwgYWRkcmVzcyBhIGNoaXAgdGhhdCBpcyBub3cgaW4gMy1i
eXRlIG1vZGUgd2hpbGUKPiBub3ItPmFkZHJfbmJ5dGVzIGlzIHN0aWxsIDQuIENsb3NpbmcgdGhh
dCBhcyB3ZWxsIHdvdWxkIG1lYW4gaGF2aW5nIE1URAo+IHN0b3AgYWNjZXB0aW5nIG9wZXJhdGlv
bnMgYmVmb3JlIC0+c2h1dGRvd24gcnVucywgd2hpY2ggaXMgYSBsYXJnZXIKPiBjaGFuZ2U7IHNl
cmlhbGlzaW5nIGFnYWluc3QgdGhlIG9wZXJhdGlvbnMgYWxyZWFkeSBpbiBmbGlnaHQgaXMgd2hh
dAo+IGtlZXBzIHRoZSByZXN0b3JlIGl0c2VsZiBmcm9tIGJlaW5nIGlzc3VlZCBpbnRvIGEgYnVz
eSBjaGlwLgoKNiBwYXJhZ3JhcGhzIHRvIHRlbGwgIkFjY2Vzc2VzIHRvIHRoZSBmbGFzaCBzaG91
bGQgYmUKc2VyaWFsaXplZCIuIFBsZWFzZSByZWR1Y2UgaXQuCgo+IEZpeGVzOiA1OWIzNTZmZmQw
YjAgKCJtdGQ6IG0yNXA4MDogcmVzdG9yZSB0aGUgc3RhdHVzIG9mIFNQSSBmbGFzaCB3aGVuIGV4
aXRpbmciKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogSXRh
aSBIYW5kbGVyIDxpdGFpLmhhbmRsZXJAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuYyB8IDEzICsrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gaW5kZXggOGJjMTE3YjQ2ZTAyLi42NDdiZjhk
Y2U3MTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiArKysgYi9k
cml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IEBAIC0zODYyLDggKzM4NjIsMjEgQEAgc3RhdGlj
IGludCBzcGlfbm9yX3JlbW92ZShzdHJ1Y3Qgc3BpX21lbSAqc3BpbWVtKQo+ICBzdGF0aWMgdm9p
ZCBzcGlfbm9yX3NodXRkb3duKHN0cnVjdCBzcGlfbWVtICpzcGltZW0pCj4gIHsKPiAgCXN0cnVj
dCBzcGlfbm9yICpub3IgPSBzcGlfbWVtX2dldF9kcnZkYXRhKHNwaW1lbSk7Cj4gKwlpbnQgcmV0
Owo+ICsKPiArCS8qCj4gKwkgKiBXYWl0IGZvciBhbiBvcGVyYXRpb24gc3RhcnRlZCBieSBhbm90
aGVyIHRocmVhZCB0byBmaW5pc2guCj4gKwkgKiBkZXZpY2Vfc2h1dGRvd24oKSBydW5zIHdpdGgg
TVREIHVzZXJzIHN0aWxsIGFjdGl2ZTogYSBidXN5IGZsYXNoCj4gKwkgKiBpZ25vcmVzIHRoZSBj
b21tYW5kcyBzcGlfbm9yX3Jlc3RvcmUoKSBpc3N1ZXMsIGxlYXZpbmcgaXQgaW4KPiArCSAqIDQt
Ynl0ZSBhZGRyZXNzIG1vZGUsIGFuZCBhIHJlc3RvcmUgbGFuZGluZyBtaWQtcmVhZCBjaGFuZ2Vz
IHRoZQo+ICsJICogY2hpcCdzIGFkZHJlc3Mgd2lkdGggdW5kZXIgdGhlIHRyYW5zZmVyLgo+ICsJ
ICovCgpJJ20gZmluZSB3aXRoIHRoZSBkaWZmLCBidXQgcGxlYXNlIGRyb3AgdGhpcyBjb21tZW50
LgoKVGhhbmtzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
