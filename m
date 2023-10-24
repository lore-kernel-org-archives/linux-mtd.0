Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73777C00A8F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SW8mmvipvZBS1outYdqEQDyOx8Zn+OTrTlRpNo5JwHQ=; b=cvAEIXf8CAd113
	j8e6HHdIUEp2I20KNKVjvb8QVG70RIoNCoKvzOUxxoKKHbYmK3GvVDqkNGVHg8Sq6vd50XAY4Z63a
	EcebPozEeQjhTYNF4HO3+ZpkxesUugZ4c9eXG7J7PtaNaXIKMNuhAHoexREN0WwrSSUSfrN1H11nL
	7AgyPGTzINPt2dfU/aWU9YnFVgy1eFi+yLVyMaRvIwO1bIwWaql8/ND88gSbVrYOUsFxdkhoQr9Gv
	MZx25XEh8CJ6h6bDbkWsjPLCvWnJ+iPvUZLn9ZAd+H0rhqs95WFuFrzXTTQYEYNVQmrQACWdtvR5S
	wm91ym7Vlgph7Y+f+jaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvKHW-00ATpE-1F;
	Tue, 24 Oct 2023 16:29:26 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvKHT-00ATnu-0z
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 16:29:24 +0000
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5845a94dae1so1213606eaf.0
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 09:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698164962; x=1698769762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lyvP8rg0cN3uMaVGkUZJYnGyShBPgeG7niyvmwU0I7E=;
        b=kcpjJLKEFJge6grNtKkkGLrDjyz0ZwWhUkgljDLLYgT8QYONPQ/IAexSqbgC2+HhFQ
         wVyPsTbk9OwVL7JYscZoAq2BrJAQhMR6iNo/ZxTN3XxB3Cvd5s4Ftk5YCXG4LYxy0p6r
         X3uq4hOxd8Hq1CnrLNuPjSTu6A+AM3QSDs34czeJUOs7ebsyxyO5U8fjU7IfRtcC9CfL
         hJljmWD/jU7CaYjs2NJt90IuJ9+HqFAwo7uYKT4xsAtP7BExGHegHV3Tkx6zkGX62qPE
         JwYMEPXBFYUIoKgv6Z0Y4EfQh2LPlpdZto3a1w1/NDirmdDgoQZHczqd+GmuCgTogC9r
         S2Lw==
X-Gm-Message-State: AOJu0YxPbWeXHJAeg5MzZCGT3W5AXpYI3o0F4NZFd/yN5KDNRzJOwMzK
	XOWrITJMF5vKOZfcaNjTmw==
X-Google-Smtp-Source: AGHT+IHHMl2/oHWft2yTTAv4LNNI02Tu07uYTbFvwLbExU9mIcFCwW29I/FboUp1wYBFIRXZrsw17A==
X-Received: by 2002:a4a:e751:0:b0:571:aceb:26d3 with SMTP id n17-20020a4ae751000000b00571aceb26d3mr7013547oov.4.1698164961620;
        Tue, 24 Oct 2023 09:29:21 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id di11-20020a0568201e8b00b0057b43a25deasm1997587oob.3.2023.10.24.09.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 09:29:20 -0700 (PDT)
Received: (nullmailer pid 4048334 invoked by uid 1000);
	Tue, 24 Oct 2023 16:29:19 -0000
Date: Tue, 24 Oct 2023 11:29:19 -0500
From: Rob Herring <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Michael Walle <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] dt-bindings: mtd: binman-partitions: Add
 alignment properties
Message-ID: <20231024162919.GC3707756-robh@kernel.org>
References: <20231009220436.2164245-1-sjg@chromium.org>
 <20231009220436.2164245-3-sjg@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009220436.2164245-3-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_092923_339121_83923993 
X-CRM114-Status: GOOD (  33.91  )
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

T24gTW9uLCBPY3QgMDksIDIwMjMgYXQgMDQ6MDQ6MTVQTSAtMDYwMCwgU2ltb24gR2xhc3Mgd3Jv
dGU6Cj4gQWRkIHRocmVlIHByb3BlcnRpZXMgZm9yIGNvbnRyb2xsaW5nIGFsaWdubWVudCBvZiBw
YXJ0aXRpb25zLCBha2EKPiAnZW50cmllcycgaW4gYmlubWFuLgo+IAo+IEZvciBub3cgdGhlcmUg
aXMgbm8gZXhwbGljaXQgbWVudGlvbiBvZiBoaWVyYXJjaHksIHNvIGEgJ3NlY3Rpb24nIGlzCj4g
anVzdCB0aGUgJ2Jpbm1hbicgbm9kZS4KPiAKPiBUaGVzZSBuZXcgcHJvcGVydGllcyBhcmUgaW5w
dXRzIHRvIHRoZSBwYWNrYWdpbmcgcHJvY2VzcywgYnV0IGFyZSBhbHNvCj4gbmVlZGVkIGlmIHRo
ZSBmaXJtd2FyZSBpcyByZXBhY2tlZCwgdG8gZW5zdXJlIHRoYXQgYWxpZ25tZW50Cj4gY29uc3Ry
YWludHMgYXJlIG5vdCB2aW9sYXRlZC4gVGhlcmVmb3JlIHRoZXkgYXJlIHByb3ZpZGVkIGFzIHBh
cnQgb2YKPiB0aGUgc2NoZW1hLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIEdsYXNzIDxzamdA
Y2hyb21pdW0ub3JnPgo+IC0tLQo+IAo+IChubyBjaGFuZ2VzIHNpbmNlIHYyKQo+IAo+IENoYW5n
ZXMgaW4gdjI6Cj4gLSBGaXggJ2EnIHR5cG8gaW4gY29tbWl0IG1lc3NhZ2UKPiAKPiAgLi4uL210
ZC9wYXJ0aXRpb25zL2Jpbm1hbi1wYXJ0aXRpb24ueWFtbCAgICAgIHwgMzkgKysrKysrKysrKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlu
bWFuLXBhcnRpdGlvbi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9wYXJ0aXRpb25zL2Jpbm1hbi1wYXJ0aXRpb24ueWFtbAo+IGluZGV4IDM1YTMyMDM1OWVjMS4u
OGU4YTNiNmQ0ZDE0IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLXBhcnRpdGlv
bi55YW1sCj4gQEAgLTI4LDYgKzI4LDQyIEBAIHByb3BlcnRpZXM6Cj4gICAgICAgICAgICAtIGNv
bnN0OiB1LWJvb3QgICAgICAgIyB1LWJvb3QuYmluIGZyb20gVS1Cb290IHByb2plY3QKPiAgICAg
ICAgICAgIC0gY29uc3Q6IGF0Zi1ibDMxICAgICAjIGJsMzEuYmluIG9yIGJsMzEuZWxmIGZyb20g
VEYtQSBwcm9qZWN0Cj4gIAo+ICsgIGFsaWduOgo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgVGhp
cyBzZXRzIHRoZSBhbGlnbm1lbnQgb2YgdGhlIGVudHJ5LiBUaGUgZW50cnkgb2Zmc2V0IGlzIGFk
anVzdGVkCj4gKyAgICAgIHNvIHRoYXQgdGhlIGVudHJ5IHN0YXJ0cyBvbiBhbiBhbGlnbmVkIGJv
dW5kYXJ5IHdpdGhpbiB0aGUgY29udGFpbmluZwo+ICsgICAgICBzZWN0aW9uIG9yIGltYWdlLiBG
b3IgZXhhbXBsZSDigJhhbGlnbiA9IDwxNj7igJkgbWVhbnMgdGhhdCB0aGUgZW50cnkgd2lsbAo+
ICsgICAgICBzdGFydCBvbiBhIDE2LWJ5dGUgYm91bmRhcnkuIFRoaXMgbWF5IG1lYW4gdGhhdCBw
YWRkaW5nIGlzIGFkZGVkIGJlZm9yZQoKT25seSB5b3VyIGV4YW1wbGUgZGVmaW5lcyB0aGF0IGFs
aWdubWVudCBpcyBpbiBieXRlcy4KCj4gKyAgICAgIHRoZSBlbnRyeS4gVGhlIHBhZGRpbmcgaXMg
cGFydCBvZiB0aGUgY29udGFpbmluZyBzZWN0aW9uIGJ1dCBpcyBub3QKPiArICAgICAgaW5jbHVk
ZWQgaW4gdGhlIGVudHJ5LCBtZWFuaW5nIHRoYXQgYW4gZW1wdHkgc3BhY2UgbWF5IGJlIGNyZWF0
ZWQgYmVmb3JlCj4gKyAgICAgIHRoZSBlbnRyeSBzdGFydHMuIEFsaWdubWVudCBzaG91bGQgYmUg
YSBwb3dlciBvZiAyLiBJZiDigJhhbGlnbuKAmSBpcyBub3QKPiArICAgICAgcHJvdmlkZWQsIG5v
IGFsaWdubWVudCBpcyBwZXJmb3JtZWQuCgpXb3VsZCBiZSBuaWNlIHRvIGhhdmUgc29tZSBjb25z
dHJhaW50cy4gVW5mb3J0dW5hdGVseSwgbm8gd2F5IHRvIHNheSAKJ3Bvd2VyIG9mIDInIGluIGpz
b24tc2NoZW1hICh3ZSBjb3VsZCBhZGQgc29tZXRoaW5nIHBvc3NpYmx5KSwgc28gdGhlIApvbmx5
IHdheSBpczoKCmVudW06IFsgMiwgNCwgOCwgMTYsIDMyLCA2NCwgLi4uIF0KCktpbmQgb2YgdmVy
Ym9zZSBpZiB3ZSBhZGQgYWxsIDMxIHBvc3NpYmlsaXRpZXMuLi4KCkNvdWxkIGFsc28gZG8gdGhp
czoKCm1pbml1bTogMgptYXhpbXVtOiAweDgwMDAwMDAwCm11bHRpcGxlT2Y6IDIKCj4gKwo+ICsg
IGFsaWduLXNpemU6Cj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9u
cy91aW50MzIKPiArICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICBUaGlzIHNldHMgdGhlIGFsaWdu
bWVudCBvZiB0aGUgZW50cnkgc2l6ZS4gRm9yIGV4YW1wbGUsIHRvIGVuc3VyZQo+ICsgICAgICB0
aGF0IHRoZSBzaXplIG9mIGFuIGVudHJ5IGlzIGEgbXVsdGlwbGUgb2YgNjQgYnl0ZXMsIHNldCB0
aGlzIHRvIDY0Lgo+ICsgICAgICBXaGlsZSB0aGlzIGRvZXMgbm90IGFmZmVjdCB0aGUgY29udGVu
dHMgb2YgdGhlIGVudHJ5IHdpdGhpbiBiaW5tYW4KPiArICAgICAgaXRzZWxmICh0aGUgcGFkZGlu
ZyBpcyBwZXJmb3JtZWQgb25seSB3aGVuIGl0cyBwYXJlbnQgc2VjdGlvbiBpcwo+ICsgICAgICBh
c3NlbWJsZWQpLCB0aGUgZW5kIHJlc3VsdCBpcyB0aGF0IHRoZSBlbnRyeSBlbmRzIHdpdGggdGhl
IHBhZGRpbmcKPiArICAgICAgYnl0ZXMsIHNvIG1heSBncm93LiBJZiDigJhhbGlnbi1zaXpl4oCZ
IGlzIG5vdCBwcm92aWRlZCwgbm8gYWxpZ25tZW50IGlzCj4gKyAgICAgIHBlcmZvcm1lZC4KPiAr
Cj4gKyAgYWxpZ24tZW5kOgo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5p
dGlvbnMvdWludDMyCj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgVGhpcyBzZXRzIHRoZSBh
bGlnbm1lbnQgb2YgdGhlIGVuZCBvZiBhbiBlbnRyeSB3aXRoIHJlc3BlY3QgdG8gdGhlCj4gKyAg
ICAgIGNvbnRhaW5pbmcgc2VjdGlvbi4gU29tZSBlbnRyaWVzIHJlcXVpcmUgdGhhdCB0aGV5IGVu
ZCBvbiBhbiBhbGlnbm1lbnQKPiArICAgICAgYm91bmRhcnksIHJlZ2FyZGxlc3Mgb2Ygd2hlcmUg
dGhleSBzdGFydC4gVGhpcyBkb2VzIG5vdCBtb3ZlIHRoZSBzdGFydAo+ICsgICAgICBvZiB0aGUg
ZW50cnksIHNvIHRoZSBjb250ZW50cyBvZiB0aGUgZW50cnkgd2lsbCBzdGlsbCBzdGFydCBhdCB0
aGUKPiArICAgICAgYmVnaW5uaW5nLiBCdXQgdGhlcmUgbWF5IGJlIHBhZGRpbmcgYXQgdGhlIGVu
ZC4gV2hpbGUgdGhpcyBkb2VzIG5vdAo+ICsgICAgICBhZmZlY3QgdGhlIGNvbnRlbnRzIG9mIHRo
ZSBlbnRyeSB3aXRoaW4gYmlubWFuIGl0c2VsZiAodGhlIHBhZGRpbmcgaXMKPiArICAgICAgcGVy
Zm9ybWVkIG9ubHkgd2hlbiBpdHMgcGFyZW50IHNlY3Rpb24gaXMgYXNzZW1ibGVkKSwgdGhlIGVu
ZCByZXN1bHQgaXMKPiArICAgICAgdGhhdCB0aGUgZW50cnkgZW5kcyB3aXRoIHRoZSBwYWRkaW5n
IGJ5dGVzLCBzbyBtYXkgZ3Jvdy4gSWYg4oCYYWxpZ24tZW5k4oCZCj4gKyAgICAgIGlzIG5vdCBw
cm92aWRlZCwgbm8gYWxpZ25tZW50IGlzIHBlcmZvcm1lZC4KPiArCj4gIGFkZGl0aW9uYWxQcm9w
ZXJ0aWVzOiBmYWxzZQo+ICAKPiAgZXhhbXBsZXM6Cj4gQEAgLTQwLDEwICs3NiwxMyBAQCBleGFt
cGxlczoKPiAgICAgICAgICBwYXJ0aXRpb25AMTAwMDAwIHsKPiAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJ1LWJvb3QiOwo+ICAgICAgICAgICAgICByZWcgPSA8MHgxMDAwMDAgMHhmMDAwMDA+
Owo+ICsgICAgICAgICAgICBhbGlnbi1zaXplID0gPDB4MTAwMD47Cj4gKyAgICAgICAgICAgIGFs
aWduLWVuZCA9IDwweDEwMDAwPjsKPiAgICAgICAgICB9Owo+ICAKPiAgICAgICAgICBwYXJ0aXRp
b25AMjAwMDAwIHsKPiAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhdGYtYmwzMSI7Cj4gICAg
ICAgICAgICAgIHJlZyA9IDwweDIwMDAwMCAweDEwMDAwMD47Cj4gKyAgICAgICAgICAgIGFsaWdu
ID0gPDB4NDAwMD47Cj4gICAgICAgICAgfTsKPiAgICAgIH07Cj4gLS0gCj4gMi40Mi4wLjYwOS5n
YmI3NmY0NjYwNi1nb29nCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
