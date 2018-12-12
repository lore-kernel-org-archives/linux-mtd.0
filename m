Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gX1oT-00089Y-Cx
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2018 10:32:25 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: Raw NAND bad block marker positions
Date: Wed, 12 Dec 2018 10:32:04 +0000
Message-ID: <e937e18d-5099-5969-3b17-1f2d9ffa3a44@kontron.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <570BE9393CDDE54ABA7AC92EDA6D41CF@snt-world.com>
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

SGksDQoNCnRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGZvciBjaGVja2luZy9zZXR0aW5nIHRo
ZSBiYWQgYmxvY2sgbWFya2VycyBpbiANCnJhdyBOQU5EIGZsYXNoIGRldmljZXMgc3VwcG9ydHMg
dGhyZWUgc2V0dXBzIGZvciB0aGUgcG9zaXRpb24gb2YgdGhlIA0KbWFya2VycyB3aXRoaW4gdGhl
IGJhZCBibG9jazoNCg0KKiBCQk0gaW4gZmlyc3QgcGFnZSBvbmx5DQoqIEJCTSBpbiBsYXN0IHBh
Z2Ugb25seQ0KKiBCQk0gaW4gZmlyc3Qgb3Igc2Vjb25kIHBhZ2UNCg0KVGhpcyBpcyBjb250cm9s
bGVkIGJ5IHRoZSBmbGFncyBOQU5EX0JCVF9TQ0FOTEFTVFBBR0UgYW5kIA0KTkFORF9CQlRfU0NB
TjJORFBBR0UuIEl0IGlzIG5vdCBzdXBwb3J0ZWQgdG8gc2V0IGJvdGggZmxhZ3MgdG8gY2hlY2sg
DQpmaXJzdCwgc2Vjb25kIGFuZCBsYXN0IHBhZ2UuDQoNClRob3VnaCBzb21lIGRldmljZXMgc2Vl
bSB0byByZXF1aXJlIHRoaXMga2luZCBvZiBzZXR1cC4gV2Uga25vdyBvZiBzb21lIA0KRVNNVCBT
TEMgTkFORHMsIHRoYXQgd2VyZSBhY2NpZGVudGFsbHkgc2hpcHBlZCB3aXRoIEJCTSBpbiB0aGUg
Zmlyc3Qgb3IgDQpsYXN0IHBhZ2UsIGluc3RlYWQgb2YgZmlyc3Qgb3Igc2Vjb25kIHBhZ2UgYXMg
Y2xhaW1lZCBpbiB0aGUgZGF0YXNoZWV0Lg0KDQpBbHNvIHRoZSBkb2N1bWVudHMgZm9yIEN5cHJl
c3MvU3BhbnNpb24vQU1EIE5BTkRzIGNsYWltIHRoYXQgdGhlIA0Kc29mdHdhcmUgbmVlZHMgdG8g
Y2hlY2sgZmlyc3QsIHNlY29uZCBhbmQgbGFzdCBwYWdlIGZvciBCQk1zIChlLmcuIFsxXSkuDQoN
Ckl0IGRvZXNuJ3QgbG9vayBsaWtlIGl0IHdvdWxkIGJlIGRpZmZpY3VsdCB0byBtYWtlIE5BTkRf
QkJUX1NDQU5MQVNUUEFHRSANCmFuZCBOQU5EX0JCVF9TQ0FOMk5EUEFHRSB3b3JrIHRvZ2V0aGVy
LCBidXQgSSB3YW50ZWQgdG8gYXNrIGlmIHNvbWVvbmUgDQphbHJlYWR5IHN0dW1ibGVkIHVwb24g
dGhpcyBwcm9ibGVtIG9yIGlmIHNvbWVvbmUgaGFzIGFueSBjb21tZW50cyBvciANCnN1Z2dlc3Rp
b25zLCBiZWZvcmUgdHJ5aW5nIHRvIHBhdGNoIHRoaXM/DQoNClRoYW5rcywNCkZyaWVkZXINCg0K
WzFdOiBodHRwczovL2NvbW11bml0eS5jeXByZXNzLmNvbS9kb2NzL0RPQy0xMDQ2NA==
