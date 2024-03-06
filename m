Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D04C5475B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2024 08:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFoJDLZdteJn2ibD+OmJpzR11nLIM+PjdbZRhbNK/qs=; b=OS3ogNXDZIE8yG
	fEG+kZfm7kjQPMqKmQVUIbq19pznxUQFOZIi2L/y3b2YKBoucZL1xy5oTFG0i9xOHgzSDe9ZkX2mk
	k/U/joQwWwAv7XECF3j+4fo4D29vZ7te1hpxyK1nFWIug6KLBiO1hSxMl14bwzbDCYCyUjXEUTfRg
	aE5MtIKSqZoqlje79bV6twJ7yEuRHEBxLb1Pm84rlT/vPQBtWWKyg5Aah7OkpjFSHpGqv+2oD1c2h
	0bUmLbHv4bNlm2I0Fq61Cl0VODxW5wNSVXw7FNYwHA8caoUPV9qloYRsUSxcU/AlDBwmkR24PqsY4
	YcPyENtLQXdKCZcTMljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmJb-0000000GoET-1YYb;
	Wed, 06 Mar 2024 08:07:51 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmJW-0000000GoDf-3e9Y
	for linux-mtd@lists.infradead.org;
	Wed, 06 Mar 2024 08:07:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88B001BF203;
	Wed,  6 Mar 2024 08:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709712461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kHg4bTL7dYbp26FFw88j9BBPy3JhM3fqgWkSx+1pe5o=;
	b=XgLGesxX3iEkgWQwgjoFYI5SQrXBJs3gHGST3ALKmV/1WPlkTnr7TUGZO/oZea4pE+cx8y
	1fHoDu7fakET5VJWOAi56ayCmTPLtJtxfSBc4izoyN5Hdx1t1Ixxs+7oYdArmgKiiq/npB
	IbZndQ4LWhkQ9QNjFexWBrRgO6BzgIVaQc/DjQ6QH6zyMDMQXKeOGAm50oC8mnNXaFXk3s
	9W+fAwqdjEOt4x7i8Q6zSgksTqBJ1JfH3m/9uRhc/amCi/pGaLrCijwqX9jPb6kpRSZMLv
	yAflGzj2/k6/rJC6RCe5Y0BYihinJ6VIl1h31v71Oz0FlrBysL2KVp+J9IYN3w==
Date: Wed, 6 Mar 2024 09:07:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: KR Kim <kr.kim@skyhighmemory.com>
Cc: richard@nod.at, vigneshr@ti.com, mmkurbanov@salutedevices.com,
 ddrokosov@sberdevices.ru, gch981213@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 moh.sardi@skyhighmemory.com, changsub.shim@skyhighmemory.com
Subject: Re: [PATCH 2/2] SPI Nand Patch code for SkyHigh Momory
Message-ID: <20240306090739.31911391@xps-13>
In-Reply-To: <20240306041532.16985-1-kr.kim@skyhighmemory.com>
References: <20240306041532.16985-1-kr.kim@skyhighmemory.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_000747_273088_CAA72857 
X-CRM114-Status: GOOD (  17.70  )
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

SGVsbG8sCgpUaGUgc3ViamVjdCB0YWcgaXMgd3JvbmcgKHYyKSwgdGhlIHByZWZpeCBpcyB3cm9u
ZywgeW91IGFyZSBtaXNzaW5nCnRoZSBjb21taXQgbWVzc2FnZSwgdGhlcmUgaXMgbm8gU2lnbmVk
LW9mZi1ieSwgYW5kIHlvdSBzZW50IGEgZGlmZiB3aXRoCnlvdXIgdjEgcmF0aGVyIHRoYW4gYSBm
dWxsIHBhdGNoLgoKWW91IHNob3VsZCBwcm9iYWJseSB0cnkgc2VuZGluZyB0aGVzZSB1c2luZyAt
LWRyeS1ydW4gYW5kCi0tc3VwcHJlc3MtY2M9YWxsIHdoaWxlIHlvdSBhcmUgd29ya2luZyBvbiB5
b3VyIHNlcmllcyA6KQoKVGhhbmtzLApNaXF1w6hsCgprci5raW1Ac2t5aGlnaG1lbW9yeS5jb20g
d3JvdGUgb24gV2VkLCAgNiBNYXIgMjAyNCAxMzoxNTozMiArMDkwMDoKCj4gLS0tCj4gIGRyaXZl
cnMvbXRkL25hbmQvc3BpL01ha2VmaWxlICB8ICAyICstCj4gIGRyaXZlcnMvbXRkL25hbmQvc3Bp
L3NreWhpZ2guYyB8IDU3ICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvTWFrZWZpbGUgYi9kcml2ZXJzL210ZC9uYW5k
L3NwaS9NYWtlZmlsZQo+IGluZGV4IDQ4YjQyOWQ5MDQ2MC4uMWU2MWFiMjE4OTNhIDEwMDc1NQo+
IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9zcGkvTWFrZWZpbGUKPiBAQCAtMSw0ICsxLDQgQEAKPiAgIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMAo+ICBzcGluYW5kLW9ianMgOj0gY29yZS5vIGFsbGlhbmNlbWVtb3J5
Lm8gYXRvLm8gZXNtdC5vIGZvcmVzZWUubyBnaWdhZGV2aWNlLm8gbWFjcm9uaXgubwo+IC1zcGlu
YW5kLW9ianMgKz0gbWljcm9uLm8gcGFyYWdvbi5vIHRvc2hpYmEubyB3aW5ib25kLm8geHR4Lm8g
c2t5aGlnaC5vCj4gK3NwaW5hbmQtb2JqcyArPSBtaWNyb24ubyBwYXJhZ29uLm8gc2t5aGlnaC5v
IHRvc2hpYmEubyB3aW5ib25kLm8geHR4Lm8KPiAgb2JqLSQoQ09ORklHX01URF9TUElfTkFORCkg
Kz0gc3BpbmFuZC5vCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL3NreWhpZ2gu
YyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL3NreWhpZ2guYwo+IGluZGV4IDcxZGU0ZmEzNDQwNi4u
ZGQzNDg4NDkyMTZkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL3NreWhpZ2gu
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL3NreWhpZ2guYwo+IEBAIC0xMiw4ICsxMiw4
IEBACj4gICNkZWZpbmUgU1BJTkFORF9NRlJfU0tZSElHSAkJMHgwMQo+ICAKPiAgI2RlZmluZSBT
S1lISUdIX1NUQVRVU19FQ0NfMVRPMl9CSVRGTElQUwkoMSA8PCA0KQo+IC0jZGVmaW5lIFNLWUhJ
R0hfU1RBVFVTX0VDQ18zVE80X0JJVEZMSVBTCSgyIDw8IDQpCj4gLSNkZWZpbmUgU0tZSElHSF9T
VEFUVVNfRUNDXzVUTzZfQklURkxJUFMJKDMgPDwgNCkKPiArI2RlZmluZSBTS1lISUdIX1NUQVRV
U19FQ0NfM1RPNl9CSVRGTElQUwkoMiA8PCA0KQo+ICsjZGVmaW5lIFNLWUhJR0hfU1RBVFVTX0VD
Q19VTkNPUl9FUlJPUiAgCSgzIDw8IDQpCj4gIAo+ICAjZGVmaW5lIFNLWUhJR0hfQ09ORklHX1BS
T1RFQ1RfRU4JQklUKDEpCj4gIAo+IEBAIC02Miw0OSArNjIsMTUgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBtdGRfb29ibGF5b3V0X29wcyBza3loaWdoX3NwaW5hbmRfb29ibGF5b3V0ID0gewo+ICAJ
LmZyZWUgPSBza3loaWdoX3NwaW5hbmRfb29ibGF5b3V0X2ZyZWUsCj4gIH07Cj4gIAo+IC0jaWYg
MAo+IC1ib29sIHNreWhpZ2hfc3BpbmFuZF9pc2JhZChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNw
aW5hbmQsCj4gLQkJCSAgIGNvbnN0IHN0cnVjdCBuYW5kX3BvcyAqcG9zKQo+IC17Cj4gLQl1OCBt
YXJrZXI7Cj4gLQlzdHJ1Y3QgbmFuZF9wYWdlX2lvX3JlcSByZXEgPSB7Cj4gLQkJLnBvcyA9ICpw
b3MsCj4gLQkJLm9vYmxlbiA9IDEsCj4gLQkJLm9vYm9mZnMgPSAwLAo+IC0JCS5vb2JidWYuaW4g
PSAmbWFya2VyLAo+IC0JCS5tb2RlID0gTVREX09QU19SQVcsCj4gLQl9Owo+IC0KPiAtCXJlcS5w
b3MucGFnZSA9IDA7Cj4gLQlzcGluYW5kX3JlYWRfcGFnZShzcGluYW5kLCAmcmVxKTsKPiAtCWlm
IChtYXJrZXIgIT0gMHhmZikKPiAtCQlyZXR1cm4gdHJ1ZTsKPiAtCj4gLSNpZiAwCj4gLQlyZXEu
cG9zLnBhZ2UgPSAxOwo+IC0Jc3BpbmFuZF9yZWFkX3BhZ2Uoc3BpbmFuZCwgJnJlcSk7Cj4gLQlp
ZiAobWFya2VyICE9IDB4ZmYpCj4gLQkJcmV0dXJuIHRydWU7Cj4gLQo+IC0JcmVxLnBvcy5wYWdl
ID0gNjM7Cj4gLQlzcGluYW5kX3JlYWRfcGFnZShzcGluYW5kLCAmcmVxKTsKPiAtCWlmIChtYXJr
ZXIgIT0gMHhmZikKPiAtCQlyZXR1cm4gdHJ1ZTsKPiAtI2VuZGlmCj4gLQo+IC0JcmV0dXJuIGZh
bHNlOwo+IC19Cj4gLSNlbmRpZgo+IC0KPiAgc3RhdGljIGludCBza3loaWdoX3NwaW5hbmRfZWNj
X2dldF9zdGF0dXMoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ICAJCQkJICB1OCBz
dGF0dXMpCj4gIHsKPiAgCS8qIFNITQo+IC0JMDAgOiBObyBiaXQtZmxpcAo+IC0JMDEgOiAxLTIg
ZXJyb3JzIGNvcnJlY3RlZAo+IC0JMTAgOiAzLTYgZXJyb3JzIGNvcnJlY3RlZCAgICAgICAgIAo+
IC0JMTEgOiB1bmNvcnJlY3RhYmxlCj4gLQkqLwo+ICsJICogMDAgOiBObyBiaXQtZmxpcAo+ICsJ
ICogMDEgOiAxLTIgZXJyb3JzIGNvcnJlY3RlZAo+ICsJICogMTAgOiAzLTYgZXJyb3JzIGNvcnJl
Y3RlZCAgICAgICAgIAo+ICsJICogMTEgOiB1bmNvcnJlY3RhYmxlCj4gKwkgKi8KPiAgCj4gIAlz
d2l0Y2ggKHN0YXR1cyAmIFNUQVRVU19FQ0NfTUFTSykgewo+ICAJY2FzZSBTVEFUVVNfRUNDX05P
X0JJVEZMSVBTOgo+IEBAIC0xMTMsMTIgKzc5LDEwIEBAIHN0YXRpYyBpbnQgc2t5aGlnaF9zcGlu
YW5kX2VjY19nZXRfc3RhdHVzKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiAgCWNh
c2UgU0tZSElHSF9TVEFUVVNfRUNDXzFUTzJfQklURkxJUFM6Cj4gIAkJcmV0dXJuIDI7Cj4gIAo+
IC0JLyogY2hhbmdlIGZyb20gNCB0byA2ICovCj4gLQljYXNlIFNLWUhJR0hfU1RBVFVTX0VDQ18z
VE80X0JJVEZMSVBTOgo+ICsgCWNhc2UgU0tZSElHSF9TVEFUVVNfRUNDXzNUTzZfQklURkxJUFM6
Cj4gIAkJcmV0dXJuIDY7IAo+ICAKPiAtCS8qIHVuY29ycmVjdGFibGUgZm9yICcxMScgKi8KPiAt
CWNhc2UgU0tZSElHSF9TVEFUVVNfRUNDXzVUTzZfQklURkxJUFM6Cj4gKyAJY2FzZSBTS1lISUdI
X1NUQVRVU19FQ0NfVU5DT1JfRVJST1I6Cj4gIAkJcmV0dXJuIC1FQkFETVNHOzsKPiAgCj4gIAlk
ZWZhdWx0Ogo+IEBAIC0xNzksOCArMTQzLDcgQEAgc3RhdGljIGludCBza3loaWdoX3NwaW5hbmRf
aW5pdChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4gIAo+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IHNwaW5hbmRfbWFudWZhY3R1cmVyX29wcyBza3loaWdoX3NwaW5hbmRfbWFudWZfb3Bz
ID0gewo+ICAJLmluaXQgPSBza3loaWdoX3NwaW5hbmRfaW5pdCwKPiAtLyoJLmlzYmFkID0gc2t5
aGlnaF9zcGluYW5kX2lzYmFkLCovCj4gLX07Cj4gKyB9Owo+ICAKPiAgY29uc3Qgc3RydWN0IHNw
aW5hbmRfbWFudWZhY3R1cmVyIHNreWhpZ2hfc3BpbmFuZF9tYW51ZmFjdHVyZXIgPSB7Cj4gIAku
aWQgPSBTUElOQU5EX01GUl9TS1lISUdILAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
