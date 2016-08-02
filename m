Received: from mail-he1eur01on0107.outbound.protection.outlook.com
 ([104.47.0.107] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUTn6-0008Bg-8Z
 for linux-mtd@lists.infradead.org; Tue, 02 Aug 2016 07:07:05 +0000
From: "Zhou, John (Nokia - CN/Hangzhou)" <john.zhou@nokia.com>
To: Richard Weinberger <richard@nod.at>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: how to create one ubifs image support both for different page
 size and sector size?
Date: Tue, 2 Aug 2016 07:06:40 +0000
Message-ID: <AM3PR07MB0758263689E84587F5EDCED2F2050@AM3PR07MB0758.eurprd07.prod.outlook.com>
References: <DB4PR07MB062499D49F50F0923E2DE33BF2000@DB4PR07MB0624.eurprd07.prod.outlook.com>
 <CAFLxGvz+5rKiK5si4XtPKkHtJwJ=nub6xDMxOyMfYqQZrdzRLA@mail.gmail.com>
 <AM3PR07MB075848DCD6F716812516B216F2050@AM3PR07MB0758.eurprd07.prod.outlook.com>
 <57A045CA.8070302@nod.at>
In-Reply-To: <57A045CA.8070302@nod.at>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

WWVzICwgdGhpcyBpcyBhIHByb2JsZW0gdG8gZmFjdG9yeSBndXlzIGZvciBwcm9kdWN0aW9uLg0K
DQpXaGVuIHRoZXkgaGF2ZSBvbmUgZmxhc2ggaW4gaGFuZCwgdGhleSBjYW4ndCBmaWd1cmUgb3V0
IHdoaWNoIGZsYXNoIGl0IGlzLCBpdCdzIGFsbCBhdXRvbWF0aWNhbGx5Lg0KU28gdGhleSBkb24n
dCBrbm93IHdoaWNoIGltYWdlIGlzIHN1aXRhYmxlIGZvciBzcGVjaWZpYyBmbGFzaC4NCg0KQnJz
DQpKb2huDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgV2Vp
bmJlcmdlciBbbWFpbHRvOnJpY2hhcmRAbm9kLmF0XSANClNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAw
MiwgMjAxNiAzOjA0IFBNDQpUbzogWmhvdSwgSm9obiAoTm9raWEgLSBDTi9IYW5nemhvdSkgPGpv
aG4uemhvdUBub2tpYS5jb20+DQpDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcNClN1
YmplY3Q6IFJlOiBob3cgdG8gY3JlYXRlIG9uZSB1YmlmcyBpbWFnZSBzdXBwb3J0IGJvdGggZm9y
IGRpZmZlcmVudCBwYWdlIHNpemUgYW5kIHNlY3RvciBzaXplPw0KDQpKb2huLA0KDQpBbSAwMi4w
OC4yMDE2IHVtIDA4OjM1IHNjaHJpZWIgWmhvdSwgSm9obiAoTm9raWEgLSBDTi9IYW5nemhvdSk6
DQo+IEhvdyBvdGhlciB1c2VycyB0byBzb2x2ZSBzdWNoIHByb2JsZW0/IFdoZW4gd2UgbmVlZCBz
dXBwb3J0IGZvciB0d28gZGlmZmVyZW50IGZsYXNoPw0KPiBUd28gaW1hZ2VzIGlzIHRoZSBvbmx5
IHBhdGg/DQoNClRoaXMgaXMgY29ycmVjdC4gSXMgdGhpcyBzdWNoIGEgYmlnIHByb2JsZW0/DQpB
bm90aGVyIGFwcHJvYWNoIGlzIGJvb3RpbmcgTGludXggYW5kIGNyZWF0ZSBVQkkvRlMgb24gdGhl
IGZseS4uLg0KDQpUaGFua3MsDQovL3JpY2hhcmQNCg==
