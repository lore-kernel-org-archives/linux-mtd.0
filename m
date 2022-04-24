Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C55C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Apr 2022 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGCWAsPZhYlJ9zWtaKUbXu5cVPp397KJudLbXTn6HZY=; b=gu1+RJIvWN13fO
	ZYgIuEQsE/PUKQqnuiXCmLiluVsX/S3LAl2ciKJCsFzxE45OIL/f+cYdFyn0haM4bjg37veBVsua0
	e2Oo83CXTZIvk3/pzy92Dza3nsibwQ8jPrTVwAc8TKVev6+cDzkdqoxL4j9yPPhZ1WnfbqNWO6pWb
	5op+FtipgVTOHlvlmqsq7OC93i/VyNIihytQYOXIfqp6sNDK8n8yYJBXE4k7DIYUp+3HTYNvFucb5
	EhpoUxnlXCyHNuwo6eQxZlvEQPaw5hBSh3gc7V+ESzqfGjPpbO2tTESqv4gpGSv1zcieBdI9EHEbT
	ru747cqcjhenwk0Iks3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nia9v-006SxR-O6; Sun, 24 Apr 2022 11:12:07 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nia9s-006Sx4-U7
 for linux-mtd@lists.infradead.org; Sun, 24 Apr 2022 11:12:06 +0000
Received: by mail-ej1-x632.google.com with SMTP id y3so4121269ejo.12
 for <linux-mtd@lists.infradead.org>; Sun, 24 Apr 2022 04:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/poCgpgeQHKZ0kafLJZ7iBP9Nl8gQzlXb2tE2PvG41A=;
 b=ohDHGzn+AQzNfa+Ufe3IbVJ+Hy0aS+wzo+K72EPX0hPMX0m9z5QMYeUSuOK0IIKhX7
 U3IJv07tWsVfRk40LZCU2qLoWMIHB/aFWcFauz5wJYLplsMBTWblKTc/oV97hDxPBeuE
 CySybWxNjbuZThXUlHsTo1iUIhRtudEt6PYHhKvgyaXe1SWOXOHFjNhEMr4GxCu6pory
 ex+1H8edUAjPi/GlipFEzUypJeJC3/KPYtQVrxhQFIlXg2EYplZUDOeXahEqZfVuDy5F
 ziMM3ijI1qMK66wVmYbphrNaEFkOKsjLC+XaI0bjNXHX7bSnQzqQ+uhVbj14cT4WStPn
 PflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/poCgpgeQHKZ0kafLJZ7iBP9Nl8gQzlXb2tE2PvG41A=;
 b=K/+tUYW6e7cAE6Dat00lAfKijrPcOF28dJr7/8BGYtaykKHElXjMeHIAnAqQ0/f5dj
 KDuvmUwDIgVmF+/DHl4voJx9wNTf4+Wp2+4rmkWT9NKE/Tj0H9mYh2MCSHeQIIexEzd3
 7E/ke6B9RRY6pBM0TWNZVYp87Do6GqQVpMZv70sU35aezLJwF7qShE2ta0Xf9pQRHIhY
 5HwSBkvkUzUuSITdEt/yC5O/iZuuPSPSmu6iBrMFAqkNfxwXpYFOWUOQTJa4zw/H0UzY
 +FEZqKN+h1Vhv/tm/bCAiFcVVcLjwyRFRWYydep8+NVk6jFxyf1yWHwI5ldGSUZo7OEz
 azug==
X-Gm-Message-State: AOAM530Mi5iZFDW0KXYY9eG40skn2voKoOToqn/9Xjs62Aw12jDmhxS0
 c+nX0SYGLeMvXyJgEQTpqHFdvw==
X-Google-Smtp-Source: ABdhPJxE5+FK9rjnAAc7wNu/qc3cAWyO2XXDHed8BuvmWqdT4x6H/PlMmGAE3d+a4v3dMK7+Nco84A==
X-Received: by 2002:a17:907:3e03:b0:6da:8c5a:6d4a with SMTP id
 hp3-20020a1709073e0300b006da8c5a6d4amr12132043ejc.585.1650798722793; 
 Sun, 24 Apr 2022 04:12:02 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 kb9-20020a1709070f8900b006e889aad94esm2525078ejc.128.2022.04.24.04.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 04:12:02 -0700 (PDT)
Message-ID: <70db8ad7-ba2e-ac08-492c-b2117c3235e5@linaro.org>
Date: Sun, 24 Apr 2022 13:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 5/5] mtd: onenand: samsung: Add device tree support
Content-Language: en-US
To: Jonathan Bakker <xc-racer2@live.ca>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
References: <20220423034524.366612-1-xc-racer2@live.ca>
 <20220423034622.366696-1-xc-racer2@live.ca>
 <CY4PR04MB056716B2AE01D243F6AE3C13CBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CY4PR04MB056716B2AE01D243F6AE3C13CBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_041205_031366_C4D8EF90 
X-CRM114-Status: GOOD (  21.18  )
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

T24gMjMvMDQvMjAyMiAwNTo0NiwgSm9uYXRoYW4gQmFra2VyIHdyb3RlOgo+IEZyb206IFRvbWFz
eiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBv
cnQgZm9yIGluc3RhbnRhdGlvbiB1c2luZyBEZXZpY2UgVHJlZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBUb21hc3ogRmlnYSA8dG9tYXN6LmZpZ2FAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBh
d2XFgiBDaG1pZWwgPHBhd2VsLm1pa29sYWouY2htaWVsQGdtYWlsLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBKb25hdGhhbiBCYWtrZXIgPHhjLXJhY2VyMkBsaXZlLmNhPgo+IAo+IC0tLQo+IENoYW5n
ZXMgZnJvbSBwcmV2aW91cyBwYXRjaHNldAo+IC0gQWRqdXN0IHRvIGhhdmluZyBhIG5hbmQgY2hp
bGQgbm9kZSBhcyBwZXIgYmluZGluZyBmZWVkYmFjawo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5k
L29uZW5hbmQvb25lbmFuZF9zYW1zdW5nLmMgfCA2NyArKysrKysrKysrKysrKysrKysrKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9zYW1zdW5nLmMgYi9k
cml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9zYW1zdW5nLmMKPiBpbmRleCA2MjAxNGY4
ZDI3YjYuLjAxMDhjOGM3NWQ1YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL29uZW5h
bmQvb25lbmFuZF9zYW1zdW5nLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25l
bmFuZF9zYW1zdW5nLmMKPiBAQCAtMjIsNiArMjIsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvZG1h
LW1hcHBpbmcuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ICAjaW5jbHVkZSA8
bGludXgvaW8uaD4KPiArI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gIAo+ICAjaW5jbHVkZSAic2Ft
c3VuZy5oIgo+ICAKPiBAQCAtODMyLDggKzgzMywzNiBAQCBzdGF0aWMgdm9pZCBzM2Nfb25lbmFu
ZF9zZXR1cChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiAgCXRoaXMtPndyaXRlX2J1ZmZlcnJhbSA9
IG9uZW5hbmRfd3JpdGVfYnVmZmVycmFtOwo+ICB9Cj4gIAo+ICsjaWZkZWYgQ09ORklHX09GCj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHMzY19vbmVuYW5kX29mX21hdGNoW10g
PSB7Cj4gKwl7IC5jb21wYXRpYmxlID0gInNhbXN1bmcsczNjNjQwMC1vbmVuYW5kIiwKPiArCQku
ZGF0YSA9ICh2b2lkICopVFlQRV9TM0M2NDAwIH0sCj4gKwl7IC5jb21wYXRpYmxlID0gInNhbXN1
bmcsczNjNjQxMC1vbmVuYW5kIiwKPiArCQkuZGF0YSA9ICh2b2lkICopVFlQRV9TM0M2NDEwIH0s
Cj4gKwl7IC5jb21wYXRpYmxlID0gInNhbXN1bmcsczVwdjIxMC1vbmVuYW5kIiwKPiArCQkuZGF0
YSA9ICh2b2lkICopVFlQRV9TNVBDMTEwIH0sCj4gKwl7fSwKPiArfTsKPiArTU9EVUxFX0RFVklD
RV9UQUJMRShvZiwgb25lbmFuZF9zM2NfZHRfbWF0Y2gpOwo+ICsjZW5kaWYKPiArCj4gK3N0YXRp
YyBlbnVtIHNvY190eXBlIHMzY19vbmVuYW5kX2dldF9kZXZpY2VfaWQoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPiArewo+ICsJc3RydWN0IGRldmljZV9ub2RlICpucCA9IHBkZXYtPmRl
di5vZl9ub2RlOwo+ICsKPiArCWlmIChJU19FTkFCTEVEKENPTkZJR19PRikgJiYgbnApIHsKPiAr
CQljb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaDsKPiArCj4gKwkJbWF0Y2ggPSBvZl9t
YXRjaF9ub2RlKHMzY19vbmVuYW5kX29mX21hdGNoLCBucCk7Cj4gKwkJcmV0dXJuIChlbnVtIHNv
Y190eXBlKW1hdGNoLT5kYXRhOwo+ICsJfQoKVGhpcyBjYW4gYmUgc2ltcGxlcjoKCmlmIChkZXZf
b2Zfbm9kZSgmcGRldi0+ZGV2KSkKCXJldHVybiBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBk
ZXYtPmRldik7CgpUaGlzIGFsbG93cyB5b3UgdG8gcHV0IHRoZSBvZl9kZXZpY2VfaWQgdGFibGUg
aW4gdXN1YWwgcGxhY2UsIHNvIGp1c3QKYmVmb3JlIHRoZSBwbGF0Zm9ybV9kcml2ZXIgc3RydWN0
dXJlLgoKPiArCj4gKwlyZXR1cm4gcGxhdGZvcm1fZ2V0X2RldmljZV9pZChwZGV2KS0+ZHJpdmVy
X2RhdGE7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgczNjX29uZW5hbmRfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiAgewo+ICsJc3RydWN0IGRldmljZV9ub2RlICpucCA9IHBk
ZXYtPmRldi5vZl9ub2RlOwoKZGV2X29mX25vZGUoKQoKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
