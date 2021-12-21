Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D05C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSAgmLdYilcxsVd/LkPZqpfOvIu1sGKsu2WsZLkhJ4o=; b=us14UvLuFO/54p
	DlFfx1xOm8SMOu3B4tCueDMmo0xqNI9Yu/ONIH4XrvLj1KtiiQ7CovSQix4JK4BntIJI5EIH9egO6
	Si8zrWf5Y9MmVGIWYW7nDr8xm8VpGZS40pHeUtILHBl7H2m/j2y/8EVrX+WOKEK8ZCV09sqlpTQyY
	iL66uOlI3aDoYBUB1jDjs5Tqhi2xsewmmC1StDCCSnlNzs05jCnx4A0QnHKD6WMbzUN/V44r3A39y
	orD3SaJzsC8SXTx1Cuh7hE3aOmRXlcodZ3N0JwXeINlmjJvaUyDlU6XIWJ7QIU8REOI3AwVM2SmT3
	CzdBKyRJdEo6Y3FqxVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzcC5-006Mmj-6g; Tue, 21 Dec 2021 10:16:29 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzcC2-006Mkj-4T
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 10:16:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9179B6000C;
 Tue, 21 Dec 2021 10:16:21 +0000 (UTC)
Date: Tue, 21 Dec 2021 11:16:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v7 04/14] spi: cadence: Provide a capability structure
Message-ID: <20211221111605.352285f5@xps13>
In-Reply-To: <20211220185515.wujhgn66mnwns7bw@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-5-miquel.raynal@bootlin.com>
 <20211220185515.wujhgn66mnwns7bw@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_021626_354674_AA9BA003 
X-CRM114-Status: GOOD (  23.91  )
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBUdWUsIDIxIERlYyAyMDIxIDAw
OjI1OjE4ICswNTMwOgoKPiA+IFN1YmplY3Q6IFtQQVRDSCB2NyAwNC8xNF0gc3BpOiBjYWRlbmNl
OiBQcm92aWRlIGEgY2FwYWJpbGl0eSBzdHJ1Y3R1cmUgIAo+IAo+IHMvY2FkZW5jZS9jYWRlbmNl
LXF1YWRzcGkvCgpSaWdodC4KCj4gCj4gT24gMTcvMTIvMjEgMDU6MTZQTSwgTWlxdWVsIFJheW5h
bCB3cm90ZToKPiA+IFRoaXMgY29udHJvbGxlciBoYXMgRFRSIHN1cHBvcnQsIHNvIGFkdmVydGl6
ZSBpdCB3aXRoIGEgY2FwYWJpbGl0eSBub3cKPiA+IHRoYXQgdGhlIHNwaV9jb250cm9sbGVyX21l
bV9vcHMgc3RydWN0dXJlIGNvbnRhaW5zIHRoaXMgbmV3IGZpZWxkLiBUaGlzCj4gPiB3aWxsIGxh
dGVyIGJlIHVzZWQgYnkgdGhlIGNvcmUgdG8gZGlzY3JpbWluYXRlIHdoZXRoZXIgYW4gb3BlcmF0
aW9uIGlzCj4gPiBzdXBwb3J0ZWQgb3Igbm90LCBpbiBhIG1vcmUgZ2VuZXJpYyB3YXkgdGhhbiBo
YXZpbmcgZGlmZmVyZW50IGhlbHBlcnMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3Nw
aS9zcGktY2FkZW5jZS1xdWFkc3BpLmMgfCA1ICsrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWNhZGVu
Y2UtcXVhZHNwaS5jIGIvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jCj4gPiBpbmRl
eCAxMDFjYzcxYmZmYTcuLjk4ZTBjYzQyMzZlMyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc3Bp
L3NwaS1jYWRlbmNlLXF1YWRzcGkuYwo+ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2Ut
cXVhZHNwaS5jCj4gPiBAQCAtMTM4OCwxMCArMTM4OCwxNSBAQCBzdGF0aWMgY29uc3QgY2hhciAq
Y3FzcGlfZ2V0X25hbWUoc3RydWN0IHNwaV9tZW0gKm1lbSkKPiA+ICAJcmV0dXJuIGRldm1fa2Fz
cHJpbnRmKGRldiwgR0ZQX0tFUk5FTCwgIiVzLiVkIiwgZGV2X25hbWUoZGV2KSwgbWVtLT5zcGkt
PmNoaXBfc2VsZWN0KTsKPiA+ICB9Cj4gPiAgCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlf
Y29udHJvbGxlcl9tZW1fY2FwcyBjcXNwaV9tZW1fY2FwcyA9IHsKPiA+ICsJLmR0ciA9IHRydWUs
Cj4gPiArfTsKPiA+ICsKPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9jb250cm9sbGVyX21l
bV9vcHMgY3FzcGlfbWVtX29wcyA9IHsKPiA+ICAJLmV4ZWNfb3AgPSBjcXNwaV9leGVjX21lbV9v
cCwKPiA+ICAJLmdldF9uYW1lID0gY3FzcGlfZ2V0X25hbWUsCj4gPiAgCS5zdXBwb3J0c19vcCA9
IGNxc3BpX3N1cHBvcnRzX21lbV9vcCwKPiA+ICsJLmNhcHMgPSAmY3FzcGlfbWVtX2NhcHMsICAK
PiAKPiBJIGp1c3Qgbm90aWNlZCB5b3UgcHV0IGl0IHVuZGVyIHN0cnVjdCBzcGlfbWVtX29wcywg
bm90IHVuZGVyIHN0cnVjdCAKPiBzcGlfbWVtLiBUaGlzIGlzIG5vdCBhbiBvcGVyYXRpb24gcGVy
IHNlIHNvIHdvdWxkbid0IGl0IGJlIGJldHRlciBpZiBpdCAKPiBpcyBtb3ZlZCB0byBzdHJ1Y3Qg
c3BpX21lbT8KCkkgaGFkIGEgaGFyZCB0aW1lIHRha2luZyBhIGRlY2lzaW9uIGJ1dCBteSBjb25j
bHVzaW9uIHdhcyB0aGF0IHRoZXNlCmNhcHMgYXJlIHN0YXRpYyBjb250cm9sbGVyIGNhcGFiaWxp
dGllcyBhbmQgZXhjbHVzaXZlbHkgdGlnaHQgdG8gdGhlCmNvbnRyb2xsZXIuIFRoZSBzcGlfbWVt
IHN0cnVjdHVyZSBkZWZpbmVzIGEgU1BJIHBlcmlwaGVyYWwuIFRoZQpzcGlfbWVtX29wcyBzdHJ1
Y3R1cmUgaXMgdGhlIG9ubHkgc3BpLW1lbSByZWxhdGVkIGZpZWxkIG9mIHRoZQpzcGktY29udHJv
bGxlciBzdHJ1Y3R1cmUuIEkgY291bGQgaGF2ZSBhZGRlZCBteSBvd24gZmllbGQgdGhlcmUgYnV0
CmFzIHRoZXNlIGNhcHMgYXJlIG9ubHkgbWVhbnQgdG8gYmUgdXNlZCBieSB0aGUgc3BpX21lbV9v
cHMgYW55d2F5CihleGNsdXNpdmVseSAtPnN1cHBvcnRzX29wKCkgZm9yIG5vdyksIGl0IHNlZW1l
ZCB0byBiZSBhIGdvb2QgbG9jYXRpb24sCmF0IGxlYXN0IGJldHRlciB0aGFuIHRoZSBzcGktbWVt
IHN0cnVjdHVyZS4KCj4gQW55d2F5LCB0aGUgY2hhbmdlIGl0c2VsZiBsb29rcyBnb29kIHRvIG1l
LiBUaGUgY3FzcGlfc3VwcG9ydHNfbWVtX29wKCkKPiBhbHJlYWR5IGNoZWNrcyBmb3IgbWl4ZWQg
RFRSIG1vZGVzIHNvIHdlIHNob3VsZCBiZSBnb29kLgoKWWVwIQoKPiAKPiA+ICB9Owo+ID4gIAo+
ID4gIHN0YXRpYyBpbnQgY3FzcGlfc2V0dXBfZmxhc2goc3RydWN0IGNxc3BpX3N0ICpjcXNwaSkK
PiA+IC0tIAo+ID4gMi4yNy4wCj4gPiAgIAo+IAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
