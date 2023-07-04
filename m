Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722D8EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 15:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Nya8mw3MM3g8SPb6SfWuMcHKorprMvV9+BnaGsOD9A=; b=ZOMcgcEa4e9yBt
	5aMFiTws6aA4Qb3KwBZglAhZBYabKE4w9d3aSiVSbtIie1BjckClQQDz44f1scy+pRUaic547g197
	31R0JPj2dzj53UzMIwrf7UR7S5CDVMa/Vrd9kZsrALO65LaoPwUW2rK+NBzy/iKCXpF4AqcZhf7iQ
	pvbe5y8zHi+OEqSeJV9uWG/d7EHvEe2maPquwTpgoYHUi9SwSe6mYYAw1bPNStwvvC2nadVILF628
	Hw85f2jOyqOsNQePIT/i918o4rPPvHno1ZmLY4no8uYdvW68pCoa1v4lTkmbqQX2SPn6jssNBpQ2G
	JRNZUlUIb2Zw4+Ou87Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhhY-00DcUS-2s;
	Tue, 04 Jul 2023 15:12:24 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhhU-00DcSR-1t;
	Tue, 04 Jul 2023 15:12:22 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6C5A8120056;
	Tue,  4 Jul 2023 18:12:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6C5A8120056
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688483534;
	bh=MA18R4ahtdeUwMRF3ebCu6zn0dDacp0s1VVqqmBwV7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=ox8qOlaWTO8rk6r8RAc4KQBGMVACKzKeKwGKI6jM7Kv5RRfT17BTQ+1c9yBuy9W14
	 IeLclQ8lh53wRx/JOx/BwldRfCUosLgN6qQEn7b5xXoYE7kshmUk6krtUbrVFgZGQO
	 bi4KRSYGk/t1LU6nQuSTxdQVgfSdBK+evbkPGkfCjWOMz0URwIBa33UoVApW08J1ud
	 kTkM/Vp0rleXvbS/Z2w4vdzKbtrLhNkzzIoJBn1ax+2vS02kAJZgcIsMeDkItiSofo
	 qzCr3j+AiHAXV49Kui+LjuoqIYqRPGMQ4rYWudYnLkyZXlF0qcxXkqOYRLAoINe6Ty
	 s3DkJQInq4KXQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 18:12:14 +0300 (MSK)
Received: from [192.168.0.12] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 18:12:03 +0300
Message-ID: <e45afb19-d77b-6ef3-08bf-68e8626371be@sberdevices.ru>
Date: Tue, 4 Jul 2023 18:07:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v1 2/2] mtd: rawnand: meson: support for 512B ECC step
 size
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230628092937.538683-1-AVKrasnov@sberdevices.ru>
 <20230628092937.538683-3-AVKrasnov@sberdevices.ru>
 <20230704103617.4affae8a@xps-13>
 <9e6eaa87-887c-f955-113a-43860c8ea00c@sberdevices.ru>
 <20230704114110.25ca9de4@xps-13>
 <aede4639-0e99-565a-c997-c414342c66af@sberdevices.ru>
 <20230704115628.55320428@xps-13>
 <ee2eb73a-fb25-58ae-cf7e-83d971b7b8b2@sberdevices.ru>
 <20230704154106.5c5aafd8@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230704154106.5c5aafd8@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178426 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_081221_010431_5F3E964F 
X-CRM114-Status: GOOD (  21.57  )
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

CgpPbiAwNC4wNy4yMDIzIDE2OjQxLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4+Pj4+PiBZZXMsIHRoaXMgY29kZSBsb29rcyBzdHJhbmdlLiAnbnNlY3RvcnMnIGlzIHVz
ZWQgdG8gY2FsY3VsYXRlIHNwYWNlIGluIE9PQgo+Pj4+Pj4gdGhhdCBjb3VsZCBiZSB1c2VkIGJ5
IEVDQyBlbmdpbmUgKHRoaXMgdmFsdWUgd2lsbCBiZSBwYXNzZWQgYXMgJ29vYmF2YWlsJwo+Pj4+
Pj4gdG8gJ25hbmRfZWNjX2Nob29zZV9jb25mKCknKS4gSWRlYSBvZiA1MTIgaXMgdG8gY29uc2lk
ZXIgIndvcnN0IiBjYXNlCj4+Pj4+PiBmb3IgRUNDLCBlLmcuIG1pbmltYWwgbnVtYmVyIG9mIGJ5
dGVzIGZvciBFQ0MgZW5naW5lIChhbmQgYXQgdGhlIHNhbWUgdGltZQo+Pj4+Pj4gbWF4aW11bSBu
dW1iZXIgb2YgZnJlZSBieXRlcykuIEZvciBNZXNvbiwgaWYgRUNDIHN0ZXAgc2l6ZSBpcyA1MTIs
IHRoZW4gd2UKPj4+Pj4+IGhhdmUgNCB4IDIgZnJlZSBieXRlcyBpbiBPT0IgKGlmIHN0ZXAgc2l6
ZSBpZiAxMDI0IHRoZW4gd2UgaGF2ZSAyIHggMiBmcmVlCj4+Pj4+PiBieXRlcyBpbiBPT0IpLgo+
Pj4+Pj4KPj4+Pj4+IEkgdGhpbmsgdGhpcyBjb2RlIGNvdWxkIGJlIHJld29ya2VkIGluIHRoZSBm
b2xsb3dpbmcgd2F5Ogo+Pj4+Pj4KPj4+Pj4+IGlmIEVDQyBzdGVwIHNpemUgaXMgYWxyZWFkeSBr
bm93biBoZXJlIChmcm9tIERUUyksIGNhbGN1bGF0ZSAnbnNlY3RvcnMnIHVzaW5nCj4+Pj4+PiBn
aXZlbiB2YWx1ZSAoZGl2IGJ5IDUxMiBmb3IgZXhhbXBsZSkuIE90aGVyd2lzZSBjYWxjdWxhdGUg
J25zZWN0b3JzJyBpbiB0aGUKPj4+Pj4+IGN1cnJlbnQgbWFubmVyOiAgICAKPj4+Pj4KPj4+Pj4g
SXQgd2lsbCBhbHdheXMgYmUga25vd24gd2hlbiB0aGVzZSBmdW5jdGlvbiBhcmUgcnVuLiBUaGVy
ZSBpcyBubwo+Pj4+PiBndWVzc2luZyBoZXJlLiAgICAKPj4+Pgo+Pj4+IEhtIEkgY2hlY2tlZCwg
dGhhdCBidXQgaWYgc3RlcCBzaXplIGlzIG5vdCBzZXQgaW4gRFRTLCBoZXJlIGl0IHdpbGwgYmUg
MCwgCj4+Pj4gdGhlbiBpdCB3aWxsIGJlIHNlbGVjdGVkIGluICduYW5kX2VjY19jaG9vc2VfY29u
ZigpJyBhY2NvcmRpbmcgcHJvdmlkZWQgJ2VjY19jYXBzJwo+Pj4+IGFuZCAnb29iYXZhaWwnLi4u
Cj4+Pj4KPj4+PiBBbnl3YXksIEknbGwgZG8gdGhlIGZvbGxvd2luZyB0aGluZzoKPj4+Pgo+Pj4+
IGludCBuc2VjdG9yczsKPj4+Pgo+Pj4+IGlmIChuYW5kLT5lY2Muc2l6ZSkKPj4+PiAgICAgbnNl
Y3RvcnMgPSBtdGQtPndyaXRlc2l6ZSAvIG5hbmQtPmVjYy5zaXplOyA8LS0tIHRoaXMgaXMgZm9y
IDUxMiBFQ0MgIAo+Pj4KPj4+IFlvdSBzaG91bGQgc2V0IG5hbmQtPmVjYy5zaXplIGluIC0+YXR0
YWNoX2NoaXAoKSBpbnN0ZWFkLiAgCj4+Cj4+IFNvcnJ5LCBkaWRuJ3QgZ2V0IGl0Li4uIGlmIEVD
QyBzdGVwIHNpemUgaXMgc2V0IGluIERUUywgdGhlbiBoZXJlLCBpbiBjaGlwIGF0dGFjaAo+PiBj
YWxsYmFjayBpdCB3aWxsIGJlIGFscmVhZHkga25vd24gKERUIHBhcnQgd2FzIHByb2Nlc3NlZCBp
biAncmF3bmFuZF9kdF9pbml0KCknKS4KPj4gSWYgRUNDIHN0ZXAgc2l6ZSBpcyB1bmtub3duIChl
LmcuIDAgaGVyZSksICduYW5kX2VjY19jaG9vc2VfY29uZigpJyB3aWxsIHNldCBpdAo+PiBhY2Nv
cmRpbmcgcHJvdmlkZWQgZWNjIGNhcHMuIFdoYXQgZG8gWW91IG1lYW4gZm9yICJZb3Ugc2hvdWxk
IHNldCAuLi4iID8KPiAKPiBUaGUgY3VycmVudCBhcHByb2FjaCBpcyB3cm9uZywgaXQgZGVjaWRl
cyB0aGUgbnVtYmVyIG9mIEVDQyBjaHVua3MKPiAoY2FsbGVkIG5zZWN0b3JzIGluIHRoZSBkcml2
ZXIpIGFuZCB0aGVuIGFza3MgdGhlIGNvcmUgdG8gZGVjaWRlIHRoZQo+IG51bWJlciBvZiBFQ0Mg
Y2h1bmtzIHRvIHVzZS4KClllcyEgSSB3YXMgYWxzbyBjb25mdXNlZCBhYm91dCB0aGF0LgoKPiAK
PiBKdXN0IHByb3ZpZGUgbXRkLT5vb2JzaXplIC0gMiBhcyBsYXN0IHBhcmFtZXRlciBhbmQgdGhl
biByZWx5IG9uIHRoZQo+IGNvcmUncyBsb2dpYyB0byBmaW5kIHRoZSByaWdodCBFQ0Mgc3RlcC1z
aXplL3N0cmVuZ3RoPwo+IAo+IFRoZXJlIGlzIG5vIHBvaW50IGluIHJlcXVlc3RpbmcgYSBwYXJ0
aWN1bGFyIHN0ZXAgc2l6ZSB3aXRob3V0IGEKPiBzcGVjaWZpYyBzdHJlbmd0aCwgb3I/IFNvIEkg
YmVsaWV2ZSB5b3Ugc2hvdWxkIHByb3ZpZGUgYm90aCBpbiB0aGUgRFRTCj4gaWYgeW91IHdhbnQg
cGFydGljdWxhciBwYXJhbWV0ZXJzIHRvIGJlIGFwcGxpZWQsIG90aGVyd2lzZSB5b3UgY2FuIGxl
dAo+IHRoZSBjb3JlIGRlY2lkZSB3aGF0IGlzIGJlc3QuCgpTbyBJIHRoaW5rIHRoaXMgY291bGQg
YmUgYSBzZXBhcmF0ZWQgcGF0Y2ggYXMgaXQgZG9lc24ndCByZWx5IG9uIDUxMiBzdGVwIHNpemUg
RUNDCnN1cHBvcnQgZm9yIE1lc29uIGFuZCBtYXkgYmUgaXQgc2hvdWxkIGJlICJGaXgiIHRhZ2dl
ZC4KClRoYW5rcywgQXJzZW5peQoKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
