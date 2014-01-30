Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8y4M-0004SO-I1
 for linux-mtd@lists.infradead.org; Thu, 30 Jan 2014 20:18:39 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: RE: [PATCH 1/2] mtd: nand: force NAND_CMD_READID onto 8-bit bus
Date: Thu, 30 Jan 2014 20:18:07 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA6C85E@DBDE04.ent.ti.com>
References: <1391033909-6563-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA6C83A@DBDE04.ent.ti.com>
 <20140130195107.GB10673@localhost>
In-Reply-To: <20140130195107.GB10673@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgRXplcXVpZWwsDQoNCj4+ID4rc3RhdGljIGlubGluZSBpbnQgbmFuZF9vcGNvZGVfOGJpdHMo
dW5zaWduZWQgaW50IGNvbW1hbmQpDQo+PiA+K3sNCj4+ID4rCXJldHVybiBjb21tYW5kID09IE5B
TkRfQ01EX1JFQURJRDsNCj4+ID4rfQ0KPj4gPisNCj4+ID4NCj4+IENhbiAnbmFuZF9vcGNvZGVf
OGJpdHMsIG1hZGUgYSBtYWNybyBpbnN0ZWFkIG9mIGlubGluZSBmdW5jdGlvbiA/DQo+PiAjZGVm
aW5lIElTXzhCSVRfQ01EKGNtZCkgICh1bmxpa2VseShjbWQgPT0gTkFORF9DTURfUkVBRElEKSkN
Cj4+DQo+PiBCZWNhdXNlICduYW5kX29wY29kZV84Yml0cycgaXMgdXNlZCBpbiBuYW5kX2NvbW1h
bmQoKSBhbmQgbmFuZF9jb21tYW5kX2xwKCkNCj4+IHdoaWNoIGlzIHBlcmZvcm1hbmNlIGNyaXRp
Y2FsIGNvZGUgKGNoaXAtPmNtZCBpcyBjYWxsZWQgbXVsdGlwbGUgdGltZXMgZm9yIGZldGNoaW5n
DQo+PiBwYWdlIGRhdGEgYW5kIE9PQikuIFRob3VnaCB3ZSBzaG91bGQgZXhwZWN0IGNvbXBpbGVy
IHRvIHRyZWF0IHRoaXMgaW5saW5lIGZ1bmN0aW9uDQo+PiBzYW1lIGFzIG1hY3JvIGhlcmUsIEJ1
dCBqdXN0IHRvIGJlIGRvdWJseSBzdXJlIGZvciBmdXR1cmUgY2hhbmdlcyBhbHNvLg0KPj4NCj4N
Cj5JJ20gbm90IGEgY29tcGlsZXIgZ3VydSwgYnV0IEknZCBiZSB2ZXJ5IHN1cnByaXNlZCBpZiB0
aGUgY29tcGlsZXIgd291bGQgbWFrZQ0KPmEgZGlmZmVyZW5jZSBoZXJlLCBnaXZlbiB0aGUgZnVu
Y3Rpb24gaXMgc3RhdGljLCBpbmxpbmUgYW5kIHNtYWxsLiBCZXNpZGVzLA0KPmFuIGlubGluZSBm
dW5jdGlvbiBpcyBtb3JlIHJlYWRhYmxlIGFuZCB0eXBlLWF3YXJlLiBJJ2Qgc2F5IGl0J3MgdGhl
IFJpZ2h0DQo+VGhpbmcgdG8gZG8uDQo+DQo+TmV2ZXJ0aGVsZXNzLCBJIGRpZCBhIHNtYWxsIGNo
ZWNrIG9uIG15IHBsYXRmb3JtIChoYW5kYnVpbHQgQVJNIEdDQyA0LjcuMikgYW5kDQo+Ym90aCBt
YWNybyBhbmQgaW5saW5lIGlzIGNvbXBpbGVkIGludG8gYSAiY21wIiBpbnN0cnVjdGlvbi4gVGhl
IHVubGlrZWx5DQo+ZG9lc24ndCBzZWVtIHRvIGhhdmUgYW55IGVmZmVjdC4NCj4NClBsZWFzZSBj
aGVjayB0aGUgSk1QIGluc3RydWN0aW9uIGp1c3QgYWZ0ZXIgQ01QIGluc3RydWN0aW9uLi4NCklu
LWNhc2Ugb2YgKHVubGlrZWx5KHggPT0geSkpIEpNUC9KRSB3aWxsIGJlIHVzZWQgdG8gYnJhbmNo
IHdoZW4geCA9PSB5Lg0Kd2hlcmUgYXMgaW4tY2FzZSBvZiAobGlrZWx5KHggPT0geSkpIEpNUC9K
TkUgd2lsbCBiZSB1c2VkIHRvIGJyYW5jaCB4ICE9IHkuDQoNCkFzIGluIG1vc3QgY2FzZXMgJ2Nv
bW1hbmQgIT0gTkFORF9DTURfUkVBRElEJyBzbyB3aXRoIHVubGlrZWx5KCkgDQpDb21waWxlciBz
aG91bGQgbGF5IGRvd24gdGhlIGluc3RydWN0aW9ucyBpbiBzdWNoIGFuIG9yZGVyIHRoYXQgcHJv
Z3JhbQ0KZXhlY3V0ZXMgX3dpdGhvdXRfIGJyYW5jaGluZy4gIFRodXMgSk1QIHdpbGwgcG9pbnQg
dG8gdGhlIGNvZGUgd2hlbg0KY29tbWFuZCA9PSBOQU5EX0NNRF9SRUFESUQuDQoNCih0aGlzIGlz
IG15IHVuZGVyc3RhbmRpbmcsIGhvd2V2ZXIgbWF5IGJlIGZvciBzbWFsbCBicmFuY2hlcyB0aGlz
IGhhcw0KIG5vIGVmZmVjdCBiZWNhdXNlIGJvdGggcGF0aHMgY2FuIGJlIGZldGNoZWQgc2ltdWx0
YW5lb3VzbHkgaW50byBwaXBlbGluZSkuDQoNCg0Kd2l0aCByZWdhcmRzLCBwZWtvbg0K
