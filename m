Received: from mail-eopbgr30078.outbound.protection.outlook.com ([40.107.3.78]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMs66-00073o-4W
 for linux-mtd@lists.infradead.org; Thu, 07 Dec 2017 09:04:08 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [RFC 03/10] mtd: spi-nor: Configure read latency for read commands
Date: Thu, 7 Dec 2017 09:03:37 +0000
Message-ID: <HE1PR04MB12417B07F03276B164F2DF4C97330@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <1512548141-3319-4-git-send-email-prabhakar.kushwaha@nxp.com>
 <1f97ee81-a027-c5cf-04a4-cb29bc6a7ba4@wedev4u.fr>
In-Reply-To: <1f97ee81-a027-c5cf-04a4-cb29bc6a7ba4@wedev4u.fr>
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

SGkgQ3lyaWxsZSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDeXJp
bGxlIFBpdGNoZW4gW21haWx0bzpjeXJpbGxlLnBpdGNoZW5Ad2VkZXY0dS5mcl0NCj4gU2VudDog
V2VkbmVzZGF5LCBEZWNlbWJlciAwNiwgMjAxNyA0OjE2IFBNDQo+IFRvOiBQcmFiaGFrYXIgS3Vz
aHdhaGEgPHByYWJoYWthci5rdXNod2FoYUBueHAuY29tPjsgbGludXgtDQo+IG10ZEBsaXN0cy5p
bmZyYWRlYWQub3JnDQo+IENjOiBib3Jpcy5icmV6aWxsb25AZnJlZS1lbGVjdHJvbnMuY29tOyBj
b21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb207DQo+IGRlZGVraW5kMUBnbWFpbC5jb20NCj4gU3Vi
amVjdDogUmU6IFtSRkMgMDMvMTBdIG10ZDogc3BpLW5vcjogQ29uZmlndXJlIHJlYWQgbGF0ZW5j
eSBmb3IgcmVhZCBjb21tYW5kcw0KPiANCj4gSGkgUHJhYmhha2FyLA0KPiANCj4gTGUgMDYvMTIv
MjAxNyDDoCAwOToxNSwgUHJhYmhha2FyIEt1c2h3YWhhIGEgw6ljcml0wqA6DQo+ID4gQWxsIHJl
YWQgY29tbWFuZHMgaGF2ZSByZWFkIGxhdGVuY3kgKGR1bW15IGN5Y2xlKS4gSXQgZGVmaW5lcyBh
DQo+ID4gcGVyaW9kIGJldHdlZW4gdGhlIGVuZCBvZiBhZGRyZXNzIG9yIG1vZGUgYW5kIHRoZSBi
ZWdpbm5pbmcgb2YNCj4gPiByZWFkIGRhdGEgcmV0dXJuaW5nIHRvIHRoZSBob3N0LiBGbGFzaGVz
IGhhdmUgZGVmYXVsdCByZWFkIGxhdGVuY3kuDQo+ID4gVGhpcyBkZWZhdWx0IHJlYWQgbGF0ZW5j
eSBtYXkgbm90IG1hdGNoIHdpdGggdGhlIHNlbGVjdGVkIGxhdGVuY3kuDQo+ID4NCj4gDQo+IFRo
ZSByZWFkIGxhdGVuY3kgaXMgZWl0aGVyIGhhcmQtY29kZWQgKDAgbW9kZSBjeWNsZXMgYW5kIDgg
d2FpdC1zdGF0ZXMpDQo+IGZvciBGYXN0IFJlYWQgMS0xLXogb3BlcmF0aW9ucyBvciByZWFkIGZy
b20gdGhlIEJhc2ljIEZsYXNoIFBhcmFtZXRlcg0KPiBUYWJsZSBwcm9ncmFtbWVkIGFzIG9uZSBt
YW5kYXRvcnkgdGFibGUgb2YgdGhlIEpFREVDIEpFU0QxMjZCDQo+IHNwZWNpZmljYXRpb24gd2hl
biBTRkRQIHRhYmxlcyBhcmUgc3VwcG9ydGVkIGJ5IHRoZSBtZW1vcnkgcGFydHMuDQo+IA0KPiBJ
biBhbGwgY2FzZXMsIHRob3NlIHZhbHVlcyBhcmUgZmFjdG9yeSBzZXR0aW5ncy4gSSBkb24ndCB1
bmRlcnN0YW5kIHdoeQ0KPiB0aGVyZSB3b3VsZCBiZSBhIG1pc21hdGNoIGJldHdlZW4gdGhlIGRl
ZmF1bHQgcmVhZCBsYXRlbmN5IGFuZCB0aGUNCj4gc2VsZWN0ZWQgbGF0ZW5jeSBpZiBhbnkgYm9v
dC1sb2FkZXIgb3IgZmxhc2ggcHJvZ3JhbW1pbmcgdG9vbCBoYXMgZXZlcg0KPiBjaGFuZ2VkIHRo
ZSBtZW1vcnkgc2V0dGluZ3MuDQo+IA0KPiBDb3VsZCB5b3UgcGxlYXNlIGV4cGxhaW4gaW4gd2hp
Y2ggY2FzZSB5b3UgZm91bmQgYSBtaXNtYXRjaCA/DQo+IA0KSWYgd2Ugb25seSB0YWxrIGFib3V0
IDEtMS16IHRoYW4geWVzLiBUaGUgRGVmYXVsdCB2YWx1ZSBpcyBhbHdheXMgIjAvOCIuIA0KDQpU
aGlzIG1pc21hdGNoIHN0YXJ0IHRvIGNvbWUgd2hlbiB3ZSBzZWUgMS0yLTIgb3IgMS00LTQgcmVh
ZCBwcm90b2NvbHMuDQpGb3IgZWcuIFMyNUZMMTI4Uy9TMjVGTDI1NlMgZGVmYXVsdCBkdW1teSBs
YXRlbmN5IGlzIDAwLiBXaGljaCBpcyA0IGZvciAgMS0yLTIgb3IgMS00LTQuDQoNCkkgc2F3IHlv
dXIgcmV2aWV3IGNvbW1lbnRzIG9mIHVzaW5nIFNGRFAgZm9yIDEtMi0yIGFuZCAxLTQtNC4gDQpM
ZXQgbWUgZXhwbG9yZSB0aGlzIHBhdGggaWYgd2UgcmVhbGx5IHJlcXVpcmUgdGhpcyBwYXRjaC4u
DQoNClRoYW5rcyBmb3IgZ3VpZGFuY2UhIQ0KDQotLXBrDQoNCg0KDQoNCg==
