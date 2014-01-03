Received: from mailout.micron.com ([137.201.242.129])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VyuXy-0005TP-GC
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 02:31:39 +0000
From: =?utf-8?B?UWkgV2FuZyDnjovotbcgKHFpd2FuZyk=?= <qiwang@micron.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [PATCH 1/1]  MTD: UBI:  avoid program operation on  NOR flash
 after erasure interrupted
Date: Fri, 3 Jan 2014 02:31:12 +0000
Message-ID: <71CF8D7F32C5C24C9CD1D0E02D52498A770BA889@NTXXIAMBX02.xacn.micron.com>
References: <71CF8D7F32C5C24C9CD1D0E02D52498A770B54B1@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B68A8@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B6F77@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B79C8@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B8611@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770BA389@NTXXIAMBX02.xacn.micron.com>
 <1388675460.25123.90.camel@sauron.fi.intel.com>
 <1388676172.25123.93.camel@sauron.fi.intel.com>
In-Reply-To: <1388676172.25123.93.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T0ssIHRoYW5rIHlvdSBBcnRlbS4NCg0KSSB3aWxsIGNoYW5nZSB0byBnaXQgc2VuZC1tYWlsIG5l
eHQgdGltZS4gQW5kIEkgd2lsbCBiZSB2ZXJ5IGNhcmVmdWwgdG8gcHVzaCBwYXRjaCB0byB5b3Ug
bmV4dCB0aW1lLg0KU29ycnkgdG8gYnJpbmcgc28gbXVjaCB0cm91YmxlIHRvIHlvdSBhcyBJIGFt
IGZpcnN0IHRpbWUgdG8gcHVzaCBwYXRjaCB0byBMaW51eCBtYWluIHRydW5rLihNYXliZSBpdCBh
bHNvIGlzIE1pY3JvbiBUZWNobm9sb2d5IGNvbXBhbnkgZmlyc3QgdGltZSB0byBwdXNoIHBhdGNo
IHRvIExpbnV4IG1haW4gdHJ1bmssIEkgYW0gYmVpbmcgTWljcm9uIENoaW5hIFNoYW5naGFpIHRl
YW0gdm9sdW50ZWVyIHRvIGNvbnRhY3QgTGludXggY29tbWl0dGVlIHRvIHB1c2ggcGF0Y2gpLiAN
CkFueXdheSwgVGhhbmtzIGZvciB5b3VyIHBhdGllbmNlIHRvIGdpdmUgbWUgYSBnb29kIHN0YXJ0
aW5nLiANCkFuZCBpZiB5b3UgaGF2ZSBhbnl0aGluZyBuZWVkIG15IG9yIG15IHRlYW0gaGVscCwg
UGxlYXNlIGtpbmRseSBsZXQgbWUga25vdy4gT3VyIHRlYW0gaXMgZ2xhZCB0byBjb250cmlidXRl
IHRvIExpbnV4IGNvbW11bml0eS4NCldpc2ggeW91IGhhdmUgYSB3b25kZXJmdWwgMjAxNC4NClRo
YW5rIHlvdQ0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBcnRlbSBCaXR5
dXRza2l5IFttYWlsdG86ZGVkZWtpbmQxQGdtYWlsLmNvbV0gDQpTZW50OiBUaHVyc2RheSwgSmFu
dWFyeSAwMiwgMjAxNCAxMToyMyBQTQ0KVG86IFFpIFdhbmcg546L6LW3IChxaXdhbmcpDQpDYzog
QWRyaWFuIEh1bnRlcjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtbXRkQGxp
c3RzLmluZnJhZGVhZC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8xXSBNVEQ6IFVCSTogYXZv
aWQgcHJvZ3JhbSBvcGVyYXRpb24gb24gTk9SIGZsYXNoIGFmdGVyIGVyYXN1cmUgaW50ZXJydXB0
ZWQNCg0KT24gVGh1LCAyMDE0LTAxLTAyIGF0IDE3OjExICswMjAwLCBBcnRlbSBCaXR5dXRza2l5
IHdyb3RlOg0KPiBBbnl3YXksIEkgZGlkIG5vdCByZXNwb25kIGZvciBsb25nIHRpbWUsIHNvIEkg
ZGVjaWRlZCB0byBkbyBhbGwgdGhlc2UNCj4gbW9kaWZpY2F0aW9ucyBteXNlbGYuIENvdWxkIHlv
dSBwbGVhc2UgcmV2aWV3IGFuZCB0ZXN0IHRoZSBiZWxvdyBwYXRjaCwNCj4gd2hpY2ggaXMgYWxz
byBhdHRhY2hlZC4gSSBkaWQgbm90IGNvbXBpbGUgaXQgZXZlbi4gSWYgdGhlcmUgYXJlIGlzc3Vl
cywNCj4ganVzdCBmaXgtaXQgdXAgYW5kIHNlbmQgdGhlIHRoZSBmaXggb3IgdGhlIGZpeGVkIHZl
cnNpb24uIElmIGl0IGlzIE9LLA0KPiBnaXZlIG1lIHlvdXIgIlRlc3RlZC1ieToiIHBsZWFzZS4g
VGhhbmtzIQ0KDQpBY3R1YWxseSwgZm9yIGNvbnZlbmllbmNlLCBJJ3ZlIHB1c2hlZCB0aGlzIHBh
dGNoIHRvIHRoZSAncWknIGJyYW5jaCBvZg0KdGhlICdsaW51eC11YmlmcycgZ2l0IHRyZWU6DQoN
CmdpdDovL2dpdC5pbmZyYWRlYWQub3JnL3ViaWZzLTIuNi5naXQNCg0KLS0gDQpCZXN0IFJlZ2Fy
ZHMsDQpBcnRlbSBCaXR5dXRza2l5DQoNCg==
