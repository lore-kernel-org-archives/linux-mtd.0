Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AB8C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 17:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ou7hMmBD3Zxs8mbGCtxwyP+j8qeqgpDEFbLHPztlBuA=; b=G2y+JQGSMKkxUL
	zMxZR3bxfr3WpH4y57VmNSbiRo6TWXvACGmp/xKce4M21gtbnooy3uxBqQ7IV0NnaIbdoW95owEMx
	uxefshJwzO8Nz0gkbW1L8cCd05qYtDsv9yPDMwJXGQP6Kscvw0vB145WgiBq3+d3FQT87yYgTK1DS
	yQtJe7F8i5TWCRNaPP2mWLdWoQ0uwev7jAVtMC4kKrIT9nXgIFkVuL9JldB5xKHIGlvNUZo2j5aMP
	Feg6hz4pM3ba5q3uAO7yoGv/3CR7TRlFKme1b9TtsFpq+GcR4HUFc1e98UOZynK8ikPHxR0yTI3GE
	uGUgFtRe+41kNGHeJw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyF0X-007sKZ-1p;
	Wed, 01 Nov 2023 17:27:57 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyF0R-007sJX-1n
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 17:27:55 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9d242846194so7027666b.1
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 10:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698859659; x=1699464459; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UybfZcgquZA+KEQ8TWuXYlHIb9Kzujav192AKRI36qY=;
        b=OoMJqb/nLjPTKrAQodrIJAkeSko3vNrXSx08LasT1liYh3qd/zsw/I8T2eiptOVdDy
         ZUiPGq+rSROWDQazRDcxgZjEWa9KnxxocBNWlbX1/NhV9BhFWhOVHDV6xL/41/5mxYbf
         Xepnf+tTT13pmuJ6bJKM5IWaXPOLVc85p3VQx1O320zW2KMFxpWXQdEuNkFEc3z2Sgdv
         nuXD63iE8Qa+6PxQMcObZay2gEAK73g67tPVusgLCe9JUMKkqMMDpqrl8lHi1p17FOPB
         RXoatA+e0NJxKrp+E9GnbhaVt3Z+a0J+l/YTyKkok2DYNAzKBfs6ywCr5JZYOgxaiSnP
         Hf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698859659; x=1699464459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UybfZcgquZA+KEQ8TWuXYlHIb9Kzujav192AKRI36qY=;
        b=Yq4PmvBtckVmMBOyO9iIgrbnXJkHMfqwuvCyRWvVKzAQXcvzYSio34pOYMClplcJUt
         HghiwfDS+ZfotE64O3Xb07nVYumjHfkvccUc5pT0H2O6tXuVVyZSKDwCnxcUdFotztcO
         jkBd2rOj95QWQJU8NDgyOv6v4SNP8PWyreGEfkFYss136S+fGcAxOLeIBP2HtQ6jOVoD
         VaVMDxEKXj4fZnttXfrvO5DFnb9tO3PWI1zyznMj1T+o39aYBWeS00Mzkl0oV+Gke01s
         Q3BWUVwVfLYFCCK7xNmt7GpEjiIPWzJEs15GBaVV2yh5hDXDFp3STNQr0d6PpXazWn3r
         /UQQ==
X-Gm-Message-State: AOJu0YyCk3YkzO1wQ1quoitUSroAP4eHph7eajU19yZLdkeSpx5swoMC
	uJKpOab66erjir631rmRNlV42Q==
X-Google-Smtp-Source: AGHT+IGNrmgnxS9YbJK3nEHSOuopj+kGo7FmjDGPmLuMkdxK7L1MK7q10WXHE+dr++UvhRpl98V8/Q==
X-Received: by 2002:a17:907:841:b0:9bf:65b0:1122 with SMTP id ww1-20020a170907084100b009bf65b01122mr2416161ejb.69.1698859659593;
        Wed, 01 Nov 2023 10:27:39 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id h13-20020a1709062dcd00b0099b8234a9fesm175507eji.1.2023.11.01.10.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 10:27:39 -0700 (PDT)
Message-ID: <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
Date: Wed, 1 Nov 2023 17:27:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <216d99d671caa2465519fcc3360c5001@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_102751_596538_AE05D220 
X-CRM114-Status: GOOD (  18.98  )
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

CgpPbiAxMS8xLzIzIDE2OjE3LCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IEhpIFR1ZG9yLAo+IAoK
SGkhCgo+IE9uIDAxLzExLzIwMjMgMTM6MDQsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gCj4+IHRo
aXMgaXMgd3JvbmcsIGl0IHNob3VsZCBoYXZlIGJlZW4KPj4gwqDCoMKgwqBib29sIG11bHRpX2Rp
ZSA9IG5vci0+bXRkLnNpemUgIT0gZGllX3NpemU7Cj4gCj4gCj4gSSBhcHBsaWVkIHRoZSBmb2xs
b3dpbmcgY2hhbmdlcyBvbiB0b3Agb2YgdjI6Cj4gCj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IEBAIC0xMDY3LDEy
ICsxMDY3LDE3IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9yZWFkX3NyMihzdHJ1Y3Qgc3BpX25vciAq
bm9yLAo+IHU4ICpzcjIpCj4gwqAgKi8KPiDCoHN0YXRpYyBpbnQgc3BpX25vcl9lcmFzZV9kaWUo
c3RydWN0IHNwaV9ub3IgKm5vciwgbG9mZl90IGFkZHIsIHNpemVfdAo+IGRpZV9zaXplKQo+IMKg
ewo+IC3CoMKgwqDCoMKgwqAgYm9vbCBtdWx0aV9kaWUgPSBub3ItPm10ZC5zaXplID09IGRpZV9z
aXplOwo+ICvCoMKgwqDCoMKgwqAgYm9vbCBtdWx0aV9kaWUgPSBub3ItPm10ZC5zaXplICE9IGRp
ZV9zaXplOwo+IMKgwqDCoMKgwqDCoMKgIGludCByZXQ7Cj4gCj4gLcKgwqDCoMKgwqDCoCBkZXZf
ZGJnKG5vci0+ZGV2LCAiICVsbGRLaUJcbiIsIChsb25nIGxvbmcpKGRpZV9zaXplID4+IDEwKSk7
Cj4gK8KgwqDCoMKgwqDCoCBkZXZfaW5mbyhub3ItPmRldiwgIiAlbGxkS2lCXG4iLCAobG9uZyBs
b25nKShkaWVfc2l6ZSA+PiAxMCkpOwo+IAo+IMKgwqDCoMKgwqDCoMKgIGlmIChub3ItPnNwaW1l
bSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9pbmZvKG5vci0+ZGV2LCAi
KioqKiogbm9yLT5wYXJhbXMtPmRpZV9lcmFzZV9vcGNvZGU6Cj4gMHgleFxuIiwgbm9yLT5wYXJh
bXMtPmRpZV9lcmFzZV9vcGNvZGUpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRl
dl9pbmZvKG5vci0+ZGV2LCAiKioqKiogbm9yLT5hZGRyX25ieXRlczogJWRcbiIsCj4gbm9yLT5h
ZGRyX25ieXRlcyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2luZm8obm9y
LT5kZXYsICIqKioqKiBhZGRyIDB4JWxseFxuIiwgYWRkcik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZGV2X2luZm8obm9yLT5kZXYsICIqKioqKiBtdWx0aV9kaWU6ICVkXG4iLCBt
dWx0aV9kaWUpOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHNw
aV9tZW1fb3Agb3AgPQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgU1BJX05PUl9ESUVfRVJBU0VfT1Aobm9yLT5wYXJhbXMtPmRpZV9lcmFzZV9vcGNvZGUs
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3ItPmFkZHJfbmJ5dGVzLCBhZGRy
LAo+IG11bHRpX2RpZSk7Cgpjb29sIQoKPiAsIGJ1dCBlcmFzZSBpcyBzdGlsbCBub3Qgd29ya2lu
ZzoKPj4KPiB+IyB0aW1lIGZsYXNoX2VyYXNlIC9kZXYvbXRkMCAwIDAKPiBFcmFzaW5nIDEzMTA3
MiBLaWJ5dGUgQCAwIC0twqAgMCBbwqDCoCAxNC43MzM0NDZdIHNwaS1ub3Igc3BpMC4wOsKgIDY1
NTM2S2lCCj4gJSBjb21wbGV0ZSBbwqDCoCAxNC43Mzk5MzJdIHNwaS1ub3Igc3BpMC4wOiAqKioq
Kgo+IG5vci0+cGFyYW1zLT5kaWVfZXJhc2Vfb3Bjb2RlOiAweGM0Cj4gW8KgwqAgMTQuNzQ3MzEx
XSBzcGktbm9yIHNwaTAuMDogKioqKiogbm9yLT5hZGRyX25ieXRlczogNAo+IFvCoMKgIDE0Ljc1
MjQwMl0gc3BpLW5vciBzcGkwLjA6ICoqKioqIGFkZHIgMHgwCj4gW8KgwqAgMTQuNzU2NTI0XSBz
cGktbm9yIHNwaTAuMDogKioqKiogbXVsdGlfZGllOiAxCj4gW8KgwqAgMTQuNzYxMTIxXSBzcGkt
bm9yIHNwaTAuMDrCoCA2NTUzNktpQgo+IFvCoMKgIDE0Ljc2NDgwN10gc3BpLW5vciBzcGkwLjA6
ICoqKioqIG5vci0+cGFyYW1zLT5kaWVfZXJhc2Vfb3Bjb2RlOiAweGM0Cj4gW8KgwqAgMTQuNzcx
Mjg5XSBzcGktbm9yIHNwaTAuMDogKioqKiogbm9yLT5hZGRyX25ieXRlczogNAo+IFvCoMKgIDE0
Ljc3NjM2OV0gc3BpLW5vciBzcGkwLjA6ICoqKioqIGFkZHIgMHg0MDAwMDAwCj4gW8KgwqAgMTQu
NzgxMDA0XSBzcGktbm9yIHNwaTAuMDogKioqKiogbXVsdGlfZGllOiAxCj4gRXJhc2luZyAxMzEw
NzIgS2lieXRlIEAgMCAtLSAxMDAgJSBjb21wbGV0ZQo+IAo+IHJlYWzCoMKgwqAgMG0wLjA2MXMK
PiB1c2VywqDCoMKgIDBtMC4wMDZzCj4gc3lzwqDCoMKgIDBtMC4wNTNzCj4gCj4gfiMgaGV4ZHVt
cCAtQyAvZGV2L210ZDAKPiAwMDAwMDAwMMKgIGQ0IGExIDhjIDE2IGFkIDRkIGIyIGRmwqAgM2Qg
MmEgYWYgYzIgYWUgMGEgOGEgYzHCoAo+IHwuLi4uLk0uLj0qLi4uLi4ufAo+IDAwMDAwMDEwwqAg
NWYgMmQgN2EgMTcgOWYgYzMgYTQgNDbCoCBjZCBmOSA4MCBiOCAxZSAzMyA0MyAyNcKgCj4gfF8t
ei4uLi5GLi4uLi4zQyV8Cj4gLi4uLgoKVGhhbmtzLCBGYWJpby4gSSBjYW4ndCB0ZWxsIHdoYXQn
cyBoYXBwZW5pbmcgYW5kIGl0J3MgZ2V0dGluZyBsYXRlIGhlcmUuCkRpZSBlcmFzZSBkb2VzIG5v
dCBleGVjdXRlIGlmIGVpdGhlciBvZiB0aGUgc3RhdHVzIHJlZ2lzdGVyIEJQIGJpdHMgYXJlCnNl
dCB0byAxIChzb21lIHNlY3RvcnMgYXJlIGxvY2tlZCksIGJ1dCB0aGF0IHNob3VsZG4ndCBiZSB0
aGUgY2FzZSBJCmd1ZXNzIGFzIHlvdSBjb3VsZCBlcmFzZSB0aGUgZW50aXJlIGZsYXNoIGJlZm9y
ZS4gU28gbWF5YmUgZHVtcCBTUi9GU1IKYmVmb3JlIGFuZCBhZnRlciB0aGUgY2hpcCBlcmFzZSBv
cC4gT3RoZXIgaWRlYSBpcyB0byBkdW1wIHRoZSBzcGlfbWVtX29wCmZpZWxkcywgYWZ0ZXIgc3Bp
X25vcl9zcGltZW1fc2V0dXBfb3AoKSBpcyBjYWxsZWQsIG1heWJlIEkgZ290IHNvbWV0aGluZwp3
cm9uZyB0aGVyZSwgYnV0IG9uIGEgc2hvcnQgbG9vayBpdCBzZWVtcyBmaW5lLgoKSSdsbCByZS1y
ZWFkIHRoaXMgdG9tb3Jyb3cuIENoZWVycywKdGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
