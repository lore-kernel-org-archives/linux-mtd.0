Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEE0EB64DA
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 17:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fBkNlZ4qMmk+gyo3sD+OD1p+OQnCUVd8i0thRcjDFE=; b=hFZHcOYoOS+8E2
	78b4QPhUGntMDmN/fiyAYANtp9/DkzWj0SpvwjEGGV0KJqyotyWKft6HlCf577GCydYXl0j7bRIAT
	x6xrBKRQuYmDdUNnBgDTZKsvzVJ3VSVg9tch1ilEdXValbX1D7HfnTDbPOFRZNlRGxEOCf9gTUWFC
	1AnXyDOTHik1ID5mITunk+FnrxJXzhftJDFE5CzxwoJnkfb7ZKZJq0WiZKWBGMedeyEqEijJgLmvG
	sTEQpoNSvLiN5uVGWcED+4OaMseeQnXAmRtKVJQ2c9gNR1Mk9+KSN3vW5FVdUNrPGJWp2zcvwdHVx
	h2pJDC6W0N5d8wP9t2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjaN-00DuDb-0d;
	Tue, 04 Jul 2023 17:13:07 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjaJ-00DuC8-00;
	Tue, 04 Jul 2023 17:13:04 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4C1D2100069;
	Tue,  4 Jul 2023 20:13:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4C1D2100069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688490780;
	bh=c5anjQ50O4XG85w6I+VHIgcCUqeP1JMFLZR+QlP2Fno=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=citdblkXmYIJgkwDrffGHkZ7IFBMys7tAIbTpMGbT2nRqbSu9KRHiKrvHVDhdggXc
	 aC/QLmWvkzccCxCiJkZjG3IpUE49t5JMXBQUnOKzsEF/TzB3OUdyHFhQXLWGI+x3MZ
	 9uHP5F2lzjZKwi8m5jpJoMkXIhIFokf82kk6pY41AZUbLUyaMdvCiSE8ZRZgOfWeeU
	 uZtnEjB6M4OBuCTWnu0AkYtxmqhJiawNar2GOHIDfuylyNnUVOWPvc2EDIxmMYPMBJ
	 gBbGxyXMvGXQzaL0BB2QJtJNLIIY12tQ4pwjPtkDyZ8kiYkLSDp5yyn6NGxXeGqv4u
	 J9Sdu+nOtJyJQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 20:13:00 +0300 (MSK)
Received: from [192.168.0.12] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 20:12:48 +0300
Message-ID: <66b47505-c23d-2e7f-107b-68ab578b3b3c@sberdevices.ru>
Date: Tue, 4 Jul 2023 20:07:45 +0300
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
 <e45afb19-d77b-6ef3-08bf-68e8626371be@sberdevices.ru>
 <20230704173223.771acd99@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230704173223.771acd99@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178431 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_101303_397923_91C3AA91 
X-CRM114-Status: GOOD (  20.63  )
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

CgpPbiAwNC4wNy4yMDIzIDE4OjMyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFR1ZSwgNCBKdWwgMjAyMyAx
ODowNzowNCArMDMwMDoKPiAKPj4gT24gMDQuMDcuMjAyMyAxNjo0MSwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPj4+IEhpIEFyc2VuaXksCj4+PiAgIAo+Pj4+Pj4+PiBZZXMsIHRoaXMgY29kZSBsb29r
cyBzdHJhbmdlLiAnbnNlY3RvcnMnIGlzIHVzZWQgdG8gY2FsY3VsYXRlIHNwYWNlIGluIE9PQgo+
Pj4+Pj4+PiB0aGF0IGNvdWxkIGJlIHVzZWQgYnkgRUNDIGVuZ2luZSAodGhpcyB2YWx1ZSB3aWxs
IGJlIHBhc3NlZCBhcyAnb29iYXZhaWwnCj4+Pj4+Pj4+IHRvICduYW5kX2VjY19jaG9vc2VfY29u
ZigpJykuIElkZWEgb2YgNTEyIGlzIHRvIGNvbnNpZGVyICJ3b3JzdCIgY2FzZQo+Pj4+Pj4+PiBm
b3IgRUNDLCBlLmcuIG1pbmltYWwgbnVtYmVyIG9mIGJ5dGVzIGZvciBFQ0MgZW5naW5lIChhbmQg
YXQgdGhlIHNhbWUgdGltZQo+Pj4+Pj4+PiBtYXhpbXVtIG51bWJlciBvZiBmcmVlIGJ5dGVzKS4g
Rm9yIE1lc29uLCBpZiBFQ0Mgc3RlcCBzaXplIGlzIDUxMiwgdGhlbiB3ZQo+Pj4+Pj4+PiBoYXZl
IDQgeCAyIGZyZWUgYnl0ZXMgaW4gT09CIChpZiBzdGVwIHNpemUgaWYgMTAyNCB0aGVuIHdlIGhh
dmUgMiB4IDIgZnJlZQo+Pj4+Pj4+PiBieXRlcyBpbiBPT0IpLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJ
IHRoaW5rIHRoaXMgY29kZSBjb3VsZCBiZSByZXdvcmtlZCBpbiB0aGUgZm9sbG93aW5nIHdheToK
Pj4+Pj4+Pj4KPj4+Pj4+Pj4gaWYgRUNDIHN0ZXAgc2l6ZSBpcyBhbHJlYWR5IGtub3duIGhlcmUg
KGZyb20gRFRTKSwgY2FsY3VsYXRlICduc2VjdG9ycycgdXNpbmcKPj4+Pj4+Pj4gZ2l2ZW4gdmFs
dWUgKGRpdiBieSA1MTIgZm9yIGV4YW1wbGUpLiBPdGhlcndpc2UgY2FsY3VsYXRlICduc2VjdG9y
cycgaW4gdGhlCj4+Pj4+Pj4+IGN1cnJlbnQgbWFubmVyOiAgICAgIAo+Pj4+Pj4+Cj4+Pj4+Pj4g
SXQgd2lsbCBhbHdheXMgYmUga25vd24gd2hlbiB0aGVzZSBmdW5jdGlvbiBhcmUgcnVuLiBUaGVy
ZSBpcyBubwo+Pj4+Pj4+IGd1ZXNzaW5nIGhlcmUuICAgICAgCj4+Pj4+Pgo+Pj4+Pj4gSG0gSSBj
aGVja2VkLCB0aGF0IGJ1dCBpZiBzdGVwIHNpemUgaXMgbm90IHNldCBpbiBEVFMsIGhlcmUgaXQg
d2lsbCBiZSAwLCAKPj4+Pj4+IHRoZW4gaXQgd2lsbCBiZSBzZWxlY3RlZCBpbiAnbmFuZF9lY2Nf
Y2hvb3NlX2NvbmYoKScgYWNjb3JkaW5nIHByb3ZpZGVkICdlY2NfY2FwcycKPj4+Pj4+IGFuZCAn
b29iYXZhaWwnLi4uCj4+Pj4+Pgo+Pj4+Pj4gQW55d2F5LCBJJ2xsIGRvIHRoZSBmb2xsb3dpbmcg
dGhpbmc6Cj4+Pj4+Pgo+Pj4+Pj4gaW50IG5zZWN0b3JzOwo+Pj4+Pj4KPj4+Pj4+IGlmIChuYW5k
LT5lY2Muc2l6ZSkKPj4+Pj4+ICAgICBuc2VjdG9ycyA9IG10ZC0+d3JpdGVzaXplIC8gbmFuZC0+
ZWNjLnNpemU7IDwtLS0gdGhpcyBpcyBmb3IgNTEyIEVDQyAgICAKPj4+Pj4KPj4+Pj4gWW91IHNo
b3VsZCBzZXQgbmFuZC0+ZWNjLnNpemUgaW4gLT5hdHRhY2hfY2hpcCgpIGluc3RlYWQuICAgIAo+
Pj4+Cj4+Pj4gU29ycnksIGRpZG4ndCBnZXQgaXQuLi4gaWYgRUNDIHN0ZXAgc2l6ZSBpcyBzZXQg
aW4gRFRTLCB0aGVuIGhlcmUsIGluIGNoaXAgYXR0YWNoCj4+Pj4gY2FsbGJhY2sgaXQgd2lsbCBi
ZSBhbHJlYWR5IGtub3duIChEVCBwYXJ0IHdhcyBwcm9jZXNzZWQgaW4gJ3Jhd25hbmRfZHRfaW5p
dCgpJykuCj4+Pj4gSWYgRUNDIHN0ZXAgc2l6ZSBpcyB1bmtub3duIChlLmcuIDAgaGVyZSksICdu
YW5kX2VjY19jaG9vc2VfY29uZigpJyB3aWxsIHNldCBpdAo+Pj4+IGFjY29yZGluZyBwcm92aWRl
ZCBlY2MgY2Fwcy4gV2hhdCBkbyBZb3UgbWVhbiBmb3IgIllvdSBzaG91bGQgc2V0IC4uLiIgPyAg
Cj4+Pgo+Pj4gVGhlIGN1cnJlbnQgYXBwcm9hY2ggaXMgd3JvbmcsIGl0IGRlY2lkZXMgdGhlIG51
bWJlciBvZiBFQ0MgY2h1bmtzCj4+PiAoY2FsbGVkIG5zZWN0b3JzIGluIHRoZSBkcml2ZXIpIGFu
ZCB0aGVuIGFza3MgdGhlIGNvcmUgdG8gZGVjaWRlIHRoZQo+Pj4gbnVtYmVyIG9mIEVDQyBjaHVu
a3MgdG8gdXNlLiAgCj4+Cj4+IFllcyEgSSB3YXMgYWxzbyBjb25mdXNlZCBhYm91dCB0aGF0Lgo+
Pgo+Pj4KPj4+IEp1c3QgcHJvdmlkZSBtdGQtPm9vYnNpemUgLSAyIGFzIGxhc3QgcGFyYW1ldGVy
IGFuZCB0aGVuIHJlbHkgb24gdGhlCj4+PiBjb3JlJ3MgbG9naWMgdG8gZmluZCB0aGUgcmlnaHQg
RUNDIHN0ZXAtc2l6ZS9zdHJlbmd0aD8KPj4+Cj4+PiBUaGVyZSBpcyBubyBwb2ludCBpbiByZXF1
ZXN0aW5nIGEgcGFydGljdWxhciBzdGVwIHNpemUgd2l0aG91dCBhCj4+PiBzcGVjaWZpYyBzdHJl
bmd0aCwgb3I/IFNvIEkgYmVsaWV2ZSB5b3Ugc2hvdWxkIHByb3ZpZGUgYm90aCBpbiB0aGUgRFRT
Cj4+PiBpZiB5b3Ugd2FudCBwYXJ0aWN1bGFyIHBhcmFtZXRlcnMgdG8gYmUgYXBwbGllZCwgb3Ro
ZXJ3aXNlIHlvdSBjYW4gbGV0Cj4+PiB0aGUgY29yZSBkZWNpZGUgd2hhdCBpcyBiZXN0LiAgCj4+
Cj4+IFNvIEkgdGhpbmsgdGhpcyBjb3VsZCBiZSBhIHNlcGFyYXRlZCBwYXRjaCBhcyBpdCBkb2Vz
bid0IHJlbHkgb24gNTEyIHN0ZXAgc2l6ZSBFQ0MKPj4gc3VwcG9ydCBmb3IgTWVzb24gYW5kIG1h
eSBiZSBpdCBzaG91bGQgYmUgIkZpeCIgdGFnZ2VkLgo+IAo+IFl1cCEgVGhhbmtzIGZvciBjbGVh
bmluZyBzbyB0aG9yb3VnaGx5IHRoaXMgZHJpdmVyIDopCgpUaGFua3MgYWdhaW4gZm9yIHJldmll
dyBhbmQgZGV0YWlscyEgOikKClRoYW5rcywgQXJzZW5peQoKPiAKPiBDaGVlcnMsCj4gTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
