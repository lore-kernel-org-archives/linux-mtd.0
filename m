Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C2AC001B0
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jul 2023 06:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNd434SifjYsVVkkvFoDwU/jKQDEO8+SHHEe84GN61s=; b=KlZGK+oGVH/pUc
	ixDjhoShSUoIRuv2exILEqygfIOw/ir9rlz8j3GKn2OdT7VVHlW+Dxui01oOUMiRwJlY8909TEhGF
	2pZuXoaYvIfE/rKkBX3TkDRr1WkUVJkezOXpRcUUNJSB9RuttMk+BAjI+wNUFy2ixVDAQNKNouRr7
	nZFTO4+aTS+0ZMFrMu7NAG26jX8g5VHb8qihjgWfQYOd+HLyGE59bCFO1GywSTnifsHBA+zo+/Hjc
	SoZXSR5KsqI35LWOMOT6lI8qyk+Aipooh2wizsdpZ0KX2iBfhkvja8nKqTpJInKms5avgatSr838w
	RaxHer1aRpNBCjHJ3UJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHI4S-000ZKy-2s;
	Thu, 06 Jul 2023 06:02:28 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHI4N-000ZHO-2Y;
	Thu, 06 Jul 2023 06:02:26 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 1A3DA100083;
	Thu,  6 Jul 2023 09:02:13 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 1A3DA100083
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688623333;
	bh=wyxlQ93v05b7JnZGehYFodABlKWTrWnDqvvvdm+T1GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=oAVDgB6qfEpyHXt8qkV37x45nawz2HO0q8iki2znNLVo/rNJvLmKK3aT6FFxTDTou
	 Zbbb8xYqNrqKHmcG+ibvJ1+ohOzEFH2TXYDSorhkguXSlL9Ks/Ln1k0Wh9c1gdnhlp
	 ue2oI4ebNMgbMpJAKJ0N19A2Qmppbf/iG31ydiLcLFjzu3bxR4hIKrhvWN0CbWRODU
	 k88q+qZ8wilDXjHRzG9SktSZFeQrES/TKk0Atug35pjL0jzxAINoq9/LqvJkDGxnqI
	 LUu8rdxs9UqMff8H5pEkck+hStRhvLJFSjBk4UVcZLF7fnfTjEPCM9ZDJVLMgEYwvk
	 kzmfZGCWNfc/A==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  6 Jul 2023 09:02:12 +0300 (MSK)
Received: from [192.168.0.12] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 6 Jul 2023 09:02:06 +0300
Message-ID: <677b0b16-2bfc-46e5-6029-e3b56abcaa3c@sberdevices.ru>
Date: Thu, 6 Jul 2023 08:57:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: nand: meson: support for 512B ECC
 step size
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
References: <20230705065434.297040-1-AVKrasnov@sberdevices.ru>
 <20230705065434.297040-2-AVKrasnov@sberdevices.ru>
 <20230705093702.6c0421d7@xps-13>
 <365898fb-3719-38e0-4383-e04ccc0b475b@sberdevices.ru>
 <20230705102254.0aeb94ea@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230705102254.0aeb94ea@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178461 [Jul 05 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 14:57:00 #21566867
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_230224_178729_01DD70C8 
X-CRM114-Status: GOOD (  22.88  )
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

CgpPbiAwNS4wNy4yMDIzIDExOjIyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgNSBKdWwgMjAyMyAx
MTowMzozMCArMDMwMDoKPiAKPj4gT24gMDUuMDcuMjAyMyAxMDozNywgTWlxdWVsIFJheW5hbCB3
cm90ZToKPj4+IEhpIEFyc2VuaXksCj4+Pgo+Pj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdy
b3RlIG9uIFdlZCwgNSBKdWwgMjAyMyAwOTo1NDozMyArMDMwMDoKPj4+ICAgCj4+Pj4gTWVzb24g
TkFORCBzdXBwb3J0cyBib3RoIDUxMkIgYW5kIDEwMjRCIEVDQyBzdGVwIHNpemUsIHNvIHJlcGxh
Y2UKPj4+PiAnY29uc3QnIGZvciBvbmx5IDEwMjRCIHN0ZXAgc2l6ZSB3aXRoIGVudW0gZm9yIGJv
dGggc2l6ZXMuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jh
c25vdkBzYmVyZGV2aWNlcy5ydT4KPj4+PiAtLS0KPj4+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbCB8IDQgKysrLQo+Pj4+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2lj
LG1lc29uLW5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
YW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwKPj4+PiBpbmRleCAzYmVjOGFmOTFiYmIuLjgxY2E4ODI4
NzMxYSAxMDA2NDQKPj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sCj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbAo+Pj4+IEBAIC00OSw3
ICs0OSw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+Pj4+ICAgICAgICAgIGNvbnN0OiBodwo+Pj4+
ICAKPj4+PiAgICAgICAgbmFuZC1lY2Mtc3RlcC1zaXplOgo+Pj4+IC0gICAgICAgIGNvbnN0OiAx
MDI0Cj4+Pj4gKyAgICAgICAgZW51bTogWzUxMiwgMTAyNF0KPj4+PiArICAgICAgICBkZWZhdWx0
OiAxMDI0ICAKPj4+Cj4+PiBJIHdhcyBhY3R1YWxseSB3cm9uZyBpbiBteSBwcmV2aW91cyByZXZp
ZXcsIHRoZXJlIGlzIG5vIHN0cm9uZyBkZWZhdWx0Cj4+PiBoZXJlIGFzIHRoZSBleGlzdGluZyBi
aW5kaW5nIChhbmQgY29kZSkgdHJ5IHRvIHVzZSB0aGUgY2xvc2VzdAo+Pj4gcGFyYW1ldGVycyBy
ZXF1aXJlZCBieSB0aGUgTkFORCBjaGlwOiB3ZSBwaWNrIHRoZSAib3B0aW1hbCIKPj4+IGNvbmZp
Z3VyYXRpb24uIFNvIGlmIHlvdSBkb24ndCBwcm92aWRlIGFueSB2YWx1ZSBoZXJlLCB3ZSBleHBl
Y3QKPj4+IHRoZSBzdHJlbmd0aCBhbmQgc3RlcCBzaXplIGFkdmVydGl6ZWQgYnkgdGhlIGNoaXAg
dG8gYmUgdXNlZC4gVGhpcyBpcyBhCj4+PiBjb21tb24gZGVmYXVsdCBpbiB0aGUgcmF3IE5BTkQg
c3Vic3lzdGVtLgo+Pj4KPj4+IFBsZWFzZSBkcm9wIHRoZSBkZWZhdWx0IGxpbmUsIHJlLWludGVn
cmF0ZSB0aGUgbWlzc2luZyBSLWJ5IHRhZyBmcm9tCj4+PiBSb2IgYW5kIGluIGEgc2VwYXJhdGUg
cGF0Y2ggcGxlYXNlIG1hcmsgbmFuZC1lY2Mtc3RlcC1zaXplIGFuZAo+Pj4gbmFuZC1lY2Mtc3Ry
ZW5ndGggbWFuZGF0b3J5IGlmIHRoZSBvdGhlciBpcyBwcm92aWRlLiBJT1csIHdlIGV4cGVjdAo+
Pj4gZWl0aGVyIGJvdGgsIG9yIG5vbmUgb2YgdGhlbSwgYnV0IG5vdCBhIHNpbmdsZSBvbmUuICAK
Pj4KPj4gSSBzZWUsIG5vIHByb2JsZW0hICJtYW5kYXRvcnkiIG1lYW5zIHVwZGF0ZSBkZXNjcmlw
dGlvbiBvZiBib3RoIGZpZWxkcyBsaWtlOgo+Pgo+PiAgICAgZGVzY3JpcHRpb246ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPj4gICAgICAg
TWFuZGF0b3J5IGlmIG5hbmQtZWNjLXN0ZXAtc2l6ZSBpcyBzZXQuCj4gCj4gTm9wZSA6LSkKPiAK
PiBTb21ldGhpbmcgYWxvbmc6Cj4gCj4gYWxsT2Y6Cj4gICAtIGlmOgo+ICAgICA8bmFuZC1jaGlw
PjoKPiAgICAgICBwcm9wZXJ0aWVzOgo+ICAgICAgICAgY29udGFpbnM6Cj4gICAgICAgICAgIC0g
bmFuZC1lY2Mtc3RlcC1zaXplCj4gICAgIHRoZW46Cj4gICAgICAgcmVxdWlyZWQ6Cj4gICAgICAg
ICA8bmFuZC1jaGlwPjoKPiAgICAgICAgICAgcHJvcGVydGllczoKPiAgICAgICAgICAgICAtIG5h
bmQtZWNjLXN0cmVuZ3RoCj4gCj4gQW5kIHNhbWUgd2l0aCB0aGUgb3Bwb3NpdGUgbG9naWMuCgpJ
IHNlZSwgdGhhbmtzISBBbmQgdGhpcyBzaG91bGQgYmUgZm9yIGFsbCBuYW5kIGNoaXBzLCBub3Qg
b25seSBBbWxvZ2ljPyBJIG1lYW4gaW4KbmFuZC1jaGlwLnlhbWw/IAoKSSdsbCBpbmNsdWRlIGl0
IGFzIHRoaXJkIHBhdGNoIGluIHRoaXMgcGF0Y2hzZXQuCgpUaGFua3MsIEFyc2VuaXkKCj4gCj4+
Cj4+IGV0Yy4KPj4KPj4gPwo+Pgo+Pj4gICAKPj4+PiAgCj4+Pj4gICAgICAgIG5hbmQtZWNjLXN0
cmVuZ3RoOgo+Pj4+ICAgICAgICAgIGVudW06IFs4LCAxNiwgMjQsIDMwLCA0MCwgNTAsIDYwXQo+
Pj4+IEBAIC05Myw2ICs5NCw3IEBAIGV4YW1wbGVzOgo+Pj4+ICAgICAgICBuYW5kQDAgewo+Pj4+
ICAgICAgICAgIHJlZyA9IDwwPjsKPj4+PiAgICAgICAgICBuYW5kLXJiID0gPDA+Owo+Pj4+ICsg
ICAgICAgIG5hbmQtZWNjLXN0ZXAtc2l6ZSA9IDwxMDI0PjsgIAo+Pj4KPj4+IFNvIGluIHRoZSBl
bmQgdGhpcyBsaW5lIGlzIHdyb25nIGFuZCBvbmNlIHlvdSBnZXQgdGhlIGRlc2NyaXB0aW9uIHJp
Z2h0Cj4+PiBhcyBJIG1lbnRpb25lZCBpdCBhYm92ZSwgdGhpcyB3aWxsIGZhaWwgdG8gcGFzcwo+
Pj4gYG1ha2UgRFRfU0NIRU1BX0ZJTEVTPURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvIGR0X2JpbmlkbmdfY2hlY2tgCj4+PiBQbGVhc2UgZHJvcCBpdCBmcm9tIHRoZSBleGFt
cGxlLCBkb24ndCBhZGQgdGhlIHNlY29uZCBwcm9wZXJ0eSBoZXJlLAo+Pj4gaXQncyBiZXN0IHRv
IHNob3cgYSBjbGVhbiBleGFtcGxlIHdoZXJlIHBlb3BsZSBzdG9wIHRhbXBlcmluZyBmb3Igbm8K
Pj4+IHJlYXNvbiB3aXRoIHRoZSBvcHRpbWFsIHZhbHVlcy4gIAo+Pgo+PiBPayEKPj4KPj4gVGhh
bmtzLCBBcnNlbml5Cj4+Cj4+PiAgIAo+Pj4+ICAgICAgICB9Owo+Pj4+ICAgICAgfTsKPj4+PiAg
ICAKPj4+Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gTWlxdcOobCAgCj4gCj4gCj4gVGhhbmtzLAo+IE1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
