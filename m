Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUwfK-0004wo-8C
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 11:15:39 +0000
In-Reply-To: <OFA7BCC382.7C5EA8B7-ONC1257CAD.002CA0C1-C1257CAD.002EAA92@LocalDomain>
References: <1396287151.4857.50.camel@mars>	
 <OFA78F5CB9.63C292B4-ONC1257CAC.006FBDC4-C1257CAC.0070B588@transmode.se>
 <1396303460.4857.111.camel@mars>
 <OFA7BCC382.7C5EA8B7-ONC1257CAD.002CA0C1-C1257CAD.002EAA92@LocalDomain>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Message-ID: <OFCD64B0EF.BC0E327D-ONC1257CAD.003CE517-C1257CAD.003DCE3D@transmode.se>
Date: Tue, 1 Apr 2014 13:15:04 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Cc: Marius Achilles <M.Achilles@phytec.de>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Christoph Fritz <chf.fritz@googlemail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sm9ha2ltIFRqZXJubHVuZC9UcmFuc21vZGUgd3JvdGUgb24gMjAxNC8wNC8wMSAxMDoyOTo0MzoN
Cj4gDQo+IENocmlzdG9waCBGcml0eiA8Y2hmLmZyaXR6QGdvb2dsZW1haWwuY29tPiB3cm90ZSBv
biAyMDE0LzA0LzAxIDAwOjA0OjIwOg0KPiA+IA0KPiA+IE9uIE1vbiwgMjAxNC0wMy0zMSBhdCAy
MjozMSArMDIwMCwgSm9ha2ltIFRqZXJubHVuZCB3cm90ZToNCj4gPiA+IE5vIHdheSwgZGlzYWJs
aW5nIGVyYXNlIHN1c3BlbmQgd2lsbCBjYXVzZSBzZXZlcmUgbGF0ZW5jaWVzIGZvciANCnJlYWQv
d3JpdGUgDQo+ID4gPiBvcHMuDQo+ID4gDQo+ID4gSGVyZSBvbiBhIG14MzUgaXQncyBub3QgcmVh
bGx5IHNldmVyZS4NCj4gDQo+IFRoZXJlIGhhcyBiZWVuIGNvbXBsYWludHMgaW4gdGhlIHBhc3Qg
d2l0aCBubyBlcmFzZSBzdXNwZW5kLg0KPiBZb3UgZ2V0IGRlbGF5cyBjb25zaWRlcmluZyB0aGF0
IGFuIGVyYXNlIHRha2VzIGMuYSAxIHNlayBzbw0KPiBvbmNlIHlvdSBnZXQgaW50byBhIHN0YXRl
IHdoZXJlIEdDIGlzIGVyYXNpbmcgbG90cyBvZiBibG9ja3MgYW5kIG90aGVyDQo+IHByb2dzIHdh
bnRzIHJlYWQvd3JpdGUgeW91IHdpbGwgbm90aWNlLg0KPiANCj4gPiANCj4gPiA+IFRoZSBkb2N1
bWVudCBtZW50aW9ucyBvdGhlciB3YXlzIHRvIGdldCBhcm91bmQgdGhpcyBwcm9ibGVtLCBJIA0K
c3VnZ2VzdCB5b3UgDQo+ID4gPiBleHBsb3JlDQo+ID4gPiB0aGVzZSBmaXJzdC4NCj4gPiANCj4g
PiBBbHJlYWR5IHRyaWVkIHRoZSDigJwweEZG4oCdIGR1bW15IHdyaXRlIGN5Y2xlIHN1Z2dlc3Rp
b24sIHNob3VsZCBoYXZlDQo+ID4gbWVudGlvbmVkIHRoYXQuDQo+IA0KPiBPSywgYnV0IG9uZSBt
b3JlIHdvcmthcm91bmQodGhlIHVkZWxheSBwYXJ0KSBpcyByZXF1aXJlZCwgcmlnaHQ/DQoNClRo
ZXJlIHNvbWV0aGluZyBvZGQgd2l0aCB0aGUgcGF0Y2hlcyBpbiB0aGUgbWVudGlvbmVkIGRvYy4N
CjEpICJSZXNvbHZpbmcgRVJBU0UgU1VTUEVORCBIYW5ndXBzIiB0b3VjaGVzIHRoZSBzYW1lIGNv
ZGUgYXMNCjIpICJFUkFTRSBTVVNQRU5EIEZvbGxvd2luZyBFUkFTRSBSRVNVTUUiDQoNCjEpIHNh
eXMgdG8gYWRkIHdyaXRlKDB4ZmYpIGFuZCAyKSBhZGRzIGEgdWRlbGF5DQoNCldoYXQgc2hvdWxk
IGl0IGJlLCBib3RoPyBpbiB3aGF0IG9yZGVyPw0KDQpJIHN1c3BlY3QgdGhhdCBhbnkgd3JpdGUo
MHhmZikgY2FuIGJlIHRoZXJlIHVuY29uZGl0aW9uYWxseSwgcHJvdmlkZWQgdGhhdCANCnRoZSBj
bWQwMDAxIHNwZWMgYWxsb3dzIGl0Lg0KVGhlIGRlbGF5IGNvdWxkIGJlIGEgcXVpcmsgZGVmYXVs
dCB0byAwDQoNCiBKb2NrZQ0KDQogSm9ja2UNCg==
