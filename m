Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E3CC48286
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Feb 2024 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ej7eXCkxjWL5IZ4p4wnqQIQaJMR3R1t6bMijT+xCfaY=; b=lPqfcOUcfb51QC
	w4NlUZj0YRDnAWnrz4S+fBASOXc+ItX+IMEq2ggzOybytAubCR24M9dap1pLaMphn0pokSVBrzwof
	90J3e6pmmg+EpDKnMFeaztXogNzA1FNDvimevoW9nh8L6Z4CHk7lSpzA5eKByb69pTyhJ9oF2Ns/v
	h1gC/FXx/vpVMEKJqRb3hJ1CVajIDHCWhlzON83lgtr/HWKxliHSp78tmvUXv+oIhpfe1KeXEhWGl
	UjC8Kr9hWCqoXSYF28FzBZjZwWvhPjIvTc2KK2hZqKcTC6OvRqcPvSixrWIsWARQuMzL2yU/DNjO9
	lAEBx2WTcAqPMPn0vwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWbI8-00000000iAQ-1JfJ;
	Sun, 04 Feb 2024 12:08:08 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWbI4-00000000i8Z-1SIi
	for linux-mtd@lists.infradead.org;
	Sun, 04 Feb 2024 12:08:06 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-68c3a14c6e7so17402066d6.1
        for <linux-mtd@lists.infradead.org>; Sun, 04 Feb 2024 04:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707048469; x=1707653269; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkBatnrVNJ4bM1n4KEdwNfQ5QXC1P1y/tW0B8XR/uz4=;
        b=dEiEi/FRnT1TE/Z03A00/apDMBFduihi/Q7vW+ZOPX9g+iv32XW77OKsXsZ4t3SCHU
         2lml8x+snX3V3AAAS5+tAFYfmoUbXYiSjOfqEu9YdqVLL/+FE6/P25hyRO4/gMd7s9CQ
         Oe+Awifo6JHzLO2c8X9dZhkqSYdcLecxWJpLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707048469; x=1707653269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkBatnrVNJ4bM1n4KEdwNfQ5QXC1P1y/tW0B8XR/uz4=;
        b=ZoLeAZZcovFu7XreV/JKF3npdIEk5QdsUndxuzrDnItjh8AhjMAz/mMJQTR/kO0r3j
         TUQM5ofy2YcBDGuulVyVXaEIw0J4BDiom39wwYF3wXdF9IsOgr6hxHXJLmLDKlBeyRvh
         jCjUDPZQu5DRVQX8C5/+h9FRSBKGGsjepqiDK1Zj8NZ/Qc83xcooIQQ9XcxCFEwe3kOQ
         6JRzdD+N2//yzaQJEhtgAOJpuxBQhjmwCdtLhuFm7gv3UGLf5Xsv1C4CgQAi6sRI6A6Q
         ImLoJcOUpUNOmBnojtyIKxqqzWPJx3zoZkP+ae0JiHE6QWkbnAucTwjougjP485OlOTi
         k4lw==
X-Gm-Message-State: AOJu0YxPkqMkWu7PCkOlvYtClIP0rafVtGtr0KFZHhIGgfmwUd358rh7
	xI6ugUqxtQKrUeN8W0UWDENAt4iLeyVMDpHV54Uwb6WFehJkSBz08Jeme+8hMOuC9VhoxxYdcUA
	HrOI+xS2iu3GicyVbvzeYbMmEIN32pGaTPPXi
X-Google-Smtp-Source: AGHT+IF8djEbUUZ1vMiKh3Q9Kt4JETg6OWQ/ChSwZjNA5IB/5h0hIaJU+P7YJgYYkYLpQ/EyD7NjClc7LDXpcSX+Qz8=
X-Received: by 2002:a0c:e441:0:b0:68c:9621:af25 with SMTP id
 d1-20020a0ce441000000b0068c9621af25mr2638553qvm.10.1707048469559; Sun, 04 Feb
 2024 04:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20231116172859.393744-1-sjg@chromium.org> <20231208150042.GA1278773-robh@kernel.org>
 <CAPnjgZ2i4gvgiUeHPOfHuOdBooV4e=QQEq6iMo0JbDwOS6dCwA@mail.gmail.com>
 <CAL_Jsq+xMZ8yz4H9D59uCSyX4h5W+4ruGF++=wVA=msXz+Y01A@mail.gmail.com>
 <CAPnjgZ1uW8T6woXSqFUNm301=W3zBYOrADREkrz=DuwSW87qZg@mail.gmail.com>
 <20231214172702.GA617226-robh@kernel.org> <CAPnjgZ2oJSGPO91Y_aLbe+v250WFrND4n3T0mOvhERYidVu=eQ@mail.gmail.com>
 <CAFLszTizRRVbRO6_ygE2X-Lp5dENWSc4uMGL5GPJAFGAbRdCyQ@mail.gmail.com> <CAL_Jsq+j7_KZtQ2ENq9+vsw0LOZF=spu293_G=AxOmBM+m_f-g@mail.gmail.com>
In-Reply-To: <CAL_Jsq+j7_KZtQ2ENq9+vsw0LOZF=spu293_G=AxOmBM+m_f-g@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 4 Feb 2024 05:07:38 -0700
Message-ID: <CAFLszTimaFw9sf=JKvQXG4fS6V_2T=2n+pfvYLCiuG1o+7cHPA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240204_040804_411902_2C0E76CF 
X-CRM114-Status: GOOD (  43.86  )
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

SGkgUm9iLAoKT24gV2VkLCAxNyBKYW4gMjAyNCBhdCAwODo1NiwgUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEphbiA0LCAyMDI0IGF0IDM6NTTigK9QTSBT
aW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGkgUm9iLAo+ID4K
PiA+IE9uIFRodSwgRGVjIDE0LCAyMDIzIGF0IDI6MDnigK9QTSBTaW1vbiBHbGFzcyA8c2pnQGNo
cm9taXVtLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIFJvYiwKPiA+ID4KPiA+ID4gT24gVGh1
LCAxNCBEZWMgMjAyMyBhdCAxMDoyNywgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBGcmksIERlYyAwOCwgMjAyMyBhdCAwMzo1ODoxMFBNIC0w
NzAwLCBTaW1vbiBHbGFzcyB3cm90ZToKPiA+ID4gPiA+IEhpIFJvYiwKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBPbiBGcmksIDggRGVjIDIwMjMgYXQgMTQ6NTYsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPbiBGcmksIERlYyA4LCAyMDIz
IGF0IDExOjQ34oCvQU0gU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSGkgUm9iLAo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gT24gRnJpLCA4IERlYyAyMDIzIGF0IDA4OjAwLCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBPbiBUaHUsIE5vdiAx
NiwgMjAyMyBhdCAxMDoyODo1MEFNIC0wNzAwLCBTaW1vbiBHbGFzcyB3cm90ZToKPiA+ID4gPiA+
ID4gPiA+ID4gQWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgZm9yIGJpbm1hbiwgc28gd2UgY2FuIGV4
dGVuZCBmaXhlZC1wYXJ0aXRpb25zCj4gPiA+ID4gPiA+ID4gPiA+IGluIHZhcmlvdXMgd2F5cy4K
PiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU2ltb24g
R2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4gPiA+ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiAobm8gY2hhbmdlcyBzaW5jZSB2NSkKPiA+ID4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2NToKPiA+ID4gPiA+ID4gPiA+
ID4gLSBBZGQgI2FkZHJlc3Mvc2l6ZS1jZWxscyBhbmQgcGFydGVyblByb3BlcnRpZXMKPiA+ID4g
PiA+ID4gPiA+ID4gLSBEcm9wICRyZWYgdG8gZml4ZWQtcGFydGl0aW9ucy55YW1sCj4gPiA+ID4g
PiA+ID4gPiA+IC0gRHJvcCAnc2VsZWN0OiBmYWxzZScKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+ID4gPiA+ID4gPiA+ID4gLSBDaGFuZ2Ugc3Vi
amVjdCBsaW5lCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IENoYW5nZXMgaW4g
djM6Cj4gPiA+ID4gPiA+ID4gPiA+IC0gRHJvcCBmaXhlZC1wYXJ0aXRpb24gYWRkaXRpb25hbCBj
b21wYXRpYmxlIHN0cmluZwo+ID4gPiA+ID4gPiA+ID4gPiAtIERyb3AgZml4ZWQtcGFydGl0aW9u
cyBmcm9tIHRoZSBleGFtcGxlCj4gPiA+ID4gPiA+ID4gPiA+IC0gTWVudGlvbiB1c2Ugb2YgY29t
cGF0aWJsZSBpbnN0ZWFkIG9mIGxhYmVsCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
PiA+IENoYW5nZXMgaW4gdjI6Cj4gPiA+ID4gPiA+ID4gPiA+IC0gRHJvcCBtZW50aW9uIG9mICdl
bmhhbmNlZCBmZWF0dXJlcycgaW4gZml4ZWQtcGFydGl0aW9ucy55YW1sCj4gPiA+ID4gPiA+ID4g
PiA+IC0gTWVudGlvbiBCaW5tYW4gaW5wdXQgYW5kIG91dHB1dCBwcm9wZXJ0aWVzCj4gPiA+ID4g
PiA+ID4gPiA+IC0gVXNlIHBsYWluIHBhcnRpdGlvbkB4eHggZm9yIHRoZSBub2RlIG5hbWUKPiA+
ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0
aW9ucy9iaW5tYW4ueWFtbCAgICAgICB8IDY4ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+
ID4gPiA+ID4gIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb25zLnlhbWwgICB8
ICAxICsKPiA+ID4gPiA+ID4gPiA+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICA1ICsrCj4gPiA+ID4gPiA+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQs
IDc0IGluc2VydGlvbnMoKykKPiA+ID4gPiA+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlh
bWwKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4ueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4u
eWFtbAo+ID4gPiA+ID4gPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiA+ID4gPiA+
ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjMyOTIxNzU1MGE5OAo+ID4gPiA+ID4gPiA+ID4gPiAt
LS0gL2Rldi9udWxsCj4gPiA+ID4gPiA+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4ueWFtbAo+ID4gPiA+ID4gPiA+ID4g
PiBAQCAtMCwwICsxLDY4IEBACj4gPiA+ID4gPiA+ID4gPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4gPiA+ID4gPiA+ID4gPiA+ICsjIENv
cHlyaWdodCAyMDIzIEdvb2dsZSBMTEMKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+
ID4gPiArJVlBTUwgMS4yCj4gPiA+ID4gPiA+ID4gPiA+ICstLS0KPiA+ID4gPiA+ID4gPiA+ID4g
KyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL3BhcnRpdGlvbnMvYmlubWFu
LnlhbWwjCj4gPiA+ID4gPiA+ID4gPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+
ID4gPiArdGl0bGU6IEJpbm1hbiBmaXJtd2FyZSBsYXlvdXQKPiA+ID4gPiA+ID4gPiA+ID4gKwo+
ID4gPiA+ID4gPiA+ID4gPiArbWFpbnRhaW5lcnM6Cj4gPiA+ID4gPiA+ID4gPiA+ICsgIC0gU2lt
b24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+
ID4gPiA+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4gPiA+ID4gPiA+ID4gPiA+ICsgIFRoZSBiaW5tYW4g
bm9kZSBwcm92aWRlcyBhIGxheW91dCBmb3IgZmlybXdhcmUsIHVzZWQgd2hlbiBwYWNrYWdpbmcg
ZmlybXdhcmUKPiA+ID4gPiA+ID4gPiA+ID4gKyAgZnJvbSBtdWx0aXBsZSBwcm9qZWN0cy4gSXQg
aXMgYmFzZWQgb24gZml4ZWQtcGFydGl0aW9ucywgd2l0aCBzb21lCj4gPiA+ID4gPiA+ID4gPiA+
ICsgIGV4dGVuc2lvbnMsIGJ1dCB1c2VzICdjb21wYXRpYmxlJyB0byBpbmRpY2F0ZSB0aGUgY29u
dGVudHMgb2YgdGhlIG5vZGUsIHRvCj4gPiA+ID4gPiA+ID4gPiA+ICsgIGF2b2lkIHBlcnR1cmJp
bmcgb3IgY29uZnVzaW5nIGV4aXN0aW5nIGluc3RhbGxhdGlvbnMgd2hpY2ggdXNlICdsYWJlbCcg
Zm9yIGEKPiA+ID4gPiA+ID4gPiA+ID4gKyAgcGFydGljdWxhciBwdXJwb3NlLgo+ID4gPiA+ID4g
PiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ICsgIEJpbm1hbiBzdXBwb3J0cyBwcm9wZXJ0aWVz
IHVzZWQgYXMgaW5wdXRzIHRvIHRoZSBmaXJtd2FyZS1wYWNrYWdpbmcgcHJvY2VzcywKPiA+ID4g
PiA+ID4gPiA+ID4gKyAgc3VjaCBhcyB0aG9zZSB3aGljaCBjb250cm9sIGFsaWdubWVudCBvZiBw
YXJ0aXRpb25zLiBUaGlzIGJpbmRpbmcgYWRkcmVzc2VzCj4gPiA+ID4gPiA+ID4gPiA+ICsgIHRo
ZXNlICdpbnB1dCcgcHJvcGVydGllcy4gRm9yIGV4YW1wbGUsIGl0IGlzIGNvbW1vbiBmb3IgdGhl
ICdyZWcnIHByb3BlcnR5Cj4gPiA+ID4gPiA+ID4gPiA+ICsgIChhbiAnb3V0cHV0JyBwcm9wZXJ0
eSkgdG8gYmUgc2V0IGJ5IEJpbm1hbiwgYmFzZWQgb24gdGhlIGFsaWdubWVudCByZXF1ZXN0ZWQK
PiA+ID4gPiA+ID4gPiA+ID4gKyAgaW4gdGhlIGlucHV0Lgo+ID4gPiA+ID4gPiA+ID4gPiArCj4g
PiA+ID4gPiA+ID4gPiA+ICsgIE9uY2UgcHJvY2Vzc2luZyBpcyBjb21wbGV0ZSwgaW5wdXQgcHJv
cGVydGllcyBoYXZlIG1vc3RseSBzZXJ2ZWQgdGhlaXIKPiA+ID4gPiA+ID4gPiA+ID4gKyAgcHVy
cG9zZSwgYXQgbGVhc3QgdW50aWwgdGhlIGZpcm13YXJlIGlzIHJlcGFja2VkIGxhdGVyLCBlLmcu
IGR1ZSB0byBhCj4gPiA+ID4gPiA+ID4gPiA+ICsgIGZpcm13YXJlIHVwZGF0ZS4gVGhlICdmaXhl
ZC1wYXJ0aXRpb25zJyBiaW5kaW5nIHNob3VsZCBwcm92aWRlIGVub3VnaAo+ID4gPiA+ID4gPiA+
ID4gPiArICBpbmZvcm1hdGlvbiB0byByZWFkIHRoZSBmaXJtd2FyZSBhdCBydW50aW1lLCBpbmNs
dWRpbmcgZGVjb21wcmVzc2lvbiBpZgo+ID4gPiA+ID4gPiA+ID4gPiArICBuZWVkZWQuCj4gPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gSG93IGlzIHRoaXMgZ29pbmcgdG8gd29yayBleGFj
dGx5PyBiaW5tYW4gcmVhZHMgdGhlc2Ugbm9kZXMgYW5kIHRoZW4KPiA+ID4gPiA+ID4gPiA+IHdy
aXRlcyBvdXQgJ2ZpeGVkLXBhcnRpdGlvbnMnIG5vZGVzLiBCdXQgdGhlbiB5b3UndmUgbG9zdCB0
aGUgYmlubWFuCj4gPiA+ID4gPiA+ID4gPiBzcGVjaWZjIHBhcnRzIG5lZWRlZCBmb3IgcmVwYWNr
aW5nLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gTm8sIHRoZXkgYXJlIHRoZSBzYW1lIG5v
ZGUuIEkgZG8gd2FudCB0aGUgZXh0cmEgaW5mb3JtYXRpb24gdG8gc3RpY2sKPiA+ID4gPiA+ID4g
PiBhcm91bmQuIFNvIGxvbmcgYXMgaXQgaXMgY29tcGF0aWJsZSB3aXRoIGZpeGVkLXBhcnRpdGlv
biBhcyB3ZWxsLCB0aGlzCj4gPiA+ID4gPiA+ID4gc2hvdWxkIHdvcmsgT0suCj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IEhvdyBjYW4gaXQgYmUgYm90aD8gVGhlIHBhcnRpdGlvbnMgbm9kZSBjb21w
YXRpYmxlIGNhbiBiZSBlaXRoZXIKPiA+ID4gPiA+ID4gJ2ZpeGVkLXBhcnRpdGlvbnMnIG9yICdi
aW5tYW4nLgo+ID4gPiA+ID4KPiA+ID4gPiA+IENhbiB3ZSBub3QgYWxsb3cgaXQgdG8gYmUgYm90
aD8gSSBoYXZlIHRyaWVkIHRvIGFkanVzdCB0aGluZ3MgaW4KPiA+ID4gPiA+IHJlc3BvbnNlIHRv
IGZlZWRiYWNrIGJ1dCBwZXJoYXBzIHRoZSBmZWVkYmFjayB3YXMgbGVhZGluZyBtZSBkb3duIHRo
ZQo+ID4gPiA+ID4gd3JvbmcgcGF0aD8KPiA+ID4gPgo+ID4gPiA+IFN1cmUsIGJ1dCB0aGVuIHRo
ZSBzY2hlbWEgaGFzIHRvIGFuZCB0aGF0IG1lYW5zIGV4dGVuZGluZwo+ID4gPiA+IGZpeGVkLXBh
cnRpdGlvbnMuCj4gPiA+Cj4gPiA+IENhbiB3ZSBjcm9zcyB0aGF0IGJyaWRnZSBsYXRlcj8gVGhl
cmUgbWlnaHQgYmUgcmVzaXN0YW5jZSB0byBpdC4gSSdtCj4gPiA+IG5vdCBzdXJlLiBGb3Igbm93
LCBwZXJoYXBzIGp1c3QgYSBiaW5tYW4gY29tcGF0aWJsZSB3b3JrcyB3ZWxsIGVub3VnaAo+ID4g
PiB0byBtYWtlIHByb2dyZXNzLgo+ID4KPiA+IElzIHRoZXJlIGFueSB3YXkgdG8gbWFrZSBwcm9n
cmVzcyBvbiB0aGlzPyBJIHdvdWxkIGxpa2UgdG8gaGF2ZQo+ID4gc29mdHdhcmUgd2hpY2ggZG9l
c24ndCB1bmRlcnN0YW5kIHRoZSBiaW5tYW4gY29tcGF0aWJsZSB0byBhdCBsZWFzdCBiZQo+ID4g
YWJsZSB0byB1bmRlcnN0YW5kIHRoZSBmaXhlZC1wYXJ0aXRpb24gY29tcGF0aWJsZS4gSXMgdGhh
dCBhY2NlcHRhYmxlPwo+Cj4gVGhlcmUncyBvbmx5IDIgd2F5cyB0aGF0IGl0IGNhbiB3b3JrLiBF
aXRoZXIgYmlubWFuIHdyaXRlcyBvdXQKPiBmaXhlZC1wYXJ0aXRpb24gbm9kZXMgZHJvcHBpbmcv
cmVwbGFjaW5nIGFueXRoaW5nIG9ubHkgZGVmaW5lZCBmb3IKPiBiaW5tYW4gb3IgZml4ZWQtcGFy
dGl0aW9uIGlzIGV4dGVuZGVkIHRvIGluY2x1ZGUgd2hhdCBiaW5tYW4gbmVlZHMuCgpPSywgdGhl
biBJIHN1cHBvc2UgdGhlIGJlc3Qgd2F5IGlzIHRvIGFkZCBhIG5ldyBiaW5tYW4gY29tcGF0aWJs
ZSwgYXMKaXMgZG9uZSB3aXRoIHRoaXMgdjYgc2VyaWVzLiBQZW9wbGUgdGhlbiBuZWVkIHRvIGNo
b29zZSBpdCBpbnN0ZWFkIG9mCmZpeGVkLXBhcnRpdGlvbi4KClNob3VsZCBJIHJlc2VuZCB0aGlz
IHNlcmllcywgb3IgaXMgaXQgT0sgYXMgaXQgaXM/CgpSZWdhcmRzLApTaW1vbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
