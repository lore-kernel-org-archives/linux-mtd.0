Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E981C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObXLIO+WYvmp+b1YYsl1SLSbMKFZOtyezqy73JRfyus=; b=bLf/qE2gFyt9uL
	kTpkWjr5Nm6phOLUlsTf+LjSOb55ETHIP+sOEcP7fWhXTyi4zHGbnU7427R7iageME+1h1EnC/OE4
	E5VyNYrIEtAEhXFNEziQPIHS7eCeYB4ZHJhUCmfgNnhNq5w+wT5JSOoEqWFzeOZT4PrmOeIB/ixGN
	1O6mDnuL3S8sT0BV+jZk+cJTEjFoxe9WbQp1X/MKxXdpWGu0juNF/L5PkqYxru8/WWA6vBUe3IMKR
	0rTXfPHk3e9TUHVU9zkR89VYnI4Oh4HIrZIJNBUE2VF58M5EZW6/T/5iRT5A9G3ZIvW6rExXPjr+G
	deGSuG3UnTbNwmX3SMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDQBL-001sVc-P2; Fri, 28 Jan 2022 12:16:47 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDQB3-001sOH-46; Fri, 28 Jan 2022 12:16:30 +0000
Received: from [10.28.39.106] (10.28.39.106) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 28 Jan
 2022 20:16:26 +0800
Message-ID: <e87b40f0-140e-0521-b861-7481cfc1507d@amlogic.com>
Date: Fri, 28 Jan 2022 20:16:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 1/2] mtd: rawnand: meson: discard the common MMC sub
 clock framework
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman
 <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan
 <victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin
 Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>,
 YongHui Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20220128113237.39996-1-liang.yang@amlogic.com>
 <20220128113237.39996-2-liang.yang@amlogic.com>
 <20220128124036.25fe0539@xps13>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20220128124036.25fe0539@xps13>
X-Originating-IP: [10.28.39.106]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_041629_187673_CC83FF2E 
X-CRM114-Status: GOOD (  18.83  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3IGFuZCBxdWljayByZXNwb25zZS4KCk9u
IDIwMjIvMS8yOCAxOTo0MCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlM
IF0KPiAKPiBIaSBMaWFuZywKPiAKPiBsaWFuZy55YW5nQGFtbG9naWMuY29tIHdyb3RlIG9uIEZy
aSwgMjggSmFuIDIwMjIgMTk6MzI6MzYgKzA4MDA6Cj4gCj4+IEVNTUMgYW5kIE5BTkQgaGFzIHRo
ZSBzYW1lIGNsb2NrIGNvbnRyb2wgcmVnaXN0ZXIgbmFtZWQgJ1NEX0VNTUNfQ0xPQ0snIHdoaWNo
IGlzCj4gCj4gaGF2ZQpvawo+IAo+PiBkZWZpbmVkIGluIEVNTUMgcG9ydCBpbnRlcm5hbGx5LiBi
aXQwfjUgb2YgJ1NEX0VNTUNfQ0xPQ0snIGlzIHRoZSBkaXZpZGVyIGFuZAo+PiBiaXQ2fjcgaXMg
dGhlIG11eCBmb3IgZml4IHBsbCBhbmQgeHRhbC4KPiAKPj4gUHJldmlvdXNseSBhIGNvbW1vbiBN
TUMgc3ViIGNsb2NrIGZyYW1ld29yayBpcyBpbXBsZW1lbnRlZCBhbmQgc2hhcmVkIGJ5IEVNTUMg
YW5kCj4gCj4gSSBiZWxpZXZlIHlvdSBtZWFudCB0aGF0IHRoaXMgaGFzYSBhbHJlYWR5IGJlZW4g
Y29udHJpYnV0ZWQ/IEkgd291bGQKPiB0aGVuIHJlcGhyYXNlIHdpdGg6Cj4gCj4gQSBjb21tb24g
TU1DIGFuZCBOQU5EIHN1Yi1jbG9jayBoYXMgYmVlbiBpbXBsZW1lbnRlZCBhbmQgY2FuIGJlIHVz
ZWQgYnkKPiB0aGUgZU1NQyBhbmQgTkFORCBjb250cm9sbGVyICh3aGljaCBhcmUgbXV0dWFsbHkg
ZXhjbHVzaXZlIGFueXdheSkuCj4gCj4gTGV0J3MgdXNlIHRoaXMgbmV3IGNsb2NrLgpvay4gdGhh
bmtzCj4gCj4+IE5BTkQsIGJ1dCB0aGF0IGlzIGNvdXBsaW5nIHRoZSBFTU1DIGFuZCBOQU5ELCBh
bHRob3VnaCBFTU1DIGFuZCBOQU5EIGlzIG11dHVhbGx5Cj4+IGV4Y2x1c2l2ZS4KPj4KPj4gQ2hh
bmdlLUlkOiBJYmViNGM3ZmY4ODZmNTg4NmFhYzRkNmM2NjRkN2JiZDFiMWJjYjk5Nwo+IAo+IE5v
IGNoYW5nZSBJZHMuCm9rLiBpIHdpbGwgZGVsZXRlIG5leHQgdmVyc2lvbi4KPiAKPj4gU2lnbmVk
LW9mZi1ieTogTGlhbmcgWWFuZyA8bGlhbmcueWFuZ0BhbWxvZ2ljLmNvbT4KPj4gLS0tCj4+ICAg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIHwgMTYxICsrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCspLCA3MiBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29u
X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+PiBpbmRleCBhYzNi
ZTkyODcyZDAuLmY2YTNkNWMyZWExYyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbWVzb25fbmFuZC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQu
Ywo+PiBAQCAtMiw3ICsyLDcgQEAKPj4gICAvKgo+PiAgICAqIEFtbG9naWMgTWVzb24gTmFuZCBG
bGFzaCBDb250cm9sbGVyIERyaXZlcgo+PiAgICAqCj4+IC0gKiBDb3B5cmlnaHQgKGMpIDIwMTgg
QW1sb2dpYywgaW5jLgo+PiArICogQ29weXJpZ2h0IChjKSAyMDE4LTIwMjEgQW1sb2dpYywgaW5j
Lgo+IAo+IFBsZWFzZSBkb24ndC4KPiAKPj4gICAgKiBBdXRob3I6IExpYW5nIFlhbmcgPGxpYW5n
LnlhbmdAYW1sb2dpYy5jb20+Cj4+ICAgICovCj4+ICAgCj4+IEBAIC0xMCw2ICsxMCw3IEBACj4+
ICAgI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L2lu
dGVycnVwdC5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9jbGsuaD4KPj4gKyNpbmNsdWRlIDxsaW51
eC9jbGstcHJvdmlkZXIuaD4KPj4gICAjaW5jbHVkZSA8bGludXgvbXRkL3Jhd25hbmQuaD4KPj4g
ICAjaW5jbHVkZSA8bGludXgvbXRkL210ZC5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9tZmQvc3lz
Y29uLmg+Cj4+IEBAIC0xOSw2ICsyMCw3IEBACj4+ICAgI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5o
Pgo+PiAgICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9vZl9kZXZp
Y2UuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+Cj4+ICAgI2luY2x1ZGUgPGxp
bnV4L3NjaGVkL3Rhc2tfc3RhY2suaD4KPj4gICAKPj4gICAjZGVmaW5lIE5GQ19SRUdfQ01ECQkw
eDAwCj4+IEBAIC0xMDQsNiArMTA2LDkgQEAKPj4gICAKPj4gICAjZGVmaW5lIFBFUl9JTkZPX0JZ
VEUJCTgKPj4gICAKPj4gKyNkZWZpbmUgQ0xLX0RJVl9TSElGVAkJMAo+PiArI2RlZmluZSBDTEtf
RElWX1dJRFRICQk2Cj4+ICsKPj4gICBzdHJ1Y3QgbWVzb25fbmZjX25hbmRfY2hpcCB7Cj4+ICAg
CXN0cnVjdCBsaXN0X2hlYWQgbm9kZTsKPj4gICAJc3RydWN0IG5hbmRfY2hpcCBuYW5kOwo+PiBA
QCAtMTUxLDE1ICsxNTYsMTcgQEAgc3RydWN0IG1lc29uX25mYyB7Cj4+ICAgCXN0cnVjdCBuYW5k
X2NvbnRyb2xsZXIgY29udHJvbGxlcjsKPj4gICAJc3RydWN0IGNsayAqY29yZV9jbGs7Cj4+ICAg
CXN0cnVjdCBjbGsgKmRldmljZV9jbGs7Cj4+IC0Jc3RydWN0IGNsayAqcGhhc2VfdHg7Cj4+IC0J
c3RydWN0IGNsayAqcGhhc2Vfcng7Cj4+ICsJc3RydWN0IGNsayAqbmFuZF9jbGs7Cj4+ICsJc3Ry
dWN0IGNsa19kaXZpZGVyIG5hbmRfZGl2aWRlcjsKPj4gICAKPj4gICAJdW5zaWduZWQgbG9uZyBj
bGtfcmF0ZTsKPj4gICAJdTMyIGJ1c190aW1pbmc7Cj4+ICAgCj4+ICAgCXN0cnVjdCBkZXZpY2Ug
KmRldjsKPj4gLQl2b2lkIF9faW9tZW0gKnJlZ19iYXNlOwo+PiAtCXN0cnVjdCByZWdtYXAgKnJl
Z19jbGs7Cj4+ICsJc3RydWN0IHsKPj4gKwkJdm9pZCBfX2lvbWVtICpyZWdfYmFzZTsKPj4gKwkJ
dm9pZCBfX2lvbWVtICpzZF9lbW1jX2Nsb2NrOwo+PiArCX0gcmVzOwo+IAo+IFBsZWFzZSBzcGxp
dCB5b3VyIGNvbW1pdDogZmlyc3QgdGhlIG1lY2hhbmljYWwgY2hhbmdlcywgdGhlbiB0aGUgdXNl
IG9mCj4gdGhlIG5ldyBhcmVhIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gCj4gT3RoZXJ3aXNl
IHRoZXJlIGFyZSB0b28gbWFueSBsaW5lcyBjaGFuZ2VkLCBJIGNhbid0IHNwb3Qgd2hlcmUgaXQg
aXMKPiBpbnRlcmVzdGluZy4KCm9rLiBpIHdpbGwgc3BsaXQgaXQgbmV4dCB2ZXJzaW9uLiB0aGFu
a3MuCgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCj4gLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
