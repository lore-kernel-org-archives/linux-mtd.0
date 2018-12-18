Received: from mail-sn1nam04on0616.outbound.protection.outlook.com
 ([2a01:111:f400:fe4c::616]
 helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZ81D-0006Wz-Ci
 for linux-mtd@lists.infradead.org; Tue, 18 Dec 2018 05:34:13 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Boris Brezillon <boris.brezillon@bootlin.com>, "robh@kernel.org"
 <robh@kernel.org>, "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>, Michal Simek
 <michals@xilinx.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: RE: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Date: Tue, 18 Dec 2018 05:33:53 +0000
Message-ID: <MWHPR02MB26237B932D7F3CCEE0476FE0AFBD0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <MWHPR02MB26234433484426F333E9B60EAFDC0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181118204324.373ca9cc@bbrezillon>
 <MWHPR02MB2623AAEC160F40F061E23194AFD80@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181119090246.49060019@bbrezillon>
 <BN6PR02MB2610C7D048E4A192E041BE14AFD90@BN6PR02MB2610.namprd02.prod.outlook.com>
 <20181120120244.7d2442b5@bbrezillon>	<20181120133624.3fa4742d@xps13>
 <MWHPR02MB26238A2271B33470ABFA1023AFD40@MWHPR02MB2623.namprd02.prod.outlook.com>
 <MWHPR02MB26239C2B2A7050310BEF1E9CAFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181212091135.1d0cc9a6@xps13>
 <MWHPR02MB26236CEF8A2110B20C825198AFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181212100931.149b0cac@xps13>
 <MWHPR02MB2623EDA15BE59304795F3034AFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181212141825.69711c57@xps13>
 <MWHPR02MB26235AE6567A06EF4C6362E6AFBC0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181217174114.24196d17@xps13>
In-Reply-To: <20181217174114.24196d17@xps13>
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

SGkgTWlxdWVsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pcXVl
bCBSYXluYWwgW21haWx0bzptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tXQ0KPiBTZW50OiBNb25k
YXksIERlY2VtYmVyIDE3LCAyMDE4IDEwOjExIFBNDQo+IFRvOiBOYWdhIFN1cmVzaGt1bWFyIFJl
bGxpIDxuYWdhc3VyZUB4aWxpbnguY29tPg0KPiBDYzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5i
cmV6aWxsb25AYm9vdGxpbi5jb20+OyByb2JoQGtlcm5lbC5vcmc7IHJpY2hhcmRAbm9kLmF0OyBs
aW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgbWFyZWsudmFzdXRAZ21haWwuY29tOyBs
aW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbmFnYXN1cmVzaDEyQGdtYWlsLmNvbTsg
TWljaGFsIFNpbWVrIDxtaWNoYWxzQHhpbGlueC5jb20+Ow0KPiBjb21wdXRlcnNmb3JwZWFjZUBn
bWFpbC5jb207IGR3bXcyQGluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogUmU6IFtMSU5VWCBQQVRD
SCB2MTIgMy8zXSBtdGQ6IHJhd25hbmQ6IGFyYXNhbjogQWRkIHN1cHBvcnQgZm9yIEFyYXNhbg0K
PiBOQU5EIEZsYXNoIENvbnRyb2xsZXINCj4gDQo+IEhpIE5hZ2EsDQo+IA0KPiBbLi4uXQ0KPiAN
Cj4gPiBJbnNlcnRlZCBiaXRlcnJvciBAIDQ4LzcNCj4gPiBTdWNjZXNzZnVsbHkgY29ycmVjdGVk
IDI1IGJpdCBlcnJvcnMgcGVyIHN1YnBhZ2UgSW5zZXJ0ZWQgYml0ZXJyb3IgQA0KPiA+IDUwLzcg
RUNDIGZhaWx1cmUsIGludmFsaWQgZGF0YSBkZXNwaXRlIHJlYWQgc3VjY2Vzcw0KPiA+IHJvb3RA
eGlsaW54LXpjMTc1MS1kYzItMjAxOF8xOn4jDQo+ID4NCj4gPiBCdXQgZXZlbiBpbiB0aGlzIGNh
c2UgYWxzbywgZHJpdmVyIGlzIHNheWluZyBFQ0MgZmFpbHVyZSBidXQgcmVhZCBzdWNjZXNzLg0K
PiA+IFRoYXQgbWVhbnMgY29udHJvbGxlciBpcyBhYmxlIHRvIGRldGVjdCBlcnJvcnMgb24gcmVh
ZCBwYWdlIHVwIHRvIDI0IGJpdCBvbmx5Lg0KPiA+IEFmdGVyIHRoYXQgdGhlcmUgaXMgbm8gd2F5
IHRvIHNheSB0byB0aGUgdXBwZXIgbGF5ZXJzIHRoYXQgdGhlIHBhZ2UgaXMgYmFkIGJlY2F1c2Ug
b2YgdGhlDQo+IGxpbWl0YXRpb24gaW4gdGhlIGNvbnRyb2xsZXIuDQo+IA0KPiBUaGlzIGlzIG1v
cmUgdGhhbiBhICJsaW1pdGF0aW9uIiwgdGhlIGRlc2lnbiBpcyBicm9rZW4uIEkgYW0gbm90IHN1
cmUgaG93IHRvIHN1cHBvcnQgc3VjaA0KPiBjb250cm9sbGVyLCBhbmQgSSBhbSBub3Qgc3VyZSBp
ZiB3ZSBldmVuIHdhbnQgdG8uDQoNClRoZSBudW1iZXIgb2YgZXJyb3JzIHRoYXQgYXJlIGNvcnJl
Y3RhYmxlIGlzIGxpbWl0ZWQgYnkgYSBwYXJhbWV0ZXIgJ3QnKHRvdGFsIG51bWJlciBvZiBlcnJv
cnMpLA0KSWYgdGhlcmUgaXMgYSBjb25kaXRpb24gdGhhdCB0aGUgbnVtYmVyIG9mIGVycm9ycyBn
cmVhdGVyIHRoYW4gJ3QnLCB0aGVuIHRoZSBjb250cm9sbGVyIHdvbid0IGJlIGFibGUgdG8gZGV0
ZWN0IHRoYXQuDQpJIGd1ZXNzIHRoaXMgY29uY2VwdCBpcyBzYW1lIGZvciBvdGhlciBjb250cm9s
bGVycyBhcyB3ZWxsLg0KSW4gQXJhc2FuIGl0IGlzIGxpbWl0ZWQgdG8gMjQtYml0Lg0KDQpFdmVu
LCBpbiBjYXNlIG9mIEhhbW1pbmcsIGl0IGlzIDEtYml0IGVycm9yIGNvcnJlY3Rpb24gYW5kIDIt
Yml0IGVycm9yIGRldGVjdGlvbi4NCldoYXQgd2lsbCBoYXBwZW4gaWYgdGhlcmUgYXJlIG11bHRp
cGxlIGVycm9ycyhncmVhdGVyIHRoYW4gMi1iaXQpPw0KDQpUaGFua3MsDQpOYWdhIFN1cmVzaGt1
bWFyIFJlbGxpDQo+IA0KPiA+IENvdWxkIHlvdSBwbGVhc2Ugc3VnZ2VzdCBhbnkgYWx0ZXJuYXRp
dmUgdG8gcmVwb3J0IHRoZSBlcnJvcnMgaW4gdGhhdCBjYXNlPw0KPiANCj4gU2hhbGwgd2Ugc3Vw
cG9ydCB0aGUgY29udHJvbGxlciB3aXRob3V0IHRoZSBodyBFQ0MgZW5naW5lPyBCb3JpcywgYW55
IHRob3VnaHRzPw0KPiANCj4gDQo+IFRoYW5rcywNCj4gTWlxdcOobA0K
