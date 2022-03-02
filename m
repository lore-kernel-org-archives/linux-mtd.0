Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E08C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 22:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPpCJMr1EPob54xxS2LLfRZjDcOonqIFIf/FG5XPHjo=; b=PQb/DxolaWyhxO
	8Pp0r4MuXLGfSoFLzXs+DAgD9ZW4KR9m46g+UyCd2NLzLFQD92SPtCDHzhPgO82nXQ2+UHrZcz9vT
	D23K45jIDavHVLdEJy0gOvb2pjSYp+Nxdz8BtCrTCW2ZpWlALqZ/tXVs95MtdjiXThFjv06+h3PjL
	6nTp4j2H7fEbpvxFXwWrTx8kysEyXTrIWeQOHIxWeVS6fFnEwLmd2+LM4uiBy+zZnn3zSruu9I+v3
	KS9pyKuOAutkzkt9JObnm86BhxE/yg15YbYzKtgV1KLgMvsHjs7NlTH0S/AmWg8xWZYLAc+oZwwle
	kmBTcLLoANjHHc/KgnPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPXL6-004X7k-SR; Wed, 02 Mar 2022 22:20:56 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPXL3-004X6M-2M; Wed, 02 Mar 2022 22:20:54 +0000
Received: by mail-qk1-x72d.google.com with SMTP id n185so2540670qke.5;
 Wed, 02 Mar 2022 14:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IwOBwMpi2OwEzG0VtigJWsM6dutoMlGx5jRzY5Yz/Vc=;
 b=MtnSgvQxlGt5TGIFQMfRkRf4KK1L85s9MA4ZXLuK105X6YoXUOfkr173xoepXU0fiu
 UuhHi/gN1IKGbUa02Oi4DiEVaJZ/yqhWE6k0hILSueUBtPjBk8tj7hvZICj1J1mOVdmZ
 oUIkmayyOSwIO+lHl6kgMI1DLJJXj1VZG2GzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IwOBwMpi2OwEzG0VtigJWsM6dutoMlGx5jRzY5Yz/Vc=;
 b=qjaM3B7rsLvznHDn9mfw43oeM//5+NydJHRirc3O8s5A4+TGdmY+pbNVPnuUsWNApY
 saXIo80vlV4/sFhUvc8EUmY3oZCC/kzQKKxZdMluRzEN6F/mD9yPFH/m862YEabHnTYs
 2caDOfW3m7ATzeJHqZMxhj+ROVsABbbSQa2LeIEu0k2Xu+pszA78ySzjyodA4AlNK7Tx
 FEhGRwbzgejGD/0CRGiUPlpK6WV0fsQI10pTJoIzXyHbkOcLo8+dyUodSWXnzJ9vEAYf
 8wQJSvoVLSVUYK19tYI+0sWn+WQc6ULnwM/8PxT1Nr+b4PYPDGGbae+AXhYlnAxv7U5L
 sKIw==
X-Gm-Message-State: AOAM531t3JNGFly3gi9FRtZ7K54egUerC2cTGqaptRUwB/btdLv+WnTr
 eC3hPyOrNmDltvVSgXsXs6lyje53B6ukE3ZLDM4=
X-Google-Smtp-Source: ABdhPJxvmmE3gaxqf1AN8AAcq15J2+/3h1dIbI7rXUBxAE1ecVlQbf15Jy/H6IC8/REhnKs2t2BL89C3wdGw7Mg0B6A=
X-Received: by 2002:a05:620a:2fc:b0:649:a4e:c430 with SMTP id
 a28-20020a05620a02fc00b006490a4ec430mr17818002qko.347.1646259651990; Wed, 02
 Mar 2022 14:20:51 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-4-clg@kaod.org>
In-Reply-To: <20220302173114.927476-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 22:20:40 +0000
Message-ID: <CACPK8XcWZ6jQEo4-78fMrSxqZW5Cc8ecsNf+j5X7av-HbJwMKg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: linux-spi@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, 
 Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_142053_152613_B9EAE2E6 
X-CRM114-Status: GOOD (  19.61  )
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

T24gV2VkLCAyIE1hciAyMDIyIGF0IDE3OjMxLCBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qu
b3JnPiB3cm90ZToKPgo+IFRoZSAiaW50ZXJydXB0IiBwcm9wZXJ0eSBpcyBvcHRpb25hbCBiZWNh
dXNlIGl0IGlzIG9ubHkgbmVjZXNzYXJ5IGZvcgo+IGNvbnRyb2xsZXJzIHN1cHBvcnRpbmcgRE1B
cyAoTm90IGltcGxlbWVudGVkIHlldCBpbiB0aGUgbmV3IGRyaXZlcikuCj4KPiBDYzogQ2hpbi1U
aW5nIEt1byA8Y2hpbi10aW5nX2t1b0Bhc3BlZWR0ZWNoLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBD
w6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgoKUmV2aWV3ZWQtYnk6IEpvZWwgU3Rhbmxl
eSA8am9lbEBqbXMuaWQuYXU+Cgo+IC0tLQo+ICAuLi4vYmluZGluZ3Mvc3BpL2FzcGVlZCxhc3Qy
NjAwLWZtYy55YW1sICAgICAgfCA5MCArKysrKysrKysrKysrKysrKysrCj4gIE1BSU5UQUlORVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA5ICsrCj4gIDIgZmlsZXMgY2hh
bmdlZCwgOTkgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hc3BlZWQsYXN0MjYwMC1mbWMueWFtbAo+Cj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYXNwZWVkLGFz
dDI2MDAtZm1jLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2Fz
cGVlZCxhc3QyNjAwLWZtYy55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMDAwMDAuLjAyODlhNGY1MjE5Ngo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FzcGVlZCxhc3QyNjAwLWZtYy55YW1sCj4gQEAg
LTAsMCArMSw5MCBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBC
U0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwjCj4gKyRzY2hlbWE6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6
IEFzcGVlZCBTTUMgY29udHJvbGxlcnMgYmluZGluZ3MKPiArCj4gK21haW50YWluZXJzOgo+ICsg
IC0gQ2hpbi1UaW5nIEt1byA8Y2hpbi10aW5nX2t1b0Bhc3BlZWR0ZWNoLmNvbT4KPiArICAtIEPD
qWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Cj4gKwo+ICtkZXNjcmlwdGlvbjogfAo+ICsg
IFRoaXMgYmluZGluZyBkZXNjcmliZXMgdGhlIEFzcGVlZCBTdGF0aWMgTWVtb3J5IENvbnRyb2xs
ZXJzIChGTUMgYW5kCj4gKyAgU1BJKSBvZiB0aGUgQVNUMjQwMCwgQVNUMjUwMCBhbmQgQVNUMjYw
MCBTT0NzLgo+ICsKPiArYWxsT2Y6Cj4gKyAgLSAkcmVmOiAic3BpLWNvbnRyb2xsZXIueWFtbCMi
Cj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBlbnVtOgo+ICsgICAg
ICAtIGFzcGVlZCxhc3QyNjAwLWZtYwo+ICsgICAgICAtIGFzcGVlZCxhc3QyNjAwLXNwaQo+ICsg
ICAgICAtIGFzcGVlZCxhc3QyNTAwLWZtYwo+ICsgICAgICAtIGFzcGVlZCxhc3QyNTAwLXNwaQo+
ICsgICAgICAtIGFzcGVlZCxhc3QyNDAwLWZtYwo+ICsgICAgICAtIGFzcGVlZCxhc3QyNDAwLXNw
aQo+ICsKPiArICByZWc6Cj4gKyAgICBpdGVtczoKPiArICAgICAgLSBkZXNjcmlwdGlvbjogcmVn
aXN0ZXJzCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IG1lbW9yeSBtYXBwaW5nCj4gKwo+ICsgIGNs
b2NrczoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGludGVycnVwdHM6Cj4gKyAgICBtYXhJ
dGVtczogMQo+ICsKPiArcGF0dGVyblByb3BlcnRpZXM6Cj4gKyAgIkBbMC05YS1mXSsiOgo+ICsg
ICAgdHlwZTogb2JqZWN0Cj4gKwo+ICsgICAgcHJvcGVydGllczoKPiArICAgICAgc3BpLXJ4LWJ1
cy13aWR0aDoKPiArICAgICAgICBlbnVtOiBbMSwgMiwgNF0KPiArCj4gKyAgICByZXF1aXJlZDoK
PiArICAgICAgLSByZWcKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+ICsgIC0g
cmVnCj4gKyAgLSBjbG9ja3MKPiArCj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiAr
Cj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVy
cnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9p
bnRlcnJ1cHQtY29udHJvbGxlci9hc3BlZWQtc2N1LWljLmg+Cj4gKyAgICAjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvY2xvY2svYXN0MjYwMC1jbG9jay5oPgo+ICsKPiArICAgIHNwaUAxZTYyMDAwMCB7
Cj4gKyAgICAgICAgcmVnID0gPDB4MWU2MjAwMDAgMHhjND4sIDwweDIwMDAwMDAwIDB4MTAwMDAw
MDA+Owo+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsgICAgICAgICNzaXplLWNl
bGxzID0gPDA+Owo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI2MDAtZm1jIjsK
PiArICAgICAgICBjbG9ja3MgPSA8JnN5c2NvbiBBU1BFRURfQ0xLX0FIQj47Cj4gKyAgICAgICAg
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDM5IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICsgICAgICAg
IGZsYXNoQDAgewo+ICsgICAgICAgICAgICAgICAgcmVnID0gPCAwID47Cj4gKyAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwo+ICsgICAgICAgICAgICAgICAgc3Bp
LW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+Owo+ICsgICAgICAgICAgICAgICAgc3BpLXJ4LWJ1
cy13aWR0aCA9IDwyPjsKPiArICAgICAgICB9Owo+ICsgICAgICAgIGZsYXNoQDEgewo+ICsgICAg
ICAgICAgICAgICAgcmVnID0gPCAxID47Cj4gKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
ImplZGVjLHNwaS1ub3IiOwo+ICsgICAgICAgICAgICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8
NTAwMDAwMDA+Owo+ICsgICAgICAgICAgICAgICAgc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsKPiAr
ICAgICAgICB9Owo+ICsgICAgICAgIGZsYXNoQDIgewo+ICsgICAgICAgICAgICAgICAgcmVnID0g
PCAyID47Cj4gKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwo+
ICsgICAgICAgICAgICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+Owo+ICsgICAg
ICAgICAgICAgICAgc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsKPiArICAgICAgICB9Owo+ICsgICAg
fTsKPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4IDQxNzUx
MDNlOTI4ZC4uZjVhYjc3NTQ4ZWY2IDEwMDY0NAo+IC0tLSBhL01BSU5UQUlORVJTCj4gKysrIGIv
TUFJTlRBSU5FUlMKPiBAQCAtMjkyNSw2ICsyOTI1LDE1IEBAIFM6ICAgICAgIE1haW50YWluZWQK
PiAgRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvYXNwZWVkLHNk
aGNpLnlhbWwKPiAgRjogICAgIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtYXNwZWVkKgo+Cj4g
K0FTUEVFRCBTTUMgU1BJIERSSVZFUgo+ICtNOiAgICAgQ2hpbi1UaW5nIEt1byA8Y2hpbi10aW5n
X2t1b0Bhc3BlZWR0ZWNoLmNvbT4KPiArTTogICAgIEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2Fv
ZC5vcmc+Cj4gK0w6ICAgICBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZyAobW9kZXJhdGVk
IGZvciBub24tc3Vic2NyaWJlcnMpCj4gK0w6ICAgICBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcg
KG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNjcmliZXJzKQo+ICtMOiAgICAgbGludXgtc3BpQHZnZXIu
a2VybmVsLm9yZwo+ICtTOiAgICAgTWFpbnRhaW5lZAo+ICtGOiAgICAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hc3BlZWQsYXN0MjYwMC1mbWMueWFtbAo+ICsKPiAgQVNQ
RUVEIFZJREVPIEVOR0lORSBEUklWRVIKPiAgTTogICAgIEVkZGllIEphbWVzIDxlYWphbWVzQGxp
bnV4LmlibS5jb20+Cj4gIEw6ICAgICBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiAtLQo+
IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
