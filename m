Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63EDC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 17:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wa1mKuzyY+TD2FvbyFnmE/Pe3njmBNpwbjGPtF+h3qc=; b=1HTNbWd5MkH0BM
	wrq/TeKu+LDerrgEG0IgpbhwLnf4uriArhSRbSoAalsB7pSZwEuv9nCW1C1Lh9zqTkhO1YzvvqJqB
	YwDnkmX5tWNqssWk48JjtEoIMYxIBd0h6H5NZ7/12FbN2w7OL2JJHnfTpKMP35sw2Q3FYeJ7WSk3K
	csEryblcInM0/tqhJKXhmZucDzZniRHtPGuWrJCnnOxQKEqdHUK27toMchghfa7SGA32lfXSdCkO6
	7Z4CBUiSEeFeJn1aEqv5lvGjIMs1K/NlXolVbKxaAUW0rCqMsDqFG9wQvi52EESxQ05Q0FLzvKViR
	yVmRUCX/MSgrrgJv3UOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzj50-007t86-7P; Tue, 21 Dec 2021 17:37:38 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzj4w-007t6s-Ml
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 17:37:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C09A86000B;
 Tue, 21 Dec 2021 17:37:29 +0000 (UTC)
Date: Tue, 21 Dec 2021 18:37:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v7 07/14] spi: spi-mem: Add an ecc_en parameter to the
 spi_mem_op structure
Message-ID: <20211221183728.6600aae4@xps13>
In-Reply-To: <20211220190227.oqvpcfrro32ic32b@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-8-miquel.raynal@bootlin.com>
 <20211220190227.oqvpcfrro32ic32b@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_093735_047857_1E76DB60 
X-CRM114-Status: GOOD (  25.61  )
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
OjMyOjI5ICswNTMwOgoKPiBPbiAxNy8xMi8yMSAwNToxNlBNLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+ID4gU29vbiB0aGUgU1BJLU5BTkQgY29yZSB3aWxsIG5lZWQgYSB3YXkgdG8gcmVxdWVzdCBh
IFNQSSBjb250cm9sbGVyIHRvCj4gPiBlbmFibGUgRUNDIHN1cHBvcnQgZm9yIGEgZ2l2ZW4gb3Bl
cmF0aW9uLiBUaGlzIGlzIGJlY2F1c2Ugb2YgdGhlCj4gPiBwaXBlbGluZWQgaW50ZWdyYXRpb24g
b2YgY2VydGFpbiBFQ0MgZW5naW5lcywgd2hpY2ggYXJlIGRpcmVjdGx5IG1hbmFnZWQKPiA+IGJ5
IHRoZSBTUEkgY29udHJvbGxlciBpdHNlbGYuCj4gPiAKPiA+IEludHJvZHVjZSBhIHNwaV9tZW1f
b3AgYWRkaXRpb25hbCBmaWVsZCBmb3IgdGhpcyBwdXJwb3NlOiBlY2NfZW4uCj4gPiAKPiA+IFNv
IGZhciB0aGlzIGZpZWxkIGlzIGxlZnQgdW5zZXQgYW5kIGNoZWNrZWQgdG8gYmUgZmFsc2UgYnkg
YWxsCj4gPiB0aGUgU1BJIGNvbnRyb2xsZXIgZHJpdmVycyBpbiB0aGVpciAtPnN1cHBvcnRzX29w
KCkgaG9vaywgYXMgdGhleSBhbGwKPiA+IGNhbGwgc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29w
KCkuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3NwaS9zcGktbWVtLmMgICAgICAgfCA1
ICsrKysrCj4gPiAgaW5jbHVkZS9saW51eC9zcGkvc3BpLW1lbS5oIHwgNSArKysrKwo+ID4gIDIg
ZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zcGkvc3BpLW1lbS5jIGIvZHJpdmVycy9zcGkvc3BpLW1lbS5jCj4gPiBpbmRleCBjZmUx
Yzk5ZGI1ZjMuLjk0NzU4ZTdlNzQ3ZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1t
ZW0uYwo+ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLW1lbS5jCj4gPiBAQCAtMTc4LDYgKzE3OCwx
MSBAQCBib29sIHNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0c19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVt
LAo+ID4gIAkJCXJldHVybiBmYWxzZTsKPiA+ICAJfQo+ID4gIAo+ID4gKwlpZiAob3AtPmVjY19l
bikgewo+ID4gKwkJaWYgKCFzcGlfbWVtX2NvbnRyb2xsZXJfaXNfY2FwYWJsZShjdGxyLCBlY2Mp
KQo+ID4gKwkJCXJldHVybiBmYWxzZTsKPiA+ICsJfQo+ID4gKwo+ID4gIAlyZXR1cm4gc3BpX21l
bV9jaGVja19idXN3aWR0aChtZW0sIG9wKTsKPiA+ICB9Cj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwo
c3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKTsKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L3NwaS9zcGktbWVtLmggYi9pbmNsdWRlL2xpbnV4L3NwaS9zcGktbWVtLmgKPiA+IGluZGV4
IGQ3Nzg3YzhmMzc0Ni4uZTkyMzhhODU4MTA5IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51
eC9zcGkvc3BpLW1lbS5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L3NwaS9zcGktbWVtLmgKPiA+
IEBAIC05NCw2ICs5NCw3IEBAIGVudW0gc3BpX21lbV9kYXRhX2RpciB7Cj4gPiAgICoJCSBvcGVy
YXRpb24gZG9lcyBub3QgaW52b2x2ZSB0cmFuc2ZlcnJpbmcgZGF0YQo+ID4gICAqIEBkYXRhLmJ1
Zi5pbjogaW5wdXQgYnVmZmVyIChtdXN0IGJlIERNQS1hYmxlKQo+ID4gICAqIEBkYXRhLmJ1Zi5v
dXQ6IG91dHB1dCBidWZmZXIgKG11c3QgYmUgRE1BLWFibGUpCj4gPiArICogQGVjY19lbjogZXJy
b3IgY29ycmVjdGlvbiBpcyByZXF1aXJlZAo+ID4gICAqLwo+ID4gIHN0cnVjdCBzcGlfbWVtX29w
IHsKPiA+ICAJc3RydWN0IHsKPiA+IEBAIC0xMjYsNiArMTI3LDggQEAgc3RydWN0IHNwaV9tZW1f
b3Agewo+ID4gIAkJCWNvbnN0IHZvaWQgKm91dDsKPiA+ICAJCX0gYnVmOwo+ID4gIAl9IGRhdGE7
Cj4gPiArCj4gPiArCWJvb2wgZWNjX2VuOyAgCj4gCj4gRUNDIHNob3VsZCBvbmx5IGNvbmNlcm4g
dGhlIGRhdGEgcGhhc2UgcmlnaHQ/IFdvdWxkIGl0IG1ha2UgbW9yZSBzZW5zZSAKPiB0byBtb3Zl
IHRoaXMgZmllbGQgdW5kZXIgZGF0YT8KPiAKPiBBbnl3YXksIEkgZG9uJ3Qga25vdyBtdWNoIGFi
b3V0IE5BTkQgb3IgRUNDIHNvIGVpdGhlciB3YXksCgpJJ3ZlIG1vdmVkIHRoZSBmaWVsZCB0byB0
aGUgZGF0YSBzdHJ1Y3QgYmVjYXVzZSBpdCBtYWtlcyBpbmRlZWQgbW9yZQpzZW5zZS4gSSd2ZSBh
bHNvIGNoYW5nZWQgdGhlIHR5cGUgYW5kIG5hbWUgdG8gInU4IGVjYyA6IDE7IiB0byBtYXRjaAp0
aGUgc3R5bGUgdXNlZCBmb3IgdGhlIGR0ciBwYXJhbWV0ZXIuCgo+IAo+IEFja2VkLWJ5OiBQcmF0
eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+Cj4gCj4gPiAgfTsKPiA+ICAKPiA+ICAjZGVmaW5l
IFNQSV9NRU1fT1AoX19jbWQsIF9fYWRkciwgX19kdW1teSwgX19kYXRhKQkJXAo+ID4gQEAgLTIy
Myw5ICsyMjYsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkICpzcGlfbWVtX2dldF9kcnZkYXRhKHN0
cnVjdCBzcGlfbWVtICptZW0pCj4gPiAgLyoqCj4gPiAgICogc3RydWN0IHNwaV9jb250cm9sbGVy
X21lbV9jYXBzIC0gU1BJIG1lbW9yeSBjb250cm9sbGVyIGNhcGFiaWxpdGllcwo+ID4gICAqIEBk
dHI6IFN1cHBvcnRzIERUUiBvcGVyYXRpb25zCj4gPiArICogQGVjYzogU3VwcG9ydHMgb3BlcmF0
aW9ucyB3aXRoIGVycm9yIGNvcnJlY3Rpb24KPiA+ICAgKi8KPiA+ICBzdHJ1Y3Qgc3BpX2NvbnRy
b2xsZXJfbWVtX2NhcHMgewo+ID4gIAlib29sIGR0cjsKPiA+ICsJYm9vbCBlY2M7Cj4gPiAgfTsK
PiA+ICAKPiA+ICAjZGVmaW5lIHNwaV9tZW1fY29udHJvbGxlcl9pc19jYXBhYmxlKGN0bHIsIGNh
cCkJCVwKPiA+IC0tIAo+ID4gMi4yNy4wCj4gPiAgIAo+IAoKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
