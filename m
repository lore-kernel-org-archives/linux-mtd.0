Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07460C352A1
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Dec 2022 09:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g00mSvkp2Y7mXzLRISUVR5X5BVxUk5B9v7eRknA1iHY=; b=aezCIG3mOHzIgC
	aqUSXTLOQNDIIPMo498BgXgs47nu4jfAfMtGMDqafDjWFkibrZ5sUvLLkhhn5JU+DWbg0sHR4ShIM
	/yGFkr1FIAbDN4NxOy3Ka8ANFY+XIBsL9NTg2hGCTnOV1Nknu2yc8yvrdMW7NVG5WvzHJAT1+oQvX
	kmB3Lyq/hNvcKV8V0MCtkqpGGvJn5ApCQLvBt8Oae0ugx86x3tc30CNtBc9Y+unT8+P1u4HuC+L0Q
	xgLnTkUvswjMrev0SOVbWWJECAxX2OBl/Kuw9yEKLvzovPs5Juf+EAib0IPoIukiBv7uKHC+cDsSh
	CKBrJDnKlTk+eaFaYrvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2r36-00GXub-IU; Wed, 07 Dec 2022 09:49:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2r2p-00GXQV-3I; Wed, 07 Dec 2022 09:48:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F4686602BC8;
	Wed,  7 Dec 2022 09:48:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670406528;
	bh=qNEpnM8ClbrtXrZA6HU6eUiqyAOy4w4SGFwvj+Zg7ZU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gYO5sj0NeKHGQdOIykdzKDXaUMR4eTpN/Gf5vQW9433/FCKI5EhWReF8ANjQZz+9T
	 W0yfMuhK2NpiNeriKtbQdjar477D0D4bftjuQv1UBwHpISOf+a2P8QSaLSV2CTAPpX
	 PVWvv2MgZF2bo4rBeATogcd6pXZX+O9TJeFqHAVOHIsz7DLGPcq0peRCGaCNeCCozj
	 ycUDIRukQFQmbdZRm495QMNSBFSreFa60eyKqlABw8OS+8W6i2+OZX1ZwEZ5cO+mGD
	 SyagMVmgnx4+tBSYfZkiyNLcqotoE5Qfh3RJxuktLwks9Chjnni+BLLfg4ECF7LEHz
	 U779io82HGe+w==
Message-ID: <b877af37-462e-c923-41c0-09c370062700@collabora.com>
Date: Wed, 7 Dec 2022 10:48:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 7/9] dt-bindings: spi: mtk-snfi: Add read latch latency
 property
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-8-xiangsheng.hou@mediatek.com>
 <ce449a0c-efcc-0ac1-fb8e-c2b4148a5bc1@collabora.com>
 <a8f706b37f5decf91bfa9a9ac8cf04be4346dd85.camel@mediatek.com>
 <9992c9a5-059a-9396-32ce-7ed63cd12a96@collabora.com>
 <e2ccf42f94152ccacad3a2eaec234ae0566474ec.camel@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <e2ccf42f94152ccacad3a2eaec234ae0566474ec.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_014851_383581_5B0D3D17 
X-CRM114-Status: GOOD (  16.84  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SWwgMDcvMTIvMjIgMDM6MDAsIFhpYW5nc2hlbmcgSG91ICjkvq/npaXog5wpIGhhIHNjcml0dG86
Cj4gSGkgQW5nZWxvLAo+IAo+IE9uIFR1ZSwgMjAyMi0xMi0wNiBhdCAxMzoxOSArMDEwMCwgQW5n
ZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6Cj4+Pj4+IGRpZmYgLS1naXQKPj4+Pj4gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL21lZGlhdGVrLHNwaS0KPj4+Pj4g
bXRrLXNuZmkueWFtbAo+Pj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
cGkvbWVkaWF0ZWssc3BpLQo+Pj4+PiBtdGstc25maS55YW1sCj4+Pj4+IGluZGV4IGJhYjIzZjFi
MTFmZC4uNmU2ZmY4ZDczZmNkIDEwMDY0NAo+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc3BpL21lZGlhdGVrLHNwaS1tdGstCj4+Pj4+IHNuZmkueWFtbAo+Pj4+
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL21lZGlhdGVrLHNw
aS1tdGstCj4+Pj4+IHNuZmkueWFtbAo+Pj4+PiBAQCAtNDUsNiArNDUsMTMgQEAgcHJvcGVydGll
czoKPj4+Pj4gICAgICAgICBkZXNjcmlwdGlvbjogZGV2aWNlLXRyZWUgbm9kZSBvZiB0aGUgYWNj
b21wYW55aW5nIEVDQwo+Pj4+PiBlbmdpbmUuCj4+Pj4+ICAgICAgICAgJHJlZjogL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+Pj4+PiAgICAgCj4+Pj4+ICsgIG1lZGlh
dGVrLHJ4LWxhdGNoLWxhdGVuY3k6Cj4+Pj4+ICsgICAgZGVzY3JpcHRpb246IFJ4IGRlbGF5IHRv
IHNhbXBsZSBkYXRhIHdpdGggdGhpcyB2YWx1ZSwgdGhlCj4+Pj4+IHZhbHVlCj4+Pj4+ICsgICAg
ICAgICAgICAgICAgIHVuaXQgaXMgY2xvY2sgY3ljbGUuCj4+Pj4KPj4+PiBDYW4ndCB3ZSB1c2Ug
bmFub3NlY29uZHMgb3IgbWljcm9zZWNvbmRzIGFzIGEgdW5pdCBoZXJlLCBpbnN0ZWFkCj4+Pj4g
b2YKPj4+PiBjbG9jayBjeWNsZXM/Cj4+Pgo+Pj4gVGhlIGNsb2NrIGN5Y2xlIHdpbGwgYmUgdmFy
aW91cyB3aXRoIE1lZGlhVGVrIFNQSSBOQU5EIGNvbnRyb2xsZXIKPj4+IHdoaWNoCj4+PiBjbG9j
ayBmcmVxdWVuY3kgY2FuIHN1cHBvcnQgMjYvNTIvNjgvODEvMTA0TUh6Li4uCj4+PiBJdGBzIG1h
eSBiZSBlYXN5IHRvIGNvbmZpZ3VyZSBhbmQgdW5kZXJzdGFuZCB3aXRoIGNsb2NrIGN5Y2xlIGlu
Cj4+PiB1bml0Lgo+Pj4KPj4KPj4gWWVzLCBidXQgd2hhdGV2ZXIgY2xvY2sgZnJlcXVlbmN5IHdl
IHVzZSwgdGhlIHRhcmdldCBpcyB0byBhbHdheXMKPj4gd2FpdCBmb3IKPj4gWCBuYW5vc2Vjb25k
cywgcmlnaHQ/Cj4+Cj4+IFdhaXRpbmcgZm9yIDUgY2xvY2sgY3ljbGVzIGF0IDEwNE1IeiBpcyBv
YnZpb3VzbHkgbm90IHRoZSBzYW1lIGFzCj4+IHdhaXRpbmcKPj4gZm9yIHRoZSBzYW1lIDUgY2xv
Y2sgY3ljbGVzIGF0IDI2TUh6OiBpbiB0aGF0IGNhc2UsIGV4cHJlc3NpbmcgdGhlCj4+IHZhbHVl
Cj4+IGluIG5hbm9zZWNvbmRzIG9yIG1pY3Jvc2Vjb25kcyB3b3VsZCBtYWtlIHRoYXQgaW5kZXBl
bmRlbnQgZnJvbSB0aGUKPj4gY29udHJvbGxlcidzIGNsb2NrIGZyZXF1ZW5jeSBhcyB0aGUgY2Fs
Y3VsYXRpb24gZnJvbSBgdGltZWAgdG8KPj4gYGN5Y2xlc2AKPj4gd291bGQgYmUgcGVyZm9ybWVk
IGluc2lkZSBvZiB0aGUgZHJpdmVyLgo+IAo+IFRoZXJlIGhhdmUgdHdvIHJ4IHJlbGF0ZWQgdGlt
aW5nIHByb3BlcnRpZXMgaW4gc3BpLXBlcmlwaGVyYWwtcHJvcHMuCj4gVGhlIHJ4LXNhbXBsZS1k
ZWxheS1ucyBoYXZlIGJlZW4gdXNlZCBpbiBNZWRpYXRlayBzbmZpIGRyaXZlciB0byBhZGp1c3QK
PiBjb250cm9sbGVyIHNhbXBsZSBkZWxheS4KPiBIb3dldmVyIGFub3RoZXIgc3BpLXJ4LWRlbGF5
LXVzIGlzIGluIG1pY3Jvc2Vjb25kcy4gVGFrZSA1Mk1IeiBmb3IKPiBleGFtcGxlLCB0aGUgY2xv
Y2sgY3ljbGUgd2lsbCBiZSAxOS4yM25zIHdoaWNoIGxvd2VyIHRoYW4gMXVzLiBUaGlzIG1heQo+
IG5vdCBlYXN5IHRvIGJ5IG9uZSBjbG9jayBjeWNsZS4KPiAKCkkgYWdyZWUsIGJ1dCBub3RoaW5n
IHByZXZlbnRzIHlvdSBmcm9tIGFkZGluZyB5b3VyIG93biBwcm9wZXJ0eSBmb3IgdGhhdC4KCkkg
cHJvcG9zZSAibWVkaWF0ZWsscngtbGF0Y2gtbGF0ZW5jeS1ucyIgb3IgIm1lZGlhdGVrLHJ4LWxh
dGVuY3ktbnMiLCBzbyB0aGF0CndlIGNhbiBzcGVjaWZ5IHRoZSBkZWxheSBpbiBuYW5vc2Vjb25k
czogaW4gdGhhdCBjYXNlLCB3aGVuIHdlIHNwZWNpZnkgMTlucywKdGhlIGRyaXZlciB3aWxsIHNh
ZmVseSByb3VuZCB0aGF0IHJlc3VsdGluZyBpbiA1Mk1IeiA9PSAxOS4yM25zID0+IDE5bnMgdmFs
aWQuCgpSZWdhcmRzLApBbmdlbG8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
