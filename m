Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlDPf-0003IQ-Ma
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 07:50:28 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <b32955@freescale.com>
Subject: RE: [PATCH] mtd: nand: auto-detection of NAND bus-width from ONFI
 param or nand_id[]
Date: Tue, 26 Nov 2013 07:49:57 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA4ECA1@DBDE04.ent.ti.com>
References: <1385382728-7913-1-git-send-email-pekon@ti.com>
 <52944E45.6070803@freescale.com>
In-Reply-To: <52944E45.6070803@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PiBGcm9tOiBIdWFuZyBTaGlqaWUgW21haWx0bzpiMzI5NTVAZnJlZXNjYWxlLmNvbV0NClsuLi5d
DQo+ID4gQEAgLTMwMzMsNiArMzAyOCwxMiBAQCBzdGF0aWMgaW50IG5hbmRfZmxhc2hfZGV0ZWN0
X29uZmkoc3RydWN0DQo+IG10ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsDQo+
ID4gICAJfQ0KPiBJZiBpdCBpcyAxNmJpdCBidXMsIGNvdWxkIHdlIHJlY29uZmlndXJlIHRoZSBi
dXMgd2lkdGggaW4gaGVyZT8NCj4gaXQncyBiZXR0ZXIgdG8gbGltaXQgdGhlIGluZmx1ZW5jZSBv
bmx5IGluIHRoZSBPTkZJIGNvZGUuDQo+IA0KDQpZZXMgSSB0b28gd2FudGVkIHNhbWUsIGJ1dCB0
aGVuIG9uY2UgYSBkZXZpY2UgaXMgZm91bmQgaW4NCm5hbmRfZmxhc2hfaWRbXSB0YWJsZSwgT05G
SSBwcm9iZSBpcyBub3QgZG9uZSAuLg0KUmVmZXIgYmVsb3cgY29kZSBpbiBuYW5kX2Jhc2UuYw0K
CUBAIG5hbmRfZ2V0X2ZsYXNoX3R5cGUoKQ0KCWlmICghdHlwZS0+bmFtZSB8fCAhdHlwZS0+cGFn
ZXNpemUpIHsNCgkJCS8qIENoZWNrIGlzIGNoaXAgaXMgT05GSSBjb21wbGlhbnQgKi8NCgkJCWlm
IChuYW5kX2ZsYXNoX2RldGVjdF9vbmZpKG10ZCwgY2hpcCwgJmJ1c3cpKQ0KDQpUaHVzLCBpZiB3
ZSB3YW50IHRvIHRydWx5IGF1dG8tZGV0ZWN0aW9uLCB0aGVuIHdlIG5lZWQgdG8NCnNldCBidXMt
d2lkdGggaW4gYm90aCBjYXNlcw0KKDEpIHdoZW4gTkFORCBkZXZpY2UgaXMgZGV0ZWN0ZWQgYmFz
ZWQgb24gbmFuZF9mbGFzaF9pZFtdIHRhYmxlDQooMikgd2hlbiBOQU5EIGRldmljZSBpcyBkZXRl
Y3RlZCBiYXNlZCBvbiBPTkZJIHByb2JlDQoNCkFnYWluIG5lZWQgbW9yZSB0aG91Z2h0cy4uID8N
Cg0Kd2l0aCByZWdhcmRzLCBwZWtvbg0K
