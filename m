Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmNBW-0007jr-4U
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 12:28:39 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: RE: [PATCH] mtd: nand: auto-detection of NAND bus-width from ONFI
 param or nand_id[]
Date: Fri, 29 Nov 2013 12:28:06 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA5023E@DBDE04.ent.ti.com>
References: <1385382728-7913-1-git-send-email-pekon@ti.com>
 <20131129121806.GA2815@localhost>
In-Reply-To: <20131129121806.GA2815@localhost>
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

PkZyb206IEV6ZXF1aWVsIEdhcmNpYSBbbWFpbHRvOmV6ZXF1aWVsLmdhcmNpYUBmcmVlLWVsZWN0
cm9ucy5jb21dDQo+DQo+SSdtIG5vdCByZWFsbHkgY29udmluY2VkIGFib3V0IHRoZSBwYXRoIHlv
dSdyZSB0YWtpbmcgaGVyZSwgYXMgSSB0aGluayB0aGUNCj5zb2x1dGlvbiBzaG91bGQgYmUgYSBi
aXQgc2ltcGxlci4NCj4NCj5JJ3ZlIHByZXBhcmVkIGFuIFJGQyB3aXRoIG15IHByb3Bvc2FsLCBi
YXNlZCBvbiB0aGlzIHNhbWUgcGF0Y2guIExldCBtZQ0KPmZpbmlzaCBzb21lIHRlc3RpbmdzIGFu
ZCBwb3N0IGl0IChJIHRvb2sgdGhlIGxpYmVydHkgb2YgYWRkaW5nIHlvdXIgU09CDQo+dG8gaXQp
Lg0KPiANClN1cmUgLi4gcGx6IGtlZXAgbWUgaW4gQ0Mgd2hlbiB5b3Ugc2VuZCB5b3VyIHBhdGNo
Li4NCkkgYmVsaWV2ZSB0aGF0IGhhdmluZyBnb29kIGFuZCBlZmZpY2llbnQgY29kZSBpcyBtb3Jl
IGltcG9ydGFudCB0aGFuDQpoYXZpbmcgb3duZXJzaGlwL2F1dGhvcnNoaXAgb2YgcGF0Y2hlcy4g
U28gcGx6IGZlZWwgZnJlZSB0byBleHRlbmQgb3INCm1vZGlmeSB0aGlzIGN1cnJlbnQgcGF0Y2gg
KGFuZCBzdWJtaXQgd2l0aCB5b3VyIGF1dGhvcnNoaXApIGlmIHlvdSBmZWVsDQppdCdzIHBhcnRs
eSB1c2VmdWwuDQoNCndpdGggcmVnYXJkcywgcGVrb24NCg==
