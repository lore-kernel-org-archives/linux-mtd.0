Received: from portal.weinmann.de ([62.8.140.122])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rrm7W-0006zK-Te
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2012 07:57:48 +0000
From: "Voss, Nikolaus" <N.Voss@weinmann.de>
To: "'dedekind1@gmail.com'" <dedekind1@gmail.com>
Date: Mon, 30 Jan 2012 08:57:17 +0100
Subject: RE: [PATCH] mtd: atmel_nand: fix access to 16 bit NAND devices
Message-ID: <EF2E73589CA71846A15D0B2CDF79505D08AD3E5453@wm021.weinmann.com>
References: <201201251217.q0PCHmRe027024@gatekeeper.vosshq.de>
 <1327670996.26648.43.camel@sauron.fi.intel.com>
In-Reply-To: <1327670996.26648.43.camel@sauron.fi.intel.com>
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
 'Nicolas Ferre' <nicolas.ferre@atmel.com>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

QXJ0ZW0gQml0eXV0c2tpeSB3cm90ZSBvbiAyMDEyLTAxLTI3Og0KPiBPbiBXZWQsIDIwMTItMDEt
MTggYXQgMTA6MTYgKzAxMDAsIE5pa29sYXVzIFZvc3Mgd3JvdGU6DQo+PiBjb21taXQgZmI1NDI3
NTA4YWJiZDYzNWU4NzdmYWJkZjU1Nzk1NDg4MTE5YzJkNiBvcHRpbWl6ZXMgUElPDQo+PiBOQU5E
IGFjY2Vzc2VzIGJ5IHVzaW5nIElPIG1lbWNweSBpbnN0ZWFkIG9mIElPIHJlYWQvd3JpdGUNCj4+
IHJlcGVhdGVkIGZ1bmN0aW9ucy4NCj4+IA0KPj4gVGhpcyBicmVha3MgYWNjZXNzIHRvIDE2IGJp
dCBOQU5EIGRldmljZXMgYXMgbWVtY3B5X2Zyb21pbygpL3RvaW8oKQ0KPj4gX2Fsd2F5c18gdXNl
IGJ5dGUgYWNjZXNzZXMgKHNlZSBhcmNoL2FybS9rZXJuZWwvaW8uYyksIHNvIHdpdGgNCj4+IDE2
IGJpdCBOQU5ELCBvbmUgYnl0ZSBnZXRzIGxvc3QgcGVyIE5BTkQgYWNjZXNzIGN5Y2xlIGFuZCBO
QU5EDQo+PiBhZGRyZXNzIGNvdW50IGlzIHdyb25nLg0KPj4gDQo+PiBVc2luZyBtZW1jcHkoKSBp
bnN0ZWFkIG9mIHRoZSBJTyBtZW1jcHkgZnVuY3Rpb25zIGZpeGVzIHRoaXMsIGJ1dA0KPj4gZGVw
ZW5kcyBvbiBjb3JyZWN0IHdvcmQgYWxpZ25tZW50IG9mIHRoZSBidWZmZXIgYW5kIGxlbmd0aCBo
YXMgdG8NCj4+IGJlIGEgbXVsdGlwbGUgb2YgZm91ciwgb3RoZXJ3aXNlIGl0IG1pZ2h0IGlzc3Vl
IGJ5dGUgYWNjZXNzZXMgYW5kDQo+PiBwb3NzaWJseSBicmVhayAxNiBiaXQgTkFORCBhY2Nlc3Mg
KGNmIGFyY2gvYXJtL2xpYi9jb3B5X3RlbXBsYXRlLlMpLg0KPj4gDQo+PiBNZW1jcHkgdmFyaWFu
dHMgc2VlbSB0byBiZSB0aGUgd3JvbmcgYXBwcm9hY2ggaGVyZSwgc2luY2UgdGhlDQo+PiBOQU5E
IGNvbnRyb2xsZXIgZG9lc24ndCBtYWtlIHRoZSBOQU5EIGFwcGVhciBhcyB0cnVlbHkgcmFuZG9t
bHkNCj4+IGFjY2Vzc2libGUgbWVtb3J5IChhcyBvcHBvc2VkIHRvIHRoZSBEUkFNIGNvbnRyb2xs
ZXIgd2hpY2ggZG9lcw0KPj4gZXhhY3RseSB0aGF0KS4NCj4+IA0KPj4gU28sIG15IHByb3Bvc2Fs
IGlzIHRvIHVzZSAzMiBiaXQgSU8gcmVhZC93cml0ZSAoYW5kIGxldCBTTUMNCj4+IG1hcCBpdCB0
byA4IGJpdCBvciAxNiBiaXQgTkFORCBhY2Nlc3NlcykgYW5kIGFjY291bnQgZm9yDQo+PiBsZW5n
dGggJSA0ID4gMCB3aXRoIHR3byBhZGRpdGlvbmFsIElPIHJlYWQvd3JpdGVzLg0KPj4gDQo+PiBT
aWduZWQtb2ZmLWJ5OiBOaWtvbGF1cyBWb3NzIDxuLnZvc3NAd2Vpbm1hbm4uZGU+DQo+IA0KPiBX
aHkgbm90IHRvIHJldmVydCBmYjU0Mjc1MDhhYmJkNjM1ZTg3N2ZhYmRmNTU3OTU0ODgxMTljMmQ2
IGluc3RlYWQsIGl0DQo+IGlzIGluIG15IG9waW5pb24gYSBiaXQgbW9yZSByZWFkYWJsZT8NCg0K
Tm8gb2JqZWN0aW9ucy4gSSd2ZSB0cmllZCB0byBzYXZlIHRoZSBpZGVhIG9mDQpmYjU0Mjc1MDhh
YmJkNjM1ZTg3N2ZhYmRmNTU3OTU0ODgxMTljMmQ2IGJ1dCB0aGF0IGxlbmd0aCAlIDQgPiAwIHN0
dWZmDQp1Z2xpZmllcyBpdCBhIGxpdHRsZSBiaXQuLi4NCg0KTmlrbw0KDQoNCg==
