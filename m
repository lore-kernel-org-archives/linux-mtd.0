Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42313CA0EE4
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmcw3TwrTzg8NJuh+bYQUUVkwZTdAhTV3RAu5vZf6qo=; b=U1XkxtNfka4G7I
	gaTX4clfJ4pL4FxPHXJQ5uszYE+lI+FSI1cYnpAFT8/s+7u3vLu3f/82JuKd+LxJtz/OME3q68E4e
	jzQFgIgQE1/AgyjoBG5B9R4GvtUzbUa7J1Ka1n4tgWG1MljbEjtkh5zdAtxJWfmtEgS2dBQO8CDzI
	4AMup+aLqqrkuSEq5fDgAa6tLR719jdkro9OAmpG89QZSZNZ+AcrIblUO/3XMLlJFSSOSLhy4wp9y
	gDWF26lR4IZkzak+XC38gC2neTwSETTrcVkmWxfMxjImI5zHp9HI3OjezkceoxDHJCMqyahVlaPOP
	G7NDcutjqEuEanLPEZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unueN-00000006pQd-0bpL;
	Mon, 18 Aug 2025 07:51:27 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untvp-00000006lHH-0Y7t
	for linux-mtd@lists.infradead.org;
	Mon, 18 Aug 2025 07:05:26 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-333f8f0dd71so29705091fa.1
        for <linux-mtd@lists.infradead.org>; Mon, 18 Aug 2025 00:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755500723; x=1756105523; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHsUL+h4LuU3pP71Ed95ISAuUKi9IsSaBNdtMsfJmNY=;
        b=PntGXvQdijd/ftg7+9aAGo+b/xeT6szbQqvqSHwn3nrYm1s1Yr8joXU3HMSsJgD2oQ
         wmyS+kWk0HTDW/ebjGPW1Or22PL35YpHDOgnBqp0Z5cuhbTgOHsXcJw+jkS5Cyytd1GY
         Yg/ofgHuEd2tOg1oMzopOkYJgZnMN/9+Y1W++wlqAUB2sjrqTaZVKMbEomXoNMiV2ZZn
         Hf04xhePkke+TdqV9W6nYbMuPm/TUCUylpgHB95n6utQLQC+ziVtvwBaICyrL5lla4JZ
         RzTnOIYWHUz9ob8Fuz63ktQrcBx1kuIpsJvnxOM2HED47RhXDl45tPCmDInYihqOMhml
         FHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755500723; x=1756105523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHsUL+h4LuU3pP71Ed95ISAuUKi9IsSaBNdtMsfJmNY=;
        b=N6sr8JboTGuWqCbz/Es0LsaLzgp+yEDAZfuEVA4tS+0CccDOe43Q8rPzMfJis+Tp/W
         uoOHYTj9y8TExR9tVp3gyEey4ebLvTTLX/bi1lRtaDlDlW8+7ORt51TmD53LZfJgmMjX
         zaOgfCbtS2rUCCagbSj82epwI79w6pPfwqEQIii7PwyWcDU/innj1RvMrPyI4Fgskdy+
         8tINTHU3YmxHiJLec+8wqgH2rGryp6NojAaekJUTi6T/n4Vd9DvLN7GtO115uheLbO87
         RQnz5EShnVOiZ19pq/Jen6B9PWhzBB2jg6Sa5BKmHDOogDpxL5+k7jw67/zsFaQbDa4N
         ie0g==
X-Forwarded-Encrypted: i=1; AJvYcCUCumRheDQUVMl5REy/tnOdyp1E8/Aqnjled3XSgmcCNtmRvFdWf52PWHz0fzZvaK/Xyz99zUcTHjU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIgVwT0FpviE8AzFwKFDDaOeVKWljGFvKEFWjhc986P8lJlq3V
	AXo4G/82iq6Gndw3MkHuKbFesK83nIsGllceMjCFeiPfkT8BFwHFyfTUqTJyspWIyjix+EZA8ST
	XU7YYv13pO642Ia9zRzvuVKvJEB7nfmFQHlD7nlk=
X-Gm-Gg: ASbGncv0XteSvyGSMpvH/wUe4kb8ZGn98OWC/uLVKpceb/LL11ApbsvGtGbG91HW2oI
	vXeNRA7KXN6pmwf+LrQUmVdBJRkm397wPVqUTBBSiW2AOysmniZwc+CjPU3z0OZkHbLV3S3uWDV
	u0Xg/2wdheMn5inhQcoCWBbA1YakNxRNTUyZRLFGsguGIM34LXdUOX9j7zKBfasDNHC6y7UsNJD
	t8QWjZqm2xFF5DEPk8=
X-Google-Smtp-Source: AGHT+IFDuj56cYERGjPW+9wF7giB825tHomm1ZeTAk7dFt2+UOIIfPhfXqYy7W0LA7hF9aJ4nHmDoU+yiw145vgY7yo=
X-Received: by 2002:a05:651c:20cc:20b0:332:612b:6f49 with SMTP id
 38308e7fff4ca-33412c91ef0mr13268441fa.29.1755500722327; Mon, 18 Aug 2025
 00:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <47545b7ed4943a088b27021a0fdbeaf56947e833.1754890670.git.zhoubinbin@loongson.cn>
 <CAAhV-H4h5qZ8gCjoKMKd8wBYG+secmTrHdo+AY1A60rmhKrCoQ@mail.gmail.com> <CAMpQs4JgvCCxgNhmQ7XPHZ9HHohFW69vO7D6mpbBb3Q16u78ag@mail.gmail.com>
In-Reply-To: <CAMpQs4JgvCCxgNhmQ7XPHZ9HHohFW69vO7D6mpbBb3Q16u78ag@mail.gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Mon, 18 Aug 2025 15:04:44 +0800
X-Gm-Features: Ac12FXy8IgHpqnLhbDZ9zWhgCTvDjrg_nDf6Gd34HT-rNlcS5yYHJjBmchXh0JY
Message-ID: <CAJhJPsU+dVmnBnHgnNDL0Zro_KYN12c7+pw=720ju-w7veegMQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] mtd: rawnand: loongson: Rename loongson1 to loongson
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_000525_180762_F52B5CB0 
X-CRM114-Status: GOOD (  30.65  )
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

T24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgNTo0MuKAr1BNIEJpbmJpbiBaaG91IDx6aG91YmIuYWFy
b25AZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEh1YWNhaToKPgo+IFRoYW5rcyBmb3IgeW91ciBy
ZXBseS4KPgo+IE9uIE1vbiwgQXVnIDExLCAyMDI1IGF0IDI6MzbigK9QTSBIdWFjYWkgQ2hlbiA8
Y2hlbmh1YWNhaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSwgQmluYmluLAo+ID4KPiA+
IE9uIE1vbiwgQXVnIDExLCAyMDI1IGF0IDI6MDLigK9QTSBCaW5iaW4gWmhvdSA8emhvdWJpbmJp
bkBsb29uZ3Nvbi5jbj4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFRoZSBzZWNvbmQgc3RlcCBpbiBwcmVw
YXJpbmcgdG8gYWRkIExvb25nc29uLTJLIHN1cHBvcnQgaXMgdG8gY2hhbmdlIHRoZQo+ID4gPiBu
YW1lcyBvZiB0aGUgZHJpdmVyIGZpbGVzIGFuZCBLY29uZmlnIG9wdGlvbnMgZnJvbSBMb29uZ3Nv
bjEtc3BlY2lmaWMgdG8KPiA+ID4gTG9vbmdzb24tZ2VuZXJpYy4KPiA+IElzIGl0IHBvc3NpYmxl
IHRvIG1lcmdlIHRoZSBmaXJzdCB0d28gcGF0Y2hlcz8gSWYgbm90LCBpdCBpcyBiZXR0ZXIgdG8K
PiA+IHVzZSBsb29uZ3NvbjEgcmF0aGVyIHRoYW4gbG9vbmdzb24gaW4gdGhlIHN1YmplY3QgbGlu
ZSBvZiB0aGlzIHBhdGNoLgo+Cj4gQXQgZmlyc3QsIEkgdGhvdWdodCB0aGF0IHNlcGFyYXRpbmcg
dGhlIHJlbmFtaW5nIG9mIGZpbGUgcHJlZml4ZXMgZnJvbQo+IHRoZSByZW5hbWluZyBvZiBmaWxl
IG5hbWVzIHdvdWxkIG1ha2UgdGhlIGNoYW5nZXMgY2xlYXJlci4gQW5vdGhlcgo+IHBvaW50IGlz
IHdoZXRoZXIgcmVuYW1pbmcgS2NvbmZpZyBpdGVtcyB3b3VsZCBiZSBjb25zaWRlcmVkIEFQSQo+
IGJyZWFraW5nLCBldmVuIHRob3VnaCBubyBvbmUgaXMgY3VycmVudGx5IHJlZmVyZW5jaW5nIHRo
ZW0/Cj4KPiBPZiBjb3Vyc2UsIGlmIGFueW9uZSB0aGlua3MgdGhhdCBzZXBhcmF0aW5nIHRoZW0g
aXMgdW5uZWNlc3NhcnksIEkKPiB3aWxsIG1lcmdlIHRoZW0gaW4gdGhlIG5leHQgdmVyc2lvbi4K
Ckl04oCZcyByZWFzb25hYmxlIHRvIG1lcmdlIHRoZSBmaXJzdCB0d28gcGF0Y2hlcy4KSSBhZ3Jl
ZS4KCj4gPgo+ID4gSHVhY2FpCj4gPgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaW5iaW4g
WmhvdSA8emhvdWJpbmJpbkBsb29uZ3Nvbi5jbj4KPiA+ID4gLS0tCj4gPiA+ICBNQUlOVEFJTkVS
UyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0K
PiA+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNiArKystLS0KPiA+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gPiAgLi4ub25nc29uMS1u
YW5kLWNvbnRyb2xsZXIuYyA9PiBsb29uZ3Nvbi1uYW5kLWNvbnRyb2xsZXIuY30gfCAwCj4gPiA+
ICA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+ID4g
IHJlbmFtZSBkcml2ZXJzL210ZC9uYW5kL3Jhdy97bG9vbmdzb24xLW5hbmQtY29udHJvbGxlci5j
ID0+IGxvb25nc29uLW5hbmQtY29udHJvbGxlci5jfSAoMTAwJSkKPiA+ID4KPiA+ID4gZGlmZiAt
LWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiA+ID4gaW5kZXggNGJhYzRlYTIxYjY0
Li5jYzUwMjU4MmM5ZjEgMTAwNjQ0Cj4gPiA+IC0tLSBhL01BSU5UQUlORVJTCj4gPiA+ICsrKyBi
L01BSU5UQUlORVJTCj4gPiA+IEBAIC0xNjcyMiw3ICsxNjcyMiw3IEBAIEY6ICAgICAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzLyovbG9vbmdzb24sbHMxKi55YW1sCj4gPiA+ICBG
OiAgICAgYXJjaC9taXBzL2luY2x1ZGUvYXNtL21hY2gtbG9vbmdzb24zMi8KPiA+ID4gIEY6ICAg
ICBhcmNoL21pcHMvbG9vbmdzb24zMi8KPiA+ID4gIEY6ICAgICBkcml2ZXJzLyovKmxvb25nc29u
MSoKPiA+ID4gLUY6ICAgICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9sb29uZ3NvbjEtbmFuZC1jb250
cm9sbGVyLmMKPiA+ID4gK0Y6ICAgICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9sb29uZ3Nvbi1uYW5k
LWNvbnRyb2xsZXIuYwo+ID4gPiAgRjogICAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLWxvb25nc29uMS5jCj4gPiA+ICBGOiAgICAgc291bmQvc29jL2xvb25nc29u
L2xvb25nc29uMV9hYzk3LmMKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L0tjb25maWcgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gPiA+IGluZGV4
IDRiOTlkOWM0MjJjMy4uZDllM2YxMzY2NmFjIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9LY29uZmlnCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25m
aWcKPiA+ID4gQEAgLTQ2MiwxMiArNDYyLDEyIEBAIGNvbmZpZyBNVERfTkFORF9OVVZPVE9OX01B
MzUKPiA+ID4gICAgICAgICAgIEVuYWJsZXMgc3VwcG9ydCBmb3IgdGhlIE5BTkQgY29udHJvbGxl
ciBmb3VuZCBvbgo+ID4gPiAgICAgICAgICAgdGhlIE51dm90b24gTUEzNSBzZXJpZXMgU29Dcy4K
PiA+ID4KPiA+ID4gLWNvbmZpZyBNVERfTkFORF9MT09OR1NPTjEKPiA+ID4gLSAgICAgICB0cmlz
dGF0ZSAiTG9vbmdzb24xIE5BTkQgY29udHJvbGxlciIKPiA+ID4gK2NvbmZpZyBNVERfTkFORF9M
T09OR1NPTgo+ID4gPiArICAgICAgIHRyaXN0YXRlICJMb29uZ3NvbiBOQU5EIGNvbnRyb2xsZXIi
Cj4gPiA+ICAgICAgICAgZGVwZW5kcyBvbiBMT09OR1NPTjFfQVBCX0RNQSB8fCBDT01QSUxFX1RF
U1QKPiA+ID4gICAgICAgICBzZWxlY3QgUkVHTUFQX01NSU8KPiA+ID4gICAgICAgICBoZWxwCj4g
PiA+IC0gICAgICAgICBFbmFibGVzIHN1cHBvcnQgZm9yIE5BTkQgY29udHJvbGxlciBvbiBMb29u
Z3NvbjEgU29Dcy4KPiA+ID4gKyAgICAgICAgIEVuYWJsZXMgc3VwcG9ydCBmb3IgTkFORCBjb250
cm9sbGVyIG9uIExvb25nc29uIGZhbWlseSBjaGlwcy4KPiA+ID4KPiA+ID4gIGNvbW1lbnQgIk1p
c2MiCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9NYWtlZmls
ZSBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L01ha2VmaWxlCj4gPiA+IGluZGV4IDcxMWQwNDNhZDRm
OC4uYzE4MmI5NzAzYTllIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9N
YWtlZmlsZQo+ID4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9NYWtlZmlsZQo+ID4gPiBA
QCAtNTksNyArNTksNyBAQCBvYmotJChDT05GSUdfTVREX05BTkRfUk9DS0NISVApICAgICAgICAg
ICAgICAgKz0gcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLm8KPiA+ID4gIG9iai0kKENPTkZJR19N
VERfTkFORF9QTDM1WCkgICAgICAgICAgICs9IHBsMzV4LW5hbmQtY29udHJvbGxlci5vCj4gPiA+
ICBvYmotJChDT05GSUdfTVREX05BTkRfUkVORVNBUykgICAgICAgICArPSByZW5lc2FzLW5hbmQt
Y29udHJvbGxlci5vCj4gPiA+ICBvYmotJChDT05GSUdfTVREX05BTkRfTlVWT1RPTl9NQTM1KSAg
ICArPSBudXZvdG9uLW1hMzVkMS1uYW5kLWNvbnRyb2xsZXIubwo+ID4gPiAtb2JqLSQoQ09ORklH
X01URF9OQU5EX0xPT05HU09OMSkgICAgICAgKz0gbG9vbmdzb24xLW5hbmQtY29udHJvbGxlci5v
Cj4gPiA+ICtvYmotJChDT05GSUdfTVREX05BTkRfTE9PTkdTT04pICAgICAgICAgICAgICAgICs9
IGxvb25nc29uLW5hbmQtY29udHJvbGxlci5vCj4gPiA+Cj4gPiA+ICBuYW5kLW9ianMgOj0gbmFu
ZF9iYXNlLm8gbmFuZF9sZWdhY3kubyBuYW5kX2JidC5vIG5hbmRfdGltaW5ncy5vIG5hbmRfaWRz
Lm8KPiA+ID4gIG5hbmQtb2JqcyArPSBuYW5kX29uZmkubwo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbG9vbmdzb24xLW5hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbG9vbmdzb24tbmFuZC1jb250cm9sbGVyLmMKPiA+ID4gc2ltaWxhcml0eSBp
bmRleCAxMDAlCj4gPiA+IHJlbmFtZSBmcm9tIGRyaXZlcnMvbXRkL25hbmQvcmF3L2xvb25nc29u
MS1uYW5kLWNvbnRyb2xsZXIuYwo+ID4gPiByZW5hbWUgdG8gZHJpdmVycy9tdGQvbmFuZC9yYXcv
bG9vbmdzb24tbmFuZC1jb250cm9sbGVyLmMKPiA+ID4gLS0KPiA+ID4gMi40Ny4zCj4gPiA+Cj4g
PiA+Cj4KPiAtLQo+IFRoYW5rcy4KPiBCaW5iaW4KCgoKLS0KQmVzdCByZWdhcmRzLAoKS2VndWFu
ZyBaaGFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
