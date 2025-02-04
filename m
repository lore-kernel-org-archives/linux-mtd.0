Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B7CC02193
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 20:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ig2AQE6LTrMZhtjPhuG3yn/wSMP2bFTUEY7zbPNPjmU=; b=sHuWgfH0Vb/8cl
	O1kON4UPbmx95XNgCDe9iUXV6BP8/ndgYLOzds5DtoFO9YEyQJsRfxSB3RRguNJ7pXjHfkPdKKDIV
	+wqwsKFtID6rj+KZqQUgvCw3n3xLML2g9fLyNuqX7g3LzUyqf3V2tG4fT7+S9M7Wnkci/jZjkZjX1
	ugt5tW9wwMmRJJo7ptkUnOJRR9Gi3uOZGET3XIMdmoAMLH9VkOCIW0zfs2bF01cCj7E7bFHvWi9Xp
	iRnXN8P3PVFCz7yOa1v5Bs09wiNGMd6L2PGitHeLAVCZqqD5YucOtxsrSXbaiPuGNRJc3+nmMxNaz
	IE6xZmC0awh5BaeVyslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfPss-00000001XcF-0Wl2;
	Tue, 04 Feb 2025 20:51:02 +0000
Received: from smtp-80.smtpout.orange.fr ([80.12.242.80] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfPso-00000001XbU-3mdu
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 20:51:00 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id fPsbtpZU4inFifPsfthBqw; Tue, 04 Feb 2025 21:50:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738702250;
	bh=cEJrjrt2iVAFpYW/0YZX/gP7F3sDEkngN20jzc4pxzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Qe4uvLXe/cappcqsmC5mjcdHulH1WxgPsw5mlTZSD/zfbLsys0bzGC++t2M1c7mDx
	 LuDFpqT1XZnALmaGfAeYLbc2W54DayF/x9SCy/yzHI/Tlos79eHLIUmM/JmVehzjrF
	 JTex7vKvjBN9TvgRfp82uRVoZdb55iBZwJM80cxZFpVJsQ5+99oBYcN/yEqmvROpit
	 bE0CrkRZ8EQtwAq8rirHrkrwnM0VvUMkItuSoJXCBx95vb2xFAfqO/+Mi/F80lLpcu
	 SNTY7s5s3E5MG9booYpPPLSKEPy8Jcli/GoVhIDmoygRhbTw4Zweg+6LLeHp4f1u4D
	 XplwbKpPx2H4w==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 04 Feb 2025 21:50:50 +0100
X-ME-IP: 90.11.132.44
Message-ID: <f9a35a4f-b774-4480-910a-cdcf926df41b@wanadoo.fr>
Date: Tue, 4 Feb 2025 21:50:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: Add check and kfree() for kcalloc()
To: Jiri Slaby <jirislaby@kernel.org>,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: gmpy.liaowx@gmail.com, kees@kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, stable@vger.kernel.org
References: <30ad77af-4a7b-4a15-9c0b-b0c70d9e1643@wanadoo.fr>
 <20250204023323.14213-1-jiashengjiangcool@gmail.com>
 <e41d9378-e5e5-478d-bead-aa50a9f79d4d@wanadoo.fr>
 <48ad8f05-a90b-499d-9e73-8e5ff032824a@kernel.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <48ad8f05-a90b-499d-9e73-8e5ff032824a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_125059_349346_ECBB31A0 
X-CRM114-Status: GOOD (  16.36  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TGUgMDQvMDIvMjAyNSDDoCAwNzozNiwgSmlyaSBTbGFieSBhIMOpY3JpdMKgOgo+IE9uIDA0LiAw
Mi4gMjUsIDc6MTcsIENocmlzdG9waGUgSkFJTExFVCB3cm90ZToKPj4gTGUgMDQvMDIvMjAyNSDD
oCAwMzozMywgSmlhc2hlbmcgSmlhbmcgYSDDqWNyaXTCoDoKPj4+IEFkZCBhIGNoZWNrIGZvciBr
Y2FsbG9jKCkgdG8gZW5zdXJlIHN1Y2Nlc3NmdWwgYWxsb2NhdGlvbi4KPj4+IE1vcmVvdmVyLCBh
ZGQga2ZyZWUoKSBpbiB0aGUgZXJyb3ItaGFuZGxpbmcgcGF0aCB0byBwcmV2ZW50IG1lbW9yeSAK
Pj4+IGxlYWtzLgo+Pj4KPj4+IEZpeGVzOiA3OGMwODI0N2I5ZDMgKCJtdGQ6IFN1cHBvcnQga21z
ZyBkdW1wZXIgYmFzZWQgb24gcHN0b3JlL2JsayIpCj4+PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmc+ICMgdjUuMTArCj4+PiBTaWduZWQtb2ZmLWJ5OiBKaWFzaGVuZyBKaWFuZyA8amlhc2hl
bmdqaWFuZ2Nvb2xAZ21haWwuY29tPgo+Pj4gLS0tCj4+PiBDaGFuZ2Vsb2c6Cj4+Pgo+Pj4gdjEg
LT4gdjI6Cj4+Pgo+Pj4gMS4gUmVtb3ZlIHJlZHVuZGFudCBsb2dnaW5nLgo+Pj4gMi4gQWRkIGtm
cmVlKCkgaW4gdGhlIGVycm9yLWhhbmRsaW5nIHBhdGguCj4+PiAtLS0KPj4+IMKgIGRyaXZlcnMv
bXRkL210ZHBzdG9yZS5jIHwgMTkgKysrKysrKysrKysrKysrKysrLQo+Pj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbXRkcHN0b3JlLmMgYi9kcml2ZXJzL210ZC9tdGRwc3RvcmUuYwo+Pj4g
aW5kZXggN2FjOGFjOTAxMzA2Li4yZDhlMzMwZGQyMTUgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJz
L210ZC9tdGRwc3RvcmUuYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQvbXRkcHN0b3JlLmMKPj4+IEBA
IC00MTgsMTAgKzQxOCwxNyBAQCBzdGF0aWMgdm9pZCBtdGRwc3RvcmVfbm90aWZ5X2FkZChzdHJ1
Y3QgCj4+PiBtdGRfaW5mbyAqbXRkKQo+Pj4gwqDCoMKgwqDCoCBsb25nY250ID0gQklUU19UT19M
T05HUyhkaXZfdTY0KG10ZC0+c2l6ZSwgaW5mby0+a21zZ19zaXplKSk7Cj4+PiDCoMKgwqDCoMKg
IGN4dC0+cm1tYXAgPSBrY2FsbG9jKGxvbmdjbnQsIHNpemVvZihsb25nKSwgR0ZQX0tFUk5FTCk7
Cj4+PiArwqDCoMKgIGlmICghY3h0LT5ybW1hcCkKPj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVu
ZDsKPj4KPj4gTml0cGljazogQ291bGQgYmUgYSBkaXJlY3QgcmV0dXJuLgo+Pgo+Pj4gKwo+Pj4g
wqDCoMKgwqDCoCBjeHQtPnVzZWRtYXAgPSBrY2FsbG9jKGxvbmdjbnQsIHNpemVvZihsb25nKSwg
R0ZQX0tFUk5FTCk7Cj4+PiArwqDCoMKgIGlmICghY3h0LT51c2VkbWFwKQo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGdvdG8gZnJlZV9ybW1hcDsKPj4+IMKgwqDCoMKgwqAgbG9uZ2NudCA9IEJJVFNfVE9f
TE9OR1MoZGl2X3U2NChtdGQtPnNpemUsIG10ZC0+ZXJhc2VzaXplKSk7Cj4+PiDCoMKgwqDCoMKg
IGN4dC0+YmFkbWFwID0ga2NhbGxvYyhsb25nY250LCBzaXplb2YobG9uZyksIEdGUF9LRVJORUwp
Owo+Pj4gK8KgwqDCoCBpZiAoIWN4dC0+YmFkbWFwKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8g
ZnJlZV91c2VkbWFwOwo+Pj4gwqDCoMKgwqDCoCAvKiBqdXN0IHN1cHBvcnQgZG1lc2cgcmlnaHQg
bm93ICovCj4+PiDCoMKgwqDCoMKgIGN4dC0+ZGV2LmZsYWdzID0gUFNUT1JFX0ZMQUdTX0RNRVNH
Owo+Pj4gQEAgLTQzNSwxMCArNDQyLDIwIEBAIHN0YXRpYyB2b2lkIG10ZHBzdG9yZV9ub3RpZnlf
YWRkKHN0cnVjdCAKPj4+IG10ZF9pbmZvICptdGQpCj4+PiDCoMKgwqDCoMKgIGlmIChyZXQpIHsK
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKCZtdGQtPmRldiwgIm10ZCVkIHJlZ2lzdGVy
IHRvIHBzYmxrIGZhaWxlZFxuIiwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbXRkLT5pbmRleCk7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGdvdG8gZnJlZV9iYWRtYXA7Cj4+PiDCoMKgwqDCoMKgIH0KPj4+IMKgwqDCoMKgwqAg
Y3h0LT5tdGQgPSBtdGQ7Cj4+PiDCoMKgwqDCoMKgIGRldl9pbmZvKCZtdGQtPmRldiwgIkF0dGFj
aGVkIHRvIE1URCBkZXZpY2UgJWRcbiIsIG10ZC0+aW5kZXgpOwo+Pj4gK8KgwqDCoCBnb3RvIGVu
ZDsKPj4KPj4gTWF0ZXIgb2YgdGFzdGUsIGJ1dCBJIHRoaW5rIHRoYXQgaGF2aW5nIGFuIGV4cGxp
Y2l0IHJldHVybiBoZXJlIHdvdWxkIAo+PiBiZSBjbGVhcmVyIHRoYXQgYSBnb3RvIGVuZDsKPiAK
PiBZZXMsIGRyb3AgdGhlIHdob2xlIGVuZC4KPiAKPj4+ICtmcmVlX2JhZG1hcDoKPj4+ICvCoMKg
wqAga2ZyZWUoY3h0LT5iYWRtYXApOwo+Pj4gK2ZyZWVfdXNlZG1hcDoKPj4+ICvCoMKgwqAga2Zy
ZWUoY3h0LT51c2VkbWFwKTsKPj4+ICtmcmVlX3JtbWFwOgo+Pj4gK8KgwqDCoCBrZnJlZShjeHQt
PnJtbWFwKTsKPj4KPj4gSSB0aGluayB0aGF0IGluIGFsbCB0aGVzZSBwYXRocywgeW91IHNob3Vs
ZCBhbHNvIGhhdmUKPj4gwqDCoMKgwqDCoGN4dC0+WFhYbWFwID0gTlVMTDsKPj4gYWZ0ZXIgdGhl
IGtmcmVlKCkuCj4+Cj4+IG90aGVyd2lzZSB3aGVuIG10ZHBzdG9yZV9ub3RpZnlfcmVtb3ZlKCkg
aXMgY2FsbGVkLCB5b3UgY291bGQgaGF2ZSBhIAo+PiBkb3VibGUgZnJlZS4KPiAKPiBSaWdodCwg
YW5kIHRoaXMgaXMgYWxyZWFkeSBhIHByb2JsZW0gZm9yIGZhaWxpbmcgCj4gcmVnaXN0ZXJfcHN0
b3JlX2RldmljZSgpIGluIF9hZGQoKSAtLSB0aGVyZSBpcyB1bmNvbmRpdGlvbmFsIAo+IHVucmVn
aXN0ZXJfcHN0b3JlX2RldmljZSgpIGluIF9yZW1vdmUoKS4gU2hvdWxkIF9yZW1vdmUoKSBjaGVj
ayBjeHQtPm10ZCAKPiBmaXJzdD8KCk5vdCBzdXJlIGl0IGlzIG5lZWRlZC4KSUlVQywgWzFdIHdv
dWxkIG5vdCBtYXRjaCBpbiB0aGlzIGNhc2UsIGJlY2F1c2UgWzJdIHdvdWxkIG5vdCBoYXZlIGJl
ZW4gCmV4ZWN1dGVkLiBBZ3JlZWQ/CgpDSgoKClsxXTogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjYuMTMvc291cmNlL2ZzL3BzdG9yZS9ibGsuYyNMMTY5ClsyXTogaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTMvc291cmNlL2ZzL3BzdG9yZS9ibGsuYyNMMTQx
Cgo+IAo+IHRoYW5rcywKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
