Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5DAC4321E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Nov 2022 08:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mL48OTbxGUSki+V3y9tWwstYcCKgnqLRxIGp6td3Mo4=; b=ZqaOW+YDdtArPF
	vi4fd9r4BAGOEhCkUtJzSMplZLvjkxRwXWrk8qxBOgOrn3bdzYQSPfHHix/7VETE2eptveUcbi+KR
	w4Lsq1da8iaU3tV9fuACPAj/MfvsTILOw9HhugJpvQNyjLatFpUhWLAdxZjY0tOFBDoqbNZwZKS3J
	vWvBvSe/r2nWlk5fdvVybnXxgEMgO9C6eEHOln8V+tghIhxJyA2vJ82wY/uo24OGy7do5zJRdGR7q
	Z0ExiMCuo2FJmLeVHGtUBU3qRhm4X1d17h4+lyuUGRy4Lt+wtk4n3ucdJ0mV/EVh6eYlgRcF5F9wl
	nAOKdQfT6Le+tDUiuI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IZG-00Eaan-K2; Wed, 30 Nov 2022 08:35:46 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IYe-00Ea7Y-7T
	for linux-mtd@lists.infradead.org; Wed, 30 Nov 2022 08:35:11 +0000
Received: by mail-lj1-x235.google.com with SMTP id l8so20027902ljh.13
        for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2022 00:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcyWsekNpjW83jaBV4h3bWe3M3a62T4akctRwJN9qQw=;
        b=xxygHrVudH/jRn0zVZTJRKc+hk75Z//tJLTCgljOhPvuK4wDPJOhwCxdNjLllI+bKZ
         ORhapHPhNmP3+zRihBWBONgRqaHLXF5NjioBc83wTFDobjePOPwzfRzdH+Ym99XQtxrJ
         iHLZMR49Gxtzee5/M0vkXrN7WpfCZqqnHSJ0aleb1a4dmmrhfvIkn7K1AQXFxgrDaN9p
         Mh6v9aRVqEcjSavFC1xluoh/eg+3ymaf5XEP1zOOYWpvhk/1cWqqqMzeihAedfidWP3X
         koyUyxpmrFjPI1p7hxX9Rb2sdCwc86M2adQctegd+VwosMptsH+4zyVHGj/dZxmwDzHA
         vsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcyWsekNpjW83jaBV4h3bWe3M3a62T4akctRwJN9qQw=;
        b=OU8RTlUVMF433S0erdntyXkx2HnGRpSUoWVrlxBr5z041bsQ0SEB3CYQYEV0USYo5h
         MXiggVwGc/bNXkJFDVhp2VVHs17RTi1oD+rBNR9HHUUdM1ZyJje+6sqNuIJBKMIGyYnS
         GGCnTFEHPNXbYJvNPCNp3tyCetH+kmF6s0kzvG/LdTJ+tSzzI61yPf57f15cA/6WqaUn
         EFg9vjrEvYANQs6cTj8oXZTCnu5jAZB64NLd7qmrRV+B45dzCdTv2TPUZ/4ZaWKzLFoC
         LprTdwBTGuAGgrcKBcRTV8+F177g0i+5in+I16hQmChrX3PwSECsyiK4u99Fe8HAKHEK
         UNUQ==
X-Gm-Message-State: ANoB5pmZ5FH+FOqwyMziVRtzWp3PRmy6/Hn7UceuoNzPFxhttyezs7Ie
	koGT/V1xzb6Q/eBpRaH0vnCMtg==
X-Google-Smtp-Source: AA0mqf4U+gFSGMAw9tW/t9ns6UxsiuwlvarT6QZfwU3S1rmz5GnvBtFX9HqRwIDY6T3CdKG32JHOFw==
X-Received: by 2002:a2e:592:0:b0:279:c85d:43da with SMTP id 140-20020a2e0592000000b00279c85d43damr295192ljf.435.1669797305804;
        Wed, 30 Nov 2022 00:35:05 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u13-20020a05651206cd00b0049fbf5facf4sm167617lff.75.2022.11.30.00.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 00:35:05 -0800 (PST)
Message-ID: <bc356f96-600a-64df-c0fe-00c807fa605c@linaro.org>
Date: Wed, 30 Nov 2022 09:35:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 7/9] dt-bindings: spi: mtk-snfi: add two timing delay
 property
Content-Language: en-US
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
 <20221128020613.14821-8-xiangsheng.hou@mediatek.com>
 <9985d44e-977e-d7ea-0932-4879a3ccd14d@linaro.org>
 <f83184ae803dbe0afd37a31a8a83a369a9772880.camel@mediatek.com>
 <08ebc76a-0220-f984-b546-23dba8677be9@linaro.org>
 <741d7ce16df25450b08c92e508190bc7c91fc8d9.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <741d7ce16df25450b08c92e508190bc7c91fc8d9.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_003508_320760_911EF4FC 
X-CRM114-Status: GOOD (  13.49  )
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

T24gMzAvMTEvMjAyMiAwOToxOCwgWGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCkgd3JvdGU6Cj4g
SGkgS3J6eXN6dG9mLAo+IAo+IE9uIFR1ZSwgMjAyMi0xMS0yOSBhdCAwODo0NyArMDEwMCwgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMjkvMTEvMjAyMiAwMzo1MCwgWGlhbmdzaGVu
ZyBIb3UgKOS+r+elpeiDnCkgd3JvdGU6Cj4+Cj4+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zcGkvbWVkaWF0ZWssc3BpLW10ay0KPj4+Pj4gc25maS55YW1sCj4+
Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvbWVkaWF0ZWss
c3BpLW10ay0KPj4+Pj4gc25maS55YW1sCj4+Pj4+IEBAIC01NSw2ICs1NSwyMiBAQCBwcm9wZXJ0
aWVzOgo+Pj4+PiAgICAgIGRlc2NyaXB0aW9uOiBkZXZpY2UtdHJlZSBub2RlIG9mIHRoZSBhY2Nv
bXBhbnlpbmcgRUNDCj4+Pj4+IGVuZ2luZS4KPj4+Pj4gICAgICAkcmVmOiAvc2NoZW1hcy90eXBl
cy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlCj4+Pj4+ICAKPj4+Pj4gKyAgcngtc2FtcGxlLWRl
bGF5Ogo+Pj4+Cj4+Pj4gTm8sIHVzZSBleGlzdGluZyBwcm9wZXJ0eSwgZG9uJ3QgaW52ZW50IHlv
dXIgb3duIHN0dWZmIC0gbWlzc2luZwo+Pj4+IHVuaXQKPj4+PiBzdWZmaXguIFNlZSBzcGktcGVy
aXBoZXJhbC1wcm9wcy55YW1sLgo+Pj4KPj4+IFdpbGwgY2hhbmdlIHRvIG90aGVyIHByaXZhdGUg
cHJvcGVydHkuIFRoZSByZWFkIHNhbXBsZSBkZWxheSB3aXRoCj4+PiBNZWRpYVRlayBTUEkgTkFO
RCBjb250cm9sbGVyIGNhbiBiZSBzZXQgd2l0aCB2YWx1ZXMgZnJvbSAwIHRvIDQ3Lgo+Pj4gSG93
ZXZlciwgaXRgcyBkaWZmaWN1bHQgdG8gc2F5IHRoZSB1bml0IG9mIGVhY2ggdmF1bGUsIGJlY2F1
c2UgdGhlCj4+PiB1bml0Cj4+PiB2YWx1ZSB3aWxsIGJlIGRpZmZlcmVuY2Ugd2l0aCBkaWZmZXJl
bnQgY2hpcCBwcm9jZXNzIG9yIGRpZmZlcmVudAo+Pj4gY29ybmVyIElDLgo+Pgo+PiBXaHkgeW91
IGNhbm5vdCB1c2Ugc2FtZSBmb3JtdWxhIGFzIG90aGVyIFNQSSBkcml2ZXJzIGZvciBzYW1wbGUt
Cj4+IGRlbGF5Pwo+PiBBbmQgZGl2aWRlL211bHRpcGxlIGJ5IHNvbWUgZmFjdG9yIHNwZWNpZmlj
IHRvIFNvQywgd2hpY2ggaXMgdGFrZW4KPj4gZnJvbQo+PiBkcml2ZXJfZGF0YT8KPiAKPiBFdmVu
IGZvciBzcGVjaWZpYyBTb0MsIHRoZSB1bml0IG9mIHNhbXBsZSBkZWxheSBtYXkgYmUgdmFyaW91
cyB3aXRoCj4gZGlmZmVyZW50IGNvcm5lciBJQy4KCldoaWNoIGlzIGVhc3kgdG8gYWNoaWV2ZSB3
aXRoIGRyaXZlcl9kYXRhIGFzIEkgc2FpZC4KCj4gQmVzaWRlcywgd2hldGhlciBpdGBzIGFjY2Vw
dGFibGUgYnkgY2hhbmdlIHRoZSBwcm9wZXJ0eSByeC1zYW1wbGUtZGVsYXkgCj4gYW5kIHJ4LWxh
dGNoLWxhdGVuY3kgdG8gbWVkaWF0ZWsscngtc2FtcGxlLWRlbGF5IGFuZCBtZWRpYXRlayxyeC1s
YXRjaC0KPiBsYXRlbmN5PwoKTm90IGZvciBzYW1wbGUgZGVsYXksIGJlY2F1c2UgeW91IHNob3Vs
ZCB1c2UgZXhpc3RpbmcgcHJvcGVydGllcy4gWW91cgpkcml2ZXIgaW1wbGVtZW50YXRpb24gaXMg
bm90IHVzdWFsbHkgYXJndW1lbnQgdG8gZHVwbGljYXRlIHByb3BlcnRpZXMgaW4KdGhlIGJpbmRp
bmdzLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
