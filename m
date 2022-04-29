Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDDEC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 20:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywH0Cum25gjS4fRW8y9om7cO2bLti2C14mNki8v96t8=; b=P3G4ESBQPYMDEy
	GVEL0Q5Pd5hPW7QfIOS65YXtt69bAR4dpV2pyWGRFES71U1rGSJz6EHn06HRdu2FROOTLvgLBEf4g
	q1FS7Sk0Rbr+AKZaumEIu3sVYJBUM8J2T3x/lVAPNtgt42wgMFTGUAHML+M9gTwaOOSAVqTxBLyr6
	UKJ4Kaznag2OvFfCcX8z+9e3sa9RS/VFOoaRm64/oS77iU/fk6Xb6BNMOmm416hkcr+EYKeHCAxMc
	GUb1Y4JfsVFLWcPU4qKqhfnMdXBrNrMSuTW+SR8QPajaFMFQ1uZWjmUvvCKjmdThEfxPcUdOqbn8W
	KMwYOwnZbr/5irKugoPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkX8B-00CU46-DB; Fri, 29 Apr 2022 20:22:23 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkX87-00CU2C-EI
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 20:22:21 +0000
Received: by mail-ej1-x632.google.com with SMTP id n10so32860ejk.5
 for <linux-mtd@lists.infradead.org>; Fri, 29 Apr 2022 13:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=B5xgiQuwPDVq6wa2pBHGsA/S0+n6F6tg1rxMU8HQg9Q=;
 b=mcE120iimXDKlF7XgivbJgAkUJRut3u22lfY1qcg5dF4wBAejZVviizpd9QnMZA03a
 a4O+PDTm1C+oyCjfvUFiyFfPwd4Pwq5pwv9FsgUl7ohsZZ7xQtITz6LjK6usT0ELjzK4
 MDQYsDK2+NMe6Ff0Ukby5fyhFZf8q6I6j7yriQ/pJbk9cQDvP9JPzqKurw3JQhYSVAA5
 nMUuAeVDdEnbI5eAcwEUlL/87tKb+pkmK9arU7u5s8B7GrZbHyxOPtW86MGKNTW1cPEf
 fuhDF1sgFbZSX08hvTx1X+ay6UpebhSVeqAHx2dL5y7id82s4HzHkRgxjMlCTNm1YHBe
 SdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B5xgiQuwPDVq6wa2pBHGsA/S0+n6F6tg1rxMU8HQg9Q=;
 b=SMHitkvzIdWK4yiLvupg+B0n4YkxmfjvrYOABLpVeS9OgaDF5KaGstltyXcm2RxaGZ
 PTKe3x7XtphvuAsRW4hdUip9DUiYEyJ63wNtGG3baLuW6vMFqhDR6CTPLF7kSdXpBNMP
 0jTxu9qaq97i45BOEFA3bRzb9nZ0DXAst12zMKLdkQlT83k7PufJnPFphI7Uhf8K4Wim
 mKtummd7QYwDkmOKtbaUfNmYPI8EzyFXyhX7+SVR+/TK3x9CQd0dZNENoO6KRubkuMuU
 j7n7Pi4Yp/wiw/OM9sPsdVC9vhAk/22jK4ubjlE8F4RbbO1kSj6M36AziMhbXq6QQ4Dq
 tXkQ==
X-Gm-Message-State: AOAM532VXgSWIMkK8388iwYPKNzOtzlLj35STkS8nh8eSlcLATf0RC1z
 TMif23sKNDuXveaoO8jp2V68OA==
X-Google-Smtp-Source: ABdhPJxisJ27HjNyI+R3epyENsZDasAoU3UJfcIaj/8Mg+ufNZGEzHjn6GaAqAobdV7jJautl+/OkA==
X-Received: by 2002:a17:907:c01a:b0:6f3:b313:2fd1 with SMTP id
 ss26-20020a170907c01a00b006f3b3132fd1mr971345ejc.680.1651263732039; 
 Fri, 29 Apr 2022 13:22:12 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 w23-20020a170907271700b006f3ef214d9fsm959747ejk.5.2022.04.29.13.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 13:22:11 -0700 (PDT)
Message-ID: <a84df850-149e-9656-43fa-1f040368a9f1@linaro.org>
Date: Fri, 29 Apr 2022 22:22:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for
 Sercomm parser
Content-Language: en-US
To: Mikhail Zhilkin <csharper2005@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: NOGUCHI Hiroshi <drvlabo@gmail.com>, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220406195557.1956-1-csharper2005@gmail.com>
 <20220406195946.2019-1-csharper2005@gmail.com>
 <8d0d8b27-35ff-3693-cf80-897b80c26b4e@linaro.org>
 <57bebf2f-af4c-b2d9-10e5-19e5104946fb@gmail.com>
 <29cfa017-bbaf-3aba-fe1d-06771957dbaa@linaro.org>
 <1b391399-984b-7a63-3265-62ef09caec39@gmail.com>
 <bd533827-b575-caad-c230-af060851b231@gmail.com>
 <db70e53b-7484-43bf-e9c8-b6a2dce1fbb5@linaro.org>
 <25da3f43-c46e-8108-2da9-0e4f2b7cc1a4@gmail.com>
 <b279040a-a782-a2ca-2acb-2d8f07709081@linaro.org>
 <1c19faf9-fc1c-9adf-d038-97b673a8f0be@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1c19faf9-fc1c-9adf-d038-97b673a8f0be@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_132219_509196_EB745EB0 
X-CRM114-Status: GOOD (  29.48  )
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

T24gMjkvMDQvMjAyMiAxNzoyNiwgTWlraGFpbCBaaGlsa2luIHdyb3RlOgo+IE9uIDQvMjkvMjAy
MiA5OjQ2IEFNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IAo+Pj4+IEkgYW0gc29ycnks
IGJ1dCB5b3UgY2hhbmdlZCBub3cgYSBsb3QgaW4gdGhlIGJpbmRpbmdzIGFuZCBpdCBsb29rcwo+
Pj4+IGVudGlyZWx5IGRpZmZlcmVudC4gVGhpbmdzIHByZXZpb3VzbHkgYmVpbmcgY29ycmVjdCBu
b3cgYXJlIHdyb25nLCBzbwo+Pj4+IHJhdGhlciBzdGFydCBmcm9tIHlvdXIgb2xkIGJpbmRpbmdz
Li4uCj4+Pgo+Pj4gTG9va3MgbGlrZSBJJ20gYSBiaXQgY29uZnVzZWQuLi4gSSB1c2UgZHVhbCAi
Y29tcGF0aWJsZSIgaW4gbXkgcmVhbCBkdHMKPj4+IGFuZCBJIHJlYWxpemVkIHRoYXQ6Cj4+Pgo+
Pj4gMS4gVGhlcmVmb3JlIEkgaGF2ZSB0byB1c2XCoCBkdWFsICJjb21wYXRpYmxlIiBpbiBleGFt
cGxlIHRvbzoKPj4+Cj4+PiBjb21wYXRpYmxlID0gInNlcmNvbW0sc2MtcGFydGl0aW9ucyIsICJm
aXhlZC1wYXJ0aXRpb25zIjsKPj4+Cj4+PiAyLiBXaGVuIEknbSB0cnlpbmcgdG8gcmV1c2UgImZp
eGVkLXBhcnRpdGlvbnMiIGNvbXBhdGlibGUgZnJvbQo+Pj4gZml4ZWQtcGFydGl0aW9ucy55YW1s
IGluIG15IG5ldyAueWFtbCBJIGdldCAidG9vIGxvbmciIGVycm9ycy4KPj4gWWVzLCB0aGUgZml4
ZWQtcGFydGl0aW9ucy55YW1sIHdvdWxkIGhhdmUgdG8gYmUgY2hhbmdlZCB0byBhbGxvdyBleHRl
bnNpb24uCj4gCj4gV2VsbC4KPiAKPj4+IFJlYWwgZHRzOgo+Pj4KPj4+IExpbms6Cj4+PiBodHRw
czovL2dpdGh1Yi5jb20vb3BlbndydC9vcGVud3J0L2Jsb2IvZWRjYzFhOWE3MzRiYjNmY2RjOTI0
MjAyNTI5MGQzZjE3M2U3MWI3OC90YXJnZXQvbGludXgvcmFtaXBzL2R0cy9tdDc2MjFfYmVlbGlu
ZV9zbWFydGJveC1naWdhLmR0cyNMNzkKPj4+Cj4+PiBTbywgSSBjdXJyZW50bHkgZm91bmQgYW5v
dGhlciBzb2x1dGlvbiAtIHRvIGV4dGVuZCBmaXhlZC1wYXJ0aXRpb25zLnlhbWwKPj4+IHdpdGgg
InNlcmNvbW0sc2MtcGFydGl0aW9ucyIuIElzIEl0IG9rIGZyb20geW91ciBzaWRlPyBDYW4gSSB1
c2UgdGhpcwo+Pj4gY29kZSBpbiB2Mz8KPj4gTm90IHJlYWxseSwgSSBkb24ndCB1bmRlcnN0YW5k
IHdoeSBkbyB5b3UgbmVlZCBpdCAKPiAKPiBUaGUgbWFpbiBpZGVhIGlzIGtlZXBpbmcgb3JpZ2lu
YWwgU2VyY29tbSBmaXJtd2FyZSBiZWhhdmlvcjoKPiAKPiAxLiBJZiBkeW5hbWljIHBhcnRpdGlv
biBtYXAgZm91bmQgdGhlbiB1c2Ugb2Zmc2V0cyBhbmQgbXRkIHNpemVzIHN0b3JlZAo+IGluIHBh
cnRpdGlvbiBtYXAuIEl0J3MgcHJvdmlkZWQgYnkgInNlcmNvbW0sc2MtcGFydGl0aW9ucyIgY29t
cGF0aWJsZS4KPiAKPiAyLiBJZiBkeW5hbWljIHBhcnRpdGlvbiBtYXAgZG9lc24ndCBleGlzdCBv
ciBicm9rZW4gdGhlbiBkZWZhdWx0IHZhbHVlcwo+IChmcm9tIGR0cykgYXJlIHVzZWQuIEl0J3Mg
cHJvdmlkZWQgYnkgImZpeGVkLXBhcnRpdGlvbnMiIGNvbXBhdGlibGUuCgpUaGVuIHlvdSBuZWVk
IHRvIGFkanVzdCBmaXhlZC1wYXJ0aXRpb25zIGZvciBzdWNoIGNhc2UuIFNlZSBzeXNjb24gY2Fz
ZQooYWxsIG92ZXIgdGhlIHRyZWUgYW5kIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZmQvc3lzY29uLnlhbWwpLgoKPiAKPj4gYW5kIGl0IGRvZXMgbm90Cj4+IGluY2x1ZGUgb3Vy
IHByZXZpb3VzIHRhbGtzLgo+IAo+IEF0IHRoZSB0aW1lLCBJIGRpZG4ndCByZWFsaXplIGhvdyBp
bXBvcnRhbnQgaXMgaXQuIFVuZGVyc3RhbmRpbmcgYmVnYW4KPiB0byBjb21lIGFmdGVyIGRvemVu
cyBvZiBleHBlcmltZW50cyBhbmQgY2hlY2tpbmcgdGhlIHNpbWlsYXIgTGludXggcGF0Y2hlcy4K
PiAKPj4+IGRpZmYgLS1naXQKPj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMueWFtbAo+Pj4gYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1s
Cj4+PiBpbmRleCBlYTRjYWNlNmE5NTUuLjllZWJlMzlhNTdmYiAxMDA2NDQKPj4+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0
aXRpb25zLnlhbWwKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwKPj4+IEBAIC0xOSw3ICsxOSwxMSBA
QCBtYWludGFpbmVyczoKPj4+IMKgCj4+PiDCoHByb3BlcnRpZXM6Cj4+PiDCoMKgIGNvbXBhdGli
bGU6Cj4+PiAtwqDCoMKgIGNvbnN0OiBmaXhlZC1wYXJ0aXRpb25zCj4+PiArwqDCoMKgIG9uZU9m
Ogo+Pj4gK8KgwqDCoMKgwqAgLSBjb25zdDogZml4ZWQtcGFydGl0aW9ucwo+Pj4gK8KgwqDCoMKg
wqAgLSBpdGVtczoKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogc2VyY29tbSxzYy1w
YXJ0aXRpb25zCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IGZpeGVkLXBhcnRpdGlv
bnMKPj4+IMKgCj4+PiDCoMKgICIjYWRkcmVzcy1jZWxscyI6IHRydWUKPj4+IMKgCj4+PiBAQCAt
MjcsNyArMzEsMTggQEAgcHJvcGVydGllczoKPj4+IMKgCj4+PiDCoHBhdHRlcm5Qcm9wZXJ0aWVz
Ogo+Pj4gwqDCoCAiQFswLTlhLWZdKyQiOgo+Pj4gLcKgwqDCoCAkcmVmOiAicGFydGl0aW9uLnlh
bWwjIgo+Pj4gK8KgwqDCoCBhbGxPZjoKPj4+ICvCoMKgwqDCoMKgIC0gJHJlZjogInBhcnRpdGlv
bi55YW1sIyIKPj4+ICvCoMKgwqDCoMKgIC0gaWY6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIHBy
b3BlcnRpZXM6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRhaW5zOgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb25zdDogc2VyY29tbSxzYy1wYXJ0aXRpb25zCj4+PiArwqDCoMKgwqDC
oMKgwqAgdGhlbjoKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgcHJvcGVydGllczoKPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHNjcGFydC1pZDoKPj4gSXQgc3RpbGwgbWlzc2VzIHZlbmRvciBw
cmVmaXggYW5kIHdlIGFncmVlZCB5b3UgZG9uJ3QgbmVlZCBpdCwgZGlkbid0IHdlPwo+IAo+IERv
IHlvdSBtZWFuICJzZXJjb21tIiB2ZW5kb3IgcHJlZml4PyBJZiBzbyB0aGVuIHdlIGFncmVlZCB0
aGF0IEkgaW5jbHVkZQo+IGl0IGluIGEgc2VwYXJhdGUgcGF0Y2g6CgpUaGVyZSB3YXMgc29tZSBt
aXN1bmRlcnN0YW5kaW5nIHRoZW4uIFdlIHRhbGsgaGVyZSBhYm91dCBzY3BhcnQtaWQgbmFtZS4K
QWRkaW5nIHZlbmRvciBwcmVmaXggY2Fubm90IGJlIGEgc2VwYXJhdGUgcGF0Y2ggYmVjYXVzZSBp
dCBkb2VzIG5vdCBtYWtlCm11Y2ggc2Vuc2UuIFlvdSBhZGQgbmV3IHByb3BlcnR5IHdpdGggd3Jv
bmcgbmFtZSBhbmQgaW1tZWRpYXRlbHkKY2hhbmdlL2ZpeCBpdCBpbiBuZXh0IHBhdGNoLgoKTm8s
IGl0IHNob3VsZCBoYXZlIHByb3BlciBuYW1lIHNpbmNlIGJlZ2lubmluZy4gVGhlIHByb3BlcnR5
IGlzIG5vdCB1c2VkCmluIHRoZSBrZXJuZWwuCgo+IAo+IExpbms6Cj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtbXRkLzFiMzkxMzk5LTk4NGItN2E2My0zMjY1LTYyZWYwOWNhZWMzOUBn
bWFpbC5jb20vCj4gCj4gSSdtIGdvaW5nIHRvIHNlbmQgaXQgaW4gdjM6Cj4gCj4gLS0tCj4gZHQt
YmluZGluZ3M6IEFkZCBTZXJjb21tIChTdXpob3UpIENvcnBvcmF0aW9uIHZlbmRvciBwcmVmaXgK
PiAKPiBVcGRhdGUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVm
aXhlcy55YW1sIHRvIGluY2x1ZGUKPiAic2VyY29tbSIgYXMgYSB2ZW5kb3IgcHJlZml4IGZvciAi
U2VyY29tbSAoU3V6aG91KSBDb3Jwb3JhdGlvbiIuCj4gQ29tcGFueSB3ZWJzaXRlOgo+IExpbms6
IGh0dHBzOi8vd3d3LnNlcmNvbW0uY29tLwo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pa2hhaWwgWmhp
bGtpbiA8Y3NoYXJwZXIyMDA1QGdtYWlsLmNvbT4KPiAtLS0KPiDCoERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCB8IDIgKysKPiDCoDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCj4gYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKPiBpbmRleCAwMTQzMDk3
M2VjZWMuLjY1ZmYyMjM2NGZiMyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKPiBAQCAtMTA4Miw2ICsxMDgy
LDggQEAgcGF0dGVyblByb3BlcnRpZXM6Cj4gwqDCoMKgwqAgZGVzY3JpcHRpb246IFNlbnNpcmlv
biBBRwo+IMKgwqAgIl5zZW5zb3J0ZWssLioiOgo+IMKgwqDCoMKgIGRlc2NyaXB0aW9uOiBTZW5z
b3J0ZWsgVGVjaG5vbG9neSBDb3Jwb3JhdGlvbgo+ICvCoCAiXnNlcmNvbW0sLioiOgo+ICvCoMKg
wqAgZGVzY3JpcHRpb246IFNlcmNvbW0gKFN1emhvdSkgQ29ycG9yYXRpb24KClRoaXMgY2FuIGJl
IHNlcGFyYXRlIHBhdGNoLCBidXQgaXQncyBzZXBhcmF0ZSBpc3N1ZS4uLgoKCkJlc3QgcmVnYXJk
cywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
