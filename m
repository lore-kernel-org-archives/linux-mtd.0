Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59E2C7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 09:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G9H0bt3Bgqprp6ihkR1pAW+SmStzSGYs8fWsJrgCtTk=; b=JrpA7OHGoLr8ws
	zg2QCoHfQrLcw5xvXLCAedfQJIwpbnwixwzFGFuFWyn3t1GF14AWj/XgsAnvJs5INDU6smbfG7mEy
	dwT9OR0NtzZxK8kXOFIWNful0Y0QQwgt3LXpTjGPu6fQCTzVdNCDonoFZeFOxpxQINgOv5MQHpl8t
	HJfX8DgQdVOdWULMSSSCtfMYSMVgZguwbG9bRGsBCf84DWfbTFCSTrWLsS/Hw/kU1rZEYquhhc0RP
	o44CiUcMm/I3LfT+mlM0ePMchiUaWM5QKk9Ahjcq7fGEeVjgStpO/DL5H3ZJc4EC69t3TD2r8oEPd
	P24PXhN/keI1eWS0Z+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1O8s-009agl-1L;
	Tue, 23 May 2023 09:17:18 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1O8n-009ada-0L;
	Tue, 23 May 2023 09:17:15 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 110CA5FD61;
	Tue, 23 May 2023 12:17:03 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1684833423;
	bh=+ABvyWQfCXkUi2+uQOAB+8PQel5h0wJF+jP4krYjQWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=HvZysagfHA7sgcXd41nR5hvCN81dWokfJKKCFbJtvglsoLqWaq2lZGu5f3RFq4D7t
	 o7AYGZMLDm9SQl2CGVu/m9wsInTf/BJLgdhBpHEcY363w04IQyKnYZ8pPx0IH0Phes
	 8wWjJwem+NbJKsHwtCEvC74MwcJSDb4sIiLqiw8RomJwBxlesYeUWf5B5p/SOk7mOx
	 T3UegBFLjm/T+nxR0YwWPIm6L3hnHVeo0HH8vN5gBaqe/LezzPk8nPfNsSID0Y4yGD
	 aOk2Qw6jGwdOBzaVnTmOY1Kco+Cl4o0cL9DUoOKOOdbwkUwWfvI8YY1PdOR1Mz3hAR
	 C4ULRLv+08kmA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 23 May 2023 12:17:00 +0300 (MSK)
Message-ID: <9013b0e2-c923-43f8-0bd6-979bf0c23ebc@sberdevices.ru>
Date: Tue, 23 May 2023 12:12:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/5] mtd: rawnand: meson: fix command sequence for
 read/write
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>, Liang Yang
	<liang.yang@amlogic.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Yixun Lan
	<yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
 <20230515094440.3552094-2-AVKrasnov@sberdevices.ru>
 <20230522170526.6486755a@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230522170526.6486755a@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/23 05:11:00 #21371280
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_021713_518562_365EF7E1 
X-CRM114-Status: GOOD (  27.65  )
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

SGVsbG8gTWlxdWVsLCBMaWFuZwoKT24gMjIuMDUuMjAyMyAxODowNSwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIaSBBcnNlbml5LAo+IAo+IEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBv
biBNb24sIDE1IE1heSAyMDIzIDEyOjQ0OjM1ICswMzAwOgo+IAo+PiBUaGlzIGZpeGVzIHJlYWQv
d3JpdGUgZnVuY3Rpb25hbGl0eSBieToKPj4gMSkgQ2hhbmdpbmcgTkZDX0NNRF9SQl9JTlQgYml0
IHZhbHVlLgo+IAo+IEkgZ3Vlc3MgdGhpcyBpcyBhIHNlcGFyYXRlIGZpeAo+IAoKT2ssIEknbGwg
bW92ZSBpdCB0byBzZXBhcmF0ZSBwYXRjaAoKPj4gMikgQWRkaW5nIGV4dHJhIE5BTkRfQ01EX1NU
QVRVUyBjb21tYW5kIG9uIGVhY2ggci93IHJlcXVlc3QuCj4gCj4gSXMgdGhpcyByZWFsbHkgbmVl
ZGVkPyBMb29rcyBsaWtlIHlvdSdyZSBkZWxheWluZyB0aGUgbmV4dCBvcCBvbmx5LiBJcwo+IHVz
aW5nIGEgZGVsYXkgZW5vdWdoPyBJZiB5ZXMsIHRoZW4gaXQncyBwcm9iYWJseSB0aGUgd3Jvbmcg
YXBwcm9hY2guCj4gCj4+IDMpIEFkZGluZyBleHRyYSBpZGxlIGNvbW1hbmRzIGR1cmluZyByL3cg
cmVxdWVzdC4KPiAKPiBRdWVzdGlvbiBhYm91dCB0aGlzIGJlbG93LCBtaWdodCBhbHNvIGJlIGEg
cGF0Y2ggb24gaXRzIG93bj8KPiAKPj4gNCkgQWRkaW5nIGV4dHJhIE5BTkRfQ01EX1JFQUQwIG9u
IGVhY2ggcmVhZCByZXF1ZXN0Lgo+Pgo+PiBXaXRob3V0IHRoaXMgcGF0Y2ggZHJpdmVyIHdvcmtz
IHVuc3RhYmxlLCBmb3IgZXhhbXBsZSB0aGVyZSBhcmUgYSBsb3QKPj4gb2YgRUNDIGVycm9ycy4K
PiAKPiBJIGJlbGlldmUgYWxsIHRoZSBmaXhlcyBzaG91bGQgYmUgQ2MnZWQgdG8gc3RhYmxlLCBw
bGVhc2UgYWRkIGluIHlvdXIKPiBjb21taXRzOgo+IAo+IENjOiBzdGFibGVALi4uCj4gCgpBY2ss
IGFmdGVyIGV2ZXJ5dGhpbmcgd2lsbCBiZSBjbGVhciB3aXRoIHRoaXMgcGF0Y2ggOikKCj4+Cj4+
IEZpeGVzOiA4ZmFlODU2YzUzNTAgKCJtdGQ6IHJhd25hbmQ6IG1lc29uOiBhZGQgc3VwcG9ydCBm
b3IgQW1sb2dpYyBOQU5EIGZsYXNoIGNvbnRyb2xsZXIiKQo+PiBTdWdnZXN0ZWQtYnk6IExpYW5n
IFlhbmcgPGxpYW5nLnlhbmdAYW1sb2dpYy5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkg
S3Jhc25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+PiAtLS0KPj4gIGRyaXZlcnMvbXRk
L25hbmQvcmF3L21lc29uX25hbmQuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4gaW5kZXggMDc0ZTE0MjI1YzA2Li4yZjRk
OGM4NDE4NmIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQu
Ywo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4gQEAgLTM3LDcg
KzM3LDcgQEAKPj4gICNkZWZpbmUgTkZDX0NNRF9TQ1JBTUJMRVJfRU5BQkxFCUJJVCgxOSkKPj4g
ICNkZWZpbmUgTkZDX0NNRF9TQ1JBTUJMRVJfRElTQUJMRQkwCj4+ICAjZGVmaW5lIE5GQ19DTURf
U0hPUlRNT0RFX0RJU0FCTEUJMAo+PiAtI2RlZmluZSBORkNfQ01EX1JCX0lOVAkJQklUKDE0KQo+
PiArI2RlZmluZSBORkNfQ01EX1JCX0lOVCAoKDB4YiA8PCAxMCkgfCBCSVQoMTgpIHwgQklUKDE2
KSkKPj4gIAo+PiAgI2RlZmluZSBORkNfQ01EX0dFVF9TSVpFKHgpCSgoKHgpID4+IDIyKSAmIEdF
Tk1BU0soNCwgMCkpCj4+ICAKPj4gQEAgLTM5Miw3ICszOTIsNyBAQCBzdGF0aWMgdm9pZCBtZXNv
bl9uZmNfc2V0X2RhdGFfb29iKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4+ICAJfQo+PiAgfQo+
PiAgCj4+IC1zdGF0aWMgaW50IG1lc29uX25mY19xdWV1ZV9yYihzdHJ1Y3QgbWVzb25fbmZjICpu
ZmMsIGludCB0aW1lb3V0X21zKQo+PiArc3RhdGljIGludCBtZXNvbl9uZmNfcXVldWVfcmIoc3Ry
dWN0IG1lc29uX25mYyAqbmZjLCBpbnQgdGltZW91dF9tcywgaW50IGNtZF9yZWFkMCkKPj4gIHsK
Pj4gIAl1MzIgY21kLCBjZmc7Cj4+ICAJaW50IHJldCA9IDA7Cj4+IEBAIC00MDcsMTcgKzQwNywy
OSBAQCBzdGF0aWMgaW50IG1lc29uX25mY19xdWV1ZV9yYihzdHJ1Y3QgbWVzb25fbmZjICpuZmMs
IGludCB0aW1lb3V0X21zKQo+PiAgCj4+ICAJcmVpbml0X2NvbXBsZXRpb24oJm5mYy0+Y29tcGxl
dGlvbik7Cj4+ICAKPj4gKwljbWQgPSBuZmMtPnBhcmFtLmNoaXBfc2VsZWN0IHwgTkZDX0NNRF9D
TEUgfCBOQU5EX0NNRF9TVEFUVVM7Cj4+ICsJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5G
Q19SRUdfQ01EKTsKPj4gKwltZXNvbl9uZmNfY21kX2lkbGUobmZjLCA1KTsKPiAKPiBXaHkgNSBh
bmQgMiBiZWxvdz8gVGhleSBsb29rIGxpa2UgbWFnaWMgdmFsdWVzLiBJcyB0aGlzIHRvdGFsbHkK
PiBleHBlcmltZW50YWw/CgpATGlhbmcsIG1heSBiZSBjaGFuZ2UgaXQgdG8gZGVmaW5lcyA/Cgo+
IAo+PiArCj4+ICAJLyogdXNlIHRoZSBtYXggZXJhc2UgdGltZSBhcyB0aGUgbWF4aW11bSBjbG9j
ayBmb3Igd2FpdGluZyBSL0IgKi8KPj4gLQljbWQgPSBORkNfQ01EX1JCIHwgTkZDX0NNRF9SQl9J
TlQKPj4gLQkJfCBuZmMtPnBhcmFtLmNoaXBfc2VsZWN0IHwgbmZjLT50aW1pbmcudGJlcnNfbWF4
Owo+IAo+IFRoaXMgaXMgbm90IGRvY3VtZW50ZWQgaW4gdGhlIGNvbW1pdCBsb2csIGlzIGl0Pwo+
IAo+PiArCWNtZCA9IE5GQ19DTURfUkIgfCBORkNfQ01EX1JCX0lOVCB8IG5mYy0+dGltaW5nLnRi
ZXJzX21heDsKPj4gIAl3cml0ZWwoY21kLCBuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DTUQpOwo+
PiArCW1lc29uX25mY19jbWRfaWRsZShuZmMsIDIpOwo+PiAgCj4+ICAJcmV0ID0gd2FpdF9mb3Jf
Y29tcGxldGlvbl90aW1lb3V0KCZuZmMtPmNvbXBsZXRpb24sCj4+ICAJCQkJCSAgbXNlY3NfdG9f
amlmZmllcyh0aW1lb3V0X21zKSk7Cj4+ICAJaWYgKHJldCA9PSAwKQo+PiAtCQlyZXQgPSAtMTsK
Pj4gKwkJcmV0dXJuIC0xOwo+IAo+IFBsZWFzZSB1c2UgcmVhbCBlcnJvciBjb2Rlcywgc3VjaCBh
cyBFVElNRURPVVQuCgpBY2sKCj4gCj4+ICAKPj4gLQlyZXR1cm4gcmV0Owo+PiArCWlmICghY21k
X3JlYWQwKQo+PiArCQlyZXR1cm4gMDsKPj4gKwo+PiArCWNtZCA9IG5mYy0+cGFyYW0uY2hpcF9z
ZWxlY3QgfCBORkNfQ01EX0NMRSB8IE5BTkRfQ01EX1JFQUQwOwo+IAo+IFRoaXMgbG9va3MgcmVh
bGx5IHdyb25nLCBJIGRvbid0IGdldCB3aHkgeW91IHdvdWxkIG5lZWQgdG8gc2VuZCBhbgo+IGV4
cGVuc2l2ZSBSRUFEMCBjb21tYW5kLgoKVGhpcyBsb2dpYyB3YXMgc3VnZ2VzdGVkIGJ5IEBMaWFu
ZyBZYW5nIGhlcmUgdG8gZml4IHRoaXMgZHJpdmVyIChzdWdnZXN0ZWQgYXMgcGF0Y2gpOgpodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvODUzN2U3MzYtNDRhOC1kMTdiLTc5MjMtMjVk
NWJkNDA2ZGNjQHNiZXJkZXZpY2VzLnJ1L1QvI20wZGYwOWQyYWIyY2FjOTg0MzFmYjI2OGE0Y2Uz
YzAwZGM1YzdhNjllCkBMaWFuZywgY291bGQgWW91IHBsZWFzZSBnaXZlIHVzIG1vcmUgZGV0YWls
cz8KClRoYW5rcywgQXJzZW5peQoKPiAKPj4gKwl3cml0ZWwoY21kLCBuZmMtPnJlZ19iYXNlICsg
TkZDX1JFR19DTUQpOwo+PiArCW1lc29uX25mY19kcmFpbl9jbWQobmZjKTsKPj4gKwltZXNvbl9u
ZmNfd2FpdF9jbWRfZmluaXNoKG5mYywgQ01EX0ZJRk9fRU1QVFlfVElNRU9VVCk7Cj4+ICsKPj4g
KwlyZXR1cm4gMDsKPj4gIH0KPj4gIAo+PiAgc3RhdGljIHZvaWQgbWVzb25fbmZjX3NldF91c2Vy
X2J5dGUoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKm9vYl9idWYpCj4+IEBAIC02MjMsNyAr
NjM1LDcgQEAgc3RhdGljIGludCBtZXNvbl9uZmNfcndfY21kX3ByZXBhcmVfYW5kX2V4ZWN1dGUo
c3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPj4gIAlpZiAoaW4pIHsKPj4gIAkJbmZjLT5jbWRmaWZv
LnJ3LmNtZDEgPSBjcyB8IE5GQ19DTURfQ0xFIHwgTkFORF9DTURfUkVBRFNUQVJUOwo+PiAgCQl3
cml0ZWwobmZjLT5jbWRmaWZvLnJ3LmNtZDEsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7
Cj4+IC0JCW1lc29uX25mY19xdWV1ZV9yYihuZmMsIFBTRUNfVE9fTVNFQyhzZHItPnRSX21heCkp
Owo+PiArCQltZXNvbl9uZmNfcXVldWVfcmIobmZjLCBQU0VDX1RPX01TRUMoc2RyLT50Ul9tYXgp
LCAxKTsKPj4gIAl9IGVsc2Ugewo+PiAgCQltZXNvbl9uZmNfY21kX2lkbGUobmZjLCBuZmMtPnRp
bWluZy50YWRsKTsKPj4gIAl9Cj4+IEBAIC02NjksNyArNjgxLDcgQEAgc3RhdGljIGludCBtZXNv
bl9uZmNfd3JpdGVfcGFnZV9zdWIoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPj4gIAo+PiAgCWNt
ZCA9IG5mYy0+cGFyYW0uY2hpcF9zZWxlY3QgfCBORkNfQ01EX0NMRSB8IE5BTkRfQ01EX1BBR0VQ
Uk9HOwo+PiAgCXdyaXRlbChjbWQsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7Cj4+IC0J
bWVzb25fbmZjX3F1ZXVlX3JiKG5mYywgUFNFQ19UT19NU0VDKHNkci0+dFBST0dfbWF4KSk7Cj4+
ICsJbWVzb25fbmZjX3F1ZXVlX3JiKG5mYywgUFNFQ19UT19NU0VDKHNkci0+dFBST0dfbWF4KSwg
MCk7Cj4+ICAKPj4gIAltZXNvbl9uZmNfZG1hX2J1ZmZlcl9yZWxlYXNlKG5hbmQsIGRhdGFfbGVu
LCBpbmZvX2xlbiwgRE1BX1RPX0RFVklDRSk7Cj4+ICAKPj4gQEAgLTk1Miw3ICs5NjQsNyBAQCBz
dGF0aWMgaW50IG1lc29uX25mY19leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4+ICAJ
CQlicmVhazsKPj4gIAo+PiAgCQljYXNlIE5BTkRfT1BfV0FJVFJEWV9JTlNUUjoKPj4gLQkJCW1l
c29uX25mY19xdWV1ZV9yYihuZmMsIGluc3RyLT5jdHgud2FpdHJkeS50aW1lb3V0X21zKTsKPj4g
KwkJCW1lc29uX25mY19xdWV1ZV9yYihuZmMsIGluc3RyLT5jdHgud2FpdHJkeS50aW1lb3V0X21z
LCAxKTsKPj4gIAkJCWlmIChpbnN0ci0+ZGVsYXlfbnMpCj4+ICAJCQkJbWVzb25fbmZjX2NtZF9p
ZGxlKG5mYywgZGVsYXlfaWRsZSk7Cj4+ICAJCQlicmVhazsKPiAKPiAKPiBUaGFua3MsCj4gTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
