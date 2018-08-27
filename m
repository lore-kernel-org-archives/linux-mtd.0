Received: from m15-29.126.com ([220.181.15.29])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuJXr-0000fa-To
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2018 15:35:14 +0000
Date: Mon, 27 Aug 2018 23:02:29 +0800 (CST)
From: liuxiang  <liuxiang_1999@126.com>
To: "Boris Brezillon" <boris.brezillon@bootlin.com>
Cc: "Liu Xiang" <liu.xiang6@zte.com.cn>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, han.xu@nxp.com, marek.vasut@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 "Yogesh Narayan Gaur" <yogeshnarayan.gaur@nxp.com>
Subject: Re:Re: [PATCH] mtd: spi-nor: fsl-quadspi: fix read error for flash
 size larger than 16MB
In-Reply-To: <20180827100613.78823993@bbrezillon>
References: <1534583663-2842-1-git-send-email-liu.xiang6@zte.com.cn>
 <20180827100613.78823993@bbrezillon>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3571f5ca.c32c.1657be858d1.Coremail.liuxiang_1999@126.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CgpGaXhlczplNDZlY2RhNzY0ZGMzN2Y5ZmM2Mjc5ZDk1ZWEyYzAwN2RhZWYxYTcxKCJtdGQ6IHNw
aS1ub3I6IEFkZCBGcmVlc2NhbGUgUXVhZFNQSSBkcml2ZXIiKQpDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZwoKU2hvdWxkIEkgc2VuZCBhIFYyIHBhdGNoIHRoYXQgYWRkcyB0aGVzZSBhYm92Ze+8
nwoKCgoKQXQgMjAxOC0wOC0yNyAxNjowNjoxMywgIkJvcmlzIEJyZXppbGxvbiIgPGJvcmlzLmJy
ZXppbGxvbkBib290bGluLmNvbT4gd3JvdGU6Cj5PbiBTYXQsIDE4IEF1ZyAyMDE4IDE3OjE0OjIz
ICswODAwCj5MaXUgWGlhbmcgPGxpdS54aWFuZzZAenRlLmNvbS5jbj4gd3JvdGU6Cj4KPj4gSWYg
dGhlIHNpemUgb2Ygc3BpLW5vciBmbGFzaCBpcyBsYXJnZXIgdGhhbiAxNk1CLCB0aGUgcmVhZF9v
cGNvZGUKPj4gaXMgc2V0IHRvIFNQSU5PUl9PUF9SRUFEXzFfMV80XzRCLCBhbmQgZnNsX3FzcGlf
Z2V0X3NlcWlkKCkgd2lsbAo+PiByZXR1cm4gLUVJTlZBTCB3aGVuIGNtZCBpcyBTUElOT1JfT1Bf
UkVBRF8xXzFfNF80Qi4gVGhpcyBjYW4KPj4gY2F1c2UgcmVhZCBvcGVyYXRpb24gZmFpbC4KPj4g
Cj4+IFNpZ25lZC1vZmYtYnk6IExpdSBYaWFuZyA8bGl1LnhpYW5nNkB6dGUuY29tLmNuPgo+Cj5J
J20gcHJldHR5IHN1cmUgeW91IHdhbnQgdG8gYmFja3BvcnQgdGhpcyBmaXguIENhbiB5b3UgYWRk
IGEgRml4ZXMgdGFnCj5hbmQgQ0Mgc3RhYmxlPwo+Cj5BbHNvLCBJJ2QgbGlrZSB0byBoYXZlIGFu
IEFjayBmcm9tIHNvbWVvbmUgd29ya2luZyBhdCBOWFAgKEhhbiwKPllvZ2VzaD8pLgo+Cj5UaGFu
a3MsCj4KPkJvcmlzLgo+Cj4+IC0tLQo+PiAgZHJpdmVycy9tdGQvc3BpLW5vci9mc2wtcXVhZHNw
aS5jIHwgMSArCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4gCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2ZzbC1xdWFkc3BpLmMgYi9kcml2ZXJzL210ZC9z
cGktbm9yL2ZzbC1xdWFkc3BpLmMKPj4gaW5kZXggN2Q5NjIwYy4uNjQzMDRhMyAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9mc2wtcXVhZHNwaS5jCj4+ICsrKyBiL2RyaXZlcnMv
bXRkL3NwaS1ub3IvZnNsLXF1YWRzcGkuYwo+PiBAQCAtNDc4LDYgKzQ3OCw3IEBAIHN0YXRpYyBp
bnQgZnNsX3FzcGlfZ2V0X3NlcWlkKHN0cnVjdCBmc2xfcXNwaSAqcSwgdTggY21kKQo+PiAgewo+
PiAgCXN3aXRjaCAoY21kKSB7Cj4+ICAJY2FzZSBTUElOT1JfT1BfUkVBRF8xXzFfNDoKPj4gKwlj
YXNlIFNQSU5PUl9PUF9SRUFEXzFfMV80XzRCOgo+PiAgCQlyZXR1cm4gU0VRSURfUkVBRDsKPj4g
IAljYXNlIFNQSU5PUl9PUF9XUkVOOgo+PiAgCQlyZXR1cm4gU0VRSURfV1JFTjsK
