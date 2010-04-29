Received: from p01c11o149.mxlogic.net ([208.65.144.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O7cbO-0004LG-1A
	for linux-mtd@lists.infradead.org; Thu, 29 Apr 2010 22:53:04 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Linux
	Kernel <linux-kernel@vger.kernel.org>
Date: Thu, 29 Apr 2010 17:52:57 -0500
Subject: [PATCH] sst25l.c: remove unnecessary MTD_DEBUG_LEVEL2 messages
Message-ID: <0D753D10438DA54287A00B0270842697636E825604@AUSP01VMBX24.collaborationhost.net>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "ryan@bluewatersys.com" <ryan@bluewatersys.com>,
	"andre@bluewatersys.com" <andre@bluewatersys.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

QWxsIHRoZSBTU1QyNUwgc2VyaWVzIGZsYXNoIHBhcnRzIGhhdmUgdW5pZm9ybSBlcmFzZSBzZWN0
b3JzLiAgUmVtb3ZlDQp0aGUgZXh0cmEgTVREX0RFQlVHX0xFVkVMMiBtZXNzYWdlcyBzaG93aW5n
IHRoZSBlcmFzZXJlZ2lvbnMgaW5mbw0Kc2luY2UgdGhleSBjb3VsZCBuZXZlciBiZSBzaG93bi4N
Cg0KU2lnbmVkLW9mZi1ieTogSCBIYXJ0bGV5IFN3ZWV0ZW4gPGhzd2VldGVuQHZpc2lvbmVuZ3Jh
dmVycy5jb20+DQpDYzogRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPg0KQ2M6
IEFuZHJlIFJlbmF1ZCA8YW5kcmVAYmx1ZXdhdGVyc3lzLmNvbT4NCkNjOiBSeWFuIE1hbGxvbiA8
cnlhbkBibHVld2F0ZXJzeXMuY29tPg0KDQotLS0NCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L2RldmljZXMvc3N0MjVsLmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3NzdDI1bC5jDQppbmRleCBm
ZTE3MDU0Li5iY2YwNDBiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9zc3QyNWwu
Yw0KKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9zc3QyNWwuYw0KQEAgLTQxMSwxNyArNDExLDYg
QEAgc3RhdGljIGludCBfX2luaXQgc3N0MjVsX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkp
DQogCSAgICAgIGZsYXNoLT5tdGQuZXJhc2VzaXplLCBmbGFzaC0+bXRkLmVyYXNlc2l6ZSAvIDEw
MjQsDQogCSAgICAgIGZsYXNoLT5tdGQubnVtZXJhc2VyZWdpb25zKTsNCiANCi0JaWYgKGZsYXNo
LT5tdGQubnVtZXJhc2VyZWdpb25zKQ0KLQkJZm9yIChpID0gMDsgaSA8IGZsYXNoLT5tdGQubnVt
ZXJhc2VyZWdpb25zOyBpKyspDQotCQkJREVCVUcoTVREX0RFQlVHX0xFVkVMMiwNCi0JCQkgICAg
ICAibXRkLmVyYXNlcmVnaW9uc1slZF0gPSB7IC5vZmZzZXQgPSAweCVsbHgsICINCi0JCQkgICAg
ICAiLmVyYXNlc2l6ZSA9IDB4JS44eCAoJXVLaUIpLCAiDQotCQkJICAgICAgIi5udW1ibG9ja3Mg
PSAlZCB9XG4iLA0KLQkJCSAgICAgIGksIChsb25nIGxvbmcpZmxhc2gtPm10ZC5lcmFzZXJlZ2lv
bnNbaV0ub2Zmc2V0LA0KLQkJCSAgICAgIGZsYXNoLT5tdGQuZXJhc2VyZWdpb25zW2ldLmVyYXNl
c2l6ZSwNCi0JCQkgICAgICBmbGFzaC0+bXRkLmVyYXNlcmVnaW9uc1tpXS5lcmFzZXNpemUgLyAx
MDI0LA0KLQkJCSAgICAgIGZsYXNoLT5tdGQuZXJhc2VyZWdpb25zW2ldLm51bWJsb2Nrcyk7DQot
DQogCWlmIChtdGRfaGFzX3BhcnRpdGlvbnMoKSkgew0KIAkJc3RydWN0IG10ZF9wYXJ0aXRpb24g
KnBhcnRzID0gTlVMTDsNCiAJCWludCBucl9wYXJ0cyA9IDA7DQo=
