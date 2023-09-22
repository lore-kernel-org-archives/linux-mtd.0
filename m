Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5FFCD4846
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 17:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ruuegc/3FlWhorB8sS2KA8QMHtU+UkqKFsWtfdZpFJU=; b=uAfp0jzT+KRLhV
	dsTvTbqS1yXZawBTrAYrJLB6re/4jgYiJY8aSFwxnV0YMCu7q/psr++P7WUeUL3ad17ra9bOS7Mf9
	df0feIP62syp0KR66S1on8h6f27ud9k2lzLq4m8K36z7YZyup1FmeZagp8us552Pqn9Qiy5wQZWnM
	6Z3CgogyDavX/uRJM80SJnr1KIIEILZdJtw3kAYcxF2GRBORaL+n38XOYd/H8RF+JxoEcJceFWXIJ
	w98t6oBVEM9xASvJEr6jHjaUCISpMBCe2SVgXLYsDGkUQqP/M3DfvD4ZlN7fJ+SthBpGBl2l5fNwB
	CL9RZJYjMt8lhsrWijqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjjXE-009Sk0-2e;
	Fri, 22 Sep 2023 17:01:44 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjjXB-009Si9-2L
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 17:01:43 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c136ee106so297541166b.1
        for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 10:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695402096; x=1696006896; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prIJYO4UCCa6Vt94U+NHB8APLB3E/mezXQCP+edywR0=;
        b=KFrygdjEpXd+CZV8riNG/6su+utyrs8/aSP3xFqPKDJ9EYK6dI8EQs2Blx3PCvkH60
         sPfVXwLaAax8pIAxDV0ArhEQLGjC4Fq/CeIw4lSkLG0qkS89EYk3pnJFPaOrWn+k1mTb
         Tx31oXpxiNhLN0EZe401sd0JGvOiGJFAhV/P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695402096; x=1696006896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prIJYO4UCCa6Vt94U+NHB8APLB3E/mezXQCP+edywR0=;
        b=pK/EhQ744+/rjajZOhLglP/BwwkMolLnpO6O33rLdHepdBtB41wkk4nUcDK+bXBeYf
         qvwx5pPTPC8JwVENQXBcXT92OaC9SrNrzS3FFowdR9TMOO7RFKLG07TOT5swfssfOA1o
         APIpkxLfZKbIsmmPIozwovgB/DmiOKzOR0eyAOPIrXHIhaAq91opotiBm6UPw8mE5fMY
         S995INZ74ePv79SRWl1D7URit6RnVRCdts8VKbYYFLQD8vqAfngmpFlsjrTPQI67E+da
         0FquZF3I8uVTK9noSWEPXBHXcubxIpTlYOBarMia/BXm+y6U4ghk0yq+2Y07HKvNzxMK
         84vA==
X-Gm-Message-State: AOJu0Yz3dPaIiN4VRZ1udUOUYjhJ2PZcNgY3JpLjPGyw8Lgn4TeWwMn8
	20WGlYNhTE2QpSQIRJph2MGEsCGFA+jzfTEdJSva0A==
X-Google-Smtp-Source: AGHT+IHHv1gP/4pypmekIUolVP4Bg2MyLQnwNSeSTQqinVXlc3czJqPwmHasOlWBXAyzd5YREZkr1Q8LAEn78+XhqMI=
X-Received: by 2002:aa7:c7d3:0:b0:523:3fff:5ce2 with SMTP id
 o19-20020aa7c7d3000000b005233fff5ce2mr42790eds.41.1695402095589; Fri, 22 Sep
 2023 10:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
 <CAL_Jsq+WuYDU+yY98opTHr1PT-J9mFYJQBjVMnk+FSWLDUO33w@mail.gmail.com>
In-Reply-To: <CAL_Jsq+WuYDU+yY98opTHr1PT-J9mFYJQBjVMnk+FSWLDUO33w@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 22 Sep 2023 11:01:18 -0600
Message-ID: <CAPnjgZ1pfxaMG1n5yOBhiOhsNrRjck1K92U7Ga=+VTY_jjjrVg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, U-Boot Mailing List <u-boot@lists.denx.de>, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_100141_786754_B822EA92 
X-CRM114-Status: GOOD (  22.48  )
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

SGkgUm9iLAoKT24gRnJpLCAyMiBTZXB0IDIwMjMgYXQgMTA6MDAsIFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgMTo0NeKAr1BN
IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+Cj4gPiBCaW5tYW5bMV0g
aXMgYSB0b29sIGZvciBjcmVhdGluZyBmaXJtd2FyZSBpbWFnZXMuIEl0IGFsbG93cyB5b3UgdG8K
PiA+IGNvbWJpbmUgdmFyaW91cyBiaW5hcmllcyBhbmQgcGxhY2UgdGhlbSBpbiBhbiBvdXRwdXQg
ZmlsZS4KPiA+Cj4gPiBCaW5tYW4gdXNlcyBhIERUIHNjaGVtYSB0byBkZXNjcmliZSBhbiBpbWFn
ZSwgaW4gZW5vdWdoIGRldGFpbCB0aGF0Cj4gPiBpdCBjYW4gYmUgYXV0b21hdGljYWxseSBidWls
dCBmcm9tIGNvbXBvbmVudCBwYXJ0cywgZGlzYXNzZW1ibGVkLAo+ID4gcmVwbGFjZWQsIGxpc3Rl
ZCwgZXRjLgo+ID4KPiA+IEltYWdlcyBhcmUgdHlwaWNhbGx5IHN0b3JlZCBpbiBmbGFzaCwgd2hp
Y2ggaXMgd2h5IHRoaXMgYmluZGluZyBpcwo+ID4gdGFyZ2V0ZWQgYXQgbXRkLiBQcmV2aW91cyBk
aXNjdXNzaW9uIGlzIGF0IFsyXSBbM10uCj4gPgo+ID4gWzFdIGh0dHBzOi8vdS1ib290LnJlYWR0
aGVkb2NzLmlvL2VuL3N0YWJsZS9kZXZlbG9wL3BhY2thZ2UvYmlubWFuLmh0bWwKPiA+IFsyXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy91LWJvb3QvMjAyMzA4MjExODAyMjAuMjcyNDA4MC0zLXNq
Z0BjaHJvbWl1bS5vcmcvCj4gPiBbM10gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZGV2
aWNldHJlZS9tc2c2MjYxNDkuaHRtbAo+Cj4gWW91IG1pc3NlZDoKPgo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9kZXZpY2V0cmVlLW9yZy9kdC1zY2hlbWEvcHVsbC8xMTAKPgo+IHdoZXJlIEkgc2FpZDog
V2UgY2VydGFpbmx5IHNob3VsZG4ndCBkdXBsaWNhdGUgdGhlIGV4aXN0aW5nIHBhcnRpdGlvbnMK
PiBiaW5kaW5ncy4gV2hhdCdzIG1pc3NpbmcgZnJvbSB0aGVtIChJIGFzc3VtZSB3ZSdyZSBtb3N0
bHkgdGFsa2luZwo+IGFib3V0ICJmaXhlZC1wYXJ0aXRpb25zIiB3aGljaCBoYXMgYmVlbiBhcm91
bmQgZm9yZXZlciBJIHRoaW5rIChiZWZvcmUKPiBtZSkpPwo+Cj4gVG8gcmVwZWF0LCB1bmxlc3Mg
dGhlcmUgaXMgc29tZSByZWFzb24gYmlubWFuIHBhcnRpdGlvbnMgY29uZmxpY3Qgd2l0aAo+IGZp
eGVkLXBhcnRpdGlvbnMsIHlvdSBuZWVkIHRvIHN0YXJ0IHRoZXJlIGFuZCBleHRlbmQgaXQuIEZy
b20gd2hhdCdzCj4gcG9zdGVkIGhlcmUsIGl0IG5laXRoZXIgY29uZmxpY3RzIG5vciBuZWVkcyBl
eHRlbmRpbmcuCgpJIHRoaW5rIGF0IHRoaXMgcG9pbnQgSSBhbSBqdXN0IGhvcGVsZXNzbHkgY29u
ZnVzZWQuIEhhdmUgeW91IHRha2VuIGEKbG9vayBhdCB0aGUgYmlubWFuIHNjaGVtYT8gWzFdCgpJ
IHNhdyB0aGlzIGZpbGUsIHdoaWNoIHNlZW1zIHRvIGV4dGVuZCBhIHBhcnRpdGlvbi4KCkRvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9icmNtLGJjbTQ5MDgt
cGFydGl0aW9ucy55YW1sCgpJIHdhcyBhc3N1bWluZyB0aGF0IEkgc2hvdWxkIGNyZWF0ZSBhIHRv
cC1sZXZlbCBjb21wYXRpYmxlID0gImJpbm1hbiIKbm9kZSwgd2l0aCBzdWJub2RlcyBsaWtlIGNv
bXBhdGlibGUgPSAiYmlubWFuLGJsMzEtYXRmIiwgZm9yIGV4YW1wbGUuCkkgc2hvdWxkIHVzZSB0
aGUgY29tcGF0aWJsZSBzdHJpbmcgdG8gaW5kaWNhdGUgdGhlIGNvbnRlbnRzLCByaWdodD8KClJl
IGV4dGVuZGluZywgd2hhdCBpcyB0aGUgbWluaW11bSBJIGNhbiBkbz8gQXJlIHlvdSBsb29raW5n
IGZvcgpzb21ldGhpbmcgbGlrZSBhICJjb21wcmVzcyIgcHJvcGVydHkgdGhhdCBpbmRpY2F0ZXMg
dGhhdCB0aGUgZW50cnkgaXMKY29tcHJlc3NlZD8KCkknbSByZWFsbHkganVzdCBhIGJpdCBsb3N0
LgoKPgo+IEkgZGlkIGEgYml0IG1vcmUgcmVzZWFyY2guICJmaXhlZC1wYXJ0aXRpb25zIiBhcyBh
IGNvbXBhdGlibGUgaGFzCj4gIm9ubHkiIGJlZW4gYXJvdW5kIHNpbmNlIDIwMTUuIFByaW9yIHRv
IHRoYXQsIGl0IHdhcyBpbXBsaWNpdCB3aXRoCj4ganVzdCBwYXJ0aXRpb24gbm9kZXMgd2l0aCBh
ZGRyZXNzZXMgKGkuZS4gcmVnKSBhbmQgdGhhdCBkYXRlcyBiYWNrIHRvCj4gMjAwNy4gTG9va3Mg
bGlrZSB1LWJvb3Qgb25seSBzdXBwb3J0cyB0aGUgbmV3ZXIgZm9ybSBhbmQgc2luY2UgMjAyMS4K
Ck9LCgpSZWdhcmRzLApTaW1vbgoKWzFdIGh0dHBzOi8vdS1ib290LnJlYWR0aGVkb2NzLmlvL2Vu
L2xhdGVzdC9kZXZlbG9wL3BhY2thZ2UvYmlubWFuLmh0bWwjaW1hZ2UtZGVzY3JpcHRpb24tZm9y
bWF0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
