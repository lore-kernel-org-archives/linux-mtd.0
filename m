Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1392CC41513
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 12:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrQBzu4XxekEX2VrXZO4XHXn6i5bza0R1HF6ECMD4Dk=; b=NOgpx1y7Bxw/ZW
	U5kKtUZzwtC9pgMq0v///BPlfxRMPnxi+JdiKZxha4N/VTsALb7I8CN5LCr8gqh2ijwrVifCTV1vM
	WoRLcNW6vjOVXKV03II0oXBvkdB2FusHPzvvnxEZ2cLb1eWrrC91gBnWcu4dLuCX5kvN671lYfXTK
	I65a5eSxnCrCkhrhrj6YQOhjtulYpBHHj52M7cWhSNNuqoiJEzE34EnLNPmnuPtBUv5oK/KaR5BgO
	1UvPaw6ygHlIKQDvlTnAt48CUK4m5ANBZcU05lHbcSUaXeM4HxrrQdQUGfhyabI+J68KJQbJV6yjG
	018i3X0lH4Vyra0WVgIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFjk-0049a4-1G;
	Wed, 16 Aug 2023 12:34:56 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFji-0049YE-1a
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 12:34:55 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe85fd3d27so10738150e87.0
        for <linux-mtd@lists.infradead.org>; Wed, 16 Aug 2023 05:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692189290; x=1692794090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yruZKqzLaC+4643Ot4X60prS0Wm0q5EyxySlt1tCThc=;
        b=EY6fQH/mKR7ECTcxYzttcyuzzjs50D7QSork2aIfeBdRu6iYloEudaLTEOl1HxTbbk
         Ht+CJtxx61RMaEakWl0vWkXOg6VcpCgQ16N2oi+WYGcs8RzUqx1xAuVV3QP2jcfs7c5o
         cLOVgpKIh8Lz1iPhQ9hA7pXIcFnCeFjS4xR46NEMMpu3/PYnKAj5/0j/hSOBCZKglrZE
         csUOEkq8P9Yc2GGk2RnGZKuoNGiX8gxYVQmUuJ6JxfcoNeQyIyEdeJ7ShPMU7OdUG+bC
         AcnsUaRVOD/Tw3/e+hc8RJbJqHFLwrULWXWlRIQb072hpFhOTxmnGhNoZiVsdE18wM0E
         dtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692189290; x=1692794090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yruZKqzLaC+4643Ot4X60prS0Wm0q5EyxySlt1tCThc=;
        b=WbI9HCnlieRuaUiutSEFqSjS77mn6YRed+QR38KHedE+DKBo/6WZUGxkd5D+jn7HXo
         zJF8uOWLuds/jUVAs1IBuCHYPQ7tHQkAh6uPaUrCKyuTtrakSPB7J2tga4Sy/mahgSli
         XUPRO07M8etkRwgRlBt6vbxgDnYio7l/cB97X36gIrtmR1GSf1HqzpWCJa1DC88zAaTv
         BXrt+QSxEeMHbwarLPDW0ouMHHc1w/Xcke5Rp9mE1TldeucVLDBVXHSBNCHB6rveE/2u
         cywF4BTqMEbt230op/IwFPMfZrFLmwOtuxMJ/Q6KSPWUnRYMzUcQ70IBxsXsEujjWE+i
         UW7Q==
X-Gm-Message-State: AOJu0YxMPtbTca8SWutUmwP7mcfixag+lF/W7oNDu5UcvtEdZZVywsJC
	/Ckhu8CZjaF7bK6QpMA4Qo/eDA==
X-Google-Smtp-Source: AGHT+IGM+5Kgz2X4N//QD5CWhAuTE4i7Xl3eqvW0P418kkgaL1X4lO0nnZhIcEgVQ6CPLn/Wvn2sLA==
X-Received: by 2002:a19:384a:0:b0:4fb:911b:4e19 with SMTP id d10-20020a19384a000000b004fb911b4e19mr1154375lfj.35.1692189290401;
        Wed, 16 Aug 2023 05:34:50 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.44])
        by smtp.gmail.com with ESMTPSA id y18-20020aa7ccd2000000b005227e53cec2sm8278663edt.50.2023.08.16.05.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 05:34:49 -0700 (PDT)
Message-ID: <0011a25a-e096-73ac-9800-9d8e35efdc8b@linaro.org>
Date: Wed, 16 Aug 2023 13:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2,1/2] mtd: spi-nor: giga: gd25lq64c: Disable quad mode
 according to bus width
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 "Miquel Raynal )" <miquel.raynal@bootlin.com>,
 "Richard Weinberger )" <richard@nod.at>,
 "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230816104245.2676965-1-hsinyi@chromium.org>
 <6702bac712daab13698b9bb9ad81d49e@walle.cc>
 <5911201a-f703-abbd-3c7b-769f70df08a8@linaro.org>
 <80ec748f37f40ae5c3c3c5d1602681b3@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <80ec748f37f40ae5c3c3c5d1602681b3@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_053454_532032_801339BB 
X-CRM114-Status: GOOD (  23.15  )
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

CgpPbiA4LzE2LzIzIDEzOjIyLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEhpLAo+IAo+Pj4gbGlr
ZSBhIGZ1bmRhbWVudGFsIHByb2JsZW0gYW5kIHRoYXQgY29tbWl0IDM5ZDFlMzM0MGM3MyAoIm10
ZDogc3BpLW5vcjoKPj4+IEZpeCBjbGVhcmluZyBvZiBRRSBiaXQgb24gbG9jaygpL3VubG9jaygp
IikgaXMgYnJva2VuIGluIHRoYXQgcmVnYXJkLgo+Pgo+PiB3aGF0J3Mgd3Jvbmcgd2l0aCB0aGUg
bWVudGlvbmVkIGNvbW1pdD8KPiAKPiDCoMKgwqDCoMKgwqDCoCB9IGVsc2UgaWYgKG5vci0+cGFy
YW1zLT5xdWFkX2VuYWJsZSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogSWYgdGhlIFN0YXR1cyBSZWdpc3Rl
ciAyIFJlYWQgY29tbWFuZCAoMzVoKSBpcyBub3QKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqIHN1cHBvcnRlZCwgd2Ugc2hvdWxkIGF0IGxlYXN0IGJlIHN1cmUgd2UgZG9uJ3QK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGNoYW5nZSB0aGUgdmFsdWUgb2Yg
dGhlIFNSMiBRdWFkIEVuYWJsZSBiaXQuCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogV2UgY2FuIHNhZmVseSBh
c3N1bWUgdGhhdCB3aGVuIHRoZSBRdWFkIEVuYWJsZSBtZXRob2QgaXMKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqIHNldCwgdGhlIHZhbHVlIG9mIHRoZSBRRSBiaXQgaXMgb25l
LCBhcyBhIGNvbnNlcXVlbmNlIG9mIHRoZQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICogbm9yLT5wYXJhbXMtPnF1YWRfZW5hYmxlKCkgY2FsbC4KPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBX
ZSBjYW4gc2FmZWx5IGFzc3VtZSB0aGF0IHRoZSBRdWFkIEVuYWJsZSBiaXQgaXMgcHJlc2VudCBp
bgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdGhlIFN0YXR1cyBSZWdpc3Rl
ciAyIGF0IEJJVCgxKS4gQWNjb3JkaW5nIHRvIHRoZSBKRVNEMjE2Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKiByZXZCIHN0YW5kYXJkLCBCRlBUIERXT1JEU1sxNV0sIGJpdHMg
MjI6MjAsIHRoZSAxNi1iaXQKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFdy
aXRlIFN0YXR1cyAoMDFoKSBjb21tYW5kIGlzIGF2YWlsYWJsZSBqdXN0IGZvciB0aGUgY2FzZXMK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGluIHdoaWNoIHRoZSBRRSBiaXQg
aXMgZGVzY3JpYmVkIGluIFNSMiBhdCBCSVQoMSkuCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKi8KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3JfY3JbMV0gPSBT
UjJfUVVBRF9FTl9CSVQxOwo+IMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHNyX2NyWzFdID0gMDsKPiDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4g
IldlIGNhbiBzYWZlbHkgYXNzdW1lIHRoYXQgd2hlbiB0aGUgUXVhZCBFbmFibGUgbWV0aG9kLi4i
LiBXZSBjYW5ub3QsIGlmIHdlCj4gZG9uJ3QgaGF2ZSA0IEkvTyBsaW5lcy4gVGhlIHF1YWRfZW5h
YmxlIGlzIGp1c3QgdGhlIG9wIGhvdyB0byBkbyBpdCwgYnV0IG5vdAo+ICppZiogY2FuIGRvIGl0
LiBJdCBzZWVtcyB0byBiZSBtaXNzaW5nIHRoZSBzYW1lIGNoZWNrIGFzIHRoZQo+IHNwaV9ub3Jf
cXVhZF9lbmFibGUoKS4gQnV0IEknbSBub3Qgc3VyZSBpZiBpdCdzIHRoYXQgc2ltcGxlLgo+IAoK
SSBzZWUuIFRoZW4gZXh0ZW5kaW5nIHRoZSBpZiBjb25kaXRpb24gc2hvdWxkIGRvIHRoZSB0cmlj
aywgYXMKc3BpX25vcl93cml0ZV8xNmJpdF9zcl9hbmRfY2hlY2soKSBpcyBjYWxsZWQgYWZ0ZXIg
c2V0dXAuIFNvbWV0aGluZwpsaWtlOgoKaWYgKHNwaV9ub3JfZ2V0X3Byb3RvY29sX3dpZHRoKG5v
ci0+cmVhZF9wcm90bykgPT0gNCAmJgogICAgc3BpX25vcl9nZXRfcHJvdG9jb2xfd2lkdGgobm9y
LT53cml0ZV9wcm90bykgPT0gNCAmJgogICAgbm9yLT5wYXJhbXMtPnF1YWRfZW5hYmxlKQoKSXMg
dGhpcyB3aGF0IEhzaW4tWWkgaXMgaGl0dGluZz8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
