Received: from mail-bl2lp0208.outbound.protection.outlook.com
 ([207.46.163.208] helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XA9xH-0005Z7-0b
 for linux-mtd@lists.infradead.org; Thu, 24 Jul 2014 03:44:34 +0000
From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: RE: [PATCH RFC v3 2/2] memory: pl353: Add driver for arm pl353
 static memory controller
Date: Thu, 24 Jul 2014 03:44:03 +0000
References: <1403838162-18756-1-git-send-email-punnaia@xilinx.com>
 <CAGnW=BaU6iS6BNa_MQNAK_Sck-Cv=Z3iL87gMENPQOq2otMjKg@mail.gmail.com>
 <CAGnW=BbiMQchQeWPE8gKsr8QuGPkurt7kb3hGcqf+fjyrVi0ww@mail.gmail.com>
 <201407232148.15419.arnd@arndb.de>
In-Reply-To: <201407232148.15419.arnd@arndb.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID: <d9b01b11-da65-4e79-b3de-e5065df76281@BL2FFO11FD009.protection.gbl>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Srikanth Vemula <svemula@xilinx.com>, Michal Simek <michals@xilinx.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 Grant Likely <grant.likely@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "pawel.moll@arm.com" <pawel.moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 Anirudha Sarangi <anirudh@xilinx.com>, "joern@logfs.org" <joern@logfs.org>,
 Punnaiah Choudary <kpc528@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "acourbot@nvidia.com" <acourbot@nvidia.com>, "Gupta, Pekon" <pekon@ti.com>,
 "kalluripunnaiahchoudary@gmail.com" <kalluripunnaiahchoudary@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, "Khoronzhuk,
 Ivan" <ivan.khoronzhuk@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgQXJuZA0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBBcm5kIEJlcmdt
YW5uIFttYWlsdG86YXJuZEBhcm5kYi5kZV0NCj5TZW50OiBUaHVyc2RheSwgSnVseSAyNCwgMjAx
NCAxOjE4IEFNDQo+VG86IFB1bm5haWFoIENob3VkYXJ5IEthbGx1cmkNCj5DYzogUHVubmFpYWgg
Q2hvdWRhcnkgS2FsbHVyaTsgcm9iaCtkdEBrZXJuZWwub3JnOyBwYXdlbC5tb2xsQGFybS5jb207
DQo+bWFyay5ydXRsYW5kQGFybS5jb207IGlqYytkZXZpY2V0cmVlQGhlbGxpb24ub3JnLnVrOyBL
dW1hciBHYWxhOyBSb2INCj5MYW5kbGV5OyBNaWNoYWwgU2ltZWs7IEdyYW50IExpa2VseTsgZ3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7DQo+amFzb25AbGFrZWRhZW1vbi5uZXQ7IGV6ZXF1aWVs
LmdhcmNpYUBmcmVlLWVsZWN0cm9ucy5jb207IERhdmlkDQo+V29vZGhvdXNlOyBCcmlhbiBOb3Jy
aXM7IGFydGVtLmJpdHl1dHNraXlAbGludXguaW50ZWwuY29tOyBHdXB0YSwgUGVrb247DQo+anVz
c2kua2l2aWxpbm5hQGlraS5maTsgYWNvdXJib3RAbnZpZGlhLmNvbTsgS2hvcm9uemh1aywgSXZh
bjsNCj5qb2VybkBsb2dmcy5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1k
b2NAdmdlci5rZXJuZWwub3JnOw0KPmxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOyBQdW5uYWlhaA0KPkNob3VkYXJ5OyBBbmlydWRoYSBT
YXJhbmdpOyBTcmlrYW50aCBWZW11bGENCj5TdWJqZWN0OiBSZTogW1BBVENIIFJGQyB2MyAyLzJd
IG1lbW9yeTogcGwzNTM6IEFkZCBkcml2ZXIgZm9yIGFybSBwbDM1MyBzdGF0aWMNCj5tZW1vcnkg
Y29udHJvbGxlcg0KPg0KPk9uIE1vbmRheSAyMSBKdWx5IDIwMTQsIHB1bm5haWFoIGNob3VkYXJ5
IGthbGx1cmkgd3JvdGU6DQo+PiBPbiBNb24sIEp1bCA3LCAyMDE0IGF0IDEwOjE1IFBNLCBwdW5u
YWlhaCBjaG91ZGFyeSBrYWxsdXJpDQo+PiA8cHVubmFpYUB4aWxpbnguY29tPiB3cm90ZToNCj4+
ID4gT24gVGh1LCBKdWwgMywgMjAxNCBhdCA0OjA5IFBNLCBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPiB3cm90ZToNCj4+ID4+IE9uIEZyaWRheSAyNyBKdW5lIDIwMTQgMDg6MzI6NDIgUHVu
bmFpYWggQ2hvdWRhcnkgS2FsbHVyaSB3cm90ZToNCj4+ID4+DQo+PiA+Pj4gKy8qKg0KPj4gPj4+
ICsgKiBzdHJ1Y3QgcGwzNTNfc21jX2RhdGEgLSBQcml2YXRlIHNtYyBkcml2ZXIgc3RydWN0dXJl
DQo+PiA+Pj4gKyAqIEBkZXZjbGs6ICAgICAgICAgIFBvaW50ZXIgdG8gdGhlIHBlcmlwaGVyYWwg
Y2xvY2sNCj4+ID4+PiArICogQGFwZXJjbGs6ICAgICAgICAgUG9pbnRlciB0byB0aGUgQVBFUiBj
bG9jaw0KPj4gPj4+ICsgKi8NCj4+ID4+PiArc3RydWN0IHBsMzUzX3NtY19kYXRhIHsNCj4+ID4+
PiArICAgICBzdHJ1Y3QgY2xrICAgICAgICAgICAgICAqbWVtY2xrOw0KPj4gPj4+ICsgICAgIHN0
cnVjdCBjbGsgICAgICAgICAgICAgICphY2xrOw0KPj4gPj4+ICt9Ow0KPj4gPj4+ICsNCj4+ID4+
PiArLyogU01DIHZpcnR1YWwgcmVnaXN0ZXIgYmFzZSAqLw0KPj4gPj4+ICtzdGF0aWMgdm9pZCBf
X2lvbWVtICpwbDM1M19zbWNfYmFzZTsNCj4+ID4+DQo+PiA+PiBEcml2ZXJzIHNob3VsZCBub3Qg
YXNzdW1lIHRoYXQgdGhlcmUgaXMgb25seSBhIHNpbmdsZSBpbnN0YW5jZSBvZiB0aGUNCj4+ID4+
IGhhcmR3YXJlIGluIHRoZSBzeXN0ZW0uIFBsZWFzZSByZW1vdmUgdGhpcyBnbG9iYWwgdmFyaWFi
bGUgYW5kDQo+PiA+PiBjaGFuZ2UgdGhlIGNvZGUgdG8gcGFzcyBhcm91bmQgYSBwb2ludGVyIHRv
IGEgc3RydWN0dXJlIGNvbnRhaW5pbmcNCj4+ID4+IGl0Lg0KPj4gPg0KPj4gPiBTaW5jZSwgdGhl
IHBsMzUzIG5hbmQgZHJpdmVyIGhhcyBkZXBlbmRlbmN5IHdpdGggdGhpcyBkcml2ZXIgZm9yDQo+
Y29uZmlndXJpbmcgdGhlDQo+PiA+IGJ1cyB3aWR0aCxvcGVyYXRpb25hbCBwYXJhbWV0ZXJzIGFu
ZCBlY2Mgc3BlY2lmaWMgc2V0dGluZ3MuDQo+PiA+IFNvLCBpIGRpZG50IGZpbmQgYW55IG1lY2hh
bmlzbSBmb3IgcGFzc2luZyB0aGlzIGluc3RhbmNlIGZyb20gb3RoZXIgZHJpdmVyDQo+b3RoZXIN
Cj4+ID4gdGhhbiBleHBvcnRpbmcgdGhpcyBpbnN0YW5jZS4NCj4+ID4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDE0LUFwcmlsLzA1MzQzMi5odG1sDQo+
PiA+DQo+PiA+IFBsZWFzZSBzdWdnZXN0IHRoZSBiZXR0ZXIgb3B0aW9uIGlmIHlvdSB3YW50IGl0
IHRvIGJlIG5vdCBnbG9iYWwuDQo+DQo+SSB3b3VsZCBleHBlY3QgdGhlIG5hbmQgZGV2aWNlIHRv
IGJlIGEgY2hpbGQgb2YgdGhlIHNtYyBkZXZpY2UuIEluIHRoaXMgY2FzZSwNCj50aGUgbmFuZCBk
cml2ZXIgY2FuIGp1c3QgcGFzcyBhIHBvaW50ZXIgdG8gaXRzIG93biAnc3RydWN0IGRldmljZScs
IGFuZCB0aGUNCj5zbWMgZHJpdmVyIGNhbiBmaW5kIGl0cyBkYXRhIHVzaW5nIGRldl9nZXRfZHJ2
ZGF0YShkZXYtPnBhcmVudCkuDQoNCk9rLg0KPg0KPj4gPj4+ICsvKioNCj4+ID4+PiArICogcGwz
NTNfc21jX3NldF9idXN3aWR0aCAtIFNldCBtZW1vcnkgYnVzd2lkdGgNCj4+ID4+PiArICogQGJ3
OiAgICAgIE1lbW9yeSBidXN3aWR0aCAoOCB8IDE2KQ0KPj4gPj4+ICsgKiBSZXR1cm46IDAgb24g
c3VjY2VzcyBvciBuZWdhdGl2ZSBlcnJuby4NCj4+ID4+PiArICovDQo+PiA+Pj4gK2ludCBwbDM1
M19zbWNfc2V0X2J1c3dpZHRoKHVuc2lnbmVkIGludCBidykNCj4+ID4+PiArew0KPj4gPj4+ICsN
Cj4+ID4+PiArICAgICBpZiAoYncgIT0gUEwzNTNfU01DX01FTV9XSURUSF84ICAmJiBidyAhPQ0K
PlBMMzUzX1NNQ19NRU1fV0lEVEhfMTYpDQo+PiA+Pj4gKyAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4+ID4+PiArDQo+PiA+Pj4gKyAgICAgd3JpdGVsKGJ3LCBwbDM1M19zbWNfYmFzZSAr
IFBMMzUzX1NNQ19TRVRfT1BNT0RFX09GRlMpOw0KPj4gPj4+ICsgICAgIHdyaXRlbChQTDM1M19T
TUNfRENfVVBUX05BTkRfUkVHUywgcGwzNTNfc21jX2Jhc2UgKw0KPj4gPj4+ICsgICAgICAgICAg
ICBQTDM1M19TTUNfRElSRUNUX0NNRF9PRkZTKTsNCj4+ID4+PiArDQo+PiA+Pj4gKyAgICAgcmV0
dXJuIDA7DQo+PiA+Pj4gK30NCj4+ID4+PiArRVhQT1JUX1NZTUJPTF9HUEwocGwzNTNfc21jX3Nl
dF9idXN3aWR0aCk7DQo+PiA+Pg0KPj4gPj4gV2h5IGlzIHRoaXMgYW4gZXhwb3J0ZWQgaW50ZXJm
YWNlPyBXb3VsZG4ndCB0aGF0IHNldHRpbmcganVzdCBiZQ0KPj4gPj4gZGV0ZXJtaW5lZCBmcm9t
IERUIHdoZW4gdGhlIGRldmljZSBpcyBwcm9iZWQ/DQo+PiA+DQo+PiA+IE5hbmQgZHJpdmVyIHJl
bHkgb24gYXV0byBidXMgd2lkdGggZGV0ZWN0aW9uIG1lY2hhbmlzbSBmb3IgaWRlbnRpZnlpbmcN
Cj4+ID4gdGhlIGJ1cyB3aWR0aCB1c2luZyBvbmZpIHBhcmFtZXRlciBwYWdlIHNldHRpbmdzLiBT
bywgb25jZSB0aGUgZHJpdmVyDQo+PiA+IGZpbmRzIHRoZSBidXMgd2lkdGgsIHVwZGF0ZXMgYWNj
b3JkaW5nbHkgdXNpbmcgdGhpcyBBUEkNCj4NCj5UaGlzIHNob3VsZCBhdCBsZWFzdCBwYXNzIHRo
ZSBkZXZpY2UgcG9pbnRlciB0aGVuLg0KDQpPay4gVGhhbmtzLiBJIHdpbGwgdXBkYXRlIHRoZSBk
cml2ZXIgYW5kIHNlbmQgeW91IHRoZSB1cGRhdGVkIHZlcnNpb24uDQoNClJlZ2FyZHMsDQpQdW5u
YWlhaA0KPg0KPg0KPglBcm5kDQo=
