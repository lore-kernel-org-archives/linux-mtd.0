Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57334C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 06:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlAHoo3xkr31YWmZig+PEakvzZKZMVhePGfbsZ9Ix0I=; b=hXC98WsXOOp1QU
	vQ8T3kXavJU6PbrCdmHY+vvfDoKI4g02iA0f/0a28TevzpCYN0OoSo7gd8gtD2VqV9sUThSL4CGqa
	4Urd9YeyJ2MZhWqKAw5xOFzoze+ju9l4qECWcB6/fzZjnhJVn5lOPT1/+BU3hS8ONGdJbhmttnm9E
	r5sFAm9IBpy0VX0kWzwBQULEuuwUy0dTh4XIyMkRTNWkEv1pAoMqzwIaLNMmDV5g0ugtMxyHDOqlk
	kkD4yy/GFzDSU9VJQGdUCYKLIrqjgOQHzTvLzbSGvgxPuNl04pj2D5OCmc5x68AB20TWjup+juO/B
	Uy1wezfbRaNaYrAvMhmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkKOX-009qBo-8o; Fri, 29 Apr 2022 06:46:25 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkKOT-009q4l-Sy
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 06:46:23 +0000
Received: by mail-ej1-x631.google.com with SMTP id l18so13586534ejc.7
 for <linux-mtd@lists.infradead.org>; Thu, 28 Apr 2022 23:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xrvbVTYSX718CzoTpb87YI9jX7d2f6okuPzmrfDd5oE=;
 b=xNVFNFY3Yyl8v2oJkDosbR3b1ZGnJSLguQsNF3lKuBhGL2kxMx7xSGtK7IRL49NmC1
 fy8DaSfoY9BdGhtGFNFovlrJyW3A8R9DoUtUb8Y7+VxHCvAlN0WIv9ebko+UKVB+T7YK
 2P3Bn2+9zX7wy832/UWEI+rG/3G+TaZAeaG2xjqYe+NHkz3AHCpMUkykrxExfupZaEH4
 ckyAWBfHZxpmgwIIttJxvE16ActebkFCSDYMKm0/ESuWI0Tl3ZmTxKioSv686do1zUU8
 zI0dcSl3OWlbmfRo9RnuL1Xi6RfC51JpYdjEv3XDOjmKKYb5oMSr5Z3eNLDrdMXObegy
 zVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xrvbVTYSX718CzoTpb87YI9jX7d2f6okuPzmrfDd5oE=;
 b=UOQXyJinQeM3KkfL4WfygeleeCRWK7x632gZUBYWpDa4WGNTLhgrYHTt3SrKTqrTXI
 0Gwk5mYrvDPWZbfkPpGFq9t+JxwU2qhEiclP66Q5sL+SePeBaZx6cueglY1L1IDthrkI
 B8dsiaVgWr2PHrJJImMilJF+SMNZUPz9zvqI/9/hVFEgnFDfNeItdg69FM/OdrVx8VlK
 c7tIDLHHnpPYXfTJEo7icfg4nUVlumyLdIYhNhYyUpQQakxRz1vEwWS1q/rUUP/jbzuP
 7YHg/zfAzy262iExEdXXP910n1rSY9D6O4W5VYwudwk8hbpkm4/6oX9FqO2caGcGHdYD
 wNOw==
X-Gm-Message-State: AOAM533PhRg525Hn8dx1LiSuK2amIXOjojAVNIoy+9GxfY6KQNcvV9oB
 0SFD8waA8lkOYWcFip3Fbn7x6A==
X-Google-Smtp-Source: ABdhPJyuO3oZ/QiDbGWXSb64bqbYgx5YfcpXNcJaXAf8/j0v4zYwZp7O7t6DpPDOfTAGtkYuWXD+RA==
X-Received: by 2002:a17:907:3f8f:b0:6f3:d4a0:e80c with SMTP id
 hr15-20020a1709073f8f00b006f3d4a0e80cmr8215819ejc.709.1651214779739; 
 Thu, 28 Apr 2022 23:46:19 -0700 (PDT)
Received: from [192.168.0.168] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 og39-20020a1709071de700b006f3ef214e61sm345251ejc.199.2022.04.28.23.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 23:46:19 -0700 (PDT)
Message-ID: <b279040a-a782-a2ca-2acb-2d8f07709081@linaro.org>
Date: Fri, 29 Apr 2022 08:46:18 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <25da3f43-c46e-8108-2da9-0e4f2b7cc1a4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_234621_974522_9912FBD8 
X-CRM114-Status: GOOD (  19.29  )
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

T24gMjgvMDQvMjAyMiAxNzoyNCwgTWlraGFpbCBaaGlsa2luIHdyb3RlOgo+IAo+IEhpLCBLcnp5
c3p0b2YsCj4gCj4gT24gNC8xMC8yMDIyIDExOjE4IEFNLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+PiBJIGFtIHNvcnJ5LCBidXQgeW91IGNoYW5nZWQgbm93IGEgbG90IGluIHRoZSBiaW5k
aW5ncyBhbmQgaXQgbG9va3MKPj4gZW50aXJlbHkgZGlmZmVyZW50LiBUaGluZ3MgcHJldmlvdXNs
eSBiZWluZyBjb3JyZWN0IG5vdyBhcmUgd3JvbmcsIHNvCj4+IHJhdGhlciBzdGFydCBmcm9tIHlv
dXIgb2xkIGJpbmRpbmdzLi4uCj4gCj4gCj4gTG9va3MgbGlrZSBJJ20gYSBiaXQgY29uZnVzZWQu
Li4gSSB1c2UgZHVhbCAiY29tcGF0aWJsZSIgaW4gbXkgcmVhbCBkdHMKPiBhbmQgSSByZWFsaXpl
ZCB0aGF0Ogo+IAo+IDEuIFRoZXJlZm9yZSBJIGhhdmUgdG8gdXNlwqAgZHVhbCAiY29tcGF0aWJs
ZSIgaW4gZXhhbXBsZSB0b286Cj4gCj4gY29tcGF0aWJsZSA9ICJzZXJjb21tLHNjLXBhcnRpdGlv
bnMiLCAiZml4ZWQtcGFydGl0aW9ucyI7Cj4gCj4gMi4gV2hlbiBJJ20gdHJ5aW5nIHRvIHJldXNl
ICJmaXhlZC1wYXJ0aXRpb25zIiBjb21wYXRpYmxlIGZyb20KPiBmaXhlZC1wYXJ0aXRpb25zLnlh
bWwgaW4gbXkgbmV3IC55YW1sIEkgZ2V0ICJ0b28gbG9uZyIgZXJyb3JzLgoKWWVzLCB0aGUgZml4
ZWQtcGFydGl0aW9ucy55YW1sIHdvdWxkIGhhdmUgdG8gYmUgY2hhbmdlZCB0byBhbGxvdyBleHRl
bnNpb24uCgo+IAo+IFJlYWwgZHRzOgo+IAo+IExpbms6Cj4gaHR0cHM6Ly9naXRodWIuY29tL29w
ZW53cnQvb3BlbndydC9ibG9iL2VkY2MxYTlhNzM0YmIzZmNkYzkyNDIwMjUyOTBkM2YxNzNlNzFi
NzgvdGFyZ2V0L2xpbnV4L3JhbWlwcy9kdHMvbXQ3NjIxX2JlZWxpbmVfc21hcnRib3gtZ2lnYS5k
dHMjTDc5Cj4gCj4gU28sIEkgY3VycmVudGx5IGZvdW5kIGFub3RoZXIgc29sdXRpb24gLSB0byBl
eHRlbmQgZml4ZWQtcGFydGl0aW9ucy55YW1sCj4gd2l0aCAic2VyY29tbSxzYy1wYXJ0aXRpb25z
Ii4gSXMgSXQgb2sgZnJvbSB5b3VyIHNpZGU/IENhbiBJIHVzZSB0aGlzCj4gY29kZSBpbiB2Mz8K
Ck5vdCByZWFsbHksIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgZG8geW91IG5lZWQgaXQgYW5kIGl0
IGRvZXMgbm90CmluY2x1ZGUgb3VyIHByZXZpb3VzIHRhbGtzLgoKPiAKPiBkaWZmIC0tZ2l0Cj4g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQt
cGFydGl0aW9ucy55YW1sCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sCj4gaW5kZXggZWE0Y2FjZTZhOTU1Li45
ZWViZTM5YTU3ZmIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMueWFtbAo+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25z
LnlhbWwKPiBAQCAtMTksNyArMTksMTEgQEAgbWFpbnRhaW5lcnM6Cj4gwqAKPiDCoHByb3BlcnRp
ZXM6Cj4gwqDCoCBjb21wYXRpYmxlOgo+IC3CoMKgwqAgY29uc3Q6IGZpeGVkLXBhcnRpdGlvbnMK
PiArwqDCoMKgIG9uZU9mOgo+ICvCoMKgwqDCoMKgIC0gY29uc3Q6IGZpeGVkLXBhcnRpdGlvbnMK
PiArwqDCoMKgwqDCoCAtIGl0ZW1zOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogc2Vy
Y29tbSxzYy1wYXJ0aXRpb25zCj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBmaXhlZC1w
YXJ0aXRpb25zCj4gwqAKPiDCoMKgICIjYWRkcmVzcy1jZWxscyI6IHRydWUKPiDCoAo+IEBAIC0y
Nyw3ICszMSwxOCBAQCBwcm9wZXJ0aWVzOgo+IMKgCj4gwqBwYXR0ZXJuUHJvcGVydGllczoKPiDC
oMKgICJAWzAtOWEtZl0rJCI6Cj4gLcKgwqDCoCAkcmVmOiAicGFydGl0aW9uLnlhbWwjIgo+ICvC
oMKgwqAgYWxsT2Y6Cj4gK8KgwqDCoMKgwqAgLSAkcmVmOiAicGFydGl0aW9uLnlhbWwjIgo+ICvC
oMKgwqDCoMKgIC0gaWY6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGU6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnRhaW5zOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Q6IHNl
cmNvbW0sc2MtcGFydGl0aW9ucwo+ICvCoMKgwqDCoMKgwqDCoCB0aGVuOgo+ICvCoMKgwqDCoMKg
wqDCoMKgwqAgcHJvcGVydGllczoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzY3BhcnQtaWQ6
CgpJdCBzdGlsbCBtaXNzZXMgdmVuZG9yIHByZWZpeCBhbmQgd2UgYWdyZWVkIHlvdSBkb24ndCBu
ZWVkIGl0LCBkaWRuJ3Qgd2U/CgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
