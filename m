Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A60C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 05:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AYh9p0dRiMT5YyxoebCmMLKn6/Zx9UUC97427KUJaVA=; b=niC5CT0zbqR9Qd
	26nBQBm7oD7Yx13EZColE/Ywcw5FPVkaj5luV4xblAMkxf4zDerkXkZPNLzXbpYmkpd5QDOoCmpEX
	psOlq+FlPC+BZauYfetOAs/jgKtW3plCWbzpOudktW4hDXkVOsykCHTAdP5KouaMfICWEUZSvx/0e
	sczd2C9Ij7SBR06uzD8pxFgdXzPWlF/Z5xRVK21Iz5DHVsn55h7f/ZLzMe0QPExVrG+b+TwUTlhCD
	uO/q+3ARN8n+z+j5sTBwApUpgLHlZ+POn4FO2GJNKU7A9wP1ON9A6SOtmJ0Zv2huSGLlEs76OFQOp
	SxHX3LkyJ3zCEq0g/AsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh392-007SC6-0h; Wed, 20 Apr 2022 05:44:52 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh38p-007S9x-V6; Wed, 20 Apr 2022 05:44:41 +0000
Received: from [10.28.39.106] (10.28.39.106) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 20 Apr
 2022 13:44:33 +0800
Message-ID: <126691f4-bc6b-10cd-ee2c-ff4006bc6518@amlogic.com>
Date: Wed, 20 Apr 2022 13:44:32 +0800
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
 <2e382e3e-c231-c9e4-73a1-0637288fcd4f@amlogic.com>
 <20220419172528.2dd75e7b@xps13>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20220419172528.2dd75e7b@xps13>
X-Originating-IP: [10.28.39.106]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_224440_061317_5B684FF7 
X-CRM114-Status: GOOD (  23.19  )
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

SGkgTWlxdWVsLAoKT24gMjAyMi80LzE5IDIzOjI1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IFsg
RVhURVJOQUwgRU1BSUwgXQo+IAo+IEhlbGxvLAo+IAo+IGxpYW5nLnlhbmdAYW1sb2dpYy5jb20g
d3JvdGUgb24gVHVlLCAxOSBBcHIgMjAyMiAxNzoxNzo0OCArMDgwMDoKPiAKPj4gSGVsbG8gTWlx
dWVsLAo+Pgo+PiBPbiAyMDIyLzQvMTkgMTY6MjYsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBb
IEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBIZWxsbywKPj4+Cj4+PiBsaWFuZy55YW5nQGFtbG9n
aWMuY29tIHdyb3RlIG9uIE1vbiwgMTggQXByIDIwMjIgMTE6NDA6MTAgKzA4MDA6Cj4+PiAgICAK
Pj4+PiBIaSBNaXF1ZWwsCj4+Pj4KPj4+PiBpIGhhdmUgc29tZSBjb25mdXNpb24gd2hlbiBpIHBy
ZXBhcmUgdGhlIHBhdGNoZXMuIGZvciBEVCBjb21wYXRpYmlsaXR5LCBpdCBmYWxscyBiYWNrIHRv
IHRoZSBvbGQgRFQgd2hlbiBmYWlsZWQgdG8gZ2V0IHJlc291cmNlIGJ5IHRoZSBuZXcgRFQsIGJ1
dCB0aGVyZSBpcyBzb21lIHBvaW50czoKPj4+PiBhLiBvbGQgRFQgZGVwZW5kcyBvbiBNTUMgc3Vi
IGNsb2NrIGRyaXZlciwgYnV0IGl0IG5ldmVyIGJlIG1lcmdlZCwgc28gaXQgY2FuJ3Qgd29yay4K
Pj4+Cj4+PiBJIGRvbid0IGdldCB3aGF0IHlvdSBtZWFuIGhlcmUsIHNvcnJ5LiBJIGJlbGlldmUg
dGhlcmUgaXMgYSBuZXcgd2F5IHRvCj4+PiBkZXNjcmliZSB0aGlzIGNsb2NrIGJ1dCBncmFiYmlu
ZyB0aGUgb25lIGZyb20gdGhlIE1NQyBzdGlsbCB3b3JrcywgZG9lcwo+Pj4gbm90IGl0Pwo+Pj4g
ICAgCj4+Cj4+IE5vLCBpdCBkb2Vzbid0LiBhZnRlciB0aGUgTkZDIGRyaXZlciB1c2luZyB0aGUg
TU1DIHN1YiBjbG9jayBmcmFtZXdvcmsgd2FzIG1lcmdlZCBpbnRvIHRoZSBtYWlubGluZSBvZiBr
ZXJuZWwsIHdlIGRpZG4ndCBjb250aW51ZSB0byBzdWJtaXQgdGhlIHNlcmllcyBvZiBwYXRjaGVz
IGFib3V0IE1NQyBzdWIgY2xvY2sgYWZ0ZXIgdjkuIHdoZW4gaSBmb3VuZCB0aGF0LCB3ZSBtYWRl
IGEgZGlzY3Vzc2lvbiB0byBkZWNpZGUgd2hldGhlciB0byByZWNvdmVyIHRoZSBzZXJpZXMgb2Yg
cGF0Y2hlcyBhYm91dCBNTUMgc3ViIGNsb2NrIGZyYW1ld29yaywgZmluYWxseSwgc2VlIHRoZSBk
ZXNjcmlwdGlvbiBmcm9tIGNvdmVyIGxldHRlciwgd2UgcGxhbiB0byBhYmFuZG9uIGl0IGFuZCBh
ZG9wdCB0aGUgbmV3IGNsb2NrIHNjaGVtZSBpbiB0aGlzIHNlcmllcyBvZiBwYXRjaGVzLgo+IAo+
IEkgYW0gbm90IHN1cmUgdG8gZm9sbG93LiBJcyB0aGUgY3VycmVudCBjb2RlIGNvbXBsZXRlbHkg
YnJva2VuPyBJCj4gYmVsaWV2ZSBpdCBpcyBub3QsIHNvIEkgZG9uJ3QgdW5kZXJzdGFuZCB5b3Vy
IGlzc3VlLgoKaSB0aGluayBvbmx5IHRoZSBjb2RlIGFib3V0IHRoZSBjbG9jayBpcyBjb21wbGV0
ZWx5IGJyb2tlbi4KCj4gCj4gQ2FuIHlvdSBwbGVhc2Ugc3VtbWFyaXplIHRoZSBzaXR1YXRpb24/
CgpZZXMuIHRoZSBjdXJyZW50IE5GQyBjbG9jayBpbXBsZW1lbnRhdGlvbiBkZXBlbmRzIG9uIHRo
ZSBmb2xsb3dpbmcgCnNlcmllcyBvZiBwYXRjaGVzIApbaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjIwMTIxMDc0NTA4LjQyMTY4LTUtbGlhbmcueWFuZ0BhbWxvZ2ljLmNvbV0sIAp3aGlj
aCB3ZSBjYWxsICJNZXNvbiBNTUMgU3ViIENsb2NrIENvbnRyb2xsZXIgRHJpdmVyIi4Kd2hlbiBp
IHdhcyBwcmVwYXJpbmcgdGhlIE5GQyBwYXRjaHNldCBhdCB0aGF0IHRpbWUsIHdlIGRpc2N1c3Nl
ZCBob3cgdGhlIApjbG9jayBzaG91bGQgYmUgaW1wbGVtZW50ZWQgYmFzZSBvbiB0aGUgc3BlY2lh
bCBjbG9jayBmcmFtZXdvcmsgZm9yIE5GQyAKYW5kIEVNTUMgcG9ydC4gdGhlbiB3ZSBkZWNpZGVk
IHRvIGltcGxlbWVudCBhIGRyaXZlciAiTWVzb24gTU1DIFN1YiAKQ2xvY2sgQ29udHJvbGxlciBE
cml2ZXIiLiBzbyBhbm90aGVyIHBlb3BsZSBiZWdpbiB0byBwcmVwYXJlICJNZXNvbiBNTUMgClN1
YiBDbG9jayBDb250cm9sbGVyIERyaXZlciIsIGJ1dCBzdWJtaXR0ZWQgaXQgYnkgZGlmZmVyZW50
IHBhdGNoc2V0LgpmaW5hbGx5LCBub3cgdGhlIG1lc29uIE5GQyBwYXRjaHNldCBpcyBhY2NlcHRl
ZCBhbmQgbWVyZ2VkLCBidXQgIk1lc29uIApNTUMgU3ViIENsb2NrIENvbnRyb2xsZXIgRHJpdmVy
IiBwYXRjaHNldCBpcyBub3QuIGFsc28gd2UgZGVjaWRlIHRvIAphYmFuZG9uIHRoZSBwYXRzZXQg
Ik1lc29uIE1NQyBTdWIgQ2xvY2sgQ29udHJvbGxlciBEcml2ZXIiIGFuZCBpbXBsZW1lbnQgCnRo
ZSBuZXcgY2xvY2sgZGVzaWduIGluIHRoaXMgc2VyaWVzLgoKPiAKPj4KPj4gVGhhbmtzLgo+Pgo+
Pj4+IGIuIGlmIGl0IGZhbGxzIGJhY2sgdG8gdGhlIG9sZCBEVCwgYmVzaWRlIHRoZSByZWdtYXAg
bG9va3VwIGJlbG93LCBpdCBzZWVtcyB0aGF0IHdlIGhhdmUgdG8gcHJlc2VydmUgdGhlIGNvZGUg
b2YgdGhlIG9sZCBjbG9jayBzZXR0aW5nIGluIG5mY19jbGtfaW5pdCgpLgo+Pj4KPj4+IFllcywg
cHJvYmFibHkuCj4+PiAgICAKPj4+PiBkbyB3ZSBzdGlsbCBuZWVkIHRvIGF2b2lkIGJyZWFrIERU
IGNvbXBhdGliaWxpdHk/Cj4+Pgo+Pj4gV2Ugc2hvdWxkIHRyeSBvdXIgYmVzdCB0byBhdm9pZCBi
cmVha2luZyB0aGUgRFQsIHllcy4KPj4+ICAgIAo+Pj4+Cj4+Pj4gVGhhbmtzLgo+Pj4+Cj4+Pj4g
T24gMjAyMi80LzExIDEwOjQwLCBMaWFuZyBZYW5nIHdyb3RlOgo+Pj4+Pj4+ICAgwqDCoMKgwqDC
oCBuZmMtPmRldiA9IGRldjsKPj4+Pj4+PiAtwqDCoMKgIHJlcyA9IHBsYXRmb3JtX2dldF9yZXNv
dXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4+Pj4+Pj4gLcKgwqDCoCBuZmMtPnJlZ19i
YXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldiwgcmVzKTsKPj4+Pj4+PiArwqDCoMKgIG5m
Yy0+cmVnX2Jhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYs
ICJuZmMiKTsKPj4+Pj4+Cj4+Pj4+PiBUaGlzIGNoYW5nZSBzZWVtcyB1bnJlbGF0ZWQuCj4+Pj4+
Cj4+Pj4+IFRvIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgZm9sbG93aW5nID4gZGV2bV9wbGF0Zm9y
bV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LCAiZW1tYyIpLiBkbyB5b3UgbWVhbiB0aGF0
IHdlID4gZG9uJ3QgbmVlZCBpdD8+Cj4+Pj4+Pj4gICDCoMKgwqDCoMKgIGlmIChJU19FUlIobmZj
LT5yZWdfYmFzZSkpCj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIo
bmZjLT5yZWdfYmFzZSk7Cj4+Pj4+Pj4gLcKgwqDCoCBuZmMtPnJlZ19jbGsgPQo+Pj4+Pj4+IC3C
oMKgwqDCoMKgwqDCoCBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKGRldi0+b2Zfbm9k
ZSwKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAiYW1sb2dpYyxtbWMtc3lzY29uIik7Cj4+Pj4+Pj4gLcKgwqDCoCBpZiAoSVNfRVJSKG5mYy0+
cmVnX2NsaykpIHsKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJGYWlsZWQg
dG8gbG9va3VwIGNsb2NrIGJhc2VcbiIpOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4g
UFRSX0VSUihuZmMtPnJlZ19jbGspOwo+Pj4+Pj4+IC3CoMKgwqAgfQo+Pj4+Pj4+ICvCoMKgwqAg
bmZjLT5zZF9lbW1jX2Nsb2NrID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFt
ZShwZGV2LCA+Pj4gImVtbWMiKTsKPj4+Pj4+PiArwqDCoMKgIGlmIChJU19FUlIobmZjLT5zZF9l
bW1jX2Nsb2NrKSkKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIobmZjLT5z
ZF9lbW1jX2Nsb2NrKTsKPj4+Pj4+Cj4+Pj4+PiBXaGlsZSBJIGFncmVlIHRoaXMgaXMgbXVjaCBi
ZXR0ZXIgdGhhbiB0aGUgcHJldmlvdXMgc29sdXRpb24sIHdlIGNhbm5vdAo+Pj4+Pj4gYnJlYWsg
RFQgY29tcGF0aWJpbGl0eSwgc28geW91IG5lZWQgdG8gdHJ5IGdldHRpbmcgdGhlIGVtbWMgY2xv
Y2ssIGJ1dAo+Pj4+Pj4gaWYgaXQgZmFpbHMgeW91IHNob3VsZCBmYWxsYmFjayB0byB0aGUgcmVn
bWFwIGxvb2t1cC4KPj4+Pj4KPj4+Pj4gb2ssIGkgd2lsbCBmaXggaXQgbmV4dCB2ZXJzaW9uLiB0
aGFua3MuCj4+Pj4+ICAgICA+Pj4+ICAgPj4+Pj4gIMKgwqDCoMKgwqAgaXJxID0gcGxhdGZvcm1f
Z2V0X2lycShwZGV2LCAwKTsKPj4+Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gTWlxdcOobAo+Pj4KPj4+
IC4KPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAo+IC4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
