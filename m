From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: RE: [PATCH v10 04/10] mtd: nand: omap: fix device scan:
 NAND_CMD_READID, NAND_CMD_RESET, CMD_CMD_PARAM use only x8 bus
Date: Wed, 23 Oct 2013 13:15:20 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA2A0CB@DBDE04.ent.ti.com>
References: <1382172254-12448-1-git-send-email-pekon@ti.com>
 <1382172254-12448-5-git-send-email-pekon@ti.com>
 <20131022201624.GL23337@ld-irv-0074.broadcom.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA29DB8@DBDE04.ent.ti.com>
 <5267690C.9080005@gmail.com> <20131023125516.GA2458@localhost>
In-Reply-To: <20131023125516.GA2458@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "Pawel.Moll@arm.com" <Pawel.Moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "tony@atomide.com" <tony@atomide.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>, "Balbi,
 Felipe" <balbi@ti.com>, "olof@lixom.net" <olof@lixom.net>,
 "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
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

SGksDQoNCj4gRnJvbTogRXplcXVpZWwgR2FyY2lhIFttYWlsdG86ZXplcXVpZWwuZ2FyY2lhQGZy
ZWUtZWxlY3Ryb25zLmNvbV0NClsuLi5dDQo+IEZXSVcsIEkgaGF2ZSBhIEJlYWdsZWJvbmUgd2l0
aCBhIDE2LWJpdCBidXMgTkFORCBhdHRhY2hlZCB0byBpdC4NCj4gDQo+IENvaW5jaWRlbnRhbGx5
LCB5ZXN0ZXJkYXkgSSB3YXMgZG9pbmcgc29tZSB0ZXN0cyBhcyBJJ20gcmFtcGluZyB1cCB0aGUN
Cj4gTkFORCBhbmQgSSBmb3VuZCB0aGF0IHdlaXJkIGRvdWJsZSBuYW5kX3NjYW5faWRlbnQoKSBj
YWxsLg0KPiBUaGUgd2hvbGUgdGhpbmcgbG9va3MgYnVnZ3kgdG8gbWUsIHNvIEknbSBoYXBweSB0
byBoZWxwLCByZXZpZXcsIHRlc3QNCj4gYW5kIHBhdGNoZXMgdG8gdGFrZSBjYXJlIG9mIHRoaXMu
DQo+IA0KWWVzLCB0aGFua3MgLi4gdGhhdCB3b3VsZCBiZSBvZiBncmVhdCBoZWxwLi4gDQpBbmQg
bWF5IGJlIHlvdXIgZXhwZXJpZW5jZSBvZiBBdG1lbCBkcml2ZXJzIHdvdWxkIGhlbHAgbWUgaGVy
ZS4uDQoNCipDb3JyZWN0LCBzaG91bGQgbm90IGJlIGRvdWJsZSBjYWxscyB0byBuYW5kX3NjYW5f
aWRlbnQoKS4uKg0KQnV0IHRoZXJlIGlzIGEgY29uc3RyYWluIGluIG5hbmRfYmFzZS5jLCB0aGF0
IGl0IGRvZXMgbm90IGFsbG93IE9ORkkNCnBhZ2UgcmVhZGluZyBpbiB4MTYgbW9kZS4uIFNvIGhv
dyB0byBvdmVyY29tZSB0aGF0Li4NCg0KSSBzZWUgdGhlIHNpbWlsYXIgaW1wbGVtZW50YXRpb24g
aW4geW91ciBBVE1FTCBkcml2ZXIsIGl0IGRvZXMgbm90IHVzZQ0KTkFORF9CVVNXSURUSF9BVVRP
IHNvIGhvdyBkbyB5b3UgcGVyZm9ybSBPTkZJIHJlYWQNCmZvciB4MTYgZGV2aWNlcyA/DQpkcml2
ZXJzL210ZC9uYW5kL2F0bWVsX25hbmQuYyBAQGF0bWVsX25hbmRfcHJvYmUoKQ0KLyogaGVyZSB5
b3UgbW92ZSB0byB4MTYgbW9kZSBiYXNlZCBvbiB5b3VyIERUIG9yIHBsYXRmb3JtIGRhdGEgKi8N
CglpZiAoaG9zdC0+Ym9hcmQuYnVzX3dpZHRoXzE2KQkvKiAxNi1iaXQgYnVzIHdpZHRoICovDQoJ
CW5hbmRfY2hpcC0+b3B0aW9ucyB8PSBOQU5EX0JVU1dJRFRIXzE2Ow0KLyogQW5kIHRoZW4geW91
IGNhbGwgbmFuZF9zY2FuX2lkZW50ICovDQovKiBmaXJzdCBzY2FuIHRvIGZpbmQgdGhlIGRldmlj
ZSBhbmQgZ2V0IHRoZSBwYWdlIHNpemUgKi8NCglpZiAobmFuZF9zY2FuX2lkZW50KG10ZCwgMSwg
TlVMTCkpIHsNCgkJcmVzID0gLUVOWElPOw0KCQlnb3RvIGVycl9zY2FuX2lkZW50Ow0KCX0NCg0K
V291bGRuJ3QgdGhpcyBmYWlsLCBfdW5sZXNzXyB5b3VyIGRldmljZSBpcyBsaXN0ZWQgaW4gbmFu
ZF9mbGFzaF9pZFtdID8NCmJlY2F1c2UgaXQgd291bGQgbm90IGJlIGFibGUgdG8gcmVhZCBPTkZJ
IHBhcmFtcy4uIA0KUmVmZXIgYmVsb3cgY29tbWl0Li4gDQpjb21taXQgMGNlODJiN2Y3YjczNzNi
MTZlY2Y3YjU3MjVlMjFlMjk3NTIwNDUwMA0KQXV0aG9yOiAgICAgTWF0dGhpZXUgQ0FTVEVUIDxt
YXR0aGlldS5jYXN0ZXRAcGFycm90LmNvbT4NCkF1dGhvckRhdGU6IDIwMTMtMDEtMTYNCg0KVGhh
bmtzIGZvciBwaXRjaGluZyBpbiwgdGhpcyB3b3VsZCBoZWxwIG1lIHRvIHVuZGVyc3RhbmQgdGhp
cyBiZXR0ZXIuDQoNCg0KDQo+IEknbSB1c2luZyBzb21lIFRJIFNESyB3aXRoIHNvbWUgYW5jaWVu
dCB2My4yLnggKHdpdGggbm8gZ2l0IGhpc3RvcnkhKSwNCj4gYnV0IGZyb20gdGhpcyBkaXNjdXNz
aW9uIGl0IHNlZW1zIHRoZSBpc3N1ZSBpcyBzdGlsbCBwcmVzZW50IGluDQo+IG1haW5saW5lLg0K
PiANCkFhaCBzb3JyeSwgdGhlbiB5b3UgbWlnaHQgaGF2ZSBzb21lIHByb2JsZW0gaGVyZSBpbiBy
ZWJhc2luZyB0aGUNCnBhdGNoZXMuIEJ1dCBzdGlsbCBpZiB5b3UgY2FuLCB0aGFua3MgbXVjaCAu
Lg0KDQoNCndpdGggcmVnYXJkcywgcGVrb24NCg==
