Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3E7E8FDDB
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Oct 2023 08:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HbWDAihVwOvliMsaiZlTdz3lWuKeNQXc2i0WP53narY=; b=aVcH/LF/omM5Qj
	gRzenxnOt9vnEyGOfhRn04E1OhSLn6NbfG7V9dPy7/FW3EU5yyN6OS8keEeJaU6hLOY7t/b8hDIs6
	jO+lrRg3PM9uYOsWGEO4OJkd1shT4loCdBrfqTu3D9rJur7zcQ2NnnNrrWphRcGoAZH4TyKnuio1k
	kOLDQTsHgzpfkVkVRmHnsO2T74sgF0bZzAKl+aJcKloTqKsfin641yP+j4yJijIa+OeShFy7s+PLd
	+QiV4AtsvNc9tecsjXtU7s3i9ESEIzOWLdBXtFiExrARHc3p7lPLGhpDZcFQlF2RV5myq+0WKFmTC
	Z1Tm52obD3QO27JnSwcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxWB-00GugQ-37;
	Wed, 04 Oct 2023 08:46:07 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxW6-00GudX-1P
	for linux-mtd@lists.infradead.org;
	Wed, 04 Oct 2023 08:46:06 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so3215510a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 04 Oct 2023 01:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696409160; x=1697013960; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iwt6yecZwQb9RsRqs87uClcaB8jIHdaxjvckvEuQJXo=;
        b=F540Ii+O7OsqaVV7V6JNC/ombuhJQ6ik8dWIMvpTuR4RN8quFRYr7/tabIWckmS5t+
         Jdnzb3TYNaQdMy3qIWZ1/wPjN/uVSmqFpGeTuAV0boTR4OihliPO3uX4/tHnuj8+gWUy
         SUIPq6nsvO0J/FESEPtcvylnLki9bF/oww7KXkthv7MWoqCE2aWnq51ldFpDZmfiNpE/
         IMlslCY1wp7zRhtg8PxBKxpSDl9iP3mvc2BHD2LtdDIed50jVzHQdyV6fQr3Yxag3sO+
         8plNWb45lRz1wonaww3/uhhotrBsrRcHRenxbIyt1kIrz6Uw/N38lsexGO2PhD5exW87
         1QFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696409160; x=1697013960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iwt6yecZwQb9RsRqs87uClcaB8jIHdaxjvckvEuQJXo=;
        b=oYyOu8Djrb83WbQpUV5NyVV5oC1YP2FLEayTOYd5mD4svV32PJiAzzVNInsVtgedQx
         nKXjg7CtrAvZQ9qggYk4HQ8B4Ad7jl6y36C/fO/I8g7CYkNaFl2P5N16HqJ2xT+W/3pR
         66hiSjbLKo52RtL23KNKsSxbYkNp0qkxsmivYj2nmJMxCvQj3khC0PK17Y4eDcKAFFcX
         jEqNXPb8X1TsL0SURLwQR3BrbEbFN9eayJ5B5ZiDZVxg5JozY3GT5W4ke7842S3rN9Gi
         3xT4e72xKG9nLgYG50InX71lF0xE4Hc0eTImoYP03J0DF+PHXJwixXCJPUAq/mes6kXz
         mf3g==
X-Gm-Message-State: AOJu0YyCEkkdLdBtsIhAaRrLJ2Vri6XndGFH5oHQomOyDBnC4mN7zpYd
	rbys1pM3qXsrcsD2TZOoRRc=
X-Google-Smtp-Source: AGHT+IH1fMjq62Gk6rhHc+iucHf6asMon83lNrjM18EM+difkExI/cC19QvT1Zq7gIYruQC6uZvYFA==
X-Received: by 2002:aa7:db46:0:b0:532:ac24:3081 with SMTP id n6-20020aa7db46000000b00532ac243081mr1398036edt.30.1696409160139;
        Wed, 04 Oct 2023 01:46:00 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id i18-20020aa7dd12000000b0052889d090bfsm2082065edv.79.2023.10.04.01.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 01:45:59 -0700 (PDT)
Message-ID: <691f908e-37ed-4f3a-8c7f-e9615819d3db@gmail.com>
Date: Wed, 4 Oct 2023 10:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "nvmem: add new config option"
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Alban Bedel
 <albeu@free.fr>, Christian Marangi <ansuelsmth@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20230718084804.20139-1-zajec5@gmail.com>
 <ba3c419a-6511-480a-b5f2-6c418f9c02e7@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <ba3c419a-6511-480a-b5f2-6c418f9c02e7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_014602_481829_9577FBBD 
X-CRM114-Status: GOOD (  19.49  )
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

U3JpbmksCgpPbiAyNi4wOC4yMDIzIDIyOjE1LCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gT24g
MTguMDcuMjAyMyAxMDo0OCwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+PiBGcm9tOiBSYWZhxYIg
TWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+Cj4+IFRoaXMgcmV2ZXJ0cyBjb21taXQgNTE3
ZjE0ZDljZjM1MzNkNWFiNGZkZWQxOTVhYjZmODBhOTJlMzc4Zi4KPj4KPj4gSXQgc2VlbXMgdGhh
dCAibm9fb2Zfbm9kZSIgY29uZmlnIG9wdGlvbiB3YXMgYWRkZWQgdG8gaGVscCBtdGQncyBjYXNl
Lgo+Pgo+PiBEVCBub2RlcyBvZiBNVEQgcGFydGl0aW9ucyAodGhhdCBhcmUgYWxzbyBOVk1FTSBk
ZXZpY2VzKSBtYXkgY29udGFpbgo+PiBzdWJub2RlcyB0aGF0IFNIT1VMRCBOT1QgYmUgdHJlYXRl
ZCBhcyBOVk1FTSBmaXhlZCBjZWxscy4gVG8gcHJldmVudAo+PiBOVk1FTSBjb3JlIGNvZGUgZnJv
bSBwYXJzaW5nIHRoZW0gIm5vX29mX25vZGUiIHdhcyBzZXQgdG8gdHJ1ZSBhbmQgdGhhdAo+PiBt
YWRlIGZvcl9lYWNoX2NoaWxkX29mX25vZGUoKSBpbiBOVk1FTSBhIG5vLW9wLgo+Pgo+PiBXaXRo
IHRoZSBpbnRyb2R1Y3Rpb24gb2YgImFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMiIGNvbmZpZyBv
cHRpb24KPj4gdGhpbmdzIGdvdCBtb3JlIGV4cGxpY2l0LiBNVEQgc3Vic3lzdGVtIHNpbXBseSB0
ZWxscyBOVk1FTSB3aGVuIHRvIGxvb2sKPj4gZm9yIGZpeGVkIGNlbGxzIGFuZCB0aGVyZSBpcyBu
byBuZWVkIHRvIGhhY2sgIm9mX25vZGUiIHBvaW50ZXIgYW55bW9yZS4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+PiAtLS0KPj4gSW1wb3J0
YW50OiB0aGlzIGlzIGJhc2VkIG9uIHRvcCBvZiB0aGUKPj4gW1BBVENIIFY0XSBudm1lbTogYWRk
IGV4cGxpY2l0IGNvbmZpZyBvcHRpb24gdG8gcmVhZCBvbGQgc3ludGF4IGZpeGVkIE9GIGNlbGxz
Cj4gCj4gSSBzZWUgeW91IHNraXBwZWQgdGhvc2UgdHdvIHBhdGNoZXMgZm9yIDYuNi4KPiAKPiBD
YW4geW91IHF1ZXVlIHRoZW0gZm9yIDYuNywgcGxlYXNlPwoKRGlkIHlvdSBoYXZlIGEgY2hhbmNl
IHRvIGxvb2sgYXQgdGhpcyBvbmU/Cgo+PiAtLS0KPj4gwqAgZHJpdmVycy9tdGQvbXRkY29yZS5j
wqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGRyaXZlcnMvbnZtZW0vY29yZS5jwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCAyICstCj4+IMKgIGluY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIu
aCB8IDIgLS0KPj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBiL2RyaXZlcnMv
bXRkL210ZGNvcmUuYwo+PiBpbmRleCA5ZGI4ZDc4NTM2MzkuLjNkNzgxZmZiOGMzMiAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL210ZGNv
cmUuYwo+PiBAQCAtNTU0LDcgKzU1NCw2IEBAIHN0YXRpYyBpbnQgbXRkX252bWVtX2FkZChzdHJ1
Y3QgbXRkX2luZm8gKm10ZCkKPj4gwqDCoMKgwqDCoCBjb25maWcucmVhZF9vbmx5ID0gdHJ1ZTsK
Pj4gwqDCoMKgwqDCoCBjb25maWcucm9vdF9vbmx5ID0gdHJ1ZTsKPj4gwqDCoMKgwqDCoCBjb25m
aWcuaWdub3JlX3dwID0gdHJ1ZTsKPj4gLcKgwqDCoCBjb25maWcubm9fb2Zfbm9kZSA9ICFvZl9k
ZXZpY2VfaXNfY29tcGF0aWJsZShub2RlLCAibnZtZW0tY2VsbHMiKTsKPj4gwqDCoMKgwqDCoCBj
b25maWcucHJpdiA9IG10ZDsKPj4gwqDCoMKgwqDCoCBtdGQtPm52bWVtID0gbnZtZW1fcmVnaXN0
ZXIoJmNvbmZpZyk7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL252bWVtL2NvcmUuYyBiL2RyaXZl
cnMvbnZtZW0vY29yZS5jCj4+IGluZGV4IDU4ZDg5MTllNjY4Mi4uYTBjOTE1M2NkYTI4IDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL252bWVtL2NvcmUuYwo+PiArKysgYi9kcml2ZXJzL252bWVtL2Nv
cmUuYwo+PiBAQCAtMTAyNyw3ICsxMDI3LDcgQEAgc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW1f
cmVnaXN0ZXIoY29uc3Qgc3RydWN0IG52bWVtX2NvbmZpZyAqY29uZmlnKQo+PiDCoMKgwqDCoMKg
IG52bWVtLT5ua2VlcG91dCA9IGNvbmZpZy0+bmtlZXBvdXQ7Cj4+IMKgwqDCoMKgwqAgaWYgKGNv
bmZpZy0+b2Zfbm9kZSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIG52bWVtLT5kZXYub2Zfbm9kZSA9
IGNvbmZpZy0+b2Zfbm9kZTsKPj4gLcKgwqDCoCBlbHNlIGlmICghY29uZmlnLT5ub19vZl9ub2Rl
KQo+PiArwqDCoMKgIGVsc2UKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIG52bWVtLT5kZXYub2Zfbm9k
ZSA9IGNvbmZpZy0+ZGV2LT5vZl9ub2RlOwo+PiDCoMKgwqDCoMKgIHN3aXRjaCAoY29uZmlnLT5p
ZCkgewo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oIGIvaW5j
bHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4+IGluZGV4IDFiODFhZGViZGI4Yi4uZTM5MzA4
MzUyMzViIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L252bWVtLXByb3ZpZGVyLmgKPj4g
KysrIGIvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4+IEBAIC04OSw3ICs4OSw2IEBA
IHN0cnVjdCBudm1lbV9jZWxsX2luZm8gewo+PiDCoMKgICogQHJlYWRfb25seTrCoMKgwqAgRGV2
aWNlIGlzIHJlYWQtb25seS4KPj4gwqDCoCAqIEByb290X29ubHk6wqDCoMKgIERldmljZSBpcyBh
Y2Nlc3NpYmx5IHRvIHJvb3Qgb25seS4KPj4gwqDCoCAqIEBvZl9ub2RlOsKgwqDCoCBJZiBnaXZl
biwgdGhpcyB3aWxsIGJlIHVzZWQgaW5zdGVhZCBvZiB0aGUgcGFyZW50J3Mgb2Zfbm9kZS4KPj4g
LSAqIEBub19vZl9ub2RlOsKgwqDCoCBEZXZpY2Ugc2hvdWxkIG5vdCB1c2UgdGhlIHBhcmVudCdz
IG9mX25vZGUgZXZlbiBpZiBpdCdzICFOVUxMLgo+PiDCoMKgICogQHJlZ19yZWFkOsKgwqDCoCBD
YWxsYmFjayB0byByZWFkIGRhdGEuCj4+IMKgwqAgKiBAcmVnX3dyaXRlOsKgwqDCoCBDYWxsYmFj
ayB0byB3cml0ZSBkYXRhLgo+PiDCoMKgICogQHNpemU6wqDCoMKgIERldmljZSBzaXplLgo+PiBA
QCAtMTIyLDcgKzEyMSw2IEBAIHN0cnVjdCBudm1lbV9jb25maWcgewo+PiDCoMKgwqDCoMKgIGJv
b2zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlnbm9yZV93cDsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qg
bnZtZW1fbGF5b3V0wqDCoMKgICpsYXlvdXQ7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGRldmljZV9u
b2RlwqDCoMKgICpvZl9ub2RlOwo+PiAtwqDCoMKgIGJvb2zCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG5vX29mX25vZGU7Cj4+IMKgwqDCoMKgwqAgbnZtZW1fcmVnX3JlYWRfdMKgwqDCoCByZWdfcmVh
ZDsKPj4gwqDCoMKgwqDCoCBudm1lbV9yZWdfd3JpdGVfdMKgwqDCoCByZWdfd3JpdGU7Cj4+IMKg
wqDCoMKgwqAgaW50wqDCoMKgIHNpemU7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
