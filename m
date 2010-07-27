Received: from mga14.intel.com ([143.182.124.37])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OdbIw-0000cE-VV
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 03:58:12 +0000
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Tue, 27 Jul 2010 11:58:03 +0800
Subject: RE: [PATCH 1/2]  [MTD] nand/denali.c: fixed all checkpatch errors
	in denali.c
Message-ID: <5D8008F58939784290FAB48F549751981D4E9692B4@shsmsx502.ccr.corp.intel.com>
References: <5D8008F58939784290FAB48F549751981D10A98E53@shsmsx502.ccr.corp.intel.com>
	<1280118596.14917.6.camel@localhost>
In-Reply-To: <1280118596.14917.6.camel@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "Yuan, Hang" <hang.yuan@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Woodhouse, David" <david.woodhouse@intel.com>, "Gao,
	Yunpeng" <yunpeng.gao@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

VGhhbmtzIGZvciB5b3VyIHJldmlldyBhbmQgY29tbWVudHMuDQpJIHNwbGl0IHRoaXMgcGF0Y2gg
dG8gYmUgNiBzbWFsbGVyIHBhdGNoZXMuIEkgd2lsbCBzZW5kIGl0IG91dCBhZnRlciB0aGlzIG1h
aWwuDQpCZWxvdyBhcmUgdGhlIHN1YmplY3RzIGZvciB0aGVzZSBzbWFsbGVyIHBhdGNoZXM6DQpb
UEFUQ0ggMS82XSBtdGQ6IGRlbmFsaS5jOiBjbGVhbiB1cCBhbGwgdGhlIHdoaXRlc3BhY2UgaW4g
dGhlIGVuZCBvZiBzb21lIGxpbmVzDQpbUEFUQ0ggMi82XSBtdGQ6IGRlbmFsaS5jOiBjbGVhbiB1
cCB3aGl0ZXNwYWNlIGluIGNvZGUgaW5kZW50DQpbUEFUQ0ggMy82XSBtdGQ6IGRlbmFsaS5jOiBm
aXhlZCBhbGwgb3BlbiBicmFjZSB7IGNoZWNrLXBhdGNoIGVycm9ycw0KW1BBVENIIDQvNl0gbXRk
OiBkZW5hbGkuYzogYWRkIGFuZCB1cGRhdGUgS0VSTl8gZmFjaWxpdHkgbGV2ZWwgaW4gcHJpbnRr
KCkNCltQQVRDSCA1LzZdIG10ZDogZGVuYWxpLmM6IGZpeCBhbGwgImxpbmUgb3ZlciA4MCBjaGFy
YWN0ZXJzIiB3YXJuaW5ncw0KW1BBVENIIDYvNl0gbXRkOiBkZW5hbGkuYzogZml4IHJlc2VydmVk
IGFsbCBjaGVjay1wYXRjaCBlcnJvcnMNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBBcnRlbSBCaXR5dXRza2l5IFttYWlsdG86ZGVkZWtpbmQxQGdtYWlsLmNvbV0NCj4g
U2VudDogTW9uZGF5LCBKdWx5IDI2LCAyMDEwIDEyOjMwIFBNDQo+IFRvOiBEb25nLCBDaHVhbnhp
YW8NCj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOyBXb29kaG91c2UsIERhdmlk
OyBHYW8sIFl1bnBlbmc7IFl1YW4sIEhhbmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIFtN
VERdIG5hbmQvZGVuYWxpLmM6IGZpeGVkIGFsbCBjaGVja3BhdGNoIGVycm9ycyBpbiBkZW5hbGku
Yw0KPiANCj4gT24gVGh1LCAyMDEwLTA3LTIyIGF0IDAxOjMyICswODAwLCBEb25nLCBDaHVhbnhp
YW8gd3JvdGU6DQo+ID4gSGkgYWxsDQo+ID4gVGhlcmUgYXJlIDIgcGF0Y2hlcyB0byBmaXggY2hl
Y2twYXRjaCBlcnJvcnMgaW4gbmFuZC9kZW5hbGkuYyBhbmQgbmFuZC9kZW5hbGkuaC4NCj4gSGVy
ZSBpcyB0aGUgZmlyc3Qgb25lLg0KPiA+IFNvIGNhbiB0aGlzIHBhdGNoIGJlIGFjY2VwdGVkIG9y
IHNvbWVib2R5IGdpdmUgbWUgc29tZSBjb21tZW50cz8gSSB3aWxsIGJlDQo+IHZlcnkgZ2xhZCB0
byBmaXggaXQuDQo+ID4gVGhhbmtzIGZvciB5b3VyIHRpbWUgdG8gcmV2aWV3LiBMb29raW5nIGZv
cndhcmQgYW55IHJlc3BvbnNlLg0KPiA+DQo+ID4gRnJvbSA5ZGZmNzAyNzI1NDM3NDMzZjY0MTI3
NjBhOWRmNDkyYmU2NmJlNmUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiA+IEZyb206IENo
dWFueGlhbyBEb25nIDxjaHVhbnhpYW8uZG9uZ0BpbnRlbC5jb20+DQo+ID4gRGF0ZTogVGh1LCAy
MiBKdWwgMjAxMCAwMDo1MzozNSArMDgwMA0KPiA+IFN1YmplY3Q6IFtQQVRDSCAxLzJdIFtNVERd
IG5hbmQvZGVuYWxpLmM6IGZpeGVkIGNoZWNrcGF0Y2ggZXJyb3JzIGluIGRlbmFsaS5jDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVhbnhpYW8gRG9uZyA8Y2h1YW54aWFvLmRvbmdAaW50ZWwu
Y29tPg0KPiANCj4gVGhpcyBwYXRjaCBpcyB0b28gaHVnZSBhbmQgbm90IHJldmlld2FibGUuIFBs
ZWFzZSwgc3BsaXQgaXQgb24gc2V2ZXJhbA0KPiBzbWFsbGVyIHBhdGNoZXMuDQo+IA0KPiAtLQ0K
PiBCZXN0IFJlZ2FyZHMsDQo+IEFydGVtIEJpdHl1dHNraXkgKNCQ0YDRgtGR0Lwg0JHQuNGC0Y7R
htC60LjQuSkNCg0K
