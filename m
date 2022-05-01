Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABDCC433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  1 May 2022 16:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S647IWLGLhly0QvElKVBpiLgTr+XzaJV4d8QWONERSA=; b=kijWYnAQQRUY+X
	PT/xjpo9iBlZFFlhE+Q7fihHiVX726DAfcQ6Dbz4yaREuI8hveQLzIrJbzck1E7dyHkuBr4wvxUn7
	8+Cl+tm1GfixNszSI6Z7ifOSf5IC87pMhb9MpAPQKYixLMWmug4jLH3yzoO9ueD5aNohLjcVNPzVY
	ZBiFASPemb+yyUasXFCxvIDsI+mc7Ux1H4CpEXj/DSqGRRPH3XdmSua32hm1yjDE4exoZLx+dQkxf
	gBbKanCM33ngxZAuowV3GL47ygDepLiLwycQBw5m/ET+SpqTjdRvz325SFq0hd/9s7pEGobU41f7e
	ldLwyukMx94IJvgxrerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlCGL-00GZD0-M8; Sun, 01 May 2022 16:17:33 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlCGH-00GZCX-OQ
 for linux-mtd@lists.infradead.org; Sun, 01 May 2022 16:17:32 +0000
Received: by mail-ej1-x630.google.com with SMTP id kq17so23912582ejb.4
 for <linux-mtd@lists.infradead.org>; Sun, 01 May 2022 09:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x5ohyCygEHddhh2Mt5evi/snR/P1ql5wrtaula7bajY=;
 b=mLJgk+VCGKhaJ/vJniRuSmtaGWsZLod8QFNDKz4LeIbaZePqtsu/Q+0Wv5qc0wvd+V
 3TpORtiJdVx/D5P6u2kgc0nzUNCiGNb8k7XHyjNSjMcBggQKVza0v/iFCrsuSxXuPhEx
 xpDRii2tg6xfNAUPKCAv86KQtDHSxnKNvZRik6q4XH2F/GqmkIBIjacBfPljmoGU/v6R
 LQsR8Ql3WnVNpL5tcfvCe1PYOeeX3HFYQuX4fhdhY51SyX9nWQcXuEyUKFd2THxgO2hy
 icOc5MC+OMYf9ryPQV0V20mIICXv9e1DoJtl0ym79E9kOw3Ysl6JU85N47XUx94qHRSo
 DvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x5ohyCygEHddhh2Mt5evi/snR/P1ql5wrtaula7bajY=;
 b=ObA1HtlnnN2J2qyWQfERHsvKxeRTT4IaA8GiL/7/6OuzS3bQAy1bErrELiytN6Yxt4
 Z1BR1LEkW9hP6WRwd4gyV7pOH0YGomm2LTa+h/5r2e5sYwKL+iCd1EVqLmSMta9hvz8C
 cIylghSr5QFs5874a8IFniDDquw5VG+A6lVp2Na5c1R/B6tLY+LRB+bMmn0YBLcvWcl3
 wL2MoZYCpj7xD+2/10SVefXURrStR37udd1PNSmLp2qGEkV3yZdkcPz4uu+hCP8g7OZF
 ewxDNHqRjXuEshNPUCmJMTE8Cit6DBXW5Ohbb4XKQkIMfPt819kHvNOSRHAjJlt8bECG
 SR2g==
X-Gm-Message-State: AOAM530j4VnP9N8Mxv9ljUZcSa0Z4emtfWYQU3U/Cgt6xdaCRdW+Kjy3
 bo0B/ottiXi+l5JSOMxKSpZihb/bDaYHDg==
X-Google-Smtp-Source: ABdhPJyPNsLWguq1ZcYy8FBqygSRQv0qbEI3lwLesqKVjA3jDL6zXrdUI3kmcc08tDjI5hGx0A0D1A==
X-Received: by 2002:a17:906:6a15:b0:6f4:4de5:de39 with SMTP id
 qw21-20020a1709066a1500b006f44de5de39mr1440718ejc.317.1651421846684; 
 Sun, 01 May 2022 09:17:26 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 jz26-20020a17090775fa00b006f3ef214e49sm2716602ejc.175.2022.05.01.09.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 09:17:26 -0700 (PDT)
Message-ID: <11fbbafd-e7ce-f921-2073-146e96f01f6b@linaro.org>
Date: Sun, 1 May 2022 18:17:24 +0200
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
 <2e51842a-d2c9-8953-13aa-02ad3abb3f14@linaro.org>
 <ee5f293a-e59a-03d8-d9e4-ef35d33b5383@gmail.com>
 <6c3ba4a7-80b0-5fd1-eb08-1f9e256b02c4@linaro.org>
 <909094fd-ded0-38f9-b374-dd5f7b63e298@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <909094fd-ded0-38f9-b374-dd5f7b63e298@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_091729_868163_2181C9A0 
X-CRM114-Status: GOOD (  20.85  )
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

T24gMDEvMDUvMjAyMiAxNjo1MSwgTWlraGFpbCBaaGlsa2luIHdyb3RlOgo+IE9uIDUvMS8yMDIy
IDExOjE3IEFNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IAo+PiBPbiAzMC8wNC8yMDIy
IDIwOjU0LCBNaWtoYWlsIFpoaWxraW4gd3JvdGU6Cj4+PiDCoHBhdHRlcm5Qcm9wZXJ0aWVzOgo+
Pj4gwqDCoCAiQFswLTlhLWZdKyQiOgo+Pj4gLcKgwqDCoCAkcmVmOiAicGFydGl0aW9uLnlhbWwj
Igo+Pj4gK8KgwqDCoCBhbGxPZjoKPj4+ICvCoMKgwqDCoMKgIC0gJHJlZjogInBhcnRpdGlvbi55
YW1sIyIKPj4+ICvCoMKgwqDCoMKgIC0gaWY6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIHByb3Bl
cnRpZXM6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRhaW5zOgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjb25zdDogc2VyY29tbSxzYy1wYXJ0aXRpb25zCj4+PiArwqDCoMKgwqDCoMKg
wqAgdGhlbjoKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgcHJvcGVydGllczoKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNlcmNvbW0sc2NwYXJ0LWlkOgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGRlc2NyaXB0aW9uOiBQYXJ0aXRpb24gaWQgaW4gU2VyY29tbSBwYXJ0aXRpb24g
bWFwLiBQYXJzZXIKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdXNlcyB0aGlz
IGlkIHRvIGdldCBwYXJ0aXRpb24gb2Zmc2V0IGFuZCBzaXplIHZhbHVlcyBmcm9tCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGR5bmFtaWMgcGFydGl0aW9uIG1hcC4KPj4gUGFy
dGl0aW9uIG9mZnNldCBhbmQgc2l6ZSB2YWx1ZXMgYXJlIG5vdCBkZXJpdmVkIGZyb20gc2NwYXJ0
LWlkLiBJIGFtCj4+IHNvcnJ5IGJ1dCBhZnRlciBhbGwgdGhlc2UgcXVlc3Rpb25zIC0gaXQncyB0
aGUgdGhpcmQgdGltZSBub3cgLSB5b3UKPj4gbmV2ZXIgYW5zd2VyIHdoeSBkbyB5b3UgbmVlZCB0
aGlzIHByb3BlcnR5IGFuZCB3aGF0IGlzIGl0IHVzZWQgZm9yLiBGcm9tCj4+IGFsbCB0aGUgZXhh
bXBsZXMgaXQgY291bGQgYmUgc2ltcGx5IHJlbW92ZWQgYW5kIHRoZSBwYXJ0aXRpb24gbWFwIHdp
bGwKPj4gYmUgZXhhY3RseSB0aGUgc2FtZS4KPiBzY3BhcnQtaWQgaXMgbmVjZXNzYXJ5IHRvIGdl
dCAodXNpbmcgbXRkIHBhcnNlcikgcGFydGl0aW9uIG9mZnNldCBhbmQKPiBzaXplIGZyb20gZHlu
YW1pYyBwYXJ0aXRpb24gbWFwIChOT1QgZnJvbSB0aGUgcmVnIHByb3BlcnR5KToKPiAKPiDina8g
eHhkIC1lIC1jIDEyIC1zICQoKDB4ODAwKSkgLWwgJCgoMHg3OCkpIG10ZDEKPiAwMDAwMDgwMDog
MDAwMDAwMDAgMDAwMDAwMDAgMDAxMDAwMDDCoCAuLi4uLi4uLi4uLi4KPiAwMDAwMDgwYzogMDAw
MDAwMDEgMDAxMDAwMDAgMDAxMDAwMDDCoCAuLi4uLi4uLi4uLi4KPiAwMDAwMDgxODogMDAwMDAw
MDIgMDAyMDAwMDAgMDAxMDAwMDDCoCAuLi4uLi4gLi4uLi4KPiAwMDAwMDgyNDogMDAwMDAwMDMg
MDAzMDAwMDAgMDAxMDAwMDDCoCAuLi4uLi4wLi4uLi4KPiAwMDAwMDgzMDogMDAwMDAwMDQgMDA0
MDAwMDAgMDA2MDAwMDDCoCAuLi4uLi5ALi4uYC4KPiAwMDAwMDgzYzogMDAwMDAwMDUgMDBhMDAw
MDAgMDA2MDAwMDDCoCAuLi4uLi4uLi4uYC4KPiAwMDAwMDg0ODogMDAwMDAwMDYgMDEwMDAwMDAg
MDIwMDAwMDDCoCAuLi4uLi4uLi4uLi4KPiAwMDAwMDg1NDogMDAwMDAwMDcgMDMwMDAwMDAgMDIw
MDAwMDDCoCAuLi4uLi4uLi4uLi4KPiAwMDAwMDg2MDogMDAwMDAwMDggMDUwMDAwMDAgMDE0MDAw
MDDCoCAuLi4uLi4uLi4uQC4KPiAwMDAwMDg2YzogMDAwMDAwMDkgMDY0MDAwMDAgMDFiODAwMDDC
oCAuLi4uLi5ALi4uLi4KPiDCoMKgwqDCoMKgwqDCoMKgwqAgc2NwYXJ0LWlkwqAgb2Zmc2V0wqDC
oCDCoMKgIHNpemUKPiAKPiBXaXRoIHNlcmNvbW0sc2MtcGFydGl0aW9ucyB0aGUgcmVnIHByb3Bl
cnR5IHdpbGwgYmUgaWdub3JlZCAob2Zmc2V0ID0KPiAweDIwMDAwMCwgc2l6ZSA9IDB4MTAwMDAw
KSBhbmQgdGhlIHZhbHVlcyB3aWxsIGJlIHRha2VuIGZyb20gcGFydGl0aW9uIG1hcC4KPiAKPiBG
b3IgZXhhbXBsZSB3ZSBoYXZlIHRoaXMgaXMgZHRzOgo+IAo+IHBhcnRpdGlvbkAyMDAwMDAgewo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFiZWwgPSAiRmFjdG9yeSI7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZWcgPSA8MHgyMDAwMDAgMHgxMDAwMDA+Owo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc2VyY29tbSxzY3BhcnQtaWQgPSA8Mj47Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZWFkLW9ubHk7Cj4gwqDCoMKgwqDCoMKgwqAgfTsKPiAKPiBEeW5hbWljIHBhcnRpdGlvbiBtYXA6
Cj4gCj4gc2NwYXJ0LWlkID0gMjsgb2Zmc2V0ID0gMHgwMDIwMDAwMDsgc2l6ZSA9IDB4MDAxMDAw
MDAKPiAKPiAwMDAwMDAwMiAwMDIwMDAwMCAwMDEwMDAwMMKgIC4uLi4uLiAuLi4uLgo+IAo+IElu
IHRoaXMgZXhhbXBsZSB0aGUgb2Zmc2V0IGFuZCBzaXplIGFyZSB0aGUgc2FtZSBpbiByZWcgYW5k
IGR5bmFtaWMKPiBwYXJ0aXRpb24gbWFwLiBJZiBkZXZpY2UgaGF2ZSBiYWQgYmxvY2tzIG9uIE5B
TkQgdGhlIHZhbHVlcyB3aWxsIGJlIGEKPiBsaXR0bGUgZGlmZmVyZW50LiBBbmQgd2UgaGF2ZSB0
byB0YWtlIHBhcnRpdGlvbiBvZmZzZXRzIGZyb20gcGFydGl0aW9uCj4gbWFwIHRvIGF2b2lkIGJv
b3QgbG9vcHMsIHdyb25nIGVlcHJvbSBsb2NhdGlvbiBhbmQgb3RoZXIgYmFkIHRoaW5ncy4KPiAK
PiBJcyB0aGVyZSBhbnl0aGluZyB0aGF0IG5lZWRzIHRvIGJlIGV4cGxhaW5lZCBpbiBtb3JlIGRl
dGFpbD8KClRoYW5rcyBhIGxvdCwgdGhpcyBjbGFyaWZpZXMgdGhlIHRvcGljLiBMb29rcyBnb29k
LiBNYXliZSB5b3UgY291bGQgcHV0CnBhcnRzIG9mIHRoaXMgaW50byB0aGUgc2NwYXJ0LWlkIGZp
ZWxkIGRlc2NyaXB0aW9uPwoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
