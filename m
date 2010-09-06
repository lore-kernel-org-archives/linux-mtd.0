Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OsTe9-0006Dv-Lx
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 04:49:34 +0000
Received: from mail180-tx2 (localhost.localdomain [127.0.0.1])	by
	mail180-tx2-R.bigfish.com (Postfix) with ESMTP id 7C9B411401DC	for
	<linux-mtd@lists.infradead.org>; Mon,  6 Sep 2010 04:49:31 +0000 (UTC)
Received: from TX2EHSMHS046.bigfish.com (unknown [10.9.14.254])	by
	mail180-tx2.bigfish.com (Postfix) with ESMTP id 4FEA0BA004E	for
	<linux-mtd@lists.infradead.org>; Mon,  6 Sep 2010 04:49:31 +0000 (UTC)
Received: from az33smr02.freescale.net (az33smr02.freescale.net
	[10.64.34.200])	by az33egw02.freescale.net (8.14.3/8.14.3) with ESMTP
	id o864nJdH019167	for <linux-mtd@lists.infradead.org>;
	Sun, 5 Sep 2010 21:49:20 -0700 (MST)
Received: from zch01exm23.fsl.freescale.net (zch01exm23.ap.freescale.net
	[10.192.129.207])	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP
	id o864nPtj018373	for <linux-mtd@lists.infradead.org>;
	Sun, 5 Sep 2010 23:49:25 -0500 (CDT)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Subject: RE: [PATCH 2/3][MTD] P4080/nand: Only make elbc nand driver detect
	nand flash partitions
Date: Mon, 6 Sep 2010 12:49:17 +0800
Message-ID: <3850A844E6A3854C827AC5C0BEC7B60A1B37B0@zch01exm23.fsl.freescale.net>
In-Reply-To: <20100903114357.GC11847@oksana.dev.rtsoft.ru>
References: <1281063096-26598-1-git-send-email-tie-fei.zang@freescale.com>
	<1281063096-26598-2-git-send-email-tie-fei.zang@freescale.com>
	<20100903114357.GC11847@oksana.dev.rtsoft.ru>
From: Zang Roy-R61911 <r61911@freescale.com>
To: "Anton Vorontsov" <cbouatmailru@gmail.com>
Cc: Wood Scott-B07421 <B07421@freescale.com>,
	Lan Chunhe-B25806 <B25806@freescale.com>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, Gala Kumar-B11780 <B11780@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gVm9yb250c292
IFttYWlsdG86Y2JvdWF0bWFpbHJ1QGdtYWlsLmNvbV0NCj4gU2VudDogRnJpZGF5LCBTZXB0ZW1i
ZXIgMDMsIDIwMTAgMTk6NDQgUE0NCj4gVG86IFphbmcgUm95LVI2MTkxMQ0KPiBDYzogbGludXgt
bXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IExhbiBDaHVuaGUtQjI1ODA2OyBsaW51eHBwYy1kZXZA
b3psYWJzLm9yZzsNCj4gYWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZzsgR2FsYSBLdW1hci1CMTE3
ODA7IFdvb2QgU2NvdHQtQjA3NDIxDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8zXVtNVERdIFA0
MDgwL25hbmQ6IE9ubHkgbWFrZSBlbGJjIG5hbmQgZHJpdmVyIGRldGVjdA0KPiBuYW5kIGZsYXNo
IHBhcnRpdGlvbnMNCj4gDQo+IE9uIEZyaSwgQXVnIDA2LCAyMDEwIGF0IDEwOjUxOjM1QU0gKzA4
MDAsIFJveSBaYW5nIHdyb3RlOg0KPiBbLi4uXQ0KPiA+DQo+ID4gK3N0YXRpYyBzdHJ1Y3QgZnNs
X2VsYmNfZmNtX2N0cmwgKmVsYmNfZmNtX2N0cmw7DQo+ID4gKw0KPiANCj4gQXJlIHlvdSBzdXJl
IHRoYXQgeW91IHdhbnQgaXQgYXMgYSBnbG9iYWwgdmFyPyBBIGJpdCBzY2FyeSBjaGFuZ2UuDQo+
IA0KPiBPaCwgeW91IHByb2JhYmx5IGRvbid0IG5lZWQgaXQsIGFzIHlvdSBjYW4gZ2V0IGl0IGZy
b20NCj4gZnNsX2xiY19jdHJsX2Rldi0+bmFuZD8NCkdldCBpdCBmb3JtIGZzbF9sYmNfY3RybF9k
ZXYtPm5hbmQgb3IgYXNzaWduIGl0IHRvIGZzbF9sYmNfY3RybF9kZXYtPm5hbmQgaW4gcHJvYmU/
DQpUaGFua3MuDQpSb3kNCg0K
