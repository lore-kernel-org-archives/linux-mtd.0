Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5F3CA0FE1
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Aug 2025 08:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLNCR2R1d7mZ7yozWLxbtueKTOq+01f4q5Kc+9MNaaQ=; b=zSQrwj0jorDqo0
	VvxoWSkQ+DLqNcrHAwjwRS3q2Udfbmw8OejCrcIDg93CU9q4jPdTUc0M8vEWUqARtoGoJ/FGaE3mp
	wZkboPxRtA4j/TOuHvUWy9LbJMIplvYil0Rcd4Yrr2Ql39bY/ne9WFTemGv3BM/lSssHjFKPyLYhQ
	Dk3JpMKR77FLCJ1kOycXIcv89RMld4fI8YLjRMUHQpIU/LcR44dVkOyI81xHsE5nrrxziqCVjcH0d
	42noAOho3YBrrT0Xn8JCu0eXVlsg5gZQIbMPnaIrZX58fUIeD/VoSu6x3z32hgw6afvK0tFv2qkAI
	MnstsFqTxgMrkkIwFiDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSHT-00000007GDI-2PqK;
	Mon, 25 Aug 2025 08:10:19 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRWZ-000000079gX-0Cc8
	for linux-mtd@lists.infradead.org;
	Mon, 25 Aug 2025 07:21:52 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6188b5ae1e8so4736832a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 25 Aug 2025 00:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756106509; x=1756711309; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c338oe4D3IXQr7k2LQ7ucjYxcOVnL88ce6NV0J74fN0=;
        b=l7r9YHowWapG3t+B+035DauMfqsd+/S7faV3gCS6CepwjiMSkDAJ9qPWiIV8snWSne
         nZiyJXLKkyD15pBT62PStL3biD1M8alxACVRW2z7vVVcJ/nnCFA0ZebS5iKWGQm+3DYj
         QG/H6zXla5o7g1rl+5zkrMJbYpgGjG05lc5iCVGAQxBkHwgnuoqcTpAlyRsv/J1wjS0D
         ep9I/I+2zz9uQB0V18gvwI6hGoFAZsnscaKUYyxVNnqYZeadcAKZR6iTBU7cqhiUnLKZ
         /uu0+9m3e1hrKP/UmjlIC9EwNDbJeUeFLgG0+SfCMY46JU+FwD8ztCiMR+g+oXndJ6RC
         US7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756106509; x=1756711309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c338oe4D3IXQr7k2LQ7ucjYxcOVnL88ce6NV0J74fN0=;
        b=UFITKpq770PirLeSuY6VBuQX+Kt8HSkUVE3ZDbteRVNmtHLsglwHnvsHCFWthxP9wa
         5RC9J+Sdk2SzxBGUf5m1qTQiqorWi0Id6doFn5Gtk/WfWqa/2cCjWZiwUS0RoIpOvl1W
         GlPAUpzcOceGW26e5lx/ADrUcrZDzP+3rQtfTaRojnyScXPkb02JNEsRmsFMjy+9/jTY
         aYSuTCSRPuG1yW95F3oteViKvB5gq6wDQNXeNKwQrQyBCE4BqAWKp41F9TB0d9Uph/pY
         mlWsOcH8RHoxKDXRZMpfdbjR1nKSdC/hELzkTg4NjAKNJVReDRMpeC3DFbFz7Ea7kMmo
         Tq5g==
X-Forwarded-Encrypted: i=1; AJvYcCV2kKSb/OZbRfQhOFsYzpb+cGfXJDh3EJzMoJg/2J6QZ9B2L6knLC2XjDpcqN1sstMsvgnoXHDhh70=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKS1vfukiADQGeU+TWoSCOCcudUyUpbxr1hQYsoAdX3xu07ZQC
	/gMz2RbXrorRSXYgxTok79zrlkXnmXgBC9Af7M8mlvwKzxUUBjmtyiUmCxeNBq33kvYpA62V9/B
	8b9NEWyV/uPWc5aE4KVdFD0phDNCPSJ8=
X-Gm-Gg: ASbGnctSjUFMvx+MuNvx8nWyeADyGrjM+ODEcVKGGgOQvU6p5H92oWqU2RofUQtGmvM
	Rq+MNBW4GJV4zzz4xP0jNKYh/wgVia6x+JBHEoc6Ig1qxLKtxErcqNUJc9K6/0cdB1wTOS2KA5M
	QVFr/3l/tReuMd9SCTmH1JQbEfvchOpxOeCH4RMWW9Amies+d6TIJ7M65bNyLWtsRcaNU9M/S3x
	yEAhGe+BQ==
X-Google-Smtp-Source: AGHT+IFsZg/rfT8jBEVfO/j2TfkK77hlaw2k7PC6PtcovowbwFBbXWg5GD34jM5rh3lVFQ90FKR+JiQSdFX7OUYNbNo=
X-Received: by 2002:a05:6402:4310:b0:61c:7efd:acc7 with SMTP id
 4fb4d7f45d1cf-61c7efdb44emr109859a12.3.1756106508858; Mon, 25 Aug 2025
 00:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755757841.git.zhoubinbin@loongson.cn> <589b4dfab9c1edd95fa05cba80ec58ea9ca099da.1755757841.git.zhoubinbin@loongson.cn>
 <87ms7olp0a.fsf@bootlin.com>
In-Reply-To: <87ms7olp0a.fsf@bootlin.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 25 Aug 2025 15:21:37 +0800
X-Gm-Features: Ac12FXzBj1tENuJWAe4kCtn9EXiaBxggZJaitpY5iMifdSsbaHz2HsF1buuz4Us
Message-ID: <CAMpQs4Lmswk8zmH-g54ey79shY5C0Da4e5gL4t5N5CzqMOL=pQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] mtd: rawnand: loongson: Add Loongson-2K0500 NAND
 controller support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_002151_088112_A1ED4DE7 
X-CRM114-Status: GOOD (  20.10  )
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

SGkgTWlxdWVsOgoKVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCk9uIFN1biwgQXVnIDI0LCAyMDI1
IGF0IDExOjI24oCvUE0gTWlxdWVsIFJheW5hbAo8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g
d3JvdGU6Cj4KPiBIaSBCaW5iaW4sCj4KPiA+ICsjZGVmaW5lIExPT05HU09OX05BTkRfNjRCSVRf
RE1BICAgICAgICAgICAgICBCSVQoMCkKPiA+ICsKPiA+ICAjZGVmaW5lIEJJVFNfUEVSX1dPUkQg
ICAgICAgICAgICAgICAgICAgICAgICAoNCAqIEJJVFNfUEVSX0JZVEUpCj4gPgo+ID4gIHN0cnVj
dCBsb29uZ3Nvbl9uYW5kX2hvc3Q7Cj4gPiBAQCAtODMsNiArMTA0LDcgQEAgc3RydWN0IGxvb25n
c29uX25hbmRfZGF0YSB7Cj4gPiAgICAgICB1bnNpZ25lZCBpbnQgaG9sZF9jeWNsZTsKPiA+ICAg
ICAgIHVuc2lnbmVkIGludCB3YWl0X2N5Y2xlOwo+ID4gICAgICAgdW5zaWduZWQgaW50IG5hbmRf
Y3M7Cj4gPiArICAgICB1bnNpZ25lZCBpbnQgZmxhZ3M7Cj4KPiBDYW4gd2UgdHVybiB0aGlzIGlu
dG8gYSBib29sZWFuIGluc3RlYWQgYW5kIGdpdmUgaXQgYSBETUEgcmVsYXRlZCBuYW1lPwo+IEkn
bSBub3Qgc3VyZSB0aGUgbGlzdCBvZiBmbGFncyB3aWxsIGV4dGVuZCByYXBpZGx5Li4uCgpLZWd1
YW5nIGhhcyBhIGRpZmZlcmVudCBvcGluaW9uIG9uIHRoaXMgcGFydCBbMV0uIFNpbmNlIGhpcyBy
ZXBseQplbWFpbCBhbmQgbXkgVjMgcGF0Y2hzZXQgZW1haWwgd2VyZSBzZW50IGF0IGFib3V0IHRo
ZSBzYW1lIHRpbWUsIEkKcGxhbiB0byBhZGRyZXNzIHRoZXNlIGNvbW1lbnRzIGluIHRoZSBWNCBw
YXRjaHNldC4KCkhlIGZvdW5kIHRoYXQgdGhlIExvb25nc29uLTEgc2VyaWVzIE5BTkQgY29udHJv
bGxlciBhbHNvIG5lZWRzCmRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQoKSwgc28gd2Ugc3RpbGwg
bmVlZCB0byBleHBsaWNpdGx5IHNldCB0aGUKdmFsdWUgb2YgZG1hX2JpdHMuCgpTcGVjaWZpY2Fs
bHk6ClRoZSBmbGFncyB2YXJpYWJsZSB3aWxsIGJlIHNwbGl0IGludG86CmBgYAp1bnNpZ25lZCBp
bnQgZG1hX2JpdHM7CmludCAoKmRtYV9jb25maWcpKHN0cnVjdCBkZXZpY2UgKmRldik7CmBgYAoK
WzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FKaEpQc1czS0dMPUZINVpWcXZSci1S
RCtpaDA5bUZOdWs3d0dYZXBHVlN3N2JUYWl3QG1haWwuZ21haWwuY29tLwo+Cj4gPiAgICAgICB2
b2lkICgqc2V0X2FkZHIpKHN0cnVjdCBsb29uZ3Nvbl9uYW5kX2hvc3QgKmhvc3QsIHN0cnVjdCBs
b29uZ3Nvbl9uYW5kX29wICpvcCk7Cj4gPiAgfTsKPiA+Cj4gPiBAQCAtNzQ1LDcgKzc2Nyw3IEBA
IHN0YXRpYyBpbnQgbG9vbmdzb25fbmFuZF9jb250cm9sbGVyX2luaXQoc3RydWN0IGxvb25nc29u
X25hbmRfaG9zdCAqaG9zdCkKPiA+ICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9IGhvc3QtPmRl
djsKPiA+ICAgICAgIHN0cnVjdCBkbWFfY2hhbiAqY2hhbjsKPiA+ICAgICAgIHN0cnVjdCBkbWFf
c2xhdmVfY29uZmlnIGNmZyA9IHt9Owo+ID4gLSAgICAgaW50IHJldDsKPiA+ICsgICAgIGludCBy
ZXQsIHZhbDsKPiA+Cj4gPiAgICAgICBob3N0LT5yZWdtYXAgPSBkZXZtX3JlZ21hcF9pbml0X21t
aW8oZGV2LCBob3N0LT5yZWdfYmFzZSwgJmxvb25nc29uX25hbmRfcmVnbWFwX2NvbmZpZyk7Cj4g
PiAgICAgICBpZiAoSVNfRVJSKGhvc3QtPnJlZ21hcCkpCj4gPiBAQCAtNzU1LDYgKzc3Nyw5IEBA
IHN0YXRpYyBpbnQgbG9vbmdzb25fbmFuZF9jb250cm9sbGVyX2luaXQoc3RydWN0IGxvb25nc29u
X25hbmRfaG9zdCAqaG9zdCkKPiA+ICAgICAgICAgICAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKGhv
c3QtPnJlZ21hcCwgTE9PTkdTT05fTkFORF9QQVJBTSwgaG9zdC0+ZGF0YS0+aWRfY3ljbGVfZmll
bGQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBob3N0LT5kYXRhLT5tYXhf
aWRfY3ljbGUgPDwgX19mZnMoaG9zdC0+ZGF0YS0+aWRfY3ljbGVfZmllbGQpKTsKPiA+Cj4gPiAr
ICAgICBpZiAoaG9zdC0+ZGF0YS0+ZmxhZ3MgJiBMT09OR1NPTl9OQU5EXzY0QklUX0RNQSkKPiA+
ICsgICAgICAgICAgICAgZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudChkZXYsIERNQV9CSVRfTUFT
Syg2NCkpOwo+ID4gKwo+ID4gICAgICAgY2hhbiA9IGRtYV9yZXF1ZXN0X2NoYW4oZGV2LCAicnh0
eCIpOwo+ID4gICAgICAgaWYgKElTX0VSUihjaGFuKSkKPiA+ICAgICAgICAgICAgICAgcmV0dXJu
IGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGNoYW4pLCAiZmFpbGVkIHRvIHJlcXVlc3QgRE1B
IGNoYW5uZWxcbiIpOwo+ID4gQEAgLTc3MCw3ICs3OTUsMTQgQEAgc3RhdGljIGludCBsb29uZ3Nv
bl9uYW5kX2NvbnRyb2xsZXJfaW5pdChzdHJ1Y3QgbG9vbmdzb25fbmFuZF9ob3N0ICpob3N0KQo+
ID4KPiA+ICAgICAgIGluaXRfY29tcGxldGlvbigmaG9zdC0+ZG1hX2NvbXBsZXRlKTsKPiA+Cj4g
PiAtICAgICByZXR1cm4gMDsKPiA+ICsgICAgIHZhbCA9IEZJRUxEX1BSRVAoTE9PTkdTT05fTkFO
RF9NQVBfQ1MxX1NFTCwgTE9PTkdTT05fTkFORF9DU19TRUwxKQo+ID4gKyAgICAgICAgIHwgRklF
TERfUFJFUChMT09OR1NPTl9OQU5EX01BUF9SRFkxX1NFTCwgTE9PTkdTT05fTkFORF9DU19SRFkx
KQo+ID4gKyAgICAgICAgIHwgRklFTERfUFJFUChMT09OR1NPTl9OQU5EX01BUF9DUzJfU0VMLCBM
T09OR1NPTl9OQU5EX0NTX1NFTDIpCj4gPiArICAgICAgICAgfCBGSUVMRF9QUkVQKExPT05HU09O
X05BTkRfTUFQX1JEWTJfU0VMLCBMT09OR1NPTl9OQU5EX0NTX1JEWTIpCj4gPiArICAgICAgICAg
fCBGSUVMRF9QUkVQKExPT05HU09OX05BTkRfTUFQX0NTM19TRUwsIExPT05HU09OX05BTkRfQ1Nf
U0VMMykKPiA+ICsgICAgICAgICB8IEZJRUxEX1BSRVAoTE9PTkdTT05fTkFORF9NQVBfUkRZM19T
RUwsIExPT05HU09OX05BTkRfQ1NfUkRZMyk7Cj4KPiBKdXN0IGEgbml0IGFib3V0IHRoZSBzdHls
ZSwgJ3wnIHNob3VsZCBiZSBsYXN0IGNoYXJhY3RlciBvbiB0aGUgcHJldmlvdXMKPiBsaW5lLgoK
T0suIEkgd2lsbCBkbyBpdC4KPgo+IE90aGVyd2lzZSB0aGUgcmVzdCBsZ3RtLgo+Cj4gVGhhbmtz
LAo+IE1pcXXDqGwKCi0tIApUaGFua3MuCkJpbmJpbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
