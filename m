Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ab8Aw-0002lA-21
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 14:54:54 +0000
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: "alexander.stein@systec-electronic.com"
 <alexander.stein@systec-electronic.com>
CC: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 1/1] mtd: mtdram: Add parameter for setting writebuf
 size
Date: Wed, 2 Mar 2016 14:54:30 +0000
Message-ID: <1456930470.2169.26.camel@intel.com>
References: <1456924001-1000-1-git-send-email-alexander.stein@systec-electronic.com>
 <1456929164.2169.21.camel@gmail.com> <1456929355.2169.24.camel@intel.com>
 <38372465.103Wx4k7xg@ws-stein>
In-Reply-To: <38372465.103Wx4k7xg@ws-stein>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <934D99D2BB8F1243A7FC3DCA75F68960@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gV2VkLCAyMDE2LTAzLTAyIGF0IDE1OjQ4ICswMTAwLCBBbGV4YW5kZXIgU3RlaW4gd3JvdGU6
DQo+IEkgZG9uJ3QgbmVlZCBpdC4gU2V0dGluZyB1c2luZyBtb2Rwcm9iZSBpcyBlbm91Z2ggZm9y
IG1lIGFuZCBhIGxvdA0KPiBtb3JlIGZsZXhpYmxlLiBJIGp1c3Qga2VwdCBpdCB0aGUgc2FtZSB3
YXkgYXMgdGhlIG90aGVyIDIgcGFyYW1ldGVycy4NCj4gRXZlbiB0aG9zZSBhcmUgcmF0aGVyIHVz
ZWxlc3MgaW4gS2NvbmZpZywgSU1ITy4gT3IgZG8geW91IHByZWZlcg0KPiByZW1vdmluZyB0aGUg
ZXhpc3RpbmcgS2NvbmZpZyBvcHRpb25zIGFsbCB0b2dldGhlciBhbmQganVzdCByZWx5IG9uDQo+
IG1vZHVsZSBwYXJhbWV0ZXJzPw0KDQpJJ2QgcmVjb21tZW5kIHRvIGF2b2lkIGV4cGFuZGluZyB0
aGUgS2NvbmZpZywgd2hpY2ggaXMgYWxyZWFkeSBjb21wbGV4DQphbmQgcXVpdGUgY29uZnVzaW5n
IGZvciBzb21lb25lIHdobyBpcyBub3QgYW4gTVREIGV4cGVydCBidXQganVzdCB0cmllcw0KdG8g
Y29tZSB1cCB3aXRoIGEgcmVhc29uYWJsZSBkZWZhdWx0IEtjb25maWcgKGUuZy4sIGFuZCBkaXN0
cm8NCmJ1aWxkZXIpLg0KDQotLSANCkJlc3QgUmVnYXJkcywNCkFydGVtIEJpdHl1dHNraXkNCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAw
MDE4MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWlj
aWxlZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNv
bnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVu
ZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGll
bnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgo=
