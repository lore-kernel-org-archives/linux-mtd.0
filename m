Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E82C4707C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 09:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIWBAoXn2kBY0dK8TBZbTOawMibzx+rfRf4oXmiyjZI=; b=zEkGN+X5G2GTkx
	kp09x7Pinbfc4VY4Kuhb7znvc98VM4TQeUF00ge8enNZfx0VxtFcTzwEqRhe8WsqSx7ivN4/mYV7W
	NIbvoNB+JmnO2bD6GKhX6D5vgfctbjNFmaFBbPTVKu2dRVDqhJtd5srj9Kvjn19fOItxjzpHyXJIT
	xRtgD7Ki1c6+8TJjCRuVa472s7Ie5B8Vu+0T5HuSHS9zjQU7IQ00rGtMKdR9pusE1+UnfZiHMJaIa
	B/5ifpW8l5N6Og/OokPfpKqeyL9twYWLu7TEhP6bpw2/mHK8IT8wFBVu78au6oKhglzSpIEa7H/RP
	BL9FF8Xr+Ia1qEJN5M/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rODkE-002IqC-2P;
	Fri, 12 Jan 2024 09:22:30 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rODkB-002InO-1W
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 09:22:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40d60c49ee7so70046515e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 12 Jan 2024 01:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705051344; x=1705656144; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2khIGWVSmJTemjGl9MfUAiA7f4JLlmxoptBgK02qfs=;
        b=iSaQ/gCdla1MqTfMmGLU/MWGvG12mwrWrBawyGjmDu41ECFzG3dNl9HMZFGaduKcDb
         Ra21dVL+XOfgsJeIYzJ0Iq8p/cxv31T8tQyki/WfLZg4ZN9ANKn/3lKbLfJmLjGzXG9s
         wPt6gcjE9clt7IYxcpjqnzCWOqo1UnB5W2NmmePi1rUCa/RlhNDKK5D+LlLsECSfcL0h
         1NpNVNV2ET9N0Ygr8kiTeazzFmrlis80uScn8511+eqEvcgtkh//rBu+tN8tfS0CjCmA
         Us2UTJG+Lcp2Jj/vUd497nC12UKzTdPsknivE6vKugCtotnmG78uMLzWinQA/13sLp/V
         lv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705051344; x=1705656144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2khIGWVSmJTemjGl9MfUAiA7f4JLlmxoptBgK02qfs=;
        b=I6tt/jdgaVfT1zFQUj+Asth2wr7gjx/rZdmD/D6DF2ZF/s/zCk+FDlFNv4AvJK4WRK
         tsPA3BP/Y+zWJE2JXQHQe02cIFAOnus2+Cme6VnltiHgGlYzrp9oqxAna/mSCpv4G/Km
         uyTKSVE0EQHlxiHXrZy0kh3ezJ76DjuXMPeZ+G9EORT+z5rpWwAFiO7hGQkzQFNrMJfF
         eppR6V0dIQ87Ol59hxsN+2NMNkbMW9qxtivrVcL1QymPbdB9NwXtLeYAIOYOil9mwn8j
         KFvPo+2ZkIMPzQejhbAswm7GFiKOShabZNCZmJx0ZxP+LXgCA5jiKe6GsfoBXlaCrAvE
         dZWg==
X-Gm-Message-State: AOJu0YznOwmOF9wUj3cxobIGVuVvXr3J1j7ppy4PY/696CNEy6d6CRaJ
	1Nju93sRPEjy/q8uqwMdQ1yuNZ5xZWR30A==
X-Google-Smtp-Source: AGHT+IEiSt5J4iIq7f/2xX2O9jK4vnyTrq03zbNaLs1UBdHtjKeHJWhJAXlo0fOD5dVFz9oKiGTXqw==
X-Received: by 2002:a05:600c:4b0a:b0:40e:5f81:b39e with SMTP id i10-20020a05600c4b0a00b0040e5f81b39emr572286wmp.176.1705051343979;
        Fri, 12 Jan 2024 01:22:23 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c4e0e00b0040d3276ba19sm5163679wmq.25.2024.01.12.01.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 01:22:23 -0800 (PST)
Message-ID: <93415cd7-8d61-4d2a-ab33-37cd1a6cc706@linaro.org>
Date: Fri, 12 Jan 2024 09:22:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: Set mtd->eraseregions for non-uniform
 erase map
Content-Language: en-US
To: Takahiro Kuwano <tkuw584924@gmail.com>, Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
 <740bf235110e05eae9ec7768603e6e2a@walle.cc>
 <d9cf5631-951e-45a0-930f-cc3afac05df9@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <d9cf5631-951e-45a0-930f-cc3afac05df9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_012227_519615_DD19C5EA 
X-CRM114-Status: GOOD (  18.77  )
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

CgpPbiAxLzEyLzI0IDA3OjE0LCBUYWthaGlybyBLdXdhbm8gd3JvdGU6Cj4gT24gMS81LzIwMjQg
OToyMyBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4gSGksCj4+Cj4+PiAtc3RhdGljIHZvaWQg
c3BpX25vcl9zZXRfbXRkX2luZm8oc3RydWN0IHNwaV9ub3IgKm5vcikKPj4+ICtzdGF0aWMgaW50
IHNwaV9ub3Jfc2V0X210ZF9lcmFzZXJlZ2lvbnMoc3RydWN0IHNwaV9ub3IgKm5vcikKPj4+ICt7
Cj4+PiArwqDCoMKgIHN0cnVjdCBzcGlfbm9yX2VyYXNlX21hcCAqbWFwID0gJm5vci0+cGFyYW1z
LT5lcmFzZV9tYXA7Cj4+PiArwqDCoMKgIHN0cnVjdCBzcGlfbm9yX2VyYXNlX3JlZ2lvbiAqcmVn
aW9uID0gbWFwLT5yZWdpb25zOwo+Pj4gK8KgwqDCoCBzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9ICZu
b3ItPm10ZDsKPj4+ICvCoMKgwqAgc3RydWN0IG10ZF9lcmFzZV9yZWdpb25faW5mbyAqbXRkX3Jl
Z2lvbjsKPj4+ICvCoMKgwqAgdTMyIGVyYXNlX3NpemU7Cj4+PiArwqDCoMKgIHU4IGVyYXNlX21h
c2s7Cj4+PiArwqDCoMKgIGludCBuX3JlZ2lvbnMsIGksIGo7Cj4+PiArCj4+PiArwqDCoMKgIGZv
ciAoaSA9IDA7ICFzcGlfbm9yX3JlZ2lvbl9pc19sYXN0KCZyZWdpb25baV0pOyBpKyspCj4+PiAr
wqDCoMKgwqDCoMKgwqAgOwo+Pgo+PiBQbGVhc2UgcHV0IHRoYXQgaW50byBhIGhlbHBlciB3aGlj
aCByZXR1cm5zIHRoZSBudW1iZXIgb2YgcmVnaW9ucy4KPj4KPiBZZXMsIEkgd2lsbCBkbyBpdC4K
PiAKPj4gRldJVywgSSByZWFsbHkgZGlzbGlrZSB0aGUgbWFnaWMgYXJvdW5kIGVuY29kaW5nIGFs
bCBzb3J0cyBvZiBzdHVmZgo+PiBpbnRvIHRoZSBvZmZzZXQuIEl0IG1ha2VzIHRoZSBjb2RlIGp1
c3QgaGFyZCB0byByZWFkLgo+Pgo+Pgo+Pj4gKwo+Pj4gK8KgwqDCoCBuX3JlZ2lvbnMgPSBpICsg
MTsKPj4+ICvCoMKgwqAgbXRkX3JlZ2lvbiA9IGRldm1fa2NhbGxvYyhub3ItPmRldiwgbl9yZWdp
b25zLCBzaXplb2YoKm10ZF9yZWdpb24pLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgR0ZQX0tFUk5FTCk7Cj4+Cj4+IFdobydzIHRoZSBvd25lcj8gbXRkLT5kZXYgb3Ig
bm9yLT5kZXY/Cj4+Cj4gSSB0aGluayBpdCBzaG91bGQgYmUgbm9yLT5kZXYuCj4gVGhlIG10ZCBk
ZXZpY2UgaXMgbm90IHlldCByZWdpc3RlcmVkIGF0IHRoaXMgcG9pbnQuCj4gCj4+PiArwqDCoMKg
IGlmICghbXRkX3JlZ2lvbikKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4+
ICsKPj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IG5fcmVnaW9uczsgaSsrKSB7Cj4+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKHJlZ2lvbltpXS5vZmZzZXQgJiBTTk9SX09WRVJMQUlEX1JFR0lPTikg
ewo+Pgo+PiBCdHcuIHdoYXQgaXMgYW4gb3ZlcmxhaWQgcmVnaW9uPyBJIGNvdWxkbid0IGZpbmQg
YW55IGNvbW1lbnQKPj4gYWJvdXQgaXQuCj4+Cj4gSXQgaXMgdGhlIHJlbWFpbmluZyBwYXJ0IG9m
IHJlZ3VsYXIgc2VjdG9yIHRoYXQgb3ZlcmxhaWQgYnkgNEtCIHNlY3RvcnMuCj4gSW4gU0VNUEVS
IGNhc2UsIHJlZ3VsYXIgc2VjdG9yIGlzIDI1NktCLiBJZiAzMiB4IDRLQiBzZWN0b3JzIGFyZSBv
dmVybGFpZCBvbgo+IGJvdHRvbSBhZGRyZXNzLCAxMjhLQiBpcyBvdmVybGFpZCByZWdpb24uIFRo
ZSBlcmFzZSBvcGNvZGUgZm9yIHRoaXMgcmVnaW9uIGlzCj4gc2FtZSBhcyAyNTZLQiBzZWN0b3Jz
Lgo+IAoKSW4gb3RoZXIgd29yZHMsIHRoZSBvdmVybGFpZCByZWdpb24gaXMgd2hhdCByZW1haW5z
IGZyb20gYSBzZWN0b3IgdGhhdCdzCm5vdCBjb3ZlcmVkIGJ5IHNtYWxsZXIgZXJhc2UgdHlwZXMu
CgoJX19fX18KCgkxMjhLQgk8LSAxMjhLQiBvdmVybGFpZCByZWdpb24KCV9fX19fCgkKCTRLQgoJ
X19fX18KCS4uLi4uCTMwIG90aGVyIDRLQiBzZWN0b3JzCglfX19fXwoJCgk0S0IKCV9fX19fCgp0
aGUgb3ZlcmxhaWQgcmVnaW9uIGRvZXMgbm90IGhhdmUgYSBkZWRpY2F0ZWQgMTI4IEtCIGVyYXNl
IGNvbW1hbmQgYW5kCmluc3RlYWQgcmVsaWVzIG9uIHRoZSBiaWdnZXIgZXJhc2UgdHlwZSwgMjU2
S0IuIFdoZW4gdGhlIDI1NktCIGVyYXNlIGlzCmlzc3VlZCBvbiB0aGUgMTI4S0Igb3ZlcmxhaWQg
cmVnaW9uLCBqdXN0IHRoZSAxMjhLQiBvZiB0aGUgb3ZlcmxhaWQKcmVnaW9uIGFyZSBlcmFzZWQu
CgpEaWQgSSByZW1lbWJlciBjb3JyZWN0bHk/IE1heWJlIHdlIGNhbiBkZXNjcmliZSB0aGlzIHNv
bWV3aGVyZSAuLi4KCkNoZWVycywKdGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
