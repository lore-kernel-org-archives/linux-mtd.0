Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0FCC77B73
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 08:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/QoCVZeWOo8a7KMWQvgAPmVwzqXTFzHv+OIir0iV7og=; b=ahC6KzuXy3+T17
	zmHS8AGaahF2pgv3nx4NT3McvwxgLMOiUDN/U4I3bd9ThnyArvXN7qiVHtD8T7PhOTAeO/cTkB1ti
	mVhhAWLg7bQnYd4VNHk7w6JaBadoedtm48qeYEfp11A98lkVa2ovrhBVXYnEJj0ye1sPQjwyrhNtT
	EV7LP5ho7a9Tv4iQbhTljz5+N0H3priLYhdNnmMGq9tg39VfrEl7InkTMI8G6CL1eyjYvRSO8XbDU
	0vIqg/mbJ2kCYOx5enT0WbuXyv9VRJ2Bi32lNUv7ow+Rt2qPGVR1Bki7lNb8a4Nn2BT6/63K2qPWd
	gvInThU6qmqxrKABIzZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SP2-000tGy-0B;
	Tue, 06 Jun 2023 08:50:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SOz-000tFO-0T;
	Tue, 06 Jun 2023 08:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fzYCuFXNsmnElmKXwU1mIqefZgkp9qnlJKt8LsUnhE8=; b=hb6vXMufbqKDEzmOYPx703Za8O
	9eQox9UpQecQY+c0/U24j7r/6NMkIA+C0sF0Tgky19kJWBLLcq9kg6IfproNAHOvR4v6wSUhfxmKK
	MiJJlHZKkLLcefJ+0zDrPgfT3eVf+pLWEhPgdVyK8/5fzMhU14+hsEuswxEW4xo8uW6NJd0iDUMu5
	mgkQKUokoGXQsNYwzJF4bWvJTqVoe97H92P64+nBXgN7aFBUwSGOCFkmMbaWzmJkIOtXkpb6xEc5e
	Eesz4Gf/R6mkU0otK2N2ZPLVVrAfKjuYRHnhDGHIqmbc+8ohAe81DIJK4KMy7sP7W1rwkjT8gLTqt
	XhQYHr8A==;
Received: from mx.sberdevices.ru ([45.89.227.171])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RL5-0041UG-14;
	Tue, 06 Jun 2023 07:42:58 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 82DEE5FD25;
	Tue,  6 Jun 2023 10:42:37 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686037357;
	bh=fzYCuFXNsmnElmKXwU1mIqefZgkp9qnlJKt8LsUnhE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=htNuaH49mu4sT39gBJ8bfbjs+HgzQJECYIt3riK7h6CWSuQCGzf9AXkoxGIHnbiWz
	 Vq60THo0oCJtx38XNR9ldmslsXSiHi6Lt8jJFkc/FAatYYKvFxxHCxwmfckx2x03m/
	 GgqEaynrYw0SOy/h4G7G1qzK1+hfoYqIXB6P5W+Ft/asys14ESaSF6vB5/9ycSdOBg
	 yaXa1xAYDGWJYYtZBAHycrE2hq9LAPTr/XzOSpQxT1nfQJZbgzqE/8VEi902ylqaMk
	 B3mfdr3STb09U42wpKgTFgVMxLGnSdE3tx4KtcoYLaN/z6uVuQo28DF7NFhpqCcrlt
	 dAmGaOuilgwKQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  6 Jun 2023 10:42:36 +0300 (MSK)
Message-ID: <e31be327-b351-3a94-b2d8-0867f29bb9ec@sberdevices.ru>
Date: Tue, 6 Jun 2023 10:37:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] mtd: rawnand: meson: check buffer length
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230605191047.1820016-1-AVKrasnov@sberdevices.ru>
 <20230606091607.7b7b6814@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230606091607.7b7b6814@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/06 04:28:00 #21442352
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_084255_060501_EB7353AD 
X-CRM114-Status: GOOD (  16.92  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAwNi4wNi4yMDIzIDEwOjE2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIE1vbiwgNSBKdW4gMjAyMyAy
MjoxMDo0NiArMDMwMDoKPiAKPj4gTWVzb24gTkFORCBjb250cm9sbGVyIGhhcyBsaW1pdGVkIGJ1
ZmZlciBsZW5ndGgsIHNvIGNoZWNrIGl0IGJlZm9yZQo+PiBjb21tYW5kIGV4ZWN1dGlvbiB0byBh
dm9pZCBsZW5ndGggdHJpbS4gQWxzbyBjaGVjayBNVEQgd3JpdGUgc2l6ZSBvbgo+PiBjaGlwIGF0
dGFjaC4KPiAKPiBBbG1vc3QgdGhlcmUgOikKCkhlbGxvIE1pcXVlbCEKCllvdSBtZWFuIHRvIHJl
cGhyYXNlIGl0PyA6KQoKVGhhbmtzLCBBcnNlbml5Cgo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBB
cnNlbml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4KPj4gLS0tCj4+ICBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCAyMiArKysrKysrKysrKysrKysrKysrLS0t
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+PiBpbmRleCAwNzRlMTQyMjVjMDYuLmJmYjUz
NjNjYWMyMyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5j
Cj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+PiBAQCAtMTA4LDYg
KzEwOCw4IEBACj4+ICAKPj4gICNkZWZpbmUgUEVSX0lORk9fQllURQkJOAo+PiAgCj4+ICsjZGVm
aW5lIE5GQ19DTURfUkFXX0xFTglHRU5NQVNLKDEzLCAwKQo+PiArCj4+ICBzdHJ1Y3QgbWVzb25f
bmZjX25hbmRfY2hpcCB7Cj4+ICAJc3RydWN0IGxpc3RfaGVhZCBub2RlOwo+PiAgCXN0cnVjdCBu
YW5kX2NoaXAgbmFuZDsKPj4gQEAgLTI4MCw3ICsyODIsNyBAQCBzdGF0aWMgdm9pZCBtZXNvbl9u
ZmNfY21kX2FjY2VzcyhzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCBpbnQgcmF3LCBib29sIGRpciwK
Pj4gIAo+PiAgCWlmIChyYXcpIHsKPj4gIAkJbGVuID0gbXRkLT53cml0ZXNpemUgKyBtdGQtPm9v
YnNpemU7Cj4+IC0JCWNtZCA9IChsZW4gJiBHRU5NQVNLKDEzLCAwKSkgfCBzY3JhbWJsZXIgfCBE
TUFfRElSKGRpcik7Cj4+ICsJCWNtZCA9IGxlbiB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGlyKTsK
Pj4gIAkJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdfQ01EKTsKPj4gIAkJcmV0
dXJuOwo+PiAgCX0KPj4gQEAgLTU0NCw3ICs1NDYsNyBAQCBzdGF0aWMgaW50IG1lc29uX25mY19y
ZWFkX2J1ZihzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAqYnVmLCBpbnQgbGVuKQo+PiAgCWlm
IChyZXQpCj4+ICAJCWdvdG8gb3V0Owo+PiAgCj4+IC0JY21kID0gTkZDX0NNRF9OMk0gfCAobGVu
ICYgR0VOTUFTSygxMywgMCkpOwo+PiArCWNtZCA9IE5GQ19DTURfTjJNIHwgbGVuOwo+PiAgCXdy
aXRlbChjbWQsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7Cj4+ICAKPj4gIAltZXNvbl9u
ZmNfZHJhaW5fY21kKG5mYyk7Cj4+IEBAIC01NjgsNyArNTcwLDcgQEAgc3RhdGljIGludCBtZXNv
bl9uZmNfd3JpdGVfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYsIGludCBsZW4p
Cj4+ICAJaWYgKHJldCkKPj4gIAkJcmV0dXJuIHJldDsKPj4gIAo+PiAtCWNtZCA9IE5GQ19DTURf
TTJOIHwgKGxlbiAmIEdFTk1BU0soMTMsIDApKTsKPj4gKwljbWQgPSBORkNfQ01EX00yTiB8IGxl
bjsKPj4gIAl3cml0ZWwoY21kLCBuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DTUQpOwo+PiAgCj4+
ICAJbWVzb25fbmZjX2RyYWluX2NtZChuZmMpOwo+PiBAQCAtOTM2LDYgKzkzOCw5IEBAIHN0YXRp
YyBpbnQgbWVzb25fbmZjX2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPj4gIAkJCWJy
ZWFrOwo+PiAgCj4+ICAJCWNhc2UgTkFORF9PUF9EQVRBX0lOX0lOU1RSOgo+PiArCQkJaWYgKGlu
c3RyLT5jdHguZGF0YS5sZW4gPiBORkNfQ01EX1JBV19MRU4pCj4+ICsJCQkJcmV0dXJuIC1FSU5W
QUw7Cj4gCj4gWW91IG5lZWQgdG8gcmVmdXNlIHRoZSBvcGVyYXRpb24gZWFybGllci4gVGhhdCdz
IHdoYXQgdGhlIGNoZWNrX29wCj4gYm9vbGVhbiBpcyBhYm91dC4gTWF5YmUgeW91IGNhbiB0YWtl
IGluc3BpcmF0aW9uIGZyb20gYW5mY19jaGVja19vcCgpCj4gaW4gdGhlIGFyYXNhbiBjb250cm9s
bGVyLgoKT2shIFRoYW5rcyEKCj4gCj4+ICsKPj4gIAkJCWJ1ZiA9IG1lc29uX25hbmRfb3BfZ2V0
X2RtYV9zYWZlX2lucHV0X2J1ZihpbnN0cik7Cj4+ICAJCQlpZiAoIWJ1ZikKPj4gIAkJCQlyZXR1
cm4gLUVOT01FTTsKPj4gQEAgLTk0NCw2ICs5NDksOSBAQCBzdGF0aWMgaW50IG1lc29uX25mY19l
eGVjX29wKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4+ICAJCQlicmVhazsKPj4gIAo+PiAgCQlj
YXNlIE5BTkRfT1BfREFUQV9PVVRfSU5TVFI6Cj4+ICsJCQlpZiAoaW5zdHItPmN0eC5kYXRhLmxl
biA+IE5GQ19DTURfUkFXX0xFTikKPj4gKwkJCQlyZXR1cm4gLUVJTlZBTDsKPiAKPiBTYW1lLgo+
IAo+PiArCj4+ICAJCQlidWYgPSBtZXNvbl9uYW5kX29wX2dldF9kbWFfc2FmZV9vdXRwdXRfYnVm
KGluc3RyKTsKPj4gIAkJCWlmICghYnVmKQo+PiAgCQkJCXJldHVybiAtRU5PTUVNOwo+PiBAQCAt
MTE4MSw2ICsxMTg5LDcgQEAgc3RhdGljIGludCBtZXNvbl9uYW5kX2F0dGFjaF9jaGlwKHN0cnVj
dCBuYW5kX2NoaXAgKm5hbmQpCj4+ICAJc3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgKm1lc29u
X2NoaXAgPSB0b19tZXNvbl9uYW5kKG5hbmQpOwo+PiAgCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0g
bmFuZF90b19tdGQobmFuZCk7Cj4+ICAJaW50IG5zZWN0b3JzID0gbXRkLT53cml0ZXNpemUgLyAx
MDI0Owo+PiArCWludCByYXdfd3JpdGVzaXplOwo+PiAgCWludCByZXQ7Cj4+ICAKPj4gIAlpZiAo
IW10ZC0+bmFtZSkgewo+PiBAQCAtMTE5Miw2ICsxMjAxLDEzIEBAIHN0YXRpYyBpbnQgbWVzb25f
bmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kKQo+PiAgCQkJcmV0dXJuIC1F
Tk9NRU07Cj4+ICAJfQo+PiAgCj4+ICsJcmF3X3dyaXRlc2l6ZSA9IG10ZC0+d3JpdGVzaXplICsg
bXRkLT5vb2JzaXplOwo+PiArCWlmIChyYXdfd3JpdGVzaXplID4gTkZDX0NNRF9SQVdfTEVOKSB7
Cj4+ICsJCWRldl9lcnIobmZjLT5kZXYsICJ0b28gYmlnIHdyaXRlIHNpemUgaW4gcmF3IG1vZGU6
ICVkID4gJWxkXG4iLAo+PiArCQkJcmF3X3dyaXRlc2l6ZSwgTkZDX0NNRF9SQVdfTEVOKTsKPj4g
KwkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsJfQo+PiArCj4+ICAJaWYgKG5hbmQtPmJidF9vcHRpb25z
ICYgTkFORF9CQlRfVVNFX0ZMQVNIKQo+PiAgCQluYW5kLT5iYnRfb3B0aW9ucyB8PSBOQU5EX0JC
VF9OT19PT0I7Cj4+ICAKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
