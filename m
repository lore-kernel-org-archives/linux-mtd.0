Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0831FC10F1A
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 07:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b7mXz6KmNiPzlWy6p00UIJFFj/jCRINQI6tl6Da1Cas=; b=0cJT4JZZs0Pusc
	yMHn+2CSOe4oR9LB2IXTYlE+xjpDkDGQBiUvAGdTx56HyNB5mUhYHU7kDO0q+g3RZQI4jrK4OScKi
	dsEj5fGfqw+gqKsJm0Ui9yiPQXNrn53ABJV8BpC7F2W3mhmcOLzsX63B+0POsLYYqdm/gY0bkDSnp
	AXwJbXDS4ZNtvpZiVAak0jQGV1+bgLeWBaRpmnOua+nz1m05K6UbVlgoccjazZ8Cw+9Q5rVr3IzEY
	d3qkPbYM7YUT8emtfkKEj0UI8uOMNLAEejxFCqCvITwNCQj56tBelYMEjZeROW+MI/iESd0BDEPoB
	xjWJxl7F+x30LMCNvmTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FX8-0000000A1wC-3rho;
	Tue, 07 May 2024 07:46:42 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FX3-0000000A1uJ-3iu1;
	Tue, 07 May 2024 07:46:39 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 0D05B120005;
	Tue,  7 May 2024 10:46:35 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 0D05B120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715067995;
	bh=Gu71DSSw7UmD80j9iS8L6fOPFWts2Eqb3HZYUJnLUQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=g1xsU6pQtn8HsuRHl2PbpoH6ktNn/NNTJgnu0d8Pf8dUGmmrRIrDCX2d5yDCkOWdO
	 UqjUFPp6maQ0CRIbDhCLdQRZQUj6mIFSiIUSAwrG9Z6kuxGOlAz3fmkD11k4FG4loc
	 ROgfBNtqvbXp40oDGrHlk/IYx8hgcfApUZHO+q1j57maDX0vnPOL14tpZqiI8FWKVR
	 YthHiYDaJxdWI9L4+owRh4Y0RvL/j0u8rpt+2GOO+HOrJ7zPrQpwSKnvp/Sy+jMvoG
	 Pml6qneHQmbss0rwzQo9SjB2UWqILgORZESCta4fj11wcAoMUCB3gkfw1q0yS2Qru9
	 FBXOb92L87g4w==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  7 May 2024 10:46:34 +0300 (MSK)
Received: from [172.28.226.125] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 7 May 2024 10:46:34 +0300
Message-ID: <e3ea7238-c80d-dfe9-28bf-df95708872d6@salutedevices.com>
Date: Tue, 7 May 2024 10:35:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>
References: <20240416085101.740458-1-avkrasnov@salutedevices.com>
 <20240416085101.740458-2-avkrasnov@salutedevices.com>
 <20240506154858.003bab54@xps-13>
 <d90f9d3d-7823-503f-4cc6-73783a083d0e@salutedevices.com>
 <20240507092726.4ab1afdb@xps-13>
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
In-Reply-To: <20240507092726.4ab1afdb@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185103 [May 07 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/07 06:33:00 #25113436
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_004638_306181_01A1961C 
X-CRM114-Status: GOOD (  17.67  )
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

CgpPbiAwNy4wNS4yMDI0IDEwOjI3LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNhbHV0ZWRldmljZXMuY29tIHdyb3RlIG9uIFR1ZSwgNyBNYXkgMjAy
NCAwOTo1MzowNiArMDMwMDoKPiAKPj4gT24gMDYuMDUuMjAyNCAxNjo0OCwgTWlxdWVsIFJheW5h
bCB3cm90ZToKPj4+IEhpIEFyc2VuaXksCj4+Pgo+Pj4gYXZrcmFzbm92QHNhbHV0ZWRldmljZXMu
Y29tIHdyb3RlIG9uIFR1ZSwgMTYgQXByIDIwMjQgMTE6NTE6MDAgKzAzMDA6Cj4+PiAgIAo+Pj4+
IEJvb3QgUk9NIGNvZGUgb24gTWVzb24gcmVxdWlyZXMgdGhhdCBzb21lIHBhZ2VzIG9uIE5BTkQg
bXVzdCBiZSB3cml0dGVuCj4+Pj4gaW4gc3BlY2lhbCBtb2RlOiAic2hvcnQiIEVDQyBtb2RlIHdo
ZXJlIGVhY2ggYmxvY2sgaXMgMzg0IGJ5dGVzIGFuZAo+Pj4+IHNjcmFtYmxpbmcgbW9kZSBpcyBv
bi4gIAo+Pj4KPj4+IE9rCj4+PiAgIAo+Pj4+IFN1Y2ggcGFnZXMgbG9jYXRlZCB3aXRoIHRoZSBz
cGVjaWZpZWQgaW50ZXJ2YWwgd2l0aGluIHNwZWNpZmllZCBvZmZzZXQuICAKPj4+Cj4+PiBJJ20g
c29ycnkgSSBkb24ndCBnZXQgdGhhdCBzZW50ZW5jZS4gIAo+Pgo+PiBTb3JyeSwgSSBtZWFuIHRo
aXMgKGxldCBtZSBkcmF3IDopICkgOgo+Pgo+PiBbIHBhZ2UgMCBdWyBwYWdlIDEgXVsgcGFnZSAy
IF1bIHBhZ2UgMyBdWyBwYWdlIDQgXVsgcGFnZSA1IF1bIHBhZ2UgNiBdWyBwYWdlIDcgXVsgcGFn
ZSA4IF1bIHBhZ2UgOSBdCj4+Cj4+IEZvciBleGFtcGxlLCB3ZSBoYXZlIDEwIHBhZ2VzIHN0YXJ0
aW5nIGZyb20gdGhlIGJlZ2lubmluZyBvZiB0aGUgY2hpcCAtIHRoaXMgaXMgIndpdGhpbiBzcGVj
aWZpZWQgb2Zmc2V0IiwKPj4gZS5nLiBvZmZzZXQgaXMgMTAuIEJvb3RST00gb24gYXhnIG5lZWRz
IHRoYXQgKGZvciBleGFtcGxlKSBldmVyeSB0aGlyZCBwYWdlIG11c3QgYmUgd3JpdHRlbiBpbiAi
c3BlY2lhbCIKPj4gbW9kZTogc2NyYW1ibGluZyBpcyBvbiBhbmQgRUNDIGlzIDM4NCBieXRlcy4g
U3VjaCBwYWdlcyBhcmUgMCwgMiwgNCwgNiwgOC4gRS5nLiAic3BlY2lmaWVkIGludGVydmFsIiB3
aWxsCj4+IGJlIDMuCj4gCj4gU2hhbGwgYmUgMiwgbm8/Cgp5ZXMsIHN0YXJ0aW5nIGZyb20gMCAt
IHRoZW4gMi4gZS5nLgppZiAoIShwYWdlX251bSAlIDIpKQogICAgYm9vdCBST00gbmVlZCB0aGlz
IHBhZ2UKCj4gCj4+Cj4+IFNvOgo+Pgo+PiBhbWxvZ2ljLGJvb3QtcGFnZXM6IDEwCj4+IGFtbG9n
aWMsYm9vdC1wYWdlLXN0ZXA6IDMKPiAKPiBPayBJIGdldCBpdC4gVGhhbmtzIGZvciB0aGUgZXhw
bGFuYXRpb24uIEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgdGhlCj4gbG9naWMgYmVoaW5kIGl0
IHRob3VnaC4gRG8geW91IGtub3cgd2h5IHRoZSBib290Uk9NIHdvdWxkIGFjY2VzcyBvbmx5Cj4g
b25lIHBhZ2Ugb3ZlciAyIG9yIDM/IElzIHRoZXJlIGEgZGVmYXVsdCB2YWx1ZT8gSXMgdGhpcyBj
b25maWd1cmFibGU/CgpObywgYm9vdCByb20gc291cmNlIGlzIGNsb3NlZCwgSSBkb24ndCBoYXZl
IGFjY2VzcyB0byBpdC4gSSBnZXQgdGhpcyBsb2dpYwpmcm9tIG9sZCB2ZXJzaW9uIG9mIHZlbmRv
cidzIHVib290IC0gaW4gcHJhY3RpY2UgdGhleSB1c2Ugbm9uIDIgb3IgMywgdGhleQp1c2UgaGFy
ZGNvZGVkIDEyOCBzdGVwIHZhbHVlLiBBbmQgYW1sb2dpYyxib290LXBhZ2VzIGlzIDEwMjQKClRo
YW5rcywgQXJzZW5peQoKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
