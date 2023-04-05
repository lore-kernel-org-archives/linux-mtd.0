Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C737C76188
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Apr 2023 01:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBXZXEPpRYuFhoKBccgt35RG3S1L5xKkOXKjmnMo9+0=; b=SY7PyNCnMBqtB4
	qyRdT2tRn5M/4FdVaKtu9J3Hrq49a9nBWw06qC9DRsF3PJyk6tnbuuYadn2v3Dp5TnF+tFvD8T2tr
	hF36kipFPfyD2gkSrzABUiglIQboMguiII+DI1tXjnpGVK7WeM8CSslsBYhpo8RNSfKoSWBs/WO/J
	SCFDFPmlEyIu/WCy8zOYCkto2yh3r9W9SefIgiGN8CoWwyW40zB8DBwkF/Jc1zoFT5PVxGMWqdC8m
	8FqCHpxB4+hNhViVVTWT6iUvNshgx6wmNjzV/v2dCuS74hq/DwM/OAhcoicnjf8UmkBQy5dZIX/K1
	w5wt8TIALj3xbRzeWYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjsCs-0037ia-2u;
	Wed, 05 Apr 2023 01:45:02 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjsCp-0037hq-1R
	for linux-mtd@lists.infradead.org;
	Wed, 05 Apr 2023 01:45:01 +0000
Received: by mail-ed1-x535.google.com with SMTP id er13so96362821edb.9
        for <linux-mtd@lists.infradead.org>; Tue, 04 Apr 2023 18:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680659096;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=px4UmyuHp+GyOnzy1WSnfZvTURfooIxx1dFOy7H+Xes=;
        b=A3BVZz+BE3Mmrt3/brQIJZICcJplj0djUTUeGovyGg8LZKgODGjYfsG+Y5Nlwxe60m
         Pt02kxC+SWpVPf2EJwbYdilHqS+Fe/vur6M6420OQSjmfk6pjcF3lHyJVe2f4qBXITP1
         DTHFPfA9TzgVmW9cqFBMVFPOFNkFKnl95slq/S+caQXEqe5qMEufs7qleJXkWK0VFHss
         eSn+c6fnQJEDvIG9sYBfUkAKayVmTVPXTtyCE6lKx8MLyh21Su7O22Zr23xsNHRqtkNB
         pGv4ZsfKwt9CviZ66uR/ZNCPstSmuNBw5qSo1McoaHXTes2WeK1n4tJWHTfCQGqUVfbZ
         9T2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680659096;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=px4UmyuHp+GyOnzy1WSnfZvTURfooIxx1dFOy7H+Xes=;
        b=tBpy9zjNXazGxLPLyYWCWXce8Uh4INtfxjm8JltxXwf7/9RucfQyazqiPVBfLkKfA0
         1SCdkKdRwrAxp9wOEsfSKcLjCHNQTQT4FneRyhM/msXz/s3GvH6ksCAJCatT0lkDanEe
         gVKXm53+4Y9sq7NFV7SMtxF2em+iVo+IK5nbFQtiPPknjr2QP6JcmfKw9qkecSBA6+xm
         AqqF+mIPhdvobr23B69dXVhYjX2ZxhpN+FhX6WJHJmzcIT8CXto6Jqo3I1p1oy5BUU0z
         wHSx4/MYWjEY0FsYWS7i9KMjgPhvnIDBcENptRcsXQj8mJNZOaKKZEBo+UIJpStGQQ4t
         wuWQ==
X-Gm-Message-State: AAQBX9e633Nx7FV/aPMcpxmo99hXPhr4xw3C8JxKq7GLVluUC9vWw6XX
	EkjH2g21PI15c5+GswxIAEdfKA==
X-Google-Smtp-Source: AKy350b2CeQk6Yn2N35j6NDIEcNqjnQsyA6q8S2ZTLaX9Adu58i2gtddm92q3UQSz6XqltsQ8VpJTQ==
X-Received: by 2002:a17:906:9383:b0:8ab:4c4:d0f6 with SMTP id l3-20020a170906938300b008ab04c4d0f6mr1457978ejx.56.1680659096574;
        Tue, 04 Apr 2023 18:44:56 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id d3-20020a170906c20300b0093e9fb91837sm6649694ejz.76.2023.04.04.18.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 18:44:56 -0700 (PDT)
Message-ID: <b53c3ee0-4641-1a51-492d-6e5901db6e28@linaro.org>
Date: Wed, 5 Apr 2023 04:44:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/8] mtd: spi-nor: spansion: Rework
 cypress_nor_set_page_size() for multi-chip device support
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
 <08b8d366534e6f9ac3f1dcf08560451293e0b4b1.1675835253.git.Takahiro.Kuwano@infineon.com>
 <5f72a5a0-b23e-3ffd-5690-958e85dc66db@linaro.org>
In-Reply-To: <5f72a5a0-b23e-3ffd-5690-958e85dc66db@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_184459_493324_7A4AB0CD 
X-CRM114-Status: GOOD (  27.99  )
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

CgpPbiAwMi4wMy4yMDIzIDA4OjA5LCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+IAo+IAo+IE9uIDA4
LjAyLjIwMjMgMDc6NTMsIHRrdXc1ODQ5MjRAZ21haWwuY29tIHdyb3RlOgo+PiBGcm9tOiBUYWth
aGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5jb20+Cj4+Cj4+IEZvciBtdWx0
aS1jaGlwIGRldmljZXMsIHdlIGNhbiB1c2UgNTEyQiBwYWdlIG9ubHkgd2hlbiB0aGUgYWxsIGRp
Y2UgYXJlCj4+IGNvbmZpZ3VyZWQgYXMgNTEyQiBwYWdlIHNpemUuIFNpbXBsZSBmb3ItbG9vcCB3
aXRoIHBhcmFtcy0+bnVtX29mX2RpY2UKPj4gY2FuCj4+IGNoZWNrIHRoZSBDRlIzViBpbiBlYWNo
IGRpZS4gVGhlIHZvbGF0aWxlIHJlZ2lzdGVyIGFkZHJlc3MgaXMgY2FsY3VsYXRlZAo+PiBpbnNp
ZGUgdGhlIGxvb3AgYnkgdXNpbmcgZGllIG51bWJlciBhbmQgdm9sYXRpbGUgcmVnaXN0ZXIgb2Zm
c2V0Lgo+Pgo+PiBUaGUgbG9jYXRpb24gb2YgY3lwcmVzc19ub3Jfc2V0X3BhZ2Vfc2l6ZSgpIGNh
bGwgaXMgbW92ZWQgZnJvbQo+PiBwb3N0X2JmcHRfZml4dXAoKSB0byBwb3N0X3NmZHBfZml4dXAo
KSwgYmVjYXVzZSB0aGUgbnVtYmVyIG9mIGRpY2UgYW5kCj4+IHZvbGF0aWxlIHJlZ2lzdGVyIG9m
ZnNldCBhcmUgcGFyc2VkIGFmdGVyIEJGUFQuIFRoZSBwb3N0X3NmZHBfZml4dXAoKQo+IAo+IE5v
LCB0aGlzIGxvb2tzIHdyb25nLgo+IAo+IEJGUFQgaXMgdGhlIG9ubHkgbWFuZGF0b3J5IHRhYmxl
IGFuZCBzaG91bGQgYmUgc3VmZmljaWVudCB0byBtYWtlIGFueQo+IGZsYXNoIHdvcmsgKGluIHRo
ZSBtdWx0aSBkaWUgY2FzZSwganVzdCBmb3IgdGhlIGZpcnN0IGRpZSkuIEFsbCB0aGUKPiBvdGhl
ciB0YWJsZXMgYXJlIGNvbnNpZGVyZWQgb3B0aW9uYWwuIElmIHdlIGdldCBhbiBlcnJvciB3aGVu
IHBhcnNpbmcKPiBCRlBUIHdlIHJldHVybiBhbiBlcnJvciwgaWYgd2UgZ2V0IGFuIGVycm9yIGlu
IGFueSBvcHRpb25hbCB0YWJsZSwgd2UKPiBqdXN0IHByaW50IGEgd2FybmluZyBhbmQgY29udGlu
dWUuIFNvIHlvdSBzaG91bGQgbWFrZSBzdXJlIHRoYXQgdGhlCj4gZmxhc2ggd29ya3MgZmluZSBl
dmVuIGlmIHNjY3JfbWFwX21jIGZhaWxzLgo+IAo+PiBkb2VzIG5vdCByZXR1cm4gZXJyb3IgY29k
ZSBzbyBjeXByZXNzX25vcl9zZXRfcGFnZV9zaXplKCkgcHJpbnRzIGVycm9yCj4+IG1lc3NhZ2Ug
aW5zdGVhZCBvZiByZXR1cm5pbmcgZXJyb3IgY29kZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVGFr
YWhpcm8gS3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24uY29tPgo+PiAtLS0KPj4gwqAg
ZHJpdmVycy9tdGQvc3BpLW5vci9zcGFuc2lvbi5jIHwgNDcgKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMjIg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwYW5z
aW9uLmMKPj4gYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwYW5zaW9uLmMKPj4gaW5kZXggMTJhMjU2
YzBlZjRjLi43YzUzMzczN2Q3YzMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
c3BhbnNpb24uYwo+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwYW5zaW9uLmMKPj4gQEAg
LTE4LDcgKzE4LDcgQEAKPj4gwqAgI2RlZmluZSBTUElOT1JfUkVHX0NZUFJFU1NfQ0ZSMV9RVUFE
X0VOwqDCoMKgwqDCoMKgwqAgQklUKDEpwqDCoMKgIC8qIFF1YWQKPj4gRW5hYmxlICovCj4+IMKg
ICNkZWZpbmUgU1BJTk9SX1JFR19DWVBSRVNTX0NGUjJWwqDCoMKgwqDCoMKgwqAgMHgwMDgwMDAw
Mwo+PiDCoCAjZGVmaW5lIFNQSU5PUl9SRUdfQ1lQUkVTU19DRlIyX01FTUxBVF8xMV8yNMKgwqDC
oCAweGIKPj4gLSNkZWZpbmUgU1BJTk9SX1JFR19DWVBSRVNTX0NGUjNWwqDCoMKgwqDCoMKgwqAg
MHgwMDgwMDAwNAo+PiArI2RlZmluZSBTUElOT1JfUkVHX0NZUFJFU1NfQ0ZSM8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgMHg0Cj4+IMKgICNkZWZpbmUgU1BJTk9SX1JFR19DWVBSRVNTX0NGUjNfUEdT
WsKgwqDCoMKgwqDCoMKgIEJJVCg0KSAvKiBQYWdlIHNpemUuICovCj4+IMKgICNkZWZpbmUgU1BJ
Tk9SX1JFR19DWVBSRVNTX0NGUjVWwqDCoMKgwqDCoMKgwqAgMHgwMDgwMDAwNgo+PiDCoCAjZGVm
aW5lIFNQSU5PUl9SRUdfQ1lQUkVTU19DRlI1X0JJVDbCoMKgwqDCoMKgwqDCoCBCSVQoNikKPj4g
QEAgLTE5NSwyNyArMTk1LDM0IEBAIHN0YXRpYyBpbnQKPj4gY3lwcmVzc19ub3JfcXVhZF9lbmFi
bGVfdm9sYXRpbGUoc3RydWN0IHNwaV9ub3IgKm5vcikKPj4gwqDCoCAqIFRoZSBCRlBUIHRhYmxl
IGFkdmVydGlzZXMgYSA1MTJCIG9yIDI1NkIgcGFnZSBzaXplIGRlcGVuZGluZyBvbgo+PiBwYXJ0
IGJ1dCB0aGUKPj4gwqDCoCAqIHBhZ2Ugc2l6ZSBpcyBhY3R1YWxseSBjb25maWd1cmFibGUgKHdp
dGggdGhlIGRlZmF1bHQgYmVpbmcgMjU2QikuCj4+IFJlYWQgZnJvbQo+PiDCoMKgICogQ0ZSM1Zb
NF0gYW5kIHNldCB0aGUgY29ycmVjdCBzaXplLgo+PiAtICoKPj4gLSAqIFJldHVybjogMCBvbiBz
dWNjZXNzLCAtZXJybm8gb3RoZXJ3aXNlLgo+PiDCoMKgICovCj4+IC1zdGF0aWMgaW50IGN5cHJl
c3Nfbm9yX3NldF9wYWdlX3NpemUoc3RydWN0IHNwaV9ub3IgKm5vcikKPj4gK3N0YXRpYyB2b2lk
IGN5cHJlc3Nfbm9yX3NldF9wYWdlX3NpemUoc3RydWN0IHNwaV9ub3IgKm5vcikKPj4gwqAgewo+
PiArwqDCoMKgIHN0cnVjdCBzcGlfbm9yX2ZsYXNoX3BhcmFtZXRlciAqcGFyYW1zID0gbm9yLT5w
YXJhbXM7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHNwaV9tZW1fb3Agb3AgPQo+PiAtwqDCoMKgwqDC
oMKgwqAgQ1lQUkVTU19OT1JfUkRfQU5ZX1JFR19PUChub3ItPnBhcmFtcy0+YWRkcl9tb2RlX25i
eXRlcywKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElO
T1JfUkVHX0NZUFJFU1NfQ0ZSM1YsCj4+ICvCoMKgwqDCoMKgwqDCoCBDWVBSRVNTX05PUl9SRF9B
TllfUkVHX09QKHBhcmFtcy0+YWRkcl9tb2RlX25ieXRlcywgMCwKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3ItPmJvdW5jZWJ1Zik7Cj4+IMKgwqDC
oMKgwqAgaW50IHJldDsKPj4gK8KgwqDCoCB1OCBpOwo+PiDCoCAtwqDCoMKgIHJldCA9IHNwaV9u
b3JfcmVhZF9hbnlfcmVnKG5vciwgJm9wLCBub3ItPnJlZ19wcm90byk7Cj4+IC3CoMKgwqAgaWYg
KHJldCkKPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICvCoMKgwqAgLyogU2V0IHRv
IGRlZmF1bHQgcGFnZSBzaXplICovCj4+ICvCoMKgwqAgcGFyYW1zLT5wYWdlX3NpemUgPSAyNTY7
Cj4+IMKgIC3CoMKgwqAgaWYgKG5vci0+Ym91bmNlYnVmWzBdICYgU1BJTk9SX1JFR19DWVBSRVNT
X0NGUjNfUEdTWikKPj4gLcKgwqDCoMKgwqDCoMKgIG5vci0+cGFyYW1zLT5wYWdlX3NpemUgPSA1
MTI7Cj4+IC3CoMKgwqAgZWxzZQo+PiAtwqDCoMKgwqDCoMKgwqAgbm9yLT5wYXJhbXMtPnBhZ2Vf
c2l6ZSA9IDI1NjsKPj4gK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgcGFyYW1zLT5udW1fb2ZfZGlj
ZTsgaSsrKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBvcC5hZGRyLnZhbCA9IHBhcmFtcy0+dnJlZ19v
ZmZzZXRbaV0gKyBTUElOT1JfUkVHX0NZUFJFU1NfQ0ZSMzsKPiAKPiBpbiBjYXNlIHNjY3JfbWFw
IGZhaWxzIHZyZWdfb2Zmc2V0IGlzIHplcm8gaGVyZSwgeW91J2xsIHJlYWQgZ2FyYmFnZQo+PiDC
oCAtwqDCoMKgIHJldHVybiAwOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gc3BpX25vcl9yZWFk
X2FueV9yZWcobm9yLCAmb3AsIG5vci0+cmVnX3Byb3RvKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChyZXQpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihub3ItPmRldiwgIkZh
aWxlZCB0byByZWFkIHBhZ2Ugc2l6ZQo+PiBjb25maWd1cmF0aW9uLiBVc2UgZGVmYXVsdCAyNTZC
LlxuIik7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPiAKPiB3aHkgZGlkIHdl
IGNvbnNpZGVyIGEgbm8tZ28gZXJyb3IgYW5kIGV4aXRlZCBpbiB0aGUgcGFzdCBhbmQgbm93IHdl
IGp1c3QKPiB1c2UgYSBkZWZhdWx0IGNvbmZpZz8KPiAKCndlIHNob3VsZCBpbnN0ZWFkIGFsbG93
IHBhcnNlX3NmZHAgdG8gcmV0dXJuIGVycm9ycy4gSSdtIHNlbmRpbmcgYSBwYXRjaApzaG9ydGx5
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
