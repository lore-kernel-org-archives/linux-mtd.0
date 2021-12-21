Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507C1C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 11:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pk4+AcQc0lwvn5ha4z+iZfmhTNGbgL71/mxIpbupcSM=; b=IeFidu9hz+U1cB
	iRgmVBVxZ/I/yr9xEMRwLOn4b/5oBTH0ixj3InI/1mEeRV8axXppxYfwndXHaJhpqOfK76nLhLyqf
	A7h8JA9CeEdXRfsMQIiSWkHcpULu/TS5e3OUWqY/A5jzNyfz39cr28TgbP2ZS0OezxGbC0/ZkA+Lo
	Tg8GE0uKpXFM1BbyiZlKrdEj++/eOsScMbo6ynLuONKDoFnyT6YaTux64RsAj3LfWjhVDjQlpMQCb
	g6VRX/bFQ4uvE6UisXuo51qIKuQ6q6cxh9g0elgUvud5LrZ7wGAPoBZNmfOXnuS24uhEuo+DRzcgj
	F2a4tbAvzxpuyqW3FHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzdBZ-006Z58-KD; Tue, 21 Dec 2021 11:20:01 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzdBV-006Z3F-4i
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 11:19:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5F996E000D;
 Tue, 21 Dec 2021 11:19:48 +0000 (UTC)
Date: Tue, 21 Dec 2021 12:19:47 +0100
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
Message-ID: <20211221121947.5c779bfd@xps13>
In-Reply-To: <20211221104108.t563gg2hulfqt2uh@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-5-miquel.raynal@bootlin.com>
 <20211220185515.wujhgn66mnwns7bw@ti.com>
 <20211221111605.352285f5@xps13>
 <20211221104108.t563gg2hulfqt2uh@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_031957_493473_22F84304 
X-CRM114-Status: GOOD (  31.44  )
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBUdWUsIDIxIERlYyAyMDIxIDE2
OjExOjEwICswNTMwOgoKPiBPbiAyMS8xMi8yMSAxMToxNkFNLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+ID4gSGkgUHJhdHl1c2gsCj4gPiAKPiA+IHAueWFkYXZAdGkuY29tIHdyb3RlIG9uIFR1ZSwg
MjEgRGVjIDIwMjEgMDA6MjU6MTggKzA1MzA6Cj4gPiAgIAo+ID4gPiA+IFN1YmplY3Q6IFtQQVRD
SCB2NyAwNC8xNF0gc3BpOiBjYWRlbmNlOiBQcm92aWRlIGEgY2FwYWJpbGl0eSBzdHJ1Y3R1cmUg
ICAgCj4gPiA+IAo+ID4gPiBzL2NhZGVuY2UvY2FkZW5jZS1xdWFkc3BpLyAgCj4gPiAKPiA+IFJp
Z2h0Lgo+ID4gICAKPiA+ID4gCj4gPiA+IE9uIDE3LzEyLzIxIDA1OjE2UE0sIE1pcXVlbCBSYXlu
YWwgd3JvdGU6ICAKPiA+ID4gPiBUaGlzIGNvbnRyb2xsZXIgaGFzIERUUiBzdXBwb3J0LCBzbyBh
ZHZlcnRpemUgaXQgd2l0aCBhIGNhcGFiaWxpdHkgbm93Cj4gPiA+ID4gdGhhdCB0aGUgc3BpX2Nv
bnRyb2xsZXJfbWVtX29wcyBzdHJ1Y3R1cmUgY29udGFpbnMgdGhpcyBuZXcgZmllbGQuIFRoaXMK
PiA+ID4gPiB3aWxsIGxhdGVyIGJlIHVzZWQgYnkgdGhlIGNvcmUgdG8gZGlzY3JpbWluYXRlIHdo
ZXRoZXIgYW4gb3BlcmF0aW9uIGlzCj4gPiA+ID4gc3VwcG9ydGVkIG9yIG5vdCwgaW4gYSBtb3Jl
IGdlbmVyaWMgd2F5IHRoYW4gaGF2aW5nIGRpZmZlcmVudCBoZWxwZXJzLgo+ID4gPiA+IAo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRzcGku
YyB8IDUgKysrKysKPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4g
PiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3Bp
LmMgYi9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmMKPiA+ID4gPiBpbmRleCAxMDFj
YzcxYmZmYTcuLjk4ZTBjYzQyMzZlMyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3NwaS9z
cGktY2FkZW5jZS1xdWFkc3BpLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL3NwaS9zcGktY2FkZW5j
ZS1xdWFkc3BpLmMKPiA+ID4gPiBAQCAtMTM4OCwxMCArMTM4OCwxNSBAQCBzdGF0aWMgY29uc3Qg
Y2hhciAqY3FzcGlfZ2V0X25hbWUoc3RydWN0IHNwaV9tZW0gKm1lbSkKPiA+ID4gPiAgCXJldHVy
biBkZXZtX2thc3ByaW50ZihkZXYsIEdGUF9LRVJORUwsICIlcy4lZCIsIGRldl9uYW1lKGRldiks
IG1lbS0+c3BpLT5jaGlwX3NlbGVjdCk7Cj4gPiA+ID4gIH0KPiA+ID4gPiAgCj4gPiA+ID4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXJfbWVtX2NhcHMgY3FzcGlfbWVtX2NhcHMg
PSB7Cj4gPiA+ID4gKwkuZHRyID0gdHJ1ZSwKPiA+ID4gPiArfTsKPiA+ID4gPiArCj4gPiA+ID4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXJfbWVtX29wcyBjcXNwaV9tZW1fb3Bz
ID0gewo+ID4gPiA+ICAJLmV4ZWNfb3AgPSBjcXNwaV9leGVjX21lbV9vcCwKPiA+ID4gPiAgCS5n
ZXRfbmFtZSA9IGNxc3BpX2dldF9uYW1lLAo+ID4gPiA+ICAJLnN1cHBvcnRzX29wID0gY3FzcGlf
c3VwcG9ydHNfbWVtX29wLAo+ID4gPiA+ICsJLmNhcHMgPSAmY3FzcGlfbWVtX2NhcHMsICAgIAo+
ID4gPiAKPiA+ID4gSSBqdXN0IG5vdGljZWQgeW91IHB1dCBpdCB1bmRlciBzdHJ1Y3Qgc3BpX21l
bV9vcHMsIG5vdCB1bmRlciBzdHJ1Y3QgCj4gPiA+IHNwaV9tZW0uIFRoaXMgaXMgbm90IGFuIG9w
ZXJhdGlvbiBwZXIgc2Ugc28gd291bGRuJ3QgaXQgYmUgYmV0dGVyIGlmIGl0IAo+ID4gPiBpcyBt
b3ZlZCB0byBzdHJ1Y3Qgc3BpX21lbT8gIAo+ID4gCj4gPiBJIGhhZCBhIGhhcmQgdGltZSB0YWtp
bmcgYSBkZWNpc2lvbiBidXQgbXkgY29uY2x1c2lvbiB3YXMgdGhhdCB0aGVzZQo+ID4gY2FwcyBh
cmUgc3RhdGljIGNvbnRyb2xsZXIgY2FwYWJpbGl0aWVzIGFuZCBleGNsdXNpdmVseSB0aWdodCB0
byB0aGUKPiA+IGNvbnRyb2xsZXIuIFRoZSBzcGlfbWVtIHN0cnVjdHVyZSBkZWZpbmVzIGEgU1BJ
IHBlcmlwaGVyYWwuIFRoZQo+ID4gc3BpX21lbV9vcHMgc3RydWN0dXJlIGlzIHRoZSBvbmx5IHNw
aS1tZW0gcmVsYXRlZCBmaWVsZCBvZiB0aGUKPiA+IHNwaS1jb250cm9sbGVyIHN0cnVjdHVyZS4g
SSBjb3VsZCBoYXZlIGFkZGVkIG15IG93biBmaWVsZCB0aGVyZSBidXQKPiA+IGFzIHRoZXNlIGNh
cHMgYXJlIG9ubHkgbWVhbnQgdG8gYmUgdXNlZCBieSB0aGUgc3BpX21lbV9vcHMgYW55d2F5Cj4g
PiAoZXhjbHVzaXZlbHkgLT5zdXBwb3J0c19vcCgpIGZvciBub3cpLCBpdCBzZWVtZWQgdG8gYmUg
YSBnb29kIGxvY2F0aW9uLAo+ID4gYXQgbGVhc3QgYmV0dGVyIHRoYW4gdGhlIHNwaS1tZW0gc3Ry
dWN0dXJlLiAgCj4gCj4gQ2FuIHdlIGhhdmUgYSAzcmQgcGVyc29uIGNoaW1lIGluIGFuZCBicmVh
ayB0aGUgdGllPyA6LSkKCkkgZG9uJ3QgcXVpdGUgZ2V0IHdoeSB3ZSBzaG91bGQgcHV0IGNvbnRy
b2xsZXIgc3BlY2lmaWMgaW5mb3JtYXRpb24KaW50byB0aGUgbWVtb3J5IGRldmljZSBzdHJ1Y3R1
cmU/CgpBbnl3YXksIGRvIHlvdSBtaW5kIGlmIHdlIG1vdmUgZm9yd2FyZCBmaXJzdD8gTm90IHRo
YXQgSSBkb24ndCB0aGluawp0aGF0IHRoaXMgY2hvaWNlIHNob3VsZCBiZSBkaXNjdXNzZWQgZnVy
dGhlciwgYnV0IEkgdGhpbmsgdGhpcyBjYW4KZWFzaWx5IGJlIGNoYW5nZWQgaW4gdGhlIG5lYXIg
ZnV0dXJlIGlmIHRoZXJlIGlzIGEgZGVzaXJlIHRvCnJlb3JnYW5pemUgc3BpLW1lbSBvYmplY3Rz
LiBJbiBmYWN0LCB0aGVzZSBjYXBhYmlsaXRpZXMgYXJlIGFjY2Vzc2VkCnRocm91Z2ggYSBoZWxw
ZXIgc28gdGhhdCBoeXBvdGhldGljIGNoYW5nZSB3b3VsZCBiZSBhbG1vc3QgdHJhbnNwYXJlbnQu
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
