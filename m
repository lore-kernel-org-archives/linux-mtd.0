Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ab7sy-0003rK-Hu
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 14:36:21 +0000
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: "alexander.stein@systec-electronic.com"
 <alexander.stein@systec-electronic.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 1/1] mtd: mtdram: Add parameter for setting writebuf
 size
Date: Wed, 2 Mar 2016 14:35:55 +0000
Message-ID: <1456929355.2169.24.camel@intel.com>
References: <1456924001-1000-1-git-send-email-alexander.stein@systec-electronic.com>
 <1456929164.2169.21.camel@gmail.com>
In-Reply-To: <1456929164.2169.21.camel@gmail.com>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B7FFE287E423141BE0CD9A3051753FF@intel.com>
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

T24gV2VkLCAyMDE2LTAzLTAyIGF0IDE2OjMyICswMjAwLCBBcnRlbSBCaXR5dXRza2l5IHdyb3Rl
Og0KPiBPbiBXZWQsIDIwMTYtMDMtMDIgYXQgMTQ6MDYgKzAxMDAsIEFsZXhhbmRlciBTdGVpbiB3
cm90ZToNCj4gPiANCj4gPiArY29uZmlnIE1URFJBTV9XUklURUJVRl9TSVpFDQo+ID4gK8KgwqDC
oMKgwqDCoMKgaW50ICJNVERSQU0gd3JpdGUgYnVmIHNpemUgaW4gQnl0ZXMiDQo+ID4gK8KgwqDC
oMKgwqDCoMKgZGVwZW5kcyBvbiBNVERfTVREUkFNDQo+ID4gK8KgwqDCoMKgwqDCoMKgZGVmYXVs
dCAiNjQiDQo+ID4gK8KgwqDCoMKgwqDCoMKgaGVscA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgIFRo
aXMgYWxsb3dzIHlvdSB0byBjb25maWd1cmUgdGhlIHdyaXRlIGJ1ZmZlciBzaXplIGluIHRoZQ0K
PiA+IGRldmljZQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgIGVtdWxhdGVkIGJ5IHRoZSBNVERSQU0g
ZHJpdmVyLsKgIElmIHRoZSBNVERSQU0gZHJpdmVyIGlzDQo+ID4gYnVpbHQNCj4gPiArwqDCoMKg
wqDCoMKgwqDCoCBhcyBhIG1vZHVsZSwgaXQgaXMgYWxzbyBwb3NzaWJsZSB0byBzcGVjaWZ5IHRo
aXMgYXMgYQ0KPiA+IHBhcmFtZXRlciB3aGVuDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqAgbG9hZGlu
ZyB0aGUgbW9kdWxlLiBFLmcuIHViaWZzIHJlbGllcyB0aGlzIGluIHRoZQ0KPiA+IHJlY292ZXJ5
DQo+ID4gYWxnb3JpdGhtLg0KPiBXaHkgYW5vdGhlciBLY29uZmlnIG9wdGlvbiAoY29tcGlsZS10
aW1lKSBpbnN0ZWFkIG9mIGp1c3QgYSBtb2R1bGUNCj4gcGFyYW1ldGVyIChydW4tdGltZSksIHdo
aWNoIHdvdWxkIGJlIG1vcmUgZmxleGlibGU/DQoNCk9oLCBwYXJkb24sIHlvdSBhcmUgYWRkaW5n
IGJvdGguIEkgbmV2ZXIgZm91bmQgdGhlIEtjb25maWcgb3B0aW9ucyB2ZXJ5DQp1c2VmdWwuIFF1
aXRlIHRoZSBvcHBvc2l0ZSwgSSBhbHdheXMgdGhvdWdodCBNVEQgaGFzIHRvbyBtYW55IG9mIHRo
b3NlDQpsaXR0bGUgS2NvbmZpZyBvcHRpb25zIGFuZCB0aGUgY29uZmlnIG1lbnUgaXMgdG9vIGxh
cmdlLiBJJ2Qgc3VnZ2VzdCB0bw0Kb25seSBhZGQgdGhlIHJ1bnRpbWUgb3B0aW9uLCB1bmxlc3Mg
eW91IHJlYWxseSBuZWVkIHRoZSBLY29uZmlnIG9wdGlvbg0KdG9vICh3aHk/KS4NCg0KLS0gDQpC
ZXN0IFJlZ2FyZHMsDQpBcnRlbSBCaXR5dXRza2l5DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwgRmlubGFu
ZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEgSGVsc2lua2kgCkJ1c2luZXNz
IElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQgaW4gSGVsc2lua2kgCgpUaGlz
IGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBtYXRl
cmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykuIEFueSBy
ZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJ
ZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUg
c2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4K
