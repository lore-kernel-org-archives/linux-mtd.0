Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=DB3EHSOBE004.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OtGfb-0002jT-Iu
	for linux-mtd@lists.infradead.org; Wed, 08 Sep 2010 09:10:20 +0000
Received: from mail62-db3 (localhost.localdomain [127.0.0.1])	by
	mail62-db3-R.bigfish.com (Postfix) with ESMTP id 4D46468193	for
	<linux-mtd@lists.infradead.org>; Wed,  8 Sep 2010 09:10:18 +0000 (UTC)
Received: from DB3EHSMHS003.bigfish.com (unknown [10.3.81.242])	by
	mail62-db3.bigfish.com (Postfix) with ESMTP id EF28F7B004C	for
	<linux-mtd@lists.infradead.org>; Wed,  8 Sep 2010 09:10:17 +0000 (UTC)
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by az33egw02.freescale.net (8.14.3/8.14.3) with ESMTP id
	o889AEl7006892	for
	<linux-mtd@lists.infradead.org>; Wed, 8 Sep 2010 02:10:14 -0700 (MST)
Received: from zch01exm23.fsl.freescale.net (zch01exm23.ap.freescale.net
	[10.192.129.207])	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP
	id o889OBAf029986	for <linux-mtd@lists.infradead.org>;
	Wed, 8 Sep 2010 04:24:12 -0500 (CDT)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Subject: RE: [PATCH] mtd: fix the build warning for fsl_upm.c
Date: Wed, 8 Sep 2010 17:10:09 +0800
Message-ID: <3850A844E6A3854C827AC5C0BEC7B60A1B3C0F@zch01exm23.fsl.freescale.net>
In-Reply-To: <1283935588.2979.62.camel@localhost>
References: <1283917561-13930-1-git-send-email-tie-fei.zang@freescale.com>
	<1283935588.2979.62.camel@localhost>
From: Zang Roy-R61911 <r61911@freescale.com>
To: <dedekind1@gmail.com>
Cc: dwmw2@infradead.org, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org, cbouatmailru@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJ0ZW0gQml0eXV0c2tp
eSBbbWFpbHRvOmRlZGVraW5kMUBnbWFpbC5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVt
YmVyIDA4LCAyMDEwIDE2OjQ2IFBNDQo+IFRvOiBaYW5nIFJveS1SNjE5MTENCj4gQ2M6IGxpbnV4
LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOyBha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnOw0KPiBk
d213MkBpbmZyYWRlYWQub3JnOyBjYm91YXRtYWlscnVAZ21haWwuY29tDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIG10ZDogZml4IHRoZSBidWlsZCB3YXJuaW5nIGZvciBmc2xfdXBtLmMNCj4gDQo+
IE9uIFdlZCwgMjAxMC0wOS0wOCBhdCAxMTo0NiArMDgwMCwgUm95IFphbmcgd3JvdGU6DQo+ID4g
Rml4IHRoZSBidWlsZCB3YXJuaW5nOg0KPiA+DQo+ID4gZHJpdmVycy9tdGQvbmFuZC9mc2xfdXBt
LmM6IEluIGZ1bmN0aW9uICdmdW5fY2hpcF9pbml0JzoNCj4gPiBkcml2ZXJzL210ZC9uYW5kL2Zz
bF91cG0uYzoxOTA6IHdhcm5pbmc6IGZvcm1hdCAnJXgnIGV4cGVjdHMgdHlwZSAndW5zaWduZWQN
Cj4gaW50JywgYnV0IGFyZ3VtZW50IDMgaGFzIHR5cGUgJ3Jlc291cmNlX3NpemVfdCcNCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFJveSBaYW5nIDx0aWUtZmVpLnphbmdAZnJlZXNjYWxlLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9mc2xfdXBtLmMgfCAgICA0ICsrLS0NCj4g
PiAgMSBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9mc2xfdXBtLmMgYi9kcml2ZXJzL210
ZC9uYW5kL2ZzbF91cG0uYw0KPiA+IGluZGV4IDRlZmY4YjIuLmRjNjFlY2YgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9mc2xfdXBtLmMNCj4gPiArKysgYi9kcml2ZXJzL210ZC9u
YW5kL2ZzbF91cG0uYw0KPiA+IEBAIC0xODYsOCArMTg2LDggQEAgc3RhdGljIGludCBfX2Rldmlu
aXQgZnVuX2NoaXBfaW5pdChzdHJ1Y3QgZnNsX3VwbV9uYW5kDQo+ICpmdW4sDQo+ID4gIAlpZiAo
IWZsYXNoX25wKQ0KPiA+ICAJCXJldHVybiAtRU5PREVWOw0KPiA+DQo+ID4gLQlmdW4tPm10ZC5u
YW1lID0ga2FzcHJpbnRmKEdGUF9LRVJORUwsICIleC4lcyIsIGlvX3Jlcy0+c3RhcnQsDQo+ID4g
LQkJCQkgIGZsYXNoX25wLT5uYW1lKTsNCj4gPiArCWZ1bi0+bXRkLm5hbWUgPSBrYXNwcmludGYo
R0ZQX0tFUk5FTCwgIiV4LiVzIiwNCj4gPiArCQkJKHVuc2lnbmVkIGludClpb19yZXMtPnN0YXJ0
LCBmbGFzaF9ucC0+bmFtZSk7DQo+IA0KPiBObywgeW91IHNob3VsZCB1c2UgJWxseCBhbmQgKHU2
NCkgY2FzdCBzaW5jZSByZXNvdXJzZV9zaXplX3QgY2FuIGJlDQo+IGFueXRoaW5nIHVwIHRvIHU2
NC4NCllvdSBhcmUgcmlnaHQuIHVuc2lnbmVkIGxvbmcgbG9uZyBzaG91bGQgYmUgdXNlZC4NCnVw
ZGF0ZWQuDQpUaGFua3MuDQpSb3kNCg==
