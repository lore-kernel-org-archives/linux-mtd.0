Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11900CA0ED1
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Aug 2025 01:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2HwjIwpoZ34j4U4ytA7mmn/Yh8AiO3r3bQDvfr+XgY=; b=ob9s5ce8nMXG2I
	QVe2ocn5ffXwpWpmFH9UODl8iHaq7IXhvIB3IT7E/M7xFhW961gTgMJPBbTOok0EKHO53ua6a3mjn
	p8YVTBIvvWHCb4dhF/TgRrIfyiUsazdJKanB2l/o82+wCiiNUOAU+xhYqY6wBpN01JyKeu+R5y2bh
	cCATmMkuIC6zbogqEq4KWB866SKmBYYHIzT3CuyTrJo099xnj1XUNyjeOqphLautgxlOczvUKjoTs
	vSpSCGh6x8v1r4SSjCo4toNC2tlQVBn1/gdyTr9U/NeWhrPeiUPBy5Hjh+LJj11xS5N48ZdkGr6P2
	UxvmDN1WyivmKOL3UOXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ule5o-00000009Xr0-0nt0;
	Tue, 12 Aug 2025 01:46:24 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ule5l-00000009Xpn-3FCw
	for linux-mtd@lists.infradead.org;
	Tue, 12 Aug 2025 01:46:22 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-af925cbd73aso948347066b.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 18:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754963180; x=1755567980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYaz1/uT9oyZjCyu9oVfjnYhAs3G+DnESiLkCTuz8Uc=;
        b=iuT36Rn4d676CToPcp2PplVXRfY8yu2fP4yD9pCAHP7KNeHeBAdNwIQrDGdEqX/TIQ
         vrZg57I3DOsbjeqH4bx+Xs1NgfJVVBB1G7ZP/WXni6wpdca2VXJ4X47AKZHIazlyvZqI
         FP2a6i9PWpipANXxDR9v640K0UZlcWoFao10RQQ8Dnj3EerTYtmmyMyyX9ckbiSVKsbs
         WJyioQ9nKkW+ESG7gdDCs72xAy990xzvvEBCt33WbKtAHOeyE7mqHzFnC79rlviBzcFb
         LyGAIH5M5zSVRNZBfSqbGMJAyjE361oMOgFcjdGKpR1uU1Uq2cyWKmj3oYzReN8JZhyc
         rcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754963180; x=1755567980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYaz1/uT9oyZjCyu9oVfjnYhAs3G+DnESiLkCTuz8Uc=;
        b=HPC3cCGkgxNm0fzmQ9bw8H8ErEzIyG/n+fLcFy/aJuIqPlLo7UG2rAYK9Vlx1utWL7
         lnLHK0Dr11NK0j5HfoLKOsS5PdzJJVmCUrGWbtfDmD013fcRqOSCRdQkQp6ADPKWtMxQ
         lG7S0G1VzRsVYc+/c39Vor6waf7/zm2pstZtZVfwZEYYaw28HEOYKV6dNzEUbZSJMK+I
         j6aGzkuYk+jjeeIyZAqUcRL/8d5LEXXGzm2qUvTUekHHISoWBFeY8+PmwBv8YAgdAmiz
         rcpcmRczAf0mrn4C4EHeL3umAeSlm9a3aG4EHVC99CtuXmC/I+qqMCsZUDscbS9Xdj5E
         Spgg==
X-Forwarded-Encrypted: i=1; AJvYcCV0V6ct86AQOcQrPYjGL+MTM/U5d3V7f2CFL80z8O9KHYKIrFmgKsZgp/J7Htna/484axeuWVtKX1M=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJju8DUye9QyjKF/6S3EVJdGFmZwoksNjaMmbNCxeCR1JgVMug
	7h+k1Q1O//QiNfZsSEjY2gK7JoxLtng+r3zblDq+i08QiNt8tp0uXir/BSjmesjdzz5ealhK9gF
	CLteAXcrVoYdumFAVO40tfJu3bCdrXok=
X-Gm-Gg: ASbGncv1qVcRBio4AtL6Xz6OXBiYbCshC+PrHg316J+9NmT5AHkze3DddEOorQY0Ny2
	O9DklrM9SzicGSLmJuEVl01rP0t9C1j+PraJtFxtCufEmD2wrggKuhTmfzAO5bZ7C0YK6MxdpTa
	/kuHwCctLUlGl5wq/hyVOqPEx6Q3xADbtWDmWYwLR106Q1Pvif7suwqdJ73Hwn2N7f3XztfIaGg
	WOob8E=
X-Google-Smtp-Source: AGHT+IGgBsPd0ik++HxOLBsaEV8zW5o8TFHwtEZ/G5uBZxwRtTAQ1Zhq97IMhlh4+r1CKAUkXGwVqxKI7eSRs6med2s=
X-Received: by 2002:a17:907:72c5:b0:ace:d710:a8d1 with SMTP id
 a640c23a62f3a-afa1e087ebdmr143285266b.24.1754963179717; Mon, 11 Aug 2025
 18:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <89732d64415077ecd9f74c5853c542e62c0dfe26.1754890670.git.zhoubinbin@loongson.cn>
 <aJox6R9eCZ5vSc7H@pie>
In-Reply-To: <aJox6R9eCZ5vSc7H@pie>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 12 Aug 2025 09:46:07 +0800
X-Gm-Features: Ac12FXz0ARLdniv0c7AvZGZa7aD_nYfFRofkgvyicNZC2-pOKF37F5dYWwU43vI
Message-ID: <CAMpQs4+3iAYWkDKf67=+0wXSgZmg+fC7p5kFst0fushpWscuaA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] mtd: rawnand: loongson: Add Loongson-2K0500 NAND
 controller support
To: Yao Zi <ziyao@disroot.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_184621_830301_209E2F25 
X-CRM114-Status: GOOD (  22.88  )
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

SEkgWWFvOgoKVGhhbmtzIGZvciB5b3VyIHJlcGx5LgoKT24gVHVlLCBBdWcgMTIsIDIwMjUgYXQg
MjowOeKAr0FNIFlhbyBaaSA8eml5YW9AZGlzcm9vdC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBB
dWcgMTEsIDIwMjUgYXQgMDI6MDM6MTNQTSArMDgwMCwgQmluYmluIFpob3Ugd3JvdGU6Cj4gPiBU
aGUgTG9vbmdzb24tMkswNTAwIE5BTkQgY29udHJvbGxlciBpcyBzaW1pbGFyIHRvIHRoZSBMb29u
Z3Nvbi0xQy4KPiA+Cj4gPiBJdCBzdXBwb3J0cyBhIG1heGltdW0gY2FwYWNpdHkgb2YgMTZHQiBG
TEFTSCBwZXIgY2hpcCB3aXRoIGEgbWF4aW11bQo+ID4gcGFnZSBzaXplIG9mIDhLQiwgYW5kIGl0
IHN1cHBvcnRzIHVwIHRvIDQgY2hpcCBzZWxlY3RzIGFuZCA0IFJEWQo+ID4gc2lnbmFscy4KPiA+
Cj4gPiBJdHMgRE1BIGNvbnRyb2xsZXIgaXMgZGVmYXVsdGVkIHRvIEFQQkRNQTAuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogQmluYmluIFpob3UgPHpob3ViaW5iaW5AbG9vbmdzb24uY24+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAg
MiArLQo+ID4gIC4uLi9tdGQvbmFuZC9yYXcvbG9vbmdzb24tbmFuZC1jb250cm9sbGVyLmMgICB8
IDU1ICsrKysrKysrKysrKysrKysrKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L0tjb25maWcgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gPiBpbmRleCBk
OWUzZjEzNjY2YWMuLjdiMGM1ZDA2YWE5NSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcKPiA+
IEBAIC00NjQsNyArNDY0LDcgQEAgY29uZmlnIE1URF9OQU5EX05VVk9UT05fTUEzNQo+ID4KPiA+
ICBjb25maWcgTVREX05BTkRfTE9PTkdTT04KPiA+ICAgICAgIHRyaXN0YXRlICJMb29uZ3NvbiBO
QU5EIGNvbnRyb2xsZXIiCj4gPiAtICAgICBkZXBlbmRzIG9uIExPT05HU09OMV9BUEJfRE1BIHx8
IENPTVBJTEVfVEVTVAo+ID4gKyAgICAgZGVwZW5kcyBvbiBMT09OR1NPTjFfQVBCX0RNQSB8fCBM
T09OR1NPTjJfQVBCX0RNQSB8fCBDT01QSUxFX1RFU1QKPgo+IFdoeSBpcyB0aGlzIGRlcGVuZGVu
Y3kgbmVjZXNzYXJ5PyBJIHRoaW5rIHRoZSBETUEgb3BlcmF0aW9ucyBhcmUgZG9uZQo+IHRocm91
Z2ggRE1BZW5naW5lIEFQSSwgYW5kIHRodXMgdGhlIGNvbnN1bWVyIGRlY291cGxlcyB3aXRoIHRo
ZSBETUEKPiBwcm92aWRlci4gSWYgc28sIEkgdGhpbmsgdGhlIGRlcGVuZHMgbGluZSBzaG91bGQg
YmUgcmVtb3ZlZCwgaW5zdGVhZCBvZgo+IGV4dGVuZGVkLgoKVGhpcyBpcyBhbiBleGlzdGluZyBl
eGVjdXRpb24gZGVwZW5kZW5jeS4gQWx0aG91Z2ggdGhlcmUgaXMgbm8KZ3VhcmFudGVlIHRoYXQg
aXQgd2lsbCB3b3JrIHdpdGggb3RoZXIgRE1BIGVuZ2luZXMgaW4gdGhlIGZ1dHVyZSwgb25seQp0
aGlzIGNvbWJpbmF0aW9uIGhhcyBiZWVuIHRlc3RlZCBhbmQgcHJvdmVuIHRvIGJlIGNvcnJlY3Qg
YXQgcHJlc2VudC4KVGhlcmVmb3JlLCBJIHdvdWxkIHN0aWxsIGxpa2UgdG8gcmV0YWluIHRoaXMg
ZGVwZW5kZW5jeS4KPgo+IFJlZ2FyZHMsCj4gWWFvIFppCj4KPiA+ICAgICAgIHNlbGVjdCBSRUdN
QVBfTU1JTwo+ID4gICAgICAgaGVscAo+ID4gICAgICAgICBFbmFibGVzIHN1cHBvcnQgZm9yIE5B
TkQgY29udHJvbGxlciBvbiBMb29uZ3NvbiBmYW1pbHkgY2hpcHMuCgoKLS0gClRoYW5rcy4KQmlu
YmluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
