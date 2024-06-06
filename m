Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E790FC25B75
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 10:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v95prye4GjTLMIpc3S4RcPElbC2QSiVqGfrcD8E/kZQ=; b=PRcTGmfqR3SknR
	1Qz3AMhIZmbqMZ9Sg9DVeexlmxBeFMDEuwZS4cMFlmjSvF845AKo2wuBRfPrUnCu8JVX7fMzev/gq
	/QqHIZrilWUMl0Jaf7pcpETo5ajg8nXzeQjQZBxoGRxfIBCviF/AOrZ05ZkQtCFelfgYyRjyw7m+O
	dtEGUDqWSm7iwcKiaiMor0WqqglEalJVA9LINQvxGVstcb/R92ZOoHDTp8MI2aIVj/rZKa92ZY7sP
	lUBNLYILJ5oUh9dxx+WPonhbkRun1aD36NTqvt/YsP78C8exuH2BvqtIZfCm9wXNY2vT8+rlHv4tj
	Q7sHqKk6b1S1eBlBm5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFAki-00000009SQ1-2Fhj;
	Thu, 06 Jun 2024 10:53:52 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFAkf-00000009SOj-1TlQ
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 10:53:50 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-57a9a3bc085so1041501a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 03:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717671225; x=1718276025; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=935StyJmCjoE4Ghn59CDu5In+96Jm1afri4FQ4OW13w=;
        b=e7gPTPTNvjDELqDjwrvW7DnNfb/L1cWu6sWKEnIg7JFnEQhU6SkPIVj0Z8MwxW9lTc
         vOsuIhxy2hC/KDjghKt+exm89U4oCyFrLLh+AQhyOM0tW7WTQaAT2FdY8yFWcI+9G0t0
         QojfYK9wsRxzOiKLSeFyGSMXrdHZWJPrfc0ZAkBMz6+ash6C75gRN/4DL2+aWBtCvWmH
         u/4Vi7BOI1rvJC6aAadFsEy+7UiZe2ttwPQciM8UtWY0D5lE74HeVhhqhngvMVxNwZMj
         h9Un4yoZT3X8ZiEIZkhBR3L6SAzQVjUCeT4aAUwjK99Xs4hWS2HrbroJFaNg8m9X6Z8y
         rP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717671225; x=1718276025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=935StyJmCjoE4Ghn59CDu5In+96Jm1afri4FQ4OW13w=;
        b=g2K1/XIVDy88A8WrridAzeHBsHeYuqezdQRU/ntJ3KwUZYPCbltN0NGxeTXokuD+bV
         ZICAFHQ36DgqJVvAIVIqPVXt2dPWYq9J0j5P0pT6t9rHud4LDhUZ5KjM7NZg8LaEa7Tc
         KMCDHyOrzu7bWlZG8qjIEOkhjgHK1NoeVCm3SlliqB5P5TLVr03FrL8g07HSJ77/+PxR
         jrLxXqzGr+vFn0qdjLpuceM7VzVIaBQgOWYWNxDJOspT/TMAu+REevUB5udofYmbhbii
         t9eOkOXXFZXPGVqAz0kgbcja3oHUQkeCGnXstr3FA+ccBmc1qftzgAigIzlNl9qIxILL
         NuXA==
X-Forwarded-Encrypted: i=1; AJvYcCU14+UKdZdhKDaUPUlTrGkIKDtyjN3O71WOO9rOm49OarnHXPDILstPtTIvKM+9mh/TfzVIRPyY9d19Pz69r0I/XyjEohRPr1yhgpn/9A==
X-Gm-Message-State: AOJu0YzmBpqDqTphSsqvpHBlWzgaHKyV+MQFSTrlZSPVKuUVzg34BaZu
	5nCwEKRV9PUj/iPgAxxR2Hk552ArASKYUM4Vo/GlC8W4AqOE9Z4xOoIwmFkLuxnCqNRfprodNQv
	fIiDoIscsI+EkR3N6+ahN6z1m2zKlyEAyhGM=
X-Google-Smtp-Source: AGHT+IE0J+VGwd0Ea7QUc/PFc4yHChLtDGJkWcYqgbuGIHKRsfdwqpE5pP07w0oAGDb9xZmHKtpmnWMeMuH42TH1CSc=
X-Received: by 2002:a50:8d54:0:b0:579:c3f8:5923 with SMTP id
 4fb4d7f45d1cf-57a8b6a8778mr4076479a12.13.1717671224760; Thu, 06 Jun 2024
 03:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
 <20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com> <20240506091444.59228fa9@xps-13>
 <CAJhJPsV1aCvji1G2F94A=pJa8+x6Aw7ndkQUBPtFeeKSxJK9Nw@mail.gmail.com> <20240518124732.584f441d@xps-13>
In-Reply-To: <20240518124732.584f441d@xps-13>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 6 Jun 2024 18:53:08 +0800
Message-ID: <CAJhJPsW9gVe2F1qvxvOkQUX_K1BsK5q_1XjT0u2+QH2gRMNqXA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_035349_417052_CA87B35B 
X-CRM114-Status: GOOD (  36.41  )
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

SGkgTWlxdWVsLApTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuCgpPbiBTYXQsIE1heSAxOCwgMjAy
NCBhdCA2OjQ34oCvUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g
d3JvdGU6Cj4KPiBIaSwKPgo+IGtlZ3VhbmcuemhhbmdAZ21haWwuY29tIHdyb3RlIG9uIFNhdCwg
MTggTWF5IDIwMjQgMTY6MDE6MDEgKzA4MDA6Cj4KPiA+IE9uIE1vbiwgTWF5IDYsIDIwMjQgYXQg
MzoxNOKAr1BNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBIZWxsbywKPiA+ID4KPiA+ID4gZGV2bnVsbCtrZWd1YW5nLnpoYW5nLmdt
YWlsLmNvbUBrZXJuZWwub3JnIHdyb3RlIG9uIFR1ZSwgMzAgQXByIDIwMjQKPiA+ID4gMTk6MTE6
MTAgKzA4MDA6Cj4gPiA+Cj4gPiA+ID4gRnJvbTogS2VndWFuZyBaaGFuZyA8a2VndWFuZy56aGFu
Z0BnbWFpbC5jb20+Cj4gPiA+ID4KPiA+ID4gPiBBZGQgZGV2aWNldHJlZSBiaW5kaW5nIGRvY3Vt
ZW50IGZvciBMb29uZ3Nvbi0xIE5BTkQgQ29udHJvbGxlci4KPiA+ID4gPgo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEtlZ3VhbmcgWmhhbmcgPGtlZ3VhbmcuemhhbmdAZ21haWwuY29tPgo+ID4gPiA+
IC0tLQo+ID4gPiA+IENoYW5nZXMgaW4gdjc6Cj4gPiA+ID4gLSByZW5hbWUgdGhlIGZpbGUgdG8g
bG9vbmdzb24sbHMxYi1uZmMueWFtbAo+ID4gPiA+Cj4gPiA+ID4gQ2hhbmdlcyBpbiB2NjoKPiA+
ID4gPiAtIEEgbmV3bHkgYWRkZWQgcGF0Y2gKPiA+ID4gPiAtLS0KPiA+ID4gPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL2xvb25nc29uLGxzMWItbmZjLnlhbWwgfCA2NiArKysrKysrKysr
KysrKysrKysrKysrCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspCj4g
PiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9sb29uZ3NvbixsczFiLW5mYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9sb29uZ3NvbixsczFiLW5mYy55YW1sCj4gPiA+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmE2OWYyMmI5ZmQ5ZQo+ID4gPiA+
IC0tLSAvZGV2L251bGwKPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL2xvb25nc29uLGxzMWItbmZjLnlhbWwKPiA+ID4gPiBAQCAtMCwwICsxLDY2IEBA
Cj4gPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlKQo+ID4gPiA+ICslWUFNTCAxLjIKPiA+ID4gPiArLS0tCj4gPiA+ID4gKyRpZDog
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL2xvb25nc29uLGxzMWItbmZjLnlhbWwj
Cj4gPiA+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29y
ZS55YW1sIwo+ID4gPiA+ICsKPiA+ID4gPiArdGl0bGU6IExvb25nc29uLTEgTkFORCBDb250cm9s
bGVyCj4gPiA+ID4gKwo+ID4gPiA+ICttYWludGFpbmVyczoKPiA+ID4gPiArICAtIEtlZ3Vhbmcg
WmhhbmcgPGtlZ3VhbmcuemhhbmdAZ21haWwuY29tPgo+ID4gPiA+ICsKPiA+ID4gPiArYWxsT2Y6
Cj4gPiA+ID4gKyAgLSAkcmVmOiBuYW5kLWNvbnRyb2xsZXIueWFtbAo+ID4gPiA+ICsKPiA+ID4g
PiArcHJvcGVydGllczoKPiA+ID4gPiArICBjb21wYXRpYmxlOgo+ID4gPiA+ICsgICAgb25lT2Y6
Cj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IGxvb25nc29uLGxzMWItbmZjCj4gPiA+Cj4gPiA+IFdo
YXQgaXMgdGhlIHJhdGlvbmFsZSBiZWhpbmQgdGhpcyBjaG9pY2U/IFNlZW1zIGxpa2UgdGhlIGIg
dmFyaWFudCBoYXMKPiA+ID4gdHdvIHBvc3NpYmxlIGltcGxlbWVudGF0aW9ucyBhbmQgc2hvdWxk
IGFsd2F5cyBiZSBwcmVjZWRlZCBieSBhIG1vcmUKPiA+ID4gc3BlY2lmaWMgY29tcGF0aWJsZS4K
PiA+ID4KPiA+ID4gQXMgdGhlcmUgaXMgY3VycmVudGx5IG5vIGRlc2NyaXB0aW9uIG9mIHRoaXMg
Y29udHJvbGxlciB1cHN0cmVhbSwgSQo+ID4gPiB3b3VsZCBub3QgY2FyZSB0b28gbXVjaCBhYm91
dCBhbnkgb3V0LW9mLXRyZWUgZGVzY3JpcHRpb24gYW5kIGRpcmVjdGx5Cj4gPiA+IGdvIGZvciBh
IGNsZWFuIGRlc2NyaXB0aW9uLgo+ID4gPgo+ID4gRXhjdXNlIG1lLCBzaG91bGQgSSBhZGQgYSBk
ZXNjcmlwdGlvbiBmb3IgdGhpcyBwcm9wZXJ0eT8KPgo+IE5vLCBkZXNjcmlwdGlvbiBpcyBub3Qg
bmVlZGVkLiBCdXQgeW91IGFyZSBhbGxvd2luZyB0aGUKPiAibG9vbmdzb24sbHMxYi1uZmMiIGNv
bXBhdGlibGUgYWxvbmUsIHdoaWNoIEkgdGhpbmsgaXMgbm90IHJlbGV2YW50LAo+IHVubGVzcyB5
b3UgY29udmluY2UgbWUgaXQgaXMgOi0pCj4KImxvb25nc29uLGxzMWItbmZjIiBpdHNlbGYgaXMg
YSBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbi4KSSB3YXMgc3VnZ2VzdGVkIHRvIHNldCB1cCBhIGZh
bGxiYWNrIGJlZm9yZS4KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMDA3LXVudGFw
cGVkLW1hc3Nlcy0wMWY4MGI3YzEzYzdAc3B1ZC8KVGhlbiAibG9vbmdzb24sbHMxYi1uZmMiIGJl
Y2FtZSB0aGUgZmFsbGJhY2suCgo+ID4gPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4gPiA+ICsgICAg
ICAgICAgLSBlbnVtOgo+ID4gPiA+ICsgICAgICAgICAgICAgIC0gbG9vbmdzb24sbHMxYS1uZmMK
PiA+ID4gPiArICAgICAgICAgICAgICAtIGxvb25nc29uLGxzMWMtbmZjCj4gPiA+ID4gKyAgICAg
ICAgICAtIGNvbnN0OiBsb29uZ3NvbixsczFiLW5mYwo+ID4gPiA+ICsKPiA+ID4gPiArICByZWc6
Cj4gPiA+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gPiA+ICsKPiA+ID4gPiArICBkbWFzOgo+ID4g
PiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ID4gPiArCj4gPiA+ID4gKyAgZG1hLW5hbWVzOgo+ID4g
PiA+ICsgICAgY29uc3Q6IHJ4dHgKPiA+ID4gPiArCj4gPiA+ID4gK3BhdHRlcm5Qcm9wZXJ0aWVz
Ogo+ID4gPiA+ICsgICJebmFuZEBbMC0zXSQiOgo+ID4gPiA+ICsgICAgdHlwZTogb2JqZWN0Cj4g
PiA+ID4gKyAgICAkcmVmOiByYXctbmFuZC1jaGlwLnlhbWwKPiA+ID4gPiArCj4gPiA+ID4gKyAg
ICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gPiA+ID4gKwo+ID4gPiA+ICtyZXF1aXJl
ZDoKPiA+ID4gPiArICAtIGNvbXBhdGlibGUKPiA+ID4gPiArICAtIHJlZwo+ID4gPiA+ICsgIC0g
ZG1hcwo+ID4gPiA+ICsgIC0gZG1hLW5hbWVzCj4gPiA+Cj4gPiA+IFNob3VsZCBETUEgcHJvcHMg
YmUgcmVxdWlyZWQ/Cj4gPiA+Cj4gPiBZZXMuIFRoaXMgTkFORCBjb250cm9sbGVyIG9ubHkgd29y
a3Mgd2l0aCBETUEsIHdoaWNoIG1lYW5zIHRoZSBETUEgaXMgbmVjZXNzYXJ5Lgo+Cj4gT2sKPgo+
ID4KPiA+ID4gPiArCj4gPiA+ID4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiA+ID4g
PiArCj4gPiA+ID4gK2V4YW1wbGVzOgo+ID4gPiA+ICsgIC0gfAo+ID4gPiA+ICsgICAgbmFuZC1j
b250cm9sbGVyQDFmZTc4MDAwIHsKPiA+ID4gPiArICAgICAgICBjb21wYXRpYmxlID0gImxvb25n
c29uLGxzMWItbmZjIjsKPiA+ID4gPiArICAgICAgICByZWcgPSA8MHgxZmU3ODAwMCAweDQwPjsK
PiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiA+ID4g
KyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgIGRt
YXMgPSA8JmRtYSAwPjsKPiA+ID4gPiArICAgICAgICBkbWEtbmFtZXMgPSAicnh0eCI7Cj4gPiA+
Cj4gPiA+IFRoZXJlIGlzIGEgcHJlZmVycmVkIHNwYWNpbmcgZm9yIERUIG5vZGVzLCBzZWU6Cj4g
PiA+IGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2RldmljZXRyZWUvYmluZGluZ3MvZHRzLWNvZGlu
Zy1zdHlsZS5odG1sCj4gPiA+Cj4gPiBTb3JyeS4gSSBkb24ndCBnZXQgdGhlIG1lYW5pbmcgb2Yg
cHJlZmVycmVkIHNwYWNpbmcuCj4gPiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9kZXZpY2V0cmVl
L2JpbmRpbmdzL3dyaXRpbmctc2NoZW1hLmh0bWwgc2F5cwo+ID4gIkZvciBEVFMgZXhhbXBsZXMg
aW4gdGhlIHNjaGVtYSwgcHJlZmVycmVkIGlzIGZvdXItc3BhY2UgaW5kZW50YXRpb24uIgo+ID4g
VGhlbiBJIHVzZWQgZm91ci1zcGFjZSBpbmRlbnRhdGlvbi4KPgo+IEknbSB0YWxraW5nIGFib3V0
IHRoZSBuZXcgbGluZXMgKFxuKSBiZXR3ZWVuIHRoZSBwcm9wZXJ0aWVzLgo+CldpbGwgcmVtb3Zl
IHRoZSBzdXBlcmZsdW91cyBuZXcgbGluZXMuCj4gPgo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAg
ICBuYW5kQDAgewo+ID4gPiA+ICsgICAgICAgICAgICByZWcgPSA8MD47Cj4gPiA+ID4gKyAgICAg
ICAgICAgIG5hbmQtdXNlLXNvZnQtZWNjLWVuZ2luZTsKPiA+ID4gPiArICAgICAgICAgICAgbmFu
ZC1lY2MtYWxnbyA9ICJoYW1taW5nIjsKPiA+ID4KPiA+ID4gVGhlc2UgdHdvIHByb3BlcnRpZXMg
YXJlIG5vdCBuZWVkZWQuIFVubGVzcyB0aGVyZSBpcyBubyBoYXJkd2FyZSBFQ0MKPiA+ID4gY2Fw
YWJpbGl0eSBvbiB0aGlzIGNvbnRyb2xsZXIgYW5kIGluIHRoaXMgY2FzZSB5b3UgbmVlZCB0byBl
bnN1cmUgdGhlCj4gPiA+IHByb3BlcnRpZXMgYXJlIHByZXNlbnQgaW4gdGhlIHNjaGVtYS4KPiA+
Cj4gPiBFeGFjdGx5LiBUaGlzIE5BTkQgY29udHJvbGxlciBkb2Vzbid0IHN1cHBvcnQgaGFyZHdh
cmUgRUNDLgo+ID4gJ25hbmQtdXNlLXNvZnQtZWNjLWVuZ2luZScgYW5kICduYW5kLWVjYy1hbGdv
JyBhcmUgcHJlc2VudCBpbiBuYW5kLWNoaXAueWFtbC4KPiA+IElzIHRoZXJlIGFueXRoaW5nIGVs
c2UgSSBzaG91bGQgZG8/Cj4KPiBUaHJ5IGFyZSBpbiBuYW5kLWNoaXAueWFtbCwgd2hpY2ggbWVh
bnMgdGhleSBhcmUgYWxsb3dlZCwgYnV0IEkgd2FudAo+IHRoZW0gbWFuZGF0b3J5Ogo+CldpbGwg
ZG8uCgo+IHJlcXVpcmVkOgo+ICAgLSBmb28KPiAgIC0gYmFyCj4KPiBUaGFua3MsCj4gTWlxdcOo
bAoKCgotLSAKQmVzdCByZWdhcmRzLAoKS2VndWFuZyBaaGFuZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
