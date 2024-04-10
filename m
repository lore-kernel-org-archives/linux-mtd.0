Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66675CD129A
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 14:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TFFCHJqPncjwRiM+NWVbJYT32GuqawfHO8JaUmJZB8=; b=j3z0ozC/eghsZT
	RTrIVvd2MXsslKLFptwVdW9X/88xYNQDxJpVxWHVw3U4QRo2pog3Ya5DXEEK1kxu/Llrc57gXe9EW
	BH50itrMq7lMkbxzYWDEaxHs5Yj3+2oJv/WVXTR5oIC9TPEq9LMJj0Uj8sZOVl5+hMiBW92/H7wXD
	gqT4mRj1lj3hXGelEsVStJJZcXtAv88tkvjaBv/qWiK3atAtil7Q7yD++cFKctLFZixavavP8yOd5
	G0ej92v+UwpBS+61Lgz+juJyxg4Jv9zM/hCbAERyFrQyIigFdmU9CNldjt5S7n6SJw/5XSPTaIQTS
	vO7xSX6Kw38FWqexaztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZPh-00000007eE3-2si5;
	Wed, 10 Apr 2024 14:59:01 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZPa-00000007e7a-0n68;
	Wed, 10 Apr 2024 14:58:57 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4853A120059;
	Wed, 10 Apr 2024 17:58:46 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4853A120059
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712761126;
	bh=s8Jp2yeif5VAKKBhmostp0DMhMpyI/I2d+WdPlscn4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=kNvpm2A569qLsm12AbdnxFN2hRYvCoaeNhjiEX+qvGKsT2W11zx/mFp2JAssoqg09
	 H2TjeqWCzQrzqD0eX33JsivX/pPqjxg5F7fPCC/ICrLpuCG7p6TUmw3wSY4UE0e9Uc
	 jz2U7hgt4oIX62djwoWtgBl/KthdYsev7KrjllD8GvrSdK6MF3aVOUbEf4qzOfzY89
	 mX98Vkp6snHHsTWIC9a76cfNgWea/ax4mSqhHzpfaTuMu+3nSzygkarfdJCoURIicR
	 tJU8WJfiSl4PvnL/OjwzRbOln170pZ4I/Gqk4/5ilaPxaIaErqOrghRbWlIK2zhmK3
	 CEvveW0HHXdbQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 10 Apr 2024 17:58:46 +0300 (MSK)
Received: from [172.28.64.75] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Apr 2024 17:58:45 +0300
Message-ID: <588551c9-3426-e623-e2aa-70b040c9324a@salutedevices.com>
Date: Wed, 10 Apr 2024 17:48:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: amlogic,meson-nand: support
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
References: <20240409181025.55504-1-avkrasnov@salutedevices.com>
 <20240409181025.55504-2-avkrasnov@salutedevices.com>
 <20240410122356.30852b3c@xps-13>
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
In-Reply-To: <20240410122356.30852b3c@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184655 [Apr 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 16 0.3.16 6e64c33514fcbd07e515710c86ba61de7f56194e, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/10 11:03:00 #24738255
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_075855_042525_113562F1 
X-CRM114-Status: GOOD (  20.77  )
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

SGksCgpPbiAxMC4wNC4yMDI0IDEzOjIzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2Vu
aXksCj4gCj4gYXZrcmFzbm92QHNhbHV0ZWRldmljZXMuY29tIHdyb3RlIG9uIFR1ZSwgOSBBcHIg
MjAyNCAyMToxMDoyNCArMDMwMDoKPiAKPj4gQm9vdCBST00gY29kZSBvbiBNZXNvbiByZXF1aXJl
cyB0aGF0IHNvbWUgcGFnZXMgb24gTkFORCBtdXN0IGJlIHdyaXR0ZW4KPj4gaW4gc3BlY2lhbCBt
b2RlOiAic2hvcnQiIEVDQyBtb2RlIHdoZXJlIGVhY2ggYmxvY2sgaXMgMzg0IGJ5dGVzIGFuZAo+
PiBzY3JhbWJsaW5nIG1vZGUgaXMgb24uIFN1Y2ggcGFnZXMgbG9jYXRlZCB3aXRoIHRoZSBzcGVj
aWZpZWQgaW50ZXJ2YWwKPj4gd2l0aGluIHNwZWNpZmllZCBvZmZzZXQuIEJvdGggaW50ZXJ2YWwg
YW5kIG9mZnNldCBhcmUgbG9jYXRlZCBpbiB0aGUKPj4gZGV2aWNlIHRyZWUgYW5kIHVzZWQgYnkg
ZHJpdmVyIGlmICduYW5kLWlzLWJvb3QtbWVkaXVtJyBpcyBzZXQgZm9yCj4+IE5BTkQgY2hpcC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFzbm92IDxhdmtyYXNub3ZAc2FsdXRlZGV2
aWNlcy5jb20+Cj4+IC0tLQo+PiAgLi4uL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQu
eWFtbCAgICAgICAgICAgfCAxNCArKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sCj4+IGluZGV4IDU3
YjY5NTdjODQxNS4uYjg2YTE5NTMwNTZiIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sCj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlh
bWwKPj4gQEAgLTY0LDExICs2NCwyNSBAQCBwYXR0ZXJuUHJvcGVydGllczoKPj4gICAgICAgICAg
aXRlbXM6Cj4+ICAgICAgICAgICAgbWF4aW11bTogMAo+PiAgCj4+ICsgICAgICBhbWxvZ2ljLGJv
b3QtcGFnZS1sYXN0Ogo+PiArICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZp
bml0aW9ucy91aW50MzIKPj4gKyAgICAgICAgZGVzY3JpcHRpb246Cj4+ICsgICAgICAgICAgVGhl
IE5GQyBkcml2ZXIgbmVlZHMgdGhpcyBpbmZvcm1hdGlvbiB0byBzZWxlY3QgRUNDCj4+ICsgICAg
ICAgICAgYWxnb3JpdGhtcyBzdXBwb3J0ZWQgYnkgdGhlIGJvb3QgUk9NLgo+IAo+IFNoYWxsIHdl
IGhhdmUgYSBsZW5ndGggcmF0aGVyIHRoYW4gdGhlIGxhc3QgcGFnZT8KCllvdSBtZWFuIHJlbmFt
ZSBpdCB0byAiYW1sb2dpYyxib290LXBhZ2VzLWxlbmd0aCIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dCA/IEJ1dCBJIHRoaW5rCmxlbmd0aCBpbiBieXRlcyBpcyB1c2VsZXNzIGhlcmU6CjEpIGJvb3Qg
cm9tIG5lZWRzIHRoYXQgb25seSBzb21lIHNpbmdsZSBwYWdlcyBhcmUgd3JpdHRlbiBpbiBzcGVj
aWFsIG1vZGUgKGFuZCBhcyBJIHNlZSBpbgogICB2ZW5kb3IncyBkcml2ZXIgaXQgYWxzbyB3b3Jr
cyBpbiBwYWdlcykuCjIpIE5BTkQgZHJpdmVyIG9wZXJhdGVzIGluIHBhZ2VzIGR1cmluZyB3cml0
ZS9yZWFkIHN1Y2ggcGFnZXMuCgpTbyBsZW5ndGggaW4gYnl0ZXMgd2lsbCBiZSBjb252ZXJ0ZWQg
dG8gcGFnZXMgYW55d2F5LgoKV2hhdCBkbyBZb3UgdGhpbmsgPwoKVGhhbmtzLCBBcnNlbml5Cgo+
IAo+PiArCj4+ICsgICAgICBhbWxvZ2ljLGJvb3QtcGFnZS1zdGVwOgo+PiArICAgICAgICAkcmVm
OiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPj4gKyAgICAgICAgZGVz
Y3JpcHRpb246Cj4+ICsgICAgICAgICAgVGhlIE5GQyBkcml2ZXIgbmVlZHMgdGhpcyBpbmZvcm1h
dGlvbiB0byBzZWxlY3QgRUNDCj4+ICsgICAgICAgICAgYWxnb3JpdGhtcyBzdXBwb3J0ZWQgYnkg
dGhlIGJvb3QgUk9NIChpbiBwYWdlcykuCj4+ICsKPj4gICAgICB1bmV2YWx1YXRlZFByb3BlcnRp
ZXM6IGZhbHNlCj4+ICAKPj4gICAgICBkZXBlbmRlbmNpZXM6Cj4+ICAgICAgICBuYW5kLWVjYy1z
dHJlbmd0aDogW25hbmQtZWNjLXN0ZXAtc2l6ZV0KPj4gICAgICAgIG5hbmQtZWNjLXN0ZXAtc2l6
ZTogW25hbmQtZWNjLXN0cmVuZ3RoXQo+PiArICAgICAgYW1sb2dpYyxib290LXBhZ2UtbGFzdDog
W25hbmQtaXMtYm9vdC1tZWRpdW0sICJhbWxvZ2ljLGJvb3QtcGFnZS1zdGVwIl0KPj4gKyAgICAg
IGFtbG9naWMsYm9vdC1wYWdlLXN0ZXA6IFtuYW5kLWlzLWJvb3QtbWVkaXVtLCAiYW1sb2dpYyxi
b290LXBhZ2UtbGFzdCJdCj4+ICAKPj4gIAo+PiAgcmVxdWlyZWQ6Cj4gCj4gCj4gVGhhbmtzLAo+
IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
