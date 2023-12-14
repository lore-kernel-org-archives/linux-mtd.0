Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48B7C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Dec 2023 21:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPJ/zUqnlASzth0IvYrs7i1nvjVUZqdzgPsZPygOJwY=; b=JE30wTmNa65OLo
	bsq3KaiLo9a+3Gqi8RE1TDA8POweIU9kczNymxaodn2mZsYnar9FIphUw+BSOL3Uk61sOKBz7z9Jm
	wa0voSw03t5KlhtC/R6LfqF8Ix73NzgNIbO1JErori8mUDQUoDXAAYTIcHGUML5ytHiRLTm8ITwH0
	DrC+6U4YKxcuB73BlxKjE3Sqx4GwG4iHEKqbCXUjO7mLb9RLBq0Uf6291OX8v4GoRVwA3c4Qjotx0
	8JnzU54sygKo+oHbkMO3BIrjnRlYaXM12BtD1VGI3QS3955iT6fQ/Bo7YaZqTo9NbYImwUGrMceg7
	egJJCYtlu1e/FS4bsCdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDsxj-001J1x-0s;
	Thu, 14 Dec 2023 21:09:43 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDsxf-001J1X-1Y
	for linux-mtd@lists.infradead.org;
	Thu, 14 Dec 2023 21:09:41 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a1db99cd1b2so2350566b.2
        for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2023 13:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702588176; x=1703192976; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnjPB6iX18JgpGdFMBMYrxpteo2U43QjbY9/lo9Je7Y=;
        b=kE3BmV52kk1asUbGbyw+17YVg6xJ9IK8Yna7c2RVkUZbhhzWsDlGcdPd2J1l/cuSVc
         zGETZnGoOxReIM/vmwQ+x5qdSY9M7AOs9aE8BlOGepnB3ZecAO9rl3rvZMsDFN/lT/bT
         U/K44/9nm/mYm/gGTDfLAWMW9kMJHC9UWbSzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702588176; x=1703192976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnjPB6iX18JgpGdFMBMYrxpteo2U43QjbY9/lo9Je7Y=;
        b=b+dflLAClv6HjbxVaEp412Gg46Hx5fVs0ljKSJGRlu2dTbRHHyiravypU4/8knRuz5
         /Rb08Nm1V4BxmjgTJofd+7gWOhNJcDaes5GUYX7iiwP8rrzpzqkKnDVQWdfGoAp4oZRK
         FX+vWmoEH9NEyg+B4NJteblvwK3hKp7hlpL+g5ZKUv+t8xXYyTJIl47fveZxxW7LhXVn
         UMbSBjcyIhn24COoUC9cjgXi47gbJa8TcW1lquvXw22TgeT+96oPBvFmnvsksBwyvQg4
         u8MgGTM0T00FdkpbQZPHJf/52Vdr7o+81fwLyD+FoJwLHhcTGTaNfULDXvbq2KFh86V9
         umwQ==
X-Gm-Message-State: AOJu0YzYtfZktffFnYuIrVXjA4/SdeoX9w83QkIchFIcMjvgJOy76Wu/
	207WvEEZ6nDSDI8WtKmZqiaBq63k2kt0NaPl5RbKFQ==
X-Google-Smtp-Source: AGHT+IE1mZhqGInPUAvje+k24w89h1v23G78AX9kBt06f8sNc/raFxf+pFaK2GPm69Hxyl/NeGszL+XSJBb5CtBIqnE=
X-Received: by 2002:a17:907:2d12:b0:a19:9b79:8b45 with SMTP id
 gs18-20020a1709072d1200b00a199b798b45mr5234161ejc.86.1702588175444; Thu, 14
 Dec 2023 13:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20231116172859.393744-1-sjg@chromium.org> <20231208150042.GA1278773-robh@kernel.org>
 <CAPnjgZ2i4gvgiUeHPOfHuOdBooV4e=QQEq6iMo0JbDwOS6dCwA@mail.gmail.com>
 <CAL_Jsq+xMZ8yz4H9D59uCSyX4h5W+4ruGF++=wVA=msXz+Y01A@mail.gmail.com>
 <CAPnjgZ1uW8T6woXSqFUNm301=W3zBYOrADREkrz=DuwSW87qZg@mail.gmail.com> <20231214172702.GA617226-robh@kernel.org>
In-Reply-To: <20231214172702.GA617226-robh@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 14 Dec 2023 14:09:24 -0700
Message-ID: <CAPnjgZ2oJSGPO91Y_aLbe+v250WFrND4n3T0mOvhERYidVu=eQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman compatible
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Michael Walle <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_130939_816338_4686A099 
X-CRM114-Status: GOOD (  36.32  )
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

SGkgUm9iLAoKT24gVGh1LCAxNCBEZWMgMjAyMyBhdCAxMDoyNywgUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIERlYyAwOCwgMjAyMyBhdCAwMzo1ODoxMFBN
IC0wNzAwLCBTaW1vbiBHbGFzcyB3cm90ZToKPiA+IEhpIFJvYiwKPiA+Cj4gPiBPbiBGcmksIDgg
RGVjIDIwMjMgYXQgMTQ6NTYsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4gPgo+ID4gPiBPbiBGcmksIERlYyA4LCAyMDIzIGF0IDExOjQ34oCvQU0gU2ltb24gR2xhc3Mg
PHNqZ0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSGkgUm9iLAo+ID4gPiA+
Cj4gPiA+ID4gT24gRnJpLCA4IERlYyAyMDIzIGF0IDA4OjAwLCBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBUaHUsIE5vdiAxNiwgMjAy
MyBhdCAxMDoyODo1MEFNIC0wNzAwLCBTaW1vbiBHbGFzcyB3cm90ZToKPiA+ID4gPiA+ID4gQWRk
IGEgY29tcGF0aWJsZSBzdHJpbmcgZm9yIGJpbm1hbiwgc28gd2UgY2FuIGV4dGVuZCBmaXhlZC1w
YXJ0aXRpb25zCj4gPiA+ID4gPiA+IGluIHZhcmlvdXMgd2F5cy4KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4gPiA+
ID4gPiA+IC0tLQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAobm8gY2hhbmdlcyBzaW5jZSB2NSkK
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2NToKPiA+ID4gPiA+ID4gLSBBZGQg
I2FkZHJlc3Mvc2l6ZS1jZWxscyBhbmQgcGFydGVyblByb3BlcnRpZXMKPiA+ID4gPiA+ID4gLSBE
cm9wICRyZWYgdG8gZml4ZWQtcGFydGl0aW9ucy55YW1sCj4gPiA+ID4gPiA+IC0gRHJvcCAnc2Vs
ZWN0OiBmYWxzZScKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+ID4g
PiA+ID4gLSBDaGFuZ2Ugc3ViamVjdCBsaW5lCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IENoYW5n
ZXMgaW4gdjM6Cj4gPiA+ID4gPiA+IC0gRHJvcCBmaXhlZC1wYXJ0aXRpb24gYWRkaXRpb25hbCBj
b21wYXRpYmxlIHN0cmluZwo+ID4gPiA+ID4gPiAtIERyb3AgZml4ZWQtcGFydGl0aW9ucyBmcm9t
IHRoZSBleGFtcGxlCj4gPiA+ID4gPiA+IC0gTWVudGlvbiB1c2Ugb2YgY29tcGF0aWJsZSBpbnN0
ZWFkIG9mIGxhYmVsCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiA+
ID4gPiA+IC0gRHJvcCBtZW50aW9uIG9mICdlbmhhbmNlZCBmZWF0dXJlcycgaW4gZml4ZWQtcGFy
dGl0aW9ucy55YW1sCj4gPiA+ID4gPiA+IC0gTWVudGlvbiBCaW5tYW4gaW5wdXQgYW5kIG91dHB1
dCBwcm9wZXJ0aWVzCj4gPiA+ID4gPiA+IC0gVXNlIHBsYWluIHBhcnRpdGlvbkB4eHggZm9yIHRo
ZSBub2RlIG5hbWUKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gIC4uLi9iaW5kaW5ncy9tdGQvcGFy
dGl0aW9ucy9iaW5tYW4ueWFtbCAgICAgICB8IDY4ICsrKysrKysrKysrKysrKysrKysKPiA+ID4g
PiA+ID4gIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb25zLnlhbWwgICB8ICAx
ICsKPiA+ID4gPiA+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICA1ICsrCj4gPiA+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDc0IGluc2VydGlvbnMo
KykKPiA+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlhbWwKPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cGFydGl0aW9ucy9iaW5tYW4ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcGFydGl0aW9ucy9iaW5tYW4ueWFtbAo+ID4gPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+ID4gPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjMyOTIxNzU1MGE5OAo+ID4gPiA+
ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4ueWFtbAo+ID4gPiA+ID4gPiBAQCAt
MCwwICsxLDY4IEBACj4gPiA+ID4gPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4gPiA+ID4gPiA+ICsjIENvcHlyaWdodCAyMDIzIEdvb2ds
ZSBMTEMKPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArJVlBTUwgMS4yCj4gPiA+ID4gPiA+ICst
LS0KPiA+ID4gPiA+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL3Bh
cnRpdGlvbnMvYmlubWFuLnlhbWwjCj4gPiA+ID4gPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4g
PiArdGl0bGU6IEJpbm1hbiBmaXJtd2FyZSBsYXlvdXQKPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4g
PiArbWFpbnRhaW5lcnM6Cj4gPiA+ID4gPiA+ICsgIC0gU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1
bS5vcmc+Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4gPiA+ID4g
PiA+ICsgIFRoZSBiaW5tYW4gbm9kZSBwcm92aWRlcyBhIGxheW91dCBmb3IgZmlybXdhcmUsIHVz
ZWQgd2hlbiBwYWNrYWdpbmcgZmlybXdhcmUKPiA+ID4gPiA+ID4gKyAgZnJvbSBtdWx0aXBsZSBw
cm9qZWN0cy4gSXQgaXMgYmFzZWQgb24gZml4ZWQtcGFydGl0aW9ucywgd2l0aCBzb21lCj4gPiA+
ID4gPiA+ICsgIGV4dGVuc2lvbnMsIGJ1dCB1c2VzICdjb21wYXRpYmxlJyB0byBpbmRpY2F0ZSB0
aGUgY29udGVudHMgb2YgdGhlIG5vZGUsIHRvCj4gPiA+ID4gPiA+ICsgIGF2b2lkIHBlcnR1cmJp
bmcgb3IgY29uZnVzaW5nIGV4aXN0aW5nIGluc3RhbGxhdGlvbnMgd2hpY2ggdXNlICdsYWJlbCcg
Zm9yIGEKPiA+ID4gPiA+ID4gKyAgcGFydGljdWxhciBwdXJwb3NlLgo+ID4gPiA+ID4gPiArCj4g
PiA+ID4gPiA+ICsgIEJpbm1hbiBzdXBwb3J0cyBwcm9wZXJ0aWVzIHVzZWQgYXMgaW5wdXRzIHRv
IHRoZSBmaXJtd2FyZS1wYWNrYWdpbmcgcHJvY2VzcywKPiA+ID4gPiA+ID4gKyAgc3VjaCBhcyB0
aG9zZSB3aGljaCBjb250cm9sIGFsaWdubWVudCBvZiBwYXJ0aXRpb25zLiBUaGlzIGJpbmRpbmcg
YWRkcmVzc2VzCj4gPiA+ID4gPiA+ICsgIHRoZXNlICdpbnB1dCcgcHJvcGVydGllcy4gRm9yIGV4
YW1wbGUsIGl0IGlzIGNvbW1vbiBmb3IgdGhlICdyZWcnIHByb3BlcnR5Cj4gPiA+ID4gPiA+ICsg
IChhbiAnb3V0cHV0JyBwcm9wZXJ0eSkgdG8gYmUgc2V0IGJ5IEJpbm1hbiwgYmFzZWQgb24gdGhl
IGFsaWdubWVudCByZXF1ZXN0ZWQKPiA+ID4gPiA+ID4gKyAgaW4gdGhlIGlucHV0Lgo+ID4gPiA+
ID4gPiArCj4gPiA+ID4gPiA+ICsgIE9uY2UgcHJvY2Vzc2luZyBpcyBjb21wbGV0ZSwgaW5wdXQg
cHJvcGVydGllcyBoYXZlIG1vc3RseSBzZXJ2ZWQgdGhlaXIKPiA+ID4gPiA+ID4gKyAgcHVycG9z
ZSwgYXQgbGVhc3QgdW50aWwgdGhlIGZpcm13YXJlIGlzIHJlcGFja2VkIGxhdGVyLCBlLmcuIGR1
ZSB0byBhCj4gPiA+ID4gPiA+ICsgIGZpcm13YXJlIHVwZGF0ZS4gVGhlICdmaXhlZC1wYXJ0aXRp
b25zJyBiaW5kaW5nIHNob3VsZCBwcm92aWRlIGVub3VnaAo+ID4gPiA+ID4gPiArICBpbmZvcm1h
dGlvbiB0byByZWFkIHRoZSBmaXJtd2FyZSBhdCBydW50aW1lLCBpbmNsdWRpbmcgZGVjb21wcmVz
c2lvbiBpZgo+ID4gPiA+ID4gPiArICBuZWVkZWQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSG93IGlz
IHRoaXMgZ29pbmcgdG8gd29yayBleGFjdGx5PyBiaW5tYW4gcmVhZHMgdGhlc2Ugbm9kZXMgYW5k
IHRoZW4KPiA+ID4gPiA+IHdyaXRlcyBvdXQgJ2ZpeGVkLXBhcnRpdGlvbnMnIG5vZGVzLiBCdXQg
dGhlbiB5b3UndmUgbG9zdCB0aGUgYmlubWFuCj4gPiA+ID4gPiBzcGVjaWZjIHBhcnRzIG5lZWRl
ZCBmb3IgcmVwYWNraW5nLgo+ID4gPiA+Cj4gPiA+ID4gTm8sIHRoZXkgYXJlIHRoZSBzYW1lIG5v
ZGUuIEkgZG8gd2FudCB0aGUgZXh0cmEgaW5mb3JtYXRpb24gdG8gc3RpY2sKPiA+ID4gPiBhcm91
bmQuIFNvIGxvbmcgYXMgaXQgaXMgY29tcGF0aWJsZSB3aXRoIGZpeGVkLXBhcnRpdGlvbiBhcyB3
ZWxsLCB0aGlzCj4gPiA+ID4gc2hvdWxkIHdvcmsgT0suCj4gPiA+Cj4gPiA+IEhvdyBjYW4gaXQg
YmUgYm90aD8gVGhlIHBhcnRpdGlvbnMgbm9kZSBjb21wYXRpYmxlIGNhbiBiZSBlaXRoZXIKPiA+
ID4gJ2ZpeGVkLXBhcnRpdGlvbnMnIG9yICdiaW5tYW4nLgo+ID4KPiA+IENhbiB3ZSBub3QgYWxs
b3cgaXQgdG8gYmUgYm90aD8gSSBoYXZlIHRyaWVkIHRvIGFkanVzdCB0aGluZ3MgaW4KPiA+IHJl
c3BvbnNlIHRvIGZlZWRiYWNrIGJ1dCBwZXJoYXBzIHRoZSBmZWVkYmFjayB3YXMgbGVhZGluZyBt
ZSBkb3duIHRoZQo+ID4gd3JvbmcgcGF0aD8KPgo+IFN1cmUsIGJ1dCB0aGVuIHRoZSBzY2hlbWEg
aGFzIHRvIGFuZCB0aGF0IG1lYW5zIGV4dGVuZGluZwo+IGZpeGVkLXBhcnRpdGlvbnMuCgpDYW4g
d2UgY3Jvc3MgdGhhdCBicmlkZ2UgbGF0ZXI/IFRoZXJlIG1pZ2h0IGJlIHJlc2lzdGFuY2UgdG8g
aXQuIEknbQpub3Qgc3VyZS4gRm9yIG5vdywgcGVyaGFwcyBqdXN0IGEgYmlubWFuIGNvbXBhdGli
bGUgd29ya3Mgd2VsbCBlbm91Z2gKdG8gbWFrZSBwcm9ncmVzcy4KClJlZ2FyZHMsClNpbW9uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
