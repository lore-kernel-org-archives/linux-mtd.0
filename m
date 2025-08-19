Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D50CA0EED
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Aug 2025 09:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kea2w2jckMwblbw+HQy3VlO7VX4px0nfUv5xRhbR4xI=; b=qQZMcDt/wN/Y29
	n3eBdelfSuFTRWpL0rVPBycxa9177xGsU+ONhxyZYcUp4qVZYPl9S993lVL5lyhW/FdJDhqUduQVg
	hWbl3uzj61eCaFMftzuDtc/WIW4hInRSS9zjkLmHgO89Lo13trg/Uit2u7aG89LgYiIIQnm87BGx+
	sQZUYBYVg9UJJt+wVTCAV/WuhQdzohxS/DPzJGW2mM0G0ENPHA/IITsqSJ7yudX4k0yPo6slHxL31
	D1HDF7SAuTDDgl8d8AnRJqbBn8QOi6vPf2Vfqjrbq0OBZ1lCQ6qYRDDj0vGA/79v8eH4ZC16O9b8q
	m2b//xh9jR5Y8OL67Glw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJ4I-0000000A2uG-0zPX;
	Tue, 19 Aug 2025 09:55:50 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIOp-00000009uQV-2vCV
	for linux-mtd@lists.infradead.org;
	Tue, 19 Aug 2025 09:13:00 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-333f8d1cbcdso41606551fa.0
        for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2025 02:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755594777; x=1756199577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74yGB6r3oeNjA2oTCbBBDNzTu4wMGUZh+SF3lzw9h8M=;
        b=LS4YK0ucCuC34tFzXW+pr5Nrj18nz+h0Z0e+S6ubrC+IYOX+zjD6rGs1IPBg1Nq6FA
         m3BJvlMFntoKMTXxnWE47sC4KlUSkSe+0mG9UULa8lc6XGnFvm/gG+iDQ+qltRARo26J
         XJ98OggOTRrmCmsEo3f2EdibEUdMmPyqWQtJoUedZ84Pnj+c9JDRjH5LLWgBMzGesC6l
         /SbuBBPEFsTADs9oYh+8YFrnYclCKpx/6iaHvbM6TpRy/Dym/iYQKcCmufBiIXmDNWct
         VmQum5Oheo27hGqEWEmS2SH318yFiNIInSixYWY/mdNB0O7/RYwFhho3NQAQFmJGB8Pm
         2jXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755594777; x=1756199577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74yGB6r3oeNjA2oTCbBBDNzTu4wMGUZh+SF3lzw9h8M=;
        b=MF2kETEIY0XN1fml7Lg5Pst1ChFIgYoEV0EmBftnuOep4v8fEcZhNRbHX0jyKoRpRz
         hDS9FBofHxuXnHmgz+G7svg5N9bYsGZxTFWUWsCMuXpJziElhrYnzsIBUj1y2FcZEYlT
         nUbXKrKgi9HCpMCVW53Ub+JvhpF2XHpd4bavhwgja7472h9OSwRsM8yWmgEjkFQBCPZZ
         1ttpb97kV8SWZI+i68rW2C3AYvJszG6MbyGyj/HZhL+Mb+e9BBaaxU/KoX7ImLjvzV3u
         YQRIRNNRmlxnM78zLRYhchhp+2NYna4Lco2hi3qCkF4Bo2feqFj5MSDknB6RBaUlKKun
         HXBw==
X-Forwarded-Encrypted: i=1; AJvYcCV++Bon4OQ9I4q/PwTjwGgfvXK9BI2FtzxrrU7ueuJEHGc4XvXHpZZdTTqUlQyZrnkgZfvoalumpmM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbqezjGUOM+vl7RP1Whe/phIBYnTs/GsYkoErLXBKAGcpspRMr
	tyjNOMGmVq8tm7C4GTdZJnK8/d+nbTH7tlFC9hf/qhn9YkqjMQAU5k/waXtUtHUF84hT+m4aq4H
	bw8BtgmH2fmT4FkoR86i1J4F752jJ4AI=
X-Gm-Gg: ASbGncu9XjMBfsrlz8nHJPpWbyJAIAFMNbOcNoFEnF6IoOa1zkbtX7oTHFcDny/3sbc
	iC7FZ7tcZLl2hA1ALkOWxsVLzTMvEhamZeMP9Yvbhvq6J+CvcrDPHwxz9W5LN64Bu6yv1DKx3bJ
	nJJJyOf77dRVwPtM4zxer52PsnTIeR2B+HCpoiXTUJzEH3DSzZ30vsc/mUVPyGXljCOBt8hu5DD
	bCjke5+Ah/NV33WTzYSowldMqvTfQ==
X-Google-Smtp-Source: AGHT+IHnCuZwkUNL1S6jdDpuNsRm5DlUTzPVT+cua3tzwYB1PmVSOA+kfkXsI/P6mD4sLALRxJQB+xCbYxyTxrtWi78=
X-Received: by 2002:a2e:b8d6:0:b0:333:b6b0:e665 with SMTP id
 38308e7fff4ca-335307086d0mr5235541fa.30.1755594776962; Tue, 19 Aug 2025
 02:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <6b6ddac4728d3debcf2dbb7db82c6b69f9b4956f.1754890670.git.zhoubinbin@loongson.cn>
 <CAAhV-H49xGqd-Y+ffwwwVaES5ZGoCWp2dN_tSETFtBjsjgbC9A@mail.gmail.com>
In-Reply-To: <CAAhV-H49xGqd-Y+ffwwwVaES5ZGoCWp2dN_tSETFtBjsjgbC9A@mail.gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 19 Aug 2025 17:12:19 +0800
X-Gm-Features: Ac12FXy9EWtTLFIu2NHkn6-CTHcJ75AsCdxMDVkloBJBm5iSg6mvcqHHleFWEfw
Message-ID: <CAJhJPsWOgaKwfGPD9+BF9OtBpDwvOvr6-jX56Rh0PNRpWew3jw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] mtd: rawnand: loongson: Add 6-byte NAND ID reading support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_021259_736961_BD7E1399 
X-CRM114-Status: GOOD (  25.47  )
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

T24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgMjozN+KAr1BNIEh1YWNhaSBDaGVuIDxjaGVuaHVhY2Fp
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGksIEJpbmJpbiwKPgo+IE9uIE1vbiwgQXVnIDExLCAy
MDI1IGF0IDI6MDLigK9QTSBCaW5iaW4gWmhvdSA8emhvdWJpbmJpbkBsb29uZ3Nvbi5jbj4gd3Jv
dGU6Cj4gPgo+ID4gRnJvbTogS2VndWFuZyBaaGFuZyA8a2VndWFuZy56aGFuZ0BnbWFpbC5jb20+
Cj4gPgo+ID4gTG9vbmdzb24tMUMgYW5kIExvb25nc29uLTJLIFNvQ3Mgc3VwcG9ydCBOQU5EIGZs
YXNoIGNoaXBzIHdpdGggNi1ieXRlIElELgo+ID4gSG93ZXZlciwgdGhlIGN1cnJlbnQgaW1wbGVt
ZW50YXRpb24gb25seSBoYW5kbGVzIDUtYnl0ZSBJRCB3aGljaCBjYW4gbGVhZAo+ID4gdG8gaW5j
b3JyZWN0IGNoaXAgZGV0ZWN0aW9uLgo+ID4KPiA+IEV4dGVuZCBsb29uZ3Nvbl9uYW5kX3JlYWRf
aWRfdHlwZV9leGVjKCkgdG8gc3VwcG9ydCA2LWJ5dGUgTkFORCBJRC4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBLZWd1YW5nIFpoYW5nIDxrZWd1YW5nLnpoYW5nQGdtYWlsLmNvbT4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEJpbmJpbiBaaG91IDx6aG91YmluYmluQGxvb25nc29uLmNuPgo+ID4gLS0tCj4g
PiAgLi4uL210ZC9uYW5kL3Jhdy9sb29uZ3Nvbi1uYW5kLWNvbnRyb2xsZXIuYyAgIHwgMjkgKysr
KysrKysrKysrKysrLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9s
b29uZ3Nvbi1uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2xvb25nc29u
LW5hbmQtY29udHJvbGxlci5jCj4gPiBpbmRleCBiNWE3YmUwZmNhY2MuLjk3Y2Q1NjY0MjBhOCAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2xvb25nc29uLW5hbmQtY29udHJv
bGxlci5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9sb29uZ3Nvbi1uYW5kLWNvbnRy
b2xsZXIuYwo+ID4gQEAgLTUwLDYgKzUwLDkgQEAKPiA+ICAjZGVmaW5lIExPT05HU09OX05BTkRf
Q09MX0FERFJfQ1lDICAgICAyVQo+ID4gICNkZWZpbmUgTE9PTkdTT05fTkFORF9NQVhfQUREUl9D
WUMgICAgIDVVCj4gPgo+ID4gKyNkZWZpbmUgTE9PTkdTT05fTkFORF9SRUFEX0lEX1NMRUVQX1VT
ICAgICAgICAgMTAwMAo+ID4gKyNkZWZpbmUgTE9PTkdTT05fTkFORF9SRUFEX0lEX1RJTUVPVVRf
VVMgICAgICAgNTAwMAo+ID4gKwo+ID4gICNkZWZpbmUgQklUU19QRVJfV09SRCAgICAgICAgICAg
ICAgICAgICg0ICogQklUU19QRVJfQllURSkKPiA+Cj4gPiAgc3RydWN0IGxvb25nc29uX25hbmRf
aG9zdDsKPiA+IEBAIC03Myw2ICs3Niw4IEBAIHN0cnVjdCBsb29uZ3Nvbl9uYW5kX29wIHsKPiA+
ICB9Owo+ID4KPiA+ICBzdHJ1Y3QgbG9vbmdzb25fbmFuZF9kYXRhIHsKPiA+ICsgICAgICAgdW5z
aWduZWQgaW50IG1heF9pZF9jeWNsZTsKPiA+ICsgICAgICAgdW5zaWduZWQgaW50IGlkX2N5Y2xl
X2ZpZWxkOwo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgc3RhdHVzX2ZpZWxkOwo+ID4gICAgICAg
ICB1bnNpZ25lZCBpbnQgb3Bfc2NvcGVfZmllbGQ7Cj4gPiAgICAgICAgIHVuc2lnbmVkIGludCBo
b2xkX2N5Y2xlOwo+ID4gQEAgLTQ1OCwxMCArNDYzLDEwIEBAIHN0YXRpYyBpbnQgbG9vbmdzb25f
bmFuZF9yZWFkX2lkX3R5cGVfZXhlYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCBzdHJ1
Y3QKPiA+ICAgICAgICAgc3RydWN0IGxvb25nc29uX25hbmRfb3Agb3AgPSB7fTsKPiA+ICAgICAg
ICAgaW50IGksIHJldDsKPiA+ICAgICAgICAgdW5pb24gewo+ID4gLSAgICAgICAgICAgICAgIGNo
YXIgaWRzWzVdOwo+ID4gKyAgICAgICAgICAgICAgIGNoYXIgaWRzWzZdOwo+ID4gICAgICAgICAg
ICAgICAgIHN0cnVjdCB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgaWRsOwo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgY2hhciBpZGg7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICB1MTYgaWRoOwo+ID4gICAgICAgICAgICAgICAgIH07Cj4gPiAgICAgICAgIH0gbmFuZF9p
ZDsKPiA+Cj4gPiBAQCAtNDY5LDExICs0NzQsMTYgQEAgc3RhdGljIGludCBsb29uZ3Nvbl9uYW5k
X3JlYWRfaWRfdHlwZV9leGVjKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHN0cnVjdAo+
ID4gICAgICAgICBpZiAocmV0KQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPgo+
ID4gLSAgICAgICBuYW5kX2lkLmlkbCA9IHJlYWRsKGhvc3QtPnJlZ19iYXNlICsgTE9PTkdTT05f
TkFORF9JREwpOwo+ID4gLSAgICAgICBuYW5kX2lkLmlkaCA9IHJlYWRiKGhvc3QtPnJlZ19iYXNl
ICsgTE9PTkdTT05fTkFORF9JREhfU1RBVFVTKTsKPiA+ICsgICAgICAgcmV0ID0gcmVnbWFwX3Jl
YWRfcG9sbF90aW1lb3V0KGhvc3QtPnJlZ21hcCwgTE9PTkdTT05fTkFORF9JREwsIG5hbmRfaWQu
aWRsLCBuYW5kX2lkLmlkbCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIExPT05HU09OX05BTkRfUkVBRF9JRF9TTEVFUF9VUywKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIExPT05HU09OX05BTkRfUkVBRF9JRF9USU1FT1VUX1VTKTsK
PiBUaGUgbGFzdCB0d28gbGluZXMgY2FuIGJlIG1lcmdlZC4KPgpObywgbWVyZ2luZyB0aGVtIHdv
dWxkIGV4Y2VlZCAxMDAgY29sdW1ucy4KCj4gSHVhY2FpCj4KPiA+ICsgICAgICAgaWYgKHJldCkK
PiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4KPiA+IC0gICAgICAgZm9yIChpID0g
MDsgaSA8IG1pbihzaXplb2YobmFuZF9pZC5pZHMpLCBvcC5vcmlnX2xlbik7IGkrKykKPiA+IC0g
ICAgICAgICAgICAgICBvcC5idWZbaV0gPSBuYW5kX2lkLmlkc1tzaXplb2YobmFuZF9pZC5pZHMp
IC0gMSAtIGldOwo+ID4gKyAgICAgICBuYW5kX2lkLmlkaCA9IHJlYWR3KGhvc3QtPnJlZ19iYXNl
ICsgTE9PTkdTT05fTkFORF9JREhfU1RBVFVTKTsKPiA+ICsKPiA+ICsgICAgICAgZm9yIChpID0g
MDsgaSA8IG1pbihob3N0LT5kYXRhLT5tYXhfaWRfY3ljbGUsIG9wLm9yaWdfbGVuKTsgaSsrKQo+
ID4gKyAgICAgICAgICAgICAgIG9wLmJ1ZltpXSA9IG5hbmRfaWQuaWRzW2hvc3QtPmRhdGEtPm1h
eF9pZF9jeWNsZSAtIDEgLSBpXTsKPiA+Cj4gPiAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAgfQo+
ID4gQEAgLTY3Niw2ICs2ODYsMTAgQEAgc3RhdGljIGludCBsb29uZ3Nvbl9uYW5kX2NvbnRyb2xs
ZXJfaW5pdChzdHJ1Y3QgbG9vbmdzb25fbmFuZF9ob3N0ICpob3N0KQo+ID4gICAgICAgICBpZiAo
SVNfRVJSKGhvc3QtPnJlZ21hcCkpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJf
cHJvYmUoZGV2LCBQVFJfRVJSKGhvc3QtPnJlZ21hcCksICJmYWlsZWQgdG8gaW5pdCByZWdtYXBc
biIpOwo+ID4KPiA+ICsgICAgICAgaWYgKGhvc3QtPmRhdGEtPmlkX2N5Y2xlX2ZpZWxkKQo+ID4g
KyAgICAgICAgICAgICAgIHJlZ21hcF91cGRhdGVfYml0cyhob3N0LT5yZWdtYXAsIExPT05HU09O
X05BTkRfUEFSQU0sIGhvc3QtPmRhdGEtPmlkX2N5Y2xlX2ZpZWxkLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBob3N0LT5kYXRhLT5tYXhfaWRfY3ljbGUgPDwgX19mZnMo
aG9zdC0+ZGF0YS0+aWRfY3ljbGVfZmllbGQpKTsKPiA+ICsKPiA+ICAgICAgICAgY2hhbiA9IGRt
YV9yZXF1ZXN0X2NoYW4oZGV2LCAicnh0eCIpOwo+ID4gICAgICAgICBpZiAoSVNfRVJSKGNoYW4p
KQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihj
aGFuKSwgImZhaWxlZCB0byByZXF1ZXN0IERNQSBjaGFubmVsXG4iKTsKPiA+IEBAIC04MDAsNiAr
ODE0LDcgQEAgc3RhdGljIHZvaWQgbG9vbmdzb25fbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbG9vbmdz
b25fbmFuZF9kYXRhIGxzMWJfbmFuZF9kYXRhID0gewo+ID4gKyAgICAgICAubWF4X2lkX2N5Y2xl
ID0gNSwKPiA+ICAgICAgICAgLnN0YXR1c19maWVsZCA9IEdFTk1BU0soMTUsIDgpLAo+ID4gICAg
ICAgICAuaG9sZF9jeWNsZSA9IDB4MiwKPiA+ICAgICAgICAgLndhaXRfY3ljbGUgPSAweGMsCj4g
PiBAQCAtODA3LDYgKzgyMiw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbG9vbmdzb25fbmFuZF9k
YXRhIGxzMWJfbmFuZF9kYXRhID0gewo+ID4gIH07Cj4gPgo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgbG9vbmdzb25fbmFuZF9kYXRhIGxzMWNfbmFuZF9kYXRhID0gewo+ID4gKyAgICAgICAubWF4
X2lkX2N5Y2xlID0gNiwKPiA+ICsgICAgICAgLmlkX2N5Y2xlX2ZpZWxkID0gR0VOTUFTSygxNCwg
MTIpLAo+ID4gICAgICAgICAuc3RhdHVzX2ZpZWxkID0gR0VOTUFTSygyMywgMTYpLAo+ID4gICAg
ICAgICAub3Bfc2NvcGVfZmllbGQgPSBHRU5NQVNLKDI5LCAxNiksCj4gPiAgICAgICAgIC5ob2xk
X2N5Y2xlID0gMHgyLAo+ID4gLS0KPiA+IDIuNDcuMwo+ID4KCgoKLS0gCkJlc3QgcmVnYXJkcywK
CktlZ3VhbmcgWmhhbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
