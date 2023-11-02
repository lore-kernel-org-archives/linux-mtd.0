Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D948C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 18:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IcklH6/udXuwADrpIJq8ocqT8uS7fpP9O1s9ax+dQs=; b=PEGLypX/JoGrk0
	i41nwDjY/npLjZ8eLLu8XxnfJNIolLawLf+7NSZIlaNSRk024RKyIpj0vaH8o9/AvJO0i2j3rQACR
	ngkAal8GMA3b4nR1Uig+LKMNLnx4HGgzyvVnI5Hky/RHplAk/2Fq3AqcbljYbMa2SyhE6c9JI7dRd
	txV+V/ddikT/u/WcmCpFHEJUST9QiSomAzGpi+IFRP6kD2k/6CUVuq+J3b5pG7lwiZpcXKBWFrVNg
	vWfhu+11NWhYltPyIFor5pSAg00n3xYYdWle+z1hJmDg9CCUrBKfa8cwcunucqCeRJY82ijQG7bKV
	7dgtW4nGDuX0zCMB+kkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qycrp-00A7Zr-0D;
	Thu, 02 Nov 2023 18:56:33 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qycrk-00A7YW-1K
	for linux-mtd@lists.infradead.org;
	Thu, 02 Nov 2023 18:56:32 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9bf86b77a2aso197741866b.0
        for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2023 11:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698951385; x=1699556185; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZfcOcgfj3lwzvuyp1rWiBgEVRJiK2xR9o1DiddJBaFM=;
        b=pu1+zWXxUfXekNLaz+Rh4WqNoUffmOQOYNxpf1lIDauzi4LbyspKn159u1rsI5qyZ9
         kgz6y6L4FRGPThkmt/DLIjsvWwyuysVMOwI/0+x0k87DE+MFNweE61m5L0liRVBivaa6
         C1TxUb940HQQy5DMIDGQ8xLUUUNXknyNhK0gIxram+Q6ltSIw/QnCUI966Fe00wH6dd0
         4wdU7ujyh+faNag0t4jZR/HdmR/8hhI6tZE6OkvvC+7h78S5WklKBkgaZhcVa8wxmdid
         WL+vritw1PLHT54Vs8ImJ8Z8Y1qY1IUL0+W4B/MPQkQRFfBmDLq2/cvWyzfzzyoj+P4W
         0ZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698951385; x=1699556185;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfcOcgfj3lwzvuyp1rWiBgEVRJiK2xR9o1DiddJBaFM=;
        b=ILSRKbKTHtCT7Lp8F8q8/JIoPSJ+R27BolH31vKlWqTKrl4o2f1gslBBC7p7UXkHJw
         JsQLJlGIEFv1Baz3MlW3+VTW+4L4ZC/teFhD3rMnnmoNj67hWl94OY9raKrTJXeSO/iD
         LtQmayejPXFkiHu7Cpup14qQpnHf3R4qrwb4QsGSl3HsMT88upl44KyPqGAg4AN8Ul8a
         MTK5aUL9jvShJ8BEvMrJPtLgDGA9adYtrDjLDWR0OtIURggPLlkuLHrEzpHt5Ne7DIiK
         wdXqpvC0Cy7tFik7a3NRWPRndg7CgL/YtKJjDsndBIg9NBXsTQR8ArNHDYKyhDTcHQsb
         1Mmg==
X-Gm-Message-State: AOJu0Yy4pQP7F4vh8DUY5iXTc8CzbiMJX0GxKTZlfqL8iyU7lZSfIQEr
	OXG5zhrq8L3vKMPFyootS8NCYg==
X-Google-Smtp-Source: AGHT+IHirZx2jm2YyE5uKKSiyd1AumxAaqS07aSCcH4Bic6UfyyUm2uLGiGAJyyDgToZ9WT5d2rysQ==
X-Received: by 2002:a17:906:da8a:b0:9d1:6780:fb31 with SMTP id xh10-20020a170906da8a00b009d16780fb31mr5397372ejb.38.1698951385406;
        Thu, 02 Nov 2023 11:56:25 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709064f0100b009c4cb1553edsm44478eju.95.2023.11.02.11.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 11:56:24 -0700 (PDT)
Message-ID: <c3f2b8a6-8b23-4a33-948e-62ff64db9a2f@linaro.org>
Date: Thu, 2 Nov 2023 18:56:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Fabio Estevam <festevam@denx.de>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: michael@walle.cc, pratyush@kernel.org, linux-mtd@lists.infradead.org,
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
In-Reply-To: <25ca1a4c-683c-4b6d-938b-07323b211815@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_115628_452885_B2D0A87D 
X-CRM114-Status: GOOD (  14.71  )
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

CgpPbiAxMS8yLzIzIDE4OjQ2LCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+IAo+IAo+IE9uIDExLzIv
MjMgMTg6MzMsIEZhYmlvIEVzdGV2YW0gd3JvdGU6Cj4+IE9uIDAyLzExLzIwMjMgMTU6MjEsIFR1
ZG9yIEFtYmFydXMgd3JvdGU6Cj4+Cj4+PiBMZXQncyBzZWUgd2hhdCBnZXRzIHRvIHRoZSBTUEkg
Y29udHJvbGxlci4gV2hpY2ggU1BJIGNvbnRyb2xsZXIgZG8geW91Cj4+PiB1c2U/Cj4+Cj4+IEkg
YW0gdXNpbmcgaS5NWDhNUCwgd2hpY2ggaGFzIGRyaXZlcnMvc3BpL3NwaS1ueHAtZnNwaS5jLgo+
Pgo+PiBIZXJlIGlzIHRoZSByZXN1bHQ6Cj4+Cj4+IHJvb3RAbWNkZTMwMDBhOn4jIGZsYXNoX2Vy
YXNlIC9kZXYvbXRkMCAwIDAKPj4gRXJhc2luZyAxMzEwNzIgS2lieXRlIEAgMCAtLcKgIDAgW8Kg
wqAgMjYuMDQwOTAzXSBzcGktbm9yIHNwaTAuMDogKioqKioKPj4gbm9yLT5yZWdfcHJvdG8gPSAw
eDAwMDEwMTAxCj4+ICUgY29tcGxldGUgW8KgwqAgMjYuMDQ5NTcwXSBzcGktbm9yIHNwaTAuMDog
KioqKioKPj4gW8KgwqAgMjYuMDUzODQ5XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuY21kLm5i
eXRlcyA9IDB4MDEKPj4gW8KgwqAgMjYuMDU5MTE4XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3Au
Y21kLmJ1c3dpZHRoID0gMHgwMQo+PiBbwqDCoCAyNi4wNjQ1MzldIHNwaS1ub3Igc3BpMC4wOiAq
KioqKiBvcC5jbWQub3Bjb2RlID0gMHhjNAo+PiBbwqDCoCAyNi4wNjk3ODddIHNwaS1ub3Igc3Bp
MC4wOiAqKioqKgo+PiBbwqDCoCAyNi4wNzMxMThdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5h
ZGRyLm5ieXRlcyA9IDB4MDQKPj4gW8KgwqAgMjYuMDc4NDUxXSBzcGktbm9yIHNwaTAuMDogKioq
Kiogb3AuYWRkci5idXN3aWR0aCA9IDB4MDEKPj4gW8KgwqAgMjYuMDgzOTQ5XSBzcGktbm9yIHNw
aTAuMDogKioqKiogb3AuYWRkci5idXN3aWR0aCA9IDB4MAo+PiBbwqDCoCAyNi4wODkzNjhdIHNw
aS1ub3Igc3BpMC4wOiAqKioqKgo+PiBbwqDCoCAyNi4wOTI2OTldIHNwaS1ub3Igc3BpMC4wOiAq
KioqKiBvcC5kdW1teS5uYnl0ZXMgPSAweDAwCj4+IFvCoMKgIDI2LjA5ODEyM10gc3BpLW5vciBz
cGkwLjA6ICoqKioqIG9wLmR1bW15LmJ1c3dpZHRoID0gMHgwMAo+PiBbwqDCoCAyNi4xMDM3MTNd
IHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+PiBbwqDCoCAyNi4xMDcwNDVdIHNwaS1ub3Igc3BpMC4w
OiAqKioqKiBvcC5kYXRhLmJ1c3dpZHRoID0gMHgwMAo+PiBbwqDCoCAyNi4xMTI1NDldIHNwaS1u
b3Igc3BpMC4wOiAqKioqKiBvcC5kYXRhLm5ieXRlcyA9IDAKPj4gW8KgwqAgMjYuMTE3NzI3XSBz
cGktbm9yIHNwaTAuMDogKioqKiogbm9yLT5yZWdfcHJvdG8gPSAweDAwMDEwMTAxCj4+IFvCoMKg
IDI2LjEyMzU4OV0gc3BpLW5vciBzcGkwLjA6ICoqKioqCj4+IFvCoMKgIDI2LjEyNzAxMl0gc3Bp
LW5vciBzcGkwLjA6ICoqKioqIG9wLmNtZC5uYnl0ZXMgPSAweDAxCj4+IFvCoMKgIDI2LjEzMjI3
NF0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmNtZC5idXN3aWR0aCA9IDB4MDEKPj4gW8KgwqAg
MjYuMTM3NzA2XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuY21kLm9wY29kZSA9IDB4YzQKPj4g
W8KgwqAgMjYuMTQyOTU2XSBzcGktbm9yIHNwaTAuMDogKioqKioKPj4gW8KgwqAgMjYuMTQ2Mjkw
XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuYWRkci5uYnl0ZXMgPSAweDA0Cj4+IFvCoMKgIDI2
LjE1MTYyNV0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmFkZHIuYnVzd2lkdGggPSAweDAxCj4+
IFvCoMKgIDI2LjE1NzEzMl0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmFkZHIuYnVzd2lkdGgg
PSAweDQwMDAwMDAKPj4gW8KgwqAgMjYuMTYzMDY1XSBzcGktbm9yIHNwaTAuMDogKioqKioKPj4g
W8KgwqAgMjYuMTY2NDAyXSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuZHVtbXkubmJ5dGVzID0g
MHgwMAo+PiBbwqDCoCAyNi4xNzE4MTVdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5kdW1teS5i
dXN3aWR0aCA9IDB4MDAKPj4gW8KgwqAgMjYuMTc3NDA1XSBzcGktbm9yIHNwaTAuMDogKioqKioK
Pj4gW8KgwqAgMjYuMTgwNzM3XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuZGF0YS5idXN3aWR0
aCA9IDB4MDAKPj4gW8KgwqAgMjYuMTg2MjQxXSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuZGF0
YS5uYnl0ZXMgPSAwCj4+IEVyYXNpbmcgMTMxMDcyIEtpYnl0ZSBAIDAgLS0gMTAwICUgY29tcGxl
dGUKPj4KPiAKPiBJdCBsb29rcyBnb29kIC4uLgo+IAo+PiByb290QG1jZGUzMDAwYTp+IyBoZXhk
dW1wIC9kZXYvbXRkMAo+PiAwMDAwMDAwIGExZDQgMTY4YyA0ZGFkIGRmYjIgMmEzZCBjMmFmIDBh
YWUgYzE4YQo+PiAwMDAwMDEwIDJkNWYgMTc3YSBjMzlmIDQ2YTQgZjljZCBiODgwIDMzMWUgMjU0
Mwo+IAo+IGJ1dCB0aGUgcGF0aWVudCBpcyBkZWFkIDopLiBXb3VsZCBiZSBnb29kIGlmIFRha2Fo
aXJvIGNhbiB0ZXN0IG9uIElGWAo+IHRvby4gSW4gdGhlIG1lYW50aW1lIEknbGwgdHJ5IHRvIGZp
bmQgYSBuMjVxMDAsIEkgcmVtZW1iZXIgSSBoYWQgb25lIGluCj4gdGhlIHBhc3QuCgoKTGV0J3Mg
dHJ5IHNvbWV0aGluZyBlbHNlOgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3Jl
LmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwppbmRleCA1NTg0YmY5Y2JmZDEuLmEwYWY3
YTdlYjcyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKKysrIGIvZHJp
dmVycy9tdGQvc3BpLW5vci9jb3JlLmMKQEAgLTEwNzQsNyArMTA3NCw3IEBAIHN0YXRpYyBpbnQg
c3BpX25vcl9lcmFzZV9kaWUoc3RydWN0IHNwaV9ub3IgKm5vciwKbG9mZl90IGFkZHIsIHNpemVf
dCBkaWVfc2l6ZSkKCiAgICAgICAgaWYgKG5vci0+c3BpbWVtKSB7CiAgICAgICAgICAgICAgICBz
dHJ1Y3Qgc3BpX21lbV9vcCBvcCA9Ci0gICAgICAgICAgICAgICAgICAgICAgIFNQSV9OT1JfRElF
X0VSQVNFX09QKG5vci0+cGFyYW1zLT5kaWVfZXJhc2Vfb3Bjb2RlLAorICAgICAgICAgICAgICAg
ICAgICAgICBTUElfTk9SX0RJRV9FUkFTRV9PUChub3ItPmVyYXNlX29wY29kZSwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbm9yLT5hZGRyX25ieXRlcywgYWRk
ciwKbXVsdGlfZGllKTsKCiAgICAgICAgICAgICAgICBzcGlfbm9yX3NwaW1lbV9zZXR1cF9vcChu
b3IsICZvcCwgbm9yLT5yZWdfcHJvdG8pOwoKSSBleHBlY3QgdGhhdCB3aXRoIHRoaXMgdGhlIGZp
cnN0IHNlY3RvciBmcm9tIGVhY2ggZGllIHdpbGwgYmUgZXJhc2VkLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
