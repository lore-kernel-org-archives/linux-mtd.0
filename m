Received: from mailout.micron.com ([137.201.242.129])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W14XL-0007YW-8h
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2014 01:35:56 +0000
From: =?utf-8?B?UWkgV2FuZyDnjovotbcgKHFpd2FuZyk=?= <qiwang@micron.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [PATCH 1/1]  MTD: UBI:  avoid program operation on  NOR flash
 after erasure interrupted
Date: Thu, 9 Jan 2014 01:35:24 +0000
Message-ID: <71CF8D7F32C5C24C9CD1D0E02D52498A770C7770@NTXXIAMBX02.xacn.micron.com>
References: <71CF8D7F32C5C24C9CD1D0E02D52498A770B54B1@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B68A8@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B6F77@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B79C8@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B8611@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770BA389@NTXXIAMBX02.xacn.micron.com>
 <1388675460.25123.90.camel@sauron.fi.intel.com>
 <1388676172.25123.93.camel@sauron.fi.intel.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770BA889@NTXXIAMBX02.xacn.micron.com>
 <1388728253.25123.98.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: =?utf-8?B?UWkgV2FuZyDnjovotbcgKHFpd2FuZyk=?= <qiwang@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

SGkgQXJ0ZW06DQpEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbiBmb3IgbXkgbW9kaWZpY2F0aW9u
Pw0KT3RoZXIgY29kZSBJIHRoaW5rIGl0IGlzIG9rLg0KVGhhbmtzDQoNCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IFFpIFdhbmcg546L6LW3IChxaXdhbmcpIA0KU2VudDogTW9u
ZGF5LCBKYW51YXJ5IDA2LCAyMDE0IDE6MTEgUE0NClRvOiAnZGVkZWtpbmQxQGdtYWlsLmNvbScN
CkNjOiBBZHJpYW4gSHVudGVyOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1t
dGRAbGlzdHMuaW5mcmFkZWFkLm9yZw0KU3ViamVjdDogUkU6IFtQQVRDSCAxLzFdIE1URDogVUJJ
OiBhdm9pZCBwcm9ncmFtIG9wZXJhdGlvbiBvbiBOT1IgZmxhc2ggYWZ0ZXIgZXJhc3VyZSBpbnRl
cnJ1cHRlZA0KDQo+UGxlYXNlLCByZW1lbWJlciB0aGF0IEkgcHVzaGVkIHlvdXIgcGF0Y2ggdG8g
YSB0ZW1wb3JhcnkgYnJhbmNoLCBvbmx5DQo+Zm9yIHlvdSB0byBiZSBhYmxlIHRvIGVhc2lseSBw
aWNrIGl0LiBJIGRvIG5vdCBzZW5kIGl0IHVwc3RyZWFtLg0KDQo+QXMgSSBzYWlkLCBJIG5lZWQg
dG8geW91IGxvb2sgYXQgaXQgYW5kIGNvbmZpcm0gdGhhdCBpdCBpcyBhbGwtcmlnaHQuDQo+QW5k
IGlmIGl0IGlzIG5vdCBhbGwtcmlnaHQsIGNvcnJlY3QgaXQuDQoNCj5UaGlzIGlzIGJlY2F1c2Ug
SSBtb2RpZmllZCBpdCBteXNlbGYuDQoNCj5TbyB3YWl0aW5nIGZvciB5b3VyIHJlc3BvbnNlIG9u
IHRoaXMuDQpJIGNoZWNrZWQgdGhlIGNvZGUgeW91IG1vZGlmaWVkLCBjb21waWxlLCBhbmQgcnVu
IG9uIG91ciBwbGF0Zm9ybSwgaXQgaXMgb2suDQoNCisJdWJpX2VycigiY2Fubm90IGludmFsaWRh
dGUgUEVCICVkLCB3cml0ZSByZXR1cm5lZCAlZCB3cml0ZSByZXR1cm5lZCAlZCIsDQorCQlwbnVt
LCBlcnIsIGVycik7IA0KDQpCdXQgSSB0aGluayBhYm92ZSBjb2RlIHByaW50ICJ3cml0ZSBlcnIi
IHR3aWNlLiBzbyBJIHN1Z2dlc3QgdG8gY2hhbmdlIHRvIGJlbG93Og0KDQorCXViaV9lcnIoImNh
bm5vdCBpbnZhbGlkYXRlIFBFQiAlZCwgd3JpdGUgcmV0dXJuZWQgJWQiLCBwbnVtLCBlcnIpOw0K
IA0KSSB3aWxsIHNlbmQgeW91IHRoZSBwYXRjaCBpbiBhbm90aGVyIGVtYWlsIGNvbnZlbmllbnQg
Zm9yIHlvdSB0byBhcHBseSBwYXRjaC4NClRoYW5rcw0KLS0NCnFpd2FuZyANCg==
