Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DE6C25B74
	for <linux-mtd@archiver.kernel.org>; Sat, 18 May 2024 08:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7/foyoTOchVeMFHJb5LTceu46nzo9oQkSWiI5tofCA=; b=nA2WhhstbpYnhd
	yQYk6atS+g/vKz2XQ3sEpzTelMfUp64U/Z8PNgFtMQwJlhQNcUuRZ3COXlJ93zEKUoaSzTPmYaaCZ
	tMVMCOmlQcwe36UGLE6tTVcY4DUPpf+5ecpWfoK6NZqM0roNofRYPBRwIomfNh+ajdJpFD/d+s6HE
	NNj8CD9rCameBUbZ7AJ4E5Bber5bE2HLhWTyMDYV3fyR+Fm/dRQOq2owbL4LClOCUqFB5a0Fl737Z
	qNL4vC3C9F85mB4oCUdrwy0y0foqHxMpBmJa3BTatAIlUygsYI4gsd6QVG6c/T8lffgYFXfmPWx6U
	vnF0MiHINtJy5MvmhoSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8F0h-00000009jrP-427r;
	Sat, 18 May 2024 08:01:43 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8F0f-00000009jqr-03RU
	for linux-mtd@lists.infradead.org;
	Sat, 18 May 2024 08:01:42 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-572af0b12b8so5529298a12.2
        for <linux-mtd@lists.infradead.org>; Sat, 18 May 2024 01:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716019298; x=1716624098; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5PBYmiAOhnAHeUKcKjWhYrDASdZVdAh3fVeiRlLusQ=;
        b=dSJcVdNJFhAcbzBZ6zn9YmKUI8gBrpI7802dHRVIZApDT+HR2fWbenVWq1nAonD19c
         6kOmwS9/CrdT64fCnWRAwept/4XRT1fLIstZA4y7YcVfS4LwaoEPkTusUPb8BGBsHhSj
         X+ccOrxLhtlrwcNMzVvAFtL0DsnNZtNroZwz1LsIXD/aV5SxrKJxLqngq9PafRB5ZAs5
         B6YaABs7/Pv+7EJflUrLVGr5ASAaob1EPWU6JUNuL9k7Mjqrt8JH5dXXPxW8rUxjvt3s
         ge4cQyd1ztzbQPn95k9pryRhzlsZQAcLCaVHD3IL4TXuy1s07Fn7reXfOwblAaTxMYNk
         hAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716019298; x=1716624098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5PBYmiAOhnAHeUKcKjWhYrDASdZVdAh3fVeiRlLusQ=;
        b=JPN/W3l/Kuj0xF/WwcYSItwzdsaSImLB9B1FIfr4cj3nQOifMMZ4vbHUP2PhB3BX4+
         80uu4y8dwb3X9MZwjgewfopH6R0A7T9s+3oiiXyHhCTxYduIUn9K1HiYec1rL83mq0dL
         FGKbOs0/F6nRD/POkHqYzmMh8+LVteVDW/NnTa1s8l6aRLpfk29h18lITxUYnAlt6F/z
         QOSfC3Xh3A2OQpAhZAJBqTpwz0XmsTwImGWkEWc2bMuyJ8zD+bQ/lOJugnKg9WDEfxCW
         vMWAewRCbc4FlhWhDsG6abwNVsm2jK2Nr/SqHBhZugUPT6VVtxBvGFsY5tw5VQRYtpl6
         KK2g==
X-Forwarded-Encrypted: i=1; AJvYcCX0p5NXsWt7lZt61nZBmPYCBnAL/DvogL8aKDiVOUXPyDS/ABMzfIAHobqu8PDYa7fc4fLMA5mhpyjsHYtZS0cOozRMqJGCACukakMeNw==
X-Gm-Message-State: AOJu0YyP2RiXrpHNIV2y/9UpPwIPOYOe4aull2DRyqSR9RTbs7tIiEO4
	u2mpbUPNMiudcpXGegEYnRxgp3BpFulmyg1K1mdju3M7ryMGn2zaa5KXzdWQJZJ6vNNSKHBf4OK
	8x+P/otMgCXKRWYSIpTfqdithUNw=
X-Google-Smtp-Source: AGHT+IFRurVLH0wLwb3bHvY0pj+mDe+IQvHfHOR+KR2jbk6X+fEXiwm/QrNqX6PbS5ITDgN3Dj/Bj35XZRBxiB42JAg=
X-Received: by 2002:a50:8adb:0:b0:574:ec96:69d8 with SMTP id
 4fb4d7f45d1cf-574ec9671femr8429714a12.33.1716019298230; Sat, 18 May 2024
 01:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
 <20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com> <20240506091444.59228fa9@xps-13>
In-Reply-To: <20240506091444.59228fa9@xps-13>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Sat, 18 May 2024 16:01:01 +0800
Message-ID: <CAJhJPsV1aCvji1G2F94A=pJa8+x6Aw7ndkQUBPtFeeKSxJK9Nw@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_010141_119094_42244C56 
X-CRM114-Status: GOOD (  27.93  )
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

T24gTW9uLCBNYXkgNiwgMjAyNCBhdCAzOjE04oCvUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IGRldm51bGwra2VndWFuZy56
aGFuZy5nbWFpbC5jb21Aa2VybmVsLm9yZyB3cm90ZSBvbiBUdWUsIDMwIEFwciAyMDI0Cj4gMTk6
MTE6MTAgKzA4MDA6Cj4KPiA+IEZyb206IEtlZ3VhbmcgWmhhbmcgPGtlZ3VhbmcuemhhbmdAZ21h
aWwuY29tPgo+ID4KPiA+IEFkZCBkZXZpY2V0cmVlIGJpbmRpbmcgZG9jdW1lbnQgZm9yIExvb25n
c29uLTEgTkFORCBDb250cm9sbGVyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEtlZ3VhbmcgWmhh
bmcgPGtlZ3VhbmcuemhhbmdAZ21haWwuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHY3Ogo+
ID4gLSByZW5hbWUgdGhlIGZpbGUgdG8gbG9vbmdzb24sbHMxYi1uZmMueWFtbAo+ID4KPiA+IENo
YW5nZXMgaW4gdjY6Cj4gPiAtIEEgbmV3bHkgYWRkZWQgcGF0Y2gKPiA+IC0tLQo+ID4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9sb29uZ3NvbixsczFiLW5mYy55YW1sIHwgNjYgKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
bG9vbmdzb24sbHMxYi1uZmMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvbG9vbmdzb24sbHMxYi1uZmMueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uYTY5ZjIyYjlmZDllCj4gPiAtLS0gL2Rldi9udWxsCj4gPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2xvb25nc29uLGxzMWIt
bmZjLnlhbWwKPiA+IEBAIC0wLDAgKzEsNjYgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+ICst
LS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9sb29uZ3Nvbixs
czFiLW5mYy55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBMb29uZ3Nvbi0xIE5BTkQgQ29udHJv
bGxlcgo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSBLZWd1YW5nIFpoYW5nIDxrZWd1
YW5nLnpoYW5nQGdtYWlsLmNvbT4KPiA+ICsKPiA+ICthbGxPZjoKPiA+ICsgIC0gJHJlZjogbmFu
ZC1jb250cm9sbGVyLnlhbWwKPiA+ICsKPiA+ICtwcm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJs
ZToKPiA+ICsgICAgb25lT2Y6Cj4gPiArICAgICAgLSBjb25zdDogbG9vbmdzb24sbHMxYi1uZmMK
Pgo+IFdoYXQgaXMgdGhlIHJhdGlvbmFsZSBiZWhpbmQgdGhpcyBjaG9pY2U/IFNlZW1zIGxpa2Ug
dGhlIGIgdmFyaWFudCBoYXMKPiB0d28gcG9zc2libGUgaW1wbGVtZW50YXRpb25zIGFuZCBzaG91
bGQgYWx3YXlzIGJlIHByZWNlZGVkIGJ5IGEgbW9yZQo+IHNwZWNpZmljIGNvbXBhdGlibGUuCj4K
PiBBcyB0aGVyZSBpcyBjdXJyZW50bHkgbm8gZGVzY3JpcHRpb24gb2YgdGhpcyBjb250cm9sbGVy
IHVwc3RyZWFtLCBJCj4gd291bGQgbm90IGNhcmUgdG9vIG11Y2ggYWJvdXQgYW55IG91dC1vZi10
cmVlIGRlc2NyaXB0aW9uIGFuZCBkaXJlY3RseQo+IGdvIGZvciBhIGNsZWFuIGRlc2NyaXB0aW9u
Lgo+CkV4Y3VzZSBtZSwgc2hvdWxkIEkgYWRkIGEgZGVzY3JpcHRpb24gZm9yIHRoaXMgcHJvcGVy
dHk/Cgo+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiArICAgICAgICAgIC0gZW51bToKPiA+ICsgICAg
ICAgICAgICAgIC0gbG9vbmdzb24sbHMxYS1uZmMKPiA+ICsgICAgICAgICAgICAgIC0gbG9vbmdz
b24sbHMxYy1uZmMKPiA+ICsgICAgICAgICAgLSBjb25zdDogbG9vbmdzb24sbHMxYi1uZmMKPiA+
ICsKPiA+ICsgIHJlZzoKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICsgIGRtYXM6Cj4g
PiArICAgIG1heEl0ZW1zOiAxCj4gPiArCj4gPiArICBkbWEtbmFtZXM6Cj4gPiArICAgIGNvbnN0
OiByeHR4Cj4gPiArCj4gPiArcGF0dGVyblByb3BlcnRpZXM6Cj4gPiArICAiXm5hbmRAWzAtM10k
IjoKPiA+ICsgICAgdHlwZTogb2JqZWN0Cj4gPiArICAgICRyZWY6IHJhdy1uYW5kLWNoaXAueWFt
bAo+ID4gKwo+ID4gKyAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gPiArCj4gPiAr
cmVxdWlyZWQ6Cj4gPiArICAtIGNvbXBhdGlibGUKPiA+ICsgIC0gcmVnCj4gPiArICAtIGRtYXMK
PiA+ICsgIC0gZG1hLW5hbWVzCj4KPiBTaG91bGQgRE1BIHByb3BzIGJlIHJlcXVpcmVkPwo+Clll
cy4gVGhpcyBOQU5EIGNvbnRyb2xsZXIgb25seSB3b3JrcyB3aXRoIERNQSwgd2hpY2ggbWVhbnMg
dGhlIERNQSBpcyBuZWNlc3NhcnkuCgo+ID4gKwo+ID4gK3VuZXZhbHVhdGVkUHJvcGVydGllczog
ZmFsc2UKPiA+ICsKPiA+ICtleGFtcGxlczoKPiA+ICsgIC0gfAo+ID4gKyAgICBuYW5kLWNvbnRy
b2xsZXJAMWZlNzgwMDAgewo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJsb29uZ3NvbixsczFi
LW5mYyI7Cj4gPiArICAgICAgICByZWcgPSA8MHgxZmU3ODAwMCAweDQwPjsKPiA+ICsKPiA+ICsg
ICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8
MD47Cj4gPiArCj4gPiArICAgICAgICBkbWFzID0gPCZkbWEgMD47Cj4gPiArICAgICAgICBkbWEt
bmFtZXMgPSAicnh0eCI7Cj4KPiBUaGVyZSBpcyBhIHByZWZlcnJlZCBzcGFjaW5nIGZvciBEVCBu
b2Rlcywgc2VlOgo+IGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2RldmljZXRyZWUvYmluZGluZ3Mv
ZHRzLWNvZGluZy1zdHlsZS5odG1sCj4KU29ycnkuIEkgZG9uJ3QgZ2V0IHRoZSBtZWFuaW5nIG9m
IHByZWZlcnJlZCBzcGFjaW5nLgpodHRwczovL2RvY3Mua2VybmVsLm9yZy9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3dyaXRpbmctc2NoZW1hLmh0bWwgc2F5cwoiRm9yIERUUyBleGFtcGxlcyBpbiB0aGUg
c2NoZW1hLCBwcmVmZXJyZWQgaXMgZm91ci1zcGFjZSBpbmRlbnRhdGlvbi4iClRoZW4gSSB1c2Vk
IGZvdXItc3BhY2UgaW5kZW50YXRpb24uCgo+ID4gKwo+ID4gKyAgICAgICAgbmFuZEAwIHsKPiA+
ICsgICAgICAgICAgICByZWcgPSA8MD47Cj4gPiArICAgICAgICAgICAgbmFuZC11c2Utc29mdC1l
Y2MtZW5naW5lOwo+ID4gKyAgICAgICAgICAgIG5hbmQtZWNjLWFsZ28gPSAiaGFtbWluZyI7Cj4K
PiBUaGVzZSB0d28gcHJvcGVydGllcyBhcmUgbm90IG5lZWRlZC4gVW5sZXNzIHRoZXJlIGlzIG5v
IGhhcmR3YXJlIEVDQwo+IGNhcGFiaWxpdHkgb24gdGhpcyBjb250cm9sbGVyIGFuZCBpbiB0aGlz
IGNhc2UgeW91IG5lZWQgdG8gZW5zdXJlIHRoZQo+IHByb3BlcnRpZXMgYXJlIHByZXNlbnQgaW4g
dGhlIHNjaGVtYS4KCkV4YWN0bHkuIFRoaXMgTkFORCBjb250cm9sbGVyIGRvZXNuJ3Qgc3VwcG9y
dCBoYXJkd2FyZSBFQ0MuCiduYW5kLXVzZS1zb2Z0LWVjYy1lbmdpbmUnIGFuZCAnbmFuZC1lY2Mt
YWxnbycgYXJlIHByZXNlbnQgaW4gbmFuZC1jaGlwLnlhbWwuCklzIHRoZXJlIGFueXRoaW5nIGVs
c2UgSSBzaG91bGQgZG8/CgpUaGFua3MgZm9yIHlvdXIgdmlldyEKPgo+ID4gKyAgICAgICAgfTsK
PiA+ICsgICAgfTsKPiA+Cj4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgoKCi0tIApCZXN0IHJlZ2Fy
ZHMsCgpLZWd1YW5nIFpoYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
