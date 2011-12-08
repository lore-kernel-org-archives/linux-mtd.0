Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
 helo=DB3EHSOBE001.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYUJR-00025X-Ax
 for linux-mtd@lists.infradead.org; Thu, 08 Dec 2011 03:06:22 +0000
From: Liu Shengzhou-B36685 <B36685@freescale.com>
To: Wood Scott-B07421 <B07421@freescale.com>
Subject: RE: [PATCH 2/2 v2] mtd/nand: Add ONFI support for FSL NAND controller
Date: Thu, 8 Dec 2011 03:06:14 +0000
Message-ID: <3F453DDFF675A64A89321A1F352810216B0884@039-SN1MPN1-005.039d.mgd.msft.net>
References: <1323161655-19050-1-git-send-email-Shengzhou.Liu@freescale.com>
 <1323161655-19050-2-git-send-email-Shengzhou.Liu@freescale.com>
 <4EDE4E1D.4030408@freescale.com>
 <3F453DDFF675A64A89321A1F352810216B074A@039-SN1MPN1-005.039d.mgd.msft.net>
 <4EDF9F6A.9000407@freescale.com>
In-Reply-To: <4EDF9F6A.9000407@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gala Kumar-B11780 <B11780@freescale.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DQoNCkJlc3QgUmVnYXJkcywNClNoZW5nemhvdSBMaXUNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IFdvb2QgU2NvdHQtQjA3NDIxDQo+IFNlbnQ6IFRodXJzZGF5LCBE
ZWNlbWJlciAwOCwgMjAxMSAxOjE2IEFNDQo+IFRvOiBMaXUgU2hlbmd6aG91LUIzNjY4NQ0KPiBD
YzogV29vZCBTY290dC1CMDc0MjE7IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnOyBsaW51
eC0NCj4gbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IGR3bXcyQGluZnJhZGVhZC5vcmc7IEdhbGEg
S3VtYXItQjExNzgwDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yIHYyXSBtdGQvbmFuZDogQWRk
IE9ORkkgc3VwcG9ydCBmb3IgRlNMIE5BTkQNCj4gY29udHJvbGxlcg0KPiANCj4gT24gMTIvMDYv
MjAxMSAwOToxNiBQTSwgTGl1IFNoZW5nemhvdS1CMzY2ODUgd3JvdGU6DQo+ID4+PiArCQkJb3V0
X2JlMzIoJmxiYy0+ZmJjciwgOCk7DQo+ID4+PiArCQkJZWxiY19mY21fY3RybC0+cmVhZF9ieXRl
cyA9IDg7DQo+ID4+PiArCQl9IGVsc2Ugew0KPiA+Pj4gKwkJCW91dF9iZTMyKCZsYmMtPmZiY3Is
IDI1Nik7DQo+ID4+PiArCQkJZWxiY19mY21fY3RybC0+cmVhZF9ieXRlcyA9IDI1NjsNCj4gPj4+
ICsJCX0NCj4gPj4NCj4gPj4gQW55IGhhcm0gaW4gYWx3YXlzIHVzaW5nIDI1Nj8NCj4gPj4NCj4g
Pj4gLVNjb3R0DQo+ID4gW1NoZW5nemhvdV0gRm9yIE5BTkRfQ01EX1JFQURJRCBjb21tYW5kLCB0
aGUgdG90YWwgYnl0ZXMgb2YgZW50aXJlIElEDQo+IHN0cmluZyBhcmUgOCwgdGhlcmUgYXJlIG5v
dCAyNTYgYnl0ZXMgc28gbWFueSwgaXQncyB1bm5lY2Vzc2FyeSBhbmQgbG9va3MNCj4gbm90IHNv
IHdlbGwgbG9naWNhbGx5IHRvIGFsd2F5cyB1c2luZyAyNTYsIHRob3VnaCBpdCB3b3Jrcy4NCj4g
DQo+IEl0J3Mgbm90IHBlcmZvcm1hbmNlIGNyaXRpY2FsLCBhbmQgYWx3YXlzIHVzaW5nIDI1NiBr
ZWVwcyB0aGluZ3Mgc2ltcGxlciwNCj4gYW5kIG1vcmUgcm9idXN0IGlmIHRoZSBsZW5ndGggb2Yg
dGhlIElEIHN0cmluZyBncm93cyBpbiB0aGUgZnV0dXJlICh3ZQ0KPiB1c2VkIHRvIGFzc3VtZSBp
dCB3YXMgNSBieXRlcy4uLikuDQo+IA0KPiAtU2NvdHQNCltTaGVuZ3pob3VdIE9LLg0K
