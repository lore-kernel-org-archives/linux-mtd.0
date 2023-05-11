Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7876BC77B7F
	for <linux-mtd@archiver.kernel.org>; Thu, 11 May 2023 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OdD0HLoUh4uzQTub6Mwn+LTVWlRghS1XynYRNQU/6Xc=; b=i8iAo4uw3B9wQO
	s/nE7n4mApFceyI0hxw44VbEcA1tcy86aAOXaCti0fT0jXWZG0vIg/dF3VmuJXNY50i9bjozSzZkg
	4/HQAEyhsOzLZqa4tak+Vsl4Se2amWXCeUbhmEK55WqSD/wQIB5aCJJsWrJSv3HbdtxkeLC4K+YRu
	A+8wK3E4yBmIyLq6zw7Q8pggh9Mro4K0QscjNHQrHVniLsLdp2s4YeThchEGXGnXJ3r2QfaC6Pblr
	R+1iEza9b5mHGdvzhhNj1mJgh53GCg5trwK3aN3r857zoE7sI0O0lYzzsgkeZ71zBNYRNeE9jfTUu
	dFDIKrRwSdws8UswcKEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px2V9-008KsL-0v;
	Thu, 11 May 2023 09:22:19 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px2V5-008KrF-0X;
	Thu, 11 May 2023 09:22:17 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id DE3145FD42;
	Thu, 11 May 2023 12:22:12 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683796932;
	bh=S3C/qd36a5XSWTl3tC3h99nhsCKhX8Zq+qQB/zjZvlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=ZB4QzxQRBTsoJVA/f5PB1ldAygQmuHcwnHOETvUTSAeBg0e6DZVDkxZdYxFMStzqa
	 re/PdjM4VZtVFsrGTdMPTCugwiX0zOGazaOpligQJImJ05p9Gy91BUvq6sedcZspFo
	 hMwMRNdTGsELKxlludhffXL7tr1dfqIblip5OVD2cHNWGOmvLrF8vlfitlc+ekMajR
	 TVMQgKZ95YUk4U730bOHTTJO4NWs+Bb2UWPS56/6FgY6q5O3XfdoDl1my2I/BAoz58
	 IbcEWqs0wX8g1NxBhCBCvRHVv/OD+z37PNVhH0OtDHMKX4Bdk8HOdA5piGZlY/484O
	 GeSfp4uycrxHg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 11 May 2023 12:22:11 +0300 (MSK)
Message-ID: <dd25efa3-e46a-e857-d355-53330a8a4181@sberdevices.ru>
Date: Thu, 11 May 2023 12:17:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 6/6] mtd: rawnand: meson: rename node for chip select
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang
	<liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230510110835.26115-1-AVKrasnov@sberdevices.ru>
 <20230510110835.26115-7-AVKrasnov@sberdevices.ru>
 <CAFBinCAbTuNGEG13f71F8vhN3yGce+kkYJ7PHMpZbh8DzSapJg@mail.gmail.com>
 <20230510225359.061c2df6@xps-13>
 <6918ed54-3929-4832-1e93-6eb55b75c82b@sberdevices.ru>
 <20230511111204.0b0b3d70@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230511111204.0b0b3d70@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/11 05:14:00 #21258391
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_022215_558549_BDAA18CB 
X-CRM114-Status: GOOD (  18.85  )
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

CgpPbiAxMS4wNS4yMDIzIDEyOjEyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFRodSwgMTEgTWF5IDIwMjMg
MTE6NTk6MDcgKzAzMDA6Cj4gCj4+IE9uIDEwLjA1LjIwMjMgMjM6NTMsIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4+Cj4+IEhlbGxvIE1hcnRpbiwgTWlxdWVsCj4+Cj4+PiBIaSBNYXJ0aW4gJiBBcnNl
bml5LAo+Pj4KPj4+IG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20gd3JvdGUgb24g
V2VkLCAxMCBNYXkgMjAyMyAyMjo0MDozNwo+Pj4gKzAyMDA6Cj4+PiAgIAo+Pj4+IEhlbGxvIEFy
c2VuaXksCj4+Pj4KPj4+PiBPbiBXZWQsIE1heSAxMCwgMjAyMyBhdCAxOjEz4oCvUE0gQXJzZW5p
eSBLcmFzbm92Cj4+Pj4gPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4gd3JvdGU6ICAKPj4+Pj4K
Pj4+Pj4gVGhpcyByZW5hbWVzIG5vZGUgd2l0aCB2YWx1ZXMgZm9yIGNoaXAgc2VsZWN0IGZyb20g
InJlZyIgdG8gImNzIi4gSXQgaXMKPj4+Pj4gbmVlZGVkIGJlY2F1c2Ugd2hlbiBPVFAgYWNjZXNz
IGlzIGVuYWJsZWQgb24gdGhlIGF0dGFjaGVkIHN0b3JhZ2UsIE1URAo+Pj4+PiBzdWJzeXN0ZW0g
cmVnaXN0ZXJzIHRoaXMgc3RvcmFnZSBpbiB0aGUgTlZNRU0gc3Vic3lzdGVtLiBOVk1FTSBpbiB0
dXJuCj4+Pj4+IHRyaWVzIHRvIHVzZSAicmVnIiBub2RlIGluIGl0cyBvd24gbWFubmVyLCBzdXBw
b3NlcyB0aGF0IGl0IGhhcyBhbm90aGVyCj4+Pj4+IGxheW91dC4gQWxsIG9mIHRoaXMgbGVhZHMg
dG8gZGV2aWNlIGluaXRpYWxpemF0aW9uIGZhaWx1cmUuICAgIAo+Pj4+IEluIGdlbmVyYWw6IGlm
IHdlIGNoYW5nZSB0aGUgZGV2aWNlLXRyZWUgaW50ZXJmYWNlIChpbiB0aGlzIGNhc2U6Cj4+Pj4g
cmVwbGFjaW5nIGEgInJlZyIgd2l0aCBhICJjcyIgcHJvcGVydHkpIHRoZSBkdC1iaW5kaW5ncyBo
YXZlIHRvIGJlCj4+Pj4gdXBkYXRlZCBhcyB3ZWxsLiAgCj4+Pgo+Pj4gVHJ1ZSwgYW5kIEkgd291
bGQgYWRkLCBiaW5kaW5ncyBzaG91bGQgbm90IGJlIGJyb2tlbi4gIAo+Pgo+PiBJIHNlZSwgdGhh
dCdzIHRydWUuIFRoYXQgaXMgYmFkIHdheSB0byBjaGFuZ2UgYmluZGluZ3MuCj4+Cj4+PiAgIAo+
Pj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVy
LnlhbWwgYW5kCj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbWxv
Z2ljLG1lc29uLW5hbmQueWFtbCBzaG93Cj4+Pj4gdGhhdCB0aGUgY2hpcCBzZWxlY3Qgb2YgYSBO
QU5EIGNoaXAgaXMgc3BlY2lmaWVkIHdpdGggYSAicmVnIgo+Pj4+IHByb3BlcnR5LiAgCj4+Pgo+
Pj4gQWxsIE5BTkQgY29udHJvbGxlciBiaW5kaW5nIGV4cGVjdCB0aGUgY2hpcC1zZWxlY3QgdG8g
YmUgaW4gdGhlCj4+PiAncmVnJyBwcm9wZXJ0eSwgdmVyeSBtdWNoIGxpa2UgYSBzcGkgZGV2aWNl
IHdvdWxkIHVzZSByZWcgdG8gc3RvcmUgdGhlCj4+PiBjcyBhcyB3ZWxsOiB0aGUgcmVnIHByb3Bl
cnR5IHRlbGxzIHlvdSBob3cgeW91IGFkZHJlc3MgdGhlIGRldmljZS4KPj4+Cj4+PiBJIGFsc28g
ZnVsbHkgYWdyZWUgd2l0aCBNYXJ0aW4ncyBjb21tZW50cyBiZWxvdy4gQ2hhbmdpbmcgcmVnIGlz
IGxpa2VseQo+Pj4gYSB3cm9uZyBhcHByb2FjaCA6KQo+Pj4gICAKPj4+PiBBbHNvIHRoZSBjb2Rl
IGhhcyB0byBiZSBiYWNrd2FyZHMgY29tcGF0aWJsZSB3aXRoIG9sZCAuZHRicy4KPj4+PiAgCj4+
Pj4+IEV4YW1wbGU6Cj4+Pj4+Cj4+Pj4+IFsuLi5dIG52bWVtIG10ZDAtdXNlci1vdHA6IG52bWVt
OiBpbnZhbGlkIHJlZyBvbiAvc29jL2J1c0BmZmUwMDAwMC8uLi4KPj4+Pj4gWy4uLl0gbXRkIG10
ZDA6IEZhaWxlZCB0byByZWdpc3RlciBPVFAgTlZNRU0gZGV2aWNlCj4+Pj4+IFsuLi5dIG1lc29u
LW5hbmQgZmZlMDc4MDAubmZjOiBmYWlsZWQgdG8gcmVnaXN0ZXIgTVREIGRldmljZTogLTIyCj4+
Pj4+IFsuLi5dIG1lc29uLW5hbmQgZmZlMDc4MDAubmZjOiBmYWlsZWQgdG8gaW5pdCBOQU5EIGNo
aXBzCj4+Pj4+IFsuLi5dIG1lc29uLW5hbmQ6IHByb2JlIG9mIGZmZTA3ODAwLm5mYyBmYWlsZWQg
d2l0aCBlcnJvciAtMjIgICAgCj4+Pj4gVGhpcyBpcyBvZGQgLSBjYW4geW91IHBsZWFzZSBzaGFy
ZSB5b3VyIGRlZmluaXRpb24gb2YgdGhlICZuZmMgbm9kZT8gIAo+Pgo+PiBTdXJlLCBoZXJlIGl0
IGlzOgo+Pgo+PiBtdGRfbmFuZDogbmZjQDc4MDAgeyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAKPj4gCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1heGctbmZjIjsKPj4gCS4uLgo+PiAJ
bmFuZEAwIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+PiAgICAgICAgIAlyZWcg
PSA8MD47Cj4+ICAgICAgICAgfTsKPj4gfQo+Pgo+PiBJIGNoZWNrZWQsIHRoYXQgJ25hbmRfc2V0
X2ZsYXNoX25vZGUoKScgaXMgY2FsbGVkIHdpdGggJ25hbmRAMCcgYW5kIGkgc3VwcG9zZQo+PiB0
aGF0IGl0IGlzIGNvcnJlY3QgKGFzIFlvdSBtZW50aW9uZWQgYmVsb3cpLiBCdXQsICdudm1lbV9h
ZGRfY2VsbHNfZnJvbV9vZigpJyBpcyBjYWxsZWQKPj4gd2l0aCBwYXJlbnQ6ICduZmNANzgwMCcs
IHRoZW4gaXQgaXRlcmF0ZXMgb3ZlciBpdHMgY2hpbGRzLCBlLmcuICduYW5kQDAnIGFuZCB0aHVz
IGkgZ2V0IHN1Y2gKPj4gc2l0dWF0aW9uLiBJIGd1ZXNzLCB0aGF0ICdudm1lbV9hZGRfY2VsbHNf
ZnJvbV9vZigpJyBtdXN0IGJlIGNhbGxlZCB3aXRoICduYW5kQDAnID8KPiAKPiBXZSByZWNlbnRs
eSBoYWQgaXNzdWVzIHdpdGggbnZtZW0gcGFyc2luZywgYnV0IEkgYmVsaWV2ZSBhIG1haW5saW5l
Cj4ga2VybmVsIHNob3VsZCBub3cgYmUgcGVyZmVjdGx5IHdvcmtpbmcgb24gdGhpcyByZWdhcmQu
IFdoYXQgdmVyc2lvbiBvZgo+IHRoZSBMaW51eCBrZXJuZWwgYXJlIHlvdSB1c2luZz8KCk15IGN1
cnJlbnQgdmVyc2lvbiBpczoKClZFUlNJT04gPSA2ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApQQVRDSExFVkVMID0gMiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKU1VCTEVW
RUwgPSAwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgCkVYVFJBVkVSU0lPTiA9IC1yYzggCgpGaXggd2FzIGluIGRyaXZlcnMvbnZtZW0v
KiA/CgpUaGFua3MsIEFyc2VuaXkKCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
