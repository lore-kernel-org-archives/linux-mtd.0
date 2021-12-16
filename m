Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C989FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 15:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ivtTQc3MgczCsnD+bpQJtxjqDjc46hkh1tDWe0nmbxQ=; b=YJYCf2EAXAPcTJ
	dIJV973JhoosiL4YXuyr0/10eyEejNtWICJj88Jelz0/T6ftkfBbwMKNR5YwnqQTEgokNCMlgkJO2
	gIVfwWEIRzePg7YsrQSgOzM6/gfqLLJxMTiLfHkGmf21jHEK4azdSxSWFzVveEpWv0AbqMfOIgXZb
	cAzDJ7s1W41VOlRqp3oIRPSoSN+7utC9+GYMVPvX7swP6Q5eufvysr0Ya3ITh0k+FN6WPKscQOOOU
	LaGw8fmiqjwvafN/zrKCe5qdnY4ZJSnlLJg38e8RBC+tubaSOiYDs6d2wBn5ihRbhwTXEzY/f5DXh
	j5FjuyvWGQOHCMjnHnGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxt3d-006PxR-RI; Thu, 16 Dec 2021 15:52:37 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxt3Y-006Pw5-MH
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 15:52:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C46A920000C;
 Thu, 16 Dec 2021 15:52:25 +0000 (UTC)
Date: Thu, 16 Dec 2021 16:52:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Rob
 Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 20/28] spi: spi-mem: Fill the spi-mem controller
 capabilities of all the drivers
Message-ID: <20211216165224.7d80a33c@xps13>
In-Reply-To: <20211216111654.238086-21-miquel.raynal@bootlin.com>
References: <20211216111654.238086-1-miquel.raynal@bootlin.com>
 <20211216111654.238086-21-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_075232_906455_72F3BD7A 
X-CRM114-Status: GOOD (  13.67  )
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

SGVsbG8gYWxsLAoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLW1lbS5jIGIvZHJpdmVy
cy9zcGkvc3BpLW1lbS5jCj4gaW5kZXggYzRkYTBjOWIwNWU5Li5iZmQ1YzZiMmRiMGEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLW1lbS5jCj4gKysrIGIvZHJpdmVycy9zcGkvc3BpLW1l
bS5jCj4gQEAgLTE2MCw2ICsxNjAsOSBAQCBzdGF0aWMgYm9vbCBzcGlfbWVtX2NoZWNrX2J1c3dp
ZHRoKHN0cnVjdCBzcGlfbWVtICptZW0sCj4gIAlyZXR1cm4gdHJ1ZTsKPiAgfQo+ICAKPiArY29u
c3Qgc3RydWN0IHNwaV9jb250cm9sbGVyX21lbV9jYXBzIHNwaV9tZW1fbm9fY2FwcyA9IHt9Owo+
ICtFWFBPUlRfU1lNQk9MX0dQTChzcGlfbWVtX25vX2NhcHMpOwoKQXMgc3VnZ2VzdGVkIGJ5IEJv
cmlzIG9uIElSQywgd2UgbWlnaHQganVzdCBmaW5kIGEgd2F5IHRvIGF2b2lkCmRlZmluaW5nIHRo
aXMgZW1wdHkgc3RydWN0dXJlIGFuZCByZXF1ZXN0aW5nIGFsbCBkcml2ZXJzIHRvIHByb3ZpZGUg
b25lLgoKQXMgaXQgdHVybnMgb3V0LCB0aGVyZSBpcyBubyBwZXItY29udHJvbGxlciBzcGktbWVt
IGluaXRpYWxpemF0aW9uCndoZXJlIHdlIGNvdWxkIHByb3ZpZGUgYSBkZWZhdWx0IHNldCBvZiBj
YXBhYmlsaXRpZXMsIGJ1dCBJIGJlbGlldmUgd2UKY291bGQgaGlkZSB0aGUgbGl0dGxlIGV4dHJh
IGNvbXBsZXhpdHkgd2l0aCBzb21ldGhpbmcgbGlrZToKCiNkZWZpbmUgc3BpX21lbV9jb250cm9s
bGVyX2lzX2NhcGFibGUobWVtLCBjYXApIFwKCSgobWVtKS0+Y3Rsci0+Y2FwcyAmJiAobWVtKS0+
Y3RybC0+Y2Fwcy0+IyNjYXApCgpBbmQgdXNpbmcgdGhlIGFib3ZlIGhlbHBlciBpbiBzcGlfbWVt
X2RlZmF1bHRfc3VwcG9ydHNfb3AoKSwgd2hpY2gKd291bGQgdHJhbnNwYXJlbnRseSBoYW5kbGUg
dGhlICFjYXBzIHNpdHVhdGlvbi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS5jIGIv
ZHJpdmVycy9zcGkvc3BpLmMKPiBpbmRleCA1N2UyNDk5ZWMxZWQuLjU4YzVjYjk4NTQzMSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGkuYwo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS5jCj4g
QEAgLTI3NDcsNiArMjc0Nyw5IEBAIHN0YXRpYyBpbnQgc3BpX2NvbnRyb2xsZXJfY2hlY2tfb3Bz
KHN0cnVjdCBzcGlfY29udHJvbGxlciAqY3RscikKPiAgCWlmIChjdGxyLT5tZW1fb3BzKSB7Cj4g
IAkJaWYgKCFjdGxyLT5tZW1fb3BzLT5leGVjX29wKQo+ICAJCQlyZXR1cm4gLUVJTlZBTDsKPiAr
Cj4gKwkJaWYgKCFjdGxyLT5tZW1fb3BzLT5jYXBzKQo+ICsJCQlyZXR1cm4gLUVJTlZBTDsKPiAg
CX0gZWxzZSBpZiAoIWN0bHItPnRyYW5zZmVyICYmICFjdGxyLT50cmFuc2Zlcl9vbmUgJiYKPiAg
CQkgICAhY3Rsci0+dHJhbnNmZXJfb25lX21lc3NhZ2UpIHsKPiAgCQlyZXR1cm4gLUVJTlZBTDsK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zcGkvc3BpLW1lbS5oIGIvaW5jbHVkZS9saW51
eC9zcGkvc3BpLW1lbS5oCj4gaW5kZXggNDJmMzg1MDYxMGI1Li41ZjcyOGYzMTEzYmQgMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9zcGkvc3BpLW1lbS5oCj4gKysrIGIvaW5jbHVkZS9saW51
eC9zcGkvc3BpLW1lbS5oCj4gQEAgLTM2Niw2ICszNjYsNyBAQCBib29sIHNwaV9tZW1fZHRyX3N1
cHBvcnRzX29wKHN0cnVjdCBzcGlfbWVtICptZW0sCj4gIAo+ICBpbnQgc3BpX21lbV9hZGp1c3Rf
b3Bfc2l6ZShzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3ApOwo+ICAK
PiArY29uc3Qgc3RydWN0IHNwaV9jb250cm9sbGVyX21lbV9jYXBzIHNwaV9tZW1fbm9fY2FwczsK
PiAgYm9vbCBzcGlfbWVtX3N1cHBvcnRzX29wKHN0cnVjdCBzcGlfbWVtICptZW0sCj4gIAkJCSBj
b25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3ApOwo+ICAKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
