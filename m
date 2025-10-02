Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9E2CAC5B0
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Oct 2025 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWfw1hkd8KpVQSn+NJyYzTpc8HB/IEv7hqhWZdAE1js=; b=MRmbGkdah0yum5
	vqhWGBLYe29/N2rWs2tnJpEYWIN2xpEECU7Hg1MEDv9+8ZdbWei2HVlZi3LDb2tg2yYwuhWcA1k1c
	YokkhnFMsmAAxgaKdldUHfQlzPfHloczoZnQIX2l2Lhc2TStsn0L/9exSuwSR/TUiO2HnrL8J8D22
	Rbw2F7qtz10HUXRylrjto9j4LlmSgNaz14FN64wsgIAZyf8RJa2gygBu0+OjYY+SlZbxundz8Zvt+
	P7t7/QZxm6JidRv+51Hxfq/JexOgsjr1qYladY6TCt6a//EssTJsOsgiKVQo1YD6t5N1ZVJ23Yxxi
	/pssmXFHT2PUq5ojLlKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ly2-0000000An36-2NwI;
	Thu, 02 Oct 2025 16:15:42 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ly0-0000000An2J-0bEg
	for linux-mtd@lists.infradead.org;
	Thu, 02 Oct 2025 16:15:41 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-32ed19ce5a3so1138889a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 02 Oct 2025 09:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759421739; x=1760026539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWdvP8Y683s2RnoHRv1ZB/z8sm8WaE7z/Z8PLqDiBoU=;
        b=XTztJSnqnZK8wPvy5b9eQVK/lmnbvpH8FNT43BnxCeDUHDZpsCXv5nnAp7z62JB+bo
         4wCQuEQG+yE/5i9wB0h437kir7xYrV1IToc2J1ICYhX0216j90GUrh3CGgx0hpYsktCi
         0l4lRtHv9L30d4LcEpcn/CJTLrmb3J22xq0SqGkJGzNgQC57ngeZS2yYESqBThEFNJeA
         gwuHxG7Ol59tUkXTLOFYLt4bZz2ovQsVqNDWqYioOtRtQGDahcVA73M1B3N3dlVNBxs5
         gY6p2aKBSm9c+o23Ja+Pg6U7ts61zL9Mj1b2cm83qCtMqqqxJjRXaH0wIR8GaQUsRZZu
         JEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759421739; x=1760026539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWdvP8Y683s2RnoHRv1ZB/z8sm8WaE7z/Z8PLqDiBoU=;
        b=bXqKkMSGNBGRxHlEVQ2ff+De2p9aFCDM5VBueGzhspGbLm7ao+OwlFcuURReLJLATd
         cdZeAY4ehodjWDC0XE/1zrsKlMnA9aQdpCCYcHxuJNp4+FjT6SnI/tqlXYY2CxXGpKU0
         zwMYHLtSkHS1hQmSb4yjJmpQdtPZamELkGgLi2Czo9SDMvXt2sK67eVlrQPOO9bvnTEW
         SSsnL7P3Aog306Y5v8eI19Qe0cu3DghOkGQll+oVYhF6XTlBsOpanV9DTzV9JIMh/RnR
         bdDa44wQqmthOkQTsh6MU2ySqqfcN640I4ZT7NYBL+P3iwdC5KuTjZ9la5IVMfo7ONYL
         AV3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCYMf0+6xPk+pCkjYJNfDhxLhowxyVlyvSOSG2p7Umyg8qmqpjsszyvYeHDGd8leHTCzrlYlOipLw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXvvsvHRF4SCZh4JRJP8rm8NUEvDZKzCKz+zyPhk1lm97iNiMM
	y968OnRcKGY3TVIVnViF6dPmlLtx3Emk7ADXrKFTawj30ntidz+FTD+Feopb/Lmh9qh/P/xZkJF
	YUfdh23NxSsCnTjn4WzheRlWbj0NYPi0=
X-Gm-Gg: ASbGnctr1nbc8MQfXzNnKK1H7gSZ0p/XxKIDkNff4NdWUOn/5TOsugmJQksMS1WWRR1
	h/D7lv6KieuO30t9Q3dlqfuBpdN+0xEjT/YWQubjk6AAnQ5p8xnYnSJi1O5txvUgFPw4RHmgc3r
	rOZ2kuWSZdJoEihtQlTvazanIDJReAorudRpDbw7Fgm9JVEtldwyWUqao6HLwq5j3FvYnp9Uejq
	ZX/13CWe8aX3WnMmPGdPNumZFRS6Q4=
X-Google-Smtp-Source: AGHT+IEEMaz+rzobkhm8SyqYVcgEkJ1Ytr3pkDKrTDIqXJAg7v41uIIa9JbT8SRUVI32KEw1ae6Cpi3YJuSsap/Nsk4=
X-Received: by 2002:a17:90b:38cb:b0:32e:3686:830e with SMTP id
 98e67ed59e1d1-339a6f3cd02mr8975769a91.23.1759421739281; Thu, 02 Oct 2025
 09:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250814065423.3980305-1-mikhail.kshevetskiy@iopsys.eu>
 <20250814065423.3980305-4-mikhail.kshevetskiy@iopsys.eu> <87plckit7j.fsf@bootlin.com>
In-Reply-To: <87plckit7j.fsf@bootlin.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:20:36 -0400
X-Gm-Features: AS18NWBiWy3rvi6cOhhxZBRyTPPh6tyb0jTA2Y6wHpPxRiwnHg5hHZpKt9z0ArA
Message-ID: <CALC8CXc0vZfusBKWXxA7EyG=VfmDHVe1g3HEej044KH_ZOjBsQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 3/4] mtd: spinand: repeat reading in regular
 mode if continuous reading fails
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
	Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Martin Kurbanov <mmkurbanov@salutedevices.com>, 
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_091540_181634_5A67EBA3 
X-CRM114-Status: GOOD (  14.39  )
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

TWlraGFpbCEgWU9VIFJVU1NLSUUgUkFZQ0lTCgpPbiBTdW4sIEF1ZyAyNCwgMjAyNSBhdCAxMjoy
NOKAr1BNIE1pcXVlbCBSYXluYWwKPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+
Cj4gSGVsbG8sCj4KPiA+ICsgICAgICAgICAgICAgaWYgKGNvbnRyb2xsZXJfaXNfYnVnZ3kpIHsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAq
IFNvbWUgc3BpIGNvbnRyb2xsZXJzIG1heSBub3Qgc3VwcG9ydCByZWFkaW5nIHVwIHRvCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICogZXJhc2UgYmxvY2sgc2l6ZS4gVGhleSB3aWxsIHJlYWQg
bGVzcyBkYXRhIHRoYW4KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgKiBleHBlY3RlZC4gSWYg
dGhpcyBoYXBwZW4gZGlzYWJsZSBjb250aW51b3VzIG1vZGUKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgKiBhbmQgcmVwZWF0IHJlYWRpbmcgaW4gbm9ybWFsIG1vZGUuCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICovCj4gPiArICAgICAgICAgICAgICAgICAgICAgc3BpbmFuZC0+Y29udF9y
ZWFkX3Bvc3NpYmxlID0gZmFsc2U7Cj4KPiBJIGFtIGZpbmUgd2l0aCB0aGUgaWRlYSwgYnV0IGNv
dWxkIHdlIGF2b2lkIHRoaXMgbGl0dGxlIGRhbmNlIGFuZCBkcm9wCj4gdGhlIGV4dHJhIGNvbnRy
b2xsZXJfaXNfYnVnZ3kgYm9vbGVhbiwgYW5kIGp1c3QgbGV0Cj4gc3BpbmFuZF9tdGRfY29udGlu
dW91c19wYWdlX3JlYWQoKSBkbyB0aGUgZml4dXAgYW5kIHJldHVybiAtRUFHQUlOPwo+Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgcmV0ID0gc3BpbmFuZF9tdGRfcmVndWxhcl9wYWdlX3JlYWQo
bXRkLCBmcm9tLCBvcHMsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJm1heF9iaXRmbGlwcyk7Cj4gPiArICAgICAgICAgICAgIH0K
PiA+ICsgICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgIHJldCA9IHNwaW5hbmRfbXRkX3Jl
Z3VsYXJfcGFnZV9yZWFkKG10ZCwgZnJvbSwgb3BzLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmbWF4X2JpdGZsaXBzKTsKPiA+ICsgICAgIH0K
PiA+Cj4gPiAgICAgICBpZiAob3BzLT5zdGF0cykgewo+ID4gICAgICAgICAgICAgICBvcHMtPnN0
YXRzLT51bmNvcnJlY3RhYmxlX2Vycm9ycyArPQo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
