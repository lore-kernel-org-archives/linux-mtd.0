Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38114C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Apr 2022 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrQ0MOJg38/NzpX+KyxITqO5+lon+BpzXjP0a6NuiuQ=; b=e4Yv1z1QfDys3X
	Y0ucNNYG0oBWM6LmONDCfrxF5iXz/Iq9mwsMZkxO5+vmtVRIjtF5wGWr8PD0KZd5sx24JOR3WHwIe
	vOG+XwdQZekAzzoDMmTrp9j6IOOleQg9VA8tZJdSPXgc2N1cJjwP/dmMdzF4YkEyPbV8DEFkugneM
	LpwXj6PUMLoJpPyvq7ELoi3zSU2E347kDnjmjI9rh+Se0yQtYpTOaEcMcJvin6Kw1FNCL8B+6RQjx
	Vn5rb8jUuEDjMSxUWoDaQ0VTFCDroXV/5eQzj2XbrQLUF8P/WuxruiBXYIVyMFYRKkT1l5yzkjVRs
	AXENUhfFqM1q67OrJXLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk60e-007e6n-PD; Thu, 28 Apr 2022 15:24:48 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk60a-007e3a-9O
 for linux-mtd@lists.infradead.org; Thu, 28 Apr 2022 15:24:47 +0000
Received: by mail-lj1-x22a.google.com with SMTP id c15so7162491ljr.9
 for <linux-mtd@lists.infradead.org>; Thu, 28 Apr 2022 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SzJXhZg7qGrBl+J121B58kcKO0wVfv/TnHF/oCwmV6o=;
 b=hzmBfUP04rp5lGzXAo7D1RGUZ1S6j/COkdetxgNRb+SU7A+uun0bJ78x2DdmHJ5fHj
 TT3pTRQ0Rm5XlHh4ZjpHbZXAcVunIS5U9CRKGaVwRYQdAbE/kNkUbaxqJAznMOJCUqwU
 jqFTZ68BTSNvbHbajn31p8UYJLPGRUN3tsduXGryeD4ia9HnFkAHrwtYyX8WdlUcKyaP
 07jVeXi4kaBDcUsV3NuC+nWE2FES5WwKFOvoM2Ge3wq2ijeZwSmKlFpyfPfu/qFRc7fG
 iYqihaFt4y/OCtpE+lKrTKd8hJNdco+9QJB72olUze5Nq9UUsf5tpEjf7opUOc+RVIaA
 89KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SzJXhZg7qGrBl+J121B58kcKO0wVfv/TnHF/oCwmV6o=;
 b=ekqpsVmQsvGJvlI6R03F/Bubm/eriFepWe0cm7KFcY+ewfDatslNG+0rP8MEsZsGcX
 Inrmz/UNEuPgjbZjG8tFJIL1bLP+QJEBcQZBCzHH+VclKY2u414T4cOHe2hVqjhVkge8
 UoC+0Ql1HuhV2MqPR7+/NmbZDuxkldMw/h5Vt1SaT4yPGmK7r6/FYVGYQuYA22AJiWdM
 7QsYmf/vvvxl3DDEjPJiXMAyKZY771/q/KshKZOXEM1SZjGz2o3GeSsvbtsDw6Lw4Hv2
 LuvSQXMk1A/BJVN3x4472Dg1dEWH8BiDZSihI4+PRFgJIlpu4tb3Oov8/jsq39lmSwS6
 tiLg==
X-Gm-Message-State: AOAM531EAV2PICn7K4FzBWAyHqyKGBKiWm2lWkzIYwSKBx3/h+X8RfyR
 XO3yKeITzkj5uDm0wvO/fJc=
X-Google-Smtp-Source: ABdhPJxAsRNvdhIkNNUOuQo9jhs45Y/TigHYoQssJn3JBnGYv0FOckyPXgZr4kxnhvowMEuwzIz0AA==
X-Received: by 2002:a2e:1f11:0:b0:24b:6b35:42e3 with SMTP id
 f17-20020a2e1f11000000b0024b6b3542e3mr21503724ljf.195.1651159481353; 
 Thu, 28 Apr 2022 08:24:41 -0700 (PDT)
Received: from ?IPV6:2a06:a003:501a:a7ce:d836:2ab4:b41d:7819?
 ([2a06:a004:d009:c8fa:102c:912a:a6e3:41ea])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a2e9c0b000000b0024ace83744asm19844lji.116.2022.04.28.08.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 08:24:40 -0700 (PDT)
Message-ID: <25da3f43-c46e-8108-2da9-0e4f2b7cc1a4@gmail.com>
Date: Thu, 28 Apr 2022 18:24:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for
 Sercomm parser
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
From: Mikhail Zhilkin <csharper2005@gmail.com>
In-Reply-To: <db70e53b-7484-43bf-e9c8-b6a2dce1fbb5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_082444_389171_FADDFA23 
X-CRM114-Status: GOOD (  12.80  )
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

CkhpLCBLcnp5c3p0b2YsCgpPbiA0LzEwLzIwMjIgMTE6MTggQU0sIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6Cj4gSSBhbSBzb3JyeSwgYnV0IHlvdSBjaGFuZ2VkIG5vdyBhIGxvdCBpbiB0aGUg
YmluZGluZ3MgYW5kIGl0IGxvb2tzCj4gZW50aXJlbHkgZGlmZmVyZW50LiBUaGluZ3MgcHJldmlv
dXNseSBiZWluZyBjb3JyZWN0IG5vdyBhcmUgd3JvbmcsIHNvCj4gcmF0aGVyIHN0YXJ0IGZyb20g
eW91ciBvbGQgYmluZGluZ3MuLi4KCgpMb29rcyBsaWtlIEknbSBhIGJpdCBjb25mdXNlZC4uLiBJ
IHVzZSBkdWFsICJjb21wYXRpYmxlIiBpbiBteSByZWFsIGR0cwphbmQgSSByZWFsaXplZCB0aGF0
OgoKMS4gVGhlcmVmb3JlIEkgaGF2ZSB0byB1c2XCoCBkdWFsICJjb21wYXRpYmxlIiBpbiBleGFt
cGxlIHRvbzoKCmNvbXBhdGlibGUgPSAic2VyY29tbSxzYy1wYXJ0aXRpb25zIiwgImZpeGVkLXBh
cnRpdGlvbnMiOwoKMi4gV2hlbiBJJ20gdHJ5aW5nIHRvIHJldXNlICJmaXhlZC1wYXJ0aXRpb25z
IiBjb21wYXRpYmxlIGZyb20KZml4ZWQtcGFydGl0aW9ucy55YW1sIGluIG15IG5ldyAueWFtbCBJ
IGdldCAidG9vIGxvbmciIGVycm9ycy4KClJlYWwgZHRzOgoKTGluazoKaHR0cHM6Ly9naXRodWIu
Y29tL29wZW53cnQvb3BlbndydC9ibG9iL2VkY2MxYTlhNzM0YmIzZmNkYzkyNDIwMjUyOTBkM2Yx
NzNlNzFiNzgvdGFyZ2V0L2xpbnV4L3JhbWlwcy9kdHMvbXQ3NjIxX2JlZWxpbmVfc21hcnRib3gt
Z2lnYS5kdHMjTDc5CgpTbywgSSBjdXJyZW50bHkgZm91bmQgYW5vdGhlciBzb2x1dGlvbiAtIHRv
IGV4dGVuZCBmaXhlZC1wYXJ0aXRpb25zLnlhbWwKd2l0aCAic2VyY29tbSxzYy1wYXJ0aXRpb25z
Ii4gSXMgSXQgb2sgZnJvbSB5b3VyIHNpZGU/IENhbiBJIHVzZSB0aGlzCmNvZGUgaW4gdjM/Cgpk
aWZmIC0tZ2l0CmEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL2ZpeGVkLXBhcnRpdGlvbnMueWFtbApiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwKaW5kZXggZWE0Y2FjZTZh
OTU1Li45ZWViZTM5YTU3ZmIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlv
bnMueWFtbApAQCAtMTksNyArMTksMTEgQEAgbWFpbnRhaW5lcnM6CsKgCsKgcHJvcGVydGllczoK
wqDCoCBjb21wYXRpYmxlOgotwqDCoMKgIGNvbnN0OiBmaXhlZC1wYXJ0aXRpb25zCivCoMKgwqAg
b25lT2Y6CivCoMKgwqDCoMKgIC0gY29uc3Q6IGZpeGVkLXBhcnRpdGlvbnMKK8KgwqDCoMKgwqAg
LSBpdGVtczoKK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBzZXJjb21tLHNjLXBhcnRpdGlv
bnMKK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBmaXhlZC1wYXJ0aXRpb25zCsKgCsKgwqAg
IiNhZGRyZXNzLWNlbGxzIjogdHJ1ZQrCoApAQCAtMjcsNyArMzEsMTggQEAgcHJvcGVydGllczoK
wqAKwqBwYXR0ZXJuUHJvcGVydGllczoKwqDCoCAiQFswLTlhLWZdKyQiOgotwqDCoMKgICRyZWY6
ICJwYXJ0aXRpb24ueWFtbCMiCivCoMKgwqAgYWxsT2Y6CivCoMKgwqDCoMKgIC0gJHJlZjogInBh
cnRpdGlvbi55YW1sIyIKK8KgwqDCoMKgwqAgLSBpZjoKK8KgwqDCoMKgwqDCoMKgwqDCoCBwcm9w
ZXJ0aWVzOgorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgorwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY29udGFpbnM6CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29uc3Q6IHNlcmNvbW0sc2MtcGFydGl0aW9ucworwqDCoMKgwqDCoMKgwqAgdGhlbjoKK8KgwqDC
oMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzY3BhcnQt
aWQ6CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXNjcmlwdGlvbjogUGFydGl0aW9uIGlk
IGluIFNlcmNvbW0gcGFydGl0aW9uIG1hcAorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCsKgCsKgcmVxdWlyZWQ6
CsKgwqAgLSAiI2FkZHJlc3MtY2VsbHMiCkBAIC0xMTksMyArMTM0LDI5IEBAIGV4YW1wbGVzOgrC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKwqDCoMKgwqDCoMKgwqDCoCB9OwrCoMKgwqDCoCB9
OworwqAgLSB8CivCoMKgwqAgcGFydGl0aW9ucyB7CivCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxl
ID0gInNlcmNvbW0sc2MtcGFydGl0aW9ucyIsICJmaXhlZC1wYXJ0aXRpb25zIjsKK8KgwqDCoMKg
wqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDE+OworwqDCoMKgwqDCoMKgwqAgI3NpemUtY2VsbHMg
PSA8MT47CisKK8KgwqDCoMKgwqDCoMKgIHBhcnRpdGlvbkAwIHsKK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbGFiZWwgPSAidS1ib290IjsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4
MCAweDEwMDAwMD47CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNjcGFydC1pZD08MD47CivCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJlYWQtb25seTsKK8KgwqDCoMKgwqDCoMKgIH07CisKK8KgwqDC
oMKgwqDCoMKgIHBhcnRpdGlvbkAxMDAwMDAgeworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsYWJl
bCA9ICJkeW5hbWljIHBhcnRpdGlvbiBtYXAiOworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcg
PSA8MHgxMDAwMDAgMHgxMDAwMDA+OworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzY3BhcnQtaWQg
PSA8MT47CivCoMKgwqDCoMKgwqDCoCB9OworCivCoMKgwqDCoMKgwqDCoCBwYXJ0aXRpb25AMjAw
MDAwIHsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFiZWwgPSAiRmFjdG9yeSI7CivCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDIwMDAwMCAweDEwMDAwMD47CivCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHNjcGFydC1pZCA9IDwyPjsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVhZC1v
bmx5OworwqDCoMKgwqDCoMKgwqAgfTsKK8KgwqDCoCB9OwotLSAKMi4yNS4xCgoKPj4gKwo+PiAr
YWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKPiBUaGlzIGlzIHdyb25nLCB3aHkgaXQgYmVjYW1l
IHRydWU/CgpZb3UncmUgcmlnaHQuIEdvdCBpdAoKCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRv
ZgoKLS0gCkJlc3QgcmVnYXJkcywKTWlraGFpbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
