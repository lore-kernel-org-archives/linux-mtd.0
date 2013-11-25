Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VkwH7-00070L-QP
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2013 13:32:30 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: RE: [PATCH] mtd: nand: auto-detection of NAND bus-width from ONFI
 param or nand_id[]
Date: Mon, 25 Nov 2013 13:32:01 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA4E6A5@DBDE04.ent.ti.com>
References: <1385382728-7913-1-git-send-email-pekon@ti.com>
 <20131125125647.GF2408@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA4E675@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA4E675@DBDE04.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PiBGcm9tOiBHdXB0YSwgUGVrb24NCj4gPiA+IEZyb206IEV6ZXF1aWVsIEdhcmNpYSBbbWFpbHRv
OmV6ZXF1aWVsLmdhcmNpYUBmcmVlLWVsZWN0cm9ucy5jb21dDQo+ID4gVGhhbmtzIGZvciB0YWtp
bmcgY2FyZSBvZiB0aGlzISA6LSkNCj4gPg0KPiBZZXMsIEkgd2FzIHdhaXRpbmcgZm9yIC1yYzEg
dG8gYmUgVEktR1BNQyBkcml2ZXIgd2hpY2ggc3RpbGwgZ2V0cyBjb25maWd1cmVkDQo+IGZyb20g
RFQgaW5kZXBlbmRlbnRseS4gSG93ZXZlciB0aGF04oCZcyBhIHNlcGFyYXRlIGRpc2N1c3Npb24g
YWxyZWFkeQ0KPiBnb2luZyBpbiB5b3VyIGVhcmxpZXIgdGhyZWFkLg0KPiANCldlaXJkIHR5cG8g
c29ycnkgKHJlLXdyaXRpbmcgYWdhaW4pIC4uDQpZZXMsIEkgd2FzIHdhaXRpbmcgZm9yIC1yYzEg
dG8gYmUgdGFnZ2VkLg0KSG93ZXZlciBUSS1HUE1DIGRyaXZlciBzdGlsbCBuZWVkcyBwYXRjaCB0
byByZS1jb25maWd1cmUgaXRzIHJlZ2lzdGVycywNCmFzIGl0IGdldHMgY29uZmlndXJlZCBmcm9t
IERUIGluZGVwZW5kZW50bHkuIEhvd2V2ZXIgdGhhdOKAmXMgYSBzZXBhcmF0ZQ0KZGlzY3Vzc2lv
biBhbHJlYWR5IGdvaW5nIGluIGRpZmZlcmVudCBtYWlsIHRocmVhZC4NCg0KDQp3aXRoIHJlZ2Fy
ZHMsIHBla29uDQo=
