Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14949C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 07:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PweyjeCV8Y+kLIYMejNnIZ6a/N1ZjHOsRSXu2jjVQU0=; b=WvlgYlym3CNHQY
	4tgWEGNVsM5ZSprQLmIv97fbU5cSqTi+whERBNO95R/QvX6YtPLCGxmnh+npHBOX8/2aa5qeu5KAR
	Yc4DfTzk3K66mtqXf5MR+ICJCMLcatACFwA1Tb/d9ewLY3h2cScHvsw1NeyXY18Rh8TDaHXUERyBk
	oFyVAGRdyzDzS6Ree+ssfJaadLYIKY9qmvLsh9w3rbmckE2BbafU+z9DJMDyvcO4ub8d33v6D5XCn
	oTIltRqDrsQTFJCDiJ4RBjuzBvTh2oBUHsBnyFbvRkmR1XMDUFsXOYhjSs8zvuOaHIGkeiZrMED9T
	q9ukGj2DjeUFsfeU9ViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh4mM-007l8z-GQ; Wed, 20 Apr 2022 07:29:34 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh4m8-007l0b-MK; Wed, 20 Apr 2022 07:29:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D7DC1C000F;
 Wed, 20 Apr 2022 07:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650439756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QxxLqwZKbkp7nwz1evA3eEbo/hQsneWeBfjxoXN5fbk=;
 b=QaoQkCNjXRxpHyEnKepPy5eRNox30saqO9EWU4NqDUYFtGsZT/6R1PLy9ytaQXFtQkQIIB
 jFxg4bNlQjzF+CD2oTt1Fvx3jsV/lYUsDmouPwuTNpFPrtlt2jx/dflMQhqgk+TiEkddNB
 47McAh5hHEf9pOPFzAqAPVqIK+nYpWk+luM+Cb/pyqbzWev+3Y+1M0ZCVvtD6Tx+RlN2VP
 zlG8yEuJIyDiKnSoNi8YgEQiIwm9z3OWV+9HH0O9pmeJPE6MX8KChtxcBb5jz+jy/D7lva
 GHasc3PxTP8p4Fq3zcINMD5HG7xIgnnxU/qmhu154x0JCb8XHiD4p7qL1VsVVQ==
Date: Wed, 20 Apr 2022 09:29:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>
Cc: <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
 <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>,
 YongHui Yu <yonghui.yu@amlogic.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] mtd: rawnand: meson: discard the common MMC sub
 clock framework
Message-ID: <20220420092912.10ce66ec@xps13>
In-Reply-To: <126691f4-bc6b-10cd-ee2c-ff4006bc6518@amlogic.com>
References: <20220402074921.13316-1-liang.yang@amlogic.com>
 <20220402074921.13316-2-liang.yang@amlogic.com>
 <20220404103034.48ec16b1@xps13>
 <50105d6b-8ced-1b72-30cb-a709c4a4dd26@amlogic.com>
 <d5a33645-fac1-9c69-afe6-654bfe93ca48@amlogic.com>
 <20220419102629.1c77aa2a@xps13>
 <2e382e3e-c231-c9e4-73a1-0637288fcd4f@amlogic.com>
 <20220419172528.2dd75e7b@xps13>
 <126691f4-bc6b-10cd-ee2c-ff4006bc6518@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_002921_121115_5A387AB0 
X-CRM114-Status: GOOD (  36.04  )
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

SGkgTGlhbmcsCgpsaWFuZy55YW5nQGFtbG9naWMuY29tIHdyb3RlIG9uIFdlZCwgMjAgQXByIDIw
MjIgMTM6NDQ6MzIgKzA4MDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiAyMDIyLzQvMTkgMjM6MjUs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiA+IAo+ID4gSGVs
bG8sCj4gPiAKPiA+IGxpYW5nLnlhbmdAYW1sb2dpYy5jb20gd3JvdGUgb24gVHVlLCAxOSBBcHIg
MjAyMiAxNzoxNzo0OCArMDgwMDoKPiA+ICAgCj4gPj4gSGVsbG8gTWlxdWVsLAo+ID4+Cj4gPj4g
T24gMjAyMi80LzE5IDE2OjI2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4+IFsgRVhURVJO
QUwgRU1BSUwgXQo+ID4+Pgo+ID4+PiBIZWxsbywKPiA+Pj4KPiA+Pj4gbGlhbmcueWFuZ0BhbWxv
Z2ljLmNvbSB3cm90ZSBvbiBNb24sIDE4IEFwciAyMDIyIDExOjQwOjEwICswODAwOiAgCj4gPj4+
ICAgID4+Pj4gSGkgTWlxdWVsLCAgCj4gPj4+Pgo+ID4+Pj4gaSBoYXZlIHNvbWUgY29uZnVzaW9u
IHdoZW4gaSBwcmVwYXJlIHRoZSBwYXRjaGVzLiBmb3IgRFQgY29tcGF0aWJpbGl0eSwgaXQgZmFs
bHMgYmFjayB0byB0aGUgb2xkIERUIHdoZW4gZmFpbGVkIHRvIGdldCByZXNvdXJjZSBieSB0aGUg
bmV3IERULCBidXQgdGhlcmUgaXMgc29tZSBwb2ludHM6Cj4gPj4+PiBhLiBvbGQgRFQgZGVwZW5k
cyBvbiBNTUMgc3ViIGNsb2NrIGRyaXZlciwgYnV0IGl0IG5ldmVyIGJlIG1lcmdlZCwgc28gaXQg
Y2FuJ3Qgd29yay4gIAo+ID4+Pgo+ID4+PiBJIGRvbid0IGdldCB3aGF0IHlvdSBtZWFuIGhlcmUs
IHNvcnJ5LiBJIGJlbGlldmUgdGhlcmUgaXMgYSBuZXcgd2F5IHRvCj4gPj4+IGRlc2NyaWJlIHRo
aXMgY2xvY2sgYnV0IGdyYWJiaW5nIHRoZSBvbmUgZnJvbSB0aGUgTU1DIHN0aWxsIHdvcmtzLCBk
b2VzCj4gPj4+IG5vdCBpdD8gIAo+ID4+PiAgICA+PiAgCj4gPj4gTm8sIGl0IGRvZXNuJ3QuIGFm
dGVyIHRoZSBORkMgZHJpdmVyIHVzaW5nIHRoZSBNTUMgc3ViIGNsb2NrIGZyYW1ld29yayB3YXMg
bWVyZ2VkIGludG8gdGhlIG1haW5saW5lIG9mIGtlcm5lbCwgd2UgZGlkbid0IGNvbnRpbnVlIHRv
IHN1Ym1pdCB0aGUgc2VyaWVzIG9mIHBhdGNoZXMgYWJvdXQgTU1DIHN1YiBjbG9jayBhZnRlciB2
OS4gd2hlbiBpIGZvdW5kIHRoYXQsIHdlIG1hZGUgYSBkaXNjdXNzaW9uIHRvIGRlY2lkZSB3aGV0
aGVyIHRvIHJlY292ZXIgdGhlIHNlcmllcyBvZiBwYXRjaGVzIGFib3V0IE1NQyBzdWIgY2xvY2sg
ZnJhbWV3b3JrLCBmaW5hbGx5LCBzZWUgdGhlIGRlc2NyaXB0aW9uIGZyb20gY292ZXIgbGV0dGVy
LCB3ZSBwbGFuIHRvIGFiYW5kb24gaXQgYW5kIGFkb3B0IHRoZSBuZXcgY2xvY2sgc2NoZW1lIGlu
IHRoaXMgc2VyaWVzIG9mIHBhdGNoZXMuICAKPiA+IAo+ID4gSSBhbSBub3Qgc3VyZSB0byBmb2xs
b3cuIElzIHRoZSBjdXJyZW50IGNvZGUgY29tcGxldGVseSBicm9rZW4/IEkKPiA+IGJlbGlldmUg
aXQgaXMgbm90LCBzbyBJIGRvbid0IHVuZGVyc3RhbmQgeW91ciBpc3N1ZS4gIAo+IAo+IGkgdGhp
bmsgb25seSB0aGUgY29kZSBhYm91dCB0aGUgY2xvY2sgaXMgY29tcGxldGVseSBicm9rZW4uCj4g
Cj4gPiAKPiA+IENhbiB5b3UgcGxlYXNlIHN1bW1hcml6ZSB0aGUgc2l0dWF0aW9uPyAgCj4gCj4g
WWVzLiB0aGUgY3VycmVudCBORkMgY2xvY2sgaW1wbGVtZW50YXRpb24gZGVwZW5kcyBvbiB0aGUg
Zm9sbG93aW5nIHNlcmllcyBvZiBwYXRjaGVzIFtodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyMjAxMjEwNzQ1MDguNDIxNjgtNS1saWFuZy55YW5nQGFtbG9naWMuY29tXSwgd2hpY2ggd2Ug
Y2FsbCAiTWVzb24gTU1DIFN1YiBDbG9jayBDb250cm9sbGVyIERyaXZlciIuCj4gd2hlbiBpIHdh
cyBwcmVwYXJpbmcgdGhlIE5GQyBwYXRjaHNldCBhdCB0aGF0IHRpbWUsIHdlIGRpc2N1c3NlZCBo
b3cgdGhlIGNsb2NrIHNob3VsZCBiZSBpbXBsZW1lbnRlZCBiYXNlIG9uIHRoZSBzcGVjaWFsIGNs
b2NrIGZyYW1ld29yayBmb3IgTkZDIGFuZCBFTU1DIHBvcnQuIHRoZW4gd2UgZGVjaWRlZCB0byBp
bXBsZW1lbnQgYSBkcml2ZXIgIk1lc29uIE1NQyBTdWIgQ2xvY2sgQ29udHJvbGxlciBEcml2ZXIi
LiBzbyBhbm90aGVyIHBlb3BsZSBiZWdpbiB0byBwcmVwYXJlICJNZXNvbiBNTUMgU3ViIENsb2Nr
IENvbnRyb2xsZXIgRHJpdmVyIiwgYnV0IHN1Ym1pdHRlZCBpdCBieSBkaWZmZXJlbnQgcGF0Y2hz
ZXQuCj4gZmluYWxseSwgbm93IHRoZSBtZXNvbiBORkMgcGF0Y2hzZXQgaXMgYWNjZXB0ZWQgYW5k
IG1lcmdlZCwgYnV0ICJNZXNvbiBNTUMgU3ViIENsb2NrIENvbnRyb2xsZXIgRHJpdmVyIiBwYXRj
aHNldCBpcyBub3QuIGFsc28gd2UgZGVjaWRlIHRvIGFiYW5kb24gdGhlIHBhdHNldCAiTWVzb24g
TU1DIFN1YiBDbG9jayBDb250cm9sbGVyIERyaXZlciIgYW5kIGltcGxlbWVudCB0aGUgbmV3IGNs
b2NrIGRlc2lnbiBpbiB0aGlzIHNlcmllcy4KCk9rIHRoYW5rcyBmb3IgdGhlIHN1bW1hcnkgYW5k
IHRoZSBsaW5rIHdpdGggdGhlIGRpc2N1c3Npb24gd2l0aCBKZXJvbWUKYW5kIE5laWwsIGl0J3Mg
aW5mb3JtYXRpdmUuCgpTbyBpbiB0aGUgZW5kLCB3ZSBhcmUgbm90IHJlYWxseSBicmVha2luZyBh
bnl0aGluZyBoZXJlIGFzIHRoaXMgTkFORApjb250cm9sbGVyIGRyaXZlciBuZXZlciB3b3JrZWQg
aW4gdGhlIGZpcnN0IHBsYWNlPyBPciBpcyBpdCBvbmx5IG9uZSBvZgp0aGUgdHdvIGNvbXBhdGli
bGVzIHdoaWNoIGlzIG5vdCB3b3JraW5nPwoKSWYgdGhpcyBuZXZlciB3b3JrZWQgdGhlbiBwbGVh
c2UgZG8gdGhlIGJpbmRpbmcgY2hhbmdlcyAoaW4gdGhlIGZpcnN0CnBhdGNoIG9mIHlvdXIgc2Vy
aWVzKSBhbmQgdGhlbiBkbyB0aGUgbmVjZXNzYXJ5IGNoYW5nZXMgaW4gdGhlIGNvZGUuIElmCnRo
aXMgd29ya2VkIHdpdGggYXQgbGVhc3Qgb25lIG9mIHRoZSB0d28gY29tcGF0aWJsZXMsIHRoZW4g
eW91IGhhdmUgdG8KY3JlYXRlIGRlZGljYXRlZCBoZWxwZXJzLCBvbmUgZm9yIGVhY2gsIGluIG9y
ZGVyIHRvIGdyYWIgdGhlIGNsb2NrcwpkaWZmZXJlbnRseSBhbmQgbm90IGJyZWFrIGFueWJvZHku
Cgo+IAo+ID4gICAKPiA+Pgo+ID4+IFRoYW5rcy4KPiA+PiAgCj4gPj4+PiBiLiBpZiBpdCBmYWxs
cyBiYWNrIHRvIHRoZSBvbGQgRFQsIGJlc2lkZSB0aGUgcmVnbWFwIGxvb2t1cCBiZWxvdywgaXQg
c2VlbXMgdGhhdCB3ZSBoYXZlIHRvIHByZXNlcnZlIHRoZSBjb2RlIG9mIHRoZSBvbGQgY2xvY2sg
c2V0dGluZyBpbiBuZmNfY2xrX2luaXQoKS4gIAo+ID4+Pgo+ID4+PiBZZXMsIHByb2JhYmx5LiAg
Cj4gPj4+ICAgID4+Pj4gZG8gd2Ugc3RpbGwgbmVlZCB0byBhdm9pZCBicmVhayBEVCBjb21wYXRp
YmlsaXR5PyAgCj4gPj4+Cj4gPj4+IFdlIHNob3VsZCB0cnkgb3VyIGJlc3QgdG8gYXZvaWQgYnJl
YWtpbmcgdGhlIERULCB5ZXMuICAKPiA+Pj4gICAgPj4+PiAgCj4gPj4+PiBUaGFua3MuCj4gPj4+
Pgo+ID4+Pj4gT24gMjAyMi80LzExIDEwOjQwLCBMaWFuZyBZYW5nIHdyb3RlOiAgCj4gPj4+Pj4+
PiAgIMKgwqDCoMKgwqAgbmZjLT5kZXYgPSBkZXY7Cj4gPj4+Pj4+PiAtwqDCoMKgIHJlcyA9IHBs
YXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4gPj4+Pj4+PiAt
wqDCoMKgIG5mYy0+cmVnX2Jhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOwo+
ID4+Pj4+Pj4gK8KgwqDCoCBuZmMtPnJlZ19iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jl
c291cmNlX2J5bmFtZShwZGV2LCAibmZjIik7ICAKPiA+Pj4+Pj4KPiA+Pj4+Pj4gVGhpcyBjaGFu
Z2Ugc2VlbXMgdW5yZWxhdGVkLiAgCj4gPj4+Pj4KPiA+Pj4+PiBUbyBiZSBjb25zaXN0ZW50IHdp
dGggdGhlIGZvbGxvd2luZyA+IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZV9ieW5hbWUo
cGRldiwgImVtbWMiKS4gZG8geW91IG1lYW4gdGhhdCB3ZSA+IGRvbid0IG5lZWQgaXQ/PiAgCj4g
Pj4+Pj4+PiAgIMKgwqDCoMKgwqAgaWYgKElTX0VSUihuZmMtPnJlZ19iYXNlKSkKPiA+Pj4+Pj4+
ICAgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKG5mYy0+cmVnX2Jhc2UpOwo+ID4+
Pj4+Pj4gLcKgwqDCoCBuZmMtPnJlZ19jbGsgPQo+ID4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHN5
c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUoZGV2LT5vZl9ub2RlLAo+ID4+Pj4+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImFtbG9naWMsbW1j
LXN5c2NvbiIpOwo+ID4+Pj4+Pj4gLcKgwqDCoCBpZiAoSVNfRVJSKG5mYy0+cmVnX2NsaykpIHsK
PiA+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBsb29rdXAg
Y2xvY2sgYmFzZVxuIik7Cj4gPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIo
bmZjLT5yZWdfY2xrKTsKPiA+Pj4+Pj4+IC3CoMKgwqAgfQo+ID4+Pj4+Pj4gK8KgwqDCoCBuZmMt
PnNkX2VtbWNfY2xvY2sgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBk
ZXYsID4+PiAiZW1tYyIpOwo+ID4+Pj4+Pj4gK8KgwqDCoCBpZiAoSVNfRVJSKG5mYy0+c2RfZW1t
Y19jbG9jaykpCj4gPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIobmZjLT5z
ZF9lbW1jX2Nsb2NrKTsgIAo+ID4+Pj4+Pgo+ID4+Pj4+PiBXaGlsZSBJIGFncmVlIHRoaXMgaXMg
bXVjaCBiZXR0ZXIgdGhhbiB0aGUgcHJldmlvdXMgc29sdXRpb24sIHdlIGNhbm5vdAo+ID4+Pj4+
PiBicmVhayBEVCBjb21wYXRpYmlsaXR5LCBzbyB5b3UgbmVlZCB0byB0cnkgZ2V0dGluZyB0aGUg
ZW1tYyBjbG9jaywgYnV0Cj4gPj4+Pj4+IGlmIGl0IGZhaWxzIHlvdSBzaG91bGQgZmFsbGJhY2sg
dG8gdGhlIHJlZ21hcCBsb29rdXAuICAKPiA+Pj4+Pgo+ID4+Pj4+IG9rLCBpIHdpbGwgZml4IGl0
IG5leHQgdmVyc2lvbi4gdGhhbmtzLiAgCj4gPj4+Pj4gICAgID4+Pj4gICA+Pj4+PiAgwqDCoMKg
wqDCoCBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOyAgCj4gPj4+Cj4gPj4+Cj4gPj4+
IFRoYW5rcywKPiA+Pj4gTWlxdcOobAo+ID4+Pgo+ID4+PiAuICAKPiA+IAo+ID4gCj4gPiBUaGFu
a3MsCj4gPiBNaXF1w6hsCj4gPiAKPiA+IC4gIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
