Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94012C35274
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 22:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lov/RWPaYTQof1K1zgwnp4fFfDrEN5o4yGO9w3cZTls=; b=d98TzCJ+vyF4WJ
	UiiHkSO93DRXG49ZcAvsI7Hx2KnXgtn4hEidOVpgIKGgINS8CTcfzVQKQ8Qx5W4ZYJcDRDNDkL2TO
	assWsCd/3TUoXDaOwuRcadFPUd8HMBCqz6IIGi9CEdVdMnugefaWpl+4nYS69vGgwQVTfIUe2flbr
	EG0PUYO1QQHYeXCcmWhNCtZzjhTojLKdmQBjYYEgyCNdmyTkNMrpRWl/YDSBHkVrPe1iRTtJlf7x6
	9L0wOROBH9nEOOJvL8ECd7LxhuP8ZG7PuHco9gMtCVB/7Ga71yhtCJBVUCDu8XuH411CdAufAhaUf
	tXL/3SXn3suuI6mhE6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLsC-00CDDY-2J;
	Mon, 18 Dec 2023 22:14:04 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLs8-00CDCl-2Y;
	Mon, 18 Dec 2023 22:14:02 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a2330a92ae6so280723266b.0;
        Mon, 18 Dec 2023 14:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702937635; x=1703542435; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b3pE3xgJ4Ga43NcB8fmFEHrOzN3+P+p5+/e02oaAboc=;
        b=mIB6m9VrCvoY0fnfdWczJGDbZPMfLtQnEuL2Y74sDJLx634AWPUV7KdzM7TerZ++9s
         ddbTpIth92itvOpylTBG5kzSXo1IlDBT/DI+AsKKXBZeSHMAHRmCpJ0e/hZL4nxitG68
         Jb4ycTg82urK5QO3iYZ+Gh+cYAxG/4x8/A2STSpJC3PztOARlV6W7jtvCr9fPoi6vcS7
         bOISxVSDsxACAUHvMZlTU2RsA+eTWUjaAl3VfooN3JttW9I4T4WqtZPCwn+D83+V6lHW
         l+Be+FQJTfPmQGbE0HtApk6dniwrFkzbkQsDr5WGdR/Rov1zDRJnLMB/R3b45+cfvn4c
         o2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702937635; x=1703542435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b3pE3xgJ4Ga43NcB8fmFEHrOzN3+P+p5+/e02oaAboc=;
        b=pFMji1QWmhIW97QZBf5gVCjKefd6+l8sHl/kcn+rdHaBosDvua1wEBfIMI3R8EM23V
         fhE4dQYjNOlGKwNGxfCW3vLTIE8igR/0KpfuNS5+wTkM3+M4nYOcCiYKl2dtnwxRt+zd
         ei7alle68cqkQofpHEm9RTthl4N8fyoPJ06M5m+SXVeOL/vUuFsBwDX//dDMRW2m5/Fq
         K88yrisoCpxFM0ZTaa+QYOBgcLzOyyYGDCG9U+jYeGtjwr+xqCSrMML604EJjAP9wIfR
         YvqOkj2xEK4tDoXL+UKqryFnYd6l67xVHWKBOQBRNDvrKdEyaMyWjd51vSX3fomvHsSI
         J/WA==
X-Gm-Message-State: AOJu0YzD+QeYARtTrQ9u7YuEJHoPRY4fwz0Q630o8zrATcXRLANsRDkb
	t9KL2yX6EG5Z6li0k1mgSLc=
X-Google-Smtp-Source: AGHT+IEzAgc0r4/Eycn/fmBbjmEeiAm2EBAahpSSLJ/wbqBmmehAvWVE9DTA5PhXrRJziFX5yn22qQ==
X-Received: by 2002:a17:906:1043:b0:a23:6d24:94cd with SMTP id j3-20020a170906104300b00a236d2494cdmr417718ejj.14.1702937634859;
        Mon, 18 Dec 2023 14:13:54 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id i14-20020a170906a28e00b00a2332116b3esm2965234ejz.152.2023.12.18.14.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 14:13:54 -0800 (PST)
Message-ID: <5cc586e2-c510-42c0-a451-73a8a129a30f@gmail.com>
Date: Mon, 18 Dec 2023 23:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: layouts: add U-Boot environment
 variables layout
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Michael Walle <michael@walle.cc>,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, u-boot@lists.denx.de
References: <20231218133722.16150-1-zajec5@gmail.com>
 <170291091219.3792434.8389294947030479112.robh@kernel.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <170291091219.3792434.8389294947030479112.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_141400_848849_13A4EB3B 
X-CRM114-Status: GOOD (  20.06  )
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

T24gMTguMTIuMjAyMyAxNTo0OCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gCj4gT24gTW9uLCAxOCBE
ZWMgMjAyMyAxNDozNzoxOSArMDEwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+PiBGcm9tOiBS
YWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+Cj4+IFUtQm9vdCBlbnYgZGF0YSBp
cyBhIHdheSBvZiBzdG9yaW5nIGZpcm13YXJlIHZhcmlhYmxlcy4gSXQncyBhIGZvcm1hdAo+PiB0
aGF0IGNhbiBiZSB1c2VkIG9mIHRvcCBvZiB2YXJpb3VzIHN0b3JhZ2UgZGV2aWNlcy4gSXRzIGJp
bmRpbmcgc2hvdWxkCj4+IGJlIGFuIE5WTUVNIGxheW91dCBpbnN0ZWFkIG9mIGEgc3RhbmRhbG9u
ZSBkZXZpY2UuCj4+Cj4+IFRoaXMgcGF0Y2ggYWRkcyBsYXlvdXQgYmluZGluZyB3aGljaCBhbGxv
d3MgdXNpbmcgaXQgb24gdG9wIG9mIE1URCBOVk1FTQo+PiBkZXZpY2UgYXMgd2VsbCBhcyBhbnkg
b3RoZXIuIEF0IHRoZSBzYW1lIHRpbWUgaXQgZGVwcmVjYXRlcyB0aGUgb2xkCj4+IGNvbWJpbmVk
IGJpbmRpbmcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWls
ZWNraS5wbD4KPj4gLS0tCj4+ICAgLi4uL2JpbmRpbmdzL252bWVtL2xheW91dHMvdS1ib290LGVu
di55YW1sICAgIHwgNTUgKysrKysrKysrKysrKysrKysrKwo+PiAgIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFtbCB8ICA2ICsrCj4+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCA2MSBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL3UtYm9vdCxlbnYueWFtbAo+Pgo+IAo+
IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBEVF9DSEVDS0VSX0ZMQUdTPS1tIGR0
X2JpbmRpbmdfY2hlY2snCj4gb24geW91ciBwYXRjaCAoRFRfQ0hFQ0tFUl9GTEFHUyBpcyBuZXcg
aW4gdjUuMTMpOgo+IAo+IHlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoKPiAKPiBkdHNjaGVtYS9k
dGMgd2FybmluZ3MvZXJyb3JzOgo+IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGlu
dXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9vdCxlbnYuZXhh
bXBsZS5kdGI6IHBhcnRpdGlvbkA0MDAwMDogJ2V0aGFkZHInLCAncmVnJyBkbyBub3QgbWF0Y2gg
YW55IG9mIHRoZSByZWdleGVzOiAncGluY3RybC1bMC05XSsnCj4gCWZyb20gc2NoZW1hICRpZDog
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbnZtZW0vbGF5b3V0cy91LWJvb3QsZW52Lnlh
bWwjCj4gL2J1aWxkcy9yb2JoZXJyaW5nL2R0LXJldmlldy1jaS9saW51eC9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVudi5leGFtcGxlLmR0YjogcGFydGl0
aW9uLXUtYm9vdC1lbnY6ICdldGhhZGRyJyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4
ZXM6ICdwaW5jdHJsLVswLTldKycKPiAJZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9udm1lbS9sYXlvdXRzL3UtYm9vdCxlbnYueWFtbCMKCkkgY2hlY2tlZCBt
eSBiaW5kaW5nIGluZGVwZW5kZW50bHkgdXNpbmcgdXNpbmcgZHRfYmluZGluZ19jaGVjayBhbmQK
bWlzc2VkIHRoYXQuIEknbSBub3QgYXdhcmUgb2YgYW55IHdheSBvZiBsaW1pdGluZyBwb3NzaWJp
bGl0eSBvZgphcHBseWluZyBiaW5kaW5nIHRvIHNwZWNpZmljIGNhc2VzIChsaWtlICJudm1lbS1s
YXlvdXQiIG5vZGUpIHNvIEkKZ3Vlc3MgSSdsbCBqdXN0IGhhdmUgdG8gYXZvaWQgZHVwbGljYXRl
ZCAidS1ib290LGVudiIgY29tcGF0aWJsZQpzdHJpbmcuCgoKPiBkb2MgcmVmZXJlbmNlIGVycm9y
cyAobWFrZSByZWZjaGVja2RvY3MpOgo+IAo+IFNlZSBodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvZGV2aWNldHJlZS1iaW5kaW5ncy9wYXRjaC8yMDIzMTIxODEzMzcyMi4xNjE1
MC0xLXphamVjNUBnbWFpbC5jb20KPiAKPiBUaGUgYmFzZSBmb3IgdGhlIHNlcmllcyBpcyBnZW5l
cmFsbHkgdGhlIGxhdGVzdCByYzEuIEEgZGlmZmVyZW50IGRlcGVuZGVuY3kKPiBzaG91bGQgYmUg
bm90ZWQgaW4gKnRoaXMqIHBhdGNoLgo+IAo+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9i
aW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUgYWJvdmUKPiBlcnJvcihzKSwgdGhlbiBt
YWtlIHN1cmUgJ3lhbWxsaW50JyBpcyBpbnN0YWxsZWQgYW5kIGR0LXNjaGVtYSBpcyB1cCB0bwo+
IGRhdGU6Cj4gCj4gcGlwMyBpbnN0YWxsIGR0c2NoZW1hIC0tdXBncmFkZQo+IAo+IFBsZWFzZSBj
aGVjayBhbmQgcmUtc3VibWl0IGFmdGVyIHJ1bm5pbmcgdGhlIGFib3ZlIGNvbW1hbmQgeW91cnNl
bGYuIE5vdGUKPiB0aGF0IERUX1NDSEVNQV9GSUxFUyBjYW4gYmUgc2V0IHRvIHlvdXIgc2NoZW1h
IGZpbGUgdG8gc3BlZWQgdXAgY2hlY2tpbmcKPiB5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVz
dCBiZSB1bnNldCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1hLgo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
