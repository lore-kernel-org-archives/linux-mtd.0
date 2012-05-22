Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWq1B-0000wu-BY
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 14:24:58 +0000
From: Johan Gunnarsson <johan.gunnarsson@axis.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Tue, 22 May 2012 16:24:47 +0200
Subject: RE: [PATCH 2/2] mtd: nand: use hrtimer to measure timeout in
 nand_wait{_ready, }
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7534B668719@xmail3.se.axis.com>
References: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
 <1337589758-8775-3-git-send-email-johan.gunnarsson@axis.com>
 <1337673190.2483.115.camel@sauron.fi.intel.com>
 <A612847CFE53224C91B23E3A5B48BAC7534B129D18@xmail3.se.axis.com>
 <1337682328.2483.144.camel@sauron.fi.intel.com>
In-Reply-To: <1337682328.2483.144.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jesper Nilsson <jespern@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJ0ZW0gQml0eXV0c2tp
eSBbbWFpbHRvOmRlZGVraW5kMUBnbWFpbC5jb21dDQo+IFNlbnQ6IGRlbiAyMiBtYWogMjAxMiAx
MjoyNQ0KPiBUbzogSm9oYW4gR3VubmFyc3Nvbg0KPiBDYzogQnJpYW4gTm9ycmlzOyBsaW51eC1t
dGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgSmVzcGVyIE5pbHNzb24NCj4gU3ViamVjdDogUkU6IFtQ
QVRDSCAyLzJdIG10ZDogbmFuZDogdXNlIGhydGltZXIgdG8gbWVhc3VyZSB0aW1lb3V0IGluDQo+
IG5hbmRfd2FpdHtfcmVhZHksIH0NCj4gDQo+IE9uIFR1ZSwgMjAxMi0wNS0yMiBhdCAxMDo1MiAr
MDIwMCwgSm9oYW4gR3VubmFyc3NvbiB3cm90ZToNCj4gPiBOb3QgYW4gZXhwZXJ0IG9uIHRoZSBN
VEQgZnJhbWV3b3JrIC0tIGJ1dCBJIGJlbGlldmUgdGhlIDQwMCBjb21lcw0KPiBmcm9tDQo+ID4g
dGhlIGNvbW1lbnQgYWJvdmUgbmFuZF93YWl0KCk6ICJXYWl0IGZvciBjb21tYW5kIGRvbmUuIFRo
aXMgYXBwbGllcw0KPiB0bw0KPiA+IGVyYXNlIGFuZCBwcm9ncmFtIG9ubHkuIEVyYXNlIGNhbiB0
YWtlIHVwIHRvIDQwMG1zIGFuZCBwcm9ncmFtIHVwIHRvDQo+ID4gMjBtcyBhY2NvcmRpbmcgdG8g
Z2VuZXJhbCBOQU5EIGFuZCBTbWFydE1lZGlhIHNwZWNzLiINCj4gDQo+IE1vc3QgcHJvYmFibHkg
dGhpcyBsZWdhY3kgY2FuIGJlIGtpbGxlZCBhbG9uZyB3aXRoIHRoZSBJUEFRIGgxOTEwDQo+IGRy
aXZlciB5b3UgcG9pbnRlZC4gQnV0IGNvdWxkIHlvdSBwbGVhc2Ugc3RhcnQgd2l0aCBjbGVhbmlu
ZyB0aGVzZQ0KPiBmdW5jdGlvbnMgdXAgYW5kIHR1cm5pbmcgdGhlICIhY2hpcC0+ZGV2X3JlYWR5
KCkiIGNhc2UgaW50byBhIHNpbXBsZQ0KPiBtc2xlZXAoKSBvcg0KPiBtZGVsYXkoKSBmb3IgdGhl
IHBhbmljIGNhc2U/DQo+IA0KDQpJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCBjbGVhbi11cCBpcyBu
ZWVkZWQgaGVyZS4gQ2FuIHlvdSBwbGVhc2UgZWxhYm9yYXRlPw0KDQpUaGUgY2FzZSB5b3UgbWVu
dGlvbmVkIGVhcmxpZXIgZG9lc24ndCByZWFsbHkgbWFrZSBzZW5zZSB0byBtZToNCg0KaWYgKCFk
ZXZfcmVhZHkoKSkgew0KCW1zbGVlcCg0MDApOw0KCXJldHVybg0KfQ0KDQpNYWtpbmcgYSBzaW5n
bGUgY2FsbCB0byBkZXZfcmVhZHkoKSBhbmQgZ2l2aW5nIHVwIGlmIEZBTFNFIGlzIHdyb25nIElN
SE8sIHNpbmNlIHdlIHZlcnkgbXVjaCB3YW50IHRvIHBvbGwgZGV2X3JlYWR5KCkgYW5kIHJldHVy
biBhcyBzb29uIGFzIGl0IHR1cm5zIFRSVUUgKG9yIHRpbWVvdXQuKSBBc3N1bWluZyB5b3UgYWN0
dWFsbHkgbWVhbiAiaWYoIWRldl9yZWFkeSkpIHsiIGFsc28gZG9lc24ndCBtYWtlIHNlbnNlIHNp
bmNlIGNoZWNrcyBsaWtlIHRoYXQgZXhpc3RzIG9uIGFsbCBwYXRoIGxlYWRpbmcgdG8gbmFuZF93
YWl0X3JlYWR5KCkuDQo=
