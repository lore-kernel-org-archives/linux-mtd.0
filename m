Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE983C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 13:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tR42cRuwO42GHdeF2ImHWrcFgpNFFMakw+cbFt6Csk=; b=UEno08i9kA/PXJ
	NOIJaargdXn5MVtR8sFWw8lkiUyJqtBxYRixWPuNrMd+oJLQDMCj5fN16uy3ZtDZD8ZFu0G2b+9oJ
	CZZW4vAbyXZGfvnIJ3s9qduuYB3PPkkb/C15lcxELyrTcjYbWpDyR1SzmYaKYjYbbs8oBz/lFS8kV
	MfWXrm5yVwSaiZRst/Bs9lHrzm16xF2iIqTbBpg4z6wI71udNdv1XkRXbekOxs+oiwKxC0HCbbMiB
	pTKCCVLVm1FOXNZaK7UvANMcF+I63ufiGMu+VP9A7HcU86LmYQn8k0IuH2DYkwpRM/LbEmRZg3Ewi
	vyEDCv0d95xBhIPcZJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3zaj-00E4qq-15;
	Tue, 30 May 2023 13:40:49 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3zad-00E4nz-2j;
	Tue, 30 May 2023 13:40:46 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 567DC5FD2F;
	Tue, 30 May 2023 16:40:38 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685454038;
	bh=kfnGf2TnFF3l/TM6PHY5pyKAC4DBRs5GCmPiUL4wufc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=ovSpV1EXdSKCWhRP04go3ZXhIR8SJZxBaE44f5ozw2ltrAt+fFUZJdEP2Ry7D/f5N
	 UuigiIhUrYhhkcpiG7+NagJFoer+Z9k+kNYOM43DAz3D472YMpkadz5CPBqjWsSVob
	 0kJ5ufbxHMtdMRNWx34GN9nSJThLUuU6RDXvbpddKPanw1uPdmrkdX6JdcHMfRJFHb
	 PY8wCzRNSicirI94g7/+xxC/HebfEpXMQmNhw/8lXX8xc3nFN1CCmZu6HSxDO8sOFr
	 NPzfeK/F6OWOBrt4s+wr+Mc7T0HchVoQP4w9VWK7VS9kozRxmmbWnEes70d1FQKyKP
	 uKHrxcVYgmb3Q==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 30 May 2023 16:40:36 +0300 (MSK)
Message-ID: <9d3ada22-0176-2113-bff2-27f8a4ad5c23@sberdevices.ru>
Date: Tue, 30 May 2023 16:35:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/5] mtd: rawnand: meson: fix command sequence for
 read/write
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, JeromeBrunet <jbrunet@baylibre.com>, Martin Blumenstingl<martin.blumenstingl@googlemail.com>, Yixun Lan <yixun.lan@amlogic.com>,Jianxin Pan <jianxin.pan@amlogic.com>, <oxffffaa@gmail.com>,<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,<linux-kernel@vger.kernel.org>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru><20230515094440.3552094-2-AVKrasnov@sberdevices.ru><20230522170526.6486755a@xps-13><9013b0e2-c923-43f8-0bd6-979bf0c23ebc@sberdevices.ru><abeadc03-a69c-be1c-3c6a-6ce492a5e4f6@sberdevices.ru><20230526192205.4a69ca79@xps-13><6077c959-f566-d399-d2be-8460eb063415@sberdevices.ru><20230530150556.498c1fae@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230530150556.498c1fae@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/30 11:20:00 #21377521
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_064044_583632_15B1E4C2 
X-CRM114-Status: GOOD (  22.86  )
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

CgpPbiAzMC4wNS4yMDIzIDE2OjA1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFR1ZSwgMzAgTWF5IDIwMjMg
MTQ6MTk6MDggKzAzMDA6Cj4gCj4+IE9uIDI2LjA1LjIwMjMgMjA6MjIsIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4+PiBIaSBBcnNlbml5LAo+Pj4KPj4+IGF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3
cm90ZSBvbiBXZWQsIDI0IE1heSAyMDIzIDEyOjA1OjQ3ICswMzAwOgo+Pj4gICAKPj4+PiBPbiAy
My4wNS4yMDIzIDEyOjEyLCBBcnNlbml5IEtyYXNub3Ygd3JvdGU6ICAKPj4+Pj4gSGVsbG8gTWlx
dWVsLCBMaWFuZwo+Pj4+Pgo+Pj4+PiBPbiAyMi4wNS4yMDIzIDE4OjA1LCBNaXF1ZWwgUmF5bmFs
IHdyb3RlOiAgICAKPj4+Pj4+IEhpIEFyc2VuaXksCj4+Pj4+Pgo+Pj4+Pj4gQVZLcmFzbm92QHNi
ZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIE1vbiwgMTUgTWF5IDIwMjMgMTI6NDQ6MzUgKzAzMDA6Cj4+
Pj4+PiAgICAKPj4+Pj4+PiBUaGlzIGZpeGVzIHJlYWQvd3JpdGUgZnVuY3Rpb25hbGl0eSBieToK
Pj4+Pj4+PiAxKSBDaGFuZ2luZyBORkNfQ01EX1JCX0lOVCBiaXQgdmFsdWUuICAgIAo+Pj4+Pj4K
Pj4+Pj4+IEkgZ3Vlc3MgdGhpcyBpcyBhIHNlcGFyYXRlIGZpeAo+Pj4+Pj4gICAgCj4+Pj4+Cj4+
Pj4+IE9rLCBJJ2xsIG1vdmUgaXQgdG8gc2VwYXJhdGUgcGF0Y2gKPj4+Pj4gICAgIAo+Pj4+Pj4+
IDIpIEFkZGluZyBleHRyYSBOQU5EX0NNRF9TVEFUVVMgY29tbWFuZCBvbiBlYWNoIHIvdyByZXF1
ZXN0LiAgICAKPj4+Pj4+Cj4+Pj4+PiBJcyB0aGlzIHJlYWxseSBuZWVkZWQ/IExvb2tzIGxpa2Ug
eW91J3JlIGRlbGF5aW5nIHRoZSBuZXh0IG9wIG9ubHkuIElzCj4+Pj4+PiB1c2luZyBhIGRlbGF5
IGVub3VnaD8gSWYgeWVzLCB0aGVuIGl0J3MgcHJvYmFibHkgdGhlIHdyb25nIGFwcHJvYWNoLiAg
ICAKPj4+Pgo+Pj4+IEhpIE1pcXVlbCwgc21hbGwgdXBkYXRlLCBJIGZvdW5kIHNvbWUgZGV0YWls
cyBmcm9tIEBMaWFuZydzIG1lc3NhZ2UgaW4gdjEgdGFsa3MgZnJvbSB0aGUgbGFzdCBtb250aDoK
Pj4+Pgo+Pj4+ICoKPj4+PiBBZnRlciBzZW5kaW5nIE5BTkRfQ01EX1JFQUQwLCBhZGRyZXNzLCBO
QU5EX0NNRF9SRUFEU1RBUlQgYW5kIHJlYWQgc3RhdHVzKE5BTkRfQ01EX1NUQVRVUyA9IDB4NzAp
IGNvbW1hbmRzLCBpdCBzaG91bGQgc2VuZAo+Pj4+IE5BTkRfQ01EX1JFQUQwIGNvbW1hbmQgZm9y
IGV4aXRpbmcgdGhlIHJlYWQgc3RhdHVzIG1vZGUgZnJvbSB0aGUgZGF0YXNoZWV0IGZyb20gTkFO
RCBkZXZpY2UuICAKPj4+Cj4+PiBUaGF0IGlzIHRydWUuCj4+PiAgIAo+Pj4+IGJ1dCBwcmV2aW91
cyBtZXNvbl9uZmNfcXVldWVfcmIoKQo+Pj4+IG9ubHkgY2hlY2tzIHRoZSBSZWFkeS9CdXN5IHBp
biBhbmQgaXQgZG9lc24ndCBzZW5kIHJlYWQgc3RhdHVzKE5BTkRfQ01EX1NUQVRVUyA9IDB4NzAp
IGNvbW1hbmQuCj4+Pj4gaSB0aGluayB0aGVyZSBpcyBzb21ldGhpbmcgd3Jvbmcgd2l0aCB0aGUg
UmVhZHkvQnVzeSBwaW4ocGxlYXNlIGNoZWNrIHRoZSBoYXJkd2FyZSB3aGV0aGVyIHRoaXMKPj4+
PiBSZWFkeS9CdXN5IHBpbiBpcyBjb25uZWN0ZWQgd2l0aCBTT0MpIG9yIHRoZSBzb3VyY2UgY29k
ZS4gaSBoYXZlIHRoZSBib2FyZCB3aXRob3V0IFJlYWR5L0J1c3kgcGluIGFuZCBwcmVmZXIgdG8g
dXNlIHRoZQo+Pj4+IG5mYyBjb21tYW5kIGNhbGxlZCBSQl9JTzYuIGl0IHNlbmRzIE5BTkRfQ01E
X1NUQVRVUyBjb21tYW5kIGFuZCBjaGVja3MgYml0NiBvZiB0aGUgc3RhdHVzIHJlZ2lzdGVyIG9m
IE5BTkQgZGV2aWNlIGZyb20gdGhlCj4+Pj4gZGF0YSBidXMgYW5kIGdlbmVyYXRlIElSUSBpZiBy
ZWFkeS4KPj4+PiAqCj4+Pj4KPj4+PiBJIGd1ZXNzLCB0aGF0IHNlcXVlbmNlIG9mIGNvbW1hbmRz
IGZyb20gdGhpcyBwYXRjaCBpcyBkZXNjcmliZWQgaW4gZGF0YXNoZWV0ICh1bmZvcnR1bmF0ZWx5
IEkgZG9uJ3QgaGF2ZSBpdCBhbmQgcmVsaWVkIG9uIHRoZSBvbGQgZHJpdmVyKS4KPj4+PiBZZXN0
ZXJkYXkgSSB0cmllZCB0byByZW1vdmUgc2VuZGluZyBvZiBOQU5EX0NNRF9TVEFUVVMgZnJvbSB0
aGlzIHBhdGNoLCBidXQgaXQgYnJva2UgY3VycmVudCBkcml2ZXIgLSBpIGhhZCBFQ0MgZXJyb3Jz
LCBzbyBpdCBsb29rcyBsaWtlCj4+Pj4gInNob3QgaW4gdGhlIGRhcmsiIHNpdHVhdGlvbiwgdG8g
dW5kZXJzdGFuZCB0aGlzIGxvZ2ljLiAgCj4+Pgo+Pj4gV2hlbiBhbiBvcGVyYXRpb24gb24gdGhl
IE5BTkQgYXJyYXkgaGFwcGVucyAoZWcuIHJlYWQsIHByb2csIGVyYXNlKSwKPj4+IHlvdSBuZWVk
IHRvIHdhaXQgInNvbWUgdGltZSIgYmVmb3JlIGFjY2Vzc2luZyB0aGUgaW50ZXJuYWwgc3JhbSBv
ciBldmVuCj4+PiB0aGUgY2hpcCB3aGljaCBpcyAiYnVzeSIgdW50aWwgaXQgZ2V0cyAicmVhZHki
IGFnYWluLiBZb3UgY2FuIHByb2JlIHRoZQo+Pj4gcmVhZHkvYnVzeSBwaW4gKHRoYXQncyB0aGUg
aGFyZHdhcmUgd2F5LCBmYXN0IGFuZCByZWxpYWJsZSkgb3IgeW91IGNhbgo+Pj4gcG9sbCBhIHN0
YXR1cyB3aXRoIE5BTkRfQ01EX1NUQVRVUy4gVGhlIGNoaXBzIGFyZSBkZXNpZ25lZCBzbyB0aGV5
IGNhbgo+Pj4gYWN0dWFsbHkgcHJvY2VzcyB0aGF0IGNvbW1hbmQgd2hpbGUgdGhleSBhcmUgZG9p
bmcgdGltZSBjb25zdW1pbmcgdGFza3MKPj4+IHRvIHVwZGF0ZSB0aGUgaG9zdC4gQnV0IElJUkMg
ZXZlcnkgYnl0ZSByZWFkIHdpbGwgcmV0dXJuIHRoZSBzdGF0dXMKPj4+IHVudGlsIHlvdSBzZW5k
IFJFQUQwIGFnYWluLCB3aGljaCBtZWFucyAiSSdtIGRvbmUgd2l0aCB0aGUgc3RhdHVzCj4+PiBy
ZWFkIiBzb21laG93Lgo+Pj4KPj4+IFBsZWFzZSBzZWUgbmFuZF9zb2Z0X3dhaXRyZHkoKSBpbiBv
cmRlciB0byB1bmRlcnN0YW5kIGhvdyB0aGlzIGlzCj4+PiBzdXBwb3NlZCB0byB3b3JrLiBZb3Ug
Y2FuIGV2ZW4gdXNlIHRoYXQgaGVscGVyICh3aGljaCBpcyBleHBvcnRlZCkKPj4+IGluc3RlYWQg
b2Ygb3Blbi1jb2RpbmcgaXQgaW4geW91ciBkcml2ZXIuIFNlZSBhdG1lbCBvciBzdW54aQo+Pj4g
aW1wbGVtZW50YXRpb25zIGZvciBpbnN0YW5jZS4KPj4+Cj4+PiBBcyB1c2luZyB0aGUgbmF0aXZl
IFJCIHBpbiBpcyBiZXR0ZXIsIHlvdSB3b3VsZCBuZWVkIHRvIGlkZW50aWZ5Cj4+PiB3aGV0aGVy
IHlvdSBoYXZlIG9uZSBvciBub3QgYXQgcHJvYmUgdGltZSBhbmQgdGhlbiBlaXRoZXIgcG9sbCB0
aGUKPj4+IHJlbGV2YW50IGJpdCBvZiB5b3VyIGNvbnRyb2xsZXIgaWYgdGhlcmUgaXMgb25lLCBv
ciBmYWxsYmFjayB0byB0aGUKPj4+IHNvZnQgcmVhZCAod2hpY2ggc2hvdWxkIGZhbGxiYWNrIG9u
IGV4ZWNfb3AgaW4gdGhlIGVuZCkuICAKPj4KPj4gVGhhbmtzIGZvciB0aGlzIGluZm9ybWF0aW9u
ISBJJ2xsIHVzZSAnbmFuZF9zb2Z0X3dhaXRyZHkoKScgYXQgbGVhc3QsIGJlY2F1c2UgaSBndWVz
cyB0aGF0Cj4+IHRoZXJlIGlzIG5vIFJCIHBpbiBvbiBteSBkZXZpY2UuCj4gCj4gQ3VycmVudGx5
IHRoZXJlIGlzIG9ubHkgc3VwcG9ydCBmb3IgdGhlIHBoeXNpY2FsIHBpbiBJSVJDLiBUaGlzIG1l
YW5zCj4geW91IGNhbm5vdCBqdXN0IGRyb3AgaXQuIFlvdSBuZWVkIHRvIHN1cHBvcnQgYm90aC4K
ClllcywgaSdtIG5vdCBnb2luZyB0byBkcm9wIFJCIHBpbiBzdXBwb3J0LCBidXQgYXMgSSBkb24n
dCBoYXZlIGRldmljZSB0byB0ZXN0IGl0KGkgZ3Vlc3MpLCBpJ2xsIGFkZAonbmFuZF9zb3J0X3dh
aXRyZHkoKScgYW55d2F5LgoKVGhhbmtzLCBBcnNlbml5Cgo+IAo+IFRoYW5rcywKPiBNaXF1w6hs
CgrQo9CS0JXQlNCe0JzQm9CV0J3QmNCVINCeINCa0J7QndCk0JjQlNCV0J3QptCY0JDQm9Cs0J3Q
ntCh0KLQmDog0K3RgtC+INGN0LvQtdC60YLRgNC+0L3QvdC+0LUg0YHQvtC+0LHRidC10L3QuNC1
INC4INC70Y7QsdGL0LUg0LTQvtC60YPQvNC10L3RgtGLLCDQv9GA0LjQu9C+0LbQtdC90L3Ri9C1
INC6INC90LXQvNGDLCDRgdC+0LTQtdGA0LbQsNGCINC60L7QvdGE0LjQtNC10L3RhtC40LDQu9GM
0L3Rg9GOINC40L3RhNC+0YDQvNCw0YbQuNGOLiDQndCw0YHRgtC+0Y/RidC40Lwg0YPQstC10LTQ
vtC80LvRj9C10Lwg0JLQsNGBINC+INGC0L7QvCwg0YfRgtC+INC10YHQu9C4INGN0YLQviDRgdC+
0L7QsdGJ0LXQvdC40LUg0L3QtSDQv9GA0LXQtNC90LDQt9C90LDRh9C10L3QviDQktCw0LwsINC4
0YHQv9C+0LvRjNC30L7QstCw0L3QuNC1LCDQutC+0L/QuNGA0L7QstCw0L3QuNC1LCDRgNCw0YHQ
v9GA0L7RgdGC0YDQsNC90LXQvdC40LUg0LjQvdGE0L7RgNC80LDRhtC40LgsINGB0L7QtNC10YDQ
ttCw0YnQtdC50YHRjyDQsiDQvdCw0YHRgtC+0Y/RidC10Lwg0YHQvtC+0LHRidC10L3QuNC4LCDQ
sCDRgtCw0LrQttC1INC+0YHRg9GJ0LXRgdGC0LLQu9C10L3QuNC1INC70Y7QsdGL0YUg0LTQtdC5
0YHRgtCy0LjQuSDQvdCwINC+0YHQvdC+0LLQtSDRjdGC0L7QuSDQuNC90YTQvtGA0LzQsNGG0LjQ
uCwg0YHRgtGA0L7Qs9C+INC30LDQv9GA0LXRidC10L3Qvi4g0JXRgdC70Lgg0JLRiyDQv9C+0LvR
g9GH0LjQu9C4INGN0YLQviDRgdC+0L7QsdGJ0LXQvdC40LUg0L/QviDQvtGI0LjQsdC60LUsINC/
0L7QttCw0LvRg9C50YHRgtCwLCDRgdC+0L7QsdGJ0LjRgtC1INC+0LEg0Y3RgtC+0Lwg0L7RgtC/
0YDQsNCy0LjRgtC10LvRjiDQv9C+INGN0LvQtdC60YLRgNC+0L3QvdC+0Lkg0L/QvtGH0YLQtSDQ
uCDRg9C00LDQu9C40YLQtSDRjdGC0L4g0YHQvtC+0LHRidC10L3QuNC1LgpDT05GSURFTlRJQUxJ
VFkgTk9USUNFOiBUaGlzIGVtYWlsIGFuZCBhbnkgZmlsZXMgYXR0YWNoZWQgdG8gaXQgYXJlIGNv
bmZpZGVudGlhbC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCB5b3UgYXJl
IG5vdGlmaWVkIHRoYXQgdXNpbmcsIGNvcHlpbmcsIGRpc3RyaWJ1dGluZyBvciB0YWtpbmcgYW55
IGFjdGlvbiBpbiByZWxpYW5jZSBvbiB0aGUgY29udGVudHMgb2YgdGhpcyBpbmZvcm1hdGlvbiBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGlu
IGVycm9yIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgZW1haWwuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
