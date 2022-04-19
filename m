Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0907C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 15:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngUlK4rkMqFqqpaCJZ42Eg4eedQ/mtVKN0ZTlkmw1/o=; b=q/DKsG8y2qtEvf
	MlTDM1z84KAMt9nEfJtWtyt8ZlfD4KS7GKceDZmKMM1EoMoFiVTh8Pg3LPrzNs1nh6nZACgc5QXNB
	7AdpxVeALsomxMlXKOgCvQmyt+4aRaecvzdM4qhqFnoMdrWsCFV4xf+/VKwIyE7wcQyzXjgtm5ZHw
	HRQF9KxXG8sZ76/bdXWgOpjy1lJ1lpziF7CLPl698Fto/2tIaRe3qJMSWxKWriuoOB2iEE7EWIh4H
	l+0Gv8FH3y+Ua0ZfdNmAW/ghnioCGdtZJYExYRXNwvw+nXPa55xKQ01N+xCzbBnvBP5l4I9TT5lOZ
	/0DbjPhj8tmNazJvjO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngpye-004kLt-SV; Tue, 19 Apr 2022 15:41:16 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngpjW-004dIV-2q; Tue, 19 Apr 2022 15:25:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 59F30FF80D;
 Tue, 19 Apr 2022 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650381932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bq9PeeGKcHRkxdXVgUr01rmzSL3+CeljQ3EucZX0P7Y=;
 b=D5GBhDkyZrK5yvyrOhTnlTFai3nybJgtqeJ4Btz8MX+iAYbIB8QguBUEXby9NcFEsox2Ay
 nEBVao0mKpzibIZwXRjI+fegNSQSw7yP0VTNq2TEF9zGIcyMj40seUL5zSgEDw6yP0fImV
 lJF05G0KenAPpCFxgqJkSYhSYBiG/PZ/bVpCHQ4t0OlvyMid9HQRfk/ROI9Kgcj6DyTUMD
 xvSthEuLiZuwLSoV+spy5qdHex3A5uN+vsMGrjnOmyQmI94UOSi1NIfHY47bk0U1gnoFxS
 +z+RfEv5dQrJmZydxKRtn5ikkNVGrQpVuMaMw2rcPP/XoxZz0Iya3GbS7msmUg==
Date: Tue, 19 Apr 2022 17:25:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>
Cc: <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
 <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>,
 YongHui Yu <yonghui.yu@amlogic.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] mtd: rawnand: meson: discard the common MMC sub
 clock framework
Message-ID: <20220419172528.2dd75e7b@xps13>
In-Reply-To: <2e382e3e-c231-c9e4-73a1-0637288fcd4f@amlogic.com>
References: <20220402074921.13316-1-liang.yang@amlogic.com>
 <20220402074921.13316-2-liang.yang@amlogic.com>
 <20220404103034.48ec16b1@xps13>
 <50105d6b-8ced-1b72-30cb-a709c4a4dd26@amlogic.com>
 <d5a33645-fac1-9c69-afe6-654bfe93ca48@amlogic.com>
 <20220419102629.1c77aa2a@xps13>
 <2e382e3e-c231-c9e4-73a1-0637288fcd4f@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_082538_501216_AB2181F0 
X-CRM114-Status: GOOD (  28.16  )
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

SGVsbG8sCgpsaWFuZy55YW5nQGFtbG9naWMuY29tIHdyb3RlIG9uIFR1ZSwgMTkgQXByIDIwMjIg
MTc6MTc6NDggKzA4MDA6Cgo+IEhlbGxvIE1pcXVlbCwKPiAKPiBPbiAyMDIyLzQvMTkgMTY6MjYs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiA+IAo+ID4gSGVs
bG8sCj4gPiAKPiA+IGxpYW5nLnlhbmdAYW1sb2dpYy5jb20gd3JvdGUgb24gTW9uLCAxOCBBcHIg
MjAyMiAxMTo0MDoxMCArMDgwMDoKPiA+ICAgCj4gPj4gSGkgTWlxdWVsLAo+ID4+Cj4gPj4gaSBo
YXZlIHNvbWUgY29uZnVzaW9uIHdoZW4gaSBwcmVwYXJlIHRoZSBwYXRjaGVzLiBmb3IgRFQgY29t
cGF0aWJpbGl0eSwgaXQgZmFsbHMgYmFjayB0byB0aGUgb2xkIERUIHdoZW4gZmFpbGVkIHRvIGdl
dCByZXNvdXJjZSBieSB0aGUgbmV3IERULCBidXQgdGhlcmUgaXMgc29tZSBwb2ludHM6Cj4gPj4g
YS4gb2xkIERUIGRlcGVuZHMgb24gTU1DIHN1YiBjbG9jayBkcml2ZXIsIGJ1dCBpdCBuZXZlciBi
ZSBtZXJnZWQsIHNvIGl0IGNhbid0IHdvcmsuICAKPiA+IAo+ID4gSSBkb24ndCBnZXQgd2hhdCB5
b3UgbWVhbiBoZXJlLCBzb3JyeS4gSSBiZWxpZXZlIHRoZXJlIGlzIGEgbmV3IHdheSB0bwo+ID4g
ZGVzY3JpYmUgdGhpcyBjbG9jayBidXQgZ3JhYmJpbmcgdGhlIG9uZSBmcm9tIHRoZSBNTUMgc3Rp
bGwgd29ya3MsIGRvZXMKPiA+IG5vdCBpdD8KPiA+ICAgCj4gCj4gTm8sIGl0IGRvZXNuJ3QuIGFm
dGVyIHRoZSBORkMgZHJpdmVyIHVzaW5nIHRoZSBNTUMgc3ViIGNsb2NrIGZyYW1ld29yayB3YXMg
bWVyZ2VkIGludG8gdGhlIG1haW5saW5lIG9mIGtlcm5lbCwgd2UgZGlkbid0IGNvbnRpbnVlIHRv
IHN1Ym1pdCB0aGUgc2VyaWVzIG9mIHBhdGNoZXMgYWJvdXQgTU1DIHN1YiBjbG9jayBhZnRlciB2
OS4gd2hlbiBpIGZvdW5kIHRoYXQsIHdlIG1hZGUgYSBkaXNjdXNzaW9uIHRvIGRlY2lkZSB3aGV0
aGVyIHRvIHJlY292ZXIgdGhlIHNlcmllcyBvZiBwYXRjaGVzIGFib3V0IE1NQyBzdWIgY2xvY2sg
ZnJhbWV3b3JrLCBmaW5hbGx5LCBzZWUgdGhlIGRlc2NyaXB0aW9uIGZyb20gY292ZXIgbGV0dGVy
LCB3ZSBwbGFuIHRvIGFiYW5kb24gaXQgYW5kIGFkb3B0IHRoZSBuZXcgY2xvY2sgc2NoZW1lIGlu
IHRoaXMgc2VyaWVzIG9mIHBhdGNoZXMuCgpJIGFtIG5vdCBzdXJlIHRvIGZvbGxvdy4gSXMgdGhl
IGN1cnJlbnQgY29kZSBjb21wbGV0ZWx5IGJyb2tlbj8gSQpiZWxpZXZlIGl0IGlzIG5vdCwgc28g
SSBkb24ndCB1bmRlcnN0YW5kIHlvdXIgaXNzdWUuCgpDYW4geW91IHBsZWFzZSBzdW1tYXJpemUg
dGhlIHNpdHVhdGlvbj8KCj4gCj4gVGhhbmtzLgo+IAo+ID4+IGIuIGlmIGl0IGZhbGxzIGJhY2sg
dG8gdGhlIG9sZCBEVCwgYmVzaWRlIHRoZSByZWdtYXAgbG9va3VwIGJlbG93LCBpdCBzZWVtcyB0
aGF0IHdlIGhhdmUgdG8gcHJlc2VydmUgdGhlIGNvZGUgb2YgdGhlIG9sZCBjbG9jayBzZXR0aW5n
IGluIG5mY19jbGtfaW5pdCgpLiAgCj4gPiAKPiA+IFllcywgcHJvYmFibHkuCj4gPiAgIAo+ID4+
IGRvIHdlIHN0aWxsIG5lZWQgdG8gYXZvaWQgYnJlYWsgRFQgY29tcGF0aWJpbGl0eT8gIAo+ID4g
Cj4gPiBXZSBzaG91bGQgdHJ5IG91ciBiZXN0IHRvIGF2b2lkIGJyZWFraW5nIHRoZSBEVCwgeWVz
Lgo+ID4gICAKPiA+Pgo+ID4+IFRoYW5rcy4KPiA+Pgo+ID4+IE9uIDIwMjIvNC8xMSAxMDo0MCwg
TGlhbmcgWWFuZyB3cm90ZTogIAo+ID4+Pj4+ICDCoMKgwqDCoMKgIG5mYy0+ZGV2ID0gZGV2Owo+
ID4+Pj4+IC3CoMKgwqAgcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VS
Q0VfTUVNLCAwKTsKPiA+Pj4+PiAtwqDCoMKgIG5mYy0+cmVnX2Jhc2UgPSBkZXZtX2lvcmVtYXBf
cmVzb3VyY2UoZGV2LCByZXMpOwo+ID4+Pj4+ICvCoMKgwqAgbmZjLT5yZWdfYmFzZSA9IGRldm1f
cGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZV9ieW5hbWUocGRldiwgIm5mYyIpOyAgCj4gPj4+Pgo+
ID4+Pj4gVGhpcyBjaGFuZ2Ugc2VlbXMgdW5yZWxhdGVkLiAgCj4gPj4+Cj4gPj4+IFRvIGJlIGNv
bnNpc3RlbnQgd2l0aCB0aGUgZm9sbG93aW5nID4gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291
cmNlX2J5bmFtZShwZGV2LCAiZW1tYyIpLiBkbyB5b3UgbWVhbiB0aGF0IHdlID4gZG9uJ3QgbmVl
ZCBpdD8+ICAKPiA+Pj4+PiAgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKG5mYy0+cmVnX2Jhc2UpKQo+
ID4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIobmZjLT5yZWdfYmFzZSk7
Cj4gPj4+Pj4gLcKgwqDCoCBuZmMtPnJlZ19jbGsgPQo+ID4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBz
eXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKGRldi0+b2Zfbm9kZSwKPiA+Pj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiYW1sb2dpYyxtbWMt
c3lzY29uIik7Cj4gPj4+Pj4gLcKgwqDCoCBpZiAoSVNfRVJSKG5mYy0+cmVnX2NsaykpIHsKPiA+
Pj4+PiAtwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gbG9va3VwIGNsb2Nr
IGJhc2VcbiIpOwo+ID4+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihuZmMtPnJl
Z19jbGspOwo+ID4+Pj4+IC3CoMKgwqAgfQo+ID4+Pj4+ICvCoMKgwqAgbmZjLT5zZF9lbW1jX2Ns
b2NrID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LCA+Pj4gImVt
bWMiKTsKPiA+Pj4+PiArwqDCoMKgIGlmIChJU19FUlIobmZjLT5zZF9lbW1jX2Nsb2NrKSkKPiA+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIobmZjLT5zZF9lbW1jX2Nsb2NrKTsg
IAo+ID4+Pj4KPiA+Pj4+IFdoaWxlIEkgYWdyZWUgdGhpcyBpcyBtdWNoIGJldHRlciB0aGFuIHRo
ZSBwcmV2aW91cyBzb2x1dGlvbiwgd2UgY2Fubm90Cj4gPj4+PiBicmVhayBEVCBjb21wYXRpYmls
aXR5LCBzbyB5b3UgbmVlZCB0byB0cnkgZ2V0dGluZyB0aGUgZW1tYyBjbG9jaywgYnV0Cj4gPj4+
PiBpZiBpdCBmYWlscyB5b3Ugc2hvdWxkIGZhbGxiYWNrIHRvIHRoZSByZWdtYXAgbG9va3VwLiAg
Cj4gPj4+Cj4gPj4+IG9rLCBpIHdpbGwgZml4IGl0IG5leHQgdmVyc2lvbi4gdGhhbmtzLiAgCj4g
Pj4+ICAgID4+Pj4gICA+Pj4+PiAgwqDCoMKgwqDCoCBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBk
ZXYsIDApOyAgCj4gPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobAo+ID4gCj4gPiAuICAK
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
