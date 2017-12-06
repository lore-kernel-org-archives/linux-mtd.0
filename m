Received: from mail-ve1eur01on0079.outbound.protection.outlook.com
 ([104.47.1.79] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMX3V-0004yD-NW
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 10:37:03 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: Scott Wood <oss@buserror.net>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
CC: "dedekind1@gmail.com" <dedekind1@gmail.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: RE: [PATCH] Documentation: binding: Update endianness usage
Date: Wed, 6 Dec 2017 10:35:26 +0000
Message-ID: <HE1PR04MB1241F1A70CDBA5A94D4D2CE597320@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <1511954855-8593-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <1512105209.10062.1.camel@buserror.net>
 <HE1PR04MB12414AFA5F8081730B89378497390@HE1PR04MB1241.eurprd04.prod.outlook.com>
 <1512165311.10062.3.camel@buserror.net>
 <HE1PR04MB1241226CD3B7ABD6D5FA2D91973C0@HE1PR04MB1241.eurprd04.prod.outlook.com>
 <1512441957.10062.6.camel@buserror.net>
 <HE1PR04MB1241ADD02E472BA492AE1C8F973D0@HE1PR04MB1241.eurprd04.prod.outlook.com>
 <1512504459.10062.9.camel@buserror.net>
In-Reply-To: <1512504459.10062.9.camel@buserror.net>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNjb3R0IFdvb2QgW21haWx0
bzpvc3NAYnVzZXJyb3IubmV0XQ0KPiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDA2LCAyMDE3
IDE6MzggQU0NCj4gVG86IFByYWJoYWthciBLdXNod2FoYSA8cHJhYmhha2FyLmt1c2h3YWhhQG54
cC5jb20+OyBsaW51eC0NCj4gbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnDQo+IENjOiBkZWRla2luZDFAZ21haWwuY29tOyBjb21wdXRlcnNmb3JwZWFj
ZUBnbWFpbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gRG9jdW1lbnRhdGlvbjogYmluZGlu
ZzogVXBkYXRlIGVuZGlhbm5lc3MgdXNhZ2UNCj4gDQo+IE9uIFR1ZSwgMjAxNy0xMi0wNSBhdCAw
OTo0NSArMDAwMCwgUHJhYmhha2FyIEt1c2h3YWhhIHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFNjb3R0IFdvb2QgW21haWx0bzpvc3NAYnVzZXJy
b3IubmV0XQ0KPiA+ID4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMDUsIDIwMTcgODoxNiBBTQ0K
PiA+ID4gVG86IFByYWJoYWthciBLdXNod2FoYSA8cHJhYmhha2FyLmt1c2h3YWhhQG54cC5jb20+
OyBsaW51eC0NCj4gPiA+IG10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZw0KPiA+ID4gQ2M6IGRlZGVraW5kMUBnbWFpbC5jb207IGNvbXB1dGVyc2ZvcnBl
YWNlQGdtYWlsLmNvbQ0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gRG9jdW1lbnRhdGlvbjog
YmluZGluZzogVXBkYXRlIGVuZGlhbm5lc3MgdXNhZ2UNCj4gPiA+DQo+ID4gPiBJIG5vdyBzZWUg
eW91ciBwYXRjaCB0byBvZl9mbGFzaF9wcm9iZS4uLiB3aGVyZSBpcyB0aGUgbm9uLUlGQy1zcGVj
aWZpYw0KPiA+ID4gYmluZGluZyB0aGF0IHNheXMgdGhlICpwYXJlbnQqIG9mIGEgQ0ZJIG5vZGUg
c2hvdWxkIGJlIGxvb2tlZCBhdCBmb3IgdGhpcz8NCj4gPiA+IFdoZXJlwqBpbiBnZW5lcmFsIGFy
ZSBlbmRpYW4gcHJvcGVydGllcyBrZXB0IGluIHRoZSBwYXJlbnQgb2YgdGhlIG5vZGUgd2l0aA0K
PiA+ID4gInJlZyI/wqDCoFRoZSByaWdodCBhbnN3ZXIgaXMgdG8gYWRkIGVuZGlhbm5lc3MgdG8g
bXRkLXBoeXNtYXAudHh0Lg0KPiA+ID4NCj4gPg0KPiA+IEZsYXNoZXMgYXJlIGFsd2F5cyBsaXR0
bGVyIGVuZGlhbi4NCj4gDQo+IFdlIHdvdWxkbid0IGJlIGhhdmluZyB0aGlzIGRpc2N1c3Npb24g
aWYgdGhhdCB3ZXJlIHRydWUuLi4gIFRoaXMgaXMgYWJvdXQgaG93DQo+IGl0IHByZXNlbnRzIHRv
IHRoZSBDUFUsIG5vdCBhYm91dCBob3cgdGhlIGFjdHVhbCBwaW5zIG9uIHRoZSBjaGlwIGFyZQ0K
PiBudW1iZXJlZC4NCj4gDQoNCkdvdCB5b3VyIHBvaW50IDopDQoNCj4gPiBJdCBpcyBiZWNhdXNl
IG9mIElGQyBjb250cm9sbGVyIGJlaGF2aW9yLCBlbmRpYW5uZXNzIGlzIHJlcXVpcmVkLg0KPiA+
IFNvIGFzIHBlciBteSB1bmRlcnN0YW5kaW5nLCB0aGlzIGluZm8gc2hvdWxkIGdvIGluIElGQyBi
aW5kaW5nLg0KPiANCj4gSWYgdGhlIGluZm8gc2hvdWxkIGdvIGluIHRoZSBJRkMgYmluZGluZyB3
aHkgaXMgdGhlIGNvZGUgaW4gYSBub24tSUZDLXNwZWNpZmljDQo+IHBsYWNlPw0KPiANCg0KTm93
IEkgdW5kZXJzdGFuZCB5b3VyIHBvaW50LiAgDQpTbyBJIHNob3VsZCBiZSBtb3ZpbmcgZW5kaWFu
bmVzcyBwcm9wZXJ0eSBkZXRhaWwgaW4gbXRkLXBoeXNtYXAudHh0LiANCg0KSXMgbXkgdW5kZXJz
dGFuZGluZyBjb3JyZWN0Pw0KDQotLXByYWJoYWthcg0KDQoNCg==
