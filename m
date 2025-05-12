Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE56C3ABCB
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 18:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eB8ClGBIEvxXSw6IbulwdiT+S3X1k84NBERqFF5Wn5w=; b=qnLV0lB2Zo4ZbY
	A8+i5nMQF+1hc9S3WJfnHehZaRc+dY4T8ajfKKq3T6jXV4YbPT93pRMMs2+wjJENvX5un4atT29Z1
	ia/H3oiyBztNBgQJrx2r2EsVPcJGw9YqWYhoOvuzvYIC3PNApMnMjeWHYRldI30HS8FU9Xl767TWo
	gk2eZAokI6kbLJUB76OAFzfpdnEDr6xjdV3ttBBvU0+1oIVCLdbAmsRoskItfs7VreX9EO9BYxiQb
	a8T5WaazGQS5JXfOwG2otyGDGchuvWM3rM+rKNuqtMs4ngWkb3YM8lsrrSHgEa1ZZoDOeoaOCpGjN
	DqxqOUKL0iv9WzOFSMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXbv-0000000AJB4-0l3l;
	Mon, 12 May 2025 18:10:43 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXIV-0000000AGA3-3Cvj;
	Mon, 12 May 2025 17:50:40 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-476af5479feso56262411cf.2;
        Mon, 12 May 2025 10:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747072238; x=1747677038; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSoxyHvUrLiSc3/psAWBZmLYF3TjkhwktVK+c+jvBxs=;
        b=F6AQlC03YZ3SztuEvCGaHDD61ZItXOyBBocv4fsLh1DZCPwZQBYJ4g1R6k0g/eBabn
         KeRAwsUHNrcxgIJyxn02cG7293l095JQHbk3UekrKUfLZhoHepyclxj1sxxTSA2pm1QY
         NPKcATfoQTlOqkGayf4iofJ8YvUZ7/wO+89MU4wplaVH2vzOplFCfWCUXpkDuzBoBsxe
         uoXBpSmuAl3/8dYXdULwZWR58w6fYkfJRdm4mOBwxSMsaNChOs0ax6N6VM1meu0TC4f/
         vovpvwSPFjQG9zCjP9/sPDf87KnW7Tg9kNlFfOOstYDR0KOMN3skoY85ZxUnl1b4FMoD
         A4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747072238; x=1747677038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSoxyHvUrLiSc3/psAWBZmLYF3TjkhwktVK+c+jvBxs=;
        b=ohA0FLDHT+u05AkGmmQj6ADEF1ZA5eDRa1qDpRxa0AGLtFVhvpm2e6NE5q8KyNJ67W
         XpljoGgYGescPP2/bKNHmu+n8kbbIQ8Ps6uwYQf4GBiK9HdTcRB6L9Cz0Ji/4lBS8gpF
         G01xVPiWmHA9F//i23elesr8uu3Shr1kE4jXk4uCCDix5MgWzrJEs5BY1AWG1VaPjf/2
         fAlMUJBuy08YF27r9eSchqpesJe6/3TgwFYe2gDA9uPHIMoVAruoBM/fewQOg7UzZ+mq
         0hu79qMtidosJndXeoIs+8TdPFFWvgQnId+sRwW8l4einN2EnYSGjONhuAVZAqrN9mXW
         VyHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+zgnANBE4wnmDpReyJZeoHvSC3dFcKEUJB7GJqkaG4DX5TWZ10ar/0Qm6CthDfD8Jj5vdNiVU3gDp7dHlkvXO@lists.infradead.org, AJvYcCXg+E9jKVuuOeRIyg93epeWa+0jXy4guCGKax0gnhCrDMXZghl2R9nYnxSPZE7tMrulQPbwpz9Zbc5D@lists.infradead.org
X-Gm-Message-State: AOJu0YxN+5/BhRpzFiZ7AnTnNjfQpdwNbvT8feyL9Ky6jpp94k8JqLd1
	asqdhzFj7Y4g4bTuX959V2efEWPKksYRu2nunwfZKXe4vnNZcmSFuRP/6ab7sEQ8licL43hjurS
	I9w98f0RBsUl3JrEsKnc/3HNhCHU=
X-Gm-Gg: ASbGncsHOyIeBRLFPlfCTm44QxpxcNkxmyZdWJ99DCMOhb98ZH6fmiCpvajxz59iF1U
	d95EEnfOmp8hRlHu6OLufcqr88FyWhi3ZNJrp/Ik8ZJanY2UGfRzv/C+a3iH/wW74dOl1cdtt8A
	jn7vuMC7ZAPMkrb+DQKc4tkEBA3n9WKKI=
X-Google-Smtp-Source: AGHT+IGkeH40cXRztWXpSrCJ5q6XKPbNvx7k9EkmvL+Je1u1a0S2VQUWKi48NLpznn1NHqP6LSPKlLPZSwHilThRqUc=
X-Received: by 2002:ac8:5f91:0:b0:476:a895:7e87 with SMTP id
 d75a77b69052e-494527f40e7mr184965391cf.48.1747072237855; Mon, 12 May 2025
 10:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
 <20250510-wmt-sflash-v1-2-02a1ac6adf12@gmail.com> <mafs01psu89sx.fsf@kernel.org>
In-Reply-To: <mafs01psu89sx.fsf@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 12 May 2025 21:50:26 +0400
X-Gm-Features: AX0GCFuTn2-A7ifRuVywFd5v331R4uCu7HoPZVJQ7gQFF2XE3zSvat71MlVoTDs
Message-ID: <CABjd4YyRScBgDbi8Sk0D3vxcmLF8+YBetUdkfhrS_4Y7M+gS1g@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: Add a driver for the VIA/WonderMedia
 serial flash controller
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_105039_806312_FC58197B 
X-CRM114-Status: GOOD (  26.44  )
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

SGkgUHJhdHl1c2gsCgpPbiBNb24sIE1heSAxMiwgMjAyNSBhdCAxOjIw4oCvUE0gUHJhdHl1c2gg
WWFkYXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgQWxleGV5LAo+Cj4gT24g
U2F0LCBNYXkgMTAgMjAyNSwgQWxleGV5IENoYXJrb3Ygd3JvdGU6Cj4KPiA+IFRoZSBjb250cm9s
bGVyIGlzIHRhaWxvcmVkIHRvIFNQSSBOT1IgZmxhc2ggbWVtb3J5IGFuZCBhYnN0cmFjdHMgYXdh
eSBhbGwKPiA+IFNQSSBjb21tdW5pY2F0aW9ucyBiZWhpbmQgYSBzbWFsbCBzZXQgb2YgTU1JTyBy
ZWdpc3RlcnMgYW5kIGEgcGh5c2ljYWwKPiA+IG1lbW9yeSBtYXBwaW5nIG9mIHRoZSBhY3R1YWwg
Y2hpcCBjb250ZW50cy4KPiA+Cj4gPiBJdCBkb2Vzbid0IGV4cG9zZSBjaGlwIHByb2JpbmcgZnVu
Y3Rpb25zIGJleW9uZCByZWFkaW5nIHRoZSBJRCB0aG91Z2gsIHNvCj4gPiB1c2UgbG93ZXIgbGV2
ZWwgY2hpcCBvcGNvZGVzIHZpYSB0aGUgInByb2dyYW1tYWJsZSBjb21tYW5kIG1vZGUiIG9mIHRo
ZQo+ID4gY29udHJvbGxlciBhbmQgdGhlIGtlcm5lbCdzIFNQSSBOT1IgZnJhbWV3b3JrIHRvIGF2
b2lkIGhhcmQtY29kaW5nIGNoaXAKPiA+IHBhcmFtZXRlcnMgZm9yIGVhY2ggSUQgdGhlIHdheSB0
aGUgdmVuZG9yIGtlcm5lbCBkb2VzIGl0Lgo+ID4KPiA+IEN1cnJlbnRseSB0ZXN0ZWQgb24gYSBX
b25kZXJNZWRpYSBXTTg5NTAgU29DIHdpdGggYSBNYWNyb25peCBNWDI1TDQwMDVBCj4gPiBmbGFz
aCBjaGlwIChBUEMgUm9jayBib2FyZCksIGJ1dCBzaG91bGQgd29yayBvbiBhbGwgVklBL1dvbmRl
ck1lZGlhIFNvQ3MKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4ZXkgQ2hhcmtvdiA8YWxjaGFy
a0BnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMSArCj4gPiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVy
cy9LY29uZmlnICAgICAgfCAgMTQgKwo+ID4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxl
cnMvTWFrZWZpbGUgICAgIHwgICAxICsKPiA+ICBkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xs
ZXJzL3dtdC1zZmxhc2guYyB8IDUyNSArKysrKysrKysrKysrKysrKysrKysrKysrKysKPgo+IERy
aXZlcnMgaW4gZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy8gYXJlIGRlcHJlY2F0ZWQs
IGFuZCB3ZSB3YW50Cj4gdG8gZXZlbnR1YWxseSBnZXQgcmlkIG9mIHRoZSBBUEkuIFRoZSBleHBl
Y3RlZCB3YXkgaXMgZm9yIGRyaXZlcnMgdG8gdXNlCj4gU1BJIE1FTSAoZHJpdmVycy9zcGkvc3Bp
LW1lbS5jKS4gU1BJIE1FTSBkcml2ZXJzIGFyZSB1c3VhbGx5IG1vcmUKPiBnZW5lcmFsIGFuZCBu
b3QgdGFpbG9yZWQgc3BlY2lmaWNhbGx5IHRvIFNQSSBOT1IgZmxhc2hlcywgc28gaXQgbWlnaHQg
YmUKPiBhIGJpdCB0cmlja3kgdG8gd3JpdGUgZHJpdmVycyBmb3Igc3BlY2lhbGl6ZWQgaGFyZHdh
cmUgd2l0aCBpdC4gQnV0IEkKPiB0aGluayB0aGUgZHJpdmVycy9zcGkvc3BpLWludGVsLmMgZHJp
dmVyIGlzIHdyaXR0ZW4gZm9yIHNpbWlsYXIga2luZCBvZgo+IGhhcmR3YXJlIHNvIGl0IHNob3Vs
ZCBiZSBwb3NzaWJsZS4KCk9vcHMuIEkndmUgaGFkIGEgbG9vayBhdCBzcGktbWVtLCBhbmQgaXQg
c2VlbXMgbGlrZSBpdCdzIG5vdCBhCnBhcnRpY3VsYXJseSBmaXR0aW5nIGFic3RyYWN0aW9uIGZv
ciB0aGlzIGNvbnRyb2xsZXIuCgpGcm9tIHdoYXQgSSB1bmRlcnN0b29kLCBzcGktbWVtIHByaW1h
cmlseSBleHBlY3RzIHRvIGJlIHRhbGtpbmcgU1BJCm9wY29kZXMgdG8gdGhlIGNvbnRyb2xsZXIs
IGFuZCBmb3IgdGhlIGNvbnRyb2xsZXIvZHJpdmVyIHRvIGJyaW5nCnRoZWlyIG93biBjaGlwIHBy
b2Jpbmcgcm91dGluZXMuIFRoaXMgY29udHJvbGxlciBvbiB0aGUgb3RoZXIgaGFuZAphYnN0cmFj
dHMgdGhlIG9wY29kZXMgYXdheSwgYW5kIHdhbnRzIHNvbWVvbmUgdG8gdGVsbCBpdCB3aGF0IGl0
cwpmbGFzaCBjaGlwIGNhbiBkbyAodGhlIGNvbnRyb2xsZXIgaXRzZWxmIGNhbiBvbmx5IGdldCBh
IGNoaXAgSUQgaW4KIm5vcm1hbCIgbW9kZSwgYW5kIGl0IG5lZWRzIHRvIHNvbWVob3cga25vdyB0
aGUgY2hpcCBzaXplIGFuZApzdGFuZGFyZC9mYXN0IHJlYWQgY2FwYWJpbGl0eSBvZiB0aGUgY2hp
cCkuIFNvIHByZXR0eSBtdWNoIHRoZQpvcHBvc2l0ZSwgaHVoLgoKSW4gdGhlIGVuZCwgSSBvbmx5
IG5lZWQgc29tZXRoaW5nIGxpa2Ugc3BpX25vcl9kZXRlY3QoKSBhbmQgY2FuIGRvIHRoZQpyZXN0
IGRpcmVjdGx5IG9uIHRvcCBvZiB0aGUgTVREIGZyYW1ld29yayB3aXRob3V0IHRvdWNoaW5nIGFu
eSBTUEkKb3Bjb2RlcyBhZnRlciB0aGUgZGV0ZWN0aW9uIGlzIGRvbmUuIElzIHRoZXJlIGFueSBv
dGhlciBub24tZGVwcmVjYXRlZApmcmFtZXdvcmsgdGhhdCBjYW4gcHJvdmlkZSBzb21ldGhpbmcg
bGlrZSB0aGlzPyBNYXliZSBwaHlzbWFwPyBJdApsb29rcyBldmVuIG9sZGVyIHRoYW4gU1BJIE5P
UiB0aG91Z2ggOikKCkJlc3QgcmVnYXJkcywKQWxleGV5CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
