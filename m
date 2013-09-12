Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VK5bg-0005b2-4M
 for linux-mtd@lists.infradead.org; Thu, 12 Sep 2013 12:02:44 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v5 0/4] mtd:nand:omap2: clean-up of supported ECC schemes
Date: Thu, 12 Sep 2013 12:02:11 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA0EFCA@DBDE04.ent.ti.com>
References: <1373748891-7779-1-git-send-email-pekon@ti.com>
 <20130821013255.GD28382@ld-irv-0074.broadcom.com>
In-Reply-To: <20130821013255.GD28382@ld-irv-0074.broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "N, Mugunthan V" <mugunthanvnm@ti.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>,
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

SGksDQoNCj4gWy4uLl0NCj4gDQo+IFlvdSBtaWdodCBhbHNvIGNvbnNpZGVyIGEgZnV0dXJlIHBh
dGNoIGZvciB1dGlsaXppbmcgZGV2bV8qIGZ1bmN0aW9ucw0KPiBmb3IgdGhlIHByb2JlL3JlbW92
ZSByb3V0aW5lcyBpbiBkcml2ZXJzL210ZC9uYW5kL29tYXAyLmMuIFRoYXQgY291bGQNCj4gaW1w
cm92ZSBzb21lIG9mIHRoZSBzdHVmZiBJIGxvb2tlZCBhdCBpbiB0aGlzIHNlcmllcy4NCj4gDQpU
aGFua3MgZm9yIGZlZWRiYWNrLg0KSSBoYXZlIG5vdCBpbmNvcnBvcmF0ZWQgdGhpcyBwYXJ0aWN1
bGFyIHVwZGF0ZSBpbiB2NiwgYXMgSSBkbyBub3QgaGF2ZSBtdWNoDQprbm93bGVkZ2UgYWJvdXQg
ZGV2bV8qIGZ1bmN0aW9ucy4gQnV0IEknbGwga2VlcCBpdCBpbiBteSB0by1kbyhzKSBvbmNlDQpk
cml2ZXIgaXMgY29tcGxldGUgZmVhdHVyZSB3aXNlLiANCg0Kd2l0aCByZWdhcmRzLCBwZWtvbg0K
