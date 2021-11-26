Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EA3C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzWBpgtCT6gaMk+AYvf4KUMEceZyuKFwna7aTqb/FmY=; b=U8ufuC/DyRXnlg
	HTyFV5Tto0NYiSuj1eQe4nM/NfW5/PLjZTZ8qvVXwYgGb1p9dvGUzkFwCL3Tabp+42yetig0ysQGG
	vWwJSApeFS3/RXaKHWTToMYs/hyUnslbWofJ3d/K0AM9EgGMC+unCfrD1hNAK+l1S+uv+EPxbQzWo
	AaeDDs1spiYn22+PQDDOj3iRMdiX1ihDDqHBJGLGbUOvX7wBQFRwP2yzteCG7YEl6Dvz9pnD8ZhHR
	CpI3Gt4Pl2TqiwEfAY9IjPlhx6+2arjo54MDfQG/hqM9ks468LrvcOJnEomLp3OBs9v/RktBAnf0x
	wuqLHzOM9K6iZU6MyBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqcZp-00AqPh-Op; Fri, 26 Nov 2021 14:51:49 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqcZn-00AqOv-FO
 for linux-mtd@lists.infradead.org; Fri, 26 Nov 2021 14:51:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id E6C5724000F;
 Fri, 26 Nov 2021 14:51:30 +0000 (UTC)
Date: Fri, 26 Nov 2021 15:51:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Boris
 Brezillon <bbrezillon@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 15/20] mtd: spinand: Create direct mapping
 descriptors for ECC operations
Message-ID: <20211126155128.5fba7ec0@xps13>
In-Reply-To: <20211126154706.2a528e72@collabora.com>
References: <20211126113924.310459-1-miquel.raynal@bootlin.com>
 <20211126113924.310459-16-miquel.raynal@bootlin.com>
 <20211126151352.3bdd2c1a@collabora.com>
 <20211126154223.28c71271@xps13>
 <20211126154706.2a528e72@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_065147_671175_8E635788 
X-CRM114-Status: GOOD (  22.24  )
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

SGkgQm9yaXMsCgpib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbSB3cm90ZSBvbiBGcmksIDI2
IE5vdiAyMDIxIDE1OjQ3OjA2ICswMTAwOgoKPiBPbiBGcmksIDI2IE5vdiAyMDIxIDE1OjQyOjIz
ICswMTAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6
Cj4gCj4gPiA+ID4gQEAgLTg2Niw2ICs4NzIsMjQgQEAgc3RhdGljIGludCBzcGluYW5kX2NyZWF0
ZV9kaXJtYXAoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ID4gPiA+ICAKPiA+ID4g
PiAgCXNwaW5hbmQtPmRpcm1hcHNbcGxhbmVdLnJkZXNjID0gZGVzYzsKPiA+ID4gPiAgCj4gPiA+
ID4gKwlpbmZvLm9wX3RtcGwgPSAqc3BpbmFuZC0+b3BfdGVtcGxhdGVzLnVwZGF0ZV9jYWNoZTsK
PiA+ID4gPiArCWluZm8ub3BfdG1wbC5lY2NfZW4gPSB0cnVlOwo+ID4gPiA+ICsJZGVzYyA9IGRl
dm1fc3BpX21lbV9kaXJtYXBfY3JlYXRlKCZzcGluYW5kLT5zcGltZW0tPnNwaS0+ZGV2LAo+ID4g
PiA+ICsJCQkJCSAgc3BpbmFuZC0+c3BpbWVtLCAmaW5mbyk7Cj4gPiA+ID4gKwlpZiAoSVNfRVJS
KGRlc2MpKQo+ID4gPiA+ICsJCXJldHVybiBQVFJfRVJSKGRlc2MpOwo+ID4gPiA+ICsKPiA+ID4g
PiArCXNwaW5hbmQtPmRpcm1hcHNbcGxhbmVdLndkZXNjX2VjYyA9IGRlc2M7Cj4gPiA+ID4gKwo+
ID4gPiA+ICsJaW5mby5vcF90bXBsID0gKnNwaW5hbmQtPm9wX3RlbXBsYXRlcy5yZWFkX2NhY2hl
Owo+ID4gPiA+ICsJaW5mby5vcF90bXBsLmVjY19lbiA9IHRydWU7Cj4gPiA+ID4gKwlkZXNjID0g
ZGV2bV9zcGlfbWVtX2Rpcm1hcF9jcmVhdGUoJnNwaW5hbmQtPnNwaW1lbS0+c3BpLT5kZXYsCj4g
PiA+ID4gKwkJCQkJICBzcGluYW5kLT5zcGltZW0sICZpbmZvKTsKPiA+ID4gPiArCWlmIChJU19F
UlIoZGVzYykpCj4gPiA+ID4gKwkJcmV0dXJuIFBUUl9FUlIoZGVzYyk7Cj4gPiA+ID4gKwo+ID4g
PiA+ICsJc3BpbmFuZC0+ZGlybWFwc1twbGFuZV0ucmRlc2NfZWNjID0gZGVzYzsKPiA+ID4gPiAr
ICAgICAgCj4gPiA+IAo+ID4gPiBEaXJlY3QgbWFwcGluZ3MgYXJlIG5vdCBmcmVlICh0aGV5IG1p
Z2h0IHJlc2VydmUgYSBwaWVjZSBvZiBNTUlPCj4gPiA+IGFkZHJlc3Mgc3BhY2UgZGVwZW5kaW5n
IG9uIHRoZSBzcGktbWVtIGNvbnRyb2xsZXIgaW1wbGVtZW50YXRpb24pLCBzbwo+ID4gPiBJJ2Qg
cmVjb21tZW5kIGNyZWF0aW5nIHRob3NlIG1hcHBpbmcgb25seSB3aGVuIHN0cmljdGx5IG5lZWRl
ZCwgdGhhdAo+ID4gPiBpcywgd2hlbiBkZWFsaW5nIHdpdGggYSBwaXBlbGluZWQgRUNDLiAgICAK
PiA+IAo+ID4gVGhhdCdzIHdoYXQgSSB0cmllZCB0byBkbyBpbiB0aGUgZmlyc3QgcGxhY2UsIGJ1
dCB1bmZvcnR1bmF0ZWx5IHRoZQo+ID4gZGlyZWN0IG1hcHBpbmdzIGFyZSBpbnN0YW50aWF0ZWQg
YXQgdGhlIHRpbWUgdGhlIFNQSSBjb250cm9sbGVyIGdldHMKPiA+IHByb2JlZCwgd2hpY2ggaGFw
cGVucyBiZWZvcmUgdGhlIE5BTkQgZmxhc2ggYmVpbmcgaW5pdGlhbGl6ZWQgYW5kIGl0cwo+ID4g
RUNDIGVuZ2luZSBiZWluZyBwaWNrZWQuIEhlbmNlLCBhdCB0aGlzIHBvaW50LCB3ZSBkb24ndCBy
ZWFsbHkga25vdyB3aGF0Cj4gPiBlbmdpbmUgd2lsbCBiZSB1c2VkIHdpdGggdGhpcyBFQ0MgZW5n
aW5lLiBJIGZpbmFsbHkgZ2F2ZSB1cCBhbmQgZW5kZWQKPiA+IHVwIGNyZWF0aW5nIDQgZGlybWFw
cyAocGVyIGx1bikuIEkga25vdyBpdCdzIG5vdCBvcHRpbWFsIGFuZCBpbiBtb3N0Cj4gPiBjYXNl
cyBjb25zdW1lIG1vcmUgYWRkcmVzcyBzcGFjZSB0aGFuIG5lZWRlZCBidXQgY291bGRuJ3QgZmlu
ZCBhCj4gPiBiZXR0ZXIgc29sdXRpb24geWV0IDovICAKPiAKPiBXaHkgZG8geW91IGhhdmUgdG8g
Y3JlYXRlIHRoZSBFQ0MgbWFwcGluZ3MgdGhhdCBlYXJseT8gQ2FuJ3QgeW91IGp1c3QKPiBjcmVh
dGUgdGhlbSBhZnRlciB0aGUgRUNDIGluaXRpYWxpemF0aW9uIGlzIGRvbmU/IEFGQUlDVCwgdGhl
eSB3b24ndCBiZQo+IHVzZWQgYmVmb3JlIHRoYXQgYW55d2F5LgoKWWVhaCB0aGF0J3MgcmlnaHQs
IG1heWJlIHdlIGRvbid0IG5lZWQgdGhlbSB0aGF0IGVhcmx5LiBJJ2xsIG1vdmUKdGhpbmdzIGFy
b3VuZCBhbmQgdHJ5IHRoYXQgb3V0LgoKVGhhbmtzIQpNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
