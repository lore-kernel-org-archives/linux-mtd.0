Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08E3C7EE23
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 06:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VAVKwWywjT1HSsg5WrApp6q3fHHCwgY6V4Hu6/pLbXg=; b=g6UuyJzudjgq2S
	lHF1G/DqmESmmsXPZ1O8ECwVuTJv70ikgSz+ND+SI6z7p4D8xtDMBvwuEETRzCP6GgLkfRWMDYDSY
	g52dKfOse4JRoOB05Zd3eVJMJjrrzXJdeFLwYIVrimSbG8U7Ft2or5tBnCzQnjTmxqmTTaIb800sO
	rlEgaTIhkXR+kGV1/naWMMXybFD8aFTbYXr/PROjmuD2zC5A9UX//FXuAPGveMLK+S+WKOQGSji/O
	A0NdABnt++Q5QOOqGB0wDe5khURAEdawatYBz2OiDyfs5OqQqTrOVVFgLWwkzgB+g/iAlIyUtlOK4
	1jRKKQgb/PrJzkgKWsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q78ti-008Dls-32;
	Thu, 08 Jun 2023 06:13:26 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q78te-008Djn-1L;
	Thu, 08 Jun 2023 06:13:25 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 4B7C75FD08;
	Thu,  8 Jun 2023 09:13:19 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686204799;
	bh=or7Yqg5C8h/byyRbSI5VeLfJdpcuYjeWvRTn0qMospo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=hLnMn/mS2xDWj7QdtHWax6BzgtHNmuMvOa4tiIFqAfne5yxTuzZ1aMDsH7cZbjpL/
	 2A5Cct3PtpJP6HVZdDhYbhv4uHiDKt936Yr8BH1CNY0clEku/4l4QXSEzHAni4Ujfb
	 Z+OZMLOdsTWF//glyFNr4IW2N1b/zvjcSXeyo8fafMuBvPObFoYU70fqqg51EnAPLM
	 Xf/3FwqvKGusSca946ppijY62I5l2Ooqjw++ZCnFKTeOgKd+uaiXfe3imatyOI0vRa
	 5LwEl8r2Dc70Ikq5YBDpROsYtrlAIb8e1AESyeyNmttYD74t4FooL7v1BOjDBjZlBx
	 TEWRdVA2He6BA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu,  8 Jun 2023 09:13:17 +0300 (MSK)
Message-ID: <c5702961-2a95-aac8-a60f-a652ade457b3@sberdevices.ru>
Date: Thu, 8 Jun 2023 09:08:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] mtd: rawnand: meson: check buffer length
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
References: <20230606101644.3297859-1-AVKrasnov@sberdevices.ru>
 <9adef6da-5930-dcaa-f148-e4a398d39f2d@sberdevices.ru>
 <3a9470ed-d7ad-6cae-0d58-732399590272@sberdevices.ru>
 <20230608081040.78e74eb1@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230608081040.78e74eb1@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/08 03:34:00 #21458136
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_231323_127853_706532D0 
X-CRM114-Status: GOOD (  23.67  )
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

CgpPbiAwOC4wNi4yMDIzIDA5OjEwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFRodSwgOCBKdW4gMjAyMyAw
MDoxNzozNSArMDMwMDoKPiAKPj4gSGkgYWdhaW4gTWlxdWVsLCBMaWFuZyEKPj4KPj4gV2hhdCBk
byBZb3UgdGhpbmsgYWJvdXQgdGhpcyBwYXRjaD8KPiAKPiBJIHJlYWxseSBhcHByZWNpYXRlIGFs
bCB0aGUgZWZmb3J0IHlvdSBhcmUgcHV0dGluZyBpbnRvIHRoaXMgYnV0Cj4gcGxlYXNlIGNvbnNp
ZGVyIGdpdmluZyBtZSBhIGxpdHRsZSBiaXQgb2YgYWlyIGFzIHdlbGwsIEknbSBhbHJlYWR5Cj4g
c3BlbmRpbmcgYSBsb3Qgb2YgdGltZSByZXZpZXdpbmcgYWxsIHlvdXIgcGF0Y2hlcy4gUGxlYXNl
IG1pbmQgYSBwaW5nCj4gaXMgbm90IHJlbGV2YW50IGJlZm9yZSBhIGNvdXBsZSBvZiB3ZWVrcyBp
biBnZW5lcmFsLgoKU29ycnkgZm9yIHRoYXQhIFN1cmUsIG5vIHByb2JsZW0hCgo+IAo+IEluIHRo
aXMgY2FzZSBJIGhhZCBpdCBpbiBteSAidG8gYXBwbHkiIGxpc3QgYnV0IGFjdHVhbGx5IGxvb2tp
bmcgYXQgaXQKPiBhZ2FpbiBJIGhhdmUgYSBtaW5vciBjb21tZW50IGJlbG93LgoKR290IGl0IQoK
VGhhbmtzLCBBcnNlbml5Cgo+IAo+Pgo+PiBUaGFua3MsIEFyc2VuaXkKPj4KPj4gT24gMDYuMDYu
MjAyMyAxOToyOSwgQXJzZW5peSBLcmFzbm92IHdyb3RlOgo+Pj4gU29ycnksIGhlcmUgaXMgY2hh
bmdlbG9nOgo+Pj4gdjEgLT4gdjI6Cj4+PiAqIE1vdmUgY2hlY2tzIGZyb20gJ3N3aXRjaC9jYXNl
JyB3aGljaCBleGVjdXRlcyBjb21tYW5kcyBpbiAnbWVzb25fbmZjX2V4ZWNfb3AoKScgdG8gYSBz
cGVjaWFsCj4+PiAgIHNlcGFyYXRlZCBmdW5jdGlvbiAnbWVzb25fbmZjX2NoZWNrX29wKCknIHdo
aWNoIGlzIGNhbGxlZCBiZWZvcmUgY29tbWFuZHMgcHJvY2Vzc2luZy4KPj4+Cj4+PiBPbiAwNi4w
Ni4yMDIzIDEzOjE2LCBBcnNlbml5IEtyYXNub3Ygd3JvdGU6ICAKPj4+PiBNZXNvbiBOQU5EIGNv
bnRyb2xsZXIgaGFzIGxpbWl0ZWQgYnVmZmVyIGxlbmd0aCwgc28gY2hlY2sgaXQgYmVmb3JlCj4+
Pj4gY29tbWFuZCBleGVjdXRpb24gdG8gYXZvaWQgbGVuZ3RoIHRyaW0uIEFsc28gY2hlY2sgTVRE
IHdyaXRlIHNpemUgb24KPj4+PiBjaGlwIGF0dGFjaC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+Pj4+IC0tLQo+Pj4+
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCA0NyArKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L21lc29uX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+Pj4+IGlu
ZGV4IDIzYTczMjY4NDIxYi4uZGI2YjE4NzUzMDcxIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L21lc29uX25hbmQuYwo+Pj4+IEBAIC0xMTEsNiArMTExLDggQEAKPj4+PiAgCj4+Pj4gICNkZWZp
bmUgUEVSX0lORk9fQllURQkJOAo+Pj4+ICAKPj4+PiArI2RlZmluZSBORkNfQ01EX1JBV19MRU4J
R0VOTUFTSygxMywgMCkKPj4+PiArCj4+Pj4gIHN0cnVjdCBtZXNvbl9uZmNfbmFuZF9jaGlwIHsK
Pj4+PiAgCXN0cnVjdCBsaXN0X2hlYWQgbm9kZTsKPj4+PiAgCXN0cnVjdCBuYW5kX2NoaXAgbmFu
ZDsKPj4+PiBAQCAtMjg0LDcgKzI4Niw3IEBAIHN0YXRpYyB2b2lkIG1lc29uX25mY19jbWRfYWNj
ZXNzKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIGludCByYXcsIGJvb2wgZGlyLAo+Pj4+ICAKPj4+
PiAgCWlmIChyYXcpIHsKPj4+PiAgCQlsZW4gPSBtdGQtPndyaXRlc2l6ZSArIG10ZC0+b29ic2l6
ZTsKPj4+PiAtCQljbWQgPSAobGVuICYgR0VOTUFTSygxMywgMCkpIHwgc2NyYW1ibGVyIHwgRE1B
X0RJUihkaXIpOwo+Pj4+ICsJCWNtZCA9IGxlbiB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGlyKTsK
Pj4+PiAgCQl3cml0ZWwoY21kLCBuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DTUQpOwo+Pj4+ICAJ
CXJldHVybjsKPj4+PiAgCX0KPj4+PiBAQCAtNTczLDcgKzU3NSw3IEBAIHN0YXRpYyBpbnQgbWVz
b25fbmZjX3JlYWRfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYsIGludCBsZW4p
Cj4+Pj4gIAlpZiAocmV0KQo+Pj4+ICAJCWdvdG8gb3V0Owo+Pj4+ICAKPj4+PiAtCWNtZCA9IE5G
Q19DTURfTjJNIHwgKGxlbiAmIEdFTk1BU0soMTMsIDApKTsKPj4+PiArCWNtZCA9IE5GQ19DTURf
TjJNIHwgbGVuOwo+Pj4+ICAJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdfQ01E
KTsKPj4+PiAgCj4+Pj4gIAltZXNvbl9uZmNfZHJhaW5fY21kKG5mYyk7Cj4+Pj4gQEAgLTU5Nyw3
ICs1OTksNyBAQCBzdGF0aWMgaW50IG1lc29uX25mY193cml0ZV9idWYoc3RydWN0IG5hbmRfY2hp
cCAqbmFuZCwgdTggKmJ1ZiwgaW50IGxlbikKPj4+PiAgCWlmIChyZXQpCj4+Pj4gIAkJcmV0dXJu
IHJldDsKPj4+PiAgCj4+Pj4gLQljbWQgPSBORkNfQ01EX00yTiB8IChsZW4gJiBHRU5NQVNLKDEz
LCAwKSk7Cj4+Pj4gKwljbWQgPSBORkNfQ01EX00yTiB8IGxlbjsKPj4+PiAgCXdyaXRlbChjbWQs
IG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7Cj4+Pj4gIAo+Pj4+ICAJbWVzb25fbmZjX2Ry
YWluX2NtZChuZmMpOwo+Pj4+IEBAIC0xMDA3LDYgKzEwMDksMzEgQEAgbWVzb25fbmFuZF9vcF9w
dXRfZG1hX3NhZmVfb3V0cHV0X2J1Zihjb25zdCBzdHJ1Y3QgbmFuZF9vcF9pbnN0ciAqaW5zdHIs
Cj4+Pj4gIAkJa2ZyZWUoYnVmKTsKPj4+PiAgfQo+Pj4+ICAKPj4+PiArc3RhdGljIGludCBtZXNv
bl9uZmNfY2hlY2tfb3Aoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPj4+PiArCQkJICAgICAgY29u
c3Qgc3RydWN0IG5hbmRfb3BlcmF0aW9uICpvcCkKPj4+PiArewo+Pj4+ICsJaW50IG9wX2lkOwo+
Pj4+ICsKPj4+PiArCWZvciAob3BfaWQgPSAwOyBvcF9pZCA8IG9wLT5uaW5zdHJzOyBvcF9pZCsr
KSB7Cj4+Pj4gKwkJY29uc3Qgc3RydWN0IG5hbmRfb3BfaW5zdHIgKmluc3RyOwo+Pj4+ICsKPj4+
PiArCQlpbnN0ciA9ICZvcC0+aW5zdHJzW29wX2lkXTsKPj4+PiArCj4+Pj4gKwkJc3dpdGNoIChp
bnN0ci0+dHlwZSkgewo+Pj4+ICsJCWNhc2UgTkFORF9PUF9EQVRBX0lOX0lOU1RSOgo+Pj4+ICsJ
CWNhc2UgTkFORF9PUF9EQVRBX09VVF9JTlNUUjoKPj4+PiArCQkJaWYgKGluc3RyLT5jdHguZGF0
YS5sZW4gPiBORkNfQ01EX1JBV19MRU4pCj4+Pj4gKwkJCQlyZXR1cm4gLUVOT1RTVVBQOwo+Pj4+
ICsKPj4+PiArCQkJYnJlYWs7Cj4+Pj4gKwkJZGVmYXVsdDoKPj4+PiArCQkJYnJlYWs7Cj4+Pj4g
KwkJfQo+Pj4+ICsJfQo+Pj4+ICsKPj4+PiArCXJldHVybiAwOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+
ICBzdGF0aWMgaW50IG1lc29uX25mY19leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4+
Pj4gIAkJCSAgICAgY29uc3Qgc3RydWN0IG5hbmRfb3BlcmF0aW9uICpvcCwgYm9vbCBjaGVja19v
bmx5KQo+Pj4+ICB7Cj4+Pj4gQEAgLTEwMTUsMTAgKzEwNDIsMTIgQEAgc3RhdGljIGludCBtZXNv
bl9uZmNfZXhlY19vcChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLAo+Pj4+ICAJY29uc3Qgc3RydWN0
IG5hbmRfb3BfaW5zdHIgKmluc3RyID0gTlVMTDsKPj4+PiAgCXZvaWQgKmJ1ZjsKPj4+PiAgCXUz
MiBvcF9pZCwgZGVsYXlfaWRsZSwgY21kOwo+Pj4+ICsJaW50IGVycjsKPj4+PiAgCWludCBpOwo+
Pj4+ICAKPj4+PiAtCWlmIChjaGVja19vbmx5KQo+Pj4+IC0JCXJldHVybiAwOwo+Pj4+ICsJZXJy
ID0gbWVzb25fbmZjX2NoZWNrX29wKG5hbmQsIG9wKTsKPj4+PiArCWlmIChlcnIgfHwgY2hlY2tf
b25seSkKPj4+PiArCQlyZXR1cm4gZXJyOwo+IAo+IEZvciB0aGUgc2FrZSBvZiByZWFkYWJpbGl0
eSBpdCBpcyByZWFsbHkgaW1wb3J0YW50IHRoYXQgd2Uga2VlcCB1c2luZwo+IHN0YW5kYXJkIGNv
bnN0cnVjdGlvbnMsIHNvIGRvbid0IG1peCBvcnRob2dvbmFsIGNoZWNrcyBhbmQgcGxlYXNlIHVz
ZQo+IHNvbWV0aGluZyBsaWtlOgo+IAo+IAllcnIgPSBjaGVjaygpOwo+IAlpZiAoZXJyKQo+IAkJ
cmV0dXJuIGVycjsKPiAKPiAJaWYgKGNoZWNrX29ubHkpCj4gCQlyZXR1cm4gMDsKPiAKPj4+PiAg
Cj4+Pj4gIAltZXNvbl9uZmNfc2VsZWN0X2NoaXAobmFuZCwgb3AtPmNzKTsKPj4+PiAgCWZvciAo
b3BfaWQgPSAwOyBvcF9pZCA8IG9wLT5uaW5zdHJzOyBvcF9pZCsrKSB7Cj4+Pj4gQEAgLTEyOTMs
NiArMTMyMiw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFu
ZF9jaGlwICpuYW5kKQo+Pj4+ICAJc3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgKm1lc29uX2No
aXAgPSB0b19tZXNvbl9uYW5kKG5hbmQpOwo+Pj4+ICAJc3RydWN0IG10ZF9pbmZvICptdGQgPSBu
YW5kX3RvX210ZChuYW5kKTsKPj4+PiAgCWludCBuc2VjdG9ycyA9IG10ZC0+d3JpdGVzaXplIC8g
MTAyNDsKPj4+PiArCWludCByYXdfd3JpdGVzaXplOwo+Pj4+ICAJaW50IHJldDsKPj4+PiAgCj4+
Pj4gIAlpZiAoIW10ZC0+bmFtZSkgewo+Pj4+IEBAIC0xMzA0LDYgKzEzMzQsMTMgQEAgc3RhdGlj
IGludCBtZXNvbl9uYW5kX2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQpCj4+Pj4g
IAkJCXJldHVybiAtRU5PTUVNOwo+Pj4+ICAJfQo+Pj4+ICAKPj4+PiArCXJhd193cml0ZXNpemUg
PSBtdGQtPndyaXRlc2l6ZSArIG10ZC0+b29ic2l6ZTsKPj4+PiArCWlmIChyYXdfd3JpdGVzaXpl
ID4gTkZDX0NNRF9SQVdfTEVOKSB7Cj4+Pj4gKwkJZGV2X2VycihuZmMtPmRldiwgInRvbyBiaWcg
d3JpdGUgc2l6ZSBpbiByYXcgbW9kZTogJWQgPiAlbGRcbiIsCj4+Pj4gKwkJCXJhd193cml0ZXNp
emUsIE5GQ19DTURfUkFXX0xFTik7Cj4+Pj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+Pj4gKwl9Cj4+
Pj4gKwo+Pj4+ICAJaWYgKG5hbmQtPmJidF9vcHRpb25zICYgTkFORF9CQlRfVVNFX0ZMQVNIKQo+
Pj4+ICAJCW5hbmQtPmJidF9vcHRpb25zIHw9IE5BTkRfQkJUX05PX09PQjsKPj4+PiAgICAKPiAK
PiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
