Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y2ui6-0003Ur-9c
 for linux-mtd@lists.infradead.org; Mon, 22 Dec 2014 04:35:11 +0000
From: =?gb2312?B?UWkgV2FuZyDN9cbwIChxaXdhbmcp?= <qiwang@micron.com>
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/6] mtd: Introduce SPI NAND framework
Date: Mon, 22 Dec 2014 04:34:33 +0000
Message-ID: <71CF8D7F32C5C24C9CD1D0E02D52498A7713CD34@NTXXIAMBX02.xacn.micron.com>
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
 <1417525136-25731-5-git-send-email-ezequiel.garcia@imgtec.com>
 <87F60714EC601C4C83DFF1D2E3D390A049EE77@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <87F60714EC601C4C83DFF1D2E3D390A049EE77@NTXXIAMBX02.xacn.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 Brian Norris <computersforpeace@gmail.com>,
 James Hartley <james.hartley@imgtec.com>,
 "arnaud.mouiche@invoxia.com" <arnaud.mouiche@invoxia.com>,
 =?gb2312?B?UGV0ZXIgUGFuIMXLtrAgKHBldGVycGFuZG9uZyk=?=
 <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgRXplcXVpZWwsDQoNCj4gKy8qDQo+ICsgKiBXYWl0IHVudGlsIHRoZSBzdGF0dXMgcmVnaXN0
ZXIgYnVzeSBiaXQgaXMgY2xlYXJlZC4NCj4gKyAqIFJldHVybnMgYSBuZWdhdGllIGVycm5vIG9u
IGVycm9yIG9yIHRpbWUgb3V0LCBhbmQgYSBub24tbmVnYXRpdmUNCj4gK3N0YXR1cw0KPiArICog
dmFsdWUgaWYgdGhlIGRldmljZSBpcyByZWFkeS4NCj4gKyAqLw0KPiArc3RhdGljIGludCBzcGlf
bmFuZF93YWl0X3RpbGxfcmVhZHkoc3RydWN0IHNwaV9uYW5kICpzbmFuZCkgew0KPiArCXVuc2ln
bmVkIGxvbmcgZGVhZGxpbmUgPSBqaWZmaWVzICsgbXNlY3NfdG9famlmZmllcygxMDApOw0KDQox
MDBtcyB3aWxsIGJlIGFwcGxpZWQgdG8gYWxsIG9wZXJhdGlvbiwgYnV0IEkgdGhpbmsgaXQgd291
bGQgYmUgbW9yZQ0KbWFrZSBzZW5zZSB0byB1c2UgZGlmZmVyZW50IHRpbWVvdXQgdmFsdWUgZm9y
IGRpZmZlcmVudCBvcGVyYXRpb24sIA0KanVzdCBsaWtlIFBhcmFsbGVsIE5BTkQgYXMgYmVsb3c6
DQoiDQpzdGF0aWMgaW50IG5hbmRfd2FpdChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCkNCnsNCg0KCWludCBzdGF0dXMsIHN0YXRlID0gY2hpcC0+c3RhdGU7DQoJ
dW5zaWduZWQgbG9uZyB0aW1lbyA9IChzdGF0ZSA9PSBGTF9FUkFTSU5HID8gNDAwIDogMjApOw0K
IgkNCg0KDQo+ICtzdGF0aWMgaW50IHNwaV9uYW5kX3dyaXRlKHN0cnVjdCBzcGlfbmFuZCAqc25h
bmQpIHsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJLyogU3RvcmUgdGhlIHBhZ2UgdG8gY2FjaGUg
Ki8NCj4gKwlyZXQgPSBzbmFuZC0+c3RvcmVfY2FjaGUoc25hbmQsIDAsIHNuYW5kLT5idWZfc2l6
ZSwgc25hbmQtDQo+ID5kYXRhX2J1Zik7DQo+ICsJaWYgKHJldCA8IDApIHsNCj4gKwkJZGV2X2Vy
cihzbmFuZC0+ZGV2LCAiZXJyb3IgJWQgc3RvcmluZyBwYWdlIDB4JXggdG8gY2FjaGVcbiIsDQo+
ICsJCQlyZXQsIHNuYW5kLT5wYWdlX2FkZHIpOw0KPiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4g
Kw0KPiArCXJldCA9IHNwaV9uYW5kX3dhaXRfdGlsbF9yZWFkeShzbmFuZCk7DQo+ICsJaWYgKHJl
dCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXJldCA9IHNuYW5kLT53cml0ZV9lbmFibGUo
c25hbmQpOw0KPiArCWlmIChyZXQgPCAwKSB7DQo+ICsJCWRldl9lcnIoc25hbmQtPmRldiwgIndy
aXRlIGVuYWJsZSBjb21tYW5kIGZhaWxlZFxuIik7DQo+ICsJCXJldHVybiByZXQ7DQo+ICsJfQ0K
PiArDQo+ICsJLyogR2V0IHBhZ2UgZnJvbSB0aGUgZGV2aWNlIGNhY2hlIGludG8gb3VyIGludGVy
bmFsIGJ1ZmZlciAqLw0KPiArCXJldCA9IHNuYW5kLT53cml0ZV9wYWdlKHNuYW5kLCBzbmFuZC0+
cGFnZV9hZGRyKTsNCg0KDQpUaGUgcGFnZSBwcm9ncmFtIHNlcXVlbmNlIGluIGRhdGFzaGVldCBp
cyB3cml0ZV9lbmFibGUtPnByb2dyYW1fbG9hZC0+DQpwcm9ncmFtX2V4ZWN1dGUtPnJlYWRfc3Rh
dHVzLiBTZWVtcyBkaWZmZXJlbnQgd2l0aCB0aGUgcHJvY2VkdXJlIGluIA0KeW91ciBjb2RlLg0K
CQ0KVGhhbmtzDQotIFFpIFdhbmcNCg==
