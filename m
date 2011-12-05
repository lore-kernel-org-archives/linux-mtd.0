Received: from hqemgate03.nvidia.com ([216.228.121.140])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXRaD-0006eM-5z
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 05:59:22 +0000
From: Bhavesh Parekh <bparekh@nvidia.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Mon, 5 Dec 2011 11:29:12 +0530
Subject: RE: [PATCH] [MTD:UBI] Missing scrub when there is a bit-flip
Message-ID: <6F5E0EB93579CE4A99BFB2D6A9D015057D9CA89A59@BGMAIL01.nvidia.com>
References: <1322655222-28348-1-git-send-email-bparekh@nvidia.com>
 <1322655222-28348-2-git-send-email-bparekh@nvidia.com>
 <1323007803.9400.56.camel@sauron.fi.intel.com>
In-Reply-To: <1323007803.9400.56.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

QXJ0ZW0sDQoNCkN1cnJlbnRseSB3ZSBoYXZlIEszNiBzZXR1cCB3aXRoIG1vc3Qgb2YgdGhlIGNy
aXRpY2FsIHViaSBmaXhlcyBpbiBpdC4gVmVyaWZpZWQgdGhhdCB0aGlzIHBhdGNoIGZpeGVzIHRo
ZSBtZW50aW9uZWQgaXNzdWUuDQpBbHNvIHdlIGhhdmUgSzM5IHRyZWUgYW5kIEkgYW0gcGxhbm5p
bmcgdG8gdmVyaWZ5IHRoZSB0aGlzIGlzc3VlIGluIHRoYXQgdHJlZSBhcyB3ZWxsIGFmdGVyIHBv
cnRpbmcgdGhlIGNoYW5nZSBhbmQgZml4ZXMgZnJvbSB0aGUgdWJpIHRyZWUuDQoNClRoYW5rcyEN
CkJoYXZlc2gNCg0KbnZwdWJsaWMNCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJv
bTogQXJ0ZW0gQml0eXV0c2tpeSBbbWFpbHRvOmRlZGVraW5kMUBnbWFpbC5jb21dDQo+U2VudDog
U3VuZGF5LCBEZWNlbWJlciAwNCwgMjAxMSA3OjQwIFBNDQo+VG86IEJoYXZlc2ggUGFyZWtoDQo+
Q2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+U3ViamVjdDogUmU6IFtQQVRDSF0g
W01URDpVQkldIE1pc3Npbmcgc2NydWIgd2hlbiB0aGVyZSBpcyBhIGJpdC1mbGlwDQo+DQo+KiBQ
R1AgU2lnbmVkIGJ5IGFuIHVua25vd24ga2V5DQo+DQo+T24gV2VkLCAyMDExLTExLTMwIGF0IDE3
OjQzICswNTMwLCBCaGF2ZXNoIFBhcmVraCB3cm90ZToNCj4+IFVuZGVyIHNvbWUgY2FzZXMsIHdo
ZW4gc2NydWJiaW5nIHRoZSBQRUIgaWYgd2UgZGlkbm90IGdldCB0aGUgbG9jayBvbg0KPj4gdGhl
IFBFQiBpdCBmYWlscyB0byBzY3J1Yi4gQWRkIHRoYXQgUEVCIGFnYWluIHRvIHRoZSBzY3J1YiBs
aXN0DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQmhhdmVzaCBQYXJla2ggPGJwYXJla2hAbnZpZGlh
LmNvbT4NCj4NCj5QdXNoZWQgdG8gdWJpLTIuNi5naXQgd2l0aCBtaW5vciBhbWVuZG1lbnRzLCBi
dXQgcGxlYXNlLCBkbyBjb25maXJtIHRoYXQNCj55b3UgdmVyaWZ5IHRoYXQgdGhpcyBwYXRjaCBm
aXhlcyB0aGUgaXNzdWUgeW91IGRlc2NyaWJlZC4NCj4NCj5UaGFua3MhDQo+DQo+LS0NCj5CZXN0
IFJlZ2FyZHMsDQo+QXJ0ZW0gQml0eXV0c2tpeQ0KPg0KPiogVW5rbm93biBLZXkNCj4qIDB4N0RD
MkEyQjQNCg==
