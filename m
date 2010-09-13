Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=TX2EHSOBE010.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ov3V7-0001Zl-7h
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2010 07:30:57 +0000
Received: from mail33-tx2 (localhost.localdomain [127.0.0.1])	by
	mail33-tx2-R.bigfish.com (Postfix) with ESMTP id B45BD11F0420	for
	<linux-mtd@lists.infradead.org>; Mon, 13 Sep 2010 07:30:51 +0000 (UTC)
Received: from TX2EHSMHS043.bigfish.com (unknown [10.9.14.244])	by
	mail33-tx2.bigfish.com (Postfix) with ESMTP id 78870189004F	for
	<linux-mtd@lists.infradead.org>; Mon, 13 Sep 2010 07:30:22 +0000 (UTC)
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by az33egw02.freescale.net (8.14.3/8.14.3) with ESMTP id
	o8D7UKfH009204	for
	<linux-mtd@lists.infradead.org>; Mon, 13 Sep 2010 00:30:20 -0700 (MST)
Received: from zch01exm23.fsl.freescale.net (zch01exm23.ap.freescale.net
	[10.192.129.207])	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP
	id o8D7iRT5029286	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2010 02:44:28 -0500 (CDT)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Subject: RE: [PATCH v2 3/3][MTD] P4080/mtd: Fix the freescale lbc issue with
	36bit mode
Date: Mon, 13 Sep 2010 15:30:15 +0800
Message-ID: <3850A844E6A3854C827AC5C0BEC7B60A1FC158@zch01exm23.fsl.freescale.net>
In-Reply-To: <20100909114153.GB6622@oksana.dev.rtsoft.ru>
References: <1284027632-32573-1-git-send-email-tie-fei.zang@freescale.com>
	<1284027632-32573-2-git-send-email-tie-fei.zang@freescale.com>
	<1284027632-32573-3-git-send-email-tie-fei.zang@freescale.com>
	<20100909114153.GB6622@oksana.dev.rtsoft.ru>
From: Zang Roy-R61911 <r61911@freescale.com>
To: "Anton Vorontsov" <cbouatmailru@gmail.com>
Cc: Wood Scott-B07421 <B07421@freescale.com>, dedekind1@gmail.com,
	Lan Chunhe-B25806 <B25806@freescale.com>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, dwmw2@infradead.org,
	Gala Kumar-B11780 <B11780@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gVm9yb250c292
IFttYWlsdG86Y2JvdWF0bWFpbHJ1QGdtYWlsLmNvbV0NCj4gU2VudDogVGh1cnNkYXksIFNlcHRl
bWJlciAwOSwgMjAxMCAxOTo0MiBQTQ0KPiBUbzogWmFuZyBSb3ktUjYxOTExDQo+IENjOiBsaW51
eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgZHdtdzJAaW5mcmFkZWFkLm9yZzsgZGVkZWtpbmQx
QGdtYWlsLmNvbTsNCj4gYWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZzsgTGFuIENodW5oZS1CMjU4
MDY7IFdvb2QgU2NvdHQtQjA3NDIxOyBHYWxhIEt1bWFyLQ0KPiBCMTE3ODA7IGxpbnV4cHBjLWRl
dkBvemxhYnMub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMy8zXVtNVERdIFA0MDgwL210
ZDogRml4IHRoZSBmcmVlc2NhbGUgbGJjIGlzc3VlIHdpdGgNCj4gMzZiaXQgbW9kZQ0KPiANCj4g
T24gVGh1LCBTZXAgMDksIDIwMTAgYXQgMDY6MjA6MzJQTSArMDgwMCwgUm95IFphbmcgd3JvdGU6
DQo+IFsuLi5dDQo+ID4gIC8qKg0KPiA+ICsgKiBmc2xfbGJjX2FkZHIgLSBjb252ZXJ0IHRoZSBi
YXNlIGFkZHJlc3MNCj4gPiArICogQGFkZHJfYmFzZToJYmFzZSBhZGRyZXNzIG9mIHRoZSBtZW1v
cnkgYmFuaw0KPiA+ICsgKg0KPiA+ICsgKiBUaGlzIGZ1bmN0aW9uIGNvbnZlcnRzIGEgYmFzZSBh
ZGRyZXNzIG9mIGxiYyBpbnRvIHRoZSByaWdodCBmb3JtYXQgZm9yDQo+IHRoZSBCUg0KPiA+ICsg
KiByZWdpc3RlcnMuIElmIHRoZSBTT0MgaGFzIGVMQkMgdGhlbiBpdCByZXR1cm5zIDMyYml0IHBo
eXNpY2FsIGFkZHJlc3MNCj4gZWxzZQ0KPiA+ICsgKiBpdCByZXR1cm5zIDM0Yml0IHBoeXNpY2Fs
IGFkZHJlc3MgZm9yIGxvY2FsIGJ1cyhFeGFtcGxlOiBNUEM4NjQxKS4NCj4gPiArICovDQo+IA0K
PiBJdCByZXR1cm5zIDM0Yml0IHBoeXNpY2FsIGFkZHJlc3MgZW5jb2RlZCBpbiBhIDMyIGJpdCB3
b3JkLA0KPiByaWdodD8gDQpZZXMuDQoNCj5CZWNhdXNlLCBJSVJDLCAndW5zaWduZWQgaW50JyBp
cyBhbHdheXMgMzIgYml0Lg0KPiANCj4gV29ydGggbWVudGlvbmluZyB0aGlzIGZhY3QuDQpBZ3Jl
ZS4NClRoZSBjb21tZW50IGlzIGEgbGl0dGxlIGJpdCBjb25mdXNpbmcuIFdpbGwgdXBkYXRlLg0K
DQoNCj4gDQo+ID4gK3Vuc2lnbmVkIGludCBmc2xfbGJjX2FkZHIocGh5c19hZGRyX3QgYWRkcl9i
YXNlKQ0KPiA+ICt7DQo+ID4gKwl2b2lkICpkZXY7DQo+IA0KPiBzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wOw0KPiANCj4gPiArCWludCBjb21wYXRpYmxlOw0KPiA+ICsNCj4gPiArCWRldiA9IGZzbF9s
YmNfY3RybF9kZXYtPmRldi0+b2Zfbm9kZTsNCj4gPiArCWNvbXBhdGlibGUgPSBvZl9kZXZpY2Vf
aXNfY29tcGF0aWJsZShkZXYsICJmc2wsZWxiYyIpOw0KPiA+ICsNCj4gPiArCWlmIChjb21wYXRp
YmxlKQ0KPiA+ICsJCXJldHVybiBhZGRyX2Jhc2UgJiAweGZmZmY4MDAwOw0KPiA+ICsJZWxzZQ0K
PiA+ICsJCXJldHVybiAoYWRkcl9iYXNlICYgMHgwZmZmZjgwMDB1bGwpDQo+ID4gKwkJCXwgKChh
ZGRyX2Jhc2UgJiAweDMwMDAwMDAwMHVsbCkgPj4gMTkpOw0KPiA+ICt9DQo+ID4gK0VYUE9SVF9T
WU1CT0woZnNsX2xiY19hZGRyKTsNCj4gDQo+IEFsbW9zdCBwZXJmZWN0LiBJJ20gbm90IHN1cmUg
aWYgJ3Vuc2lnbmVkIGludCcgaXMgdGVjaG5pY2FsbHkNCj4gY29ycmVjdCByZXR1cm4gdHlwZSBm
b3IgdGhpcyBmdW5jdGlvbiB0aG91Z2guIEkgZ3Vlc3MgaXQgc2hvdWxkDQo+IGJlIHUzMi4NCj4g
DQpXaGF0IGlzIHRoZSBkaWZmZXJlbnQgZm9yIHVuc2lnbmVkIGludCBhbmQgdTMyPyBJIHRoaW5r
IHRoZXkgYXJlIHNhbWUuDQoNCg0KPiBBbHNvLCB0aGUgZnVuY3Rpb24gbWF5IGJlIGEgYml0IG1v
cmUgdW5kZXJzdGFuZGFibGUgYW5kIHNob3J0ZXI6DQo+IA0KPiB1MzIgZnNsX2xiY19hZGRyKHBo
eXNfYWRkcl90IGFkZHIpDQo+IHsNCj4gCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBmc2xfbGJj
X2N0cmxfZGV2LT5kZXYtPm9mX25vZGU7DQo+IAl1MzIgYWRkcmwgPSBhZGRyICYgMHhmZmZmODAw
MDsNCmlmIGFkZHIgaXMgMzQgYml0IGxvbmcsIGlzIHRoaXMgY29ycmVjdD8NClRoYW5rcy4NClJv
eQ0K
