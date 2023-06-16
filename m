Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750E2EB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 08:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLF1TTiEKKoRKZbsOCkIgCYdGPwuf8PY6ucGsK/syrg=; b=RyUdDL5b31LaON
	gGdGiQB8YfWJd35Q/uddUedn9YrUhqtnkiN5RTh7M23FMYin8ZStCUFRS6F8P5pmqew1sz2GQzdzO
	N100nMxZTtt2EGdOZewXZLjnYjlTqdkOSQJEvVGEGL6i/BOCd2OCRbkiZD55kXJ5QYcDFGyt+W/lR
	oehrXeq+1Pvu6BQmp08DT1CqmjjsAgmuXWNWj5KSf2dLyYZRNx1Dthizu2TDqb2DlWYYlSR7ftUOh
	dpcP7MLwFZ6hivOFWmNIM3aRzMtqe3qIXtjdmhaO/csI2xVmRE0r1YL18qlwfYqVVb6OL4tF+WVEQ
	rJOxc9LEAfxMA1vxP6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA4yj-00HIHs-2p;
	Fri, 16 Jun 2023 08:38:45 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA4yg-00HIGb-1i
	for linux-mtd@lists.infradead.org;
	Fri, 16 Jun 2023 08:38:43 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9829b12b80fso60411366b.2
        for <linux-mtd@lists.infradead.org>; Fri, 16 Jun 2023 01:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686904721; x=1689496721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pZEfJSYnwqLnbdKTWIKySlr4932iv0cggheuIvgWyaQ=;
        b=nQs/n0SJ5phrJogsv3awLm5NSsFpgx4QUySC4eBNCwYCX7s8emhUdNGSM9snOJdx0c
         1zEUnqrTovNcGgKvluiNirHj11V8MoyLMltmeu//J4RTVBkqyU64WjlX/k+M0yFT1ZtJ
         hgwjE1bXhP65N4phVOn3TEvR5G9ZaAaVLL102Y3muCgEW70I9qiDbbRPDVfIbcs2tVlf
         +iBQQF1JpqAh0sdJsWZb1GHGZ9ihiQ+zQKUf66AcwvZszqqrROAUS0fDSO5cYnkd93uY
         DmqzqH14PX/hR6GbIZHDdSb/R1Qfrf2mwJ7YeZCnmDHCyoq5acbIXyOi99xfw5Y9O/XJ
         uJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686904721; x=1689496721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZEfJSYnwqLnbdKTWIKySlr4932iv0cggheuIvgWyaQ=;
        b=D7oF7eRzO+2T6v8TH0Wkx6CCt6l4uozLiYOmsDlcNpCTCyrWSSczuSW3cvPR5A91CA
         JO43DWFuK7QrEAmyjdvKNaFpsYNSnfcyEUU2Z60Xn3aMaqv640h79zcMbK6MSckXa/4Y
         cKfrnkqoOFqkR3ZN3RgWzyu2+hlTgl+x6jg4IaB8EBKhfr0opKdiuqrNInqXKnaz7Bpc
         QSImiHgI9N0f7/M97GCuei/3lnddNr3ubZrtZ1ItOar4rCw1JQNuJWWJYRLqLaCU/aDA
         LtF8wuzQpS3Chey4C0PfndUm4NbNZ/2wIC/wG0QE27zve+4uFf4xHjBmcBkHHppe41Jl
         6dfQ==
X-Gm-Message-State: AC+VfDyuSjJbdQr4IlK1rghT2eoHQmrgp4o7zMCBLWcP9niiMRclc3G/
	oHpwRqhDpu96gCVUvdUabTijCQ==
X-Google-Smtp-Source: ACHHUZ4Ie2Po3MUDE6dj9CrV/HK9CiJ0NB9rm5vu9DTI7XghCArJ3u4gjKsWFnHbluQdq8m01/fx6A==
X-Received: by 2002:a17:907:7287:b0:973:93e3:bc9a with SMTP id dt7-20020a170907728700b0097393e3bc9amr1522867ejc.6.1686904721006;
        Fri, 16 Jun 2023 01:38:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id m25-20020a170906235900b00982aec29db1sm1684992eja.126.2023.06.16.01.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 01:38:40 -0700 (PDT)
Message-ID: <29a9f4a4-b205-d341-bc34-10829af2996a@linaro.org>
Date: Fri, 16 Jun 2023 10:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v9 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Vadym Kochan <vadym.kochan@plvision.eu>
References: <20230615040447.3484564-1-chris.packham@alliedtelesis.co.nz>
 <20230615040447.3484564-4-chris.packham@alliedtelesis.co.nz>
 <f16e742f-e6f2-9761-e70d-e0e7cadcba4a@linaro.org>
 <1863cd53-9846-def2-ee5f-f4a51160ed8d@alliedtelesis.co.nz>
 <781c1db2-ecca-901a-4e11-7f7c68cf744d@linaro.org>
 <20230616102414.222dde21@xps-13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616102414.222dde21@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_013842_639949_462E4723 
X-CRM114-Status: GOOD (  15.33  )
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

T24gMTYvMDYvMjAyMyAxMDoyNCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBLcnp5c3p0b2Ys
Cj4gCj4ga3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIEZyaSwgMTYgSnVu
IDIwMjMgMTA6MTU6MzEgKzAyMDA6Cj4gCj4+IE9uIDE1LzA2LzIwMjMgMjM6MDYsIENocmlzIFBh
Y2toYW0gd3JvdGU6Cj4+Pj4gIAo+Pj4+PiArCj4+Pj4+ICtwcm9wZXJ0aWVzOgo+Pj4+PiArICBj
b21wYXRpYmxlOgo+Pj4+PiArICAgIG9uZU9mOgo+Pj4+PiArICAgICAgLSBpdGVtczoKPj4+Pj4g
KyAgICAgICAgICAtIGNvbnN0OiBtYXJ2ZWxsLGFybWFkYS04ay1uYW5kLWNvbnRyb2xsZXIKPj4+
Pj4gKyAgICAgICAgICAtIGNvbnN0OiBtYXJ2ZWxsLGFybWFkYTM3MC1uYW5kLWNvbnRyb2xsZXIK
Pj4+Pj4gKyAgICAgIC0gZW51bToKPj4+Pj4gKyAgICAgICAgICAtIG1hcnZlbGwsYXJtYWRhLThr
LW5hbmQtY29udHJvbGxlciAgCj4+Pj4gVGhpcyBpcyB3cm9uZy4gOGsgY2Fubm90IGJlIGJvdGg6
IGNvbXBhdGlibGUgYW5kIG5vdCBjb21wYXRpYmxlIHdpdGgKPj4+PiAzNzAuIEl0J3Mgbm90IHNv
bWVvbmUncyBjYXQgdG8gYmUgaW4gYm90aCBzdGF0ZXMgYXQgdGhlIHNhbWUgdGltZS4uLiAgCj4+
Pgo+Pj4gVGhlIGNvcnJlY3Qgc3RhdGUgKElNSE8sIE1pcXVlbCBjb3JyZWN0IG1lIGlmIEknbSB3
cm9uZykgaXMgYGNvbXBhdGlibGUgCj4+PiA9ICJtYXJ2ZWxsLGFybWFkYS04ay1uYW5kLWNvbnRy
b2xsZXIiO2DCoCBhcyB0aGVyZSBhcmUgc29tZSA4SyBzcGVjaWZpYyAKPj4+IHJlcXVpcmVtZW50
cyB0aGF0IGFyZW4ndCBwcmVzZW50IG9uIHRoZSAzNzAgKHNwZWNpZmljYWxseSB0aGUgCj4+PiBz
eXN0ZW0tY29udHJvbGxlciBhbmQgdGhlIDJuZCBjbG9jaykuICAgCj4+Cj4+IFByZXNlbmNlIG9m
IHNwZWNpZmljIHJlcXVpcmVtZW50cyBkb2VzIG5vdCBpbnZhbGlkYXRlIGNvbXBhdGliaWxpdHku
IFR3bwo+PiBkZXZpY2VzIGFyZSBjb21wYXRpYmxlIGlmIHRoZSA4ayBjYW4gYmluZCBhbmQgd29y
ayB3aXRoIDM3MCBjb21wYXRpYmxlCj4+IHN0cmluZywgZXZlbiBpZiB0aGlzIG1lYW5zIHNvbWUg
bG93ZXIgcGVyZm9ybWFuY2Ugb3IgbGVzcyBmZWF0dXJlcyAoZS5nLgo+PiBzdWJzZXQgb2YgZmVh
dHVyZXMpLgo+IAo+IFF1b3RpbmcgbXlzZWxmIGZyb20gMjAxOSAoY29tbWVudCBpbiB0aGUgZHJp
dmVyKToKPiAiU29tZSBTb0NzIGxpa2UgQTdrL0E4ayBuZWVkIHRvIGVuYWJsZSBtYW51YWxseSB0
aGUgTkFORCBjb250cm9sbGVyLAo+IGdhdGVkIGNsb2NrcyBhbmQgcmVzZXQgYml0cyB0byBhdm9p
ZCBiZWluZyBib290bG9hZGVyIGRlcGVuZGVudC4iCj4gCj4gU28gY2FuIHRoZSA4ayBjb250cm9s
bGVyIHdvcmsgdXNpbmcgYSAzNzAgY29tcGF0aWJsZSA6IHllcywgaWYgdGhlCj4gYm9vbG9hZGVy
IGVuYWJsZWQgdGhlIE5BTkQgY29udHJvbGxlciBhbHJlYWR5LCBubyBvdGhlcndpc2UuIEJ1dCBp
bgo+IHByYWN0aWNlIGl0IGlzIHRoZSBzYW1lIGNvbnRyb2xsZXIuCj4gCj4gR2l2ZW4gdGhpcyBp
bmZvcm1hdGlvbiBJIGRvbid0IGtub3cgd2hldGhlciBpdCBtYWtlcyBzZW5zZSB0byBxdWFsaWZ5
Cj4gdGhlIDhrIGNvbnRyb2xsZXIgY29tcGF0aWJsZSB3aXRoIHRoZSAzNzAgY29tcGF0aWJsZSBv
ciBub3QuCgpJbmRlZWQsIGEgYml0IHRyaWNreSBkZWNpc2lvbi4gRm9yIG1lIHRoZXkgY291bGQg
c3RheSBjb21wYXRpYmxlLApiZWNhdXNlIGFwcGFyZW50bHkgcHJvZ3JhbW1pbmcgbW9kZWwgaXMg
dGhlIHNhbWUgb3Igc2ltaWxhci4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
