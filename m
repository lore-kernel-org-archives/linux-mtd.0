Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE001.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Or5fh-0003O1-Mq
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 09:01:26 +0000
Received: from mail80-tx2 (localhost.localdomain [127.0.0.1])	by
	mail80-tx2-R.bigfish.com (Postfix) with ESMTP id 8148077846F	for
	<linux-mtd@lists.infradead.org>; Thu,  2 Sep 2010 09:01:22 +0000 (UTC)
Received: from TX2EHSMHS032.bigfish.com (unknown [10.9.14.238])	by
	mail80-tx2.bigfish.com (Postfix) with ESMTP id D20F1E8051	for
	<linux-mtd@lists.infradead.org>; Thu,  2 Sep 2010 09:01:21 +0000 (UTC)
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by az33egw02.freescale.net (8.14.3/8.14.3) with ESMTP id
	o828vXlV013363	for
	<linux-mtd@lists.infradead.org>; Thu, 2 Sep 2010 01:57:33 -0700 (MST)
Received: from zmy16exm20.fsl.freescale.net (zmy16exm20.ap.freescale.net
	[10.211.3.23])	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id
	o829CFbC005522	for <linux-mtd@lists.infradead.org>;
	Thu, 2 Sep 2010 04:12:16 -0500 (CDT)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Subject: RE: [spi-devel-general] [PATCH v2 3/6] mtd: m25p80: add support to
	parse the SPI flash's partitions
Date: Thu, 2 Sep 2010 16:57:30 +0800
Message-ID: <73839B4A0818E747864426270AC332C30561B6E8@zmy16exm20.fsl.freescale.net>
In-Reply-To: <20100810160157.GA24553@oksana.dev.rtsoft.ru>
References: <AANLkTik9cy+at2n28U+Mut4RD6_cJ9uRZzjf+H86d-rp@mail.gmail.com>
	<796604.30863.qm@web180307.mail.gq1.yahoo.com>
	<AANLkTi=FGf9gbWDkO4qs01Z+qkip+Zm11=Jc4wHu3G8b@mail.gmail.com>
	<OF0D24DC16.E1FE65D2-ONC125777B.002E544A-C125777B.002EA7C2@transmode.se>
	<AANLkTinYYTj+dR6ckPoShHKZTUmENEA1O-DYP9mjnWrs@mail.gmail.com>
	<20100810160157.GA24553@oksana.dev.rtsoft.ru>
From: Hu Mingkai-B21284 <B21284@freescale.com>
To: "Anton Vorontsov" <cbouatmailru@gmail.com>,
	"Grant Likely" <grant.likely@secretlab.ca>
Cc: Joakim Tjernlund <joakim.tjernlund@transmode.se>,
	David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	spi-devel-general@lists.sourceforge.net,
	Gala Kumar-B11780 <B11780@freescale.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gVm9yb250c292
IFttYWlsdG86Y2JvdWF0bWFpbHJ1QGdtYWlsLmNvbV0NCj4gU2VudDogV2VkbmVzZGF5LCBBdWd1
c3QgMTEsIDIwMTAgMTI6MDIgQU0NCj4gVG86IEdyYW50IExpa2VseQ0KPiBDYzogSm9ha2ltIFRq
ZXJubHVuZDsgR2FsYSBLdW1hci1CMTE3ODA7IERhdmlkIEJyb3duZWxsOyBsaW51eC0NCj4gbXRk
QGxpc3RzLmluZnJhZGVhZC5vcmc7IHNwaS1kZXZlbC1nZW5lcmFsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldDsgSHUgTWluZ2thaS0NCj4gQjIxMjg0OyBEYXZpZCBXb29kaG91c2UNCj4gU3ViamVjdDog
UmU6IFtzcGktZGV2ZWwtZ2VuZXJhbF0gW1BBVENIIHYyIDMvNl0gbXRkOiBtMjVwODA6IGFkZCBz
dXBwb3J0IHRvDQo+IHBhcnNlIHRoZSBTUEkgZmxhc2gncyBwYXJ0aXRpb25zDQo+IA0KPiBPbiBU
dWUsIEF1ZyAxMCwgMjAxMCBhdCAwODo1Njo0MkFNIC0wNjAwLCBHcmFudCBMaWtlbHkgd3JvdGU6
DQo+IFsuLi5dDQo+ID4gVGhlIHN1Z2dlc3Rpb24gaGFzIGJlZW4gcmFpc2VkIHRvIHVzZSBzb21l
dGhpbmcgbGlrZSBidXMgbm90aWZpZXJzIHRvDQo+ID4gZ2V0IGEgaG9vayBvbnRvIHRoZSBkZXZp
Y2UgcmVnaXN0cmF0aW9uIGJlZm9yZSB0aGUgZHJpdmVyIGlzIHByb2JlZCBzbw0KPiA+IHRoYXQg
dGhlIHBsYXRmb3JtX2RhdGEgY2FuIGJlIHRyYW5zbGF0ZWQgaW4gYW4gc2VwYXJhdGUgY2h1Y2sg
b2YgY29kZSwNCj4gPiBidXQgZG93biB0aGF0IHBhdGggbGllcyBpbnNhbml0eS4gIFRoZXJlIGFy
ZSBhbGwga2luZHMgb2Ygb3JkZXJpbmcNCj4gPiBpc3N1ZXMgKGxpa2UgbWFraW5nIHN1cmUgdGhl
IHRyYW5zbGF0aW9uIGNvZGUgaXMgY2FsbGVkIGJlZm9yZSB0aGUNCj4gPiBkcml2ZXIgcHJvYmUg
Y29kZSksIGFuZCBpdCBpcyBhIGxvdCBvZiBjb21wbGV4aXR5IGZvciB3aGF0IGlzIHJlYWxseSBh
DQo+ID4gc2ltcGxlIHRoaW5nLg0KPiANCj4gVGhlcmUncyBhbm90aGVyIG9wdGlvbjogcGxhdGZv
cm0gZGF0YSBoYW5kbGVycyAodGhleSBjb3VsZCBiZSBjaGFpbmVkLCBpbiBjYXNlDQo+IGlmIHdl
IHdhbnQgdG8gdXNlIHNldmVyYWwgbWV0aG9kcyBvZiBvYnRhaW5pbmcgcGxhdGZvcm0gZGF0YSwg
aS5lLiAidHJ5IHJhdyBkYXRhLA0KPiB0aGVuIEFDUEksIHRoZW4gT0YiKS4NCj4gDQo+IFNlZSBp
bmNsdWRlL2xpbnV4L3NwaS9tbWNfc3BpLmggKG1tY19zcGlfZ2V0X3BkYXRhKSBhbmQNCj4gZHJp
dmVycy9tbWMvaG9zdC9vZl9tbWNfc3BpLmMuDQo+IA0KPiBJIHRoaW5rIHdlIG1pZ2h0IGltcGxl
bWVudCBzb21lIGxpYnJhcnkgdG8gbWFrZSB0aGVzZSBoYW5kbGVycyBtb3JlIGdlbmVyaWMsIGJ1
dA0KPiBldmVuIHRoZSBzaW1wbGUgaW1wbGVtZW50YXRpb24gYXMgaW4gbW1jX3NwaSBjYXNlIHBy
b3ZlcyB0aGF0IGl0IGlzIHBvc3NpYmxlIHRvDQo+IHNlcGFyYXRlIE9GL0FDUEkvRE1JL3doYXRl
dmVyIGhhbmRsaW5nIGZyb20gdGhlIGdlbmVyaWMgY29kZS4NCj4gDQoNCkl0J3MgYWxzbyBhIGdv
b2Qgc3VnZ2VzdGlvbiwgSSdsbCB0cnkgaXQuDQoNClRoYW5rcywNCk1pbmdrYWkNCg==
