Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A52C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 09:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vhr7O79nJ46r7/EjnpeFjE7knsd8zDzDioOdGXnC8Y=; b=0PeSiCfQ3zKF2G
	aQTZdyxTgI6cPFdgSWmZbhtfY0qCGGhIvynDQVkM4RYxaledAPPOin42G9TOcNlv6vFcm8wKwl7nl
	tOJ+NPb0iVXx+LaBTBtRRQVtYxuEKLoz/+OptSYk5UmyHH4lQzA8QvpjXxMnl69Qzmv+XhE3A7tlD
	9XUuOvH9ZzPI+1h19gDS2DOBMcp4wMOmpNxDU+yt+crpU7seFpDO3FENUoHUtWqDe4Bm8pWdHMlqi
	NTLjFH2EqEjpoocLKVImh4CRtEYe6IKcjr6ted1UF06UZlwT+/smfiakBuNYLjn6KWVp/Xo4nvU38
	LICZmoZU3xhGsv4SyYWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngjzs-002WQB-3w; Tue, 19 Apr 2022 09:18:08 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngjzf-002WLF-5N; Tue, 19 Apr 2022 09:17:56 +0000
Received: from [10.28.39.106] (10.28.39.106) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 19 Apr
 2022 17:17:48 +0800
Message-ID: <2e382e3e-c231-c9e4-73a1-0637288fcd4f@amlogic.com>
Date: Tue, 19 Apr 2022 17:17:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 1/2] mtd: rawnand: meson: discard the common MMC sub
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
References: <20220402074921.13316-1-liang.yang@amlogic.com>
 <20220402074921.13316-2-liang.yang@amlogic.com>
 <20220404103034.48ec16b1@xps13>
 <50105d6b-8ced-1b72-30cb-a709c4a4dd26@amlogic.com>
 <d5a33645-fac1-9c69-afe6-654bfe93ca48@amlogic.com>
 <20220419102629.1c77aa2a@xps13>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20220419102629.1c77aa2a@xps13>
X-Originating-IP: [10.28.39.106]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_021755_256746_69C636F3 
X-CRM114-Status: GOOD (  18.80  )
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

SGVsbG8gTWlxdWVsLAoKT24gMjAyMi80LzE5IDE2OjI2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IEhlbGxvLAo+IAo+IGxpYW5nLnlhbmdAYW1sb2dpYy5j
b20gd3JvdGUgb24gTW9uLCAxOCBBcHIgMjAyMiAxMTo0MDoxMCArMDgwMDoKPiAKPj4gSGkgTWlx
dWVsLAo+Pgo+PiBpIGhhdmUgc29tZSBjb25mdXNpb24gd2hlbiBpIHByZXBhcmUgdGhlIHBhdGNo
ZXMuIGZvciBEVCBjb21wYXRpYmlsaXR5LCBpdCBmYWxscyBiYWNrIHRvIHRoZSBvbGQgRFQgd2hl
biBmYWlsZWQgdG8gZ2V0IHJlc291cmNlIGJ5IHRoZSBuZXcgRFQsIGJ1dCB0aGVyZSBpcyBzb21l
IHBvaW50czoKPj4gYS4gb2xkIERUIGRlcGVuZHMgb24gTU1DIHN1YiBjbG9jayBkcml2ZXIsIGJ1
dCBpdCBuZXZlciBiZSBtZXJnZWQsIHNvIGl0IGNhbid0IHdvcmsuCj4gCj4gSSBkb24ndCBnZXQg
d2hhdCB5b3UgbWVhbiBoZXJlLCBzb3JyeS4gSSBiZWxpZXZlIHRoZXJlIGlzIGEgbmV3IHdheSB0
bwo+IGRlc2NyaWJlIHRoaXMgY2xvY2sgYnV0IGdyYWJiaW5nIHRoZSBvbmUgZnJvbSB0aGUgTU1D
IHN0aWxsIHdvcmtzLCBkb2VzCj4gbm90IGl0Pwo+IAoKTm8sIGl0IGRvZXNuJ3QuIGFmdGVyIHRo
ZSBORkMgZHJpdmVyIHVzaW5nIHRoZSBNTUMgc3ViIGNsb2NrIGZyYW1ld29yayAKd2FzIG1lcmdl
ZCBpbnRvIHRoZSBtYWlubGluZSBvZiBrZXJuZWwsIHdlIGRpZG4ndCBjb250aW51ZSB0byBzdWJt
aXQgdGhlIApzZXJpZXMgb2YgcGF0Y2hlcyBhYm91dCBNTUMgc3ViIGNsb2NrIGFmdGVyIHY5LiB3
aGVuIGkgZm91bmQgdGhhdCwgd2UgCm1hZGUgYSBkaXNjdXNzaW9uIHRvIGRlY2lkZSB3aGV0aGVy
IHRvIHJlY292ZXIgdGhlIHNlcmllcyBvZiBwYXRjaGVzIAphYm91dCBNTUMgc3ViIGNsb2NrIGZy
YW1ld29yaywgZmluYWxseSwgc2VlIHRoZSBkZXNjcmlwdGlvbiBmcm9tIGNvdmVyIApsZXR0ZXIs
IHdlIHBsYW4gdG8gYWJhbmRvbiBpdCBhbmQgYWRvcHQgdGhlIG5ldyBjbG9jayBzY2hlbWUgaW4g
dGhpcyAKc2VyaWVzIG9mIHBhdGNoZXMuCgpUaGFua3MuCgo+PiBiLiBpZiBpdCBmYWxscyBiYWNr
IHRvIHRoZSBvbGQgRFQsIGJlc2lkZSB0aGUgcmVnbWFwIGxvb2t1cCBiZWxvdywgaXQgc2VlbXMg
dGhhdCB3ZSBoYXZlIHRvIHByZXNlcnZlIHRoZSBjb2RlIG9mIHRoZSBvbGQgY2xvY2sgc2V0dGlu
ZyBpbiBuZmNfY2xrX2luaXQoKS4KPiAKPiBZZXMsIHByb2JhYmx5Lgo+IAo+PiBkbyB3ZSBzdGls
bCBuZWVkIHRvIGF2b2lkIGJyZWFrIERUIGNvbXBhdGliaWxpdHk/Cj4gCj4gV2Ugc2hvdWxkIHRy
eSBvdXIgYmVzdCB0byBhdm9pZCBicmVha2luZyB0aGUgRFQsIHllcy4KPiAKPj4KPj4gVGhhbmtz
Lgo+Pgo+PiBPbiAyMDIyLzQvMTEgMTA6NDAsIExpYW5nIFlhbmcgd3JvdGU6Cj4+Pj4+ICDCoMKg
wqDCoMKgIG5mYy0+ZGV2ID0gZGV2Owo+Pj4+PiAtwqDCoMKgIHJlcyA9IHBsYXRmb3JtX2dldF9y
ZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4+Pj4+IC3CoMKgwqAgbmZjLT5yZWdf
YmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIHJlcyk7Cj4+Pj4+ICvCoMKgwqAgbmZj
LT5yZWdfYmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZV9ieW5hbWUocGRldiwg
Im5mYyIpOwo+Pj4+Cj4+Pj4gVGhpcyBjaGFuZ2Ugc2VlbXMgdW5yZWxhdGVkLgo+Pj4KPj4+IFRv
IGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgZm9sbG93aW5nID4gZGV2bV9wbGF0Zm9ybV9pb3JlbWFw
X3Jlc291cmNlX2J5bmFtZShwZGV2LCAiZW1tYyIpLiBkbyB5b3UgbWVhbiB0aGF0IHdlID4gZG9u
J3QgbmVlZCBpdD8+Cj4+Pj4+ICDCoMKgwqDCoMKgIGlmIChJU19FUlIobmZjLT5yZWdfYmFzZSkp
Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIobmZjLT5yZWdfYmFzZSk7
Cj4+Pj4+IC3CoMKgwqAgbmZjLT5yZWdfY2xrID0KPj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHN5c2Nv
bl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUoZGV2LT5vZl9ub2RlLAo+Pj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiYW1sb2dpYyxtbWMtc3lzY29u
Iik7Cj4+Pj4+IC3CoMKgwqAgaWYgKElTX0VSUihuZmMtPnJlZ19jbGspKSB7Cj4+Pj4+IC3CoMKg
wqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBsb29rdXAgY2xvY2sgYmFzZVxuIik7
Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihuZmMtPnJlZ19jbGspOwo+Pj4+
PiAtwqDCoMKgIH0KPj4+Pj4gK8KgwqDCoCBuZmMtPnNkX2VtbWNfY2xvY2sgPSBkZXZtX3BsYXRm
b3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsID4+PiAiZW1tYyIpOwo+Pj4+PiArwqDC
oMKgIGlmIChJU19FUlIobmZjLT5zZF9lbW1jX2Nsb2NrKSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHJldHVybiBQVFJfRVJSKG5mYy0+c2RfZW1tY19jbG9jayk7Cj4+Pj4KPj4+PiBXaGlsZSBJIGFn
cmVlIHRoaXMgaXMgbXVjaCBiZXR0ZXIgdGhhbiB0aGUgcHJldmlvdXMgc29sdXRpb24sIHdlIGNh
bm5vdAo+Pj4+IGJyZWFrIERUIGNvbXBhdGliaWxpdHksIHNvIHlvdSBuZWVkIHRvIHRyeSBnZXR0
aW5nIHRoZSBlbW1jIGNsb2NrLCBidXQKPj4+PiBpZiBpdCBmYWlscyB5b3Ugc2hvdWxkIGZhbGxi
YWNrIHRvIHRoZSByZWdtYXAgbG9va3VwLgo+Pj4KPj4+IG9rLCBpIHdpbGwgZml4IGl0IG5leHQg
dmVyc2lvbi4gdGhhbmtzLgo+Pj4gICAgCj4+Pj4gICAKPj4+Pj4gIMKgwqDCoMKgwqAgaXJxID0g
cGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAo+
IC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
