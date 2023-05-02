Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128ADC77B73
	for <linux-mtd@archiver.kernel.org>; Tue,  2 May 2023 13:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/ouEPWmISJZs+oUyPafB9AJu2Qh4vgVEDYV14xage0=; b=qYkDIx7Dn8H/E2
	S4W9Uaqn8LztoN8kCW3Es3dH1LHAh5j69jhXwtpsMXj83Zj95Utgo9GsV5u8XYrnmvSzYuB4utHCA
	7gZXjDPbCgIFC77XltRetLhvegG9IJgUbyH6lHxwG0uEVWpx4NK1J6uXkTw/OLlFQTtiw77MfN8TR
	tkt91o2tjrat9Cn4pW43j1dMKGZui4pgaB+BtlNDsxm6X6p3FL24/W2Qw+c4WZg6BAdMZscoaxjfT
	kkIhQd1gUhqGV3grXMHbeIVSNHbH/o++mbIThr9PGKL2tjsnfhPhZUMs/q1pt4/fyC5unNf7WOaOs
	q7aAC1WooKUCxTlvhtcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptphl-001YPF-0x;
	Tue, 02 May 2023 13:06:05 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptphg-001YMn-0l;
	Tue, 02 May 2023 13:06:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7A4A61BF20F;
	Tue,  2 May 2023 13:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683032756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UK1/+8iK/BJp+Spv6teX9UIXu4Mi0jjl4DYeggLPlyQ=;
	b=Lq3Pz/u2fJN9OvN6xaMH15oN+1V5wMHc9pIoKKTQsj1oIpqJKk7U1hsYZgaGtYUzJGui5x
	pMQzABPxl4jwm3UGaHLO1wVYaPqhoyB4A8zrxI+Fl7je4BSsbOYZOxqGzYUjx3PbYTA0d5
	9BuRCUgFlvHdfuhjq7TEXY7gUmtjg5VOPVdW78GrkgK4bVimf73syTOUkmHf1uLePQHtmU
	IAtRUtjVRnmI2IRUIimoFDz3Up6gPmTM6CBvjJ9h+0mS/9b1fVBabPFxMR2W4GmtCtPwXC
	pM5aFvN9e6OLhEG2QJil0u6/3pO6YJ1q+zo1fXUXsDbAOtezfw4xDTncOEsaXg==
Date: Tue, 2 May 2023 15:05:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "yonghui.yu" <yonghui.yu@amlogic.com>
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before
 read
Message-ID: <20230502150553.65fdeb7f@xps-13>
In-Reply-To: <91cb8e19-e782-b847-8d2b-22580c371c34@sberdevices.ru>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
	<20230413122252.0a8efcd8@xps-13>
	<569a948e-654a-b21f-8a4f-55dc4b295387@sberdevices.ru>
	<60fa656e-bda1-1de6-a79e-3e3041cd69a8@sberdevices.ru>
	<780c0cae-18b6-2652-1c2c-6d398ea60451@amlogic.com>
	<e7c49f2d-b3c1-8d9b-76fe-c8759b37c7c7@sberdevices.ru>
	<20230418152505.72fc16da@xps-13>
	<15a6e415-1489-a81f-fc8f-2372678ad2cb@sberdevices.ru>
	<ee10bdeb-416c-70f0-d323-7107fe0746e8@amlogic.com>
	<5e4b395e-bf9d-0123-a0f2-2b378d950b29@sberdevices.ru>
	<fda1ae91-4bf8-6945-bd0d-b6dabc9cb4bd@sberdevices.ru>
	<a5010dcf-a8ce-f144-949c-687548cefce7@amlogic.com>
	<cf27b6b4-a75b-c5a6-32ea-ac20a2984192@sberdevices.ru>
	<20230502115913.78012d98@xps-13>
	<2274b432-d1a9-b3cf-4f7b-08c4a4c580b5@sberdevices.ru>
	<20230502132745.14349770@xps-13>
	<2b2f5cb4-84f7-65f6-13b2-42f965503023@sberdevices.ru>
	<20230502141703.29f0bc30@xps-13>
	<91cb8e19-e782-b847-8d2b-22580c371c34@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_060600_547531_5C8869A1 
X-CRM114-Status: GOOD (  35.67  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDIgTWF5
IDIwMjMgMTU6MjQ6MDkgKzAzMDA6Cgo+IE9uIDAyLjA1LjIwMjMgMTU6MTcsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiBIaSBBcnNlbml5LAo+ID4gCj4gPiBSaWNoYXJkLCB5b3VyIGlucHV0IGlz
IHdlbGNvbWUgYmVsb3cgOi0pCj4gPiAgIAo+ID4+Pj4+Pj4+PiBJIGp1c3QgY2hlY2tlZCBKRkZT
MiBtb3VudC91bW91bnQgYWdhaW4sIGhlcmUgaXMgd2hhdCBpIHNlZToKPiA+Pj4+Pj4+Pj4gMCkg
Rmlyc3QgYXR0ZW1wdCB0byBtb3VudCBKRkZTMi4KPiA+Pj4+Pj4+Pj4gMSkgSXQgd3JpdGVzIE9P
QiB0byBwYWdlIE4gKGknbSB1c2luZyByYXcgd3JpdGUpLiBJdCBpcyBjbGVhbm1hcmtlciB2YWx1
ZSAweDg1IDB4MTkgMHgwMyAweDIwLiBNb3VudCBpcyBkb25lLgo+ID4+Pj4+Pj4+PiAyKSBVbW91
bnQgSkZGUzIuIERvbmUuCj4gPj4+Pj4+Pj4+IDMpIFNlY29uZCBhdHRlbXB0IHRvIG1vdW50IEpG
RlMyLgo+ID4+Pj4+Pj4+PiA0KSBJdCByZWFkcyBPT0IgZnJvbSBwYWdlIE4gKGknbSB1c2luZyBy
YXcgcmVhZCkuIFZhbHVlIGlzIDB4ODUgMHgxOSAweDAzIDB4MjAuIERvbmUuCj4gPj4+Pj4+Pj4+
IDUpIEl0IHJlYWRzIHBhZ2UgTiBpbiBFQ0MgbW9kZSwgYW5kIGkgZ2V0Ogo+ID4+Pj4+Pj4+PiDC
oMKgwqDCoCBqZmZzMjogbXRkLT5yZWFkKDB4MTAwIGJ5dGVzIGZyb20gTikgcmV0dXJuZWQgRUND
IGVycm9yCj4gPj4+Pj4+Pj4+IDYpIE1vdW50IGZhaWxlZC4KPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+
Pj4gV2UgYWxyZWFkeSBoYWQgcHJvYmxlbSB3aGljaCBsb29rcyBsaWtlIHRoaXMgb24gYW5vdGhl
ciBkZXZpY2UuIFNvbHV0aW9uIHdhcyB0byB1c2UgT09CIGFyZWEgd2hpY2ggaXMKPiA+Pj4+Pj4+
Pj4gbm90IGNvdmVyZWQgYnkgRUNDIGZvciBKRkZTMiBjbGVhbm1hcmtlcnMuICAgICAgICAKPiA+
Pj4+Pj4+Cj4gPj4+Pj4+PiBvaywgc28gdGhlcmUgaXMgbm90IEVDQyBwYXJpdHkgYnl0ZXMgYW5k
IG10ZC0+cmVhZCgpIHJldHVybnMgRUNDIGVycm9yLgo+ID4+Pj4+Pj4gZG9lcyBpdCBoYXZlIHRv
IHVzZSByYXcgd3JpdGUvcmVhZCBvbiBzdGVwIDEpIGFuZCA0KT8KPiA+Pj4+Pj4+ICAgICAgICAg
Cj4gPj4+Pj4+Cj4gPj4+Pj4+IElmIGknbSB1c2luZyBub24gcmF3IGFjY2VzcyB0byBPT0IsIGZv
ciBleGFtcGxlIHdyaXRlIE9PQiAodXNlciBieXRlcykgaW4gRUNDIG1vZGUsIHRoZW4KPiA+Pj4+
Pj4gc3RlcHMgMSkgYW5kIDQpIGFuZCA1KSBwYXNzZXMgb2ssIGJ1dCB3cml0ZSB0byB0aGlzIHBh
Z2Ugd2lsbCBiZSBpbXBvc3NpYmxlIChmb3IgZXhhbXBsZSBKRkZTMgo+ID4+Pj4+PiB3cml0ZXMg
dG8gc3VjaCBwYWdlcyBsYXRlcikgLSB3ZSBjYW4ndCB1cGRhdGUgRUNDIGNvZGVzIHByb3Blcmx5
IHdpdGhvdXQgZXJhc2luZyB3aG9sZSBwYWdlLgo+ID4+Pj4+PiBXcml0ZSBvcGVyYXRpb24gd2ls
bCBiZSBkb25lIHdpdGhvdXQgcHJvYmxlbSwgYnV0IHJlYWQgd2lsbCB0cmlnZ2VyIEVDQyBlcnJv
cnMgZHVlIHRvIGJyb2tlbgo+ID4+Pj4+PiBFQ0MgY29kZXMuCj4gPj4+Pj4+Cj4gPj4+Pj4+IElu
IGdlbmVyYWwgcHJvYmxlbSB0aGF0IHdlIGRpc2N1c3MgaXMgdGhhdCBpbiBjdXJyZW50IGltcGxl
bWVudGF0aW9uIGRhdGEgYW5kIE9PQiBjb25mbGljdHMKPiA+Pj4+Pj4gd2l0aCBlYWNoIG90aGVy
IGJ5IHNoYXJpbmcgc2FtZSBFQ0MgY29kZXMsIHRoZXNlIEVDQyBjb2RlcyBjb3VsZCBiZSB3cml0
dGVuIG9ubHkgb25jZSAod2l0aG91dAo+ID4+Pj4+PiBlcmFzaW5nKSwgd2hpbGUgZGF0YSBhbmQg
T09CIGhhcyBkaWZmZXJlbnQgY2FsbGJhY2tzIHRvIGFjY2VzcyBhbmQgdGh1cyBzdXBwb3NlZCB0
byB3b3JrCj4gPj4+Pj4+IHNlcGFyYXRlbHkuICAgICAgCj4gPj4+Pj4KPiA+Pj4+PiBUaGUgZmFj
dCB0aGF0IHRoZXJlIG1pZ2h0IGJlIGhlbHBlcnMganVzdCBmb3Igd3JpdGluZyBPT0IgYXJlYXMg
b3IganVzdAo+ID4+Pj4+IGluLWJhbmQgYXJlYXMgYXJlIG9wdGltaXphdGlvbnMuIE5BTkQgcGFn
ZXMgYXJlIG1lYW50IHRvIGJlIHdyaXR0ZW4gYQo+ID4+Pj4+IHNpbmdsZSB0aW1lLCBubyBtYXR0
ZXIgd2hhdCBwb3J0aW9uIHlvdSB3cml0ZS4gSW4gc29tZSBjYXNlcywgaXQgaXMKPiA+Pj4+PiBw
b3NzaWJsZSB0byBwZXJmb3JtIHN1YnBhZ2Ugd3JpdGVzIGlmIHRoZSBjaGlwIHN1cHBvcnRzIGl0
LiBQYWdlcyBtYXkKPiA+Pj4+PiBiZSBzcGxpdCBpbnRvIHNldmVyYWwgYXJlYXMgd2hpY2ggY292
ZXIgYSBwYXJ0aWFsIGluLWJhbmQgYXJlYSAqYW5kKiBhCj4gPj4+Pj4gcGFydGlhbCBPT0IgYXJl
YS4gSWYgeW91IHdyaXRlIGludG8gdGhlIGluLWJhbmQgKm9yKiBvdXQtb2YtYmFuZCBhcmVhcwo+
ID4+Pj4+IG9mIGEgZ2l2ZW4gc3VicGFnZSwgeW91ICpjYW5ub3QqIHdyaXRlIHRoZSBvdGhlciBw
YXJ0IGxhdGVyIHdpdGhvdXQgICAgICAKPiA+Pj4+Cj4gPj4+PiBUaGFua3MgZm9yIGRldGFpbHMh
IFNvIGluIGNhc2Ugb2YgSkZGUzIgaXQgbG9va3MgbGlrZSBzdHJhbmdlLCB0aGF0IGl0IHRyaWVz
Cj4gPj4+PiB0byB3cml0ZSBwYWdlIGFmdGVyIHdyaXRpbmcgY2xlYW4gbWFya2VycyB0byBpdCBi
ZWZvcmU/IEluIHRoZSBvbGQgdmVuZG9yJ3MKPiA+Pj4+IGRyaXZlciBPT0Igd3JpdGUgY2FsbGJh
Y2sgaXMgc3VwcHJlc3NlZCBieSByZXR1cm4gMCBhbHdheXMgYW5kIEpGRlMyIHdvcmtzCj4gPj4+
PiBjb3JyZWN0bHkuICAgIAo+ID4+Pgo+ID4+PiBDYW4geW91IHBvaW50IHRoZSBjb2RlIHlvdSdy
ZSBtZW50aW9uaW5nPyAoYm90aCB3aGF0IEpGRlMyIHdoaWNoIGxvb2tzCj4gPj4+IHN0cmFuZ2Ug
dG8geW91IGFuZCB0aGUgb2xkIHZlbmRvciBoYWNrKSAgICAKPiA+Pgo+ID4+IEhlcmUgaXMgdmVy
c2lvbiBvZiB0aGUgb2xkIHZlbmRvcidzIGRyaXZlcjoKPiA+Pgo+ID4+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9rc3phcS9saW51eC1hbWxvZ2ljL2Jsb2IvbWFzdGVyX25ld19hbXBvcnRzL2RyaXZlcnMv
YW1sb2dpYy9uYW5kL25hbmQvYW1sX25hbmQuYyNMMzI2MAo+ID4+Cj4gPj4gSW4gbXkgdmVyc2lv
biB0aGVyZSBpcyBubyBCVUcoKSB0aGVyZSwgYnV0IGl0IGlzIHNhbWUgZHJpdmVyIGZvciB0aGUg
c2FtZSBjaGlwLgo+ID4+Cj4gPj4gQWJvdXQgSkZGUzIgLSBpIGRpZG4ndCBjaGVjayBpdHMgc291
cmNlIGNvZGUsIGJ1dCB3aGF0IEkgY2FuIHNlZSB1c2luZyBwcmludGsoKSwgaXMgdGhhdCBpdCBm
aXJzdAo+ID4+IHRyaWVzIHRvIHdyaXRlIGNsZWFubWFya2VyIHVzaW5nIE9PQiB3cml0ZSBjYWxs
YmFjay4gVGhlbiBsYXRlciBpdCB0cmllcyB0byB3cml0ZSB0byB0aGlzIHBhZ2UsIHNvCj4gPj4g
bWF5IGJlIGl0IGlzIHVuZXhwZWN0ZWQgYmVoYXZpb3VyIG9mIEpGRlMyPyAgCj4gPiAKPiA+IFRC
SCBJIGFtIG5vdCBrbm93bGVkZ2VhYmxlIGFib3V0IEpGRlMyLCBtYXliZSBSaWNoYXJkIGNhbiBo
ZWxwIGhlcmUuCj4gPiAKPiA+IEFyZSB5b3Ugc3VyZSB5b3UgZmxhc2ggaXMgcmVjb2duaXplZCBi
eSBKRkZTMiBhcyBiZWluZyBhIE5BTkQgZGV2aWNlPwo+ID4gRGlkIHlvdSBlbmFibGUgQ09ORklH
X0pGRlMyX0ZTX1dSSVRFQlVGRkVSIGNvcnJlY3RseT8gQmVjYXVzZQo+ID4gY2xlYW5tYXJrZXIg
c2VlbSB0byBiZSBkaXNjYXJkZWQgd2hlbiB1c2luZyBhIE5BTkQgZGV2aWNlLCBhbmQKPiA+IHJl
Y29nbml6aW5nIHRoZSBkZXZpY2UgYXMgYSBOQU5EIGRldmljZSByZXF1aXJlcyB0aGUgYWJvdmUg
b3B0aW9uIHRvIGJlCj4gPiBzZXQgYXBwYXJlbnRseS4gIAo+IAo+IFllcywgSSBoYXZlCj4gCj4g
Q09ORklHX0pGRlMyX0ZTX1dSSVRFQlVGRkVSPXkKPiAKPiBBbmQgaSBzZWUsIHRoYXQgamZmczJf
bWFya19lcmFzZWRfYmxvY2soKSBjYWxscyBqZmZzMl9jbGVhbm1hcmtlcl9vb2IoKSB3aGljaCBj
aGVja3MgdGhhdCB3ZSBoYXZlIE1URF9OQU5ERkxBU0guIFRoaXMKPiBjaGVjayBpcyB0cnVlLCBz
byB0aGVuIGpmZnMyX3dyaXRlX25hbmRfY2xlYW5tYXJrZXIoKSBpcyBjYWxsZWQgYW5kIHRoZXJl
IGlzIE9PQiB3cml0ZSBpbiBpdC4gU28gSSBzZWUgb3Bwb3NpdGUgdGhpbmc6Cj4gY2xlYW5tYXJr
ZXJzIGFyZSBub3QgZGlzY2FyZGVkIHdpdGggTkFORCBkZXZpY2UuIAoKRXhjZWxsZW50LiBTbyB3
aGVuIGNsZWFubWFya2VyX3NpemUgPT0gMCwgaXQgbWVhbnMgdGhlcmUgaXMgbm8KY2xlYW5tYXJr
ZXIuIEJ1dCBpZiBpdCBpcyBhIE5BTkQgZGV2aWNlLCB3ZSB3cml0ZSB0aGUgbWFya2VyIGFueXdh
eS4KCldlbGwgSSBndWVzcyBpdCB1c2VkIHRvIHdvcmsgb24gb2xkIGNvbnRyb2xsZXJzIHVzaW5n
IGEgSGFtbWluZyBFQ0MKZW5naW5lIG5vdCBwcm90ZWN0aW5nIGFueSB1c2VyIE9PQiBieXRlcywg
c28gd3JpdGluZyB0aGUgY2xlYW4gbWFya2Vycwp3b3VsZCBzaW1wbHkgbm90IGxlYWQgdG8gRUND
IGJ5dGVzIGJlaW5nIHByb2R1Y2VkL3dyaXR0ZW4uIE9yIGl0IG1pZ2h0CmhhdmUgd29ya2VkIGFz
IHdlbGwgb24gY29udHJvbGxlciBkcml2ZXJzIG5vdCBlbmFibGluZyB0aGUgRUNDIGVuZ2luZQp3
aGVuIHBlcmZvcm1pbmcgT09CLW9ubHkgd3JpdGVzLiBJdCBhbHNvIHJlcXVpcmVzIHRoZSBjaGlw
IHRvIGJlIG9sZAplbm91Z2ggdG8gc3VwcG9ydCBtdWx0aXBsZSB3cml0ZXMgb24gdGhlIHNhbWUg
KHN1YilwYWdlIGFzIGxvbmcgYXMgdGhlCndyaXR0ZW4gYml0cyBkbyBub3Qgb3ZlcmxhcD8KClBl
cmhhcHMgdGhhdCdzIHdoYXQgdGhlIGhhY2sgaW4gdGhlIG9sZCBkcml2ZXIgaXMgZm9yLiBCdXQg
dGhhdCdzCklNSE8gYnJva2VuIGluIGNhc2Ugb2YgdW5leHBlY3RlZCByZWJvb3QgOi0pCgpNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
