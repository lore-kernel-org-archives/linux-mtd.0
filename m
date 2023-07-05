Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16809EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 08:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a774yr3016xy0iOPOGxV/PchQQqQoRH07j7YueNuKv8=; b=JdzyhWsbZld5A3
	q4tmkCAJF3PZi8Nit3LB4a3vnaNeyATiNN/Zz5kfQnQUPbx9rOfejCZyE97GqA3yfuqZ4KJ14hCAK
	/37tmYw+chfs/4q0DhvMo2WGyilh/vQD0fXy7gkzqJf+TBH6Si/z9aRNKwNV9+SRDIb5CzJmCfpp6
	SevLWgZuaNG45kGibgqy1FTRCwy/jD8b0S4Ba2T9Jf1WfCEpmrzioqHxf9zj7ZkKw77IptuwkGy2+
	ftdhmuvtWXIyoH+lOngzrd8D4eXtp1jLnroku2B7NZ60EgWC99nUNgzyCEFnceqdpg7F65rfshgUk
	zIzp7mEQqUOOyf4dfa7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxZD-00F9o0-2D;
	Wed, 05 Jul 2023 08:08:51 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxZ8-00F9mL-1s;
	Wed, 05 Jul 2023 08:08:49 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 161BC120059;
	Wed,  5 Jul 2023 11:08:41 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 161BC120059
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688544521;
	bh=fNQYFEDCRmuCNe/I+fdjC1cG7kMAFnCpHOxYewfTXFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=PH10+e835IqEviJs4EmxvzRWEYguzFbbnTadajLauYd9vEU+wLzMSvIGlu0bYldtp
	 dMlU6CpJFKfrrrDOXBt7r+jVlXN/MhGTglVChTXZwFuqAxjrhyI3Fv3EkgBJw5PhZk
	 rlLS5TStgyPF8aiyjuLwFq/idAQcCuSn6+314YVDpb1F/V7HisK24wrTQ8kxPlUIiF
	 OKGZjugRtcv8CXcC0ymtYZRvudU9KSal82tNuebfWpa1I8Lu7eD3tgLDwueZdWdkde
	 pJ5jQ/d7klH2pZJedXSYwaRztMRH0aLYgzAk4ysUEtjmFDK1TqIlfTyTn6cQ+W+Cbi
	 AYdH/lFCMCk4g==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jul 2023 11:08:40 +0300 (MSK)
Received: from [192.168.0.12] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 5 Jul 2023 11:08:39 +0300
Message-ID: <365898fb-3719-38e0-4383-e04ccc0b475b@sberdevices.ru>
Date: Wed, 5 Jul 2023 11:03:30 +0300
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
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230705093702.6c0421d7@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178438 [Jul 05 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 05:28:00 #21565829
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_010847_312865_CCBC48D7 
X-CRM114-Status: GOOD (  25.44  )
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

CgpPbiAwNS4wNy4yMDIzIDEwOjM3LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgNSBKdWwgMjAyMyAw
OTo1NDozMyArMDMwMDoKPiAKPj4gTWVzb24gTkFORCBzdXBwb3J0cyBib3RoIDUxMkIgYW5kIDEw
MjRCIEVDQyBzdGVwIHNpemUsIHNvIHJlcGxhY2UKPj4gJ2NvbnN0JyBmb3Igb25seSAxMDI0QiBz
dGVwIHNpemUgd2l0aCBlbnVtIGZvciBib3RoIHNpemVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBB
cnNlbml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4KPj4gLS0tCj4+ICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1s
IHwgNCArKystCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbAo+PiBpbmRleCAzYmVjOGFmOTFiYmIu
LjgxY2E4ODI4NzMxYSAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sCj4+IEBAIC00
OSw3ICs0OSw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+PiAgICAgICAgICBjb25zdDogaHcKPj4g
IAo+PiAgICAgICAgbmFuZC1lY2Mtc3RlcC1zaXplOgo+PiAtICAgICAgICBjb25zdDogMTAyNAo+
PiArICAgICAgICBlbnVtOiBbNTEyLCAxMDI0XQo+PiArICAgICAgICBkZWZhdWx0OiAxMDI0Cj4g
Cj4gSSB3YXMgYWN0dWFsbHkgd3JvbmcgaW4gbXkgcHJldmlvdXMgcmV2aWV3LCB0aGVyZSBpcyBu
byBzdHJvbmcgZGVmYXVsdAo+IGhlcmUgYXMgdGhlIGV4aXN0aW5nIGJpbmRpbmcgKGFuZCBjb2Rl
KSB0cnkgdG8gdXNlIHRoZSBjbG9zZXN0Cj4gcGFyYW1ldGVycyByZXF1aXJlZCBieSB0aGUgTkFO
RCBjaGlwOiB3ZSBwaWNrIHRoZSAib3B0aW1hbCIKPiBjb25maWd1cmF0aW9uLiBTbyBpZiB5b3Ug
ZG9uJ3QgcHJvdmlkZSBhbnkgdmFsdWUgaGVyZSwgd2UgZXhwZWN0Cj4gdGhlIHN0cmVuZ3RoIGFu
ZCBzdGVwIHNpemUgYWR2ZXJ0aXplZCBieSB0aGUgY2hpcCB0byBiZSB1c2VkLiBUaGlzIGlzIGEK
PiBjb21tb24gZGVmYXVsdCBpbiB0aGUgcmF3IE5BTkQgc3Vic3lzdGVtLgo+IAo+IFBsZWFzZSBk
cm9wIHRoZSBkZWZhdWx0IGxpbmUsIHJlLWludGVncmF0ZSB0aGUgbWlzc2luZyBSLWJ5IHRhZyBm
cm9tCj4gUm9iIGFuZCBpbiBhIHNlcGFyYXRlIHBhdGNoIHBsZWFzZSBtYXJrIG5hbmQtZWNjLXN0
ZXAtc2l6ZSBhbmQKPiBuYW5kLWVjYy1zdHJlbmd0aCBtYW5kYXRvcnkgaWYgdGhlIG90aGVyIGlz
IHByb3ZpZGUuIElPVywgd2UgZXhwZWN0Cj4gZWl0aGVyIGJvdGgsIG9yIG5vbmUgb2YgdGhlbSwg
YnV0IG5vdCBhIHNpbmdsZSBvbmUuCgpJIHNlZSwgbm8gcHJvYmxlbSEgIm1hbmRhdG9yeSIgbWVh
bnMgdXBkYXRlIGRlc2NyaXB0aW9uIG9mIGJvdGggZmllbGRzIGxpa2U6CgogICAgZGVzY3JpcHRp
b246ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAKICAgICAgTWFuZGF0b3J5IGlmIG5hbmQtZWNjLXN0ZXAtc2l6ZSBpcyBzZXQuCgpldGMuCgo/
Cgo+IAo+PiAgCj4+ICAgICAgICBuYW5kLWVjYy1zdHJlbmd0aDoKPj4gICAgICAgICAgZW51bTog
WzgsIDE2LCAyNCwgMzAsIDQwLCA1MCwgNjBdCj4+IEBAIC05Myw2ICs5NCw3IEBAIGV4YW1wbGVz
Ogo+PiAgICAgICAgbmFuZEAwIHsKPj4gICAgICAgICAgcmVnID0gPDA+Owo+PiAgICAgICAgICBu
YW5kLXJiID0gPDA+Owo+PiArICAgICAgICBuYW5kLWVjYy1zdGVwLXNpemUgPSA8MTAyND47Cj4g
Cj4gU28gaW4gdGhlIGVuZCB0aGlzIGxpbmUgaXMgd3JvbmcgYW5kIG9uY2UgeW91IGdldCB0aGUg
ZGVzY3JpcHRpb24gcmlnaHQKPiBhcyBJIG1lbnRpb25lZCBpdCBhYm92ZSwgdGhpcyB3aWxsIGZh
aWwgdG8gcGFzcwo+IGBtYWtlIERUX1NDSEVNQV9GSUxFUz1Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkLyBkdF9iaW5pZG5nX2NoZWNrYAo+IFBsZWFzZSBkcm9wIGl0IGZyb20g
dGhlIGV4YW1wbGUsIGRvbid0IGFkZCB0aGUgc2Vjb25kIHByb3BlcnR5IGhlcmUsCj4gaXQncyBi
ZXN0IHRvIHNob3cgYSBjbGVhbiBleGFtcGxlIHdoZXJlIHBlb3BsZSBzdG9wIHRhbXBlcmluZyBm
b3Igbm8KPiByZWFzb24gd2l0aCB0aGUgb3B0aW1hbCB2YWx1ZXMuCgpPayEKClRoYW5rcywgQXJz
ZW5peQoKPiAKPj4gICAgICAgIH07Cj4+ICAgICAgfTsKPj4gIAo+IAo+IAo+IFRoYW5rcywKPiBN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
