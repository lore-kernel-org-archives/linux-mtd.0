Received: from hqemgate03.nvidia.com ([216.228.121.140])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rt9w3-0004GD-JE
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 03:35:40 +0000
From: Venu Byravarasu <vbyravarasu@nvidia.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>, Nicolas Ferre
 <nicolas.ferre@atmel.com>, "Voss, Nikolaus" <N.Voss@weinmann.de>,
 =?utf-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Date: Fri, 3 Feb 2012 09:05:29 +0530
Subject: RE: [PATCH] mtd: atmel_nand: fix access to 16 bit NAND devices
Message-ID: <D958900912E20642BCBC71664EFECE3E6DD0B99114@BGMAIL02.nvidia.com>
References: <201201251217.q0PCHmRe027024@gatekeeper.vosshq.de>
 <1327670996.26648.43.camel@sauron.fi.intel.com>
 <EF2E73589CA71846A15D0B2CDF79505D08AD3E5453@wm021.weinmann.com>
 <4F265B7E.6060806@atmel.com>
 <1328184370.28171.175.camel@sauron.fi.intel.com>
In-Reply-To: <1328184370.28171.175.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SSBzZWUgYSBwcm9ibGVtIHdpdGggYXRtZWxfcmVhZF9idWYxNiAmIGF0bWVsX3dyaXRlX2J1ZjE2
IGZ1bmN0aW9ucy4NCkFzIHRoZXkgYXJlIGNhbGxpbmcgX19yYXdfcmVhZHN3ICYgX19yYXdfd3Jp
dGVzdyByZXNwZWN0aXZlbHksIHdoaWNoIA0Kd291bGQgY2F1c2UgcGFuaWMgaW4gY2FzZXMgb2Yg
MTYgYml0IHVuYWxpZ25lZCBidWZmZXJzLg0KSG93ZXZlciwgdGhlIGJ1ZiBwYXNzZWQgdG8gdGhl
c2UgZnVuY3Rpb25zIGlzIG9mIHR5cGUgdTgqIGZyb20gDQphdG1lbF9yZWFkX2J1ZiAmIGF0bWVs
X3dyaXRlX2J1ZiBmdW5jdGlvbnMuDQoNCltWZW51XSANCj4gLQkvKiBpZiBubyBETUEgb3BlcmF0
aW9uIHBvc3NpYmxlLCB1c2UgUElPICovDQo+IC0JbWVtY3B5X2Zyb21pbyhidWYsIGNoaXAtPklP
X0FERFJfUiwgbGVuKTsNCj4gKwlpZiAoaG9zdC0+Ym9hcmQtPmJ1c193aWR0aF8xNikNCj4gKwkJ
YXRtZWxfcmVhZF9idWYxNihtdGQsIGJ1ZiwgbGVuKTsNCg0KPiArCWVsc2UNCj4gKwkJYXRtZWxf
cmVhZF9idWY4KG10ZCwgYnVmLCBsZW4pOw0KPiAgfQ0K
