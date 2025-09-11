Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC911CA1016
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 05:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mePuNci119tKJmeCDaa8/0jbI57Cfhxkazbl6Yi4WM=; b=NJ5RI+sXeG7Akz
	arXuiPzK6T7YGGguWfpLXNzjQyCFmLaEhXxougqMqfUaIQL3RPxZ4vf4xs4DgnFVgy7A9gl7gdCs6
	JQvEJjz86wGe+d+VxVESCVF7RUfJAYZIKerpIpaKNZFXLhtI0LJdQTnau8o8NJBK1I0XiCPQlNns3
	HSEGyz5pRc+6nH5nQIBmHUyZ43iqm9SnpTTmI4GKFh2IOyLxpPcawmbTjhI7nOkBwJowpXZSnXytR
	ns+TGh7EwysR00+wcu8SBBOgFmwxOUSDaEXzyJZelg5zRUuEE3b2wtvEXyRq5QmZXVfZm3PeMOSHx
	35jgPjjxGh9YTm64A+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwa6q-000000013st-2lMS;
	Thu, 11 Sep 2025 05:44:40 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwa6o-000000013rl-20Ao
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 05:44:39 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55f98e7782bso467653e87.0
        for <linux-mtd@lists.infradead.org>; Wed, 10 Sep 2025 22:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757569476; x=1758174276; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMIGN5Dtji/fICaLmPTyfkuwaheBNYfZUOrUfndT+g0=;
        b=hanarmJaiTrsKS8hT3d+t18ZLyDtg3tqpdpwiYgoGF6+uHoC9buykzTsad9C/ZDC5H
         radvkF3/EH/G79z8nveU3IpAfYjAAQlt0PVZazREItZ84ox9739/EhW8uoylLUQXxI8I
         HNSVoHkhPlnSOyS+2PTvHN5vc/flMs/HMq2jQPCtwS277p7Tzd6l6muHNaTUUxx8UEUx
         YGkgzwuWMNMuhE3gqjtE5F17iNrlZ+PC2eWRqzN3lAzBBzSPb1H0s75I9pKvygnGBoQu
         sMGOIaBahCsofaL+O8WnMKZ3Ap9EYVxMs10ZwTynD4FFrVtPN86kJ8PtUjRsWRBYUQw6
         MxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757569476; x=1758174276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMIGN5Dtji/fICaLmPTyfkuwaheBNYfZUOrUfndT+g0=;
        b=R2XqBkz7efeitGUKs+YkjvdhmUwTgNlYrW2VXNSQzinWRafXTodWVSyaynCTyQaZ5o
         DaBPI15MD3nbKWoHjShxUowUnL0fgNb0BH4cLsaDPVQ3KL0g8YzT44uvSEKATpH3Q3Rm
         xIQB09IhWSOZFCdFD4Nf/MhGwlbvRhNNUSHqyT9AHQi9cjjFVxToGtGd4vmItkvOExsG
         nCsN2AyZOBE4tmCleDp7nR9nxB8l1ho/maDVLGJ93dTDNnjLsSz9zAv+G+z3AP6IxvWW
         r8AJnMlUilmlIug7SxFLU1RNPskksEfC6kRsmir1AnnSbgGTtwErq4i6RYLC0wpPtGRg
         hP2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVT7W0KoTIdXwLlkNNZsaL/9u07AwPoLZ+oJTsoGwpuxYb/ypzqhjKpnEyQK5RZQTg7vcC4z95jtYU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4V4a+FIejsJXNJCZfBP9leZjJsut/PhjTdEJzWwg4JXzGqjmF
	PCQpIwNmw77hNZ9klHGng9xqXb8Aaa/DixN+TaFpdA0bdp7M/aYpsIEZw9jQMdWBVc7uUTt7v/T
	E742/E2XbMRijWwgh9h7E0YtI7QOCL4k=
X-Gm-Gg: ASbGnctj1vHFsSEnXk8qbm+lskSnoFbfnc1m27pqy6TvN+eSKt6JQuMUWCZoJ1Adj6C
	PUgt+DWZXwY5dxx+zoryAWz9Xa0a01Tfzxvg3PNMHUMFpj5CrywwmsFTYhLLsx1XefcXPKbz8xP
	Srdn1tphmgKaAMIGnd3J7FDqeDWNhYcv3V/b8C08DCehBjaYhK35ClYcn9zB3QNtWbqPS43Ik82
	s/GcTHIb+dsgR0QDNDKieHuA2pFJQ==
X-Google-Smtp-Source: AGHT+IFXXzbUmqfUVHrK9y+Tz+xUgPLo8Z/WQoqhWiJEUjVlgtHkwjMb8D/bEp5cJbkjZ9GKy8JPh87QF0toRaHkPG0=
X-Received: by 2002:a05:6512:31d2:b0:55f:45f7:f7a0 with SMTP id
 2adb3069b0e04-56d7b8f884bmr603188e87.28.1757569475645; Wed, 10 Sep 2025
 22:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756991031.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1756991031.git.zhoubinbin@loongson.cn>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 11 Sep 2025 13:43:58 +0800
X-Gm-Features: AS18NWB5DuSI91t4oeMBT2UUvtcIx7VW5QEF-xbXLNgu0nfFPDPblbd44x_70lk
Message-ID: <CAJhJPsXwT45Q7j5XtEujsMnYgMMAbzg53d0T8YGCv1SuoYFJ_g@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] mtd: rawnand: loongson: Add Loongson-2K nand
 controller support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_224438_548433_E5F3A4D7 
X-CRM114-Status: GOOD (  20.95  )
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

Rm9yIHRoZSB3aG9sZSBzZXJpZXM6CgpSZXZpZXdlZC1ieTogS2VndWFuZyBaaGFuZyA8a2VndWFu
Zy56aGFuZ0BnbWFpbC5jb20+ClRlc3RlZC1ieTogS2VndWFuZyBaaGFuZyA8a2VndWFuZy56aGFu
Z0BnbWFpbC5jb20+ICMgb24gTFMxQiAmIExTMUMKCk9uIFRodSwgU2VwIDQsIDIwMjUgYXQgOTow
N+KAr1BNIEJpbmJpbiBaaG91IDx6aG91YmluYmluQGxvb25nc29uLmNuPiB3cm90ZToKPgo+IEhp
IGFsbDoKPgo+IFRoaXMgcGF0Y2hzZXQgYWRkcyBzdXBwb3J0IGZvciB0aGUgTG9vbmdzb24tMksw
NTAwL0xvb25nc29uLTJLMTAwMCBOQU5ECj4gY29udHJvbGxlcnMsIHdoaWNoIGFyZSBzaW1pbGFy
IHRvIHRoZSBMb29uZ3Nvbi0xQyBOQU5EIGNvbnRyb2xsZXIuCj4KPiBUaGV5IHN1cHBvcnQgYSBt
YXhpbXVtIGNhcGFjaXR5IG9mIDE2R0IgRkxBU0ggcGVyIGNoaXAsIHdpdGggYSBtYXhpbXVtCj4g
cGFnZSBzaXplIG9mIDhLQi4gVGhlIGNoaXAgc3VwcG9ydHMgdXAgdG8gNCBjaGlwIHNlbGVjdHMg
YW5kIDQgUkRZIHNpZ25hbHMuCj4KPiBUaGUga2V5IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgTG9v
bmdzb24tMksgTkFORCBjb250cm9sbGVycyBpcyB0aGF0IHRoZQo+IExvb25nc29uLTJLMTAwMCBl
eHBsaWNpdGx5IGNvbmZpZ3VyZXMgdGhlIERNQSBjb250cm9sbGVyIHJvdXRpbmcsIHdoaWxlCj4g
dGhlIExvb25nc29uLTJLMDUwMCBkZWZhdWx0cyB0byB1c2luZyBBUEJETUEwLgo+Cj4gU3VtbWFy
eSBvZiB0aGUgcGF0Y2hzZXQ6Cj4gUHRhY2ggMTogUmVuYW1lIGFsbCBwcmVmaXhlcyBmcm9tIGxz
MXggdG8gbG9vbmdzb24KPiBQYXRjaCAyOiBBZGQgNi1ieXRlIE5BTkQgSUQgcmVhZGluZwo+IFBh
dGNoIDM6IEFkZCBjaGlwIHNlbGVjdCBzdXBwb3J0Cj4gUGF0Y2ggNC01OiBBZGQgTG9vbmdzb24t
MkswNTAwIE5BTkQgY29udHJvbGxlciBzdXBwb3J0Cj4gUGF0Y2ggNi03OiBBZGQgTG9vbmdzb24t
MksxMDAwIE5BTkQgY29udHJvbGxlciBzdXBwb3J0Cj4KPiBUaGFua3MuCj4KPiAtLS0tLS0tCj4g
VjQ6Cj4gUGF0Y2ggKDUvNyk6Cj4gICAtIFNwbGl0IHRoZSBmbGFncyB2YXJpYWJsZSBpbnRvIGRt
YV9iaXRzOwo+ICAgLSBDaGlwIHNlbGVjdHMgc2V0IGJlZm9yZSByZXF1ZXN0aW5nIHRoZSBETUEg
Y2hhbm5lbDsKPiAgIC0gJ3wnIHNob3VsZCBiZSBsYXN0IGNoYXJhY3RlciBvbiB0aGUgcHJldmlv
dXMgbGluZS4KPiBQYXRjaCAoNy83KToKPiAgIC0gVXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9y
ZXNvdXJjZV9ieW5hbWUoKTsKPiAgIC0gQWRkIHRoZSBkbWFfY29uZmlnKCkgZnVuY3Rpb24gcG9p
bnRlciB0byByZXBsYWNlIHRoZSBwcmV2aW91cyBmbGFncy4KPgo+IExpbmsgdG8gVjM6Cj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2NvdmVyLjE3NTU3NTc4NDEuZ2l0Lnpob3ViaW5iaW5A
bG9vbmdzb24uY24vCj4KPiBWMzoKPiBQYXRjaCAoMS83KToKPiAgIC0gTWVyZ2UgdGhlIGZpcnN0
IHR3byByZW5hbWUgcGF0Y2hlczsKPiBQYXRjaCAoMy83KQo+ICAgLSBSZWZhY3QgY2hpcCBjYXBh
Y2l0eSBjYWxjdWxhdGlvbi4gVXNlIGEgYmlnIHN3aXRjaC1jYXNlCj4gICAgIGZvciB3cml0ZXNp
emUsIGFuZCBzb3J0IHRoZSBiaWcgc3dpdGNoLWNhc2UgYnkgd3JpdGVzaXplOwo+ICAgLSBEcm9w
IHRoZSByZWR1bmRhbnQgJ25hbmRfY3MgPSAweDAnOwo+IFBhdGNoICg2LzcpCj4gICAtIEFkZCBS
ZXZpZXdlZC1ieSB0YWcgZnJvbSBSb2IsIHRoYW5rcy4KPgo+IExpbmsgdG8gVjI6Cj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2NvdmVyLjE3NTQ4OTA2NzAuZ2l0Lnpob3ViaW5iaW5AbG9v
bmdzb24uY24vCj4KPiBWMjoKPiBQYXRjaCAoNS84KToKPiAgIC0gQWRkIEFja2VkLWJ5IHRhZyBm
cm9tIFJvYiwgdGhhbmtzOwo+IFBhdGNoICg3LzgpOgo+ICAgLSBVcGRhdGUgcmVnLW5hbWVzIGF0
dHJpYnV0ZSBkZXNjcmlwdGlvbi4KPgo+IExpbmsgdG8gVjE6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsL2NvdmVyLjE3NTMxNjYwOTYuZ2l0Lnpob3ViaW5iaW5AbG9vbmdzb24uY24vCj4K
PiBCaW5iaW4gWmhvdSAoNik6Cj4gICBtdGQ6IHJhd25hbmQ6IGxvb25nc29uMTogUmVuYW1lIHRo
ZSBwcmVmaXggZnJvbSBsczF4IHRvIGxvb25nc29uCj4gICBtdGQ6IHJhd25hbmQ6IGxvb25nc29u
OiBBZGQgbmFuZCBjaGlwIHNlbGVjdCBzdXBwb3J0Cj4gICBkdC1iaW5kaW5nczogbXRkOiBsb29u
Z3NvbixsczFiLW5hbmQtY29udHJvbGxlcjogRG9jdW1lbnQgdGhlCj4gICAgIExvb25nc29uLTJL
MDUwMCBOQU5EIGNvbnRyb2xsZXIKPiAgIG10ZDogcmF3bmFuZDogbG9vbmdzb246IEFkZCBMb29u
Z3Nvbi0ySzA1MDAgTkFORCBjb250cm9sbGVyIHN1cHBvcnQKPiAgIGR0LWJpbmRpbmdzOiBtdGQ6
IGxvb25nc29uLGxzMWItbmFuZC1jb250cm9sbGVyOiBEb2N1bWVudCB0aGUKPiAgICAgTG9vbmdz
b24tMksxMDAwIE5BTkQgY29udHJvbGxlcgo+ICAgbXRkOiByYXduYW5kOiBsb29uZ3NvbjogQWRk
IExvb25nc29uLTJLMTAwMCBOQU5EIGNvbnRyb2xsZXIgc3VwcG9ydAo+Cj4gS2VndWFuZyBaaGFu
ZyAoMSk6Cj4gICBtdGQ6IHJhd25hbmQ6IGxvb25nc29uOiBBZGQgNi1ieXRlIE5BTkQgSUQgcmVh
ZGluZyBzdXBwb3J0Cj4KPiAgLi4uL210ZC9sb29uZ3NvbixsczFiLW5hbmQtY29udHJvbGxlci55
YW1sICAgIHwgICA1NiArLQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgICAyICstCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcgICAgICAg
ICAgICAgICAgICB8ICAgIDggKy0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgIHwgICAgMiArLQo+ICAuLi4vbXRkL25hbmQvcmF3L2xvb25nc29uLW5hbmQt
Y29udHJvbGxlci5jICAgfCAxMDI0ICsrKysrKysrKysrKysrKysrCj4gIC4uLi9tdGQvbmFuZC9y
YXcvbG9vbmdzb24xLW5hbmQtY29udHJvbGxlci5jICB8ICA4MzYgLS0tLS0tLS0tLS0tLS0KPiAg
NiBmaWxlcyBjaGFuZ2VkLCAxMDgzIGluc2VydGlvbnMoKyksIDg0NSBkZWxldGlvbnMoLSkKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRkL25hbmQvcmF3L2xvb25nc29uLW5hbmQtY29u
dHJvbGxlci5jCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL210ZC9uYW5kL3Jhdy9sb29u
Z3NvbjEtbmFuZC1jb250cm9sbGVyLmMKPgo+Cj4gYmFzZS1jb21taXQ6IGM5ZjYyNTY0MjUyYzIx
ZDczOWE1MDAzZTliMmQ2YWQwODI4YWE3YmQKPiAtLQo+IDIuNDcuMwo+CgoKLS0gCkJlc3QgcmVn
YXJkcywKCktlZ3VhbmcgWmhhbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
