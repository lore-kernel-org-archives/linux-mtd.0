Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCE6C77B6C
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Apr 2023 10:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lk6j5TmiejHYrwugwl+D8DSTQi10OMQy74e5WMjmVpM=; b=tqG1ngm7v1AxSc
	4B8II3bthz/XgThlJZZUxyHkrzFTo7xi5zjnk5ah/vhzdNp2NxXN6CKp0NL90amfsYOYdo6H2I47/
	mh5RNjj12LnF9QzUPqtNGoKiUiSZUTv4yLUiEaPRQp0HvD+FmjXjAkaajiAlUHKpPIytGh0h4py3r
	1cwzOQhVgy74OEIy7JDbEXTcY2NBRNr5eY4AZQoa70zMnb37456YtTHFitjpLzC8iHcYhjI1jVOE/
	prOcJPBshvvPWj0lwdPomLZgDh4E7MRgM3f9/jMgi10xHHxreKUt3yGjJvTAF+tMD+KwPKLFAltGB
	d1eB078n0GHp2CaN0acA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmuM6-005rOS-3A;
	Thu, 13 Apr 2023 10:39:07 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmuM1-005rHs-1K;
	Thu, 13 Apr 2023 10:39:04 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 497B65FD06;
	Thu, 13 Apr 2023 13:38:56 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681382336;
	bh=cf6UdE6TmRNGVzrgU+fhfRKMfxL8dEJV1E9S0wAk/R8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=b4ef+S2xLN9IVkqpTKK1p/tbk/3Pe6IhSCwzr7mF1GgPkacwu84815vuB5CDok2WH
	 B1WAjUaDF9RoD4lIGC2ARrSUjUvJafV4rCk47/bIflrHW2ugMlfdovS9Q18Rg/jqVY
	 XIuXwjCoABzN6qS95JRhEl3jtNsSN11g2uuE/+l3aJd2C3+UeKfbUkQ7W0qPMbQjN2
	 5NltA8UwtjNzmGPFu+tm4XmYUz1jHocJ5t79cX2JTeLaS/MeQOmjEIj4WN5l6h7dt6
	 ctYeYrcHxj+jveJJFoFMgwvVP7VHbKxpW0iJeMlsIManhiAPhar8gFXCZsA7nwaXVc
	 UDRx1WdMouXBA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 13 Apr 2023 13:38:55 +0300 (MSK)
Message-ID: <569a948e-654a-b21f-8a4f-55dc4b295387@sberdevices.ru>
Date: Thu, 13 Apr 2023 13:35:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, yonghui.yu <yonghui.yu@amlogic.com>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
 <20230412094400.3c82f631@xps-13>
 <ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
 <20230412113654.183350d0@xps-13>
 <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
 <20230412141824.755b2bca@xps-13>
 <eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
 <20230412145715.58c2be4a@xps-13>
 <7c996832-258f-001c-56bd-87bbdf23eeaa@amlogic.com>
 <20230412163214.0c764bb3@xps-13>
 <0c61eaae-053e-5768-a533-70b2ff0cc95d@amlogic.com>
 <fbb8cb2b-0996-3029-b368-f67087d73487@amlogic.com>
 <7520e512-8a19-ff04-364c-b5be0a579ef0@sberdevices.ru>
 <20230413102200.309fbe9c@xps-13>
 <b3279de4-e89d-db03-a515-a6aa52ab90d3@sberdevices.ru>
 <20230413122252.0a8efcd8@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230413122252.0a8efcd8@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/12 22:40:00 #21096401
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_033902_140479_C6B0DB8E 
X-CRM114-Status: GOOD (  30.19  )
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

CgpPbiAxMy4wNC4yMDIzIDEzOjIyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFRodSwgMTMgQXByIDIwMjMg
MTI6MzY6MjQgKzAzMDA6Cj4gCj4+IE9uIDEzLjA0LjIwMjMgMTE6MjIsIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4+PiBIaSBBcnNlbml5LAo+Pj4KPj4+IGF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3
cm90ZSBvbiBUaHUsIDEzIEFwciAyMDIzIDEwOjAwOjI0ICswMzAwOgo+Pj4gICAKPj4+PiBPbiAx
My4wNC4yMDIzIDA5OjExLCBMaWFuZyBZYW5nIHdyb3RlOiAgCj4+Pj4+Cj4+Pj4+IE9uIDIwMjMv
NC8xMyAxMzozMiwgTGlhbmcgWWFuZyB3cm90ZTogICAgCj4+Pj4+PiBIaSBNaXF1ZWwsCj4+Pj4+
Pgo+Pj4+Pj4gT24gMjAyMy80LzEyIDIyOjMyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgICAKPj4+
Pj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Pj4+Pgo+Pj4+Pj4+IEhlbGxvLAo+Pj4+Pj4+Cj4+
Pj4+Pj4gbGlhbmcueWFuZ0BhbWxvZ2ljLmNvbSB3cm90ZSBvbiBXZWQsIDEyIEFwciAyMDIzIDIy
OjA0OjI4ICswODAwOgo+Pj4+Pj4+ICAgIAo+Pj4+Pj4+PiBIaSBNaXF1ZWwgYW5kIEFyc2VuaXks
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uIDIwMjMvNC8xMiAyMDo1NywgTWlxdWVsIFJheW5hbCB3cm90
ZTogICAgCj4+Pj4+Pj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBI
aSBBcnNlbml5LAo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IGF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3
cm90ZSBvbiBXZWQsIDEyIEFwciAyMDIzIDE1OjIyOjI2ICswMzAwOiAgICAKPj4+Pj4+Pj4+PiBP
biAxMi4wNC4yMDIzIDE1OjE4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgICAKPj4+Pj4+Pj4+Pj4g
SGkgQXJzZW5peSwKPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gYXZrcmFzbm92QHNiZXJkZXZpY2Vz
LnJ1IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMgMTM6MTQ6NTIgKzAzMDA6Cj4+Pj4+Pj4+Pj4+
IMKgwqDCoCA+Pj4+IE9uIDEyLjA0LjIwMjMgMTI6MzYsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAg
IAo+Pj4+Pj4+Pj4+Pj4+IEhpIEFyc2VuaXksCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBh
dmtyYXNub3ZAc2JlcmRldmljZXMucnUgd3JvdGUgb24gV2VkLCAxMiBBcHIgMjAyMyAxMjoyMDo1
NSArMDMwMDoKPj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgID4+Pj4+PiBPbiAxMi4wNC4yMDIzIDEw
OjQ0LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgICAKPj4+Pj4+Pj4+Pj4+Pj4+IEhpIEFyc2VuaXks
Cj4+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1
IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMgMDk6MTY6NTggKzAzMDA6Cj4+Pj4+Pj4+Pj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoCA+Pj4+Pj4+PiBUaGlzIE5BTkQgcmVhZHMgb25seSBmZXcgdXNlcidz
IGJ5dGVzIGluIEVDQyBtb2RlIChub3QgZnVsbCBPT0IpLCBzbwo+Pj4+Pj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+Pj4+Pj4+ICJUaGlzIE5BTkQgcmVhZHMiIGRvZXMgbm90IGxvb2sgcmlnaHQsIGRvIHlv
dSBtZWFuICJTdWJwYWdlIHJlYWRzIGRvCj4+Pj4+Pj4+Pj4+Pj4+PiBub3QgcmV0cmlldmUgYWxs
IHRoZSBPT0IgYnl0ZXMsIj8KPj4+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgID4+Pj4+Pj4+
IGZpbGwgT09CIGJ1ZmZlciB3aXRoIHplcm9lcyB0byBub3QgcmV0dXJuIGdhcmJhZ2UgZnJvbSBw
cmV2aW91cyByZWFkcyAgICAKPj4+Pj4+Pj4+Pj4+Pj4+PiB0byB1c2VyLgo+Pj4+Pj4+Pj4+Pj4+
Pj4+IE90aGVyd2lzZSAnbmFuZGR1bXAnIHV0aWxpdHkgcHJpbnRzIHNvbWV0aGluZyBsaWtlIHRo
aXMgZm9yIGp1c3QgZXJhc2VkCj4+Pj4+Pj4+Pj4+Pj4+Pj4gcGFnZToKPj4+Pj4+Pj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+Pj4+Pj4+IC4uLgo+Pj4+Pj4+Pj4+Pj4+Pj4+IDB4MDAwMDA3ZjA6IGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCj4+Pj4+Pj4+Pj4+Pj4+
Pj4gwqDCoMKgIE9PQiBEYXRhOiBmZiBmZiBmZiBmZiAwMCAwMCBmZiBmZiA4MCBjZiAyMiA5OSBj
YiBhZCBkMyBiZQo+Pj4+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoCBPT0IgRGF0YTogNjMgMjcgYWUgMDYg
MTYgMGEgMmYgZWIgYmIgZGQgNDYgNzQgNDEgOGUgODggNmUKPj4+Pj4+Pj4+Pj4+Pj4+PiDCoMKg
wqAgT09CIERhdGE6IDM4IGExIDJkIGU2IDc3IGQ0IDA1IDA2IGYyIGE1IDdlIDI1IGViIDM0IDdj
IGZmCj4+Pj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgIE9PQiBEYXRhOiAzOCBlYSBkZSAxNCAxMCBkZSA5
YiA0MCAzMyAxNiA2YSBjYyA5ZCBhYSAyZiA1ZQo+Pj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFzbm92IDxBVktyYXNub3ZAc2JlcmRldmlj
ZXMucnU+Cj4+Pj4+Pj4+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+Pj4+Pj4+Pj4gwqDCoCBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCA1ICsrKysrCj4+Pj4+Pj4+Pj4+Pj4+Pj4gwqDC
oCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Pj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5j
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+Pj4+Pj4+Pj4+Pj4gaW5k
ZXggZjg0YTEwMjM4ZTRkLi5mMmYyNDcyY2I1MTEgMTAwNjQ0Cj4+Pj4+Pj4+Pj4+Pj4+Pj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+Pj4+Pj4+Pj4+Pj4gKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+Pj4+Pj4+Pj4+Pj4gQEAg
LTg1OCw5ICs4NTgsMTIgQEAgc3RhdGljIGludCBtZXNvbl9uZmNfcmVhZF9wYWdlX3N1YihzdHJ1
Y3QgbmFuZF9jaGlwICpuYW5kLAo+Pj4+Pj4+Pj4+Pj4+Pj4+IMKgwqAgc3RhdGljIGludCBtZXNv
bl9uZmNfcmVhZF9wYWdlX3JhdyhzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAqYnVmLAo+Pj4+
Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
bnQgb29iX3JlcXVpcmVkLCBpbnQgcGFnZSkKPj4+Pj4+Pj4+Pj4+Pj4+PiDCoMKgIHsKPj4+Pj4+
Pj4+Pj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQobmFu
ZCk7Cj4+Pj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIHU4ICpvb2JfYnVmID0gbmFuZC0+b29i
X3BvaTsKPj4+Pj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqAgaW50IHJldDsKPj4+Pj4+Pj4+Pj4+
Pj4+PiDCoMKgID4+Pj4+Pj4+ICvCoMKgwqAgbWVtc2V0KG9vYl9idWYsIDAsIG10ZC0+b29ic2l6
ZSk7ICAgIAo+Pj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4+IEknbSBzdXJwcmlzZWQgcmF3
IHJlYWRzIGRvIG5vdCByZWFkIHRoZSBlbnRpcmUgT09CPyAgICAKPj4+Pj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+Pj4+Pj4gWWVzISBTZWVtcyBpbiBjYXNlIG9mIHJhdyBhY2Nlc3MgKHdoYXQgaSBzZWUg
aW4gdGhpcyBkcml2ZXIpIG51bWJlciBvZiBPT0IgYnl0ZXMgcmVhZAo+Pj4+Pj4+Pj4+Pj4+PiBz
dGlsbCBkZXBlbmRzIG9uIEVDQyBwYXJhbWV0ZXJzOiBmb3IgZWFjaCBwb3J0aW9uIG9mIGRhdGEg
Y292ZXJlZCB3aXRoIEVDQyBjb2RlIHdlIGNhbgo+Pj4+Pj4+Pj4+Pj4+PiByZWFkIGl0J3MgRUND
IGNvZGUgYW5kICJ1c2VyIGJ5dGVzIiBmcm9tIE9PQiAtIGl0IGlzIHdoYXQgaSBzZWUgYnkgZHVt
cGluZyBETUEgYnVmZmVyIGJ5Cj4+Pj4+Pj4+Pj4+Pj4+IHByaW50aygpLiBGb3IgZXhhbXBsZSBJ
J20gd29ya2luZyB3aXRoIDJLIE5BTkQgcGFnZXMsIGVhY2ggcGFnZSBoYXMgMiB4IDFLIEVDQyBi
bG9ja3MuCj4+Pj4+Pj4+Pj4+Pj4+IEZvciBlYWNoIEVDQyBibG9jayBJIGhhdmUgMTYgT09CIGJ5
dGVzIHdoaWNoIEkgY2FuIGFjY2VzcyBieSByZWFkL3dyaXRlLiBFYWNoIDE2IGJ5dGVzCj4+Pj4+
Pj4+Pj4+Pj4+IGNvbnRhaW5zIDIgYnl0ZXMgb2YgdXNlcidzIGRhdGEgYW5kIDE0IGJ5dGVzIEVD
QyBjb2Rlcy4gU28gd2hlbiBJIHJlYWQgcGFnZSBpbiByYXcgbW9kZQo+Pj4+Pj4+Pj4+Pj4+PiBj
b250cm9sbGVyIHJldHVybnMgMzIgYnl0ZXMgKDIgeCAoMiArIDE0KSkgb2YgT09CLiBXaGlsZSBP
T0IgaXMgcmVwb3J0ZWQgYXMgNjQgYnl0ZXMuICAgIAo+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+
Pj4gSW4gYWxsIG1vZGVzLCB3aGVuIHlvdSByZWFkIE9PQiwgeW91IHNob3VsZCBnZXQgdGhlIGZ1
bGwgT09CLiBUaGUgZmFjdAo+Pj4+Pj4+Pj4+Pj4+IHRoYXQgRUNDIGNvcnJlY3Rpb24gaXMgZW5h
YmxlZCBvciBkaXNhYmxlZCBkb2VzIG5vdCBtYXR0ZXIuIElmIHRoZSBOQU5ECj4+Pj4+Pj4+Pj4+
Pj4gZmVhdHVyZXMgT09CIHNlY3Rpb25zIG9mIDY0IGJ5dGVzLCB5b3Ugc2hvdWxkIGdldCB0aGUg
NjQgYnl0ZXMuCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBXaGF0IGhhcHBlbnMgc29tZXRp
bWVzLCBpcyB0aGF0IHNvbWUgb2YgdGhlIGJ5dGVzIGFyZSBub3QgcHJvdGVjdGVkCj4+Pj4+Pj4+
Pj4+Pj4gYWdhaW5zdCBiaXRmbGlwcywgYnV0IHRoZSBwb2xpY3kgaXMgdG8gcmV0dXJuIHRoZSBm
dWxsIGJ1ZmZlci4gICAgCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gT2ssIHNvIHRvIGNsYXJp
ZnkgY2FzZSBmb3IgdGhpcyBOQU5EIGNvbnRyb2xsZXI6Cj4+Pj4+Pj4+Pj4+PiAxKSBJbiBib3Ro
IEVDQyBhbmQgcmF3IG1vZGVzIGkgbmVlZCB0byByZXR1cm4gdGhlIHNhbWUgcmF3IE9PQiBkYXRh
IChlLmcuIHVzZXIgYnl0ZXMKPj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgICsgRUNDIGNvZGVzKT8gICAg
Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFdlbGwsIHlvdSBuZWVkIHRvIGNvdmVyIHRoZSBzYW1l
IGFtb3VudCBvZiBkYXRhLCB5ZXMuIEJ1dCBpbiB0aGUgRUNDCj4+Pj4+Pj4+Pj4+IGNhc2UgdGhl
IGRhdGEgd29uJ3QgYmUgcmF3IChhdCBsZWFzdCBub3QgYWxsIG9mIGl0KS4gICAgCj4+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+PiBTbyAic2FtZSBhbW91bnQgb2YgZGF0YSIsIGluIEVDQyBtb2RlIGN1cnJl
bnQgaW1wbGVtZW50YXRpb24gcmV0dXJucyBvbmx5IHVzZXIgT09CIGJ5dGVzIChlLmcuCj4+Pj4+
Pj4+Pj4gT09CIGRhdGEgZXhjbHVkaW5nIEVDQyBjb2RlcyksIGluIHJhdyBpdCByZXR1cm5zIHVz
ZXIgYnl0ZXMgKyBFQ0MgY29kZXMuIElJVUMgY29ycmVjdAo+Pj4+Pj4+Pj4+IGJlaGF2aW91ciBp
cyB0byBhbHdheXMgcmV0dXJuIHVzZXIgYnl0ZXMgKyBFQ0MgY29kZXMgYXMgT09CIGRhdGEgZXZl
biBpbiBFQ0MgbW9kZSA/ICAgIAo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IElmIHRoZSBwYWdlIGFyZSAy
ays2NEIgeW91IHNob3VsZCByZWFkIDJrKzY0QiB3aGVuIE9PQiBhcmUgcmVxdWVzdGVkLgo+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+IElmIHRoZSBjb250cm9sbGVyIG9ubHkgcmV0dXJucyAyayszMkIsIHRo
ZW4gcGVyZm9ybSBhIHJhbmRvbSByZWFkIHRvCj4+Pj4+Pj4+PiBqdXN0IG1vdmUgdGhlIHJlYWQg
cG9pbnRlciB0byBtdGQtPnNpemUgKyBtdGQtPm9vYnNpemUgLSAzMiBhbmQKPj4+Pj4+Pj4+IHJl
dHJpZXZlIHRoZSBtaXNzaW5nIDMyIGJ5dGVzPyAgICAKPj4+Pj4+Pj4KPj4+Pj4+Pj4gMSkgcmF3
IHJlYWQgY2FuIHJlYWQgb3V0IHRoZSB3aG9sZSBwYWdlIGRhdGEgMmsrNjRCLCBkZWNpZGVkIGJ5
IHRoZSBsZW4gaW4gdGhlIGNvbnRyb2xsZXIgcmF3IHJlYWQgY29tbWFuZDoKPj4+Pj4+Pj4gwqDC
oMKgwqBjbWQgPSAobGVuICYgR0VOTUFTSyg1LCAwKSkgfCBzY3JhbWJsZXIgfCBETUFfRElSKGRp
cik7Cj4+Pj4+Pj4+IGFmdGVyIHRoYXQsIHRoZSBtaXNzaW5nIG9vYiBieXRlcyhub3QgdXNlZCkg
Y2FuIGJlIGNvcGllZCBmcm9tIG1lc29uX2NoaXAtPmRhdGFfYnVmLiBzbyB0aGUgaW1wbGVtZW50
YXRpb24gb2YgbWVzb25fbmZjX3JlYWRfcGFnZV9yYXcoKSBpcyBsaWtlIHRoaXMgaWYgbmVlZC4K
Pj4+Pj4+Pj4gwqDCoMKgwqB7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIC4uLi4uLgo+Pj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoCBtZXNvbl9uZmNfcmVhZF9wYWdlX3N1YihuYW5kLCBwYWdlLCAxKTsK
Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgbWVzb25fbmZjX2dldF9kYXRhX29vYihuYW5kLCBidWYs
IG9vYl9idWYpOwo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBvb2JfbGVuID0gKG5hbmQtPmVjYy5i
eXRlcyArIDIpICogbmFuZC0+ZWNjLnN0ZXBzOwo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBtZW1j
cHkob29iX2J1ZiArIG9vYl9sZW4sIG1lc29uX2NoaXAtPmRhdGFfYnVmICsgb29iX2xlbiwgbXRk
LT5vb2JzaXplIC0gb29iX2xlbik7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IMKgwqDCoMKgfQo+Pj4+Pj4+
PiAyKSBJbiBFQ0MgbW9kZSwgdGhlIGNvbnRyb2xsZXIgY2FuJ3QgYnJpbmcgYmFjayB0aGUgbWlz
c2luZyBPT0IgYnl0ZXMuIGl0IGNhbiByZWFkIG91dCB0aGUgdXNlciBieXRlcyBhbmQgZWNjIGJ5
dGVzIHBlciBtZXNvbl9vb2JsYXlvdXRfb3BzIGRlZmluZS4gICAgCj4+Pj4+Pj4KPj4+Pj4+PiBB
bmQgdGhlbiAoaWYgb29iX3JlcXVpcmVkKSB5b3UgY2FuIGJyaW5nIHRoZSBtaXNzaW5nIGJ5dGVz
IHdpdGgKPj4+Pj4+PiBzb21ldGhpbmcgYWxvbmc6Cj4+Pj4+Pj4gbmFuZF9jaGFuZ2VfcmVhZF9j
b2x1bW5fb3AoY2hpcCwgbXRkLT53cml0ZXNpemUgKyBvb2JfbGVuLAo+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgb29iX2J1ZiArIG9vYl9sZW4sCj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBtdGQtPm9vYnNpemUgLSBvb2JfbGVuLAo+Pj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmFsc2UpOwo+Pj4+Pj4+IFNob3VsZCBub3QgYmUgYSBo
dWdlIHBlcmZvcm1hbmNlIGhpdC4gICAgCj4+Pj4+Pgo+Pj4+Pj4gQWZ0ZXIgZmluaXNoaW5nIEVD
QyBtb2RlIHJlYWRpbmcsIHRoZSBjb2x1bW4gYWRkcmVzcyBpbnRlcm5hbCBpbiBOQU5EIGRldmlj
ZSBzaG91bGQgYmUgdGhlIHJpZ2h0IHBvczsgaXQgZG9lc24ndCBuZWVkIHRvIGNoYW5nZSB0aGUg
Y29sdW1uIGFnYWluLiBzbyBhZGRpbmcgY29udHJvbGxlciByYXcgcmVhZCBmb3IgdGhlIG1pc3Np
bmcgYnl0ZXMgYWZ0ZXIgRUNDIHJlYWRpbmcgbWF5IHdvcmtzLgo+Pj4+Pj4gICAgCj4+Pj4+IHVz
ZSByYXcgcmVhZCBmb3IgdGhlIG1pc3NpbmcgYnl0ZXMsIGJ1dCB0aGV5IGFyZSBub3QgcHJvdGVj
dGVkIGJ5IGhvc3QgRUNDLiB0byB0aGUgTkFORCB0eXBlIG9mIHN0b3JhZ2UsIGlzIGl0IG9rIG9y
IG1pc3NpbmcgYnl0ZXMgYmV0dGVyIHRvIGJlIGZpbGxlZCB3aXRoIDB4ZmY/ICAgIAo+Pj4+Cj4+
Pj4gSUlVQyBNaXF1w6hsJ3MgcmVwbHksIHZhbGlkIGJlaGF2aW91ciBpcyB0byByZXR1cm4gZnVs
bCBPT0IgZGF0YSBpbiBib3RoIG1vZGVzLiBTbyBpbjoKPj4+PiBFQ0MgbW9kZSBpdCBpcyB1c2Vy
IGJ5dGVzKGNvcnJlY3RlZCBieSBFQ0MsIHJlYWQgZnJvbSBpbmZvIGJ1ZmZlcikgKyBFQ0MgKyBt
aXNzaW5nIGJ5dGVzLiBFQ0MgYW5kIG1pc3NpbmcgYnl0ZXMgcmVhZCBpbiBSQVcgbW9kZS4gIAo+
Pj4KPj4+IEkgYmVsaWV2ZSB0aGUgRUNDIGJ5dGVzIHlvdSdsbCBnZXQgd2lsbCBiZSBjb3JyZWN0
ZWQuCj4+PiBZb3UgY2FuIGNoZWNrIHRoaXMgYnkgdXNpbmcgbmFuZGZsaXBiaXRzIGluIG10ZC11
dGlscy4gIAo+Pgo+PiBTb3JyeSwgZGlkbid0IGdldCBpdCwgaSdtIG5ldyBpbiBOQU5EIGFyZWEu
IEJ5dGVzIG9mIEVDQyBjb2RlcyBhcmUgYXZhaWxhYmxlIG9ubHkgaW4gcmF3IG1vZGUgKGF0IGxl
YXN0IGluIHRoaXMgTkFORAo+PiBkcml2ZXIpIGFsc28gYXMgbWlzc2luZyBieXRlcyBvZiBPT0Iu
Cj4gCj4gR2FzcC4gWWVhaCB0aGF0J3MgYSBjb250cm9sbGVyIGxpbWl0YXRpb24sIG9rYXkuCj4g
Cj4+IFNvIElJVUMgRUNDIGNvZGVzIGFyZSBtZXRhZGF0YSB0byBjb3JyZWN0IGRhdGEgYnl0ZXMs
IGFuZCB0aHVzCj4+IGNvdWxkbid0IGJlIGNvcnJlY3RlZC4KPiAKPiBXZSBjb25zaWRlciB0aGVt
IG1ldGFkYXRhLCBidXQgdGhleSBhcmUgZnVsbHkgcGFydCBvZiB0aGUgRUNDIHNjaGVtZQo+IGFu
ZCB0aHVzIHRoZWlyIGNvcnJlY3Rpb24gaXMgcGFydCBvZiB0aGUgcHJvY2VzcywgYml0ZmxpcHMg
aW4gdGhlIEVDQwo+IGJ5dGVzIHdpbGwgY291bnQgYXMgZGF0YSBiaXRmbGlwcyBhY3R1YWxseS4K
PiAKPiBJIHRhbGtlZCBhIGJpdCBhYm91dCBFQ0MgZW5naW5lcyBhdCBhIHByZXZpb3VzIGNvbmZl
cmVuY2UgaWYgaXQgY2FuCj4gaGVscDoKPiBodHRwczovL2VsaW51eC5vcmcvRUxDX0V1cm9wZV8y
MDIwX1ByZXNlbnRhdGlvbnMKPiAnVW5kZXJzdGFuZCBFQ0MgU3VwcG9ydCBmb3IgTkFORCBGbGFz
aCBEZXZpY2VzIGluIExpbnV4Jwo+IEFuZCBhbHNvIHdyb3RlIGEgYmxvZyBwb3N0IHdpdGggYSBj
aGFwdGVyIGFib3V0IEVDQyBlbmdpbmVzOgo+IGh0dHBzOi8vYm9vdGxpbi5jb20vYmxvZy9zdXBw
b3J0aW5nLWEtbWlzYmVoYXZpbmctbmFuZC1lY2MtZW5naW5lLwoKClRoYW5rcyBmb3IgdGhpcyEK
ClRoYW5rcywgQXJzZW5peQoKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
