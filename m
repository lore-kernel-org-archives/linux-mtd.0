Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uts06-0005mL-47
 for linux-mtd@lists.infradead.org; Tue, 02 Jul 2013 04:15:34 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "N, Mugunthan V" <mugunthanvnm@ti.com>
Subject: RE: [PATCH v3 1/4] mtd:nand:omap2: clean-up BCHx_HW and BCHx_SW ECC
 configurations in device_probe
Date: Tue, 2 Jul 2013 04:14:51 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9E3B5D@DBDE04.ent.ti.com>
References: <1372010299-30141-1-git-send-email-pekon@ti.com>
 <1372010299-30141-2-git-send-email-pekon@ti.com>
 <1372666588.22014.43.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E29F6@DBDE04.ent.ti.com>
 <51D1BE59.4000203@ti.com>
In-Reply-To: <51D1BE59.4000203@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "arnd@arndb.de" <arnd@arndb.de>, "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Benoit Cousson \(benoit.cousson@linaro.org\)" <benoit.cousson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PiA+PiBUaGlzIGRvZXMgbm90IGFwcGx5IHRvIGwyLW10ZC5naXQsIGNvdWxkIHlvdSBwbGVhc2Ug
cmUtYmFzZT8NCj4gPj4NCj4gPiBbUGVrb25dOiByZWJhc2VkIHRvIGwyLW10ZC5naXQNCj4gPiAt
IHVwZGF0ZWQgW1BhdGNoIDMvNF0gd2hpY2ggY29uZmxpY3RlZCB3aXRoIGNvbW1pdCAnMjYzMzFj
MDQnIHdoaWNoDQo+IHRvdWNoZWQgb21hcDIuYy4NCj4gPiAtIFBsZWFzZSBpZ25vcmUgW1BhdGNo
IDQvNF0gYXMgaXTigJlzIGEgRFQgdXBkYXRlLCB3aGljaCBhZGRzIG9uIHRvcCBvZiBCZW5vaXQn
cw0KPiB0cmVlICh3aGljaCBoYXMgTkFORCBub2RlIGNvbW1pdHMgdG9vKS4NCj4gSWYgeW91IG5l
ZWQgb25lIHBhdGNoIChEVCBwYXRjaCkgaW4gdGhlIHNlcmllcyB0byBiZSBtZXJnZWQgaW4gYW5v
dGhlcg0KPiByZXBvc2l0b3J5IChEVCBtYWludGFpbmVyIHRyZWUpIHRoZW4gc2VwYXJhdGUgb3V0
IHRoYXQgcGF0Y2ggYXMgc2VwYXJhdGUNCj4gc2VyaWVzIGFuZCBtZW50aW9uIHRoZSBkZXBlbmRl
bmN5IG9yIG5lZWQgYWNrIGZyb20gdGhlIGRyaXZlciBtYWludGFpbmVyDQo+IHNvIHRoYXQgYm90
aCBtYWludGFpbmVyIGNhbiBhcHBseSB0aGUgd2hvbGUgc2VyaWVzIGludG8gaGlzIHJlcG9zaXRv
cnkNCj4gaW5zdGVhZCBvZiBhcHBseWluZyBwYXJ0aWFsbHkgaGVyZSBhbmQgdGhlcmUuDQo+IA0K
QWdyZWUuIFllcywgSSBzaG91bGQgaGF2ZSBzZW50IHRoZSBEVCBwYXRjaCBzZXBhcmF0ZWx5Lg0K
QnV0IEkgcG9zdGVkIGFsbCBjaGFuZ2VzIGFzIHBhcnQgb2Ygc2luZ2xlIHNlcmllcywgYXMgaXRz
IGVhc3kgZm9yIHVzZXJzIHRvDQpUZXN0IGFuZCBBY2sgdGhlbS4NClNpbWlsYXJseSBwYXRjaGVz
IGZvciBHUE1DIChUb255J3MgdHJlZSkgYW5kIE5BTkQgKEFydGVtJ3MgdHJlZSkgYXJlDQpmdW5j
dGlvbmFsbHkgY291cGxlZCwgU28gYXQgdGltZXMgSSBoYXZlIHRvIHNlbmQgdGhlbSBhcyBwYXJ0
IG9mIHNhbWUgc2VyaWVzLg0KSG93ZXZlciwgSSdsbCBjbGVhcmx5IG1lbnRpb24gdGhhdCBpbiBt
eSBjb3Zlci1sZXR0ZXIgZm9yIGZ1dHVyZSBwYXRjaGVzLg0KVGhhbmtzIGZvciBmZWVkYmFjayAu
Lg0KDQoNCndpdGggcmVnYXJkcywgcGVrb24NCg==
