Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A40C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Dec 2021 17:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4f3RAjLqaMFamHFv9yGgzeoreIHM8cGL8dTjcz92+Y4=; b=iMCoC0n+8w+RZn
	HrJuSHIDgEqBkgBXTk06fZYlJMVsh2xHeaGCzOD0wRJouSS9BUKSQw6SAzv2s+SXk6zEM6fCubt0G
	7aFry3fbfpax1ALc7hh+SVJ2fdRHRJ1BaJzHFBr37tl8Ngw8fDp9RclpNqx4vH2rUylHtSu1zaDbq
	rHW28p9AxBdKMbuNPxDgkdcalIgOOW0ajNb8drxj1Fq+SHFUlptPGCAXNQ1PX1RABHECK3gc+/gS/
	ywitGK0D3QijMcbGppgpbtFVJ+ifVbs0G+Ll+LXjI9JYLJr+0Asl3gkFQZsP8Kycva+ZtvmW5VJao
	OAq8ZXCyyy3705JwXaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxYKV-0028W3-ON; Wed, 15 Dec 2021 17:44:39 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxYKS-0028Ud-4X
 for linux-mtd@lists.infradead.org; Wed, 15 Dec 2021 17:44:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 113D61C0003;
 Wed, 15 Dec 2021 17:44:27 +0000 (UTC)
Date: Wed, 15 Dec 2021 18:44:26 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v5 12/13] spi: mxic: Use spi_mem_generic_supports_op()
Message-ID: <20211215184426.67fd3912@xps13>
In-Reply-To: <20211214172410.2b26c17e@collabora.com>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
 <20211214114140.54629-13-miquel.raynal@bootlin.com>
 <20211214172410.2b26c17e@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_094436_471900_81EF0EBC 
X-CRM114-Status: GOOD (  28.19  )
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

SGkgQm9yaXMsCgpib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbSB3cm90ZSBvbiBUdWUsIDE0
IERlYyAyMDIxIDE3OjI0OjEwICswMTAwOgoKPiBPbiBUdWUsIDE0IERlYyAyMDIxIDEyOjQxOjM5
ICswMTAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6
Cj4gCj4gPiBUaGlzIGRyaXZlciBjYW4gYmUgc2ltcGxpZmllZCBhIGxpdHRsZSBiaXQgYnkgdXNp
bmcKPiA+IHNwaV9tZW1fZ2VuZXJpY19zdXBwb3J0c19vcCgpIGluc3RlYWQgb2YgdGhlCj4gPiBz
cGlfbWVtX2RlZmF1bHQvZHRyX3N1cHBvcnRzX29wKCkgY291cGxlLiBUaGUgYWxsX2ZhbHNlIGJv
b2xlYW4gaXMKPiA+IGludmVydGVkIHRvIGJlY29tZSBhIGR0ciBib29sZWFuLCB3aGljaCBjaGVj
a3MgaWYgYXQgbGVhc3Qgb25lIG9mIHRoZQo+ID4gb3BlcmF0aW9uIG1lbWJlciB1c2VzIGR0ciBt
b2RlLiBUaGUgaWRlYSBiZWhpbmQgdGhpcyBjaGFuZ2UgaXMgdG8KPiA+IHNpbXBsaWZ5IHRoZSBp
bnRyb2R1Y3Rpb24gb2YgdGhlIHBpcGVsaW5lZCBFQ0MgZW5naW5lLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9zcGkvc3BpLW14aWMuYyB8IDEwICsrKy0tLS0tLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zcGkvc3BpLW14aWMuYyBiL2RyaXZlcnMvc3BpL3NwaS1teGljLmMKPiA+
IGluZGV4IDQ4NWE3ZjJhZmI0NC4uNWU3MWFhNjMwNTA0IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9zcGkvc3BpLW14aWMuYwo+ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLW14aWMuYwo+ID4gQEAg
LTQ1Miw3ICs0NTIsNyBAQCBzdGF0aWMgc3NpemVfdCBteGljX3NwaV9tZW1fZGlybWFwX3dyaXRl
KHN0cnVjdCBzcGlfbWVtX2Rpcm1hcF9kZXNjICpkZXNjLAo+ID4gIHN0YXRpYyBib29sIG14aWNf
c3BpX21lbV9zdXBwb3J0c19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLAo+ID4gIAkJCQkgICAgIGNv
bnN0IHN0cnVjdCBzcGlfbWVtX29wICpvcCkKPiA+ICB7Cj4gPiAtCWJvb2wgYWxsX2ZhbHNlOwo+
ID4gKwlzdHJ1Y3Qgc3BpX21lbV9jb250cm9sbGVyX2NhcHMgY2FwcyA9IHt9Owo+ID4gIAo+ID4g
IAlpZiAob3AtPmRhdGEuYnVzd2lkdGggPiA4IHx8IG9wLT5hZGRyLmJ1c3dpZHRoID4gOCB8fAo+
ID4gIAkgICAgb3AtPmR1bW15LmJ1c3dpZHRoID4gOCB8fCBvcC0+Y21kLmJ1c3dpZHRoID4gOCkK
PiA+IEBAIC00NjUsMTMgKzQ2NSw5IEBAIHN0YXRpYyBib29sIG14aWNfc3BpX21lbV9zdXBwb3J0
c19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLAo+ID4gIAlpZiAob3AtPmFkZHIubmJ5dGVzID4gNykK
PiA+ICAJCXJldHVybiBmYWxzZTsKPiA+ICAKPiA+IC0JYWxsX2ZhbHNlID0gIW9wLT5jbWQuZHRy
ICYmICFvcC0+YWRkci5kdHIgJiYgIW9wLT5kdW1teS5kdHIgJiYKPiA+IC0JCSAgICAhb3AtPmRh
dGEuZHRyOwo+ID4gKwljYXBzLmR0ciA9IG9wLT5jbWQuZHRyIHx8IG9wLT5hZGRyLmR0ciB8fCBv
cC0+ZHVtbXkuZHRyIHx8IG9wLT5kYXRhLmR0cjsgIAo+IAo+IEFyZSB5b3Ugc3VyZSB0aGF0J3Mg
d2hhdCB5b3Ugd2FudCB0byBkbz8gc3BpX21lbV9jb250cm9sbGVyX2NhcHMgaXMKPiBzdXBwb3Nl
ZCB0byBlbmNvZGUgdGhlIGNvbnRyb2xsZXIgY2FwYWJpbGl0aWVzLCBub3Qgd2hldGhlciB0aGUK
PiBvcGVyYXRpb24gY29udGFpbnMgYSBEVFIgY3ljbGUgb3Igbm90LiBJJ2QgZXhwZWN0IHRoaXMg
Y2FwcyBvYmplY3QgdG8gYmUKPiBzdGF0aWNhbGx5IGRlZmluZWQsIHdpdGggcG9zc2libHkgb25l
IGluc3RhbmNlIHBlci1jb21wYXQgaWYgdGhlIGNhcHMKPiBkZXBlbmQgb24gdGhlIEhXIHJldmlz
aW9uLgoKSW4gb3JkZXIgdG8ga2VlcCB0aGUgc2VyaWVzIGVhc3kgdG8gcmV2aWV3IEkgZGVjaWRl
ZCB0byBnbyBmb3IgdGhlCmZvbGxvd2luZyBhcHByb2FjaDoKKiBJbnRyb2R1Y2UgdGhlIHNwaV9t
ZW1fZ2VuZXJpY19zdXBwb3J0c19vcF9oZWxwZXIoKSB3aGljaCB0YWtlcyBhCiAgY2FwYWJpbGl0
aWVzIHN0cnVjdHVyZS4gVGhpcyBoZWxwZXIgZ2F0aGVycyBhbGwgdGhlIGNoZWNrcyBmcm9tCiAg
c3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKCkgYW5kIHNwaV9tZW1fZHRyX3N1cHBvcnRzX29w
KCkuIFRoZXNlCiAgdHdvIGhlbHBlcnMgbm93IGNhbGwgdGhlIG5ldyBvbmUgd2l0aCBlaXRoZXIg
YSBOVUxMIHBvaW50ZXIgaW4gdGhlCiAgZm9ybWVyIGNhc2UsIG9yIGEgc3RydWN0dXJlIHdpdGgg
dGhlIC5kdHIgcGFyYW1ldGVyIHNldCB0byB0cnVlIGluCiAgdGhlIGxhdHRlci4KKiBDaGFuZ2Ug
dGhlIEFQSSBvZiBzcGlfbWVtX2RlZmF1bHRfc3VwcG9ydHNfb3AoKSwgdGhpcyBpbnZvbHZlcwog
IHVwZGF0aW5nIG1hbnkgZGlmZmVyZW50IGRyaXZlcnMgc28gdGhpcyBjaGFuZ2UgZG9lcyBvbmx5
IHRoYXQgaW4gYQogIHZlcnkgdHJhbnNwYXJlbnQgd2F5LCB3aXRoIG5vIGZ1bmN0aW9uYWwgY2hh
bmdlcyBhdCBhbGwuIEFsbCB0aGUKICBkcml2ZXJzIHByb3ZpZGUgYSBOVUxMIHBhcmFtZXRlciBm
b3IgdGhlIGNhcGFiaWxpdGllcyBzdHJ1Y3R1cmUuCiogQWN0dWFsbHkgbWFrZSB1c2Ugb2YgdGhl
IG5ldyBwYXJhbWV0ZXIgb2YKICBzcGlfbWVtX2RlZmF1bHRfc3VwcG9ydHNfb3AoKSBpbiB0aGUg
ZHJpdmVycyBDYWRlbmNlIGFuZCBNYWNyb25peCwKICB3aGljaCBkbyBoYXZlIERUUiBzdXBwb3J0
LiBUaGlzIGtpbGxzIHRoZSBzcGlfbWVtX2R0cl9zdXBwb3J0c19vcCgpCiAgaGVscGVyLgoqIEtp
bGwgdGhlIHRlbXBvcmFyeSBzcGlfbWVtX2dlbmVyaWNfc3VwcG9ydHNfb3AoKSBoZWxwZXIgYnkg
bW92aW5nCiAgYWxsIHRoZSBsb2dpYyBiYWNrIGludG8gc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRz
X29wKCkuCgpUaGlzIGFwcHJvYWNoIGlzIHJlYWxseSBzdHJhaWdodGZvcndhcmQgYW5kIGVhc2ls
eSBiaXNlY3RhYmxlIGlmCm5lZWRlZC4gV2hpbGUgd29ya2luZyBvbiB0aGlzLCBJIGZpeGVkIHRo
ZSBjaGVjayB3ZSBkaXNjdXNzZWQgb24gSVJDCmFib3V0IHRoZSBjb21tYW5kIHBhcmFtZXRlciB3
aGVuIGluIGEgRFRSIG9wZXJhdGlvbi4gSSBhbHNvIHJldmVydGVkCnRoZSBsb2dpYyBpbiB0aGUg
dmFyaW91cyBjaGVja3MsIGFzIHlvdSBzdWdnZXN0ZWQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
