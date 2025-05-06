Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65B5C3ABAC
	for <linux-mtd@archiver.kernel.org>; Tue,  6 May 2025 10:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jOGQgzVRKH3AdlZ6hCGLWZ7sQkVQuE/1+ATYyLlfjo=; b=kzcYkJaou8xutu
	5dtX008CdzGyWQJzxlQwGzCtSqWfsJkbUQ1VD8vcjVkaxQvEG8DagoZl1Gw485HbAHL4kDxzPkfuE
	oxfyNk2ICeUK1iMwYCTutami9qox9JaCd+LQLL99K1qkxqvytm9vZBHTntYuv4ehcdxzsfCgVFAps
	uP63kVGDyrwQW4XwnVQS6X0+HBJYce88PSoyPuU6s3OG+33bcEaPLZbaRst63Q/8HmxPJOFpHY6mZ
	HN+jTcnT3fCoBw8MbfIziSp5x/gmxxPp4OeGAbpP6sEyg3vWlWDEtwRRlcUAhA2fyPQN25pTa+ovl
	ryBC0AaJhnEKcopBbhpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFdd-0000000BaJp-1VsL;
	Tue, 06 May 2025 10:35:01 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEPr-0000000BK5Q-2o1w
	for linux-mtd@lists.infradead.org;
	Tue, 06 May 2025 09:16:44 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54ea69e9352so6419298e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 06 May 2025 02:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746523001; x=1747127801; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFhdrQg9VjOK5o+w3dNEthEuz25cmcD0YW5MAF0oO54=;
        b=CPOnyShVQ/Qt7i4U9tnKT/eJh88QZ2bLEvZcr5Of71GpX0zSITEeaMo43p1tAoSWCV
         KGFT+XSF1+h2y9cDS1z69dR5YOS28tk58uhTix/en/5Aq/FbyN1ASm3jbaRAWo8uk0Kg
         Z8OFtirhSUkG7HiuKig4wAbbj0TaELLprZaouh4hZ3bedvK4hE6GTgAIRNZlRvg9LA8P
         abFIN4qRuNjDUq4RArQA6XoK81146F+1J1Z7rUHLw6Z1reJ6iGwEMOPb9K0kmDirWs7V
         BkcbBVj25JQcmoEzs+bvv4T78zh9fjvmTiITYBg3wehfnqFIVxJUWyRBih6laDC+ZbqN
         WRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523001; x=1747127801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFhdrQg9VjOK5o+w3dNEthEuz25cmcD0YW5MAF0oO54=;
        b=mOmSFc4Oo26ewYipN9V6oVxQuMPULgLmG1dzzBY22lIj84uj8oXeUj8UKUStel+Kv0
         O/Vy+zV1rAarpeDakikim2fbelthJCPMh9JT5zg3IyFDsBEts/dSkR7rQKlJRX4nmdho
         pyQ9ilCSRj3SBr5v8hstZ0fbiCmJRX+NwaDOTdQUwAz/c/Dk4YAZLKdrden5GKAc6q/R
         bI+WCswR0Lvbg+cylCVlFlaxYylWOsIdTZN+uE9DcENNsn1K70JxRAmcRhgPoaomBijY
         5igoXg1MKai7bdX+F3HRns7IIfbJ18V1DVDbVh1MlpWAW3z04panD47BMYVPXWFBUbxK
         Pcdw==
X-Forwarded-Encrypted: i=1; AJvYcCWCcUF/1nE7BnxPx3TztDYf8vfYxuIQsbe62Ayz81HYQQrrnEOXa56Sn6Lh2RYEoVGJoibV0fDSBJA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdJuJjowcNU9ipFasE6L9qmPMLEtO5DwTxJHFhP4uKLBFWgclg
	BiwSz27ovDgYJvSucJY2uXcv9jePGoOU/d73+MkPZ3lvjk3+gusKDKtOqCGbrMZH54YfOvBvmjH
	8g1Db7+U+Qrku+6paDvzxI/SKkU4=
X-Gm-Gg: ASbGncs531ObEdOCnRIgR8HYceFfYeJd0/9f1l/9bDSgKQVUYFmord8fl9kbvhJvtCV
	Lre6VhDHiyZgZ5N8bLTfYsL/GeF9TbzBTVrceRua/rbi3jX3LwpHPcrfeJ2/+gm+tL93X6EbsFi
	B0cZ9Q2Y9GnJEFW/NaAdzB8bE=
X-Google-Smtp-Source: AGHT+IFg6WE7j8FSGTac7AwWN6IfBm6BGTQTRX79tY25IYyGnXzIH3FUSkGCAyHgyH2w/ZukrNan9JItD5yPEyQJP8U=
X-Received: by 2002:a05:6512:6cc:b0:545:a2f:22ba with SMTP id
 2adb3069b0e04-54fb4a67cb6mr724690e87.37.1746523001039; Tue, 06 May 2025
 02:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <aBSEwag_ducqOwy7@stanley.mountain>
In-Reply-To: <aBSEwag_ducqOwy7@stanley.mountain>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 6 May 2025 17:16:03 +0800
X-Gm-Features: ATxdqUFNvs-6aP2yLuFUCy6zY-YKCHM9vIIJ1LromY7V5gmh-56UOb_wQLCMNr8
Message-ID: <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in ls1x_nand_dma_transfer()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_021643_702865_C92DE18F 
X-CRM114-Status: GOOD (  21.25  )
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

T24gRnJpLCBNYXkgMiwgMjAyNSBhdCA0OjM54oCvUE0gRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IFRoZSAiZGVzYyIgdmFyaWFibGUgaXMgTlVMTCBh
bmQgUFRSX0VSUihOVUxMKSBpcyB6ZXJvL3N1Y2Nlc3MuICBSZXR1cm4KPiBhIG5lZ2F0aXZlIGVy
cm9yIGNvZGUgaW5zdGVhZC4KPgo+IEZpeGVzOiBkMmQxMGVkZTA0YjEgKCJtdGQ6IHJhd25hbmQ6
IEFkZCBMb29uZ3Nvbi0xIE5BTkQgQ29udHJvbGxlciBEcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6
IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4KPiAtLS0KPiBJdCdzIGhh
cmQgdG8ga25vdyB3aGF0IHRoZSBwYXRjaCBwcmVmaXggc2hvdWxkIGJlIGhlcmUuICBJZGVhbGx5
IHdoZW4gd2UKPiBhZGQgYSBuZXcgZHJpdmVyIHdlIHdvdWxkIHVzZSB0aGUgcGF0Y2ggcHJlZml4
IGZvciB0aGUgZHJpdmVyLgo+Cj4gVGlyZWQ6IHN1YnN5c3RlbTogQWRkIGRyaXZlciBYWFgKPiBX
aXJlZDogc3Vic3lzdGVtOiBYWFg6IEFkZCBkcml2ZXIgZm9yIFhYWAo+Cj4gIGRyaXZlcnMvbXRk
L25hbmQvcmF3L2xvb25nc29uMS1uYW5kLWNvbnRyb2xsZXIuYyB8IDIgKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbG9vbmdzb24xLW5hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbG9vbmdzb24xLW5hbmQtY29udHJvbGxlci5jCj4gaW5kZXggNmEzNjliMWM3
ZDg2Li44NzU0YmI0ZjhiNTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9v
bmdzb24xLW5hbmQtY29udHJvbGxlci5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9v
bmdzb24xLW5hbmQtY29udHJvbGxlci5jCj4gQEAgLTM3MSw3ICszNzEsNyBAQCBzdGF0aWMgaW50
IGxzMXhfbmFuZF9kbWFfdHJhbnNmZXIoc3RydWN0IGxzMXhfbmFuZF9ob3N0ICpob3N0LCBzdHJ1
Y3QgbHMxeF9uYW5kXwo+ICAgICAgICAgZGVzYyA9IGRtYWVuZ2luZV9wcmVwX3NsYXZlX3Npbmds
ZShjaGFuLCBkbWFfYWRkciwgb3AtPmxlbiwgeGZlcl9kaXIsIERNQV9QUkVQX0lOVEVSUlVQVCk7
Cj4gICAgICAgICBpZiAoIWRlc2MpIHsKPiAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJm
YWlsZWQgdG8gcHJlcGFyZSBETUEgZGVzY3JpcHRvclxuIik7Cj4gLSAgICAgICAgICAgICAgIHJl
dCA9IFBUUl9FUlIoZGVzYyk7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07CgpUaGFu
ayB5b3UgZm9yIGZpeGluZyB0aGlzIGlzc3VlLgpIb3dldmVyLCBJIGJlbGlldmUgLUVJTyBpcyBt
b3JlIGFwcHJvcHJpYXRlIHRoYW4gLUVOT01FTSwgc2luY2UKZG1hZW5naW5lX3ByZXBfc2xhdmVf
c2luZ2xlKCkgY2FuIHJldHVybiBlcnJvcnMgb3RoZXIgdGhhbiAtRU5PTUVNLgoKPiAgICAgICAg
ICAgICAgICAgZ290byBlcnI7Cj4gICAgICAgICB9Cj4gICAgICAgICBkZXNjLT5jYWxsYmFjayA9
IGxzMXhfbmFuZF9kbWFfY2FsbGJhY2s7Cj4gLS0KPiAyLjQ3LjIKPgoKCi0tIApCZXN0IHJlZ2Fy
ZHMsCgpLZWd1YW5nIFpoYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
