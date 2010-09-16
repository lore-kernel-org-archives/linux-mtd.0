Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=DB3EHSOBE001.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OwAAe-0001e3-Tp
	for linux-mtd@lists.infradead.org; Thu, 16 Sep 2010 08:50:23 +0000
Received: from mail49-db3 (localhost.localdomain [127.0.0.1])	by
	mail49-db3-R.bigfish.com (Postfix) with ESMTP id A81F0C7832D	for
	<linux-mtd@lists.infradead.org>; Thu, 16 Sep 2010 08:50:16 +0000 (UTC)
Received: from DB3EHSMHS008.bigfish.com (unknown [10.3.81.251])	by
	mail49-db3.bigfish.com (Postfix) with ESMTP id 52458958050	for
	<linux-mtd@lists.infradead.org>; Thu, 16 Sep 2010 08:50:15 +0000 (UTC)
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by az33egw01.freescale.net (8.14.3/8.14.3) with ESMTP id
	o8G8oCDt011899	for
	<linux-mtd@lists.infradead.org>; Thu, 16 Sep 2010 01:50:12 -0700 (MST)
Received: from zch01exm23.fsl.freescale.net (zch01exm23.ap.freescale.net
	[10.192.129.207])	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP
	id o8G94PMo019440	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Sep 2010 04:04:26 -0500 (CDT)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Subject: RE: [PATCH 2/3 v3] P4080/mtd: Only make elbc nand driver detect nand
	flash partitions
Date: Thu, 16 Sep 2010 16:50:05 +0800
Message-ID: <3850A844E6A3854C827AC5C0BEC7B60A1FC6B8@zch01exm23.fsl.freescale.net>
In-Reply-To: <20100916082141.GA10978@oksana.dev.rtsoft.ru>
References: <1284619284-23614-1-git-send-email-tie-fei.zang@freescale.com>
	<1284619284-23614-2-git-send-email-tie-fei.zang@freescale.com>
	<20100916082141.GA10978@oksana.dev.rtsoft.ru>
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
bWJlciAxNiwgMjAxMCAxNjoyMiBQTQ0KPiBUbzogWmFuZyBSb3ktUjYxOTExDQo+IENjOiBsaW51
eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgZHdtdzJAaW5mcmFkZWFkLm9yZzsgZGVkZWtpbmQx
QGdtYWlsLmNvbTsNCj4gYWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZzsgTGFuIENodW5oZS1CMjU4
MDY7IFdvb2QgU2NvdHQtQjA3NDIxOyBHYWxhIEt1bWFyLQ0KPiBCMTE3ODA7IGxpbnV4cHBjLWRl
dkBvemxhYnMub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8zIHYzXSBQNDA4MC9tdGQ6IE9u
bHkgbWFrZSBlbGJjIG5hbmQgZHJpdmVyIGRldGVjdCBuYW5kDQo+IGZsYXNoIHBhcnRpdGlvbnMN
Cj4gDQo+IE9uIFRodSwgU2VwIDE2LCAyMDEwIGF0IDAyOjQxOjIzUE0gKzA4MDAsIFJveSBaYW5n
IHdyb3RlOg0KPiBbLi4uXQ0KPiA+IC1zdGF0aWMgaW50IF9fZGV2aW5pdCBmc2xfZWxiY19jaGlw
X3Byb2JlKHN0cnVjdCBmc2xfZWxiY19jdHJsICpjdHJsLA0KPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkNCj4gPiArLyoN
Cj4gPiArICogQ3VycmVudGx5IG9ubHkgb25lIGVsYmMgcHJvYmUgaXMgc3VwcG9ydGVkLg0KPiA+
ICsgKi8NCj4gPiArc3RhdGljIGludCBfX2RldmluaXQgZnNsX2VsYmNfbmFuZF9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpDQo+ID4gIHsNCj4gPiAtICAgICBzdHJ1Y3QgZnNsX2xi
Y19yZWdzIF9faW9tZW0gKmxiYyA9IGN0cmwtPnJlZ3M7DQo+ID4gKyAgICAgc3RydWN0IGZzbF9s
YmNfcmVncyBfX2lvbWVtICpsYmM7DQo+ID4gICAgICAgc3RydWN0IGZzbF9lbGJjX210ZCAqcHJp
djsNCj4gPiAgICAgICBzdHJ1Y3QgcmVzb3VyY2UgcmVzOw0KPiA+ICsgICAgIHN0cnVjdCBmc2xf
ZWxiY19mY21fY3RybCAqZWxiY19mY21fY3RybCA9IE5VTEw7DQo+IFsuLi5dDQo+ID4gLSAgICAg
Y3RybC0+Y2hpcHNbYmFua10gPSBwcml2Ow0KPiA+ICsgICAgIGlmIChmc2xfbGJjX2N0cmxfZGV2
LT5uYW5kID09IE5VTEwpIHsNCj4gPiArICAgICAgICAgICAgIGVsYmNfZmNtX2N0cmwgPSBremFs
bG9jKHNpemVvZigqZWxiY19mY21fY3RybCksIEdGUF9LRVJORUwpOw0KPiA+ICsgICAgICAgICAg
ICAgaWYgKCFlbGJjX2ZjbV9jdHJsKSB7DQo+IFsuLi5dDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gZXJyOw0KPiA+ICsgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgICAgICAgZnNs
X2xiY19jdHJsX2Rldi0+bmFuZCA9IGVsYmNfZmNtX2N0cmw7DQo+ID4gKyAgICAgfQ0KPiA+ICsN
Cj4gPiArICAgICBlbGJjX2ZjbV9jdHJsLT5jaGlwc1tiYW5rXSA9IHByaXY7DQo+IA0KPiBBZ2Fp
biwgdGhpcyB3aWxsIG9vcHMgb24gdGhlIHNlY29uZCBwcm9iZS4NCldoeT8NCg0KPiBBbmQgeW91
IHN0aWxsIGRvbid0DQo+IGxvY2sgZnNsX2xiY19jdHJsX2Rldi0+bmFuZCBkdXJpbmcgY2hlY2st
dGhlbi1hc3NpZ25tZW50LCBzbw0KPiB3aXRoIHBhcmFsbGVsIHByb2JpbmcgdGhlcmUgd2lsbCBi
ZSBhIHJhY2UuIDotKA0KPiANCj4gV2UgZG8gaGF2ZSBib2FyZHMgd2l0aCBzZXZlcmFsIE5BTkQg
Y2hpcHMgKGUuZy4NCj4gYXJjaC9wb3dlcnBjL2Jvb3QvZHRzL21wYzg2MTBfaHBjZC5kdHMpLCBz
byB0aGVzZSBpc3N1ZXMNCj4gYXJlIGFsbCBsZWdpdGltYXRlLg0KT0suIEkgY2FuIGFkZCBhIG11
dGV4IGhlcmUuDQpUaGFua3MuDQpSb3kNCg0K
