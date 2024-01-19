Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1A9C4725D
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jan 2024 08:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vU0BfWcXPn+wX9wsbyqIBDZtr0hNw/BGCgBCbqX8ne0=; b=Fv5sbRc2kShr5G
	i9P34gg0zrfqgKFw1Cng+HCgLSn5Rtk0PwvPEtancgZuSBpOsakJl73dwidCH9Nx0r29j1UOHLUtR
	9MeUsoZUFlCJm0sIkyRZBLF97pMBC4Mh0YOMz+cWBRgsiXzbhshxU1Gra9715G7/+DWgMBGxaklxJ
	93+sgFRp5UqvEcMiShmNdEKACtCXtFiWS9UO6K8jZqXpLUiBY6rsoAbSeqggWrn/5wo0LOVmRVTwK
	zaVO0DhoDQuzQStZqIsZK0Pw49xfe1kIAljm6a7zhgkszvfafOx/9VtRgXkMdp9vDVre0fprbcnsF
	0sBj50FowfIPQz0JQB6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkLX-004qud-0g;
	Fri, 19 Jan 2024 08:35:27 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkLU-004quD-29
	for linux-mtd@lists.infradead.org;
	Fri, 19 Jan 2024 08:35:26 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d5f1e0e32eso3304475ad.3
        for <linux-mtd@lists.infradead.org>; Fri, 19 Jan 2024 00:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705653324; x=1706258124; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehtwb0D2dj+M5rS1gm3LA824BSX7c5AQtzLup/md9s0=;
        b=X3vbwQXvDH5aYEt1eJkqUhL/NLk44f3HhF2zuZNl3EjfRpbFYzhGKVdfzTmHVVOzmH
         jcVeHqwqedKMWJzxlKZYPux2yp/8msoZG6RwOk/bXuDei/CSyiLUBhuYQH8ozYBY+h9b
         ++gnd+pm/Qhi5gXA5INnsNLFdgVw1uTO9ZWK0NZr9kGFoEnpKyiBrnw8u932xsj0WLjU
         HKxLdEBkqSoAO8+x8vmGadTreglNJHplSKNccH2DJew1tjkbQoeZKkiWIrpU+jG8Lz0w
         YZE0z9EyEb71mi2KHsIovGDEFePK+qnvxjivHoERQjCSeEJk3w4Z+11BoN4BgQVrRHFO
         mNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705653324; x=1706258124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehtwb0D2dj+M5rS1gm3LA824BSX7c5AQtzLup/md9s0=;
        b=i6OuuVaahHkbX50CitdKfWWVMeVRbJKuGCxhi03z3Qb+dD2iPFhdIc6Y/3H9ce+ZVU
         cLUyAT5pAwo1IJNzwT1L58RYJCEMX7144xW9FRkZRsoraZNEmjdkmaRLWdp4FGJVxY/N
         qGOt3GBOhMvtO2qQVxAhZiBPTKBy3cAfI/xlXoWBUk3DbxZglBDnxxgoNfYmtVozJi5m
         VlXvetKqtYJHfiD7375Sx1FlPUwwgDS2KwS2kPHhuSYPvzG+JHG3xHPSucJFgvEDvQ7u
         tOlAQ61eBQUYV2s1LUtRgFZY9cIBpsMrb6RsEm5gvWHCgpsKTjy0C7DN7iHhXFRIp+Xo
         +2xw==
X-Gm-Message-State: AOJu0Yzog1pjd4XjopcFakkOiRTf4xNpuWcZq3c+n06dV/eRpX7kcP16
	luS0vmQbboMKwcdtAvpgZwJI+ru779jZMudxfGdPf+1sAB/GNXSwSao+jk3g
X-Google-Smtp-Source: AGHT+IGlZQjQcfKsksgsq47YTSIKs9U7WxuvlhFrlbgB20z0MNfmKF3z2j5r255t1KLMzXSCT4SKZA==
X-Received: by 2002:a17:902:7009:b0:1d6:fe87:4d4e with SMTP id y9-20020a170902700900b001d6fe874d4emr1767776plk.120.1705653323846;
        Fri, 19 Jan 2024 00:35:23 -0800 (PST)
Received: from [192.168.0.9] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id u9-20020a170903124900b001d60a705628sm2516942plh.246.2024.01.19.00.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 00:35:23 -0800 (PST)
Message-ID: <7212c5b5-cb81-409d-bc2b-1d9ab5c094bf@gmail.com>
Date: Fri, 19 Jan 2024 17:35:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: Set mtd->eraseregions for non-uniform
 erase map
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
 <740bf235110e05eae9ec7768603e6e2a@walle.cc>
 <d9cf5631-951e-45a0-930f-cc3afac05df9@gmail.com>
 <d63b6363-2d90-4fed-97c3-be69948aae57@gmail.com>
 <de7d244c-9e0b-4d8b-a04b-e3c701cdec7c@linaro.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <de7d244c-9e0b-4d8b-a04b-e3c701cdec7c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_003524_706197_1A0CEEFF 
X-CRM114-Status: GOOD (  22.25  )
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

T24gMS8xOS8yMDI0IDM6NTUgUE0sIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gCj4gCj4gT24gMS8x
OS8yNCAwNjoyOSwgVGFrYWhpcm8gS3V3YW5vIHdyb3RlOgo+PiBPbiAxLzEyLzIwMjQgNDoxNCBQ
TSwgVGFrYWhpcm8gS3V3YW5vIHdyb3RlOgo+Pj4gT24gMS81LzIwMjQgOToyMyBQTSwgTWljaGFl
bCBXYWxsZSB3cm90ZToKPj4+PiBIaSwKPj4+Pgo+Pj4+PiAtc3RhdGljIHZvaWQgc3BpX25vcl9z
ZXRfbXRkX2luZm8oc3RydWN0IHNwaV9ub3IgKm5vcikKPj4+Pj4gK3N0YXRpYyBpbnQgc3BpX25v
cl9zZXRfbXRkX2VyYXNlcmVnaW9ucyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+Pj4+PiArewo+Pj4+
PiArwqDCoMKgIHN0cnVjdCBzcGlfbm9yX2VyYXNlX21hcCAqbWFwID0gJm5vci0+cGFyYW1zLT5l
cmFzZV9tYXA7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IHNwaV9ub3JfZXJhc2VfcmVnaW9uICpyZWdp
b24gPSBtYXAtPnJlZ2lvbnM7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IG10ZF9pbmZvICptdGQgPSAm
bm9yLT5tdGQ7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IG10ZF9lcmFzZV9yZWdpb25faW5mbyAqbXRk
X3JlZ2lvbjsKPj4+Pj4gK8KgwqDCoCB1MzIgZXJhc2Vfc2l6ZTsKPj4+Pj4gK8KgwqDCoCB1OCBl
cmFzZV9tYXNrOwo+Pj4+PiArwqDCoMKgIGludCBuX3JlZ2lvbnMsIGksIGo7Cj4+Pj4+ICsKPj4+
Pj4gK8KgwqDCoCBmb3IgKGkgPSAwOyAhc3BpX25vcl9yZWdpb25faXNfbGFzdCgmcmVnaW9uW2ld
KTsgaSsrKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgOwo+Pj4+Cj4+Pj4gUGxlYXNlIHB1dCB0aGF0
IGludG8gYSBoZWxwZXIgd2hpY2ggcmV0dXJucyB0aGUgbnVtYmVyIG9mIHJlZ2lvbnMuCj4+Pj4K
Pj4+IFllcywgSSB3aWxsIGRvIGl0Lgo+Pj4KPj4+PiBGV0lXLCBJIHJlYWxseSBkaXNsaWtlIHRo
ZSBtYWdpYyBhcm91bmQgZW5jb2RpbmcgYWxsIHNvcnRzIG9mIHN0dWZmCj4+Pj4gaW50byB0aGUg
b2Zmc2V0LiBJdCBtYWtlcyB0aGUgY29kZSBqdXN0IGhhcmQgdG8gcmVhZC4KPj4+Pgo+Pj4+Cj4+
Pj4+ICsKPj4+Pj4gK8KgwqDCoCBuX3JlZ2lvbnMgPSBpICsgMTsKPj4+Pj4gK8KgwqDCoCBtdGRf
cmVnaW9uID0gZGV2bV9rY2FsbG9jKG5vci0+ZGV2LCBuX3JlZ2lvbnMsIHNpemVvZigqbXRkX3Jl
Z2lvbiksCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9LRVJO
RUwpOwo+Pj4+Cj4+Pj4gV2hvJ3MgdGhlIG93bmVyPyBtdGQtPmRldiBvciBub3ItPmRldj8KPj4+
Pgo+Pj4gSSB0aGluayBpdCBzaG91bGQgYmUgbm9yLT5kZXYuCj4+PiBUaGUgbXRkIGRldmljZSBp
cyBub3QgeWV0IHJlZ2lzdGVyZWQgYXQgdGhpcyBwb2ludC4KPj4+Cj4+Pj4+ICvCoMKgwqAgaWYg
KCFtdGRfcmVnaW9uKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4+Pj4+
ICsKPj4+Pj4gK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgbl9yZWdpb25zOyBpKyspIHsKPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGlmIChyZWdpb25baV0ub2Zmc2V0ICYgU05PUl9PVkVSTEFJRF9SRUdJ
T04pIHsKPj4+Pgo+Pj4+IEJ0dy4gd2hhdCBpcyBhbiBvdmVybGFpZCByZWdpb24/IEkgY291bGRu
J3QgZmluZCBhbnkgY29tbWVudAo+Pj4+IGFib3V0IGl0Lgo+Pj4+Cj4+PiBJdCBpcyB0aGUgcmVt
YWluaW5nIHBhcnQgb2YgcmVndWxhciBzZWN0b3IgdGhhdCBvdmVybGFpZCBieSA0S0Igc2VjdG9y
cy4KPj4+IEluIFNFTVBFUiBjYXNlLCByZWd1bGFyIHNlY3RvciBpcyAyNTZLQi4gSWYgMzIgeCA0
S0Igc2VjdG9ycyBhcmUgb3ZlcmxhaWQgb24KPj4+IGJvdHRvbSBhZGRyZXNzLCAxMjhLQiBpcyBv
dmVybGFpZCByZWdpb24uIFRoZSBlcmFzZSBvcGNvZGUgZm9yIHRoaXMgcmVnaW9uIGlzCj4+PiBz
YW1lIGFzIDI1NktCIHNlY3RvcnMuCj4+Pgo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBl
cmFzZV9zaXplID0gcmVnaW9uW2ldLnNpemU7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9IGVsc2Ug
ewo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcmFzZV9tYXNrID0gcmVnaW9uW2ldLm9m
ZnNldCAmIFNOT1JfRVJBU0VfVFlQRV9NQVNLOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZvciAoaiA9IFNOT1JfRVJBU0VfVFlQRV9NQVggLSAxOyBqID49IDA7IGotLSkg
ewo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChlcmFzZV9tYXNrICYg
QklUKGopKSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBl
cmFzZV9zaXplID0gbWFwLT5lcmFzZV90eXBlW2pdLnNpemU7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB9Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIH0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIG10ZF9yZWdpb25baV0uZXJhc2Vz
aXplID0gZXJhc2Vfc2l6ZTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIG10ZF9yZWdpb25baV0ubnVt
YmxvY2tzID0gZGl2NjRfdWwocmVnaW9uW2ldLnNpemUsIGVyYXNlX3NpemUpOwo+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgbXRkX3JlZ2lvbltpXS5vZmZzZXQgPSByZWdpb25baV0ub2Zmc2V0ICYKPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH5TTk9SX0VS
QVNFX0ZMQUdTX01BU0s7Cj4+Pj4+ICvCoMKgwqAgfQo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgbXRk
LT5udW1lcmFzZXJlZ2lvbnMgPSBuX3JlZ2lvbnM7Cj4+Pj4+ICvCoMKgwqAgbXRkLT5lcmFzZXJl
Z2lvbnMgPSBtdGRfcmVnaW9uOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4+
ICt9Cj4+Pj4+ICsKPj4+Pj4gK3N0YXRpYyBpbnQgc3BpX25vcl9zZXRfbXRkX2luZm8oc3RydWN0
IHNwaV9ub3IgKm5vcikKPj4+Pj4gwqB7Cj4+Pj4+IMKgwqDCoMKgIHN0cnVjdCBtdGRfaW5mbyAq
bXRkID0gJm5vci0+bXRkOwo+Pj4+PiDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBub3It
PmRldjsKPj4+Pj4gQEAgLTM0MzksNiArMzQ4MywxMSBAQCBzdGF0aWMgdm9pZCBzcGlfbm9yX3Nl
dF9tdGRfaW5mbyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+Pj4+PiDCoMKgwqDCoCBtdGQtPl9yZXN1
bWUgPSBzcGlfbm9yX3Jlc3VtZTsKPj4+Pj4gwqDCoMKgwqAgbXRkLT5fZ2V0X2RldmljZSA9IHNw
aV9ub3JfZ2V0X2RldmljZTsKPj4+Pj4gwqDCoMKgwqAgbXRkLT5fcHV0X2RldmljZSA9IHNwaV9u
b3JfcHV0X2RldmljZTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIGlmIChzcGlfbm9yX2hhc191bmlm
b3JtX2VyYXNlKG5vcikpCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+Pj4gKwo+
Pj4+PiArwqDCoMKgIHJldHVybiBzcGlfbm9yX3NldF9tdGRfZXJhc2VyZWdpb25zKG5vcik7Cj4+
Pj4KPj4+PiBtdGQtPmVyYXNlc2l6ZSBpcyBzZXQgc29tZXdoZXJlIGVsc2UsIHBsZWFzZSBtb3Zl
IGl0IGludG8gdGhpcwo+Pj4+IGZ1bmN0aW9uLCBiZWNhdXNlIGl0IHdpbGwgYWxzbyBoYXZlIGEg
c3BlY2lhbCBjYXNlIGZvciB0aGUKPj4+PiBub25fdW5pZm9ybSBmbGFzaGVzLiBNYXliZSB3ZSds
bCBuZWVkIG91ciBvd24gZXJhc2VzaXplIHN0b3JlZAo+Pj4+IHRvZ2V0aGVyIHdpdGggdGhlIG9w
Y29kZS4KPj4+Pgo+Pj4gTGV0IG1lIGludHJvZHVjZSBwYXJhbXMtPmVyYXNlc2l6ZSB3aGljaCBz
ZXQgdGhyb3VnaCBTRkRQIHBhcnNlLCB0aGVuCj4+Pgo+Pj4gICAgIG10ZC0+ZXJhc2VzaXplID0g
bm9yLT5wYXJhbXMtPmVyYXNlc2l6ZTsKPj4+Cj4+PiBsaWtlIGFzIG90aGVyICdzaXplJyBwYXJh
bXMuCj4+Pgo+PiBJIHRyaWVkIHRvIGltcGxlbWVudCB0aGlzLCBidXQgZm91bmQgbXRkLT5lcmFz
ZXNpemUgaXMgc2V0IGluIHNvbWUgZml4dXAgaG9va3MKPj4gaW4gbWFudWZhY3R1cmVyIGRyaXZl
ciBhbmQgbmVlZCB0byB0aGluayBjYXJlZnVsbHkgYWJvdXQgY2hhbmdpbmcgdGhlbS4KPj4gTGV0
IG1lIGRvIHRoaXMgbGF0ZXIgaW4gYW5vdGhlciBzZXJpZXMgb2YgcGF0Y2hlcy4KPj4KPiAKPiBE
byB5b3UgbWVhbiB4aWxpbng/IFRoYXQncyBhIGRlYWQgd2VpZ2h0LCBJIGhhdmVuJ3Qgc2VlbiBw
YXRjaGVzIGZvciBpdAo+IHNpbmNlIGl0cyBpbnRyb2R1Y3Rpb24uIEknbSB0aGlua2luZyBvZiBn
ZXR0aW5nIHJpZCBvZiB0aGUgeGlsaW54IHMzYW4KPiBmbGFzaGVzIGZyb20gdGhlIFNQSSBOT1Iu
IE1pY2hhZWwsIFByYXR5dXNoPwo+IApzcGFuc2lvbiBhbHNvLiBDaGFuZ2luZyBpdCBtYXkgaW1w
YWN0IHRvIHNvbWUgb2xkZXIgcGFydHMuIEkgbmVlZCB0aW1lIHRvIHRlc3QKYW5kIGRlYnVnIHdp
dGggZGlmZmVyZW50IEZsYXNoIHBhcnRzLgoKPiBDaGVlcnMsCj4gdGEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
