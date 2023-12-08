Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A622DC46CA3
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 21:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/A6QScc3N5683TWaj0e9vsgCktvxzPDO+O3jWYWmgJg=; b=Yw6TxNNPfwUwbd
	QJZo9R2/7d1/LIjwF5b/0bLygmWGbn9YgyRR1SfhZpL1G4lrNL4rGlbW0SKx0OswMdiJDKEEsr3ha
	b3NpF3QEfMHUP0v1bQ9LUVjsjBN1iw5BS5sr4GfY/jGRSYMi4rdtB6619KmOm2gqevVhFwC+qbJKm
	Lg4cFsRF8HpSiXCaJYmITwUQO+KTrHQMRBZiSDYEXhMjGF9PpCxYYA/VquWTZIcE6wi71xiOyfoQW
	0RK4xXljEEsyLQxEoHggVtplj1H2r344aXEM4RcQOO1fXcFQZmHZRGiAj7UwPaZB/lD/6vBwqj1Y0
	2jDDaXejypeQ3JapXD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBipd-00GdWR-0m;
	Fri, 08 Dec 2023 21:56:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBipZ-00GdUp-25
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 21:56:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 89B20CE2A38
	for <linux-mtd@lists.infradead.org>; Fri,  8 Dec 2023 21:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96C9C433C8
	for <linux-mtd@lists.infradead.org>; Fri,  8 Dec 2023 21:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702072577;
	bh=lLQ2WDCFYnh09MKNvKahHNehAE3mXonCy/B5T05x9JM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QVM696iIcTYOFN+ev+FZUSa0/ixShjERZF+VIKawdd9uLQrXYEX411unpB8wvAZut
	 kmruEk2LsZ0WrxbnQNh1cKguyfbgpz4yL6P0mVvsSdZx5zs/KagDL3fxtV2oRsRIJQ
	 UlsYw9d262QTPWJi25GWjm4+bFwH/nrlQLmLRT3IIRyWggljT7BpbMxU2Yt9w25K9F
	 zaxGru+oEKJN01GxqEMMuhiA1PsKZ86RazkibkaWzpwmX/vd85LqdWk21rDI0l6vtC
	 Dt2ZGycSZDwEvaHQJjlfn7x7JsAOPJgAjdUAXI43z7EcEOfZja5RCHIoZN0/BaRRub
	 BiK3mxuFgvy7Q==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50bfd3a5b54so2906550e87.3
        for <linux-mtd@lists.infradead.org>; Fri, 08 Dec 2023 13:56:17 -0800 (PST)
X-Gm-Message-State: AOJu0Yx+Su+HeZov0DzWrTdEtmEGBrMcU5AW98Zp4g6E4QQ1lxw8lHMC
	tIKiVdu0sUROm8jvBzQMzaQfcE9pWhHZpQKCIw==
X-Google-Smtp-Source: AGHT+IEI2ip3XV4V7TTB5nRPLVsv6tOfk4vWYEqLclmJPsP0iDuLLixjRpN97skNUaRQnS3dh1vfZAeeAx25aEDiGfc=
X-Received: by 2002:a05:6512:a90:b0:50b:f23d:d804 with SMTP id
 m16-20020a0565120a9000b0050bf23dd804mr338588lfu.77.1702072575996; Fri, 08 Dec
 2023 13:56:15 -0800 (PST)
MIME-Version: 1.0
References: <20231116172859.393744-1-sjg@chromium.org> <20231208150042.GA1278773-robh@kernel.org>
 <CAPnjgZ2i4gvgiUeHPOfHuOdBooV4e=QQEq6iMo0JbDwOS6dCwA@mail.gmail.com>
In-Reply-To: <CAPnjgZ2i4gvgiUeHPOfHuOdBooV4e=QQEq6iMo0JbDwOS6dCwA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 8 Dec 2023 15:56:02 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+xMZ8yz4H9D59uCSyX4h5W+4ruGF++=wVA=msXz+Y01A@mail.gmail.com>
Message-ID: <CAL_Jsq+xMZ8yz4H9D59uCSyX4h5W+4ruGF++=wVA=msXz+Y01A@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman compatible
To: Simon Glass <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Michael Walle <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_135622_163422_44E2ACAB 
X-CRM114-Status: GOOD (  33.25  )
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

T24gRnJpLCBEZWMgOCwgMjAyMyBhdCAxMTo0N+KAr0FNIFNpbW9uIEdsYXNzIDxzamdAY2hyb21p
dW0ub3JnPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IE9uIEZyaSwgOCBEZWMgMjAyMyBhdCAwODow
MCwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBO
b3YgMTYsIDIwMjMgYXQgMTA6Mjg6NTBBTSAtMDcwMCwgU2ltb24gR2xhc3Mgd3JvdGU6Cj4gPiA+
IEFkZCBhIGNvbXBhdGlibGUgc3RyaW5nIGZvciBiaW5tYW4sIHNvIHdlIGNhbiBleHRlbmQgZml4
ZWQtcGFydGl0aW9ucwo+ID4gPiBpbiB2YXJpb3VzIHdheXMuCj4gPiA+Cj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+ID4gPiAtLS0KPiA+ID4KPiA+
ID4gKG5vIGNoYW5nZXMgc2luY2UgdjUpCj4gPiA+Cj4gPiA+IENoYW5nZXMgaW4gdjU6Cj4gPiA+
IC0gQWRkICNhZGRyZXNzL3NpemUtY2VsbHMgYW5kIHBhcnRlcm5Qcm9wZXJ0aWVzCj4gPiA+IC0g
RHJvcCAkcmVmIHRvIGZpeGVkLXBhcnRpdGlvbnMueWFtbAo+ID4gPiAtIERyb3AgJ3NlbGVjdDog
ZmFsc2UnCj4gPiA+Cj4gPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiA+IC0gQ2hhbmdlIHN1YmplY3Qg
bGluZQo+ID4gPgo+ID4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gPiAtIERyb3AgZml4ZWQtcGFydGl0
aW9uIGFkZGl0aW9uYWwgY29tcGF0aWJsZSBzdHJpbmcKPiA+ID4gLSBEcm9wIGZpeGVkLXBhcnRp
dGlvbnMgZnJvbSB0aGUgZXhhbXBsZQo+ID4gPiAtIE1lbnRpb24gdXNlIG9mIGNvbXBhdGlibGUg
aW5zdGVhZCBvZiBsYWJlbAo+ID4gPgo+ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPiAtIERyb3Ag
bWVudGlvbiBvZiAnZW5oYW5jZWQgZmVhdHVyZXMnIGluIGZpeGVkLXBhcnRpdGlvbnMueWFtbAo+
ID4gPiAtIE1lbnRpb24gQmlubWFuIGlucHV0IGFuZCBvdXRwdXQgcHJvcGVydGllcwo+ID4gPiAt
IFVzZSBwbGFpbiBwYXJ0aXRpb25AeHh4IGZvciB0aGUgbm9kZSBuYW1lCj4gPiA+Cj4gPiA+ICAu
Li4vYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlhbWwgICAgICAgfCA2OCArKysrKysr
KysrKysrKysrKysrCj4gPiA+ICAuLi4vYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9u
cy55YW1sICAgfCAgMSArCj4gPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNSArKwo+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA3NCBpbnNlcnRpb25z
KCspCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi55YW1sCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFu
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMv
YmlubWFuLnlhbWwKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAwMDAw
MDAwMDAwLi4zMjkyMTc1NTBhOTgKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlhbWwK
PiA+ID4gQEAgLTAsMCArMSw2OCBAQAo+ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
KEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+ID4gPiArIyBDb3B5cmlnaHQgMjAyMyBHb29nbGUg
TExDCj4gPiA+ICsKPiA+ID4gKyVZQU1MIDEuMgo+ID4gPiArLS0tCj4gPiA+ICskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi55YW1sIwo+ID4g
PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwj
Cj4gPiA+ICsKPiA+ID4gK3RpdGxlOiBCaW5tYW4gZmlybXdhcmUgbGF5b3V0Cj4gPiA+ICsKPiA+
ID4gK21haW50YWluZXJzOgo+ID4gPiArICAtIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3Jn
Pgo+ID4gPiArCj4gPiA+ICtkZXNjcmlwdGlvbjogfAo+ID4gPiArICBUaGUgYmlubWFuIG5vZGUg
cHJvdmlkZXMgYSBsYXlvdXQgZm9yIGZpcm13YXJlLCB1c2VkIHdoZW4gcGFja2FnaW5nIGZpcm13
YXJlCj4gPiA+ICsgIGZyb20gbXVsdGlwbGUgcHJvamVjdHMuIEl0IGlzIGJhc2VkIG9uIGZpeGVk
LXBhcnRpdGlvbnMsIHdpdGggc29tZQo+ID4gPiArICBleHRlbnNpb25zLCBidXQgdXNlcyAnY29t
cGF0aWJsZScgdG8gaW5kaWNhdGUgdGhlIGNvbnRlbnRzIG9mIHRoZSBub2RlLCB0bwo+ID4gPiAr
ICBhdm9pZCBwZXJ0dXJiaW5nIG9yIGNvbmZ1c2luZyBleGlzdGluZyBpbnN0YWxsYXRpb25zIHdo
aWNoIHVzZSAnbGFiZWwnIGZvciBhCj4gPiA+ICsgIHBhcnRpY3VsYXIgcHVycG9zZS4KPiA+ID4g
Kwo+ID4gPiArICBCaW5tYW4gc3VwcG9ydHMgcHJvcGVydGllcyB1c2VkIGFzIGlucHV0cyB0byB0
aGUgZmlybXdhcmUtcGFja2FnaW5nIHByb2Nlc3MsCj4gPiA+ICsgIHN1Y2ggYXMgdGhvc2Ugd2hp
Y2ggY29udHJvbCBhbGlnbm1lbnQgb2YgcGFydGl0aW9ucy4gVGhpcyBiaW5kaW5nIGFkZHJlc3Nl
cwo+ID4gPiArICB0aGVzZSAnaW5wdXQnIHByb3BlcnRpZXMuIEZvciBleGFtcGxlLCBpdCBpcyBj
b21tb24gZm9yIHRoZSAncmVnJyBwcm9wZXJ0eQo+ID4gPiArICAoYW4gJ291dHB1dCcgcHJvcGVy
dHkpIHRvIGJlIHNldCBieSBCaW5tYW4sIGJhc2VkIG9uIHRoZSBhbGlnbm1lbnQgcmVxdWVzdGVk
Cj4gPiA+ICsgIGluIHRoZSBpbnB1dC4KPiA+ID4gKwo+ID4gPiArICBPbmNlIHByb2Nlc3Npbmcg
aXMgY29tcGxldGUsIGlucHV0IHByb3BlcnRpZXMgaGF2ZSBtb3N0bHkgc2VydmVkIHRoZWlyCj4g
PiA+ICsgIHB1cnBvc2UsIGF0IGxlYXN0IHVudGlsIHRoZSBmaXJtd2FyZSBpcyByZXBhY2tlZCBs
YXRlciwgZS5nLiBkdWUgdG8gYQo+ID4gPiArICBmaXJtd2FyZSB1cGRhdGUuIFRoZSAnZml4ZWQt
cGFydGl0aW9ucycgYmluZGluZyBzaG91bGQgcHJvdmlkZSBlbm91Z2gKPiA+ID4gKyAgaW5mb3Jt
YXRpb24gdG8gcmVhZCB0aGUgZmlybXdhcmUgYXQgcnVudGltZSwgaW5jbHVkaW5nIGRlY29tcHJl
c3Npb24gaWYKPiA+ID4gKyAgbmVlZGVkLgo+ID4KPiA+IEhvdyBpcyB0aGlzIGdvaW5nIHRvIHdv
cmsgZXhhY3RseT8gYmlubWFuIHJlYWRzIHRoZXNlIG5vZGVzIGFuZCB0aGVuCj4gPiB3cml0ZXMg
b3V0ICdmaXhlZC1wYXJ0aXRpb25zJyBub2Rlcy4gQnV0IHRoZW4geW91J3ZlIGxvc3QgdGhlIGJp
bm1hbgo+ID4gc3BlY2lmYyBwYXJ0cyBuZWVkZWQgZm9yIHJlcGFja2luZy4KPgo+IE5vLCB0aGV5
IGFyZSB0aGUgc2FtZSBub2RlLiBJIGRvIHdhbnQgdGhlIGV4dHJhIGluZm9ybWF0aW9uIHRvIHN0
aWNrCj4gYXJvdW5kLiBTbyBsb25nIGFzIGl0IGlzIGNvbXBhdGlibGUgd2l0aCBmaXhlZC1wYXJ0
aXRpb24gYXMgd2VsbCwgdGhpcwo+IHNob3VsZCB3b3JrIE9LLgoKSG93IGNhbiBpdCBiZSBib3Ro
PyBUaGUgcGFydGl0aW9ucyBub2RlIGNvbXBhdGlibGUgY2FuIGJlIGVpdGhlcgonZml4ZWQtcGFy
dGl0aW9ucycgb3IgJ2Jpbm1hbicuCgpJbiB0aGUgcGFydGl0aW9uIG5vZGVzLCAnYWxpZ24nIGZv
ciBleGFtcGxlIGlzIGFsbG93ZWQgZm9yIGEgYmlubWFuCnBhcnRpdGlvbiBidXQgbm90IGEgZml4
ZWQtcGFydGl0aW9uLgoKTm90ZSB0aGF0IHRoZSBzY2hlbWEgbWF5IG5vdCBhY3R1YWxseSB3YXJu
IG9uIGV4dHJhIHByb3BlcnRpZXMgQVRNCmJlY2F1c2UgdGhlcmUgYXJlIHNvbWUgaXNzdWVzIHdp
dGggdGhlIHNjaGVtYSBzdHJ1Y3R1cmUuIFNpbmNlIHRoZXJlCmNhbiBiZSBuZXN0ZWQgcGFydGl0
dGlvbnMsIHRoYXQgY29tcGxpY2F0ZXMgbWF0dGVycy4gSXQncyBiZWVuIG9uIG15CnRvZG8gbGlz
dCB0byBmaXguCgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
