Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYs2U-0002jv-FU
 for linux-mtd@lists.infradead.org; Tue, 30 Sep 2014 07:40:02 +0000
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: "richard@nod.at" <richard@nod.at>
Subject: Re: [PATCH 4/4] UBI: Fastmap: Ensure that only one fastmap work is
 scheduled
Date: Tue, 30 Sep 2014 07:39:23 +0000
Message-ID: <1412062762.2379.2.camel@sauron.fi.intel.com>
References: <1412029248-22454-1-git-send-email-richard@nod.at>
 <1412029248-22454-5-git-send-email-richard@nod.at>
 <1412059523.3904.11.camel@sauron.fi.intel.com> <542A54E4.2060407@nod.at>
In-Reply-To: <542A54E4.2060407@nod.at>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9DC0D1863988D498340914385FE4AD1@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gVHVlLCAyMDE0LTA5LTMwIGF0IDA4OjU5ICswMjAwLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3Jv
dGU6DQo+IEFtIDMwLjA5LjIwMTQgMDg6NDUsIHNjaHJpZWIgQml0eXV0c2tpeSwgQXJ0ZW06DQo+
ID4gT24gVHVlLCAyMDE0LTA5LTMwIGF0IDAwOjIwICswMjAwLCBSaWNoYXJkIFdlaW5iZXJnZXIg
d3JvdGU6DQo+ID4+ICsgICAgICAgc3Bpbl9sb2NrKCZ1YmktPndsX2xvY2spOw0KPiA+PiArICAg
ICAgIHViaS0+Zm1fd29ya19zY2hlZHVsZWQgPSAwOw0KPiA+PiArICAgICAgIHNwaW5fdW5sb2Nr
KCZ1YmktPndsX2xvY2spOw0KPiA+IA0KPiA+IEFuZHJldyBNb3J0b24gb25jZSBzYWlkIG1lIHRo
YXQgaWYgSSBhbSBwcm90ZWN0aW5nIGFuIGludGVnZXIgY2hhbmdlDQo+ID4gbGlrZSB0aGlzIHdp
dGggYSBzcGlubG9jaywgSSBoYXZlIGEgcHJvYmxlbSBpbiBteSBsb2NraW5nIGRlc2lnbi4gSGUg
d2FzDQo+ID4gcmlnaHQgZm9yIG15IHBhcnRpY3VsYXIgY2FzZS4NCj4gPiANCj4gPiBJbnRlZ2Vy
IGlzIGNoYW5nZXMgYXRvbWljLiBUaGUgb25seSBvdGhlciB0aGluZyBzcGlubG9jayBhZGRzIGFy
ZSB0aGUNCj4gPiBiYXJyaWVycy4NCj4gDQo+IEkndmUgYWRkZWQgdGhlIHNwaW5sb2NrIHRvIGhh
dmUgYSBiYXJyaWVyIGluIGFueSBjYXNlLg0KDQpFeGFtcGxlcyBvZiBhbnk/DQoNCi0tIA0KQmVz
dCBSZWdhcmRzLA0KQXJ0ZW0gQml0eXV0c2tpeQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkludGVsIEZpbmxhbmQg
T3kKUmVnaXN0ZXJlZCBBZGRyZXNzOiBQTCAyODEsIDAwMTgxIEhlbHNpbmtpIApCdXNpbmVzcyBJ
ZGVudGl0eSBDb2RlOiAwMzU3NjA2IC0gNCAKRG9taWNpbGVkIGluIEhlbHNpbmtpIAoKVGhpcyBl
LW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgbWF0ZXJp
YWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLiBBbnkgcmV2
aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBvdGhlcnMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYg
eW91IGFyZSBub3QgdGhlIGludGVuZGVkCnJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNl
bmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMuCg==
