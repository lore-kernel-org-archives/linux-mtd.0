Received: from m15-35.126.com ([220.181.15.35])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuenZ-0000Ao-Av
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 14:16:51 +0000
Date: Tue, 28 Aug 2018 22:16:08 +0800 (CST)
From: "Liu Xiang" <liuxiang_1999@126.com>
To: "Boris Brezillon" <boris.brezillon@bootlin.com>
Cc: "Liu Xiang" <liu.xiang6@zte.com.cn>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, han.xu@nxp.com,
 marek.vasut@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, richard@nod.at
Subject: Re:Re: [PATCH v2] mtd: spi-nor: fsl-quadspi: fix read error for
 flash size  larger than 16MB
In-Reply-To: <20180828152305.18df57e2@bbrezillon>
References: <1535462476-3540-1-git-send-email-liu.xiang6@zte.com.cn>
 <20180828152305.18df57e2@bbrezillon>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <749634d5.bb6a.16580e444f2.Coremail.liuxiang_1999@126.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CgpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4gU2hvdWxkIEkgc2VuZCBhbm90aGVyIHBhdGNo
PwoKCgoKCgoKQXQgMjAxOC0wOC0yOCAyMToyMzowNSwgIkJvcmlzIEJyZXppbGxvbiIgPGJvcmlz
LmJyZXppbGxvbkBib290bGluLmNvbT4gd3JvdGU6Cj5PbiBUdWUsIDI4IEF1ZyAyMDE4IDIxOjIx
OjE2ICswODAwCj5MaXUgWGlhbmcgPGxpdS54aWFuZzZAenRlLmNvbS5jbj4gd3JvdGU6Cj4KPj4g
SWYgdGhlIHNpemUgb2Ygc3BpLW5vciBmbGFzaCBpcyBsYXJnZXIgdGhhbiAxNk1CLCB0aGUgcmVh
ZF9vcGNvZGUKPj4gaXMgc2V0IHRvIFNQSU5PUl9PUF9SRUFEXzFfMV80XzRCLCBhbmQgZnNsX3Fz
cGlfZ2V0X3NlcWlkKCkgd2lsbAo+PiByZXR1cm4gLUVJTlZBTCB3aGVuIGNtZCBpcyBTUElOT1Jf
T1BfUkVBRF8xXzFfNF80Qi4gVGhpcyBjYW4KPj4gY2F1c2UgcmVhZCBvcGVyYXRpb24gZmFpbC4K
Pj4gCj4+IC0tLQo+PiB2MjoKPj4gICBhZGQgRml4ZXMgdGFnIGFuZCBDQyBzdGFibGUgc3VnZ2Vz
dGVkIGJ5IEJvcmlzLgo+PiAtLS0KPgo+VGhlIGFib3ZlIGNoYW5nZWxvZwo+Cj4+IAo+PiBGaXhl
czogZTQ2ZWNkYTc2NGRjICgibXRkOiBzcGktbm9yOiBBZGQgRnJlZXNjYWxlIFF1YWRTUEkgZHJp
dmVyIikKPj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBM
aXUgWGlhbmcgPGxpdS54aWFuZzZAenRlLmNvbS5jbj4KPj4gLS0tCj4KPnNob3VsZCBiZSBwbGFj
ZWQgaGVyZS4KPgo+PiAgZHJpdmVycy9tdGQvc3BpLW5vci9mc2wtcXVhZHNwaS5jIHwgMSArCj4+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9zcGktbm9yL2ZzbC1xdWFkc3BpLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2ZzbC1x
dWFkc3BpLmMKPj4gaW5kZXggN2Q5NjIwYy4uNjQzMDRhMyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9mc2wtcXVhZHNwaS5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
ZnNsLXF1YWRzcGkuYwo+PiBAQCAtNDc4LDYgKzQ3OCw3IEBAIHN0YXRpYyBpbnQgZnNsX3FzcGlf
Z2V0X3NlcWlkKHN0cnVjdCBmc2xfcXNwaSAqcSwgdTggY21kKQo+PiAgewo+PiAgCXN3aXRjaCAo
Y21kKSB7Cj4+ICAJY2FzZSBTUElOT1JfT1BfUkVBRF8xXzFfNDoKPj4gKwljYXNlIFNQSU5PUl9P
UF9SRUFEXzFfMV80XzRCOgo+PiAgCQlyZXR1cm4gU0VRSURfUkVBRDsKPj4gIAljYXNlIFNQSU5P
Ul9PUF9XUkVOOgo+PiAgCQlyZXR1cm4gU0VRSURfV1JFTjsK
