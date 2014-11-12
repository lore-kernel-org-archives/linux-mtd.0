From: bpqw <bpqw@micron.com>
To: Jagan Teki <jagannadh.teki@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>
Subject: RE: [V5 PATCH 1/1] driver:mtd:spi-nor: Add quad I/O support for
 Micron spi nor
Date: Wed, 12 Nov 2014 01:19:18 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315EB0E1@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409251211.57183.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315DCDF1@NTXXIAMBX02.xacn.micron.com>
 <201409261046.07132.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315EA24E@NTXXIAMBX02.xacn.micron.com>
 <54613259.4070903@opensource.altera.com>
 <alpine.DEB.2.02.1411111336010.1356@lava-test-server>
 <CAD6G_RQFV9LfBzVbureBiCneW+PpLzSdUCyz9L6D+EhE4gT+WA@mail.gmail.com>
In-Reply-To: <CAD6G_RQFV9LfBzVbureBiCneW+PpLzSdUCyz9L6D+EhE4gT+WA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, bpqw <bpqw@micron.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PkkgaGF2ZSBhbG1vc3QgdmVyaWZpZWQgYWxsIHRoZSBtaWNyb3MgcGFydHMgZm9yIG9wZXJhdGlu
ZyBxdWFkIG1vZGUgYW5kIHRoZSBxdWFkIGVuYWJsZSBiaXQgaXMgDQo+dm9sYXRpbGUgYnkgZGVm
YXVsdCBhbmQgbm8gbmVlZCB0byBzZXQgaXQgb24gc29mdHdhcmUuDQoNCj5XaHkgdGhpcyBjb2Rl
IGlzIG1lYW50IGZvciAtIGRvZXMgbWljcm9uIGhhcyBjaGFuZ2VkIHRoaXMgYml0IG9wZXJhdGlv
biBvbiBuZXdseSBhZGRlZCBwYXJ0cz8NCg0KPnRoYW5rcyENCj4tLQ0KPkphZ2FuLg0KDQpGb3Ig
TWljcm9uIFNwaSBub3JmbGFzaCxpZiB5b3Ugd2FudCB0byBtYWtlIGl0IHdvcmsgUXVhZCBJL08g
bW9kZSx5b3UgY2FuIGRvIGl0IGJ5IHNldA0KVHdvIHJlZ2lzdGVycyxOb252b2xhdGlsZSBDb25m
aWd1cmF0aW9uIHJlc2lzdGVyKE5WQ1IpIGFuZCBFbmhhbmNlZCB2b2xhdGlsZSBjb25mdXJhdGlv
biByZWdpc3RlcihFVkNSKSwNCmJ1dCBhY2NvcmRpbmcgdG8gc3BpLW5vci5jLGFuZCBtaWNyb24g
c3BpIG5vcix3ZSByZWNvbW1lbmQgdGhhdCBpZiB3YW50IHRvIGVuYWJsZSBNaWNyb24gc3BpIG5v
ciBRdWFkIEkvTw0KbW9kZSx0aGUgYmVzdCB3YXkgaXMgdG8gc2V0IEVWQ1IuDQpPZiBjb3Vyc2Us
eW91IGNhbiB1c2UgUXVhZC9EdWFsIG9wZXJhdGlvbiBjb21tYW5kIHRvIHJlYWQvd3JpdGUgTWlj
cm9uIHNwaSBub3IgaW4gdGhlIHNwaSBub3IgRXh0ZW5kZWQgSS9PIG1vZGUuDQpCdXQgdGhlaXIg
Y29tbWFuZC1hZGRyZXNzLWRhdGEgaXMgZGlmZmVyZW50Lg0KDQpUaGUgcHVycG9zZSBvZiB0aGlz
IHBhdGNoIGlzIG9ubHkgdG8gZW5hYmxlIE1pY3JvbiBzcGkgbm9yIFF1YWQgSS9PIG1vZGUsaWYg
d2FudCB0byBtYWtlIE1pY3JvbiBzcGkgbm9yIHdvcmsgDQpVbmRlciBRdWFkIEkvTyBtb2RlLg0K
DQpIaSxCcmlhbg0KDQpIb3cgYWJvdXQgdGhpcyBwYXRjaD9QbGVhc2UgZ2l2ZSBtZSBzb21lIHRp
cHMsdGhhbmtzLg0K
