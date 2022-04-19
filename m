Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D884C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 08:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0hM6uqQ3+uH+4Wyd+L+1fw0X1BzQM6uxjVZ0oP2T2E=; b=Ju/Xs0Bku3rqyx
	YplyQHekUi1g1v6W1ms5QCko6/VXHD6xDEvYVM5UpY28uXgorYO2/BSKMhx7mrTjm06RPsJ7BAbdU
	f1vHBiqiuV6t58C1h6Uut09kqSZPKKG9k2ksMniu+DRN3p5uQCflurFH0KC2FWejPdinhYryxYObl
	yh9vMyDkO61sFYs98d5cVlXc5P3q+aBQw17RQmnyxjP8g5ahM7wnxD3LcMxznqg3FDXfk7JwfYGwJ
	agL82K9DYzZo51t9ggj3dOTns6n2U/Db9wu9ff9LjFfRWIc9Wl2jaIB75zRFE0JgLL9nOLarXX4Eq
	8JIzaaT7SOM7kmXg8m5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngjCL-002Jtq-SC; Tue, 19 Apr 2022 08:26:57 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngjC6-002Jli-Ta; Tue, 19 Apr 2022 08:26:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5B566FF804;
 Tue, 19 Apr 2022 08:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650356793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VXBlhum4y6XFxuELbe8JGMivZRApx0IpgXnue2l+2tA=;
 b=En4XckKRy2XUHcPmxdD3HS/8imGMUX23JA+DVW2whyGf+0TkYT1GxTJToeKg7JxW6sp5YD
 5T0JqZyLmOcpT1Iscp4JTrMcF69FqaC2psvhgVarurkbtDHCd+TQMp1LDZQTn6fSMVP84V
 m2EAoe4FtF7XBLmH+M/XIhq17fudmWBlAwS/Wj97MBQcbsMXbn0E16axGlemoqdzPpyoya
 fAisPIPcnZTYKVRtov653V9gvO5sDfdIPJe/GZr/3QyP8Ea81PUSS5b6v3GY9CSZBnVm0t
 RyH6QoClKUE+YOkWoXhtMnMlpeNu/C5hwRwH4GI3lUOr9PNnM21z0cRB9bfj7Q==
Date: Tue, 19 Apr 2022 10:26:29 +0200
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
Message-ID: <20220419102629.1c77aa2a@xps13>
In-Reply-To: <d5a33645-fac1-9c69-afe6-654bfe93ca48@amlogic.com>
References: <20220402074921.13316-1-liang.yang@amlogic.com>
 <20220402074921.13316-2-liang.yang@amlogic.com>
 <20220404103034.48ec16b1@xps13>
 <50105d6b-8ced-1b72-30cb-a709c4a4dd26@amlogic.com>
 <d5a33645-fac1-9c69-afe6-654bfe93ca48@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_012643_271417_24B822AB 
X-CRM114-Status: GOOD (  20.09  )
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

SGVsbG8sCgpsaWFuZy55YW5nQGFtbG9naWMuY29tIHdyb3RlIG9uIE1vbiwgMTggQXByIDIwMjIg
MTE6NDA6MTAgKzA4MDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBpIGhhdmUgc29tZSBjb25mdXNpb24g
d2hlbiBpIHByZXBhcmUgdGhlIHBhdGNoZXMuIGZvciBEVCBjb21wYXRpYmlsaXR5LCBpdCBmYWxs
cyBiYWNrIHRvIHRoZSBvbGQgRFQgd2hlbiBmYWlsZWQgdG8gZ2V0IHJlc291cmNlIGJ5IHRoZSBu
ZXcgRFQsIGJ1dCB0aGVyZSBpcyBzb21lIHBvaW50czoKPiBhLiBvbGQgRFQgZGVwZW5kcyBvbiBN
TUMgc3ViIGNsb2NrIGRyaXZlciwgYnV0IGl0IG5ldmVyIGJlIG1lcmdlZCwgc28gaXQgY2FuJ3Qg
d29yay4KCkkgZG9uJ3QgZ2V0IHdoYXQgeW91IG1lYW4gaGVyZSwgc29ycnkuIEkgYmVsaWV2ZSB0
aGVyZSBpcyBhIG5ldyB3YXkgdG8KZGVzY3JpYmUgdGhpcyBjbG9jayBidXQgZ3JhYmJpbmcgdGhl
IG9uZSBmcm9tIHRoZSBNTUMgc3RpbGwgd29ya3MsIGRvZXMKbm90IGl0PwoKPiBiLiBpZiBpdCBm
YWxscyBiYWNrIHRvIHRoZSBvbGQgRFQsIGJlc2lkZSB0aGUgcmVnbWFwIGxvb2t1cCBiZWxvdywg
aXQgc2VlbXMgdGhhdCB3ZSBoYXZlIHRvIHByZXNlcnZlIHRoZSBjb2RlIG9mIHRoZSBvbGQgY2xv
Y2sgc2V0dGluZyBpbiBuZmNfY2xrX2luaXQoKS4KClllcywgcHJvYmFibHkuCgo+IGRvIHdlIHN0
aWxsIG5lZWQgdG8gYXZvaWQgYnJlYWsgRFQgY29tcGF0aWJpbGl0eT8KCldlIHNob3VsZCB0cnkg
b3VyIGJlc3QgdG8gYXZvaWQgYnJlYWtpbmcgdGhlIERULCB5ZXMuCgo+IAo+IFRoYW5rcy4KPiAK
PiBPbiAyMDIyLzQvMTEgMTA6NDAsIExpYW5nIFlhbmcgd3JvdGU6Cj4gPj4+IMKgwqDCoMKgwqAg
bmZjLT5kZXYgPSBkZXY7Cj4gPj4+IC3CoMKgwqAgcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNl
KHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKPiA+Pj4gLcKgwqDCoCBuZmMtPnJlZ19iYXNlID0g
ZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldiwgcmVzKTsKPiA+Pj4gK8KgwqDCoCBuZmMtPnJlZ19i
YXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LCAibmZjIik7
ICAKPiA+Pgo+ID4+IFRoaXMgY2hhbmdlIHNlZW1zIHVucmVsYXRlZC4gIAo+ID4gCj4gPiBUbyBi
ZSBjb25zaXN0ZW50IHdpdGggdGhlIGZvbGxvd2luZyA+IGRldm1fcGxhdGZvcm1faW9yZW1hcF9y
ZXNvdXJjZV9ieW5hbWUocGRldiwgImVtbWMiKS4gZG8geW91IG1lYW4gdGhhdCB3ZSA+IGRvbid0
IG5lZWQgaXQ/PiAgCj4gPj4+IMKgwqDCoMKgwqAgaWYgKElTX0VSUihuZmMtPnJlZ19iYXNlKSkK
PiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKG5mYy0+cmVnX2Jhc2UpOwo+
ID4+PiAtwqDCoMKgIG5mYy0+cmVnX2NsayA9Cj4gPj4+IC3CoMKgwqDCoMKgwqDCoCBzeXNjb25f
cmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKGRldi0+b2Zfbm9kZSwKPiA+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImFtbG9naWMsbW1jLXN5c2NvbiIp
Owo+ID4+PiAtwqDCoMKgIGlmIChJU19FUlIobmZjLT5yZWdfY2xrKSkgewo+ID4+PiAtwqDCoMKg
wqDCoMKgwqAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gbG9va3VwIGNsb2NrIGJhc2VcbiIpOwo+
ID4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIobmZjLT5yZWdfY2xrKTsKPiA+Pj4g
LcKgwqDCoCB9Cj4gPj4+ICvCoMKgwqAgbmZjLT5zZF9lbW1jX2Nsb2NrID0gZGV2bV9wbGF0Zm9y
bV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LCA+Pj4gImVtbWMiKTsKPiA+Pj4gK8KgwqDC
oCBpZiAoSVNfRVJSKG5mYy0+c2RfZW1tY19jbG9jaykpCj4gPj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gUFRSX0VSUihuZmMtPnNkX2VtbWNfY2xvY2spOyAgCj4gPj4KPiA+PiBXaGlsZSBJIGFn
cmVlIHRoaXMgaXMgbXVjaCBiZXR0ZXIgdGhhbiB0aGUgcHJldmlvdXMgc29sdXRpb24sIHdlIGNh
bm5vdAo+ID4+IGJyZWFrIERUIGNvbXBhdGliaWxpdHksIHNvIHlvdSBuZWVkIHRvIHRyeSBnZXR0
aW5nIHRoZSBlbW1jIGNsb2NrLCBidXQKPiA+PiBpZiBpdCBmYWlscyB5b3Ugc2hvdWxkIGZhbGxi
YWNrIHRvIHRoZSByZWdtYXAgbG9va3VwLiAgCj4gPiAKPiA+IG9rLCBpIHdpbGwgZml4IGl0IG5l
eHQgdmVyc2lvbi4gdGhhbmtzLgo+ID4gICAKPiA+PiAgCj4gPj4+IMKgwqDCoMKgwqAgaXJxID0g
cGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsgIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
