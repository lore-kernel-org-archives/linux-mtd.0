Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIizj-0004sx-7n
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 22:00:05 +0000
From: Darwin Dingel <Darwin.Dingel@alliedtelesis.co.nz>
To: Pavel Machek <pavel@ucw.cz>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "cyrille.pitchen@atmel.com"
 <cyrille.pitchen@atmel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mark.marshall@omicronenergy.com"
 <mark.marshall@omicronenergy.com>, "b44839@freescale.com"
 <b44839@freescale.com>, "prabhakar@freescale.com" <prabhakar@freescale.com>
Subject: Re: mtd: nand: fsl_ifc: fix handing of bit flips in erased pages
Date: Wed, 7 Jun 2017 21:59:32 +0000
Message-ID: <1496872770936.46522@alliedtelesis.co.nz>
References: <5f665145ea304d3a9e1ecb39c51a951e@svr-chch-ex1.atlnz.lc>
 <20170531204913.GC16962@amd>
 <95d9297bf6604c1f8fe9c36a231b8a06@svr-chch-ex1.atlnz.lc>,
 <20170531221554.GA25597@amd>
In-Reply-To: <20170531221554.GA25597@amd>
Content-Language: en-NZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgUGF2ZWwsCgpMb29rcyBsaWtlIHVib290IGhhcyBzaW1pbGFyIElGQyBkcml2ZXIuIERvIHlv
dSBoYXZlIHBsYW5zIHRvIGFwcGx5IHRoaXMgY2hhbmdlIHRvIHVib290IGFzIHdlbGw/CgoKQ2hl
ZXJzLApEYXJ3aW4K4oCLCgpGcm9tOiBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4KU2VudDog
VGh1cnNkYXksIDEgSnVuZSAyMDE3IDEwOjE1IGEubS4KVG86IERhcndpbiBEaW5nZWwKQ2M6IEJv
cmlzIEJyZXppbGxvbjsgcmljaGFyZEBub2QuYXQ7IGR3bXcyQGluZnJhZGVhZC5vcmc7IGNvbXB1
dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbTsgbWFyZWsudmFzdXRAZ21haWwuY29tOyBjeXJpbGxlLnBp
dGNoZW5AYXRtZWwuY29tOyBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgbWFyay5tYXJzaGFsbEBvbWljcm9uZW5lcmd5LmNvbTsgYjQ0
ODM5QGZyZWVzY2FsZS5jb207ICBwcmFiaGFrYXJAZnJlZXNjYWxlLmNvbQpTdWJqZWN0OiBSZTog
bXRkOiBuYW5kOiBmc2xfaWZjOiBmaXggaGFuZGluZyBvZiBiaXQgZmxpcHMgaW4gZXJhc2VkIHBh
Z2VzCsKgICAgCkhpIQoKPiA+IFlvdSBtZWVuICJlcnJvcnMgPSAwIj8gRG9lcyB0aGF0IGFjdHVh
bGx5IG1ha2UgYSBkaWZmZXJlbmNlPyBJdCBpcyBhCj4gPiBsb2NhbCB2YXJpYWJsZSwgYW5kIGNv
bnRpbnVlIG1ha2VzIHN1cmUgdGhlIHZhbHVlIGlzIG5vdCB1c2VkOgo+ID4gCj4gCj4gSSBtaXNz
ZWQgdGhlICdjb250aW51ZScgc3RhdGVtZW50IHRoZXJlLiBJbiB0aGF0IGNhc2Ugd2UgZG9uJ3Qg
bmVlZCB0byAKPiByZXNldCAnZXJyb3InLgoKWWVzLCB0aGFua3MsIEkgd2FudGVkIHRvIGRvdWJs
ZS1jaGVjay4gSWYgeW91IGNvdWxkIHRha2UgYSBsb29rIGF0ClBBVENIdjIgLS0gaXQgc2hvdWxk
IGhhdmUgdGhlIHByb2JsZW1zIGZpeGVkLiBZb3VyIEFja2VkLWJ5IHdvdWxkIGJlCm5pY2UgOy0p
LgoKVGhhbmtzIGEgbG90LArCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBhdmVsCi0tIAoo
ZW5nbGlzaCkgaHR0cDovL3d3dy5saXZlam91cm5hbC5jb20vfnBhdmVsbWFjaGVrCihjZXNreSwg
cGljdHVyZXMpICBodHRwOi8vYXRyZXkua2FybGluLm1mZi5jdW5pLmN6L35wYXZlbC9waWN0dXJl
L2hvcnNlcy9ibG9nLmh0bWwKICAgIA==
