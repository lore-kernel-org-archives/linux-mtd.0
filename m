Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65BFCCD193
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Oct 2025 07:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ChtoBZe1jkZEkLNMFeJI7QPL8HjDjehmIUb6dDFEpI=; b=KcltxykPvI33jc
	8DK9BBzaZ4N4dl0FSjCNrcos2G+W6VOjPzwMXFbHnyRk+9hQGrAoxgTqMb20jKXEhtKo6dUT9iILa
	54viTkMSwrchDfqGC8U37rHMci/btHhHqhYIBzcZkQ7DeSY6eUC58Vs8aY1mjrM6Aa2t+3wCnaCs9
	dEEgbY+I7/DRbNrQG8tCgNf14C3ZiVF+r/TaCgb5rcZvWyc50C5pF5ElKHWgVpUE/WDOdYN13cAH/
	AgzxNjRmQVNUNleRVlr7638dMm1Jypd+cT+wjxhNyMJxGwHQJXqBdSUfcIbkZ9T2g1NGrNXzKL282
	TNBYDMhwi0ZCYZw2SlGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpyz-00000005PZR-1BbU;
	Thu, 23 Oct 2025 07:43:37 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpyw-00000005PZ4-29h3
	for linux-mtd@lists.infradead.org;
	Thu, 23 Oct 2025 07:43:35 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b4aed12cea3so95790266b.1
        for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2025 00:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761205412; x=1761810212; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OnSo7UV2l+foi4Xmv3GwoRrN7FNUDfia8DEbde1ITA=;
        b=eM9qqXxWS37Lda76KcfRgMkmEV4Z2AKlYhiPqQEh52sTdHgMsGiiAtB/saKz7xiJ+6
         UDylJynYu27wYziKATAtaZu9gJBXwBw8mozb4nK6QNS4XP8SwHRm0Y6N4hv+AhwizyOi
         r26kNoPzc71FWDcNSLNOCljtDILV7CM8s94CChGJSWdCLKR81qrPHPKkM9LiRXHk+Th5
         xIG2bE38f64qaDQO2BrFtvYySgJmk5aBQfAZ4cOancq5bCc55j/2KDcs6/FF0qDsuARt
         +Oza1MRgCWtynXCdX0LrX+ONteri9SzXrTm47qMZOzrud3ZUp5l38WXskuZ3tx5VLBrW
         FO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761205412; x=1761810212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3OnSo7UV2l+foi4Xmv3GwoRrN7FNUDfia8DEbde1ITA=;
        b=VkNCgNfWvEUYxKnGcPEtsAvF3Ao9zBqOrmHwiyNrgYalAwS+gkoOjgE9tKZSFyXWst
         JQdvrrYLWhj6aQbtWTqeK+kaQ5vqdZJM94p8DveUlwXXVhboo7ewQkpSEsLfftOlmljU
         I5mhv9W2aWoSDzpvRb863yzmqJ/q2y1Pfv8OyP0C7i/F+pB+ERMV+pRnDPWyUvBJiwfj
         GqUAfvsXkyC8ffEllvzcpMdMn/8MF060e75/aWUZw+RZaS2tDciRvF7IxEKM41STHErl
         00ezIG/vOt+Xec8EaC0M1Q/hZkiJGk5/o58PwGYAK98+aO5iqeqOD3RANdffGSHzwLX1
         VNnw==
X-Gm-Message-State: AOJu0YxvzCx5QYpGFeVr7fPawwoTVyBlPNWiCvgIRrNDqH+4On4pceAL
	WPmab51H+AF2O6SmqPuMC0Vl3vm1ynlOLW/0rTilsoc6IyH9wdMi0FOtd+O/rpT7TW8=
X-Gm-Gg: ASbGncv3AxmwkSLP4vyxKgAOqAByR6p7BDkwcMvJ3VdRVeSHf6krbLMZIRLydY2EMnj
	HiEV0SDWt90h+LSglJFozw0qunIj5bPvoPzkXR6XrmYnZP5X9mFsoMrYsG0zh/5x4WtP6jWdrOP
	j8VWdVnYocJ7wBEo2Wdk+/cX39eu1T1DGd6jikcWS5e0gMPfVot46Ncjtz6ymuTVPMW074O+Gun
	BUoKT1ygVqL1h9Bj7jq7XK9LbJ/Q0OGPb2YVF5JWBiDc0lQxgWNuAjxEwN2cQfDrMG18XUl27KG
	RXQZXuMePNC3V35R5A7dfzjGi4IRTBPSbSXNLdGSdA5VCPF9afbL3n53ip3NE5bdQaQj/wGyQPi
	sHb9bnsxxeJZcSKHA2lp9e8JCNaLvhnRnPdXqtHoGw9BRgsYbG7vecYsoLqx4w2NNSj134ZaAja
	Uqt20gvHmml5FT8zeRYNQ=
X-Google-Smtp-Source: AGHT+IE5Qln5QMXf50BzGX05VUxXjWArqf9f8lHP9J/SmMxbxc4eUgX8ErRxaOS+BtwFntzXMtiV0A==
X-Received: by 2002:a17:906:f5a1:b0:b57:2d81:41f with SMTP id a640c23a62f3a-b6474b3602bmr2991259466b.40.1761205412324;
        Thu, 23 Oct 2025 00:43:32 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5130cbdasm140513266b.14.2025.10.23.00.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 00:43:31 -0700 (PDT)
Message-ID: <b8338932-de87-4328-9d33-d4a8268fb03d@linaro.org>
Date: Thu, 23 Oct 2025 08:43:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mtd: spi-nor: spansion: SMPT fixups for S25FS-S
To: Takahiro Kuwano <tkuw584924@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com>
 <20251022-s25fs-s-smpt-fixup-v1-3-ce26d4084b2d@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251022-s25fs-s-smpt-fixup-v1-3-ce26d4084b2d@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_004334_605718_E5197F5E 
X-CRM114-Status: GOOD (  28.45  )
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

CgpPbiAxMC8yMi8yNSAxMTowNyBBTSwgVGFrYWhpcm8gS3V3YW5vIHdyb3RlOgo+IFMyNUZTLVMg
ZmFtaWx5IHN1cHBvcnRzIFNNUFQgdGhhdCBoZWxwcyB0byBkZXRlY3Qgc2VjdG9yIGxheW91dCBz
ZXR0aW5ncwo+IGluIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzLCBidXQgc29tZSBvZiBwYXJhbWV0
ZXJzIGluIHRoZSB0YWJsZSBhcmUKPiB3cm9uZyBvciB1bmRldGVybWluZWQgc28gdGhlIGZpeHVw
cyBiZWxvdyBhcmUgcmVxdWlyZWQuCj4gCj4gUmVhZCBBbnkgUmVnaXN0ZXIgb3AgaXMgdXNlZCB0
byByZWFkIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzIHRoYXQKPiByZWxhdGVkIHRvIHNlY3RvciBt
YXAuIFRoZSBvcCByZXF1aXJlcyA4IGN5Y2xlcyBsYXRlbmN5IGJ5IGRlZmF1bHQuCj4gSW1wbGVt
ZW50IHNtcHRfcmVhZF9kdW1teSgpIHRvIHNldCBjb3JyZWN0IGR1bW15IGN5Y2xlcy4KPiAKPiBN
YXAgSUQgaXMgc3RydWN0dXJlZCBieSBjb21iaW5hdGlvbiBvZiBDUjNOVlszXSwgQ1IxTlZbMl0s
IGFuZCBDUjNOVlsxXS4KPiBIb3dldmVyLCBpbiBTMjVGUzUxMlMsIENSM05WWzFdIGlzIFJGVSBh
bmQgYWx3YXlzIDAsIHdoaWxlIG1hcCBJRHMKPiBkZWZpbmVkIGluIHRoZSB0YWJsZSBhc3N1bWUg
aXQgaXMgYWx3YXlzIDEuIEltcGxlbWVudCBzbXB0X21hcF9pZCgpIHRvCj4gZml4IG1hcCBJRCBm
b3IgUzI1RlM1MTJTLiBPdGhlciBkZW5zaXRpZXMgaW4gUzI1RlMtUyBmYW1pbHkgKDI1Nk1iIGFu
ZAo+IDEyOE1iKSBkb24ndCBuZWVkIHRoaXMgZml4IGFzIENSM05WWzFdIGluIHRob3NlIGNoaXBz
IGlzIGNvbmZpZ3VyYWJsZQo+IGFuZCBtYXAgSURzIGFyZSBjb3JyZWN0bHkgZGVmaW5lZCBpbiBT
TVBULgo+IAo+IENvLWRldmVsb3BlZC1ieTogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0K3JlbmVz
YXNAbWFpbGJveC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0
K3JlbmVzYXNAbWFpbGJveC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogVGFrYWhpcm8gS3V3YW5vIDxU
YWthaGlyby5LdXdhbm9AaW5maW5lb24uY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9zcGktbm9y
L3NwYW5zaW9uLmMgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL3NwaS1ub3Ivc3BhbnNpb24uYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BhbnNpb24uYwo+
IGluZGV4IGEwMjk2Yzg3MTYzNDY3OGJlNTA5Y2IzMGQyNmUxOGRlYmZmMzA2NmQuLjg5ZTg1ZWJh
MmMzMWE0ZDc0ZGNiZmVmZmRlZmY3MTM5YjZlMGY2YjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvc3BpLW5vci9zcGFuc2lvbi5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGFuc2lv
bi5jCj4gQEAgLTc4NSw4ICs3ODUsNDIgQEAgczI1ZnNfc19ub3JfcG9zdF9iZnB0X2ZpeHVwcyhz
dHJ1Y3Qgc3BpX25vciAqbm9yLAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lk
IHMyNWZzX3Nfbm9yX3NtcHRfcmVhZF9kdW1teShjb25zdCBzdHJ1Y3Qgc3BpX25vciAqbm9yLAo+
ICsJCQkJCXU4ICpyZWFkX2R1bW15KQo+ICt7Cj4gKwkvKgo+ICsJICogVGhlIGNvbmZpZ3VyYXRp
b24gZGV0ZWN0aW9uIGR3b3JkcyBpbiBTMjVGUy1TIFNNUFQgaGFzIDY1aCBhcwo+ICsJICogY29t
bWFuZCBpbnN0cnVjdGlvbiBhbmQgJ3ZhcmlhYmxlJyBhcyBjb25maWd1cmF0aW9uIGRldGVjdGlv
biBjb21tYW5kCj4gKwkgKiBsYXRlbmN5LiBTZXQgOCBkdW1teSBjeWNsZXMgYXMgaXQgaXMgZmFj
dG9yeSBkZWZhdWx0IGZvciA2NWggKHJlYWQKPiArCSAqIGFueSByZWdpc3Rlcikgb3AuCj4gKwkg
Ki8KPiArCSpyZWFkX2R1bW15ID0gODsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgczI1ZnNfc19u
b3Jfc21wdF9tYXBfaWRfZHVtbXkoY29uc3Qgc3RydWN0IHNwaV9ub3IgKm5vciwgdTggKm1hcF9p
ZCkKPiArewo+ICsJLyoKPiArCSAqIFRoZSBTMjVGUzUxMlMgY2hpcCBkYXRhc2hlZXQgcmV2Lk8g
VGFibGUgNzEgb24gcGFnZSAxNTMKPiArCSAqIEpFREVDIFNlY3RvciBNYXAgUGFyYW1ldGVyIER3
b3JkLTYgQ29uZmlnLiBEZXRlY3QtMyBkb2VzCj4gKwkgKiB1c2UgQ1IzTlYgYml0IDEgdG8gZGlz
Y2VybiA2NGtpQi8yNTZraUIgdW5pZm9ybSBzZWN0b3JzCgp5b3UgbmVlZCB0byB1cGRhdGUgdGhl
IGNvbW1lbnQsIHRoZXJlJ3Mgbm8gNjQgS2liIHVuaWZvcm0gc2VjdG9ycyBpbgp0aGUgZmxhc2gs
IHRoZSBjb21tZW50IGlzIG1pc2xlYWRpbmcuIFlvdSBoYXZlOgotIEh5YnJpZCBzZWN0b3Igb3B0
aW9uCuKAoiBQaHlzaWNhbCBzZXQgb2YgZWlnaHQgNC1LQiBzZWN0b3JzIGFuZCBvbmUgMjI0LUtC
IHNlY3RvciBhdCB0aGUgdG9wIG9yIGJvdHRvbSBvZiBhZGRyZXNzIHNwYWNlIHdpdGggYWxsCnJl
bWFpbmluZyBzZWN0b3JzIG9mIDI1Ni1LQgotIFVuaWZvcm0gc2VjdG9yIG9wdGlvbgrigKIgVW5p
Zm9ybSAyNTYtS0IgYmxvY2tzPiArCSAqIGRldmljZSBjb25maWd1cmF0aW9uLCBob3dldmVyIGFj
Y29yZGluZyB0byBzZWN0aW9uIDcuNS41LjEKPiArCSAqIENvbmZpZ3VyYXRpb24gUmVnaXN0ZXIg
MyBOb24tdm9sYXRpbGUgKENSM05WKSBwYWdlIDYxLCB0aGUKPiArCSAqIENSM05WIGJpdCAxIGlz
IFJGVSBSZXNlcnZlZCBmb3IgRnV0dXJlIFVzZSwgYW5kIGlzIHNldCB0bwo+ICsJICogMCBvbiBu
ZXdseSBtYW51ZmFjdHVyZWQgZGV2aWNlcywgd2hpY2ggbWVhbnMgNjRraUIgc2VjdG9ycy4KaGVy
ZSB0b28+ICsJICogU2luY2UgdGhlIGRldmljZSBkb2VzIG5vdCBzdXBwb3J0IDY0a2lCIHVuaWZv
cm0gc2VjdG9ycyBpbgphZ2Fpbj4gKwkgKiBhbnkgY29uZmlndXJhdGlvbiwgcGFyc2luZyBTTVBU
IHRhYmxlIGNhbm5vdCBmaW5kIGEgdmFsaWQKPiArCSAqIHNlY3RvciBtYXAgZW50cnkgYW5kIGZh
aWxzLiBGaXggdGhpcyB1cCBieSBzZXR0aW5nIFNNUFQKCmJ5IG92ZXJ3cml0aW5nIHRoZSBDUjNO
VlsxXSB2YWx1ZSB0byAxLCBhcyB0aGUgdGFibGUgZXhwZWN0cy4KCgpUaGUgcGF0Y2ggbG9va3Mg
Z29vZCwgd2l0aCB0aGVzZSBtaW5vciB0aGluZ3MgYWRkcmVzc2VkLiBQbGVhc2UgZml4IHRoZW0K
YW5kIGFkZApSZXZpZXdlZC1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8u
b3JnPgoKVGhhbmtzIGZvciB0YWtpbmcgY2FyZSBvZiB0aGlzLCBUYWthaGlybyEKQ2hlZXJzLAp0
YQoKPiArCSAqIGNvbmZpZ3VyYXRpb24gaW5kZXggYml0IDAsIHdoaWNoIGlzIHBvcHVsYXRlZCBl
eGFjdGx5IGJ5Cj4gKwkgKiB0aGUgQ1IzTlYgYml0IDEgYmVpbmcgMS4KPiArCSAqLwo+ICsJaWYg
KG5vci0+cGFyYW1zLT5zaXplID09IFNaXzY0TSkKPiArCQkqbWFwX2lkIHw9IEJJVCgwKTsKPiAr
fQo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyBzMjVmc19zX25vcl9m
aXh1cHMgPSB7Cj4gIAkucG9zdF9iZnB0ID0gczI1ZnNfc19ub3JfcG9zdF9iZnB0X2ZpeHVwcywK
PiArCS5zbXB0X3JlYWRfZHVtbXkgPSBzMjVmc19zX25vcl9zbXB0X3JlYWRfZHVtbXksCj4gKwku
c21wdF9tYXBfaWQgPSBzMjVmc19zX25vcl9zbXB0X21hcF9pZF9kdW1teSwKPiAgfTsKPiAgCj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBzcGFuc2lvbl9ub3JfcGFydHNbXSA9IHsK
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
