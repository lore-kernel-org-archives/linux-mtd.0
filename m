Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRf5i-0003Vl-MR
 for linux-mtd@lists.infradead.org; Tue, 27 Nov 2018 15:16:00 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
CC: Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [RFC] mtd: spinand: Add initial support for Toshiba TC58CVG2S0F
Date: Tue, 27 Nov 2018 15:15:46 +0000
Message-ID: <cf7e8ac3-ec1c-e1d2-4d8f-7879330bcced@kontron.de>
References: <20181127135923.13787-1-peron.clem@gmail.com>
 <df074de0-c9cc-9e6b-19b6-140319ff5f86@kontron.de>
 <CAJiuCcfq8K+_oBufnXEsu+8Usyvv60zA3ATXD_uGsn+2__RpNg@mail.gmail.com>
 <CAJiuCcc6qOj4oNiZ=NMm0+XQz-U-tdZ9jRTgOPLDV=ftfS6WmA@mail.gmail.com>
In-Reply-To: <CAJiuCcc6qOj4oNiZ=NMm0+XQz-U-tdZ9jRTgOPLDV=ftfS6WmA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBED29C5EF0FF6469E5DE7DE25DA4FE6@snt-world.com>
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

T24gMjcuMTEuMTggMTY6MDcsIENsw6ltZW50IFDDqXJvbiB3cm90ZToNCj4gT24gVHVlLCAyNyBO
b3YgMjAxOCBhdCAxNTo1OSwgQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gSGkgRnJpZWRlciwNCj4+DQo+PiBPbiBUdWUsIDI3IE5vdiAyMDE4IGF0
IDE1OjQ3LCBTY2hyZW1wZiBGcmllZGVyDQo+PiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRl
PiB3cm90ZToNCj4+Pg0KPj4+IEhlbGxvIENsw6ltZW50LA0KPj4+DQo+Pj4gT24gMjcuMTEuMTgg
MTQ6NTksIENsw6ltZW50IFDDqXJvbiB3cm90ZToNCj4+Pj4gQWRkIHN1cHBvcnQgZm9yIFRvc2hp
YmEgY2hpcCBUQzU4Q1ZHMlMwRg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQ
w6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPg0KPj4+PiAtLS0NCj4+Pj4NCj4+Pj4gSGksDQo+
Pj4+DQo+Pj4+IFRoYW5rcyBhIGxvdCBmb3IgYWRkaW5nIHRoaXMgZnJhbWV3b3JrIHRvIExpbnV4
IGl0J3MgdmVyeSBuaWNlIGFuZCBlYXN5IHRvIHJlYWQuDQo+Pj4+DQo+Pj4+IFRoaXMgaXMgbXkg
Zmlyc3QgU1BJIE5hbmQvTmFuZCBib2FyZCBzbyBJJ20gc3RpbGwgdW5mYW1pbGlhciB3aXRoIHRo
b3NlIEJCTSBhbmQgT09CIGZlYXR1cmVzLg0KPj4+Pg0KPj4+PiBJbiB0aGUgRUNDIHN0YXR1cyBt
YXliZSBJIHNob3VsZCByZXR1cm4gdGhlIE1heGltdW0gQml0IEZsaXAgQ291bnQgKHBhZ2UgMzQg
b2YgdGhlIERTKSBsaWtlIGl0J3MgZG9uZSBmb3IgTWFjcm9uaXguDQo+Pj4+DQo+Pj4+IERhdGFz
aGVldCBjb3VsZCBiZSBmb3VuZCBoZXJlOiBodHRwczovL21lZGlhLmRpZ2lrZXkuY29tL3BkZi9E
YXRhJTIwU2hlZXRzL1Rvc2hpYmElMjBQREZzL1RDNThDVkcyUzBIeEFJeF9SZXYxLjFfMjAxNi0x
MS0wOC5wZGYNCj4+Pj4NCj4+Pj4NCj4+Pj4gQWxzbyB0aGlzIGhhcyBub3QgYmVlbiBmdWxseSB0
ZXN0ZWQgYW5kIHVudGVzdGVkIHdpdGggYSBRdWFkU1BJIGNvbnRyb2xsZXIuDQo+Pj4NCj4+PiBJ
J20gYWZyYWlkIHRoZXJlIGlzIGEgYmlnIG92ZXJsYXAgYmV0d2VlbiB5b3VyIHBhdGNoIGFuZCB3
aGF0IEkgcG9zdGVkDQo+Pj4gc29tZSBkYXlzIGFnby4gU2VlIGhlcmU6IFBhdGNod29yayBbMV0g
b3IgbGludXgtbmV4dCBbMl0uDQo+Pj4NCj4+PiBQbGVhc2UgaGF2ZSBhIGxvb2sgYXQgbXkgcGF0
Y2ggYW5kIHRlc3QgaXQgd2l0aCB5b3VyIGhhcmR3YXJlLiBZb3Ugc2VlbQ0KPj4+IHRvIHVzZSB0
aGUgc2FtZSBjaGlwIGFzIEkgYW0gKGV4Y2VwdCBmb3IgdGhlIGxhc3QgbGV0dGVyIGluIHRoZSBw
YXJ0DQo+Pj4gbnVtYmVyLCB3aG9zZSBtZWFuaW5nIEkgZG9uJ3Qga25vdykuDQo+Pg0KPj4gVGhh
bmtzIGZvciBwb2ludGluZyB0aGF0LA0KPj4NCj4+IEknbSBub3QgYSBsaW51eC1tdGQgc3Vic2Ny
aWJlciBjb3VsZCB5b3UgcmVwbHkgYW5kIGFkZCBteSBlLW1haWwgdG8geW91ciBwYXRjaCA/DQo+
IE9yIG1heWJlIGFzIGl0IGhhcyBhbHJlYWR5IGJlZW4gbWVyZ2VkIG1heWJlIEkgc2hvdWxkIHdy
aXRlIGEgbmV3DQo+IGUtbWFpbCB3aXRoIG15IHJlbWFyayBubyA/DQoNCkhtLCBJJ20gbm90IHN1
cmUuIEkgaGF2ZSBzZW50IGEgY29weSBvZiB0aGUgb3JpZ2luYWwgcGF0Y2ggdG8geW91LiBJIA0K
Z3Vlc3MgeW91IGNhbiBzdGlsbCByZXBseSB3aXRoIHlvdXIgY29tbWVudHMgYW5kIHdlIHdpbGwg
c2VlIGhvdyB0byBkZWFsIA0Kd2l0aCB0aGVtLg0KDQpJZiB0aGVyZSBhcmUgYW55IGlzc3Vlcywg
cGxlYXNlIGxldCB1cyBrbm93IHNvIHdlIGNhbiBhcHBseSBmaXhlcyBvbiB0b3AgDQpvZiB0aGUg
Y3VycmVudCBwYXRjaC4NCg0KVGhhbmtzLA0KRnJpZWRlcg==
