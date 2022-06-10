Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692FCC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jun 2022 12:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+sDWxklU0rXgD1JzIG6qG5QNOXd0GbnquK4T8ITTME=; b=Ci6JGDpRY4hqbI
	uriA9d96xdOR1eFD43hqAJqCO2FIcR4JHOYoZJlo8AaiBXWit4N+PVlgH0nsaCJFZ4yWVT+O9wVSu
	TKAZKyy7prEgeGFg1cEDQY3XIu0PUpcCVwkG35wH2QUH/T/G3MEsGrFfVGpPGf5XVOlUmMKcTfa3Z
	samhwoshmoqFK18htpbZ1KZGgV64OnELq/W2piqEZ9IjgfpaMGXq9d7c8haessXLL8j3edVze+U0/
	2dpcWiqA/JBzDCQZbXpxEzueTSB5RgZ6bq4Guv83vbuzzQA3/4185GNEOGRyueqV15NdfCOPUTC6D
	3l4GHkYsc1iizgOuBBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdcK-0089r4-W5; Fri, 10 Jun 2022 12:19:57 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdcG-0089pE-Kh
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2022 12:19:55 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1nzdbt-000793-Ry; Fri, 10 Jun 2022 14:19:30 +0200
Date: Fri, 10 Jun 2022 13:19:24 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tom Rini <trini@konsulko.com>,
	Ricardo Salveti <ricardo@foundries.io>,
	Michal Simek <michal.simek@xilinx.com>,
	Jorge Ramirez-Ortiz <jorge@foundries.io>,
	Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: mtd: partitions: add UBI binding
Message-ID: <YqM2zPcJAqFM8SA8@makrotopia.org>
References: <20220217102448.27586-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217102448.27586-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_051952_718198_36B08BD5 
X-CRM114-Status: GOOD (  18.86  )
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

T24gVGh1LCBGZWIgMTcsIDIwMjIgYXQgMTE6MjQ6NDhBTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBV
QkkgaXMgb2Z0ZW4gdXNlZCBvbiBlbWJlZGRlZCBkZXZpY2VzIHRvIHN0b3JlIFVCSSB2b2x1bWVz
IHdpdGggZGV2aWNlCj4gY29uZmlndXJhdGlvbiAvIGNhbGlicmF0aW9uIGRhdGEuIFN1Y2ggdm9s
dW1lcyBtYXkgbmVlZCB0byBiZSBkb2N1bWVudGVkCj4gYW5kIHJlZmVyZW5jZWQgZm9yIHByb3Bl
ciBib290ICYgc2V0dXAuCj4gCj4gU29tZSBleGFtcGxlczoKPiAxLiBVLUJvb3QgZW52aXJvbm1l
bnQgdmFyaWFibGVzCj4gMi4gRGV2aWNlIGNhbGlicmF0aW9uIGRhdGEKPiAzLiBEZWZhdWx0IHNl
dHVwIChlLmcuIGluaXRpYWwgcGFzc3dvcmQpCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1p
xYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBpcyB2ZXJ5IHVzZWZ1bCBhbmQgY2FuIHJl
cGxhY2UgdGhlIGRvd25zdHJlYW0gaGFja3Mgd2UgYXJlCmN1cnJlbnRseSB1c2luZyBmb3IgdGhp
cyBwdXJwb3NlIGluIE9wZW5XcnQuCgpSZXZpZXdlZC1ieTogRGFuaWVsIEdvbGxlIDxkYW5pZWxA
bWFrcm90b3BpYS5vcmc+Cgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdWJp
LnlhbWwgICAgICAgICAgfCA2NyArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA2NyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdWJpLnlhbWwKPiAKPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3ViaS55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3Vi
aS55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmNkMDgx
ZjA2ZDRjYgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdWJpLnlhbWwKPiBAQCAtMCwwICsxLDY3IEBACj4gKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPiAr
JVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210
ZC9wYXJ0aXRpb25zL3ViaS55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBVQkkgKFVuc29ydGVkIEJsb2Nr
IEltYWdlcykgZGV2aWNlCj4gKwo+ICtkZXNjcmlwdGlvbjogfAo+ICsgIFVCSSBpcyBhIGxheWVy
IHByb3ZpZGluZyBsb2dpY2FsIHZvbHVtZXMgKGNvbnNpc3Rpbmcgb2YgbG9naWNhbCBibG9ja3Mp
IG9uIHRvcAo+ICsgIG9mIHJhdyBmbGFzaCBkZXZpY2VzLiBJdCBkZWFscyB3aXRoIGxvdy1sZXZl
bCBmbGFzaCBpc3N1ZXMgKGJpdC1mbGlwcywgYmFkCj4gKyAgcGh5c2ljYWwgZXJhc2VibG9ja3Ms
IHdlYXJpbmcpIHByb3ZpZGluZyBhIHJlbGlhYmxlIGRhdGEgc3RvcmFnZS4KPiArCj4gKyAgVUJJ
IGRldmljZSBpcyBidWlsdCBhbmQgc3RvcmVkIGluIGEgc2luZ2xlIGZsYXNoIHBhcnRpdGlvbi4K
PiArCj4gKyAgU29tZSAodXN1YWxseSBlbWJlZGRlZCkgZGV2aWNlcyB1c2UgVUJJIHZvbHVtZXMg
b2Ygc3BlY2lmaWMgbmFtZXMgb3IgaW5kZXhlcwo+ICsgIHRvIHN0b3JlIHNldHVwIC8gY29uZmln
dXJhdGlvbiBkYXRhLiBUaGlzIGJpbmRpbmcgYWxsb3dzIGRlc2NyaWJpbmcgc3VjaAo+ICsgIHZv
bHVtZXMgc28gdGhleSBjYW4gYmUgaWRlbnRpZmllZCBhbmQgcmVmZXJlbmNlZCBieSBjb25zdW1l
cnMuCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWls
ZWNraS5wbD4KPiArCj4gK2FsbE9mOgo+ICsgIC0gJHJlZjogcGFydGl0aW9uLnlhbWwjCj4gKwo+
ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBjb25zdDogdWJpCj4gKwo+ICtw
YXR0ZXJuUHJvcGVydGllczoKPiArICAiXnZvbHVtZS1bMC05YS1mXSskIjoKPiArICAgIHR5cGU6
IG9iamVjdAo+ICsgICAgZGVzY3JpcHRpb246IFVCSSB2b2x1bWUKPiArICAgIHByb3BlcnRpZXM6
Cj4gKyAgICAgIHZvbHVtZS1uYW1lOgo+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3N0cmluZwo+ICsgICAgICB2b2x1bWUtaWQ6Cj4gKyAgICAgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gKyAgICBhbnlPZjoK
PiArICAgICAgLSByZXF1aXJlZDoKPiArICAgICAgICAgIC0gdm9sdW1lLW5hbWUKPiArICAgICAg
LSByZXF1aXJlZDoKPiArICAgICAgICAgIC0gdm9sdW1lLWlkCj4gKwo+ICt1bmV2YWx1YXRlZFBy
b3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAgIHBhcnRpdGlv
bnMgewo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7Cj4gKyAgICAg
ICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47Cj4g
Kwo+ICsgICAgICAgIHBhcnRpdGlvbkAwIHsKPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ1
YmkiOwo+ICsgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAwIDB4MTAwMDAwMD47Cj4gKyAgICAg
ICAgICAgIGxhYmVsID0gImZpbGVzeXN0ZW0iOwo+ICsKPiArICAgICAgICAgICAgZW52OiB2b2x1
bWUtMCB7Cj4gKyAgICAgICAgICAgICAgICB2b2x1bWUtbmFtZSA9ICJ1LWJvb3QtZW52IjsKPiAr
ICAgICAgICAgICAgfTsKPiArCj4gKyAgICAgICAgICAgIGNhbGlicmF0aW9uOiB2b2x1bWUtMSB7
Cj4gKyAgICAgICAgICAgICAgICB2b2x1bWUtaWQgPSA8OTk+Owo+ICsgICAgICAgICAgICB9Owo+
ICsgICAgICAgIH07Cj4gKyAgICB9Owo+IC0tIAo+IDIuMzQuMQo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
