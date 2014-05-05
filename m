Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhGxf-0007IR-GB
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 11:21:32 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [PATCH 3/3] nandtest: Introduce multiple reads & check iterations
Date: Mon, 5 May 2014 11:21:05 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EACA6E9@DBDE04.ent.ti.com>
References: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1398690859-11494-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20980858CB6D3A4BAE95CA194937D5E73EACA5DB@DBDE04.ent.ti.com>
 <20140505103335.GF2873@arch.cereza>
 <20980858CB6D3A4BAE95CA194937D5E73EACA6B9@DBDE04.ent.ti.com>
 <1399288152.15290.21.camel@sauron.fi.intel.com>
In-Reply-To: <1399288152.15290.21.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 =?utf-8?B?R3VpZG8gTWFydMOtbmV6?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgQXJ0ZW0sDQoNCj5Gcm9tOiBBcnRlbSBCaXR5dXRza2l5IFttYWlsdG86ZGVkZWtpbmQxQGdt
YWlsLmNvbV0NCj4+T24gTW9uLCAyMDE0LTA1LTA1IGF0IDEwOjU4ICswMDAwLCBHdXB0YSwgUGVr
b24gd3JvdGU6DQo+PiBUaGVyZWZvcmUsIEknbSBub3Qgc3VyZSBoYXZpbmcgcmUtcmVhZHMgaXMg
YSBnb29kIHRlc3Qgb3Igbm90LA0KPmJlY2F1c2UNCj4+IHJlLXJlYWRzIGlzIGNoYW5naW5nIHRo
ZSB1bmRlcmx5aW5nIHRlc3Rpbmcgc2NlbmFyaW8gYnkgaW50cm9kdWNpbmcNCj4+IF9uZXdfDQo+
PiBiaXQtZmxpcHMgaW4gbmVpZ2hib3JpbmcgcmVnaW9ucyBwYWdlcyBiZWNhdXNlIG9mIHJlYWQt
ZGlzdHVyYnMuDQo+DQo+SWYgdGhlIGRyaXZlciAvIEhXIGNhbm5vdCBwcm9wZXJseSBoYW5kbGUg
NCByZS1yZWFkcywgd2UgZG8gd2FudCB0aGUNCj50ZXN0IHRvIGNhdGNoIHRoaXMsIEkgdGhpbmss
IGlycmVzcGVjdGl2ZSBvZiB0aGUgdHJ1ZSBuYXR1cmUgb2YgdGhlDQo+ZXJyb3IuDQo+DQo+VGhl
cmVmb3JlLCBJIHNlZSB0aGlzIHBhdGNoIHdpdGggYSBkZWZhdWx0IDQgYXMgYW4gaW1wcm92ZW1l
bnQuDQo+DQo+LS0NCj5CZXN0IFJlZ2FyZHMsDQo+QXJ0ZW0gQml0eXV0c2tpeQ0KDQpJJ20gbm90
IGFnYWluc3QgdGhlIHBhdGNoLCBidXQgbXkgdGhvdWdodCBpcyB0aGF0IHJlLXJlYWRzIGFyZQ0K
aW50cm9kdWNpbmcgcmVhZC1kaXN0dXJiIGJpdC1mbGlwcy4NCk5vdyBpbiBldmVudCBvZiBubyBV
QklGUyB0aGVyZSB3b3VsZCBiZSBubyBzY3J1YmJpbmcuIFNvIHRoZXNlIGJpdC1mbGlwcw0Kd2ls
bCBrZWVwIG9uIGFjY3VtdWxhdGluZy4gQW5kIG9uY2UgdGhlc2UgYml0LWZsaXBzIGNyb3NzIGJl
eW9uZA0KZWNjLnN0cmVuZ3RoIHRoZW4gdGhlIG5hbmRfcmVhZCBpcyBib3VuZCB0byBmYWlsLg0K
U28gdGhpcyBtYWtlcyB0aGlzIHRlc3QgdW4tZGV0ZXJtaW5pc3RpYy4NCg0KRXhhbXBsZTogSWYg
SSB1c2UgdGhpcyB0ZXN0IHdpdGggYW55IGRyaXZlciB1c2luZyAxLWJpdCBFQ0MgY29ycmVjdGlv
bi4gVGhlbg0KLSB0ZXN0IHdpbGwgbW9zdCBsaWtlbHkgZmFpbCBvbiB3ZWFrIG9yIGFnZWQgTkFO
RCBkZXZpY2VzLCBhcyB0aGV5IGFyZSBtb3JlDQogIHByb25lIHRvIHJlYWQtZGlzdHVyYiBlcnJv
cnMuDQotIEJ1dCBfbWF5XyBub3QgZmFpbCBvbiBmcmVzaCBkZXZpY2VzIHVzaW5nIHNhbWUgZHJp
dmVyIHdpdGggMS1iaXQgRUNDIGNvcnJlY3Rpb24uDQoNClNvIG15IGFyZ3VtZW50IGlzIHRoYXQg
dGhpcyB0ZXN0IGlzIGFjdHVhbGx5IG5vdCB0ZXN0aW5nIHRoZSBOQU5EIGRyaXZlciwNCml0IGlz
IGFjdHVhbGx5IHRlc3RpbmcgdGhlIHdlYWtuZXNzIG9mIE5BTkQgZGV2aWNlLg0KDQoNCndpdGgg
cmVnYXJkcywgcGVrb24NCg==
