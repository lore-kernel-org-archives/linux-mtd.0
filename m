Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80041C5B543
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Jun 2025 07:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PVb+coVJNa13anTjKxz4ywGhpzIvbSC935njBPGPNY=; b=NISFcEvIwuExPM
	OOoLs5Z8JkoloQJ/XvDzLLgGWS/MaYjIEnA77+ClvL4M1XymwizOW7fUdVj+/hS4oCvFsW0P7SBE3
	uQPEXbpFDErPGgg/LtQG5TM+ikoGdok+MgniY6LRHAIuMdh6bdJXlGe+wBQ1XHAOkQlMWK5PX4693
	fGHZFnWEAyktUGchXzk2oIBnslYvA4KgTlsr214q/dOYoJeVBAdcLvDJG0eunTqR2HeSRHh91EVW4
	2488YMjf/q9flEmiPuw7RuH1GU9P8KFe7X5c/l6bsshZAUaMf6bBn7pcQJ4SEDqbiAEYOzm1Wqs0p
	N+omHMmxTFK65CahDSGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtd1-000000063F8-2Kil;
	Tue, 10 Jun 2025 07:42:39 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtc0-0000000636C-0KsX
	for linux-mtd@lists.infradead.org;
	Tue, 10 Jun 2025 07:41:37 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7426c44e014so4412078b3a.3
        for <linux-mtd@lists.infradead.org>; Tue, 10 Jun 2025 00:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749541295; x=1750146095; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YN6kYOdQXppfRs2bxLnm5FB4byN2ocgKeTmyeRzty7U=;
        b=NxOnTdtEjGUgZT3e5I5B5cB3vDR4pgkYQ5amWO+bvPMRyKZ7hNSLaB7kCPYjTm7qtw
         m5GMXVOSvSpKXeDXum/q075/Ug3Wp99DalMpfZpLrWQp5B4KKislqx9RsbJoPwtqurQN
         Yacw1+ypAdRVzRrTGa0iDhY0ziXXyaodU5HAg42xQM4E1Eu/hz3de50PKmM69PbM27mB
         mxZTA9eUN5mtLG0HUAGw6FpA7hMhGBPC5VCNZXlcphRxFascQC31Yt9C4wQZAWz61Et8
         cRAghDVmN9RS1wSiaKP/kLX0pCzRQ10HiAsXAZ45ToC+ccPiSijm4df2bYeM1HpJ3Tkl
         ETKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541295; x=1750146095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN6kYOdQXppfRs2bxLnm5FB4byN2ocgKeTmyeRzty7U=;
        b=svogQKFKNN2J6EDCI4ER9hQwHnQqkIRCf5ysoI1+jBCPa/zeXnUDe3Uw1ur9SffynK
         mHG7u4bfsX8BvdXNZ/Wl9onyOfHXF5jHJJ9QHp4zgctfXtnBam9I1Hfutth0lRMjpW68
         zU0SdNbt9gtftllTQQfbMQTq693W/ZrK8+6a10VHQIhTICVwXysySau7fnTn4DKxCu2k
         KNmhc/J76HYZe1EbYs+KfxagxAUWfcH1KZt34b3T19xZt0EURO1RDPs0OH00xon3xPRM
         VJsEWd6wDq3UI64xVFldLuACA9oZeBek4q8hVAXitJ4ZGHcJfa71AxLyAn9SZfNsS1gl
         XaYg==
X-Forwarded-Encrypted: i=1; AJvYcCV26dNnZZmYPWh5DQ/PnhQ2A8T9vckEmR3bsAJgqnhF4byVpNRmYXlJ1uolBM6VHaPHizGg46qIl8E=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcCwbeDjJJpKer21+JfEI0+Zbmb58HbUtMfGc/SoBFaXk0Q53J
	VBYZRc5kICcsq5iRDcxEG0gCIdWzcmEwVNXe7u28otaO8EPc2KlQG5X2
X-Gm-Gg: ASbGncve4G0BofzVzoZRUBv6hJVgDTmm0jaJlHXaXWs448nOmF4dlqOXEAWKyKSLRqJ
	rt54ISzOClYrYnTDYE/vr0tTuxAdU0S9x0JJRXt8jp+55pryW+StQU61YgKPEa8OdUeR7Idn8Jd
	rpMrVQJ9cNqyZg3EIwQucp3Cuy/62ToqdFN8nSvLAZVAcdRZFjbLB2zwZjgAqNruITna+iKDDSa
	udY2E7M/4N11eWQZ9tYM3stYCaV/VP4jO5hdj+FR5rS4rEVxA/Jdw25aiL5OeJgLtcLS8gWLO+d
	T0eE+9WilHFXgm/OwEqN/kVXmZhm2lpQQNsIpnlJ07LIDyg5IltiF02yttuDXFp6C43H4RRMl77
	Gbzz4kOenuCdRi7v/z/ECOneYsOSal9v1o5w=
X-Google-Smtp-Source: AGHT+IGREhV5+oOFXXMGrU3jABH090Q4SM1tbrFb+Nj9NfxzPhQpiwuhESZpptIjmnQzaZ11AFQZMA==
X-Received: by 2002:a05:6a00:3016:b0:742:a23e:2a67 with SMTP id d2e1a72fcca58-74827f14a6dmr21248420b3a.16.1749541294932;
        Tue, 10 Jun 2025 00:41:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c2679sm6826146b3a.118.2025.06.10.00.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:41:34 -0700 (PDT)
Message-ID: <ff485da8-1a02-40a9-9286-94459e52b26c@roeck-us.net>
Date: Tue, 10 Jun 2025 00:41:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
Cc: Cheng Ming Lin <linchengming884@gmail.com>, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com>
 <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org>
 <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
 <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
 <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_004136_117635_84C51FF8 
X-CRM114-Status: GOOD (  24.05  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNi85LzI1IDIzOjQ2LCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+IAo+IAo+IE9uIDYvMTAvMjUg
MToxNCBBTSwgR3VlbnRlciBSb2VjayB3cm90ZToKPj4gT24gNi84LzI1IDE4OjEzLCBHdWVudGVy
IFJvZWNrIHdyb3RlOgo+Pj4gT24gNi84LzI1IDA1OjUzLCBQcmF0eXVzaCBZYWRhdiB3cm90ZToK
Pj4+PiBPbiBTYXQsIEp1biAwNyAyMDI1LCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+Pj4+Cj4+Pj4+
IEhpLAo+Pj4+Pgo+Pj4+PiBPbiBNb24sIEFwciAwNywgMjAyNSBhdCAwMzo1Mzo1OFBNICswODAw
LCBDaGVuZyBNaW5nIExpbiB3cm90ZToKPj4+Pj4+IEZyb206IENoZW5nIE1pbmcgTGluIDxjaGVu
Z21pbmdsaW5AbXhpYy5jb20udHc+Cj4+Pj4+Pgo+Pj4+Pj4gTWFueSBmbGFzaCBkZXZpY2VzIHNo
YXJlIHRoZSBzYW1lIElEIGJ1dCBoYXZlIGRpZmZlcmVudCBwYXJ0IG51bWJlcnMuCj4+Pj4+PiBU
byBhdm9pZCBjb25mdXNpb24sIHRoZSBwYXJ0IG51bWJlciBmaWVsZCBpcyByZW1vdmVkLgo+Pj4+
Pj4KPj4+Pj4+IEFkZGl0aW9uYWxseSwgc2luY2UgU0ZEUCBhbHJlYWR5IHByb3ZpZGVzIHNpemUg
aW5mb3JtYXRpb24gYW5kCj4+Pj4+PiBmdW5jdGlvbmFsaXR5IGNvdmVyZWQgYnkgbm9fc2ZkcF9m
bGFncywgdGhlc2UgZmllbGRzIGFyZSBhbHNvIHJlbW92ZWQuCj4+Pj4+Pgo+Pj4+Pj4gRnVydGhl
cm1vcmUsIHdoZW4gNC1ieXRlIGFkZHJlc3MgaW5zdHJ1Y3Rpb24gdGFibGUgaXMgYXZhaWxhYmxl
LAo+Pj4+Pj4gdGhlIFNQSV9OT1JfNEJfT1BDT0RFUyBmbGFnIGlzIG5vIGxvbmdlciBuZWVkZWQg
YW5kIGlzIHJlbW92ZWQuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hlbmcgTWluZyBM
aW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPj4+Pj4+IEFja2VkLWJ5OiBUdWRvciBBbWJh
cnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4+Pj4+Cj4+Pj4+IFdpdGggdGhpcyBwYXRj
aCBpbiBwbGFjZSwgc29tZSBvZiBteSBxZW11IHRlc3RzIG5vIGxvbmdlciByZWNvZ25pemUgdGhl
Cj4+Pj4+IGZsYXNoIGNoaXBzIChNWDI1TDI1NjM1RS9GKS4gRG8geW91IGhhdmUgYSBzdWdnZXN0
aW9uIG9uIGhvdyB0byBoYW5kbGUKPj4+Pj4gdGhpcyBvdGhlciB0aGFuIGF2b2lkaW5nIE1hY3Jv
bml4IGZsYXNoIGNoaXBzIHdoZW4gd29ya2luZyB3aXRoIHFlbXUgPwo+Pj4+Cj4+Pj4gQ291bGQg
eW91IHNoYXJlIHNvbWUgbG9ncz8gRG9lcyB0aGUgZmxhc2ggZmFpbCB0byBkZXRlY3QsIG9yIGRv
ZXMgdGhlCj4+Pj4gU0ZEUC1iYXNlZCBwcm9iaW5nIGZhaWw/IFNpbmNlIHRoaXMgaXMgcWVtdSwg
aXQgd291bGQgYmUgZXZlbiBiZXR0ZXIgaWYKPj4+PiB5b3UgY2FuIHNoYXJlIGEgc2V0dXAvcmVw
cm9kdWN0aW9uIGd1aWRlLiBJIGhhdmUgYmVlbiBtZWFuaW5nIHRvIHNldCB1cAo+Pj4+IHFlbXUg
Zm9yIFNQSSBOT1IgdGVzdGluZyBmb3Igc29tZSB0aW1lIG5vdywgYnV0IG5ldmVyIGdvdCBhcm91
bmQgdG8KPj4+PiBmaWd1cmluZyBpdCBvdXQuCj4+Pj4KPj4+Cj4+PiBJIHN1c3BlY3QgdGhhdCB0
aGUgU0ZEUCBkYXRhIGZvciB0aGUgYWZmZWN0ZWQgZmxhc2hlcyBpcyBpbmNvcnJlY3QgaW4KPj4+
IHFlbXUuCj4+PiBTaW5jZSB0aGlzIGlzIHZlcnkgbGlrZWx5IGEgcWVtdSBwcm9ibGVtLCBJJ2xs
IGp1c3QgY29uZmlndXJlCj4+PiBkaWZmZXJlbnQgZmxhc2gKPj4+IGNoaXBzIHdoZW4gcnVubmlu
ZyBhZmZlY3RlZCB0ZXN0cy4KPj4+Cj4+Cj4+IEkgd2FzIGFibGUgdG8gY29uZmlybSB0aGUgYWJv
dmUuIFRoaXMgaXMgZnJvbSB0aGUga2VybmVsIGxvZzoKPj4KPj4gW8KgwqDCoCA0LjUwMDAwMF0g
c3BpLW5vciBzcGkwLjA6IEJGUFQgcGFyc2luZyBmYWlsZWQuIFBsZWFzZSBjb25zaWRlcgo+PiB1
c2luZyBTUElfTk9SX1NLSVBfU0ZEUCB3aGVuIGRlY2xhcmluZyB0aGUgZmxhc2gKPj4gW8KgwqDC
oCA0LjUwMDAwMF0gc3BpLW5vciBzcGkwLjA6IHByb2JlIHdpdGggZHJpdmVyIHNwaS1ub3IgZmFp
bGVkIHdpdGgKPj4gZXJyb3IgLTIyCj4+Cj4gCj4gSXQncyBsaWtlbHkgdGhlIHByb2JsZW0gd2hl
cmUgdGhlIHNhbWUgZmxhc2ggSUQgaXMgdXNlZCBmb3IgZGlmZmVyZW50Cj4gZmxhdm9ycyBvZiBm
bGFzaGVzLiBUeXBpY2FsbHkgd2UgZGlmZmVyZW50aWF0ZSB0aGUgZmxhdm9ycyBieSBjb21wYXJp
bmcKPiB0aGVpciBTRkRQIGRhdGEgYW5kIHVzZSBwb3N0IFNGRFAgaG9va3MgdG8gYW1lbmQgd2hl
cmUgbmVlZGVkLiBJZiBubyBvbmUKPiBjYXJlcyBhYm91dCBmaXhpbmcgaXQsIHdlIGNhbiB1bmRv
IHRoZSBjaGFuZ2UgZm9yIHRoZSBhZmZlY3RlZCBmbGFzaCBvcgo+IHJldmVydCB0aGUgcGF0Y2gg
ZW50aXJlbHkuIENoZW5nPwo+IAoKU29tZSBkZWJ1Z2dpbmcgc2hvd3MgdHdvIHByb2JsZW1zIHdp
dGggcWVtdTogVGhlIHJldHVybmVkIFNGUEQgZGF0YSBmb3Igb25lCm9mIHRoZSBmbGFzaGVzIGlz
IHdyb25nIGFuZCBkb2VzIG5vdCByZWZsZWN0IHRoZSBkYXRhIHFlbXUgaXMgc3VwcG9zZWQKdG8g
cHJvdmlkZSwgYW5kIHFlbXUgZG9lcyBub3QgcHJvdmlkZSBTRlBEIGRhdGEgZm9yIGFsbCBmbGFz
aGVzLgoKSSBkb24ndCBrbm93IGlmIHRoZSBiYWQgZGF0YSBpcyBkdWUgdG8gYSBiYWQgTGludXgg
ZHJpdmVyICh1bmxpa2VseSksIGEgYnVnCmluIHFlbXUncyBTUEkgZW11bGF0aW9uIGNvZGUsIG9y
IGEgYnVnIGluIHFlbXUncyBmbGFzaCBlbXVsYXRpb24gY29kZS4KVW5mb3J0dW5hdGVseSBJIGRv
bid0IHJlYWxseSBoYXZlIHRpbWUgdG8gdHJhY2sgdGhpcyBkb3duIGZ1cnRoZXIuCgpHdWVudGVy
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
