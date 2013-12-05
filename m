From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <b32955@freescale.com>, Marek Vasut <marex@denx.de>, "Angus
 Clark" <angus.clark@st.com>
Subject: RE: [PATCH 0/4] mtd: spi-nor: add a new framework for SPI NOR
Date: Thu, 5 Dec 2013 05:43:05 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA51E1A@DBDE04.ent.ti.com>
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA51905@DBDE04.ent.ti.com>
 <529EE5F1.9080806@st.com> <201312041636.20875.marex@denx.de>
 <529FE81C.4000608@freescale.com>
In-Reply-To: <529FE81C.4000608@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "broonie@linaro.org" <broonie@linaro.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PkZyb206IEh1YW5nIFNoaWppZSBbbWFpbHRvOmIzMjk1NUBmcmVlc2NhbGUuY29tXQ0KPg0KPj7k
uo4gMjAxM+W5tDEy5pyIMDTml6UgMjM6MzYsIE1hcmVrIFZhc3V0IOWGmemBkzoNCj4+IEkgZGlz
YWdyZWUgd2Ugc2hvdWxkIGJsb2F0IHRoZSBBUEkgd2l0aCBmZWF0dXJlcywgdGhhdCB3aWxsIGJl
IHVzZWQgYnkgInBvc3NpYmxlDQo+PiBmdXR1cmUgY29udHJvbGxlcnMiIG9yICJwb3NzaWJsZSBz
aW5nbGUgY29udHJvbGxlciIsIHJpZ2h0IGZyb20gdGhlIHN0YXJ0LiBUaGUNCj4+IHJlYWwgcXVl
c3Rpb24gaGVyZSBpcywgY2FuIHRoZSBBUEkgYmUgZGVzaWduZWQgaW4gc3VjaCBhIHdheSwgdGhh
dCB0aGUgU1INCj4+IHBvbGxpbmcgd2lsbCBoYXBwZW4gaW4gc29mdHdhcmUgTk9XIGFuZCBvbmx5
IHdoZW4gYSBjb250cm9sbGVyIGFwcGVhcnMgdGhhdCBjYW4NCj4+IGRvIHBvbGxpbmcgaW4gSFcg
d2lsbCB0aGUgQVBJIGJlIGV4dGVuZGVkIHRvIHN1cHBvcnQgaXQgPw0KPm9rLiBMZXQncyBhZGQg
dGhpcyBmZWF0dXJlIGluIHRoZSBmdXR1cmUgd2hlbiBhIHJlYWwgY2FzZSBvY2N1cnMuDQo+DQpT
b3JyeSBnb3QgbG9zdC4uIENhbiB5b3UgcGxlYXNlIHN1bW1hcml6ZSBmb2xsb3dpbmcgcGxhbnMg
Zm9yIHlvdXIgbmV4dCBwYXRjaDoNCg0KKDEpIFBvbGxpbmcgb2Ygc3RhdHVzIHJlZ2lzdGVycyBz
aG91bGQgYmUgDQogIChhKSBkb25lIGluIFMvVyAoZ2VuZXJpYyBkcml2ZXIpDQogIChiKSBkb25l
IGNvbnRyb2xsZXIgZHJpdmVyLCB3aGljaCBjYW4gYmUgb3B0aW1pemVkIGZvciBzcGVjaWZpYyBo
YXJkd2FyZQ0KDQooMikgSG93IGRvIHlvdSBwbGFuIHRvIGhhdmUgdGltZW91dCB2YWx1ZSwgKGFz
IHNlcmlhbCBmbGFzaCBjYW4gYmUgcHJldHR5IHNsb3cNCiAgIHRvIGFjY2VzcykgPw0KICAoYSkg
aW5kZXBlbmRlbnQgZm9yIGVhY2ggYWNjZXNzDQogICAgICAgLSByZWFkIHRpbWVvdXRzIHBlciBz
ZWN0b3IsIHdoaWNoIGNhbiBiZSBtdWx0aXBsaWVkIHdpdGggcmVhZF9sZW4vc2VjdG9yX3NpemUN
CiAgICAgICAtIHdyaXRlIHRpbWVvdXQgcGVyIHNlY3Rvciwgd2hpY2ggY2FuIGJlIG11bHRpcGxp
ZWQgd2l0aCB3cml0ZV9sZW4vc2VjdG9yX3NpemUNCiAgICAgICAtIGVyYXNlIHRpbWVvdXQgcGVy
IGJsb2NrLCB3aGljaCBjYW4gYmUgbXVsdGlwbGllZCB3aXRoIGVyYXNlX2xlbi9ibG9ja19zaXpl
DQogIChiKSBBbnkgb3RoZXIgbWV0aG9kLCBvciBsZWF2ZSBpdCB0byBjb250cm9sbGVyIGRyaXZl
ciA/DQoNCkluIG15IHZpZXcsIGJlZm9yZSBwcm9jZWVkaW5nIHRvIHdyaXRpbmcgZG93biBhIHBh
dGNoLCBJIHRoaW5rDQp3ZSBzaG91bGQgY29tZS11cCB3aXRoIGEgZG9jL1JlYWRtZSwgd2hpY2gg
ZGVmaW5lcyBhbGwgQVBJIGFuZCBpbnRlcmZhY2UNCnN0cnVjdHMgKHRha2luZyBBbmd1cycgcHJv
cG9zYWwgYXMgYmFzZWxpbmUpLiBBbmQgdGhlbiByZWZpbmUgdGhhdCBzcGVjIGZpcnN0Lg0KT3Ro
ZXJ3aXNlIHRoZXJlIG1heSBiZSB0b28gbWFueSByZXZpc2lvbnMgc3BlbnQgb24gcGF0Y2ggUkZD
J3MgLi4gDQoNCkFueSB0aG91Z2h0cyA/DQpBbmQgaXMgdGhlcmUgYSBzcGFjZSBpbiBrZXJuZWxf
ZG9jcyBmb3Igc3VjaCBzcGVjcyA/DQoNCldpdGggcmVnYXJkcywgcGVrb24NCg==
