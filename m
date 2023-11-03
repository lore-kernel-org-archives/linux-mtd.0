Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E225C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlsCB5vGIvCdmV5joZ7n1ZI7v3hIL08OwbRJz9tpK0A=; b=HUzi2LmdbcAwr4
	x9WqYOeZnKCA40gTK9kWt/T6tLhpzLWQXaZw6ySbnzatgb2XNjnG49nCELCcMDxonhinVGXD9268t
	3mNWc0gaLzCIkm+5dI2NAdy+ji0ALvGgJnNaOPt9+EhQTDc1I72DDvVqB+Kw1WOYWuniPZJn/F9Eq
	M7szqIZok2R3Tb/yjCTeFwxmsu1jfXMF8w6xvKM9SFDFEbAd0oENMY0X9CFrok/CxjlE/fn0QxNKX
	X0Ib8TTKSR2oS7zuR0muSTEivarsY9JzplBEWBw7EWo44dYTX/9/MiO9O2LO3qwFsUjdCUISm2V5D
	mhq8jiMpBEjUGveSKnOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyuCI-00BTyq-02;
	Fri, 03 Nov 2023 13:26:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyuCC-00BTxd-2k
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 13:26:48 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5441305cbd1so1294752a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 03 Nov 2023 06:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699018002; x=1699622802; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3GUVlnvfHajw8gZI2o3qHP4/4Yejup/D3Fqlx+hPKA=;
        b=S6yeqRkva5EwirjQc0cyhygnjDlG1o/TLGKlH7BrtEZ5Ef8QhGTdLWI7G9PRi2BHET
         WnINlz3q8jGCXv9WK+fgskMWWJsNnWlQtvFjSt/d3MddUrDCkxz3AqRhKtefC+/6Jfg9
         Rl/vW5SdgfVfdKmVHefieIY8BDFZZpPHFp4XZ+IXPzs3zjlhKQ7Yq/qDFvzvDfibookf
         VIC4qawkvvNsZEN7ClefYuh7G3DcpQf9l3/9Lsc1KT9LMOM7mIKwCHLfKmtd/pm4D9z0
         YoI/kFo0sNd8UqZAQXXLv9U/AT0Xm83QUZe/X3VER0+fOy69b+GHMGTzwpsgNvoZNCq7
         cX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699018002; x=1699622802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3GUVlnvfHajw8gZI2o3qHP4/4Yejup/D3Fqlx+hPKA=;
        b=QvtrNo7B8Aj0+HpL+VGxdLYN4Zo8Zuuo8OqmNwgU3UlDGiuERQeddA6+7eVmV10KG3
         gRMmGI2fP4/09b+4I3LsC6WAVRmCPm5N0LJ6IeT51ighxuRqLL9RUalsK5yL2R7TMoH9
         Ri/el+ejCdJ0zVkWz5DQLwpt9J610OPO3rRGVK1kWLRMZJH3AmFsvAiN7uVwhshoMFHn
         n3Ba1sEyp5nrSN2JRGuiKqLuAua3hNbrA4YA/1yvZwIJ8MrJjiWQBZEq/bJWnAywd9kd
         WvDINZNO8xnBUvlaxTmruPzDTlEiVduT7D3VGwKK2r/09PcdHdGO21Gc/Q4Z16afZ0Gs
         /zTg==
X-Gm-Message-State: AOJu0YwuSXVMtrLj20uvNpyeojErnbH7hymBuZzcEmlKhn7Ra8QotpqK
	I87TFm2LulldA726ECiu/SAe+g==
X-Google-Smtp-Source: AGHT+IF/Q5m2JEh3RjWfyacLriPQGk4I0SEfi64NUVLU+ujM6P6UjtJVX6wtzbGwwSDCBEsqhKtFOw==
X-Received: by 2002:a17:907:987:b0:9ae:54c3:c627 with SMTP id bf7-20020a170907098700b009ae54c3c627mr7126053ejc.71.1699018002375;
        Fri, 03 Nov 2023 06:26:42 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id lf22-20020a170906ae5600b009b957d5237asm902674ejb.80.2023.11.03.06.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 06:26:41 -0700 (PDT)
Message-ID: <b5c1d4d7-1583-4469-a604-dcf5bb3f96a4@linaro.org>
Date: Fri, 3 Nov 2023 13:26:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, michael@walle.cc,
 pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
 <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
 <968ba4c249926e986b02440ad0421e98@denx.de>
 <f2141a88-13d4-47b8-8382-5df8cc1bc42b@linaro.org>
 <cf0e4284f2e3193ddd57b715196ca202@denx.de>
 <25ca1a4c-683c-4b6d-938b-07323b211815@linaro.org>
 <c3f2b8a6-8b23-4a33-948e-62ff64db9a2f@linaro.org>
 <5872f7233bc0dc4669aa1324f3ae3cf0@denx.de>
 <95c16eb0-a785-4a8d-bb42-c5a09b034d0a@linaro.org>
 <e665266fc1565f9d346c95215df39f12@denx.de>
 <085ba0f9780b1f8b34bc9e1037fec5e7@denx.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <085ba0f9780b1f8b34bc9e1037fec5e7@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_062644_921217_97FEDE7D 
X-CRM114-Status: GOOD (  14.65  )
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

CgpPbiAxMS8zLzIzIDEyOjUzLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IE9uIDAzLzExLzIwMjMg
MDk6MzAsIEZhYmlvIEVzdGV2YW0gd3JvdGU6Cj4gCj4+IFRoZSBwcm9ibGVtIEkgc2VlIGlzIHRo
YXQgdGhlIGVyYXNlIG9wZXJhdGlvbiB3YXMgc3VwZXIgc2xvdy4KPj4KPj4gUGxlYXNlIHNlZSB0
aGUgdGltZXN0YW1wcyB0byBnZXQgYW4gaWRlYS4KPj4KPj4gSXMgdGhpcyBzbG93LWVyYXNlIGJl
aGF2aW9yIGV4cGVjdGVkPyBQbGVhc2Ugbm90ZSB0aGF0IHRoZQoKTm8uCgo+PiBTUEkgY29udHJv
bGxlciBvbiB0aGUgaS5NWDhNUCBkb2VzIG5vdCBoYXZlIERNQSBzdXBwb3J0IGF0IHRoZSBtb21l
bnQuCgpXZSBkb24ndCB1c2UgRE1BIGZvciBlcmFzZXMsIGl0IGRvZXNuJ3QgbWF0dGVyIHdoZXRo
ZXIgeW91IHVzZSBETUEgb3Igbm90LgoKPiAKPiBNZWFzdXJpbmcgdGhlIHRpbWUgaXQgdGFrZXMg
dG8gZXJhc2UgdGhlIHdob2xlIGZsYXNoOgo+IAo+IHJvb3RAbWNkZTMwMDBhOn4jIHRpbWUgZmxh
c2hfZXJhc2UgL2Rldi9tdGQwIDAgMAo+IEVyYXNpbmcgMTMxMDcyIEtpYnl0ZSBAIDAgLS3CoCAw
IFsgMTUwMi44NTc2ODddIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+IG5vci0+cmVnX3Byb3RvID0g
MHgwMDAxMDEwMQo+ICUgY29tcGxldGUgWyAxNTAyLjg2NjM1NF0gc3BpLW5vciBzcGkwLjA6ICoq
KioqCj4gWyAxNTAyLjg3MDYzMV0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmNtZC5uYnl0ZXMg
PSAweDAxCj4gWyAxNTAyLjg3NTg5MV0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmNtZC5idXN3
aWR0aCA9IDB4MDEKPiBbIDE1MDIuODgxMzExXSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuY21k
Lm9wY29kZSA9IDB4YzQKPiBbIDE1MDIuODg2NTU5XSBzcGktbm9yIHNwaTAuMDogKioqKioKPiBb
IDE1MDIuODg5ODg4XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuYWRkci5uYnl0ZXMgPSAweDA0
Cj4gWyAxNTAyLjg5NTIyMF0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmFkZHIuYnVzd2lkdGgg
PSAweDAxCj4gWyAxNTAyLjkwMDcyNF0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmFkZHIuYnVz
d2lkdGggPSAweDAKPiBbIDE1MDIuOTA2MTQxXSBzcGktbm9yIHNwaTAuMDogKioqKioKPiBbIDE1
MDIuOTA5NDc0XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuZHVtbXkubmJ5dGVzID0gMHgwMAo+
IFsgMTUwMi45MTQ4OTldIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5kdW1teS5idXN3aWR0aCA9
IDB4MDAKPiBbIDE1MDIuOTIwNDg5XSBzcGktbm9yIHNwaTAuMDogKioqKioKPiBbIDE1MDIuOTIz
ODIzXSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuZGF0YS5idXN3aWR0aCA9IDB4MDAKPiBbIDE1
MDIuOTI5MzIzXSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuZGF0YS5uYnl0ZXMgPSAwCj4gWyAx
NjIwLjMyOTY3M10gc3BpLW5vciBzcGkwLjA6ICoqKioqIG5vci0+cmVnX3Byb3RvID0gMHgwMDAx
MDEwMQo+IFsgMTYyMC4zMzU1MzhdIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+IFsgMTYyMC4zMzg4
NjldIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5jbWQubmJ5dGVzID0gMHgwMQo+IFsgMTYyMC4z
NDQxMjddIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5jbWQuYnVzd2lkdGggPSAweDAxCj4gWyAx
NjIwLjM0OTU0M10gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmNtZC5vcGNvZGUgPSAweGM0Cj4g
WyAxNjIwLjM1NDc5MV0gc3BpLW5vciBzcGkwLjA6ICoqKioqCj4gWyAxNjIwLjM1ODEyM10gc3Bp
LW5vciBzcGkwLjA6ICoqKioqIG9wLmFkZHIubmJ5dGVzID0gMHgwNAo+IFsgMTYyMC4zNjM0NTJd
IHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5hZGRyLmJ1c3dpZHRoID0gMHgwMQo+IFsgMTYyMC4z
Njg5NTNdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5hZGRyLmJ1c3dpZHRoID0gMHg0MDAwMDAw
Cj4gWyAxNjIwLjM3NDg5MF0gc3BpLW5vciBzcGkwLjA6ICoqKioqCj4gWyAxNjIwLjM3ODIyOV0g
c3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmR1bW15Lm5ieXRlcyA9IDB4MDAKPiBbIDE2MjAuMzgz
NjQ2XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuZHVtbXkuYnVzd2lkdGggPSAweDAwCj4gWyAx
NjIwLjM4OTIzNF0gc3BpLW5vciBzcGkwLjA6ICoqKioqCj4gWyAxNjIwLjM5MjU2Nl0gc3BpLW5v
ciBzcGkwLjA6ICoqKioqIG9wLmRhdGEuYnVzd2lkdGggPSAweDAwCj4gWyAxNjIwLjM5ODA2OF0g
c3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmRhdGEubmJ5dGVzID0gMAo+IEVyYXNpbmcgMTMxMDcy
IEtpYnl0ZSBAIDAgLS0gMTAwICUgY29tcGxldGUKPiAKPiByZWFswqDCoMKgIDNtNTYuNzk1cwo+
IHVzZXLCoMKgwqAgMG0wLjAwMXMKPiBzeXPCoMKgwqAgM20xNS44NDBzCj4gCj4gT3JpZ2luYWxs
eSwgSSB3YXMgYWxzbyBnZXR0aW5nIGFyb3VuZCA0IG1pbnV0ZXMgdG8gZXJhc2UgdGhlIHdob2xl
IGZsYXNoLAo+IHNvIHRoZSBlcmFzZS1kaWUgcGVyZm9ybWFuY2UgaXMgY29tcGFyYWJsZSB0byB0
aGUgZXJhc2Ugb25lIHNlY3RvciBhdCB0aW1lLgo+IAoKV2hpY2ggdmVyc2lvbiBvZiBtdGQtdXRp
bHMgYXJlIHlvdSB1c2luZz8gSSBndWVzcyB0aGUgZmxhc2gtZXJhc2UKdXRpbGl0eSBpcyB3cml0
dGVuIGluIGEgYmFkIHdheS4gUGxlYXNlIHVzZSB0aGUgZm9sbG93aW5nIHdoaWxlIEkgY2hlY2sK
d2hhdCBmbGFzaF9lcmFzZSBpcyBkb2luZzoKCnRpbWUgbXRkX2RlYnVnIGVyYXNlIC9kZXYvbXRk
MCAwIDEzNDIxNzcyOAoKdGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
