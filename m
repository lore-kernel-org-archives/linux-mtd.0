Received: from mail2.spectraaccess.net ([208.65.172.25])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPttL-0005I8-P7
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 11:08:12 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: "'dedekind1@gmail.com'" <dedekind1@gmail.com>
Date: Thu, 3 May 2012 07:08:09 -0400
Subject: RE: State of read-only filesystems in NAND / MTD bad blocks
 handling when reading
Message-ID: <0A40042D85E7C84DB443060EC44B3FD3351F9CAE02@dekaexchange07.deka.local>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
 <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CADFB@dekaexchange07.deka.local>
 <1336041737.13013.34.camel@sauron.fi.intel.com>
In-Reply-To: <1336041737.13013.34.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 'Thilo Fromm' <fromm@dresearch-fe.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

QXJ0ZW06DQoNCiAgVGhhbmtzIQ0KDQogICAgICAgICAgICAgQXRsYW50DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBcnRlbSBCaXR5dXRza2l5IFttYWlsdG86ZGVkZWtpbmQx
QGdtYWlsLmNvbV0NClNlbnQ6IFRodXJzZGF5LCBNYXkgMDMsIDIwMTIgMDY6NDINClRvOiBBdGxh
bnQgU2NobWlkdA0KQ2M6ICdUaGlsbyBGcm9tbSc7IFJpY2FyZCBXYW5kZXJsb2Y7IGxpbnV4LW10
ZEBsaXN0cy5pbmZyYWRlYWQub3JnDQpTdWJqZWN0OiBSRTogU3RhdGUgb2YgcmVhZC1vbmx5IGZp
bGVzeXN0ZW1zIGluIE5BTkQgLyBNVEQgYmFkIGJsb2NrcyBoYW5kbGluZyB3aGVuIHJlYWRpbmcN
Cg0KT24gV2VkLCAyMDEyLTA1LTAyIGF0IDEzOjE0IC0wNDAwLCBBdGxhbnQgU2NobWlkdCB3cm90
ZToNCj4gICBJIGNhbiBhbnN3ZXIgdGhhdCBvbmUuDQo+DQo+ICAgTVREICJtYXRlcmlhbGl6ZXMi
IGFuIGltcGVyZmVjdCBibG9jayBzdG9yYWdlIGRldmljZS4gSXQgY29udGFpbnMNCj4gICBtIFBF
QnMgKFBoeXNpY2FsIEVyYXNlIEJsb2Nrcykgb2YgbiBwYWdlcyBlYWNoLiBJdCBjYW4gZXJhc2Ug
d2hvbGUNCj4gICBQRUJzLCB3cml0ZSBwYWdlcywgYW5kIHJlYWQgcGFnZXMsIGJ1dCBzb21lIG9m
IHRoZXNlIHBhZ2VzIGFyZQ0KPiAgIGJhZCwgb3RoZXIgcGFnZXMgbWF5IGdvIGJhZCwgYW5kIHlv
dSBoYXZlIHRvIGJlIGF3YXJlIHRoYXQgeW91DQo+ICAgY2FuIHdlYXIgb3V0IFBFQnMgYnkgcmVw
ZWF0ZWQgZXJhc3VyZXMuDQoNCk5pdHBpY2s6IHMvYmxvY2sgZGV2aWNlL2ZsYXNoIGRldmljZS8g
b3Igc29tZXRoaW5nIGxpa2UgdGhpcy4gVGVybSBibG9jaw0KZGV2aWNlIGhhcyBtb3JlIG9yIGxl
c3Mgc3RhbmRhcmQgbWVhbmluZyBhbmQgbmVpdGhlciBNVEQgbm9yIFVCSSBkZXZpY2VzDQphcmUg
YmxvY2sgZGV2aWNlczoNCg0KaHR0cDovL3d3dy5saW51eC1tdGQuaW5mcmFkZWFkLm9yZy9mYXEv
Z2VuZXJhbC5odG1sI0xfbXRkX3ZzX2hkZA0KDQotLQ0KQmVzdCBSZWdhcmRzLA0KQXJ0ZW0gQml0
eXV0c2tpeQ0KDQpUaGlzIGUtbWFpbCBhbmQgdGhlIGluZm9ybWF0aW9uLCBpbmNsdWRpbmcgYW55
IGF0dGFjaG1lbnRzLCBpdCBjb250YWlucyBhcmUgaW50ZW5kZWQgdG8gYmUgYSBjb25maWRlbnRp
YWwgY29tbXVuaWNhdGlvbiBvbmx5IHRvIHRoZSBwZXJzb24gb3IgZW50aXR5IHRvIHdob20gaXQg
aXMgYWRkcmVzc2VkIGFuZCBtYXkgY29udGFpbiBpbmZvcm1hdGlvbiB0aGF0IGlzIHByaXZpbGVn
ZWQuIElmIHRoZSByZWFkZXIgb2YgdGhpcyBtZXNzYWdlIGlzIG5vdCB0aGUgaW50ZW5kZWQgcmVj
aXBpZW50LCB5b3UgYXJlIGhlcmVieSBub3RpZmllZCB0aGF0IGFueSBkaXNzZW1pbmF0aW9uLCBk
aXN0cmlidXRpb24gb3IgY29weWluZyBvZiB0aGlzIGNvbW11bmljYXRpb24gaXMgc3RyaWN0bHkg
cHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBjb21tdW5pY2F0aW9uIGluIGVy
cm9yLCBwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlc3Ryb3kgdGhl
IG9yaWdpbmFsIG1lc3NhZ2UuDQoNClRoYW5rIHlvdS4NCg0KUGxlYXNlIGNvbnNpZGVyIHRoZSBl
bnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBlbWFpbC4NCg==
