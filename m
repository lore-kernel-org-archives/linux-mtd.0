Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D6AC3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 11:24:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 599172196E
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 11:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mcfNXVF7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="csX4K9v/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 599172196E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U1Xza5nl83p+fwXEz01gkq71AixhixjfzHCYBhrypDQ=; b=mcfNXVF71wXkZ9qpAlEwnjML6
	30f0+SZH5HDrMQPbAn47ptjrVkhhMfpsb5oJojGKlnPBLW18lvu0YNojovy0XVZ1ao5Co9JM2gTsw
	OjZ5QEe+Ombw5WDTix7aJMWYKslC90jzXKDw+WzyiFlevrblB+rV1YMe1gSXEEA+J3M+BUnMsLRmq
	zyowWhhvZRAGdccO2/Y3mOvJ0N4B3KTfSI2cSA8GnrarLf22SSYgt7qi1SIqHKvb8EIkycJpLvMSE
	h3lcxQRBgZQFUdMiLczFZEKSI/LQ0U1+yvUy8eil0uYyWkr8dLFGKMWebzLHC9uAN/JcH+HD1JL2c
	96gAALm0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAuXc-0000Vl-Cg; Thu, 19 Sep 2019 11:24:04 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAuW3-0008NL-AI
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2019 11:22:30 +0000
Received: from [192.168.100.95] (unknown [95.138.208.137])
 by first.geanix.com (Postfix) with ESMTPSA id 1D3B964454;
 Thu, 19 Sep 2019 11:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1568892140; bh=/Hx+MiOvheobwlt//qdtNWfj85tnlYryF377RmEgLss=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To;
 b=csX4K9v/75wE2+pyy+u0HpfRoNLQsFiroZ1HjE0muJw9sjtNLrFeNzPju5JGNblEw
 g/SWEHA1ooH52+GUO6UKsNbwaRdHywDlhEWWaUPindaZZ/ETJlfjVtOxzRxXkLTiU1
 Ei8PUX+CE3X/nN3zGuENgc/Hy9qrd6lL5RKqQxnsrH9Wsh5GELyKhiQYqYBqOeklFz
 947yYY+zc/t0PmaMu4hdroWvXy5H9FTCJav23l9Cuj/u8Ld0wTe+qd1G3zYmVhbwpt
 Kecoe/DW0kRk4/FHpif4I3OKeT9i2ZL5DYlsWR//h2mFtGlP/O2yHlPLz/496IL+vM
 WLlvQ0gfzlAGw==
Subject: Re: [Bug] mtd: rawnand: gpmi
From: Sean Nyekjaer <sean@geanix.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <6a333d0f-09b2-d0d1-a3a5-955b31b6291e@geanix.com>
 <20190910095515.yjg6zcoqrtwylyg3@pengutronix.de>
 <a0f518e3-2465-8e64-418b-cac27cde98de@geanix.com>
 <20190910104807.7r3x2crdhpcteomn@pengutronix.de>
 <b26d583f-454f-fbf1-280d-f1753cc13896@geanix.com>
 <20190910110833.5ngkqpgdps4y3t2v@pengutronix.de>
 <3a1a0bf1-4dd0-9be1-23bd-a2e1f2bc6783@geanix.com>
Message-ID: <a4a68ef3-3f66-3e5e-b0d9-cf5d5e898b40@geanix.com>
Date: Thu, 19 Sep 2019 13:21:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <3a1a0bf1-4dd0-9be1-23bd-a2e1f2bc6783@geanix.com>
Content-Language: en-US-large
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_042228_130620_84D24D3A 
X-CRM114-Status: GOOD (  17.40  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mkl@pengutronix.de, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMC8wOS8yMDE5IDEzLjUxLCBTZWFuIE55ZWtqYWVyIHdyb3RlOgo+IAo+IAo+IE9uIDEw
LzA5LzIwMTkgMTMuMDgsIFNhc2NoYSBIYXVlciB3cm90ZToKPj4gT24gVHVlLCBTZXAgMTAsIDIw
MTkgYXQgMDE6MDA6MzBQTSArMDIwMCwgU2VhbiBOeWVramFlciB3cm90ZToKPj4+Cj4+Pgo+Pj4g
T24gMTAvMDkvMjAxOSAxMi40OCwgU2FzY2hhIEhhdWVyIHdyb3RlOgo+Pj4+IE9uIFR1ZSwgU2Vw
IDEwLCAyMDE5IGF0IDEyOjE4OjI1UE0gKzAyMDAsIFNlYW4gTnlla2phZXIgd3JvdGU6Cj4+Pj4+
Cj4+Pj4+Cj4+Pj4+IE9uIDEwLzA5LzIwMTkgMTEuNTUsIFNhc2NoYSBIYXVlciB3cm90ZToKPj4+
Pj4+PiBbwqDCoMKgIDIuNDM0MDU3XSBCYWQgYmxvY2sgdGFibGUgd3JpdHRlbiB0byAweDAwMDAx
ZmZjMDAwMCwgdmVyc2lvbiAKPj4+Pj4+PiAweDAxCj4+Pj4+Pj4gW8KgwqDCoCAyLjQzNzI1NF0g
QmFkIGJsb2NrIHRhYmxlIHdyaXR0ZW4gdG8gMHgwMDAwMWZmODAwMDAsIHZlcnNpb24gCj4+Pj4+
Pj4gMHgwMQo+Pj4+Pj4gV2hhdCBhYm91dCB0aGlzICJCYWQgYmxvY2sgdGFibGUgd3JpdHRlbiIg
bWVzc2FnZT8gWW91IHNob3VsZCBzZWUgCj4+Pj4+PiB0aGlzCj4+Pj4+PiBleGFjdGx5IG9uY2Uu
IERvIHlvdSBzZWUgdGhpcyBtdWx0aXBsZSB0aW1lcywgZXNwZWNpYWxseSB3aGVuIAo+Pj4+Pj4g
c3dpdGNoaW5nCj4+Pj4+PiBrZXJuZWxzIGJldHdlZW4gdGhlIGdvb2Qgb25lIGFuZCB0aGUgYmFk
IG9uZT8KPj4+Pj4+Cj4+Pj4+PiBTYXNjaGEKPj4+Pj4KPj4+Pj4gTm90IGV4YWN0bHkgc3VyZSB3
aGF0IHlvdSBtZWFuLCBidXQgaGVyZSBpcyB0aGUgZHVtcHM6Cj4+Pj4+Cj4+Pj4+IEJlZm9yZSAo
bXRkOiByYXduYW5kOiBncG1pOiBJbXBsZW1lbnQgZXhlY19vcCkKPj4+Pj4gW8KgwqDCoCAzLjM4
OTM1Ml0gQmFkIGJsb2NrIHRhYmxlIHdyaXR0ZW4gdG8gMHgwMDAwMWZmYzAwMDAsIHZlcnNpb24g
MHgwMQo+Pj4+PiBbwqDCoMKgIDMuMzk5MDE5XSBCYWQgYmxvY2sgdGFibGUgd3JpdHRlbiB0byAw
eDAwMDAxZmY4MDAwMCwgdmVyc2lvbiAweDAxCj4+Pj4+Cj4+Pj4+IEFmdGVyCj4+Pj4+IFvCoMKg
wqAgMy4zMDEwOTZdIEJhZCBibG9jayB0YWJsZSB3cml0dGVuIHRvIDB4MDAwMDFmZmMwMDAwLCB2
ZXJzaW9uIDB4MDEKPj4+Pj4gW8KgwqDCoCAzLjMxMDU5OV0gQmFkIGJsb2NrIHRhYmxlIHdyaXR0
ZW4gdG8gMHgwMDAwMWZmODAwMDAsIHZlcnNpb24gMHgwMQo+Pj4+Cj4+Pj4gVGhlIEJhZCBibG9j
ayB0YWJsZSBpcyB3cml0dGVuIG9uY2UuIFdoZW4geW91IHNlZSB0aGlzIG1lc3NhZ2UgbXVsdGlw
bGUKPj4+PiB0aW1lcyB0aGVuIHRoaXMgbWVhbnMgdGhhdCBMaW51eCBjYW4ndCByZWFkIHRoZSBC
QlQgYW5kIHdyaXRlcyBpdCAKPj4+PiBhZ2Fpbi4KPj4+PiBTbyB0aGUgcXVlc3Rpb24gaXM6IFN0
YXJ0IHRoZSBnb29kIGtlcm5lbCBtdWx0aXBsZSB0aW1lcy4gRG8geW91IHNlZQo+Pj4+IHRoaXMg
bWVzc2FnZSBvbmNlIG9yIG9uIGVhY2ggYm9vdD8gVGhlbiBzdGFydCB0aGUgYmFkIEtlcm5lbCBt
dWx0aXBsZQo+Pj4+IHRpbWVzLiBEbyB5b3Ugc2VlIHRoZSBtZXNzYWdlIG9uY2Ugb3Igb24gZWFj
aCBib290Pwo+Pj4+Cj4+Pj4gU2FzY2hhCj4+Pj4KPj4+Cj4+PiBVLWJvb3Q6Cj4+PiA9PiBuYW5k
IGVyYXNlLmNoaXAKPj4+Cj4+PiBOQU5EIGVyYXNlLmNoaXA6IGRldmljZSAwIHdob2xlIGNoaXAK
Pj4+IFNraXBwaW5nIGJhZCBibG9jayBhdMKgIDB4MGM3ODAwMDAKPj4+IFNraXBwaW5nIGJhZCBi
bG9jayBhdMKgIDB4MTgwMDAwMDAKPj4+IFNraXBwaW5nIGJhZCBibG9jayBhdMKgIDB4MTgwNDAw
MDAKPj4+IFNraXBwaW5nIGJhZCBibG9jayBhdMKgIDB4MWZmMDAwMDAKPj4+IFNraXBwaW5nIGJh
ZCBibG9jayBhdMKgIDB4MWZmNDAwMDAKPj4+IFNraXBwaW5nIGJhZCBibG9jayBhdMKgIDB4MWZm
ODAwMDAKPj4+IFNraXBwaW5nIGJhZCBibG9jayBhdMKgIDB4MWZmYzAwMDAKPj4+Cj4+PiBMb29r
IHdlaXJkIGl0IG1hcmtzIHRoZSBiYnQgbG9jYXRpb24gYmFkID8KPj4KPj4gWWVzLCB0aGF0J3Mg
bm9ybWFsLiBUaGUgQkJUIGl0c2VsZiBpcyBtYXJrZWQgYXMgYmFkLiBPdGhlcndpc2UgdGhlIHRo
ZXkKPj4gd291bGQganVzdCBiZSB1c2VkIGJ5IHJlZ3VsYXIgbXRkIHVzZXJzLgo+Pgo+Pj4gT3Ig
aXMgaXQgYSB1Ym9vdCBmZWF0dXJlPwo+Pj4gSSBoYXZlIHRyaWVkIGFub3RoZXIgYm9hcmQsIGFu
ZCB1Ym9vdCBtYXJrcyB0aGUgYmJ0IGxvY2F0aW9uIGJhZCBvbiAKPj4+IHRoYXQgYXMKPj4+IHdl
bGwKPj4+Cj4+PiBGaXJzdCBib290Ogo+Pj4gW8KgwqDCoCA0LjE0OTg3MF0gbmFuZDogZGV2aWNl
IGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4OTgsIENoaXAgSUQ6IDB4ZGMKPj4+Cj4+Pgo+Pj4g
W8KgwqDCoCA0LjE1NjU4OV0gbmFuZDogVG9zaGliYSBOQU5EIDUxMk1pQiAzLDNWIDgtYml0Cj4+
PiBbwqDCoMKgIDQuMTYxNTAwXSBuYW5kOiA1MTIgTWlCLCBTTEMsIGVyYXNlIHNpemU6IDI1NiBL
aUIsIHBhZ2Ugc2l6ZTogCj4+PiA0MDk2LCBPT0IKPj4+IHNpemU6IDEyOAo+Pj4KPj4+IFvCoMKg
wqAgNC4xNzU5MThdIEJhZCBibG9jayB0YWJsZSBub3QgZm91bmQgZm9yIGNoaXAgMAo+Pj4gW8Kg
wqDCoCA0LjE4NDA1OV0gQmFkIGJsb2NrIHRhYmxlIG5vdCBmb3VuZCBmb3IgY2hpcCAwCj4+PiBb
wqDCoMKgIDQuMTg4ODA4XSBTY2FubmluZyBkZXZpY2UgZm9yIGJhZCBibG9ja3MKPj4+IFvCoMKg
wqAgNC42OTAxODNdIEJhZCBlcmFzZWJsb2NrIDc5OCBhdCAweDAwMDAwYzc4MDAwMAo+Pj4gW8Kg
wqDCoCA1LjE1NTUwNF0gQmFkIGVyYXNlYmxvY2sgMTUzNiBhdCAweDAwMDAxODAwMDAwMAo+Pj4g
W8KgwqDCoCA1LjE2MTAwOF0gQmFkIGVyYXNlYmxvY2sgMTUzNyBhdCAweDAwMDAxODA0MDAwMAo+
Pj4gW8KgwqDCoCA1LjQ4Nzg4M10gQmFkIGJsb2NrIHRhYmxlIHdyaXR0ZW4gdG8gMHgwMDAwMWZm
YzAwMDAsIHZlcnNpb24gMHgwMQo+Pgo+PiBBbmQgaXMgdGhpcyB0aGUgYmFkIGtlcm5lbCBvciB0
aGUgZ29vZCBrZXJuZWw/IFRoZSBxdWVzdGlvbiBJIGFtIHRyeWluZwo+PiB0byBhbnN3ZXIgaXM6
IENhbiB0aGUgZ29vZCBrZXJuZWwgcmVhZCB0aGUgQkJUIGl0IGhhcyB3cml0dGVuPyBDYW4gdGhl
Cj4+IGJhZCBLZXJuZWwgZG8gdGhhdD8KPiAKPiBUaGUgIkZpcnN0IGJvb3QiIGFuZCAiU2Vjb25k
IGJvb3QiIHdhcyBiZWZvcmUgdGhlIGV4ZWNfb3AgcGF0Y2guLi4KPiAKPiBUaGlzIGlzIHRoZSBu
ZXcga2VybmVsIGluY2x1ZGluZyB0aGUgZXhlY19vcCBwYXRjaDoKPiBbwqDCoMKgIDEuMzQzNjE1
XSBuYW5kOiBkZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHg5OCwgQ2hpcCBJRDogMHhk
Ywo+IAo+IFvCoMKgwqAgMS4zNDM2NTZdIG5hbmQ6IFRvc2hpYmEgTkFORCA1MTJNaUIgMywzViA4
LWJpdAo+IAo+IFvCoMKgwqAgMS4zNDM2OTNdIG5hbmQ6IDUxMiBNaUIsIFNMQywgZXJhc2Ugc2l6
ZTogMjU2IEtpQiwgcGFnZSBzaXplOiA0MDk2LCAKPiBPT0Igc2l6ZTogMTI4Cj4gW8KgwqDCoCAx
LjM0ODY2Nl0gcmFuZG9tOiBmYXN0IGluaXQgZG9uZQo+IFvCoMKgwqAgMS4zNDk1MThdIEJhZCBi
bG9jayB0YWJsZSBub3QgZm91bmQgZm9yIGNoaXAgMAo+IFvCoMKgwqAgMS4zNTE0NTFdIEJhZCBi
bG9jayB0YWJsZSBub3QgZm91bmQgZm9yIGNoaXAgMAo+IFvCoMKgwqAgMS4zNTE0ODZdIFNjYW5u
aW5nIGRldmljZSBmb3IgYmFkIGJsb2Nrcwo+IFvCoMKgwqAgMS44MjczMzddIEJhZCBlcmFzZWJs
b2NrIDc5OCBhdCAweDAwMDAwYzc4MDAwMAo+IAo+IFvCoMKgwqAgMi4yNjU5NDldIEJhZCBlcmFz
ZWJsb2NrIDE1MzYgYXQgMHgwMDAwMTgwMDAwMDAKPiBbwqDCoMKgIDIuMjY2MzE4XSBCYWQgZXJh
c2VibG9jayAxNTM3IGF0IDB4MDAwMDE4MDQwMDAwCj4gCj4gW8KgwqDCoCAyLjU3MjgyMF0gQmFk
IGJsb2NrIHRhYmxlIHdyaXR0ZW4gdG8gMHgwMDAwMWZmYzAwMDAsIHZlcnNpb24gMHgwMQo+IFvC
oMKgwqAgMi41NzYxMjBdIEJhZCBibG9jayB0YWJsZSB3cml0dGVuIHRvIDB4MDAwMDFmZjgwMDAw
LCB2ZXJzaW9uIDB4MDEKPiAKPiBbwqDCoMKgIDIuNTc3MDg3XSAzIGZpeGVkLXBhcnRpdGlvbnMg
cGFydGl0aW9ucyBmb3VuZCBvbiBNVEQgZGV2aWNlIGdwbWktbmFuZAo+IFvCoMKgwqAgMi41Nzcx
MjddIENyZWF0aW5nIDMgTVREIHBhcnRpdGlvbnMgb24gImdwbWktbmFuZCI6Cj4gW8KgwqDCoCAy
LjU3NzE4OF0gMHgwMDAwMDAwMDAwMDAtMHgwMDAwMDA4MDAwMDAgOiAiYm9vdCIKPiAKPiAKPiAK
PiBbwqDCoMKgIDIuNTg0MTYyXSAweDAwMDAwMDgwMDAwMC0weDAwMDAxY2EwMDAwMCA6ICJ1Ymki
Cj4gW8KgwqDCoCAyLjYwODU3MV0gMHgwMDAwMWNhMDAwMDAtMHgwMDAwMjAwMDAwMDAgOiAidGVz
dGluZyIKPiBbwqDCoMKgIDIuNjE0MTM2XSBncG1pLW5hbmQgMTgwNjAwMC5ncG1pLW5hbmQ6IGRy
aXZlciByZWdpc3RlcmVkLgo+IAo+IEV4YWN0bHkgdGhlIHNhbWUgb3V0cHV0Li4uIHdoaWNoIG11
c3QgbWVhbiBpdCBmYWlscyByZWFkaW5nL3dyaXRpbmcgdGhlIAo+IGJidCBvbiB0aGUgNC4xOS54
IHNlcmllcyBrZXJuZWwuCj4gCj4gL1NlYW4KCkhpIFNhc2NoYQoKUGxlYXNlIGxldCBtZSBrbm93
IHdoZW4geW91IGhhdmUgc29tZSB0aW1lIHRvIGxvb2sgaW50byB0aGlzIDotKQpJIGRvc2VuJ3Qg
c2VlbSByaWdodCB0aGF0IGl0IHdyaXRlcyB0aGUgYmJ0IG9uIGEgNC4xOSBzZXJpZXMga2VybmVs
IHR3aWNlCgovU2VhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
