Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V0HiF-0002o5-8a
 for linux-mtd@lists.infradead.org; Fri, 19 Jul 2013 20:55:39 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: =?utf-8?B?VGVyZXNhIEfDoW1leg==?= <t.gamez@phytec.de>
Subject: RE: [PATCH] mtd: nand: omap2: Fix oobfree offset
Date: Fri, 19 Jul 2013 20:54:42 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9E9720@DBDE04.ent.ti.com>
References: <1374225202-26518-1-git-send-email-t.gamez@phytec.de>
In-Reply-To: <1374225202-26518-1-git-send-email-t.gamez@phytec.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "Mohammed, Afzal" <afzal@ti.com>, "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PiANCj4gVGhlIGNhbGN1bGF0aW9uIG9mIHRoZSBvb2JmcmVlWzBdLm9mZnNldCBpcyB3cm9uZyB3
aGVuIHVzaW5nIEJDSDgNCj4gYW5kIGVsbS4NCj4gDQo+IFRoZSBsYXlvdXQtPmVjY2J5dGVzIGlz
IGFscmVhZHkgc3RlcHMqaW5mby0+bmFuZC5lY2MuYnl0ZXMuIFRoZSBzZWNvbmQNCj4gbXVsdGlw
bGljYXRpb24gd2l0aCBzdGVwcyBpcyB0b28gbXVjaCBhbmQgd2lsbCBjcmVhdGUgYSB2YWx1ZQ0K
PiBsYXJnZXIgdGhhbiB0aGUgb29iIGFyZWEuDQo+IA0KPiBGaXhlZCB0aGUgY2FsY3VsYXRpb24u
DQo+IA0KVGhpcyBpcyBhbHJlYWR5IGZpeGVkIGluIA0KaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDEzLUp1bHkvMDQ3NTM0Lmh0bWwNCg0KQ2FuIHlvdSBw
bGVhc2UgcHVsbC1pbiB0aGUgd2hvbGUgc2VyaWVzLCBhbmQgdGVzdCBpdCA/DQpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtbXRkLzIwMTMtSnVseS8wNDc1MzAuaHRt
bA0KDQoNCndpdGggcmVnYXJkcywgcGVrb24NCg==
