Received: from mx.socionext.com ([202.248.49.38])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1crEEp-0003co-9n
 for linux-mtd@lists.infradead.org; Fri, 24 Mar 2017 01:42:02 +0000
From: <yamada.masahiro@socionext.com>
To: <robin.murphy@arm.com>, <linux-mtd@lists.infradead.org>
CC: <boris.brezillon@free-electrons.com>, <dwmw2@infradead.org>,
 <marek.vasut@gmail.com>, <computersforpeace@gmail.com>,
 <thorsten.christiansson@idquantique.com>, <laurent.monat@idquantique.com>,
 <dinguyen@kernel.org>, <artem.bityutskiy@linux.intel.com>,
 <grmoore@opensource.altera.com>, <ejo@pengutronix.de>,
 <chuanxiao.dong@intel.com>, <mhiramat@kernel.org>,
 <jaswinder.singh@linaro.org>, <robh@kernel.org>,
 <rmk+kernel@armlinux.org.uk>, <lars@metafoo.de>
Subject: RE: [RESEND PATCH v2 52/53] mtd: nand: denali: use non-managed
 kmalloc() for DMA buffer
Date: Fri, 24 Mar 2017 01:41:34 +0000
Message-ID: <98e3485292cf45bf8c63547c3c1790c2@SOC-EX02V.e01.socionext.com>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
 <1490228282-10805-26-git-send-email-yamada.masahiro@socionext.com>
 <8fa877a7-c43a-76e7-2252-3463c8c3afcd@arm.com>
In-Reply-To: <8fa877a7-c43a-76e7-2252-3463c8c3afcd@arm.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"
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

SGkgUm9iaW4sDQoNCj4gSSBzdGlsbCB0aGluayB0aGUgd2F5IHRoZSBkcml2ZXIgYWN0dWFsbHkg
dXNlcyB0aGlzIGJ1ZmZlciBsb29rcyB2ZXJ5DQo+IHN1c3BlY3QgLSBrZWVwaW5nIGl0IHBlcm1h
bmVudGx5IG1hcHBlZCBmb3IgYmlkaXJlY3Rpb25hbCAoQUtBICJJIGRvbid0DQo+IGtub3ciKSBz
dHJlYW1pbmcgRE1BIGFjcm9zcyBtdWx0aXBsZSBvcGVyYXRpb25zIGRvZXNuJ3QgYWRkIHVwLiBJ
ZiB0aGUNCj4gZGV2aWNlIG1pZ2h0IGFjY2VzcyBpdCBhdCBhbnkgdGltZSAob3IgdGhlIGRyaXZl
ciBzaW1wbHkgZG9lc24ndCB3YW50IHRvDQo+IGhhdmUgdG8gY2FyZSkgaXQgc2hvdWxkIGJlIGEg
Y29oZXJlbnQgYWxsb2NhdGlvbi4gT3RoZXJ3aXNlLCBpdCBzaG91bGQNCj4ganVzdCBiZSBtYXBw
ZWQvdW5tYXBwZWQgd2l0aCB0aGUgYXBwcm9wcmlhdGUgZGlyZWN0aW9uIGFyb3VuZCBlYWNoDQo+
IG9wZXJhdGlvbi4NCg0KVGhpcyBidWZmZXIgaXMgbm90IHBlcm1hbmVudGx5IG1hcHBlZCBmb3Ig
YmlkaXJlY3Rpb25hbCBhbnkgbW9yZS4NCg0KSSBmaXhlZCBpdCBpbiA1MS81MzoNCmh0dHA6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC83NDI0MTEvDQoNCldoZW4gcG9zc2libGUsIHRoZSBy
ZWFkL3dyaXRlIGNhbGxiYWNrcw0KZGlyZWN0bHkgY2FsbHMgZG1hX21hcF9zaW5nbGUoKSBmb3Ig
dGhlIGJ1ZmZlcg0KcGFzc2VkIGZyb20gdGhlIGNvcmUgZnJhbWV3b3JrLg0KKGVpdGhlciBETUFf
VE9fREVWSUNFIG9yIERNQV9GUk9NX0RFVklDRSkNCg0KVGhpcyB3aWxsIGJ5cGFzcyB0aGUgbWVt
Y3B5KCkgdG8vZnJvbSB0aGUgaW50ZXJuYWwgYnVmZmVyLg0KDQoNCg0KVGhpcyBkcml2ZXIgaW50
ZXJuYWwgYnVmZmVyIGlzIHN0aWxsIG5lZWRlZCBmb3IgcmF3IHJlYWQvd3JpdGUuDQpUaGUgRGVu
YWxpIElQIHVzZXMgc3luZHJvbWUgcGFnZSBsYXlvdXQuDQpTbywgdGhlIHJhdyBhY2Nlc3NvcnMg
bXVzdCBhcnJhbmdlIHRoZSBwYXlsb2FkL0VDQyBkYXRhIGxheW91dC4NCg0KVGhpcyBwcm9ibGVt
IGlzIGFkZHJlc3NlZCBieSA0OC81MzoNCmh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRj
aC83NDI0MTYvDQoNCg0KSSBhbHNvIGV4YW1pbmVkIHRoZSBwb3NzaWJpbGl0eSBmb3IgY29oZXJl
bnQgYWxsb2NhdGlvbi4NCkV2ZW4gaWYgSSB1c2UgZG1hX2FsbG9jX2NvaGVyZW50LCBJIG5lZWQg
YW5vdGhlciBib3VuY2UgYnVmZmVyIGFueXdheQ0KZm9yIHRoZSBzeW5kcm9tZSBwYWdlIHNodWZm
bGluZy4gIFNvLCB0aGlzIHdheSBzZWVtcyBsZXNzIGVmZmljaWVudC4NCg0KDQpNYXNhaGlybw0K
DQo=
