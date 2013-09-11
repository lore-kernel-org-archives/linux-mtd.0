From: "Gupta, Pekon" <pekon@ti.com>
To: Mark Brown <broonie@kernel.org>, Huang Shijie <b32955@freescale.com>
Subject: RE: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Wed, 11 Sep 2013 12:26:10 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA0EAA7@DBDE04.ent.ti.com>
References: <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com> <522D3B79.3060707@freescale.com>
 <20130909151450.GI29403@sirena.org.uk> <522EC33B.9000009@freescale.com>
 <20130910180704.GB29403@sirena.org.uk> <522FD78A.6080900@freescale.com>
 <20130911104126.GN29403@sirena.org.uk> <52304BFF.4060007@freescale.com>
 <20130911113002.GP29403@sirena.org.uk>
In-Reply-To: <20130911113002.GP29403@sirena.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "lznuaa@gmail.com" <lznuaa@gmail.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgTWFyaywgU2hpamllLA0KDQo+IA0KPiA+IFRoZSBMVVQgcmVnaXN0ZXJzIG5lZWRzIHRvIGJl
IGZpbGxlZCB3aXRoIHRoZSBTUEkgTk9SIGNvbW1hbmQsIHN1Y2gNCj4gPiBGYXN0LXJlYWQvUXVh
ZC1yZWFkLg0KPiA+IFNvIHRoZSBRdWFkc3BpIGRyaXZlciBuZWVkcyB0byBrbm93IHRoZSBzcGkg
Y29tbWFuZHMsIGFuZCB0aGF0J3Mgd2h5IHRoZQ0KPiA+IFNQSSBkcml2ZXIgaGFzDQo+ID4gcmVm
ZXJlbmNlcyB0byB0aGUgc3BpIGNvbW1hbmQgb3Bjb2Rlcy4NCj4gDQo+IEluZGVlZCAtIHdoYXQg
SSB3YXMgd29uZGVyaW5nIHdhcyBpZiB0aG9zZSBvcGNvZGVzIGNvdWxkIGJlIHJlcXVlc3RlZA0K
PiBmcm9tIHRoZSBmbGFzaCBkcml2ZXIgcmF0aGVyIHRoYW4gY29kZWQgaW4gdGhlcmUuDQoNCkFz
IHRoZSB0YWxrIGlzIGdvaW5nIGluIFNQSSBmcmFtZXdvcmsgZGlyZWN0aW9uLCB0aGVyZWZvcmUg
cmVxdWVzdGluZyBhZ2Fpbi4uDQpwbGVhc2UgZG8gbm90IGNsdXR0ZXIgdGhlICpnZW5lcmljKiBT
UEkgZnJhbWV3b3JrIHRvIHBhc3Mgb24gb3Bjb2RlcyBmcm9tDQpmbGFzaC1kcml2ZXIgKGxpa2Ug
bTI1cDgwKS4gKFEpU1BJIGZyYW1ld29yayBzaG91bGQgcmVtYWluIGdlbmVyaWMgYW5kDQppbmRl
cGVuZGVudCBvZiBhbnkgdXBwZXIgbGF5ZXIgZHJpdmVycy4NClRoZXJlZm9yZSBJIHByb3Bvc2Vk
IERUIGJhc2VkIGFwcHJvYWNoLCBhcyBhbiBhbHRlcm5hdGl2ZS4NCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1tdGQvMjAxMy1TZXB0ZW1iZXIvMDQ4NTUyLmh0bWwN
Cg0KQnV0IGFzIFNoaWppZSdzIHBhdGNoZXMgYXJlIGNlbnRyaWMgdG8gRlNMIHVzZS1jYXNlIGFu
ZCBxc3BpLWNvbnRyb2xsZXIsDQpzbyBJIGNhbm5vdCBwdXJzdWUgbXkgc3VnZ2VzdGlvbnMgZnVy
dGhlci4NCg0KPiAgVGhlIGRyaXZlciBuZWVkcyB0bw0KPiB3cml0ZSB0aGUgY29tbWFuZHMgdG8g
dGhlIGRldmljZSBidXQgaXQncyBub3QgY2xlYXIgdG8gbWUgaWYgaXQgcmVhbGx5DQo+IG5lZWRz
IHRvIGtub3cgdGhlIHNwZWNpZmljIGNvbW1hbmRzLg0KDQp3aXRoIHJlZ2FyZHMsIHBla29uDQo=
