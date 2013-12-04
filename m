From: "Gupta, Pekon" <pekon@ti.com>
To: Angus Clark <angus.clark@st.com>, Huang Shijie <b32955@freescale.com>
Subject: RE: [PATCH 0/4] mtd: spi-nor: add a new framework for SPI NOR
Date: Wed, 4 Dec 2013 07:19:59 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA51905@DBDE04.ent.ti.com>
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <20131127043253.GA9468@ld-irv-0074.broadcom.com> <5298AA23.7080404@st.com>
 <529E976E.4050104@freescale.com> <529ED29C.1030208@st.com>
In-Reply-To: <529ED29C.1030208@st.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "marex@denx.de" <marex@denx.de>, "broonie@linaro.org" <broonie@linaro.org>,
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

PkZyb206IEFuZ3VzIENsYXJrIFttYWlsdG86YW5ndXMuY2xhcmtAc3QuY29tXQ0KPj5PbiAxMi8w
NC8yMDEzIDAyOjQ2IEFNLCBIdWFuZyBTaGlqaWUgd3JvdGU6DQo+PiDkuo4gMjAxM+W5tDEx5pyI
Mjnml6UgMjI6NTIsIEFuZ3VzIENsYXJrIOWGmemBkzoNCj4+PiAgICAgaW50ICgqd3JpdGVfcmVn
KShzdHJ1Y3Qgc3BpX25vcl9pbmZvICppbmZvLA0KPj4+ICAgICAgICAgICAgICB1aW50OF90IGNt
ZCwgdWludDhfdCAqcmVnLCBpbnQgbGVuLA0KPj4+ICAgICAgICAgICAgICBpbnQgd3JlbiwgaW50
IHd0cik7DQo+PiBJIGd1ZXNzIHlvdSBhZGQgdGhlICd3cmVuJyBmb3IgdGhlIGlzc3Vpbmcgd3Jp
dGUtZW5hYmxlIGJlZm9yZSBpc3N1aW5nDQo+PiB0aGUgJ2NtZCcuDQo+Pg0KPj4gYnV0IHdoYXQn
cyAnd3RyJyBmb3I/IGkgZG8gbm90IGtub3cgd2hhdCdzIHRoZSBtZWFuaW5nIG9mIHRoZSAnd3Ry
Jy4NCj4+DQo+DQo+J3d0cicgaXMgZm9yICJXYWl0ICd0aWwgUmVhZHkiLiAgU29tZSByZWdpc3Rl
ciB3cml0ZXMgYXJlIGluc3RhbnQsIHdoaWxlIG90aGVycw0KPnJlcXVpcmUgcG9sbGluZyBvZiB0
aGUgIldyaXRlIEluIFByb2dyZXNzIiBiaXQuDQo+DQpVbmxlc3MgYSByZWdpc3RlciBpcyBjb250
cm9sbGluZyBhIHN0YXR1cyBvZiBpbnRlcm5hbCBzdGF0ZS1tYWNoaW5lLCBvciBzb21ldGhpbmcN
Ckl0IHNob3VsZCBiZSBpbnN0YW50YW5lb3VzbHkgd3JpdGFibGUuDQoNCkFsc28gcG9sbGluZyBz
aG91bGQgbm90IGJlIHBhcnQgb2YgdGhpcyBwYXJ0aWN1bGFyICood3JpdGVfcmVnKSwgaWYgYSBy
ZWdpc3Rlcg0KbmVlZHMgdG8gYmUgcG9sbGVkIHRoZW4gaXQgc2hvdWxkIGJlIHBhcnQgb2YgKih3
cml0ZSkgb3IgKihyZWFkKSAuLiBMaWtlIA0KV0lQOiBXcml0ZS1pbi1wcm9ncmVzcyBiaXQgb2Yg
Zmxhc2gNCmdlbmVyaWNfZmxhc2hfd3JpdGUoLi4uKSB7DQoJd2hpbGUgKChyZWFkX3JlZyhTVEFU
VVNfUkVHKSAmIFdJUCkgfHwgfnRpbWVvdXQpIHsNCgkJdGltZW91dC0tOw0KCX07DQoNCg0KV2l0
aCB0aGlzIGl0IGp1c3QgY2FtZSB0byBteSBtaW5kLCB0aGF0IHlvdSBhbHNvIG5lZWQgYSAndGlt
ZW91dCcgZmllbGQNCmluICdzdHJ1Y3Qgc3Bpbm9yLWNmZycuIFRoaXMgaXMgYmVjYXVzZSBkaWZm
ZXJlbnQgY29udHJvbGxlcnMgd291bGQgYmUNCnJ1bm5pbmcgYXQgZGlmZmVyZW50IGNsb2NrIHNw
ZWVkcyAoYW5kIGRpZmZlcmVudCBTUElfQ0xLIGZyZXF1ZW5jaWVzKS4NClNvIHRoZXkgbmVlZCB0
byBzcGVjaWZ5IGEgJ3RpbWVvdXQnIHZhbHVlIGZvciBhbGwgcG9sbGluZyBhY2Nlc3Nlcy4NCg0K
DQp3aXRoIHJlZ2FyZHMsIHBla29uDQo=
