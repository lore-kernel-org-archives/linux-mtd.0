Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8574C7EE22
	for <linux-mtd@archiver.kernel.org>; Thu, 11 May 2023 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDlRULcMY6fSGGR5lTVEUWg6p85TEuNU6Wl5sPelo48=; b=yVnNa0GeagKpxW
	JfhTtLzktRTStdekLLop7ykc4u2p4gxDOc8moxTitx5qd1woYbeOtzzCLDHF+5NJLM+WW5N3uFVLP
	1MEOFh9svNFwa+FjFdcF8hYa2hIB/6ashpDvqQE27vkWb/X6wEylO3FunK8zj/pO2TnHGUjgI1fZP
	z1i7njyF2rAGmUcHlms4I8PXjUyEpW9X16p/+/LpT+tb647t/7OqOp8fg1RPxhMoH/fACZtZSPKeZ
	hvq+H19rxpUpAlAbYMMwbUD9Iec0zo3FNEBhIuvyfgeG9EA3NIWUYXiWxnzgT1R3BIJj0UEE84Tp/
	nklrpqqMGhvB/I4RfBcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px2DU-008IRj-0F;
	Thu, 11 May 2023 09:04:04 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px2DO-008IQI-19;
	Thu, 11 May 2023 09:04:01 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id A2DC15FD41;
	Thu, 11 May 2023 12:03:49 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683795829;
	bh=IQFZqqBVnssZ8mraoz9UtGPHU2IuOvSPVd1sfiL/zGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=SbVIy8eXo7aO98UDsQHowxmgrAeIqhTwfSMp0toxfWJiMhgyMRUwuBlhUR99my2Ky
	 DrYUIvtjWSf4IvFBSCg7ncNG1Z1aJ8I8JTW/Qu5fqODgX0TnOnMIos1LHJ42Uafk7h
	 tJ7PFmNY26nBuzUBS3Dkr6IbgiTDkJiCUai0N/MfHtTs3JjSgtFKuCO/oW41bVZFgU
	 aevKcDgmrksUZBt4rvkwGwO//YdPezaQgXM62lxsJ0IUNxW4zADhuyDICG5VFuRZaT
	 +4s91aY1TjUudRqNSv59uSLB4CKZzPVfSWapx2ZnRmRkKLSe7NntkAEb+DU6OLGUoS
	 67M1JsOpkp1pQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 11 May 2023 12:03:47 +0300 (MSK)
Message-ID: <6918ed54-3929-4832-1e93-6eb55b75c82b@sberdevices.ru>
Date: Thu, 11 May 2023 11:59:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 6/6] mtd: rawnand: meson: rename node for chip select
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Yixun
 Lan <yixun.lan@amlogic.com>, <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230510110835.26115-1-AVKrasnov@sberdevices.ru>
 <20230510110835.26115-7-AVKrasnov@sberdevices.ru>
 <CAFBinCAbTuNGEG13f71F8vhN3yGce+kkYJ7PHMpZbh8DzSapJg@mail.gmail.com>
 <20230510225359.061c2df6@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230510225359.061c2df6@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/11 05:14:00 #21258391
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_020359_090023_28E2E40E 
X-CRM114-Status: GOOD (  21.96  )
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

CgpPbiAxMC4wNS4yMDIzIDIzOjUzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgoKSGVsbG8gTWFydGlu
LCBNaXF1ZWwKCj4gSGkgTWFydGluICYgQXJzZW5peSwKPiAKPiBtYXJ0aW4uYmx1bWVuc3Rpbmds
QGdvb2dsZW1haWwuY29tIHdyb3RlIG9uIFdlZCwgMTAgTWF5IDIwMjMgMjI6NDA6MzcKPiArMDIw
MDoKPiAKPj4gSGVsbG8gQXJzZW5peSwKPj4KPj4gT24gV2VkLCBNYXkgMTAsIDIwMjMgYXQgMTox
M+KAr1BNIEFyc2VuaXkgS3Jhc25vdgo+PiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1PiB3cm90
ZToKPj4+Cj4+PiBUaGlzIHJlbmFtZXMgbm9kZSB3aXRoIHZhbHVlcyBmb3IgY2hpcCBzZWxlY3Qg
ZnJvbSAicmVnIiB0byAiY3MiLiBJdCBpcwo+Pj4gbmVlZGVkIGJlY2F1c2Ugd2hlbiBPVFAgYWNj
ZXNzIGlzIGVuYWJsZWQgb24gdGhlIGF0dGFjaGVkIHN0b3JhZ2UsIE1URAo+Pj4gc3Vic3lzdGVt
IHJlZ2lzdGVycyB0aGlzIHN0b3JhZ2UgaW4gdGhlIE5WTUVNIHN1YnN5c3RlbS4gTlZNRU0gaW4g
dHVybgo+Pj4gdHJpZXMgdG8gdXNlICJyZWciIG5vZGUgaW4gaXRzIG93biBtYW5uZXIsIHN1cHBv
c2VzIHRoYXQgaXQgaGFzIGFub3RoZXIKPj4+IGxheW91dC4gQWxsIG9mIHRoaXMgbGVhZHMgdG8g
ZGV2aWNlIGluaXRpYWxpemF0aW9uIGZhaWx1cmUuICAKPj4gSW4gZ2VuZXJhbDogaWYgd2UgY2hh
bmdlIHRoZSBkZXZpY2UtdHJlZSBpbnRlcmZhY2UgKGluIHRoaXMgY2FzZToKPj4gcmVwbGFjaW5n
IGEgInJlZyIgd2l0aCBhICJjcyIgcHJvcGVydHkpIHRoZSBkdC1iaW5kaW5ncyBoYXZlIHRvIGJl
Cj4+IHVwZGF0ZWQgYXMgd2VsbC4KPiAKPiBUcnVlLCBhbmQgSSB3b3VsZCBhZGQsIGJpbmRpbmdz
IHNob3VsZCBub3QgYmUgYnJva2VuLgoKSSBzZWUsIHRoYXQncyB0cnVlLiBUaGF0IGlzIGJhZCB3
YXkgdG8gY2hhbmdlIGJpbmRpbmdzLgoKPiAKPj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFtbCBhbmQKPj4gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbCBzaG93Cj4+IHRoYXQg
dGhlIGNoaXAgc2VsZWN0IG9mIGEgTkFORCBjaGlwIGlzIHNwZWNpZmllZCB3aXRoIGEgInJlZyIK
Pj4gcHJvcGVydHkuCj4gCj4gQWxsIE5BTkQgY29udHJvbGxlciBiaW5kaW5nIGV4cGVjdCB0aGUg
Y2hpcC1zZWxlY3QgdG8gYmUgaW4gdGhlCj4gJ3JlZycgcHJvcGVydHksIHZlcnkgbXVjaCBsaWtl
IGEgc3BpIGRldmljZSB3b3VsZCB1c2UgcmVnIHRvIHN0b3JlIHRoZQo+IGNzIGFzIHdlbGw6IHRo
ZSByZWcgcHJvcGVydHkgdGVsbHMgeW91IGhvdyB5b3UgYWRkcmVzcyB0aGUgZGV2aWNlLgo+IAo+
IEkgYWxzbyBmdWxseSBhZ3JlZSB3aXRoIE1hcnRpbidzIGNvbW1lbnRzIGJlbG93LiBDaGFuZ2lu
ZyByZWcgaXMgbGlrZWx5Cj4gYSB3cm9uZyBhcHByb2FjaCA6KQo+IAo+PiBBbHNvIHRoZSBjb2Rl
IGhhcyB0byBiZSBiYWNrd2FyZHMgY29tcGF0aWJsZSB3aXRoIG9sZCAuZHRicy4KPj4KPj4+IEV4
YW1wbGU6Cj4+Pgo+Pj4gWy4uLl0gbnZtZW0gbXRkMC11c2VyLW90cDogbnZtZW06IGludmFsaWQg
cmVnIG9uIC9zb2MvYnVzQGZmZTAwMDAwLy4uLgo+Pj4gWy4uLl0gbXRkIG10ZDA6IEZhaWxlZCB0
byByZWdpc3RlciBPVFAgTlZNRU0gZGV2aWNlCj4+PiBbLi4uXSBtZXNvbi1uYW5kIGZmZTA3ODAw
Lm5mYzogZmFpbGVkIHRvIHJlZ2lzdGVyIE1URCBkZXZpY2U6IC0yMgo+Pj4gWy4uLl0gbWVzb24t
bmFuZCBmZmUwNzgwMC5uZmM6IGZhaWxlZCB0byBpbml0IE5BTkQgY2hpcHMKPj4+IFsuLi5dIG1l
c29uLW5hbmQ6IHByb2JlIG9mIGZmZTA3ODAwLm5mYyBmYWlsZWQgd2l0aCBlcnJvciAtMjIgIAo+
PiBUaGlzIGlzIG9kZCAtIGNhbiB5b3UgcGxlYXNlIHNoYXJlIHlvdXIgZGVmaW5pdGlvbiBvZiB0
aGUgJm5mYyBub2RlPwoKU3VyZSwgaGVyZSBpdCBpczoKCm10ZF9uYW5kOiBuZmNANzgwMCB7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIAoJY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWF4
Zy1uZmMiOwoJLi4uCgluYW5kQDAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAg
ICAgICAgCXJlZyA9IDwwPjsKICAgICAgICB9Owp9CgpJIGNoZWNrZWQsIHRoYXQgJ25hbmRfc2V0
X2ZsYXNoX25vZGUoKScgaXMgY2FsbGVkIHdpdGggJ25hbmRAMCcgYW5kIGkgc3VwcG9zZQp0aGF0
IGl0IGlzIGNvcnJlY3QgKGFzIFlvdSBtZW50aW9uZWQgYmVsb3cpLiBCdXQsICdudm1lbV9hZGRf
Y2VsbHNfZnJvbV9vZigpJyBpcyBjYWxsZWQKd2l0aCBwYXJlbnQ6ICduZmNANzgwMCcsIHRoZW4g
aXQgaXRlcmF0ZXMgb3ZlciBpdHMgY2hpbGRzLCBlLmcuICduYW5kQDAnIGFuZCB0aHVzIGkgZ2V0
IHN1Y2gKc2l0dWF0aW9uLiBJIGd1ZXNzLCB0aGF0ICdudm1lbV9hZGRfY2VsbHNfZnJvbV9vZigp
JyBtdXN0IGJlIGNhbGxlZCB3aXRoICduYW5kQDAnID8KCj4+Cj4+ICZuZmMgewo+PiAgICAgICBu
YW5kX2NoaXAwOiBuYW5kQDAgewo+PiAgICAgICAgIHJlZyA9IDwwPjsKPj4gICAgICAgfTsKPj4g
fTsKPj4KPj4gVGhpcyBzaG91bGQgcmVzdWx0IGluIG5hbmRfc2V0X2ZsYXNoX25vZGUoKSBiZWlu
ZyBjYWxsZWQgd2l0aAo+PiAmbmFuZF9jaGlwMCAoaWYgaXQncyBjYWxsZWQgd2l0aCAmbmZjIHRo
ZW4gc29tZXRoaW5nIGlzIGJ1Z2d5IGluIG91cgo+PiBkcml2ZXIpLgo+PiBJZiB0aGVyZSdzIG5v
IGNoaWxkIG5vZGVzIHdpdGhpbiAmbmFuZF9jaGlwMCB0aGVuIHdoeSB3b3VsZCB0aGUKPj4gTVRE
LXRvLU5WTUVNIGNvZGUgdGhpbmsgdGhhdCBpdCBoYXMgdG8gcGFyc2Ugc29tZXRoaW5nPwo+PiBJ
ZiB5b3UgZG8gaGF2ZSBjaGlsZCBub2RlcyBhbmQgdGhvc2UgYXJlIHBhcnRpdGlvbnMsIHRoZW4g
bWFrZSBzdXJlCj4+IHRoYXQgdGhlIHN0cnVjdHVyZSBpcyBjb3JyZWN0IChzZWUgdGhlIGV4dHJh
ICJwYXJ0aXRpb25zIiBub2RlIGluc2lkZQo+PiB3aGljaCBhbGwgcGFydGl0aW9ucyBhcmUgbmVz
dGVkKToKPj4gJm5hbmRfY2hpcDAgewo+PiAgICAgcGFydGl0aW9ucyB7Cj4+ICAgICAgICAgY29t
cGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKPj4gICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwxPjsKPj4gICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKPj4KPj4gICAgICAgICBwYXJ0aXRp
b25AMCB7Cj4+ICAgICAgICAgICAgIGxhYmVsID0gInUtYm9vdCI7Cj4+ICAgICAgICAgICAgIHJl
ZyA9IDwweDAwMDAwMDAgMHg0MDAwPjsKPj4gICAgICAgICAgICAgcmVhZC1vbmx5Owo+PiAgICAg
ICAgIH07Cj4+ICAgICB9Owo+PiB9OwoKTm8sIHBhcnRpdGlvbiBub2RlcyBhcmUgZGlzYWJsZWQg
aW4gdGhpcyBjYXNlLgoKVGhhbmtzLCBBcnNlbml5Cgo+Pgo+Pgo+PiBCZXN0IHJlZ2FyZHMsLAo+
PiBNYXJ0aW4KPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
