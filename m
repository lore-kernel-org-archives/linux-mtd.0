Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAFEC48291
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 11:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aD0juvZaB0xb3SItvV3SNmY3rYSOjpZaFs2QTLc26tY=; b=l45hISko3GIRhK
	nH/MlzBHZCJOEGnRR6vPL05qzJa+EyPeGyMS7lYSQs/JsWIpFboKa0UOodNieLIJpLq+tp3ZNwYfS
	WyZbzRq6kQRH03su9PWrqqHq2vSRxOqe/3qd12p3PPXHmJq2UIaQ6a0mYHEYwhIDJ/dagPCs2oNCM
	xolJgiyIrbicqeDvSbAe9X4tOYf/Jg6UaNG0TjMrcbmRBRm8Gw/OB7vlXm/buFM+VhcNVic4l2+tX
	gCpyKnsutnyA6NRhDuLORRHBETWTRsK4r+bN+uSrWrzMRKJGJ/hmHLMF5PjJCe9tfcHVxF/6A1V4+
	47hScNoAqpdTSw+9rhcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWxdY-0000000355b-0UxD;
	Mon, 05 Feb 2024 11:59:44 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWxdV-0000000354I-43Yv
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 11:59:43 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-68ca3ab3358so4850346d6.2
        for <linux-mtd@lists.infradead.org>; Mon, 05 Feb 2024 03:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707134379; x=1707739179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd19UudtUta4YgE00lNWpRXLRxXDC1CL2JnJndHo4kM=;
        b=Xk1fBv6Xxlz1Y+r8LpUIIMArtLVCN1X/0cJI9XmpPLB1w0I7kvoTRuiaF0jRkeWRQI
         SZe1d4eJF1PdapR7saMh4tYvyQc3B/6wxFQDAEmtpWP2EYyDGnxE3LdZd9CYu0GI5kxo
         JBAYQtmg8v/q0PcickpjEvCLmpjy9RUHk8nUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707134379; x=1707739179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dd19UudtUta4YgE00lNWpRXLRxXDC1CL2JnJndHo4kM=;
        b=jSyoTfp59CmhP2KlvYWKK3N8JQytmezpwdW2iuUnTvQPmIf0dhl7nyiOtRT6XEcYmL
         sOqCCBAq6torNBRVmmmTD5YV+tkY6sebiWFzygjRw7Rkkd6mc0z9BqOgZRg7OeDw7nKj
         BUg0LO+wgEv7Kpu+fdKAQLtXLdn40r1QGzPCMUwn88yY/6ExxseWjeZPUErwpwn2EV2R
         g2OOgQqv37isr8+UZ5azBuZe5c5HfyfZFYvgqytBSnH3/t5y3b+VmyTQYF6SUaOszjkq
         Deab5Cwje2lM4kgAddgpYDZixP+gUx2Xy0aO9jLL8w8KKYiWP9sOoHwt+CnnUoafUJ/V
         WfNw==
X-Gm-Message-State: AOJu0Yzkne3xaJSdXEySH//Q3hcOhLkbmG3QZ8QTArgS2N298c4uzs9S
	UehXA2U6FuvGfs8qcPhUQRG6el05ZErkfX8SPNUuHw1vmytolmvN8Tgl7hsADPm11pQlsd6nJyn
	itBW+sXFFcoXhj5ERjdZN4S53kZZNIzzfZ3nP
X-Google-Smtp-Source: AGHT+IFjWKMmhCR7ryd5mUFrZeoW5VjXZFwefVLKCjiSO60UBKWaqicUaXM/D+cAJk0ueWOKWBzJ8moWvs0gXRm/Ku4=
X-Received: by 2002:a05:6214:e4f:b0:68c:539b:b493 with SMTP id
 o15-20020a0562140e4f00b0068c539bb493mr7522718qvc.20.1707134379670; Mon, 05
 Feb 2024 03:59:39 -0800 (PST)
MIME-Version: 1.0
References: <20231116172859.393744-1-sjg@chromium.org> <20231208150042.GA1278773-robh@kernel.org>
 <CAPnjgZ2i4gvgiUeHPOfHuOdBooV4e=QQEq6iMo0JbDwOS6dCwA@mail.gmail.com>
 <CAL_Jsq+xMZ8yz4H9D59uCSyX4h5W+4ruGF++=wVA=msXz+Y01A@mail.gmail.com>
 <CAPnjgZ1uW8T6woXSqFUNm301=W3zBYOrADREkrz=DuwSW87qZg@mail.gmail.com>
 <20231214172702.GA617226-robh@kernel.org> <CAPnjgZ2oJSGPO91Y_aLbe+v250WFrND4n3T0mOvhERYidVu=eQ@mail.gmail.com>
 <CAFLszTizRRVbRO6_ygE2X-Lp5dENWSc4uMGL5GPJAFGAbRdCyQ@mail.gmail.com>
 <CAL_Jsq+j7_KZtQ2ENq9+vsw0LOZF=spu293_G=AxOmBM+m_f-g@mail.gmail.com>
 <CAFLszTimaFw9sf=JKvQXG4fS6V_2T=2n+pfvYLCiuG1o+7cHPA@mail.gmail.com> <20240205085056.44278f2c@xps-13>
In-Reply-To: <20240205085056.44278f2c@xps-13>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 5 Feb 2024 04:59:28 -0700
Message-ID: <CAFLszTi+8ygXOidnhxj7sdJwc6X5i+++QvnUyfe-kde5eSts_w@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman compatible
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Michael Walle <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_035942_059037_0BDE6C1B 
X-CRM114-Status: GOOD (  51.99  )
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

SGkgTWlxdWVsLAoKT24gTW9uLCA1IEZlYiAyMDI0IGF0IDAwOjUwLCBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIFNpbW9uLAo+Cj4gc2pnQGNo
cm9taXVtLm9yZyB3cm90ZSBvbiBTdW4sIDQgRmViIDIwMjQgMDU6MDc6MzggLTA3MDA6Cj4KPiA+
IEhpIFJvYiwKPiA+Cj4gPiBPbiBXZWQsIDE3IEphbiAyMDI0IGF0IDA4OjU2LCBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVGh1LCBKYW4gNCwgMjAy
NCBhdCAzOjU04oCvUE0gU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4g
PiA+Cj4gPiA+ID4gSGkgUm9iLAo+ID4gPiA+Cj4gPiA+ID4gT24gVGh1LCBEZWMgMTQsIDIwMjMg
YXQgMjowOeKAr1BNIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+ID4g
PiA+Cj4gPiA+ID4gPiBIaSBSb2IsCj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gVGh1LCAxNCBEZWMg
MjAyMyBhdCAxMDoyNywgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIEZyaSwgRGVjIDA4LCAyMDIzIGF0IDAzOjU4OjEwUE0gLTA3
MDAsIFNpbW9uIEdsYXNzIHdyb3RlOgo+ID4gPiA+ID4gPiA+IEhpIFJvYiwKPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+IE9uIEZyaSwgOCBEZWMgMjAyMyBhdCAxNDo1NiwgUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4g
T24gRnJpLCBEZWMgOCwgMjAyMyBhdCAxMTo0N+KAr0FNIFNpbW9uIEdsYXNzIDxzamdAY2hyb21p
dW0ub3JnPiB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gSGkgUm9i
LAo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBPbiBGcmksIDggRGVjIDIwMjMg
YXQgMDg6MDAsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gT24gVGh1LCBOb3YgMTYsIDIwMjMgYXQgMTA6
Mjg6NTBBTSAtMDcwMCwgU2ltb24gR2xhc3Mgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBB
ZGQgYSBjb21wYXRpYmxlIHN0cmluZyBmb3IgYmlubWFuLCBzbyB3ZSBjYW4gZXh0ZW5kIGZpeGVk
LXBhcnRpdGlvbnMKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGluIHZhcmlvdXMgd2F5cy4KPiA+ID4g
PiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTaW1v
biBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IC0tLQo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IChubyBjaGFuZ2VzIHNpbmNl
IHY1KQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IENoYW5nZXMg
aW4gdjU6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAtIEFkZCAjYWRkcmVzcy9zaXplLWNlbGxzIGFu
ZCBwYXJ0ZXJuUHJvcGVydGllcwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gLSBEcm9wICRyZWYgdG8g
Zml4ZWQtcGFydGl0aW9ucy55YW1sCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAtIERyb3AgJ3NlbGVj
dDogZmFsc2UnCj4gPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gQ2hh
bmdlcyBpbiB2NDoKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IC0gQ2hhbmdlIHN1YmplY3QgbGluZQo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IENoYW5nZXMgaW4gdjM6
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAtIERyb3AgZml4ZWQtcGFydGl0aW9uIGFkZGl0aW9uYWwg
Y29tcGF0aWJsZSBzdHJpbmcKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IC0gRHJvcCBmaXhlZC1wYXJ0
aXRpb25zIGZyb20gdGhlIGV4YW1wbGUKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IC0gTWVudGlvbiB1
c2Ugb2YgY29tcGF0aWJsZSBpbnN0ZWFkIG9mIGxhYmVsCj4gPiA+ID4gPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiA+ID4gPiA+ID4gPiA+
IC0gRHJvcCBtZW50aW9uIG9mICdlbmhhbmNlZCBmZWF0dXJlcycgaW4gZml4ZWQtcGFydGl0aW9u
cy55YW1sCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAtIE1lbnRpb24gQmlubWFuIGlucHV0IGFuZCBv
dXRwdXQgcHJvcGVydGllcwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gLSBVc2UgcGxhaW4gcGFydGl0
aW9uQHh4eCBmb3IgdGhlIG5vZGUgbmFtZQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ICAuLi4vYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlhbWwgICAg
ICAgfCA2OCArKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgLi4uL2Jp
bmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbnMueWFtbCAgIHwgIDEgKwo+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICA1ICsrCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA3NCBpbnNl
cnRpb25zKCspCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4ueWFtbAo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlu
bWFuLnlhbWwKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjMyOTIxNzU1MGE5OAo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi55
YW1sCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMCwwICsxLDY4IEBACj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xh
dXNlKQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyMgQ29weXJpZ2h0IDIwMjMgR29vZ2xlIExMQwo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyVZQU1MIDEuMgo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gKy0tLQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlhbWwjCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiArdGl0bGU6IEJpbm1hbiBmaXJtd2FyZSBsYXlvdXQKPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICttYWludGFpbmVyczoKPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ICsgIC0gU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArZGVzY3JpcHRpb246IHwKPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ICsgIFRoZSBiaW5tYW4gbm9kZSBwcm92aWRlcyBhIGxheW91dCBmb3IgZmly
bXdhcmUsIHVzZWQgd2hlbiBwYWNrYWdpbmcgZmlybXdhcmUKPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ICsgIGZyb20gbXVsdGlwbGUgcHJvamVjdHMuIEl0IGlzIGJhc2VkIG9uIGZpeGVkLXBhcnRpdGlv
bnMsIHdpdGggc29tZQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgZXh0ZW5zaW9ucywgYnV0IHVz
ZXMgJ2NvbXBhdGlibGUnIHRvIGluZGljYXRlIHRoZSBjb250ZW50cyBvZiB0aGUgbm9kZSwgdG8K
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIGF2b2lkIHBlcnR1cmJpbmcgb3IgY29uZnVzaW5nIGV4
aXN0aW5nIGluc3RhbGxhdGlvbnMgd2hpY2ggdXNlICdsYWJlbCcgZm9yIGEKPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ICsgIHBhcnRpY3VsYXIgcHVycG9zZS4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIEJpbm1hbiBzdXBwb3J0cyBwcm9wZXJ0aWVzIHVzZWQg
YXMgaW5wdXRzIHRvIHRoZSBmaXJtd2FyZS1wYWNrYWdpbmcgcHJvY2VzcywKPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ICsgIHN1Y2ggYXMgdGhvc2Ugd2hpY2ggY29udHJvbCBhbGlnbm1lbnQgb2YgcGFy
dGl0aW9ucy4gVGhpcyBiaW5kaW5nIGFkZHJlc3Nlcwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAg
dGhlc2UgJ2lucHV0JyBwcm9wZXJ0aWVzLiBGb3IgZXhhbXBsZSwgaXQgaXMgY29tbW9uIGZvciB0
aGUgJ3JlZycgcHJvcGVydHkKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIChhbiAnb3V0cHV0JyBw
cm9wZXJ0eSkgdG8gYmUgc2V0IGJ5IEJpbm1hbiwgYmFzZWQgb24gdGhlIGFsaWdubWVudCByZXF1
ZXN0ZWQKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIGluIHRoZSBpbnB1dC4KPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIE9uY2UgcHJvY2Vzc2luZyBpcyBj
b21wbGV0ZSwgaW5wdXQgcHJvcGVydGllcyBoYXZlIG1vc3RseSBzZXJ2ZWQgdGhlaXIKPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ICsgIHB1cnBvc2UsIGF0IGxlYXN0IHVudGlsIHRoZSBmaXJtd2FyZSBp
cyByZXBhY2tlZCBsYXRlciwgZS5nLiBkdWUgdG8gYQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAg
ZmlybXdhcmUgdXBkYXRlLiBUaGUgJ2ZpeGVkLXBhcnRpdGlvbnMnIGJpbmRpbmcgc2hvdWxkIHBy
b3ZpZGUgZW5vdWdoCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICBpbmZvcm1hdGlvbiB0byByZWFk
IHRoZSBmaXJtd2FyZSBhdCBydW50aW1lLCBpbmNsdWRpbmcgZGVjb21wcmVzc2lvbiBpZgo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gKyAgbmVlZGVkLgo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gPiA+ID4gSG93IGlzIHRoaXMgZ29pbmcgdG8gd29yayBleGFjdGx5PyBiaW5tYW4gcmVh
ZHMgdGhlc2Ugbm9kZXMgYW5kIHRoZW4KPiA+ID4gPiA+ID4gPiA+ID4gPiB3cml0ZXMgb3V0ICdm
aXhlZC1wYXJ0aXRpb25zJyBub2Rlcy4gQnV0IHRoZW4geW91J3ZlIGxvc3QgdGhlIGJpbm1hbgo+
ID4gPiA+ID4gPiA+ID4gPiA+IHNwZWNpZmMgcGFydHMgbmVlZGVkIGZvciByZXBhY2tpbmcuCj4g
PiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IE5vLCB0aGV5IGFyZSB0aGUgc2FtZSBu
b2RlLiBJIGRvIHdhbnQgdGhlIGV4dHJhIGluZm9ybWF0aW9uIHRvIHN0aWNrCj4gPiA+ID4gPiA+
ID4gPiA+IGFyb3VuZC4gU28gbG9uZyBhcyBpdCBpcyBjb21wYXRpYmxlIHdpdGggZml4ZWQtcGFy
dGl0aW9uIGFzIHdlbGwsIHRoaXMKPiA+ID4gPiA+ID4gPiA+ID4gc2hvdWxkIHdvcmsgT0suCj4g
PiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gSG93IGNhbiBpdCBiZSBib3RoPyBUaGUgcGFy
dGl0aW9ucyBub2RlIGNvbXBhdGlibGUgY2FuIGJlIGVpdGhlcgo+ID4gPiA+ID4gPiA+ID4gJ2Zp
eGVkLXBhcnRpdGlvbnMnIG9yICdiaW5tYW4nLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
Q2FuIHdlIG5vdCBhbGxvdyBpdCB0byBiZSBib3RoPyBJIGhhdmUgdHJpZWQgdG8gYWRqdXN0IHRo
aW5ncyBpbgo+ID4gPiA+ID4gPiA+IHJlc3BvbnNlIHRvIGZlZWRiYWNrIGJ1dCBwZXJoYXBzIHRo
ZSBmZWVkYmFjayB3YXMgbGVhZGluZyBtZSBkb3duIHRoZQo+ID4gPiA+ID4gPiA+IHdyb25nIHBh
dGg/Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFN1cmUsIGJ1dCB0aGVuIHRoZSBzY2hlbWEgaGFz
IHRvIGFuZCB0aGF0IG1lYW5zIGV4dGVuZGluZwo+ID4gPiA+ID4gPiBmaXhlZC1wYXJ0aXRpb25z
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IENhbiB3ZSBjcm9zcyB0aGF0IGJyaWRnZSBsYXRlcj8gVGhl
cmUgbWlnaHQgYmUgcmVzaXN0YW5jZSB0byBpdC4gSSdtCj4gPiA+ID4gPiBub3Qgc3VyZS4gRm9y
IG5vdywgcGVyaGFwcyBqdXN0IGEgYmlubWFuIGNvbXBhdGlibGUgd29ya3Mgd2VsbCBlbm91Z2gK
PiA+ID4gPiA+IHRvIG1ha2UgcHJvZ3Jlc3MuCj4gPiA+ID4KPiA+ID4gPiBJcyB0aGVyZSBhbnkg
d2F5IHRvIG1ha2UgcHJvZ3Jlc3Mgb24gdGhpcz8gSSB3b3VsZCBsaWtlIHRvIGhhdmUKPiA+ID4g
PiBzb2Z0d2FyZSB3aGljaCBkb2Vzbid0IHVuZGVyc3RhbmQgdGhlIGJpbm1hbiBjb21wYXRpYmxl
IHRvIGF0IGxlYXN0IGJlCj4gPiA+ID4gYWJsZSB0byB1bmRlcnN0YW5kIHRoZSBmaXhlZC1wYXJ0
aXRpb24gY29tcGF0aWJsZS4gSXMgdGhhdCBhY2NlcHRhYmxlPwo+ID4gPgo+ID4gPiBUaGVyZSdz
IG9ubHkgMiB3YXlzIHRoYXQgaXQgY2FuIHdvcmsuIEVpdGhlciBiaW5tYW4gd3JpdGVzIG91dAo+
ID4gPiBmaXhlZC1wYXJ0aXRpb24gbm9kZXMgZHJvcHBpbmcvcmVwbGFjaW5nIGFueXRoaW5nIG9u
bHkgZGVmaW5lZCBmb3IKPiA+ID4gYmlubWFuIG9yIGZpeGVkLXBhcnRpdGlvbiBpcyBleHRlbmRl
ZCB0byBpbmNsdWRlIHdoYXQgYmlubWFuIG5lZWRzLgo+ID4KPiA+IE9LLCB0aGVuIEkgc3VwcG9z
ZSB0aGUgYmVzdCB3YXkgaXMgdG8gYWRkIGEgbmV3IGJpbm1hbiBjb21wYXRpYmxlLCBhcwo+ID4g
aXMgZG9uZSB3aXRoIHRoaXMgdjYgc2VyaWVzLiBQZW9wbGUgdGhlbiBuZWVkIHRvIGNob29zZSBp
dCBpbnN0ZWFkIG9mCj4gPiBmaXhlZC1wYXJ0aXRpb24uCj4KPiBJJ20gc29ycnkgdGhpcyBpcyBu
b3QgYXQgYWxsIHdoYXQgUm9iIHN1Z2dlc3RlZCwgb3IgZGlkIEkgdG90YWxseQo+IG1pc3VuZGVy
c3RhbmQgaGlzIGFuc3dlcj8KPgo+IEluIGJvdGggY2FzZXMgdGhlIHNvbHV0aW9uIGlzIHRvIGdl
bmVyYXRlIGEgImZpeGVkLXBhcnRpdGlvbiIgbm9kZS4gTm93Cj4gdXAgdG8geW91IHRvIGRlY2lk
ZSB3aGV0aGVyIGJpbm1hbiBzaG91bGQgYWRhcHQgdGhlIG91dHB1dCB0byB0aGUKPiBjdXJyZW50
IHNjaGVtYSwgb3IgaWYgdGhlIGN1cnJlbnQgc2NoZW1hIHNob3VsZCBiZSBleHRlbmRlZCB0bwo+
IHVuZGVyc3RhbmQgYWxsIGJpbm1hbidzIG91dHB1dC4KPgo+IEF0IGxlYXN0IHRoYXQgaXMgbXkg
dW5kZXJzdGFuZGluZyBhbmQgYWxzbyB3aGF0IEkga2luZCBvZiBhZ3JlZSB3aXRoLgoKSSBkbyB3
YW50IHRvIGJpbm1hbiBzY2hlbWEgdG8gaW5jbHVkZSBhbGwgdGhlIGZlYXR1cmVzIG9mIEJpbm1h
bi4KClNvIGFyZSB5b3Ugc2F5aW5nIHRoYXQgdGhlcmUgc2hvdWxkIG5vdCBiZSBhICdiaW5tYW4n
ICBzY2hlbWEsIGJ1dCBJCnNob3VsZCBqdXN0IGFkZCBhbGwgdGhlIGJpbm1hbiBwcm9wZXJ0aWVz
IHRvIHRoZSBmaXhlZC1wYXJ0aXRpb24Kc2NoZW1hPwoKUmVnYXJkcywKU2ltb24KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
