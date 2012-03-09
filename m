Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5wSP-0007oR-Bl
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 09:49:54 +0000
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: Fubo Chen <fubo.chen@gmail.com>
Subject: Re: [PATCH] mtd: Fix memory leak triggered by removal
Date: Fri, 9 Mar 2012 09:48:33 +0000
Message-ID: <1331286668.22872.51.camel@sauron.fi.intel.com>
References: <4462354.EgehQQfXY4@asus>
 <1331286547.22872.49.camel@sauron.fi.intel.com>
In-Reply-To: <1331286547.22872.49.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <877F6D4184B70D47BD4B9EC4633867D6@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gRnJpLCAyMDEyLTAzLTA5IGF0IDExOjQ5ICswMjAwLCBBcnRlbSBCaXR5dXRza2l5IHdyb3Rl
Og0KPiBQbGVhc2UsIHByb3ZpZGUgYmV0dGVyIGV4cGxhbmF0aW9uIGluIHRoZSBjb21taXQgbWVz
c2FnZSBhYm91dCB3aGljaA0KPiBwcm9ibGVtIHlvdSBzb2x2ZSwgd2h5IHlvdSBkbyB0aGlzLCBh
bmQgaG93IHlvdSB0ZXN0ZWQgdGhpcy4NCj4gYmxrdHJhbnNfZGV2X3JlbGVhc2UoKSBhbHNvIGNh
bGxzIGJsa19jbGVhbnVwX3F1ZXVlKCkgLSB3aHkgd2UgbmVlZCB0bw0KPiBkbyBpdCAyIHRpbWVz
Pw0KDQpTb3JyeSwgeW91IHRvbGQgd2hpY2ggcHJvYmxlbSB5b3Ugc29sdmUsIGJ1dCBzdGlsbCwg
Y291bGQgeW91IHBsZWFzZQ0KcHJvdmlkZSBtb3JlIGludm9ybWF0aW9uIGFib3V0IHdoeSB0aGUg
cHJvYmxlbSBleGlzdGVkIGFuZCB3aGVuIGl0IGl0DQp3YXMgdHJpZ2dlcmVkLCBhbmQgaG93IHlv
dSBmaXggdGhpcyBhbmQgd2h5IHRoaXMgZml4IGlzIGNvcnJlY3QuDQoNCi0tIA0KQmVzdCBSZWdh
cmRzLA0KQXJ0ZW0gQml0eXV0c2tpeQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkludGVsIEZpbmxhbmQgT3kKUmVn
aXN0ZXJlZCBBZGRyZXNzOiBQTCAyODEsIDAwMTgxIEhlbHNpbmtpIApCdXNpbmVzcyBJZGVudGl0
eSBDb2RlOiAwMzU3NjA2IC0gNCAKRG9taWNpbGVkIGluIEhlbHNpbmtpIAoKVGhpcyBlLW1haWwg
YW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9y
CnRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLiBBbnkgcmV2aWV3IG9y
IGRpc3RyaWJ1dGlvbgpieSBvdGhlcnMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFy
ZSBub3QgdGhlIGludGVuZGVkCnJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBh
bmQgZGVsZXRlIGFsbCBjb3BpZXMuCg==
