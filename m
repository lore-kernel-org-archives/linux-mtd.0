Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E218ECD128A
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 15:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PF2Yb0pPGerwYA4w6j2RNJd5BqYYwSw1Bko2/MUOd4c=; b=geFptcN9KUFc+9
	Hb6hwMJ1olmAx2lL+YH7/3jLGjDyGofmKqUVRpNhZOQKJgWv6vN68e3kToGhJf12cLdf9/93IMrfQ
	xN7xW0wXVQelyu8zdqMHo5Rgfrd6Sl7rtxinDss9UqHfz3wnxHBky+x0mn6Ej25qCkMNgUPBGjZq4
	yjkZguv9UKgBi5yrwAZZy1wVQzmPpA/k20kBCJSOC8HZzXg0d4Xqc+jRjm6gsN7fg0AqfHIazmT3C
	cOyvpucDy71n16IRvtH4xmmCCbcuJQXHBYloBQktim1ZQ/1oPv9LVNNaAoYkG6QhMNBoVnpD/rBPq
	8Q4ybASuXNOj5Usl2y3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZSU-00000007fZx-2pUB;
	Wed, 10 Apr 2024 15:01:54 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZSL-00000007fV6-2F29;
	Wed, 10 Apr 2024 15:01:50 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B4C4E12005F;
	Wed, 10 Apr 2024 18:01:42 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B4C4E12005F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712761302;
	bh=q1gcIhloFFL/kbDvWiIUFlnWRSNETi2Q1q4ICf8bZ6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=ZH0ALDkGOFqCk6vAz3G8gC5+qvvZ2daY3q3VrOwr+zrqqGSGa07E84C9GlJDBT58g
	 koMTQTOIv1J0nS663xzaY8Hld8Kq0yA6yu2lMLIrTzdKnnG9+rVXy4KttYznHyKy6E
	 mRSM+KL5H38VTy3Wi9YNjGCmax06SqZ5m9vbNN6G1wBz+r92CwlDhrnS7IfqMxxEa5
	 2+iPeI6dnMXqGnRNqt8Iy/pnF2vWaowH6VPsS4IDwSSYGy7qZP/H2hOBZwCJv9V8gf
	 1GZ/hsQFjDTN4H9z/uCGwDYzkCnnO8WibNenQmM2eVgWayLolSqKqqYkNCmvcqkwZa
	 G8jph7IqvgDqw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 10 Apr 2024 18:01:42 +0300 (MSK)
Received: from [172.28.64.75] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Apr 2024 18:01:42 +0300
Message-ID: <b623a374-4e2f-7160-8d11-75f9beaac42b@salutedevices.com>
Date: Wed, 10 Apr 2024 17:51:03 +0300
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
 <588551c9-3426-e623-e2aa-70b040c9324a@salutedevices.com>
 <20240410170040.37a59ff6@xps-13>
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
In-Reply-To: <20240410170040.37a59ff6@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
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
X-KSMG-AntiSpam-Info: LuaCore: 16 0.3.16 6e64c33514fcbd07e515710c86ba61de7f56194e, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/10 11:03:00 #24738255
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_080146_127499_1B2F8F65 
X-CRM114-Status: GOOD (  18.71  )
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

CgpPbiAxMC4wNC4yMDI0IDE4OjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNhbHV0ZWRldmljZXMuY29tIHdyb3RlIG9uIFdlZCwgMTAgQXByIDIw
MjQgMTc6NDg6MDIgKzAzMDA6Cj4gCj4+IEhpLAo+Pgo+PiBPbiAxMC4wNC4yMDI0IDEzOjIzLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4gSGkgQXJzZW5peSwKPj4+Cj4+PiBhdmtyYXNub3ZAc2Fs
dXRlZGV2aWNlcy5jb20gd3JvdGUgb24gVHVlLCA5IEFwciAyMDI0IDIxOjEwOjI0ICswMzAwOgo+
Pj4gICAKPj4+PiBCb290IFJPTSBjb2RlIG9uIE1lc29uIHJlcXVpcmVzIHRoYXQgc29tZSBwYWdl
cyBvbiBOQU5EIG11c3QgYmUgd3JpdHRlbgo+Pj4+IGluIHNwZWNpYWwgbW9kZTogInNob3J0IiBF
Q0MgbW9kZSB3aGVyZSBlYWNoIGJsb2NrIGlzIDM4NCBieXRlcyBhbmQKPj4+PiBzY3JhbWJsaW5n
IG1vZGUgaXMgb24uIFN1Y2ggcGFnZXMgbG9jYXRlZCB3aXRoIHRoZSBzcGVjaWZpZWQgaW50ZXJ2
YWwKPj4+PiB3aXRoaW4gc3BlY2lmaWVkIG9mZnNldC4gQm90aCBpbnRlcnZhbCBhbmQgb2Zmc2V0
IGFyZSBsb2NhdGVkIGluIHRoZQo+Pj4+IGRldmljZSB0cmVlIGFuZCB1c2VkIGJ5IGRyaXZlciBp
ZiAnbmFuZC1pcy1ib290LW1lZGl1bScgaXMgc2V0IGZvcgo+Pj4+IE5BTkQgY2hpcC4KPj4+Pgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8YXZrcmFzbm92QHNhbHV0ZWRldmlj
ZXMuY29tPgo+Pj4+IC0tLQo+Pj4+ICAuLi4vYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFu
ZC55YW1sICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCj4+Pj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwKPj4+
PiBpbmRleCA1N2I2OTU3Yzg0MTUuLmI4NmExOTUzMDU2YiAxMDA2NDQKPj4+PiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1s
Cj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2lj
LG1lc29uLW5hbmQueWFtbAo+Pj4+IEBAIC02NCwxMSArNjQsMjUgQEAgcGF0dGVyblByb3BlcnRp
ZXM6Cj4+Pj4gICAgICAgICAgaXRlbXM6Cj4+Pj4gICAgICAgICAgICBtYXhpbXVtOiAwCj4+Pj4g
IAo+Pj4+ICsgICAgICBhbWxvZ2ljLGJvb3QtcGFnZS1sYXN0Ogo+Pj4+ICsgICAgICAgICRyZWY6
IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+Pj4+ICsgICAgICAgIGRl
c2NyaXB0aW9uOgo+Pj4+ICsgICAgICAgICAgVGhlIE5GQyBkcml2ZXIgbmVlZHMgdGhpcyBpbmZv
cm1hdGlvbiB0byBzZWxlY3QgRUNDCj4+Pj4gKyAgICAgICAgICBhbGdvcml0aG1zIHN1cHBvcnRl
ZCBieSB0aGUgYm9vdCBST00uICAKPj4+Cj4+PiBTaGFsbCB3ZSBoYXZlIGEgbGVuZ3RoIHJhdGhl
ciB0aGFuIHRoZSBsYXN0IHBhZ2U/ICAKPj4KPj4gWW91IG1lYW4gcmVuYW1lIGl0IHRvICJhbWxv
Z2ljLGJvb3QtcGFnZXMtbGVuZ3RoIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0ID8gQnV0IEkgdGhp
bmsKPj4gbGVuZ3RoIGluIGJ5dGVzIGlzIHVzZWxlc3MgaGVyZToKPj4gMSkgYm9vdCByb20gbmVl
ZHMgdGhhdCBvbmx5IHNvbWUgc2luZ2xlIHBhZ2VzIGFyZSB3cml0dGVuIGluIHNwZWNpYWwgbW9k
ZSAoYW5kIGFzIEkgc2VlIGluCj4+ICAgIHZlbmRvcidzIGRyaXZlciBpdCBhbHNvIHdvcmtzIGlu
IHBhZ2VzKS4KPj4gMikgTkFORCBkcml2ZXIgb3BlcmF0ZXMgaW4gcGFnZXMgZHVyaW5nIHdyaXRl
L3JlYWQgc3VjaCBwYWdlcy4KPj4KPj4gU28gbGVuZ3RoIGluIGJ5dGVzIHdpbGwgYmUgY29udmVy
dGVkIHRvIHBhZ2VzIGFueXdheS4KPj4KPj4gV2hhdCBkbyBZb3UgdGhpbmsgPwo+IAo+IEkgZGlk
bid0IHRhbGsgYWJvdXQgdW5pdHMgOi0pCj4gCj4gTWF5YmU6IGFtbG9naWMsYm9vdC1wYWdlcyB3
b3VsZCBtYWtlIHNlbnNlPyBCdXQgcG9pbnRpbmcgYXQgdGhlIGxhc3QKPiBwYWdlIHNlZW1zIHdl
aXJkLgoKQWggb2sgSSBzZWUuIEdvdCBpdCEKClRoYW5rcywgQXJzZW5peQoKPiAKPiBNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
