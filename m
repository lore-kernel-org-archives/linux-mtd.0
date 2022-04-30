Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47BAC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Apr 2022 14:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5oijYcrqi4AkFmoflUm+RQNEJbF2eIyZ4LuQ8Kqi/w=; b=KTUgLuBXtsVSsq
	71O/nUtivJ0yPrIVNgm9HbbIbE4GKWZmPHCEl3xxo5dVctOv56CPyAAkIOya0Qo8QstwmciRhog42
	3AXi5eVCFRywyUiwg9w566lJTdcWQDCs8UqLmVIyYfWp7DNgv3RBwVGZbZscAD14dmiKLYgIVYAJN
	VLKrr13V4mT3h7WMLII8EEGHcq/d6NQWTVJ86P7Qz1v/AjzmH12JBsDg7eCoVMIU9yfLBr9BEJgaC
	bcYnxzhfhleUiVgQTTOXXIrBampErcZdYcXSwg7hkzxlIlnftIy3ARxhmdEIBPRDUIP8jA4MB67C8
	ThLyGEcS8B5yncOOmRMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkoCb-00EVSf-Tq; Sat, 30 Apr 2022 14:36:05 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkoCX-00EVS7-2Z
 for linux-mtd@lists.infradead.org; Sat, 30 Apr 2022 14:36:05 +0000
Received: by mail-ed1-x532.google.com with SMTP id t5so1419900edw.11
 for <linux-mtd@lists.infradead.org>; Sat, 30 Apr 2022 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1WgubGSoJAPdWjBnPDgWauo3P+IMmZgZaRGmCmfoizc=;
 b=FVjVyF73PZABV91yo+wd5pvA43nakkeivhaxZs5+/JKDGWwTAGYssQOMAxJuYmkuH1
 19kLfQgLuiw/ZM2yM/FBD2JFZYnBaev665PmkuI+y/tZNQY3520+orSBziIcdg8XF5KW
 zGga89CvLdBkB/E0bmyKO5LfgkY4DvAkbIK4CM87XCgmuP1R3zxC1/yMeWsimRkgedE6
 6e2Ag+QvN8tG0GEE3bwH7A38uhfuQmxH3anZ0KZDDD7pAex/dHEkeGYxZaGuOw2fg/58
 k5zSoRdOILdqXONqhavBEuE1moP0ybE0tLYVT1HYv3DlzuDxGCfbiA0UJAy4bpT1Ohrc
 IFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1WgubGSoJAPdWjBnPDgWauo3P+IMmZgZaRGmCmfoizc=;
 b=vUiIc/IL4xUTn4FNyhGsqSs7xOQMRUcJMo/gjNRngws/KVEDkh1yLSDz5lpwojiClR
 y35u9bPUYpaBzgKGO4tJA7DdR/MqKQSVrp6yoH8X8JCxKq5S2nRe1I85RAzPskcdaQmV
 ddnXW52O/wPvt6OBVI/RwPIZ34g71LRSTU+oRJ+mhdiVfPkgTRInn0QlT2DFJa1Ha5+D
 Tn9ZhiVDFyMdeDZhGb/QNRDLHEX58C6yGSmBoLRVw4uNUjqRWN/owuZRj0PRn89OaDs+
 wo961UM9Qq/jtQdqeyl5rTZjGb2EabRdhd4jPqm6al+AfHRexul5Y98cLHzGiOcYJ0sF
 HzbA==
X-Gm-Message-State: AOAM531lAkTxGjHGpjQZjCmseCvGsSYP+/oUB9EVR4ir7KUIuONEmiTr
 vRJdF8McZDO84LGr8hBs2pofLQ==
X-Google-Smtp-Source: ABdhPJxNeIB6AHKIO3rPt2UhdsqdD5/9TG6O/V7b7rM9TRQgx/XsND+2Kw96U5Y28+pQ8FQA62QMnw==
X-Received: by 2002:a05:6402:3711:b0:425:d3d6:2b65 with SMTP id
 ek17-20020a056402371100b00425d3d62b65mr4785658edb.328.1651329358961; 
 Sat, 30 Apr 2022 07:35:58 -0700 (PDT)
Received: from [192.168.0.180] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 r20-20020aa7da14000000b0042617ba63cdsm4172971eds.87.2022.04.30.07.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 07:35:58 -0700 (PDT)
Message-ID: <2e51842a-d2c9-8953-13aa-02ad3abb3f14@linaro.org>
Date: Sat, 30 Apr 2022 16:35:57 +0200
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
 <a84df850-149e-9656-43fa-1f040368a9f1@linaro.org>
 <0450d781-c506-c28e-a0e5-435bee16721f@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0450d781-c506-c28e-a0e5-435bee16721f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_073601_208996_BF4D6A98 
X-CRM114-Status: GOOD (  13.63  )
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

T24gMzAvMDQvMjAyMiAxMDowNCwgTWlraGFpbCBaaGlsa2luIHdyb3RlOgo+IAo+IGRpZmYgLS1n
aXQKPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9m
aXhlZC1wYXJ0aXRpb25zLnlhbWwKPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwKPiBpbmRleCBlYTRjYWNlNmE5
NTUuLmZhNDU3ZDU1NTU5YiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRp
dGlvbnMueWFtbAo+IEBAIC0xNyw5ICsxNywyOSBAQCBkZXNjcmlwdGlvbjogfAo+IMKgbWFpbnRh
aW5lcnM6Cj4gwqDCoCAtIFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiDCoAo+
ICtzZWxlY3Q6Cj4gK8KgIHByb3BlcnRpZXM6Cj4gK8KgwqDCoCBjb21wYXRpYmxlOgo+ICvCoMKg
wqDCoMKgIGNvbnRhaW5zOgo+ICvCoMKgwqDCoMKgwqDCoCBlbnVtOgo+ICvCoMKgwqDCoMKgwqDC
oMKgwqAgLSBmaXhlZC1wYXJ0aXRpb25zCj4gKwo+ICvCoCByZXF1aXJlZDoKPiArwqDCoMKgIC0g
Y29tcGF0aWJsZQoKV2l0aCB5b3VyIGFwcHJvYWNoIHlvdSBkbyBub3QgbmVlZCB0aGlzIGVudGly
ZSBzZWxlY3QuIEkgcG9pbnRlZCBvdXQgdG8KeW91IGlmIHlvdSB3YW50ZWQgdG8gdGFrZSB0aGUg
c3lzY29uIGFwcHJvYWNoLgoKPiArCj4gwqBwcm9wZXJ0aWVzOgo+IMKgwqAgY29tcGF0aWJsZToK
PiAtwqDCoMKgIGNvbnN0OiBmaXhlZC1wYXJ0aXRpb25zCj4gK8KgwqDCoCBhbnlPZjoKCm9uZU9m
Cgo+ICvCoMKgwqDCoMKgIC0gaXRlbXM6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gc2VyY29tbSxzYy1wYXJ0aXRpb25zCj4gKwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogZml4ZWQtcGFydGl0aW9ucwo+ICsKPiArwqDC
oMKgwqDCoCAtIGNvbnRhaW5zOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Q6IGZpeGVkLXBh
cnRpdGlvbnMKPiArwqDCoMKgwqDCoMKgwqAgbWluSXRlbXM6IDEKPiArwqDCoMKgwqDCoMKgwqAg
bWF4SXRlbXM6IDIKClRoaXMgaXMgYWxzbyBub3QgbmVlZGVkIGlmIHlvdSBkbyBubyB0YWtlIHRo
ZSBzeXNjb24gYXBwcm9hY2guCgo+IMKgCj4gwqDCoCAiI2FkZHJlc3MtY2VsbHMiOiB0cnVlCj4g
wqAKPiBAQCAtMjcsNyArNDcsMTggQEAgcHJvcGVydGllczoKPiDCoAo+IMKgcGF0dGVyblByb3Bl
cnRpZXM6Cj4gwqDCoCAiQFswLTlhLWZdKyQiOgo+IC3CoMKgwqAgJHJlZjogInBhcnRpdGlvbi55
YW1sIyIKPiArwqDCoMKgIGFsbE9mOgo+ICvCoMKgwqDCoMKgIC0gJHJlZjogInBhcnRpdGlvbi55
YW1sIyIKPiArwqDCoMKgwqDCoCAtIGlmOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgcHJvcGVydGll
czoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb250YWluczoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbnN0OiBzZXJjb21tLHNjLXBhcnRpdGlvbnMKPiArwqDCoMKgwqDCoMKgwqAgdGhlbjoKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c2VyY29tbSxzY3BhcnQtaWQ6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlc2NyaXB0
aW9uOiBQYXJ0aXRpb24gaWQgaW4gU2VyY29tbSBwYXJ0aXRpb24gbWFwCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Vp
bnQzMgoKSSB0aGluayB3ZSBzdGlsbCBkaWQgbm90IGNsYXJpZnkgd2h5IGRvIHlvdSBuZWVkIHRo
aXMgSUQgd2hpY2ggaW4gYWxsCnlvdXIgZXhhbXBsZXMgaW5jcmVtZW50cyBieSBvbmUuIFRoZSBk
ZXNjcmlwdGlvbiBiYXNpY2FsbHkgaXMgYSBjb3B5IG9mCnByb3BlcnR5IG5hbWUsIHNvIGl0IGRv
ZXMgbm90IGV4cGxhaW4gYW55dGhpbmcuCgo+IMKgCj4gwqByZXF1aXJlZDoKPiDCoMKgIC0gIiNh
ZGRyZXNzLWNlbGxzIgo+IEBAIC0xMTksMyArMTUwLDI5IEBAIGV4YW1wbGVzOgo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9Owo+IMKgwqDCoMKgwqDCoMKgwqAgfTsKPiDCoMKgwqDCoCB9OwoK
QmxhbmsgbGluZS4KCj4gK8KgIC0gfAo+ICvCoMKgwqAgcGFydGl0aW9ucyB7Cj4gK8KgwqDCoMKg
wqDCoMKgIGNvbXBhdGlibGUgPSAic2VyY29tbSxzYy1wYXJ0aXRpb25zIiwgImZpeGVkLXBhcnRp
dGlvbnMiOwo+ICvCoMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArwqDCoMKg
wqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8MT47Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoCBwYXJ0aXRp
b25AMCB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFiZWwgPSAidS1ib290IjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4MTAwMDAwPjsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzZXJjb21tLHNjcGFydC1pZD08MD47CgpNaXNzaW5nIHNwYWNlcyBhcm91bmQg
PS4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
