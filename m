Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FBACE7AB7
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 19:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWcxYap6ZJNbQwcjPQLZB3zkFWRG+XOOR0qbWps0Z1c=; b=HIQNPcqR0UmU9z
	mlWq5e+7Lo3GLhY75ubLaZ8tRmxGy92pQklk2GlzLna3l/F0CRLH/B92RcEY+HVWpaBdJjQ7i9+XC
	povr6KA7tSJxj6gbFmsjw1JcgJQqlMwE3QDxwb1If4MsmXLHmpl0WaMwAQ3KKYdiHz+O4EJsJ3CBQ
	gtRCuGMXzMVQZ1UiutuJiqRHFGVSScBj92tZPBDFHN8qVlNfXbWnlvDPrswZvlKqQi6lJI/aBkjF/
	u7t87zzOluPiZeXoLfEcY+IXqcvryMLYytpJwAtNbyR2OpL+E62QqPil+kOGsw0FbOwqvipo5vq7H
	irRnW+n2QZ0sw43dQWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjmBZ-009jys-1X;
	Fri, 22 Sep 2023 19:51:33 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjmBV-009jyH-2V
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 19:51:32 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5042bfb4fe9so4070260e87.1
        for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 12:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695412286; x=1696017086; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcpcIFJ61Cgs0SnYetl6zxlaNczsC0YBO5OwWuuMpjg=;
        b=cRwPHcxxCFt/uZpOZEynrhF66tWYjC9h7eaI94FZLZ/oM4+aGJOT3Agm5sCKgnZ899
         IvKsDANw5wMEhMvQXGecCiRWMUA8DA2gbbC7k+Hs3nx75UxkAeNr2vSdDPp9fzITO+ZL
         6rnqSvcQrbi8DzGJAS5kF7QXeflLgTGp4g6TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695412286; x=1696017086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcpcIFJ61Cgs0SnYetl6zxlaNczsC0YBO5OwWuuMpjg=;
        b=gAbg3T2w9QYtGkCAcVy+XH9sHEjYMQ2p4Nl61WUo2yWrY1tzfAHw95R0O79K392JAi
         RPhfjedcRIFXpD/IEXbGHShOUraRaWBjltMkfWbI27n/h91uIkzBPRRoBjcFYs84norD
         W7hpOGl/GBTVe3LegFS2Tj1PXcD33zgWUueQdTGYreRARG2yGh62/bfeS9etAcYk2eTT
         mm0agqZxidfemMlbA7XGzeIlVKi3jJWgoR+wj8hlzENtFuNJmoU8NK5aooNsKuSz4kaO
         7sj5CVVN0VeMPWha19eWPVcLxXW77jS4iDfP4EceESVXMAsvs2y8S+csDo8LbyGKi8/d
         o9CA==
X-Gm-Message-State: AOJu0YzoBQbn6G4YlIlfTWjGE2gSDCNXMSQfvXprlGzJ6sKfwM8rkRpF
	qpQvSwWyMcgKJm15svqIRcz0CdpCy38j8oFREd6f6g==
X-Google-Smtp-Source: AGHT+IGL6fQHrX1AqP0gkgxhmMGrRSypGWx3ZtAcsfH7zlp8ROCDaeJq0vczx5UZ4LzUj+CQKnM3WMIgnpzbaTlIv70=
X-Received: by 2002:a05:6512:32a2:b0:503:2a53:7480 with SMTP id
 q2-20020a05651232a200b005032a537480mr431345lfe.49.1695412285461; Fri, 22 Sep
 2023 12:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
 <CAL_Jsq+WuYDU+yY98opTHr1PT-J9mFYJQBjVMnk+FSWLDUO33w@mail.gmail.com>
 <CAPnjgZ1pfxaMG1n5yOBhiOhsNrRjck1K92U7Ga=+VTY_jjjrVg@mail.gmail.com>
 <20230922174649.GA3320366-robh@kernel.org> <CAPnjgZ3ojfAv=BHqOhM=-NnYqCm81Ny=PsGKiNphKTmw++fk9w@mail.gmail.com>
 <CAL_JsqJqvyP=c93DHDO8A5RXv7Lz_Z7eEHSbJQ=JCo+qPVhSfg@mail.gmail.com>
In-Reply-To: <CAL_JsqJqvyP=c93DHDO8A5RXv7Lz_Z7eEHSbJQ=JCo+qPVhSfg@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 22 Sep 2023 13:51:14 -0600
Message-ID: <CAPnjgZ3BnD9aX3cNNPiGRKTOj+YeurHCLv6K0TRFhAtY21Qufw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, U-Boot Mailing List <u-boot@lists.denx.de>, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_125129_856616_6348F914 
X-CRM114-Status: GOOD (  45.17  )
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

SGkgUm9iLAoKT24gRnJpLCAyMiBTZXB0IDIwMjMgYXQgMTM6NDMsIFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgMToxMuKAr1BN
IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSBSb2IsCj4g
Pgo+ID4gT24gRnJpLCAyMiBTZXB0IDIwMjMgYXQgMTE6NDYsIFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIFNlcCAyMiwgMjAyMyBhdCAxMTow
MToxOEFNIC0wNjAwLCBTaW1vbiBHbGFzcyB3cm90ZToKPiA+ID4gPiBIaSBSb2IsCj4gPiA+ID4K
PiA+ID4gPiBPbiBGcmksIDIyIFNlcHQgMjAyMyBhdCAxMDowMCwgUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gVGh1LCBTZXAgMjEsIDIw
MjMgYXQgMTo0NeKAr1BNIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gQmlubWFuWzFdIGlzIGEgdG9vbCBmb3IgY3JlYXRpbmcgZmly
bXdhcmUgaW1hZ2VzLiBJdCBhbGxvd3MgeW91IHRvCj4gPiA+ID4gPiA+IGNvbWJpbmUgdmFyaW91
cyBiaW5hcmllcyBhbmQgcGxhY2UgdGhlbSBpbiBhbiBvdXRwdXQgZmlsZS4KPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gQmlubWFuIHVzZXMgYSBEVCBzY2hlbWEgdG8gZGVzY3JpYmUgYW4gaW1hZ2Us
IGluIGVub3VnaCBkZXRhaWwgdGhhdAo+ID4gPiA+ID4gPiBpdCBjYW4gYmUgYXV0b21hdGljYWxs
eSBidWlsdCBmcm9tIGNvbXBvbmVudCBwYXJ0cywgZGlzYXNzZW1ibGVkLAo+ID4gPiA+ID4gPiBy
ZXBsYWNlZCwgbGlzdGVkLCBldGMuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEltYWdlcyBhcmUg
dHlwaWNhbGx5IHN0b3JlZCBpbiBmbGFzaCwgd2hpY2ggaXMgd2h5IHRoaXMgYmluZGluZyBpcwo+
ID4gPiA+ID4gPiB0YXJnZXRlZCBhdCBtdGQuIFByZXZpb3VzIGRpc2N1c3Npb24gaXMgYXQgWzJd
IFszXS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gWzFdIGh0dHBzOi8vdS1ib290LnJlYWR0aGVk
b2NzLmlvL2VuL3N0YWJsZS9kZXZlbG9wL3BhY2thZ2UvYmlubWFuLmh0bWwKPiA+ID4gPiA+ID4g
WzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3UtYm9vdC8yMDIzMDgyMTE4MDIyMC4yNzI0MDgw
LTMtc2pnQGNocm9taXVtLm9yZy8KPiA+ID4gPiA+ID4gWzNdIGh0dHBzOi8vd3d3LnNwaW5pY3Mu
bmV0L2xpc3RzL2RldmljZXRyZWUvbXNnNjI2MTQ5Lmh0bWwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBZ
b3UgbWlzc2VkOgo+ID4gPiA+ID4KPiA+ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9kZXZpY2V0
cmVlLW9yZy9kdC1zY2hlbWEvcHVsbC8xMTAKPiA+ID4gPiA+Cj4gPiA+ID4gPiB3aGVyZSBJIHNh
aWQ6IFdlIGNlcnRhaW5seSBzaG91bGRuJ3QgZHVwbGljYXRlIHRoZSBleGlzdGluZyBwYXJ0aXRp
b25zCj4gPiA+ID4gPiBiaW5kaW5ncy4gV2hhdCdzIG1pc3NpbmcgZnJvbSB0aGVtIChJIGFzc3Vt
ZSB3ZSdyZSBtb3N0bHkgdGFsa2luZwo+ID4gPiA+ID4gYWJvdXQgImZpeGVkLXBhcnRpdGlvbnMi
IHdoaWNoIGhhcyBiZWVuIGFyb3VuZCBmb3JldmVyIEkgdGhpbmsgKGJlZm9yZQo+ID4gPiA+ID4g
bWUpKT8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUbyByZXBlYXQsIHVubGVzcyB0aGVyZSBpcyBzb21l
IHJlYXNvbiBiaW5tYW4gcGFydGl0aW9ucyBjb25mbGljdCB3aXRoCj4gPiA+ID4gPiBmaXhlZC1w
YXJ0aXRpb25zLCB5b3UgbmVlZCB0byBzdGFydCB0aGVyZSBhbmQgZXh0ZW5kIGl0LiBGcm9tIHdo
YXQncwo+ID4gPiA+ID4gcG9zdGVkIGhlcmUsIGl0IG5laXRoZXIgY29uZmxpY3RzIG5vciBuZWVk
cyBleHRlbmRpbmcuCj4gPiA+ID4KPiA+ID4gPiBJIHRoaW5rIGF0IHRoaXMgcG9pbnQgSSBhbSBq
dXN0IGhvcGVsZXNzbHkgY29uZnVzZWQuIEhhdmUgeW91IHRha2VuIGEKPiA+ID4gPiBsb29rIGF0
IHRoZSBiaW5tYW4gc2NoZW1hPyBbMV0KPiA+ID4KPiA+ID4gV2h5IGRvIEkgbmVlZCB0bz8gVGhh
dCdzIHVzZWQgZm9yIHNvbWUgdG9vbCBhbmQgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBhCj4gPiA+
IGRldmljZSdzIERUQi4gSG93ZXZlciwgSSB0aG91Z2h0IHNvbWV3aGVyZSBpbiB0aGlzIGRpc2N1
c3Npb24geW91IHNob3dlZAo+ID4gPiBpdCB1bmRlciBhIGZsYXNoIGRldmljZSBub2RlLgo+ID4K
PiA+IFllcywgdGhhdCBpcyB0aGUgaW50ZW50ICh1bmRlciBhIGZsYXNoIG5vZGUpLgo+ID4KPiA+
ID4gVGhlbiBJIGNhcmUgYmVjYXVzZSB0aGVuIGl0IG92ZXJsYXBzIHdpdGgKPiA+ID4gd2hhdCB3
ZSBhbHJlYWR5IGhhdmUgZm9yIHBhcnRpdGlvbnMuIElmIEkgbWlzdW5kZXJzdG9vZCB0aGF0LCB0
aGVuIGp1c3QKPiA+ID4gcHV0IHlvdXIgc2NoZW1hIHdpdGggeW91ciB0b29sLiBPbmx5IHVzZXJz
IG9mIHRoZSB0b29sIHNob3VsZCBjYXJlIGFib3V0Cj4gPiA+IHRoZSB0b29sJ3Mgc2NoZW1hLgo+
ID4KPiA+IE9LLiBJIGJlbGlldmUgdGhhdCBiaW5tYW4gd2lsbCBmaXQgaW50byBib3RoIGNhbXBz
LCBzaW5jZSBpdHMgaW5wdXQgaXMKPiA+IG5vdCBuZWNlc3NhcmlseSBmdWxseSBmb3JtZWQuIEUu
Zy4gaWYgeW91IGRvbid0IHNwZWNpZnkgdGhlIG9mZnNldCBvZgo+ID4gYW4gZW50cnksIHRoZW4g
aXQgd2lsbCBiZSBwYWNrZWQgYXV0b21hdGljYWxseS4gQnV0IHRoZSBvdXRwdXQgaXMKPiA+IGZ1
bGx5IGZvcm1lZCwgaW4gdGhhdCBCaW5tYW4gbm93IGtub3dzIHRoZSBvZmZzZXQgc28gY2FuIHdy
aXRlIGl0IHRvCj4gPiB0aGUgRFQuCj4KPiBJIHN1cHBvc2UgaXQgY291bGQgdGFrZSBpdHMgb3du
IGZvcm1hdCBhcyBpbnB1dCBhbmQgdGhlbiB3cml0ZSBvdXQKPiBzb21ldGhpbmcgZGlmZmVyZW50
IGZvciB0aGUgIm9uIHRoZSBkZXZpY2UiIGZvcm1hdCAoaS5lLgo+IGZpeGVkLXBhcnRpdGlvbnMp
LiBBdCBsZWFzdCBmb3IgdGhlIGR5bmFtaWMgb2Zmc2V0cywgd2UgbWF5IG5lZWQKPiBzb21ldGhp
bmcgYWxsb3dlZCBmb3IgYmlubWFuIGlucHV0LCBidXQgbm90IGFsbG93ZWQgb24gZGV2aWNlLiBJ
bgo+IGdlbmVyYWwsIHRoZXJlIGlzIHN1cHBvcnQgZm9yIHBhcnRpdGlvbnMgd2l0aG91dCBhZGRy
ZXNzZXMvb2Zmc2V0cywKPiBidXQgb25seSBmb3IgcGFydGl0aW9ucyB0aGF0IGhhdmUgc29tZSBv
dGhlciB3YXkgdG8gZmlndXJlIHRoYXQgb3V0Cj4gKG9uIGRpc2sgcGFydGl0aW9uIGluZm8pLgo+
Cj4gVGhlcmUncyBhbHNvIHRoZSBpbWFnZSBmaWxlbmFtZSB3aGljaCBkb2Vzbid0IHJlYWxseSBi
ZWxvbmcgaW4gdGhlIG9uCj4gZGV2aWNlIHBhcnRpdGlvbnMuIFNvIG1heWJlIHRoZSBpbnB1dCBh
bmQgb3V0cHV0IHNjaGVtYXMgc2hvdWxkIGJlCj4gc2VwYXJhdGUuCgpPSywgSSdsbCBmb2N1cyBv
biB0aGUgb3V0cHV0IHNjaGVtYSBmb3Igbm93LiBJIHN1c3BlY3QgdGhpcyB3aWxsIGJlIGEKZ3Jl
eSBhcmVhIHRob3VnaC4KCkFzIGFuIGV4YW1wbGUsIGlmIHlvdSByZXBsYWNlIGEgYmluYXJ5IGlu
IHRoZSBmaXJtd2FyZSwgQmlubWFuIGNhbgpyZXBhY2sgdGhlIGZpcm13YXJlIHRvIG1ha2Ugcm9v
bSwgcmVzcGVjdGluZyB0aGUgYWxpZ25tZW50IGFuZCBzaXplCmNvbnN0cmFpbnRzLiBTbyB0aGVz
ZSBuZWVkIHRvIGJlIGluIHRoZSBvdXRwdXQgc2NoZW1hIHNvbWVob3cuCgo+Cj4gPiA+ID4gSSBz
YXcgdGhpcyBmaWxlLCB3aGljaCBzZWVtcyB0byBleHRlbmQgYSBwYXJ0aXRpb24uCj4gPiA+ID4K
PiA+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMv
YnJjbSxiY200OTA4LXBhcnRpdGlvbnMueWFtbAo+ID4gPgo+ID4gPiBJSVJDLCB0aGF0J3MgYSBk
aWZmZXJlbnQgdHlwZSB3aGVyZSBwYXJ0aXRpb24gbG9jYXRpb25zIGFyZSBzdG9yZWQgaW4KPiA+
ID4gdGhlIGZsYXNoLCBzbyB3ZSBkb24ndCBuZWVkIGxvY2F0aW9uIGFuZCBzaXplIGluIERULgo+
ID4KPiA+IE9LLgo+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEkgd2FzIGFzc3VtaW5nIHRoYXQg
SSBzaG91bGQgY3JlYXRlIGEgdG9wLWxldmVsIGNvbXBhdGlibGUgPSAiYmlubWFuIgo+ID4gPiA+
IG5vZGUsIHdpdGggc3Vibm9kZXMgbGlrZSBjb21wYXRpYmxlID0gImJpbm1hbixibDMxLWF0ZiIs
IGZvciBleGFtcGxlLgo+ID4gPiA+IEkgc2hvdWxkIHVzZSB0aGUgY29tcGF0aWJsZSBzdHJpbmcg
dG8gaW5kaWNhdGUgdGhlIGNvbnRlbnRzLCByaWdodD8KPiA+ID4KPiA+ID4gWWVzIGZvciBzdWJu
b2RlcywgYW5kIHdlIGFscmVhZHkgaGF2ZSBzb21lIHNvbWV3aGF0IHN0YW5kYXJkIG9uZXMgZm9y
Cj4gPiA+ICJ1LWJvb3QiIGFuZCAidS1ib290LWVudiIuIFRob3VnaCBoaXN0b3JpY2FsbHksICJs
YWJlbCIgd2FzIHVzZWQuCj4gPgo+ID4gQmlubWFuIGhhcyBjb21tb24gcHJvcGVydGllcyBmb3Ig
YWxsIGVudHJpZXMsIGluY2x1ZGluZyAiY29tcHJlc3MiCj4gPiB3aGljaCBzZXRzIHRoZSBjb21w
cmVzc2lvbiBhbGdvcml0aG0uCj4KPiBJIHNlZSBubyBpc3N1ZSB3aXRoIGFkZGluZyB0aGF0LiBJ
dCBzZWVtcyB1c2VmdWwgYW5kIHNvbWV0aGluZyBtaXNzaW5nCj4gaW4gdGhlIGV4aXN0aW5nIHBh
cnRpdGlvbiBzY2hlbWFzLgoKT0sgSSBzZW50IGEgcGF0Y2ggd2l0aCB0aGF0LgoKPgo+ID4gU28g
cGVyaGFwcyBJIHNob3VsZCBzdGFydCBieSBkZWZpbmluZyBhIG5ldyBiaW5tYW4sYmwzMS1hdGYg
d2hpY2ggaGFzCj4gPiBjb21tb24gcHJvcGVydGllcyBmcm9tIGFuICJiaW5tYW4sZW50cnkiIGRl
ZmluaXRpb24/Cj4KPiBJIGRvbid0IHVuZGVyc3RhbmQgdGhlIGJpbm1hbiBwcmVmaXguIFRoZSBj
b250ZW50cyBhcmUgQVRGIChvciBURi1BCj4gbm93KS4gV2hvIHdyb3RlIGl0IHRvIHRoZSBmbGFz
aCBpbWFnZSBpcyBub3QgcmVsZXZhbnQuCgpBcmUgeW91IHN1Z2dlc3RpbmcganVzdCAiYXRmLWJs
MzEiLCBvciAiYXJtLGF0Zi1ibDMxIiA/IE9yIHNob3VsZCB3ZQpjaGFuZ2UgaXQgdG8gInRmYS1i
bDMxIj8KCj4KPiBXZSBhbHJlYWR5IGhhdmUgc29tZSBjb21wYXRpYmxlcyBpbiB1c2UuIFdlIHNo
b3VsZCByZXVzZSB0aGVtIGlmCj4gcG9zc2libGUuIE5vdCBzdXJlIGFib3V0IFRGLUEgdGhvdWdo
LgoKT0suCgpSZWdhcmRzLApTaW1vbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
