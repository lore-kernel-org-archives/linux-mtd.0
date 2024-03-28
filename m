Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AB6C54E67
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 08:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9323/6aSm/ZfZPqEQjJV+ptih6hngcPAgWCJoSeiC2A=; b=nO66srjUPDOuq3
	C8MSO8VkhbozPxCpSfe6ausJSyCqcMcXgIinaADqIq3bnbjOcaiZePtcwynjURXfZ7L8xArwFzFAr
	CEg64RL1UwXRCTp6AU89Mn3YUztu6+sXu1Hbb4jCQXjn/HnqdA+0LbTL+doGKspLUv4R62et8/fV9
	V3oYdNYKto1qLhWUAKtWXc0txXhRcDqttq/mpmJ+5+OdXDD+mwBhxItbYXslgiI5XIuAUrMcQqUu+
	sMZh5JDxTrHOyf5GzxHmhIXJrbSrp5n5JEUtOE3ORP+yQrXkegf4PTVGacMuf1CbGB4Wh9avhhP7b
	yarBUavUP6SLGbZYFyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rplXw-0000000DBrT-1gRx;
	Thu, 28 Mar 2024 08:55:40 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rplXu-0000000DBqP-1bah
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 08:55:39 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-56b0af675deso759566a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2024 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711616136; x=1712220936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ3BMMhKAmNs4bhyvnKkEZ82vtuSNj39yw+KO8d5Hvg=;
        b=FArZGPHy6bdWdzNerY2SdVS4bBLYLR4Bx6AnOKMjpVZWTRzwtzp74Rs+B8L8nkUVdH
         RpuZFsglEgfBE35VAdS4c6Y20+JzGux37rJBmyf5BZi3fsC9kUTdFoyHihkO9qUNFaHk
         /jk1CiKK6iZg5S3nClOV2GV0oS5eSb6/QyFkRT+GnFaqjrYD5PtnlWcwT/4hDf3j67QT
         5ayXujUSiG3m+OjCYCVixqSfphxkuMWkSbcKCJGD3NL90eKb/+whoJtCXdlur6M1RR7a
         Lzw0vBgAUv+RFAwsT2YL1XeYwrR4UgrCQsYQYgcQfD7unO4BN24Ntkcy0SEdAPOmbNfq
         O1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711616136; x=1712220936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ3BMMhKAmNs4bhyvnKkEZ82vtuSNj39yw+KO8d5Hvg=;
        b=KnY++Yml4LdDsngJWFTGcyHQV2Vt01ciIrwwwRc7OICHc95Ig6rHNdt/n7U9AIOtnX
         +LVWumX1xbAkzONb0XU5HTJWqfgd3TP0cUMg8cvBQr9ljgEEpRD+XX7nRPhBBQGXD/XP
         GZ7W9Z7eFOE/zLU9S3Yjf/gkZN3jnW+tA9zbLh6NDVcp0UGDDkcImOCI3MeQmBsPQH/m
         2ircy1dDVVpqUax5HPiysE9cEkvD7qLzdKpqNTGbNkwHDkYTRgUQpwI8YCin6oOxDagJ
         XnYgYe3fgBPH/oTsX8IpMjNCA/klJvD8pyPe7cb4bHOLtd0qLnBTc4oPBTtMbVyD3xfT
         dCow==
X-Forwarded-Encrypted: i=1; AJvYcCUWrvBKFEUQ8mGyf2rKKVkSIaDCrmnh+Cn/l863HFEwm6I2F7fxQZ6AT1B/opDK2xbPGcksVurj2tH46pupSEigOy8DNNKrhf11VVvLgw==
X-Gm-Message-State: AOJu0Yy/dr1obirrWBJba5dJLgp6DYJ1t/AH3IQEOp8+ufDzNzMSNvtc
	ETOMedrOGVNnf+XrTd7fi/XTMxZxbiO7H2mW4V6tpUePnMhLpA8N6Avy5X5bzls5wbVHM5b5RL1
	EiJ/Bk+gcqJnPinJNt+2J8va1R1c=
X-Google-Smtp-Source: AGHT+IF/Gh0fqkummHE++ODJJmmDYUghD6sTKPcA5xCjIEGld6dcTsKYDT2r02IGeAmJKxsFDo1HaPJup4R1syV1vdI=
X-Received: by 2002:a05:6402:34cd:b0:56c:56dd:3b5f with SMTP id
 w13-20020a05640234cd00b0056c56dd3b5fmr438045edc.3.1711616135807; Thu, 28 Mar
 2024 01:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240327-loongson1-nand-v6-0-7f9311cef020@gmail.com>
 <20240327-loongson1-nand-v6-1-7f9311cef020@gmail.com> <20240327-bonehead-handlebar-1ca8dab95179@spud>
In-Reply-To: <20240327-bonehead-handlebar-1ca8dab95179@spud>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 28 Mar 2024 16:54:59 +0800
Message-ID: <CAJhJPsX7Ds-UdFpTpLgFMW+rTGAgAYSKAieAMn12Z8RjNn-A8A@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Conor Dooley <conor@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_015538_453527_3837D96D 
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

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgMTI6MjPigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMDY6NDM6NTlQTSAr
MDgwMCwgS2VndWFuZyBaaGFuZyB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4gPiBGcm9tOiBLZWd1YW5n
IFpoYW5nIDxrZWd1YW5nLnpoYW5nQGdtYWlsLmNvbT4KPiA+Cj4gPiBBZGQgZGV2aWNldHJlZSBi
aW5kaW5nIGRvY3VtZW50IGZvciBMb29uZ3Nvbi0xIE5BTkQgQ29udHJvbGxlci4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBLZWd1YW5nIFpoYW5nIDxrZWd1YW5nLnpoYW5nQGdtYWlsLmNvbT4KPiA+
IC0tLQo+ID4gQ2hhbmdlcyBpbiB2NjoKPiA+IC0gQSBuZXdseSBhZGRlZCBwYXRjaAo+ID4gLS0t
Cj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2xvb25nc29uLGxzMXgtbmZjLnlhbWwg
fCA2NiArKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDY2IGluc2Vy
dGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9sb29uZ3NvbixsczF4LW5mYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9sb29uZ3NvbixsczF4LW5mYy55YW1sCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4yNDk0YzdiM2I1MDYKPiA+IC0tLSAvZGV2
L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbG9v
bmdzb24sbHMxeC1uZmMueWFtbAo+ID4gQEAgLTAsMCArMSw2NiBAQAo+ID4gKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gKyVZQU1M
IDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRk
L2xvb25nc29uLGxzMXgtbmZjLnlhbWwjCj4KPiBQbGVhc2UgbWFrZSB0aGUgZmlsZW5hbWUgbWF0
Y2ggdGhlIGNvbXBhdGlibGUuCj4KR290IGl0LiBJJ2xsIHJlbmFtZSBpdCB0byBsb29uZ3Nvbixs
czEtbmZjLnlhbWwgYW5kIGNoYW5nZSB0aGUKY29tcGF0aWJsZSBhcyBmb2xsb3dzLgogIGNvbXBh
dGlibGU6CiAgIGl0ZW1zOgogICAgIC0gZW51bToKICAgICAgICAgLSBsb29uZ3NvbixsczFhLW5m
YwogICAgICAgICAtIGxvb25nc29uLGxzMWItbmZjCiAgICAgICAgIC0gbG9vbmdzb24sbHMxYy1u
ZmMKICAgICAtIGNvbnN0OiBsb29uZ3NvbixsczEtbmZjCgo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBM
b29uZ3Nvbi0xIE5BTkQgQ29udHJvbGxlcgo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAg
LSBLZWd1YW5nIFpoYW5nIDxrZWd1YW5nLnpoYW5nQGdtYWlsLmNvbT4KPiA+ICsKPiA+ICthbGxP
ZjoKPiA+ICsgIC0gJHJlZjogbmFuZC1jb250cm9sbGVyLnlhbWwKPiA+ICsKPiA+ICtwcm9wZXJ0
aWVzOgo+ID4gKyAgY29tcGF0aWJsZToKPiA+ICsgICAgb25lT2Y6Cj4gPiArICAgICAgLSBjb25z
dDogbG9vbmdzb24sbHMxYi1uZmMKPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4gKyAgICAgICAgICAt
IGVudW06Cj4gPiArICAgICAgICAgICAgICAtIGxvb25nc29uLGxzMWEtbmZjCj4gPiArICAgICAg
ICAgICAgICAtIGxvb25nc29uLGxzMWMtbmZjCj4gPiArICAgICAgICAgIC0gY29uc3Q6IGxvb25n
c29uLGxzMWItbmZjCj4gPiArCj4gPiArICByZWc6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiAr
Cj4gPiArICBkbWFzOgo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAgZG1hLW5hbWVz
Ogo+ID4gKyAgICBjb25zdDogcnh0eAo+Cj4gSWYgeW91IG9ubHkgaGF2ZSBvbmUgZG1hLCB3aHkg
ZG8geW91IG5lZWQgYSBkbWEtbmFtZXMgZW50cnkgZm9yIGl0Pwo+CldpdGhvdXQgImRtYS1uYW1l
cyIsIHRoZSBmb2xsb3dpbmcgZXJyb3Igd2lsbCBjb21lIG91dCB3aGVuIGRvaW5nCmR0X2JpbmRp
bmdfY2hlY2suCiAgbmFuZC1jb250cm9sbGVyQDFmZTc4MDAwOiAnZG1hLW5hbWVzJyBpcyBhIHJl
cXVpcmVkIHByb3BlcnR5CgpJbiBhZGRpdGlvbiwgbG9vbmdzb24xX25hbmQuYyBjYWxscyBkbWFf
cmVxdWVzdF9jaGFuKCkuIFRoZW4KZG1hX3JlcXVlc3RfY2hhbigpIGNhbGxzIG9mX2RtYV9yZXF1
ZXN0X3NsYXZlX2NoYW5uZWwoKSwgaW4gd2hpY2ggdGhlCidkbWEtbmFtZXMnIGlzIG5lY2Vzc2Fy
eS4Kc3RydWN0IGRtYV9jaGFuICpvZl9kbWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVsKHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnAsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IGNoYXIgKm5hbWUpCnsKICAgICAgIC4uLgogICAgICAgY291bnQgPSBvZl9wcm9w
ZXJ0eV9jb3VudF9zdHJpbmdzKG5wLCAiZG1hLW5hbWVzIik7CiAgICAgICBpZiAoY291bnQgPCAw
KSB7CiAgICAgICAgICAgICAgIHByX2VycigiJXM6IGRtYS1uYW1lcyBwcm9wZXJ0eSBvZiBub2Rl
ICclcE9GJyBtaXNzaW5nCm9yIGVtcHR5XG4iLAogICAgICAgICAgICAgICAgICAgICAgIF9fZnVu
Y19fLCBucCk7CiAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwogICAgICAg
fQogICAgICAgLi4uCn0KClRoYW5rcyBmb3IgeW91ciByZXZpZXchCgo+IExvb2tzIGZpbmUgdG8g
bWUgb3RoZXJ3aXNlIHRob3VnaCwKPiBDT25vci4KPgo+ID4gKwo+ID4gK3BhdHRlcm5Qcm9wZXJ0
aWVzOgo+ID4gKyAgIl5uYW5kQFswLTNdJCI6Cj4gPiArICAgIHR5cGU6IG9iamVjdAo+ID4gKyAg
ICAkcmVmOiByYXctbmFuZC1jaGlwLnlhbWwKPiA+ICsKPiA+ICsgICAgdW5ldmFsdWF0ZWRQcm9w
ZXJ0aWVzOiBmYWxzZQo+ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4gKyAgLSBjb21wYXRpYmxlCj4g
PiArICAtIHJlZwo+ID4gKyAgLSBkbWFzCj4gPiArICAtIGRtYS1uYW1lcwo+ID4gKwo+ID4gK3Vu
ZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiA+ICsKPiA+ICtleGFtcGxlczoKPiA+ICsgIC0g
fAo+ID4gKyAgICBuYW5kLWNvbnRyb2xsZXJAMWZlNzgwMDAgewo+ID4gKyAgICAgICAgY29tcGF0
aWJsZSA9ICJsb29uZ3NvbixsczFiLW5mYyI7Cj4gPiArICAgICAgICByZWcgPSA8MHgxZmU3ODAw
MCAweDQwPjsKPiA+ICsKPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gKyAg
ICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiArCj4gPiArICAgICAgICBkbWFzID0gPCZkbWEg
MD47Cj4gPiArICAgICAgICBkbWEtbmFtZXMgPSAicnh0eCI7Cj4gPiArCj4gPiArICAgICAgICBu
YW5kQDAgewo+ID4gKyAgICAgICAgICAgIHJlZyA9IDwwPjsKPiA+ICsgICAgICAgICAgICBuYW5k
LXVzZS1zb2Z0LWVjYy1lbmdpbmU7Cj4gPiArICAgICAgICAgICAgbmFuZC1lY2MtYWxnbyA9ICJo
YW1taW5nIjsKPiA+ICsgICAgICAgIH07Cj4gPiArICAgIH07Cj4gPgo+ID4gLS0KPiA+IDIuNDAu
MQo+ID4KPiA+CgoKCi0tCkJlc3QgcmVnYXJkcywKCktlZ3VhbmcgWmhhbmcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
