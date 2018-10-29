Received: from mail-sn1nam01on0048.outbound.protection.outlook.com
 ([104.47.32.48] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHGlK-0000G6-AS
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2018 23:16:00 +0000
From: "Grandbois, Brett" <brett.grandbois@opengear.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for SPI boot flash access
 for AMD Family 16h
Date: Mon, 29 Oct 2018 23:15:42 +0000
Message-ID: <a6edf985-0d15-5b2b-a6ba-9cfcd7a67836@opengear.com>
References: <20181016005726.26813-1-brett.grandbois@opengear.com>
 <20181027173945.241e87b2@bbrezillon>
In-Reply-To: <20181027173945.241e87b2@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3B3E0CEBDE0434B83B7EF663A3C5FC6@namprd15.prod.outlook.com>
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

DQpPbiAyOC8xMC8xOCAxOjM5IGFtLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6DQo+IEhpIEJyZXR0
LA0KPg0KPiBPbiBUdWUsIDE2IE9jdCAyMDE4IDAwOjU3OjQxICswMDAwDQo+ICJHcmFuZGJvaXMs
IEJyZXR0IjxicmV0dC5ncmFuZGJvaXNAb3BlbmdlYXIuY29tPiAgd3JvdGU6DQo+DQo+PiBBZGQg
c3VwcG9ydCB0byBleHBvc2UgdGhlIFNQSSBib290IGZsYXNoIG9uIEFNRCBGYW1pbHkgMTZoIENQ
VXMgYXMgYQ0KPj4gc3RhbmRhcmQgbXRkIGRldmljZSB0byBnaXZlIHVzZXJzcGFjZSBCSU9TIHVw
ZGF0ZXJzIGdyZWF0ZXIgZmVhdHVyZQ0KPj4gc3VwcG9ydC4gIFRoZSBCSU9TIGFuZCBLZXJuZWwg
RGV2ZWxvcGVyJ3MgR3VpZGUgcmVmZXJzIHRvIHRoaXMgYXMgdGhlDQo+PiAnU1BJIFJPTScgY29u
dHJvbGxlciBhbmQgc28gdGhlIGRyaXZlciBmb2xsb3dzIHRoYXQgbmFtaW5nIGNvbnZlbnRpb24N
Cj4+IGZvciBjb25zaXN0ZW5jeS4NCj4+DQo+IFdlJ3JlIGN1cnJlbnRseSB0cnlpbmcgdG8gY29u
dmVydCBzcGktbm9yIGNvbnRyb2xsZXIgZHJpdmVycyB0byB0aGUNCj4gc3BpLW1lbSBpbnRlcmZh
Y2UgWzFdLiBDYW4geW91IGxvb2sgYXQgdGhpcyBuZXcgaW50ZXJmYWNlIGFuZCB0ZWxsIG1lIGlm
DQo+IHlvdSdkIGJlIGFibGUgdG8gaW1wbGVtZW50IGl0PyBJZiB0aGF0J3Mgbm90IHBvc3NpYmxl
LCB0aGVuIEknZCBwcmVmZXINCj4gdG8gaGF2ZSB0aGlzIGRyaXZlciBpbXBsZW1lbnQgdGhlIG10
ZF9pbmZvIGludGVyZmFjZSBkaXJlY3RseS4NCg0KU28gZnJvbSBnb2luZyBvdmVyIHRoZSBzcGkt
bWVtIGludGVyZmFjZSBpdCBsb29rcyBsaWtlIHRoZSBpbnRlbnQgaXMgZm9yIHRoZXNlIHNvcnRz
IG9mIGRldmljZXMgdG8gYmUgYSBzdGFuZGFyZCBzcGlfY29udHJvbGxlciB3aXRoIG9ubHkgbWVt
X29wcyBkZWZpbmVkIGFuZCB0aGUgdHJhbnNmZXIvX29uZS9fb25lX21lc3NhZ2UgbGVmdCBhcyBO
VUxMPyAgSXMgdGhhdCBjb3JyZWN0PyAgVGhhdCdzIGEgYml0IG9mIGEgcGl2b3QgZnJvbSBob3cg
aXQncyBjdXJyZW50bHkgZG9uZSAoaXQncyBjb25jZXB0dWFsbHkgc2ltaWxhciB0byB0aGUgaW50
ZWwtc3BpLXBjaSBkcml2ZXIgc28gSSB3YXMgZm9sbG93aW5nIHRoYXQpIGJ1dCBJIHNob3VsZCBi
ZSBhYmxlIHRvIHJld29yayBpdCB0byB0aGUgbmV3IGludGVyZmFjZS4gIFRoaXMgdGhlbiBsaXZl
cyB1bmRlciBkcml2ZXJzL3NwaSBhbmQgdGh1cyBzaG91bGQgYmUgc3VibWl0dGVkIHRvIGxpbnV4
LXNwaT8NCiAgIA0KDQo+IFRoYW5rcywNCj4NCj4gQm9yaXMNCj4NCj4gWzFdaHR0cHM6Ly9uYTAx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZlbGl4
aXIuYm9vdGxpbi5jb20lMkZsaW51eCUyRmxhdGVzdCUyRnNvdXJjZSUyRmluY2x1ZGUlMkZsaW51
eCUyRnNwaSUyRnNwaS1tZW0uaCUyM0wxODUmYW1wO2RhdGE9MDIlN0MwMSU3Q2JyZXR0LmdyYW5k
Ym9pcyU0MG9wZW5nZWFyLmNvbSU3Q2Y1MjQ0ZDkyODc1MzRlYTg0YjEyMDhkNjNjMjI2ZThmJTdD
YTYyNTFjMjZkMjFmNDE2NGEyMjUxZjRlYWViZjVmOWElN0MwJTdDMCU3QzYzNjc2MjUxNTkxNTA5
NzQwNSZhbXA7c2RhdGE9OWJyR0lYY0VjTFF1NWc2V3hhWFQ2NjElMkJqZjhVTE1RUXBWZFh6STM2
TlRVJTNEJmFtcDtyZXNlcnZlZD0wDQo=
