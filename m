Received: from skedge03.snt-world.com ([91.208.41.68])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOepS-0005GK-Fb
 for linux-mtd@lists.infradead.org; Mon, 19 Nov 2018 08:22:48 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
CC: Boris Brezillon <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v5 3/9] spi: Add a driver for the Freescale/NXP QuadSPI
 controller
Date: Mon, 19 Nov 2018 08:22:32 +0000
Message-ID: <902ca455-9d3e-7371-fb8e-2b5cb7ad87cb@kontron.de>
References: <1542116782-13118-1-git-send-email-frieder.schrempf@kontron.de>
 <1542116782-13118-4-git-send-email-frieder.schrempf@kontron.de>
 <VI1PR04MB572679944542ED6A438FD2FB99C30@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <ce9cbfc0-3257-f117-aa21-cdee068579ce@kontron.de>
 <65577d13-b17d-8f69-313c-01d23240d1d9@kontron.de>
 <VI1PR04MB572664063A0E237D2EB7203A99C30@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <eb4b79be-c12b-16e7-e1dd-86a157cfdc7d@kontron.de>
 <VI1PR04MB57265222E26C013D5D9C009B99DC0@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <3e9aa917-cf3a-cf0e-8516-4e73d30eb2a1@kontron.de>
 <20181115141252.52a5b32d@bbrezillon>
 <11f45245-efc4-f1cf-3ead-578a5ca4bf29@kontron.de>
 <VI1PR04MB572631414249F5941C1646D999DD0@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <2aa180a6-c369-0e84-b6a2-085b0a539695@kontron.de>
 <VI1PR04MB572668C2BCD132D06E53E98C99DD0@VI1PR04MB5726.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB572668C2BCD132D06E53E98C99DD0@VI1PR04MB5726.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2142125E240AD243ABB8DEBC2C4FDEE4@snt-world.com>
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

SGkgWW9nZXNoLA0KDQpPbiAxNi4xMS4xOCAxMToxMiwgWW9nZXNoIE5hcmF5YW4gR2F1ciB3cm90
ZToNCj4gSGkgRnJpZWRlciwNCj4gDQo+IEkgaGF2ZSBvbmUgbW9yZSBjb21tZW50LCB5b3UgbWln
aHQgYWRkIHRoYXQgYWxzbyBpbiB5b3VyIG5leHQgdmVyc2lvbjoNCj4gDQo+IEZ1bmMgZnNsX3Fz
cGlfaW52YWxpZGF0ZSgpIG5lZWRzIHRvIGJlIGNhbGxlZCBmb3IgY2FzZSB3aGVuIHdlIGFyZSBw
ZXJmb3JtaW5nIEVyYXNlL1dyaXRlIG9mIGRhdGEgZnJvbSBJUCBidXMNCj4gDQo+IFNvIGluc3Rl
YWQgb2YgY2FsbGluZyB0aGlzIGZvciBjYWxsIGNhc2UNCj4gICAgICAgICAgICAgICAgICBxc3Bp
X3dyaXRlbChxLCBRVUFEU1BJX1JCQ1RfV01SS19NQVNLIHwNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBRVUFEU1BJX1JCQ1RfUlhCUkRfVVNFSVBTLCBiYXNlICsgUVVBRFNQSV9SQkNU
KTsNCj4gDQo+ICAgICAgICAgICAgICAgICAgaWYgKG9wLT5kYXRhLm5ieXRlcyAmJiBvcC0+ZGF0
YS5kaXIgPT0gU1BJX01FTV9EQVRBX09VVCkNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIGZz
bF9xc3BpX2ZpbGxfdHhmaWZvKHEsIG9wKTsNCj4gDQo+ICAgICAgICAgICAgICAgICAgZXJyID0g
ZnNsX3FzcGlfZG9fb3AocSwgb3ApOw0KPiAgICAgICAgICB9DQo+IA0KPiAgICAgICAgICAvKiBJ
bnZhbGlkYXRlIHRoZSBkYXRhIGluIHRoZSBBSEIgYnVmZmVyLiAqLw0KPiAgICAgICAgICBmc2xf
cXNwaV9pbnZhbGlkYXRlKHEpOw0KPiANCj4gICAgICAgICAgbXV0ZXhfdW5sb2NrKCZxLT5sb2Nr
KTsNCj4gDQo+IFlvdSBjYW4gY2FsbCB0aGF0IG9ubHkgZm9yIGNhc2Ugb2Ygd3JpdGUvZXJhc2Ug
b3BlcmF0aW9uDQo+IAkvKiBJbnZhbGlkYXRlIHRoZSBkYXRhIGluIHRoZSBBSEIgYnVmZmVyLiAq
Lw0KPiAJaWYgKG9wLT5kYXRhLm5ieXRlcyAmJiBvcC0+ZGF0YS5kaXIgPT0gU1BJX01FTV9EQVRB
X09VVCkNCj4gCSAgICAgICAgZnNsX3FzcGlfaW52YWxpZGF0ZShxKTsNCg0KVGhhbmsgeW91IGZv
ciB5b3VyIGZlZWRiYWNrLg0KDQpVbmZvcnR1bmF0ZWx5IEkgY2FuJ3QgYmUgc3VyZSBpZiB0aGUg
Y3VycmVudCBvcGVyYXRpb24gaXMgcmVhbGx5IGEgd3JpdGUgDQpvciBlcmFzZSBvcGVyYXRpb24g
b24gdGhlIGNoaXAgYXMgdGhpcyBpbmZvcm1hdGlvbiBpcyBoaWRkZW4gYmVoaW5kIHRoZSANClNQ
SSBtZW0gbGF5ZXIuDQoNCkFsc28gaW4gY2FzZSBvZiBTUEkgTkFORCB0aGUgQUhCIGJ1ZmZlciBu
ZWVkcyB0byBiZSBpbnZhbGlkYXRlZCBhcyBzb29uIA0KYXMgaXRzIGNvbnRlbnQgd29uJ3QgbWF0
Y2ggdGhlIG9uLWNoaXAgcGFnZSBidWZmZXIgYW55bW9yZS4gVGhpcyBpcyANCnVzdWFsbHkgdGhl
IGNhc2Ugd2hlbiBhIHBhZ2UgcmVhZCBvcCBpcyBpc3N1ZWQuDQoNClNvIGN1cnJlbnRseSBpdCBp
cyBub3QgcG9zc2libGUgdG8gZWFzaWx5IGRldGVybWluZSB3aGVuIHRvIGludmFsaWRhdGUgDQp0
aGUgQUhCIGJ1ZmZlciBhbmQgdGhpcyBpcyB3aHkgSSBkbyBpdCBhZnRlciBlYWNoIG9wLg0KSW4g
dGhlIGZ1dHVyZSB3ZSBtaWdodCBhZGQgc29tZSBob29rIGluIHRoZSBTUEkgbWVtIGxheWVyIHRv
IGltcHJvdmUgDQp0aGlzIHNpdHVhdGlvbi4NCg0KQWxzbywgcGxlYXNlIGtlZXAgZGlzY3Vzc2lv
bnMgbGlrZSB0aGlzIG9uIHRoZSBtYWlsaW5nIGxpc3QsIHNvIG90aGVycyANCmNhbiBjb21tZW50
IGlmIG5lY2Vzc2FyeS4NCg0KVGhhbmtzLA0KRnJpZWRlcg==
