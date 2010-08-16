Received: from dakia3.marvell.com ([65.219.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Okz7u-0000sr-Oh
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2010 12:49:19 +0000
From: Haojian Zhuang <hzhuang1@marvell.com>
To: Eric Miao <eric.y.miao@gmail.com>, Lei Wen <leiwen@marvell.com>
Date: Mon, 16 Aug 2010 05:49:13 -0700
Subject: RE: [PATCH] [MTD] [NAND] pxa3xx: fix timing and cmdset for
	samsung2GbX8
Message-ID: <25B60CDC2F704E4E9D88FFD52780CB4C0597FEB568@SC-VEXCH1.marvell.com>
References: <AANLkTi=YSS0-Nf4MWOw30YDrCdrkmtzLhv7DXfsoJTjX@mail.gmail.com>
	<53612FE6B944314AAADB181E45A45B64133DDFC156@sc-vexch3.marvell.com>
	<AANLkTimh=dbUV75ZVXuhknt4FiMtximXLY8xoADfbe=q@mail.gmail.com>
In-Reply-To: <AANLkTimh=dbUV75ZVXuhknt4FiMtximXLY8xoADfbe=q@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Axel Lin <axel.lin@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDEwLUp1bHkv
c3ViamVjdC5odG1sDQoNClRoZXkncmUgcmUtcG9zdGVkIGluIEp1bHkuIFBsZWFzZSBzZWFyY2gg
dGhlIHN1YmplY3RzIGluIHRoYXQgcGFnZS4gVGhleSdyZSB0b3RhbGx5IDI5IHBhdGNoZXMuDQoN
CkJ5IHRoZSB3YXksIERhdmlkLCB3aGF0J3MgdGhlIHJlc3VsdCBvZiByZXZpZXcgb24gdGhlc2Ug
cGF0Y2hlcz8gV2UgYWxyZWFkeSBwb3N0ZWQgZm9yIHNldmVyYWwgdGltZXMuDQoNClRoYW5rcw0K
SGFvamlhbg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRXJpYyBNaWFvIFtt
YWlsdG86ZXJpYy55Lm1pYW9AZ21haWwuY29tXSANClNlbnQ6IDIwMTDlubQ45pyIMTbml6UgODo0
NCBQTQ0KVG86IExlaSBXZW4NCkNjOiBBeGVsIExpbjsgbGludXgta2VybmVsOyBEYXZpZCBXb29k
aG91c2U7IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOyBIYW9qaWFuIFpodWFuZw0KU3Vi
amVjdDogUmU6IFtQQVRDSF0gW01URF0gW05BTkRdIHB4YTN4eDogZml4IHRpbWluZyBhbmQgY21k
c2V0IGZvciBzYW1zdW5nMkdiWDgNCg0KT24gTW9uLCBBdWcgMTYsIDIwMTAgYXQgODozNCBQTSwg
TGVpIFdlbiA8bGVpd2VuQG1hcnZlbGwuY29tPiB3cm90ZToNCj4gSGkgQXhlbCwNCj4NCj4gSSBz
dWdnZXN0IG5vdCBtZXJnZSB5b3VyIHBhdGNoIGludG8gbWFpbmxpbmUgY29kZS4gU2luY2UgSSBo
YXZlIGEgbGFyZ2Ugc2VyaWVzIG9mIHBhdGNoIHdoaWNoIHJlY29uc3RydWN0IHRoZSBuYW5kIGZs
YXNoIGRlZmluaXRpb24sIHRoaXMgZml4IHdvdWxkIG5vIGxvbmdlciBiZSBuZWVkZWQuDQo+DQoN
CkxlaSwgd291bGQgeW91IHBsZWFzZSBwb2ludCB0aGUgVVJMIG9mIHRoZSBwYXRjaCBzZXJpZXMg
KHBvc3NpYmx5IGJ5DQpzZWFyY2hpbmcgbGludXgtbXRkIGFyY2hpdmUgb3Igc29tZSBvdGhlciBt
YWlsaW5nIGxpc3QgYXJjaGl2ZSkgc28gdGhhdA0KQXhlbCBjYW4gaGF2ZSBhIHJlZmVyZW5jZSBh
bmQgYmUgaW52b2x2ZWQ/DQoNCi0gZXJpYw0K
