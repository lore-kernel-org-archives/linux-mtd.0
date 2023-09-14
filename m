Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21471EEAA71
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 21:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UkJvg+VMcPkVbnVqg282ZBSK3vjZ6ncU2xKUdoNCuk=; b=eszgxTvRVeL11k
	f+Hke1V/97HlpU7cXuXhB0bSaVAimQDEUyvOg428UjodFTkpGsEu0XbwSgLWuGxfFHF6i58ejDLwR
	gWSXGxxyuIyBYbuviw8+/q/KJM0HoTutlSuLYw1bQOlZLvcHhbeRq7oTkxs3PtuxwrLyFgW9iOcjZ
	IElt/GSBNmcO5IGdIJeMQsS1dnMony0uVuV7MyZylRRpZTB9kw7IyjKq/Nt/hCk/zc2fB3+AWZIT7
	wiRfHYJQXkva7oWyMoEA+IV5R3B60J3cNJ7xOZinlmcg3VrNFXxJNH+d5MvtJbdn295La7yn/4iJr
	g6vg8UcWotflgRqiyIDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgtrY-009JSg-0T;
	Thu, 14 Sep 2023 21:27:00 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgtrT-009JRx-1c;
	Thu, 14 Sep 2023 21:26:56 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c337aeefbdso13099635ad.0;
        Thu, 14 Sep 2023 14:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694726812; x=1695331612; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4LzmTOuTIv4VUvVsi7SsAaofqZS+sUeMRVa500GSkmc=;
        b=qGrK58x5+hQHWr9C2KRrMjjYIbmn7Vxnxy4CGwizaAMyb50rMxQVo+bkWRcG4kNTN0
         tHCvjZzIAaMbfNVjMA9UMnZt5fcDpRNksbeepYX4PSyac8SjH1Cq5pb7ajkHGM4/Jam8
         tBr9VeQoom7NIgB4lCe+UXg62onzJ0AIS3b5jG5/eNyjSc5ewi15JZXYCHRhDe1oPBRV
         0U89sNu3npkp7YubcD3F6O4bZiLi3gillpW8aHfiGi1axndLZaxsZbHlpOrxptWu0kk7
         T6VUQ9YfuP7Qsnk6q3c/7OlZsAKsCV2HW2z9dwliIsjumzCN0tRZ2gfxUcuuG3aV335d
         yOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694726812; x=1695331612;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LzmTOuTIv4VUvVsi7SsAaofqZS+sUeMRVa500GSkmc=;
        b=SKlXcQh4WbWWuqQLbTlFoAEEsQum1sL6APDpkTwdxboe3HbH9PZ9to2J+P1kUBVC2g
         NvWeOUYHz0AbDKZ66pYTSpTNSIaAvtPBgg/us9modqP0PZYeI5rzVAXnKe6nkCReqmkT
         POmSy2uEZITPHSrPllsyY5fYjQRQjtMLgRuFb+5UwsUu0UnjVAFIvNs2VrhpSebi/ucs
         PUeQwHgAke16hgmmK1QNb90YBXpqYDUb/kF7OvmeSPa32MbyTgXSH1lhnvNl2bTjgyzo
         JWS/EtUYg/h/VFzyguAlOPDIm6Ufhr1Gf8Lq20DTVFeqjnJFk/civr8j3WaKXgJDfRX1
         UPzw==
X-Gm-Message-State: AOJu0Yx3VHT9yprRKPE4ObGpBz5mcr5IO1RknXpg35inv+cgtcTHlL/H
	UchxTFgJZdDQBWCFIXdb/6D98YfJkQwbFt5f
X-Google-Smtp-Source: AGHT+IE+kK/pe/5lufgYlyWCWF0r0Fpfv/VUwKNXVhZf+3vP28c26HPOiGWc55UyABMSmfYOEfyL7A==
X-Received: by 2002:a17:902:b602:b0:1b3:d4d5:beb2 with SMTP id b2-20020a170902b60200b001b3d4d5beb2mr6700103pls.9.1694726812032;
        Thu, 14 Sep 2023 14:26:52 -0700 (PDT)
Received: from [10.67.51.148] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id u10-20020a17090341ca00b001bbb7af4963sm2030920ple.68.2023.09.14.14.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 14:26:51 -0700 (PDT)
Message-ID: <28fad55f-1253-deb2-9615-b32746129664@gmail.com>
Date: Thu, 14 Sep 2023 14:26:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] nvmem: brcm_nvram: store a copy of NVRAM content
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <scott.branden@broadcom.com>
References: <20230914064922.3986-1-zajec5@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230914064922.3986-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_142655_546256_3F60A036 
X-CRM114-Status: GOOD (  13.54  )
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

T24gOS8xMy8yMyAyMzo0OSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEZyb206IFJhZmHFgiBN
acWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBUaGlzIGRyaXZlciB1c2VzIE1NSU8gYWNj
ZXNzIGZvciByZWFkaW5nIE5WUkFNIGZyb20gYSBmbGFzaCBkZXZpY2UuCj4gVW5kZXJuZWF0aCB0
aGVyZSBpcyBhIGZsYXNoIGNvbnRyb2xsZXIgdGhhdCByZWFkcyBkYXRhIGFuZCBwcm92aWRlcwo+
IG1hcHBpbmcgd2luZG93Lgo+IAo+IFVzaW5nIE1NSU8gaW50ZXJmYWNlIGFmZmVjdHMgY29udHJv
bGxlciBjb25maWd1cmF0aW9uIGFuZCBtYXkgYnJlYWsgcmVhbAo+IGNvbnRyb2xsZXIgZHJpdmVy
LiBJdCB3YXMgcmVwb3J0ZWQgYnkgbXVsdGlwbGUgdXNlcnMgb2YgZGV2aWNlcyB3aXRoCj4gTlZS
QU0gc3RvcmVkIG9uIE5BTkQuCj4gCj4gTW9kaWZ5IGRyaXZlciB0byByZWFkICYgY2FjaGUgYWxs
IE5WUkFNIGNvbnRlbnQgZHVyaW5nIGluaXQgYW5kIHVzZSB0aGF0Cj4gY29weSB0byBwcm92aWRl
IE5WTUVNIGRhdGEgd2hlbiByZXF1ZXN0ZWQuCj4gCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtbXRkL0NBQ25hNnJ3ZjNfOVFWalljTSs4NDdiaVRYPUswRW9XWHVYY1NNa0pP
MVZ5XzV2bVZxQUBtYWlsLmdtYWlsLmNvbS8KPiBDYzogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5h
bEBhcmluYzkuY29tPgo+IENjOiBGbG9yaWFuIEZhaW5lbGxpIDxmbG9yaWFuLmZhaW5lbGxpQGJy
b2FkY29tLmNvbT4KPiBDYzogU2NvdHQgQnJhbmRlbiA8c2NvdHQuYnJhbmRlbkBicm9hZGNvbS5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+
IC0tLQpbc25pcF0KPiAtCXByaXYtPmJhc2UgPSBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1h
cF9yZXNvdXJjZShwZGV2LCAwLCAmcmVzKTsKPiAtCWlmIChJU19FUlIocHJpdi0+YmFzZSkpCj4g
LQkJcmV0dXJuIFBUUl9FUlIocHJpdi0+YmFzZSk7Cj4gKwliYXNlID0gZGV2bV9wbGF0Zm9ybV9n
ZXRfYW5kX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCwgJnJlcyk7Cj4gKwlpZiAoSVNfRVJSKGJh
c2UpKQo+ICsJCXJldHVybiBQVFJfRVJSKGJhc2UpOwo+ICsKPiArCXByaXYtPnNpemUgPSByZXNv
dXJjZV9zaXplKHJlcyk7Cj4gKwo+ICsJcHJpdi0+ZGF0YSA9IGRldm1fa3phbGxvYyhkZXYsIHBy
aXYtPnNpemUsIEdGUF9LRVJORUwpOwoKVGhlc2UgY2FuIGNvbmNlaXZhYmx5IHF1aXRlIGJpZyBk
YXRhIHN0cnVjdHVyZXMsIGhvdyBhYm91dCB1c2luZyBrdm1hbGxvYygpPwotLSAKRmxvcmlhbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
