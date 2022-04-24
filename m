Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A1BC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Apr 2022 11:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhxlooOuIe+tQOWAFhN4TGcGSAlFI82vJlUuoDIEipg=; b=1R5dP+XjTKTuOD
	sSsDrY6vE8aobGztP+wROwVS6jeYxn2RxGBglISHSJIyOFIJmRQnymMcZQ9Zfnc6i5dVSGVwVU04N
	wEUyHD/OFF9AA8d1kH9d/1Yi4dLF+CfMRh4h2+YQITPmUtdXKQ0wek/kVfNfQ+b2O9q/Tb5FirI8H
	BmP77VoRO2FC4vty6wnjm5Ax/TktJTcWLuGoE86/EMAJ8u9QilojoI/IB+DeAcM5vR8ZVvK7vl9D2
	+UldEGncaYjDrkDAu2Y2wsY/lKh2G059hpHT4wQUqlv1dHNSNG8GPOUMMtW2sAh1J20ZZ7DYH7Odj
	H2Ws0fy0niaP2G1Mq4hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nia4z-006SQU-0I; Sun, 24 Apr 2022 11:07:01 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nia4v-006SPu-Kd
 for linux-mtd@lists.infradead.org; Sun, 24 Apr 2022 11:06:59 +0000
Received: by mail-ed1-x52a.google.com with SMTP id p18so10188942edr.7
 for <linux-mtd@lists.infradead.org>; Sun, 24 Apr 2022 04:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BQJA6nUIX5U8cWUg1zwc+QJKGausv/CFbILnPF0Ez2M=;
 b=TiCFeXCR158jGe6MgSNvATJdfqEPW4ddk3h387Z22CrWXLZTZMawq+LxF3P1K1ldzU
 FGqnsxoO/YsH3LHfMOovysGhCjJeV8L8yH/a0BJFFkHgbGqJuPwW4mg6nvkDPoqU1poO
 u1JBQjwUTuNk18BM3qCnUAFZr2zi9Grv3cjopkwd2j4Yojdkmbq+UsmoOZ6B+vastz+P
 XMrKwMPEA7YJiIrufMAauMs1TngHtNDAyPwe3ElxmUyH88A6lI5k0WbCX09m54jr1jJy
 sHixjchVXt2RvgZOHDcL0eCQsHmD+/K38l6EfHDub4NqTX7a2+xz6xYAeSNhefZNIIty
 E27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BQJA6nUIX5U8cWUg1zwc+QJKGausv/CFbILnPF0Ez2M=;
 b=40Q0u3tPTTcJdefCWqhWFcyKMjM71Ag9eV5r0aqw3+CDaqGF8JH5+MkTrTfUyj3R/2
 44GgQxXGEf54geO0S24RwkUfXdKPjcjkKtR/5Gy3iAiTd3RXl8dvdvFn55khWdn/YAjO
 qCVnfOoloM5YqjMyf3N0usEjpeh1cCBkTDBydemLZseti2WRym1PC+qtBdGmZRpJOHWD
 5EbcJVtIBKd8cuyaMZYBlgZ93I1eG9rLfatNPUImy6wzWpRo/d7mIlINnMGJWIh63EHq
 keKZ9uGHoCJ8BVJPND8wS1JU0GG/icrnXBY5dLRJvVUNDmCODeq9+uEjsjYlcop7hQZ2
 WwNA==
X-Gm-Message-State: AOAM530KmZRnHDloJNftMSkN18LM0C9o1PVz1q6tWRMLLT0hYXC4IUij
 GVm1NFEt+wn7l2wv3LEaU6zeCw==
X-Google-Smtp-Source: ABdhPJx2FujwjBjsDsEU5lcXcSAtwi6HcCA5hKnVSEAerKFX/UGVfUzJowK5cbQEk40H6/uJKn4qiw==
X-Received: by 2002:a50:d707:0:b0:425:e37d:4ef3 with SMTP id
 t7-20020a50d707000000b00425e37d4ef3mr1346882edi.167.1650798416453; 
 Sun, 24 Apr 2022 04:06:56 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 z61-20020a509e43000000b00425e4d583e4sm63517ede.87.2022.04.24.04.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 04:06:56 -0700 (PDT)
Message-ID: <32507f1d-b650-e2c9-2f04-1ac63c6774ec@linaro.org>
Date: Sun, 24 Apr 2022 13:06:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/5] mtd: onenand: samsung: Make sure that bus clock is
 enabled
Content-Language: en-US
To: Jonathan Bakker <xc-racer2@live.ca>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
References: <20220423034524.366612-1-xc-racer2@live.ca>
 <20220423034622.366696-1-xc-racer2@live.ca>
 <CY4PR04MB056777077970A6935BC6349BCBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CY4PR04MB056777077970A6935BC6349BCBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_040657_722769_63E750AD 
X-CRM114-Status: GOOD (  23.30  )
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

T24gMjMvMDQvMjAyMiAwNTo0NiwgSm9uYXRoYW4gQmFra2VyIHdyb3RlOgo+IEZyb206IFRvbWFz
eiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGRzIGJhc2lj
IGhhbmRsaW5nIG9mIGNvbnRyb2xsZXIgYnVzIGNsb2NrIHRvIG1ha2Ugc3VyZSB0aGF0Cj4gaW4g
ZGV2aWNlIHByb2JlIGl0IGlzIGVuYWJsZWQgYW5kIGRldmljZSBjYW4gb3BlcmF0ZSBjb3JyZWN0
bHkuIFRoZQo+IGNsb2NrIGlzIG9wdGlvbmFsIGFuZCBkcml2ZXIgYmVoYXZpb3IgaXMgaWRlbnRp
Y2FsIGFzIGJlZm9yZSB0aGlzIHBhdGNoCj4gaWYgbm90IHByb3ZpZGVkLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogUGF3ZcWCIENobWllbCA8cGF3ZWwubWlrb2xhai5jaG1pZWxAZ21haWwuY29tPgo+IFJldmll
d2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEpvbmF0aGFuIEJha2tlciA8eGMtcmFjZXIyQGxpdmUuY2E+Cj4gLS0tCj4gIGRy
aXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX3NhbXN1bmcuYyB8IDggKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9zYW1zdW5nLmMgYi9kcml2ZXJzL210ZC9uYW5kL29u
ZW5hbmQvb25lbmFuZF9zYW1zdW5nLmMKPiBpbmRleCBhM2VmNGFkZDg2NWEuLjYyMDE0ZjhkMjdi
NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9zYW1zdW5n
LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9zYW1zdW5nLmMKPiBA
QCAtMTEsNiArMTEsNyBAQAo+ICAgKglTNVBDMTEwOiB1c2UgRE1BCj4gICAqLwo+ICAKPiArI2lu
Y2x1ZGUgPGxpbnV4L2Nsay5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+
Cj4gQEAgLTEyMiw2ICsxMjMsNyBAQCBlbnVtIHNvY190eXBlIHsKPiAgc3RydWN0IHMzY19vbmVu
YW5kIHsKPiAgCXN0cnVjdCBtdGRfaW5mbwkqbXRkOwo+ICAJc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZQkqcGRldjsKPiArCXN0cnVjdCBjbGsJKmNsa19idXM7Cj4gIAllbnVtIHNvY190eXBlCXR5cGU7
Cj4gIAl2b2lkIF9faW9tZW0JKmN0cmxfYmFzZTsKPiAgCXZvaWQgX19pb21lbQkqY2hpcF9iYXNl
Owo+IEBAIC05MTQsNiArOTE2LDEwIEBAIHN0YXRpYyBpbnQgczNjX29uZW5hbmRfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQl9Cj4gIAl9Cj4gIAo+ICsJb25lbmFuZC0+
Y2xrX2J1cyA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCAiYnVzIik7CgpJZiBpdCBpcyBvcHRp
b25hbCwgdXNlIG9wdGlvbmFsIGNsayBBUEkuCgo+ICsJaWYgKCFJU19FUlIob25lbmFuZC0+Y2xr
X2J1cykpCj4gKwkJY2xrX3ByZXBhcmVfZW5hYmxlKG9uZW5hbmQtPmNsa19idXMpOwo+ICsKPiAg
CWVyciA9IG9uZW5hbmRfc2NhbihtdGQsIDEpOwo+ICAJaWYgKGVycikKPiAgCQlyZXR1cm4gZXJy
OwoKRXJyb3IgcGF0aHMgbm90IHVwZGF0ZWQuCgpBbHNvIHdoYXQgYWJvdXQgb3RoZXIgY2xvY2tz
PwoKSSBwcm9wb3NlIHlvdSBzaG91bGQgdGFrZSBvdmVyIHRoZSBhdXRob3JzaGlwIG9mIHRoZSBw
YXRjaCBiZWNhdXNlIGl0CndpbGwgYmUgbW9yZSBjaGFuZ2VzLgoKPiBAQCAtOTQ1LDYgKzk1MSw4
IEBAIHN0YXRpYyBpbnQgczNjX29uZW5hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gIAlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBk
ZXYpOwo+ICAKPiAgCW9uZW5hbmRfcmVsZWFzZShtdGQpOwo+ICsJaWYgKCFJU19FUlIob25lbmFu
ZC0+Y2xrX2J1cykpCj4gKwkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG9uZW5hbmQtPmNsa19idXMp
Owo+ICAKPiAgCXJldHVybiAwOwo+ICB9CgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
