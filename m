Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXWl6-0002jF-7x
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 14:12:17 +0000
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: "tlinder@codeaurora.org" <tlinder@codeaurora.org>
Subject: Re: [RFC/PATCH] mtd: ubi: Free peb's synchronously for fastmap
Date: Tue, 8 Apr 2014 13:44:03 +0000
Message-ID: <1396964636.26672.66.camel@sauron.fi.intel.com>
References: <1396339305-16005-1-git-send-email-tlinder@codeaurora.org>
 <1396964546.26672.65.camel@sauron.fi.intel.com>
In-Reply-To: <1396964546.26672.65.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7538EFFA76C9D744B79443A819ABE6BA@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gVHVlLCAyMDE0LTA0LTA4IGF0IDE2OjQyICswMzAwLCBBcnRlbSBCaXR5dXRza2l5IHdyb3Rl
Og0KPiBPbiBUdWUsIDIwMTQtMDQtMDEgYXQgMTE6MDEgKzAzMDAsIFRhbnlhIEJyb2tobWFuIHdy
b3RlOg0KPiA+IEF0IGZpcnN0IG1vdW50IGl0J3MgcG9zc2libGUgdGhhdCB0aGVyZSBhcmUgbm90
IGVub3VnaCBmcmVlIFBFQnMgc2luY2UNCj4gPiB0aGVyZSBhcmUgUEVCJ3MgcGVuZGluZyB0byBi
ZSBlcmFzZWQuIEluIHN1Y2ggc2NlbmFyaW8sIGZtX3Bvb2wgKHdoaWNoIGlzDQo+ID4gdGhlIHBv
b2wgZnJvbSB3aGljaCB1c2VyIHJlcXVpcmVkIFBFQnMgYXJlIGFsbG9jYXRlZCkgd2lsbCBiZSBl
bXB0eS4NCj4gPiBUcnkgZml4aW5nIHRoZSBhYm92ZSBkZXNjcmliZWQgc2l0dWF0aW9uIGJ5IHN5
bmNocm9ub3VzbHkgcGVyZm9ybWluZw0KPiA+IHBlbmRpbmcgZXJhc2Ugd29yaywgdGh1cyBwcm9k
dWNlIGFub3RoZXIgZnJlZSBQRUIuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogVGF0eWFuYSBC
cm9raG1hbiA8dGxpbmRlckBjb2RlYXVyb3JhLm9yZz4NCj4gDQo+IFB1c2hlZCB0byBsaW51eC11
Ymlmcy5naXQgLyBtYXN0ZXIsIHRoYW5rcyENCg0KT2gsIHNvcnJ5LCB0aGlzIG9uZSBJIGFjdHVh
bGx5IF9kcm9wcGVkXy4gV291bGQgeW91IHBsZWFzZSByYXRoZXINCnJlLXN0cnVjdHVyZSB0aGUg
Y29kZSB0byBhdm9pZCBkdXBsaWNhdGlvbi4gRS5nLiwgZG8gd2hhdCBSaWNoYXJkDQpzdWdnZXN0
ZWQuDQoNCi0tIA0KQmVzdCBSZWdhcmRzLA0KQXJ0ZW0gQml0eXV0c2tpeQ0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CkludGVsIEZpbmxhbmQgT3kKUmVnaXN0ZXJlZCBBZGRyZXNzOiBQTCAyODEsIDAwMTgxIEhlbHNp
bmtpIApCdXNpbmVzcyBJZGVudGl0eSBDb2RlOiAwMzU3NjA2IC0gNCAKRG9taWNpbGVkIGluIEhl
bHNpbmtpIAoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25m
aWRlbnRpYWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBp
ZW50KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBvdGhlcnMgaXMgc3RyaWN0bHkg
cHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkCnJlY2lwaWVudCwgcGxlYXNl
IGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMuCg==
