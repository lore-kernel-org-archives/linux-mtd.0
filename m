Received: from mailout.micron.com ([137.201.242.129])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W02TL-00080d-8U
 for linux-mtd@lists.infradead.org; Mon, 06 Jan 2014 05:11:32 +0000
From: =?utf-8?B?UWkgV2FuZyDnjovotbcgKHFpd2FuZyk=?= <qiwang@micron.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [PATCH 1/1]  MTD: UBI:  avoid program operation on  NOR flash
 after erasure interrupted
Date: Mon, 6 Jan 2014 05:11:01 +0000
Message-ID: <71CF8D7F32C5C24C9CD1D0E02D52498A770C4C33@NTXXIAMBX02.xacn.micron.com>
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
In-Reply-To: <1388728253.25123.98.camel@sauron.fi.intel.com>
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

PlBsZWFzZSwgcmVtZW1iZXIgdGhhdCBJIHB1c2hlZCB5b3VyIHBhdGNoIHRvIGEgdGVtcG9yYXJ5
IGJyYW5jaCwgb25seQ0KPmZvciB5b3UgdG8gYmUgYWJsZSB0byBlYXNpbHkgcGljayBpdC4gSSBk
byBub3Qgc2VuZCBpdCB1cHN0cmVhbS4NCg0KPkFzIEkgc2FpZCwgSSBuZWVkIHRvIHlvdSBsb29r
IGF0IGl0IGFuZCBjb25maXJtIHRoYXQgaXQgaXMgYWxsLXJpZ2h0Lg0KPkFuZCBpZiBpdCBpcyBu
b3QgYWxsLXJpZ2h0LCBjb3JyZWN0IGl0Lg0KDQo+VGhpcyBpcyBiZWNhdXNlIEkgbW9kaWZpZWQg
aXQgbXlzZWxmLg0KDQo+U28gd2FpdGluZyBmb3IgeW91ciByZXNwb25zZSBvbiB0aGlzLg0KSSBj
aGVja2VkIHRoZSBjb2RlIHlvdSBtb2RpZmllZCwgY29tcGlsZSwgYW5kIHJ1biBvbiBvdXIgcGxh
dGZvcm0sIGl0IGlzIG9rLg0KDQorCXViaV9lcnIoImNhbm5vdCBpbnZhbGlkYXRlIFBFQiAlZCwg
d3JpdGUgcmV0dXJuZWQgJWQgd3JpdGUgcmV0dXJuZWQgJWQiLA0KKwkJcG51bSwgZXJyLCBlcnIp
OyANCg0KQnV0IEkgdGhpbmsgYWJvdmUgY29kZSBwcmludCAid3JpdGUgZXJyIiB0d2ljZS4gc28g
SSBzdWdnZXN0IHRvIGNoYW5nZSB0byBiZWxvdzoNCg0KKwl1YmlfZXJyKCJjYW5ub3QgaW52YWxp
ZGF0ZSBQRUIgJWQsIHdyaXRlIHJldHVybmVkICVkIiwgcG51bSwgZXJyKTsNCiANCkkgd2lsbCBz
ZW5kIHlvdSB0aGUgcGF0Y2ggaW4gYW5vdGhlciBlbWFpbCBjb252ZW5pZW50IGZvciB5b3UgdG8g
YXBwbHkgcGF0Y2guDQpUaGFua3MNCi0tDQpxaXdhbmcgDQo=
