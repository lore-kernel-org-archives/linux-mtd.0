Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B23C43458
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 23:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R61wJ0PNcgYj/eAfpo/dJVYiqDS6T6k1oEBX/KbUqNs=; b=qGrvo8FOcnQqiQ
	hZhINiDh5/BspqLjf87+CyVcmEDxEdSYv1TvEsnBHmcGjB6kLGEINEp2zDDe0LWch647BDU/kJJNC
	mGDT5Q01NKsMfC6yR1cmqkS0MYS1Kb5lcVgHWE0S2lBXYpyE5u9BIvw7ujXTFgFIj2y4y3xEtfc8e
	i76oTkOCfEYLeGYpMzUEBwSm3oS72U/opQnsW4fMt0ZrWWCbXyc7JHD3uRieu9PXHbGKvsoVt/1kC
	qB3iY9pXk0uvJNSRC7nlfgt2JVObFP0iqlwAGveYzpQCSeWt68Ju50ey8flJVo4Y09BOZ/zWBqPGV
	QLOUwnJvzfohEnQ98VqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4fM-00000003FGF-2MbO;
	Wed, 01 Jul 2026 23:48:28 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4fI-00000003FFG-3LlA
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 23:48:26 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 985102C097B;
	Thu,  2 Jul 2026 11:48:21 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1782949701;
	bh=EIDXEXbiAf6p6O6XD8Vs+L862cEEVINg/KGQBJ68zG8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=A3ZgEL3z8+ZyfMxlsPiexXhUfXUvSgZkfvyl0lQ+sIXjYfCELW6Z3sqHgc+lEgrPF
	 2KCNUqF9auPT+AT5xlNw8+fBrk5xcL+Csat4Rfxy0MImVsFs4StrSuUpX220RzBunH
	 L9UPSpbCpDUoj1wArdG6WFCOA4nQqBz7qqWnw5urbL3A1waUcHm5p0DNnTOujaRgE0
	 UvJBpdjUU1DUMEyyfTn58vC+Hhyz2HqBt5x8a3RcDjGNnv/rk31hlEY1078VsX2rvI
	 7ya1EBiPmgx3qYad11vpJeuGsXVE6dugrlcIUE4+bnf5vTK4cVXeaYT3vWEVSzUTwm
	 XXkOQZC0lbTDA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a45a7450000>; Thu, 02 Jul 2026 11:48:21 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Thu, 2 Jul 2026 11:48:21 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Thu, 2 Jul 2026 11:48:21 +1200
From: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
To: "mwalle@kernel.org" <mwalle@kernel.org>, "pratyush@kernel.org"
	<pratyush@kernel.org>, "takahiro.kuwano@infineon.com"
	<takahiro.kuwano@infineon.com>
CC: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, "vigneshr@ti.com"
	<vigneshr@ti.com>, Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"richard@nod.at" <richard@nod.at>
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: fujitsu: Add support for MB85RS4MTY
 chip
Thread-Topic: [PATCH v2 3/3] mtd: spi-nor: fujitsu: Add support for MB85RS4MTY
 chip
Thread-Index: AQHdBRKNqZzKnZfCVEGF4Gx7QpTNebZXjXQAgAEHbQA=
Date: Wed, 1 Jul 2026 23:48:21 +0000
Message-ID: <b607ba8a59e6f5b0320b1aba5c915b62adb3534b.camel@alliedtelesis.co.nz>
References: <20260626022108.1963271-2-ronan.dalton@alliedtelesis.co.nz>
	 <20260626022108.1963271-6-ronan.dalton@alliedtelesis.co.nz>
	 <DJN2V8UD53G1.TWK9X1TCEVJ7@kernel.org>
In-Reply-To: <DJN2V8UD53G1.TWK9X1TCEVJ7@kernel.org>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.12.18]
Content-ID: <B321598C58E04D47AE42AEFD92F956CE@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a45a745 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=BhaoXNk7gXQA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=rj8_fkpUwGkhO_vSv2AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_164825_318262_36177A5E 
X-CRM114-Status: GOOD (  21.83  )
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

SGkgTWljaGFlbCwNCg0KT24gV2VkLCAyMDI2LTA3LTAxIGF0IDEwOjA1ICswMjAwLCBNaWNoYWVs
IFdhbGxlIHdyb3RlOg0KPiBIaSwNCj4gDQo+IE9uIEZyaSBKdW4gMjYsIDIwMjYgYXQgNDoyMSBB
TSBDRVNULCBSb25hbiBEYWx0b24gd3JvdGU6DQo+ID4gVGhlIE1CODVSUzRNVFkgY2hpcCBpcyBz
aW1pbGFyIHRvIHRoZSBNQjg1UlMxTVQgY2hpcCwgYnV0IGl0IGhhcyBhDQo+ID4gaGlnaGVyIGNh
cGFjaXR5IGFuZCBjYW4gaGFuZGxlIGhpZ2hlciB0ZW1wZXJhdHVyZXMuIENvbXBhcmVkIHRvIHRo
ZQ0KPiA+IE1CODVSUzFNVCBjaGlwLCB0aGlzIGNoaXAgaGFzIGFuIGV4cGFuZGVkIHNldCBvZiBv
cGNvZGVzIHdoaWNoDQo+ID4gYWxsb3cNCj4gPiBjb250cm9sIG92ZXIgcG93ZXItc2F2aW5nIG1v
ZGVzLCBhY2Nlc3MgdG8gYSBzcGVjaWFsIHNlY3RvciBkYXRhDQo+ID4gYXJlYSwNCj4gPiBhbmQg
cmVhZGluZyBvZiB0aGUgdW5pcXVlIElEIGFuZCBzZXJpYWwgbnVtYmVyLiBIb3dldmVyLCBzaW5j
ZSB0aGUNCj4gPiBzcGktbm9yIHN1YnN5c3RlbSBkb2Vzbid0IHN1cHBvcnQgdGhlc2UgZXh0ZW5k
ZWQgYWJpbGl0aWVzLCB0aGV5DQo+ID4gYXJlIG5vdA0KPiA+IHRha2VuIGFkdmFudGFnZSBvZiBo
ZXJlLg0KPiANCj4gSSdtIHNvcnJ5LCBidXQgd2UgZG9uJ3QgYWNjZXB0IGFueSBuZXcgcGFydHMs
IHdoaWNoIGNsZWFybHkgZW11bGF0ZXMNCj4gYW4gRUVQUk9NIGFuZCBoYXMgbm8gY29uY2VwdCBv
ZiBlcmFzZSBibG9ja3MgKG9yIGRvbid0IGV2ZW4gZW11bGF0ZQ0KPiB0aGUgZXJhc2Ugb3Bjb2Rl
KS4gSSB1bmRlcnN0YW5kLCB0aGF0IGl0IHdhcyB2ZXJ5IGNvbnZlbmllbnQgdG8gaGF2ZQ0KPiBh
IGJsb2NrIGRldmljZS4gQnV0IEkgd2FudCB0byBtb3ZlIGF3YXkgZnJvbSB0aGF0IE5PX0VSQVNF
IGhhY2sgYW5kDQo+IGhhdmluZyB0d28gZGlmZmVyZW50IGRyaXZlcnMgZm9yIHRoZSBzYW1lIGhh
cmR3YXJlIGRldmljZS4NCj4gDQo+IE1heWJlIHNvbWVvbmUgaW4gdGhlIGxvb3AgaGFzIGFuIGlk
ZWEgaG93IHRvIG1vdmUgZm9yd2FyZCByZWdhcmRpbmcNCj4gdGhlIGZpbGVzeXN0ZW0gaXNzdWUu
DQo+IA0KPiAuLg0KPiANCj4gPiArCX0sIHsNCj4gPiArCQkuaWQgPSBTTk9SX0lEKDB4MDQsIDB4
N2YsIDB4NDkpLA0KPiA+ICsJCS5uYW1lID0gIm1iODVyczRtdHkiLA0KPiANCj4gV2UgZHJvcHBl
ZCBhZGRpbmcgbmFtZXMgb2YgdGhlIGZsYXNoZXMgZm9yIG5ldyBwYXJ0cywgYmVjYXVzZSBvZg0K
PiBub3RvcmlvdXMgaWQgcmV1c2UuDQo+IA0KPiAtbWljaGFlbA0KPiANCj4gPiArCQkuc2l6ZSA9
IFNaXzUxMkssDQo+ID4gKwkJLnNlY3Rvcl9zaXplID0gU1pfNTEySywNCj4gPiArCQkuZmxhZ3Mg
PSBTUElfTk9SX05PX0VSQVNFDQo+ID4gwqAJfQ0KPiA+IMKgfTsNCj4gPiDCoA0KDQpUaGFua3Mg
Zm9yIHlvdXIgZmVlZGJhY2suIEJhc2VkIG9uIHRoaXMgSSB3aWxsIG5vdCBtb3ZlIGZvcndhcmQg
d2l0aA0KdGhpcyBwYXRjaHNldCwgYXQgbGVhc3QgaW4gaXRzIGN1cnJlbnQgZm9ybS4NCg0KUmVn
YXJkcywNClJvbmFuLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
