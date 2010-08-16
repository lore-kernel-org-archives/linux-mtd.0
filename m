Received: from dakia3.marvell.com ([65.219.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ol0YZ-0003cu-3P
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2010 14:20:59 +0000
From: Lei Wen <leiwen@marvell.com>
To: Eric Miao <eric.y.miao@gmail.com>
Date: Mon, 16 Aug 2010 07:20:51 -0700
Subject: RE: [PATCH] [MTD] [NAND] pxa3xx: fix timing and cmdset for
	samsung2GbX8
Message-ID: <53612FE6B944314AAADB181E45A45B64133DDFC166@sc-vexch3.marvell.com>
In-Reply-To: <AANLkTimSqtpTemencLrKpRyHgSii0UYzH=FwawstDQmU@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Haojian Zhuang <hzhuang1@marvell.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

SSBtYXkgbm90IGhhdmUgdGltZSBmcm9tIDEwYW0gdG8gMTFhbS4gRXhjZXB0IHRoYXQsIGFueSB0
aW1lIGlzIG9rIGZvciBtZS4gOi0pDQoNCkJlc3QgcmVnYXJkcywNCkxlaQ0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRXJpYyBNaWFvIFttYWlsdG86ZXJpYy55Lm1pYW9AZ21h
aWwuY29tXSANClNlbnQ6IDIwMTDE6jjUwjE2yNUgMjI6MTcNClRvOiBMZWkgV2VuDQpDYzogRGF2
aWQgV29vZGhvdXNlOyBIYW9qaWFuIFpodWFuZzsgQXhlbCBMaW47IGxpbnV4LWtlcm5lbDsgbGlu
dXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0hdIFtNVERdIFtO
QU5EXSBweGEzeHg6IGZpeCB0aW1pbmcgYW5kIGNtZHNldCBmb3Igc2Ftc3VuZzJHYlg4DQoNCjIw
MTAvOC8xNiBMZWkgV2VuIDxsZWl3ZW5AbWFydmVsbC5jb20+Og0KPiBFcmljLA0KPiBUaGUgZmly
c3QgcGF0Y2ggaXMgYSBiaXQgb2YgZnVuZGFtZW50YWwuIEknbSBhZnJhaWQgdGhhdCBtb2RpZnkg
aXQgd291bGQgYnJpbmcgY2hhbmdlcyB0byBhbGwgbGF0dGVyIHBhdGNoZXMgaW4gdGhpcyBzZXJp
ZXMuLi4NCj4NCj4gU28gSSB0aGluayBJIHdvdWxkIHJlcG9zdCBhbm90aGVyIHJvdW5kIG9mIHVw
ZGF0aW5nIHBhdGNoIHNlcmllcyBhbmQgaG9wZSB0aGF0IHdvdWxkIGJlIG1lcmdlZC4gSG93IGRv
IHlvdSB0aGluayBhYm91dCB0aGlzPw0KPg0KDQpQbGVhc2Ugc2VwYXJhdGUgdGhlIHBhdGNoZXMg
aW50byBzZXZlcmFsIHBhdGNoIHNlcmllcy4NCg0KKFBTOiBJJ2xsIHBvc3NpYmx5IHRhbGsgd2l0
aCB5b3Ugb24gdGhpcyB0b21vcnJvdyBGMkYpDQo=
