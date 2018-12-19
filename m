Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZfW0-000871-1I
 for linux-mtd@lists.infradead.org; Wed, 19 Dec 2018 17:20:32 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, "Zoltan Szubbocsev
 (zszubbocsev)" <zszubbocsev@micron.com>, Boris Brezillon
 <bbrezillon@kernel.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Richard
 Weinberger" <richard@nod.at>, "tglx@linutronix.de" <tglx@linutronix.de>
Subject: RE: [EXT] Re: [PATCH V1] mtd: core: Micron SLC NAND filling block
Date: Wed, 19 Dec 2018 17:19:43 +0000
Message-ID: <BYAPR08MB45331E5653451102C61BAC54DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533AC4A07E48EC37576C060DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20181219141732.3e09bdc9@bbrezillon>
 <SN6PR08MB502421AE43E6824C3CC5C1E4CBBE0@SN6PR08MB5024.namprd08.prod.outlook.com>
 <20181219151751.74931b39@xps13>
In-Reply-To: <20181219151751.74931b39@xps13>
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

SGksIEJvcmlzIGFuZCBNaXF1ZWwNClRoYW5rcyBmb3IgeW91ciBlbWFpbC4NClNpbmNlIHRoZSBw
YXRjaCBpcyBiYXNlZCBvbiB2NC4yIHdoaWNoIGRvZXNuJ3Qgc2VwYXJhdGUgc3BlY2lmaWMgTkFO
RCB2ZW5kb3INCmRyaXZlciBpbnRvIHZlbmRvciBzcGVjaWZpYyBjaGlwIGRyaXZlciBmaWxlLiBJ
IHdpbGwgcmViYXNlIG15IHBhdGNoIHRvIGxhdGVzdCBsaW51eCBrZXJuZWwsDQphbmQgaW1wbGVt
ZW50ICBhIHNwZWNpZmljIGhvb2sgZnVuY2l0b24gaW4gdGhlIG5hbmRfbWljcm9uLmMgYXMgeW91
IHN1Z2dlc3RlZC4NCkFmdGVyIHRlc3Rpbmcgd2VsbCwgeW91IHdpbGwgc2VlIHRoZSB2ZXJzaW9u
IDIuDQoNCi8vQmVhbiBIdW8NCg0KPj4gQm9yaXMsDQo+Pg0KPj4gQXJlIHRoZXJlICBub24gVUJJ
L1VCSUZTIGNhc2VzPw0KPj4gQ2FuIHlvdSBwbGVhc2UgYmUgc3BlY2lmaWM/DQo+DQo+VUJJIGlz
IG9uZSB1c2VyIG9mIE1URC4NCj4NCj5XaGF0IGFib3V0IGRpcmVjdCBhY2Nlc3NlcyB0byBNVEQg
ZGV2aWNlcz8gU3F1YXNoZnM/DQo+DQo+SW4gYW55IGNhc2UsIEkgZG9uJ3QgdGhpbmsgaXQgaXMg
ZXhhZ2dlcmF0ZWQgdG8gc2F5IHRoYXQgTGludXggaGFzIGJlZW4gYnVpbHQgb24NCj4ibGF5ZXJp
bmciLiBUaGlzIGlzc3VlIGlzIE5BTkQgY2hpcCBzcGVjaWZpYywgaGVuY2UgbXVzdCBiZSBoYW5k
bGVkIGF0IHRoZQ0KPk5BTkQgY29yZSBsZXZlbC4gSW4gdGhlIE5BTkQgZXJhc2UgcGF0aCBJIHdv
dWxkIGxpa2UgdG8gc2VlIGEgY2FsbCB0byBhIHZlbmRvcg0KPnNwZWNpZmljIGhvb2sgdGhhdDoN
Cj4xLyBjaGVja3MgaWYgdGhlIHBhcnQgaXMgYWZmZWN0ZWQgYnkgY29tcGFyaW5nIGl0cyBJRCB0
byBhIGxpc3QsIDIvIGlmIHllcywgY2hlY2tzIGlmDQo+dGhlIGJsb2NrIG11c3QgYmUgZmlsbGVk
IGJlZm9yZSBlcmFzaW5nLg0KPg0KPlRoZSBsb2dpYyBvZiAxLyBhbmQgMi8gc2hvdWxkIHByb2Jh
Ymx5IHJlc2lkZSBpbg0KPmRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9uLmMNCj4NCj4N
Cj5UaGFua3MsDQo+TWlxdcOobA0K
