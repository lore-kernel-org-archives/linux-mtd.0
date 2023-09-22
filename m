Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2C1CE7AB8
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 19:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Df/vKtcdjdCI348pqDXR/PWZnY0dYTFDRyFvO9QB29M=; b=uSLCI7XnqrkKG4
	p0viHbFFIAN3WxLhv1+s+IsE0exq429eGUAt86gFuqRKrWZuPEZEegRxcAEZ2aufbsQfcJQ9oLPRb
	Rheu3bQoRBBB+tE/+6k82rEbbL9u8yj3GnKKmw0Dvw8L/lN4EeSH8CKdO+IFPyFVF5TapKR+X/+Kl
	BBIvKMeQ8cAW3MbYASCjzAzIpj1/agnbdxGXijw9h6Ij2f4VOaoyu0iWVhYxluajD9o1oQ+PiZp12
	WEeJmwX0AVn+b0o3NfjufJqM82B1i9IdNey/sKBgTeSo0/dy1PA57Wjuw86r2gAcCd02BBf9ZrMYB
	E40c4VMl+VH7RTmH9aBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjm3e-009jE6-2U;
	Fri, 22 Sep 2023 19:43:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjm3a-009jDO-21
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 19:43:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0F604B82429
	for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 19:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683BBC433C7
	for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 19:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695411796;
	bh=A4YRRXIxZfuP4hSCrSlSbxBU3yaGfiOmZNf7I2N3gEk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mkhJijmgNzhzaiyJy0L2fdcWOoEyj7Xb33pKZQ6HWXtj/a62OqvRUfPfk+LozuoHA
	 NAgz4bgZL0CeqyJD1vwf5rHLS5s5aIfQ6YwmqelUxJS6M4bK9P7MRK08C/UsZt++C0
	 eOwNKWmFQRiA+TRVLMEEKtcomCfNqy6j+zap1dQDSsZjIAOHnkGZJXUdiRw+ryVj4o
	 mYfYA7kowAq2XV/5PZ+TxWvb6jMVp1W2e6hYxLK1zdxDnvdXuKO0xIoCq5Wzq8z8kO
	 wh/KJvjWxITTbXdDv/xgVvyUw6cFPcjoAJHKTHhT/k7x0INUdX5EskofeFXUMQm4R1
	 jHIVHY2r5CQCA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50307759b65so4682235e87.0
        for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 12:43:16 -0700 (PDT)
X-Gm-Message-State: AOJu0YwTY3hez5ktYq2NlUnVhRoCLZFCCOshOSXefK39+YvBW6Efw9AJ
	gAJRwjjItqEodPwNe1AudNsYh67yPYo4cujPSg==
X-Google-Smtp-Source: AGHT+IHykPmoXWd5RfRa0OjFcxDuEZz0rP2JzY8ueouRM4ujoevuhdbvkTcM0rnlltiKoj8kM26YvC0aFr03f+Nlwzs=
X-Received: by 2002:a05:6512:3e1f:b0:500:daf6:3898 with SMTP id
 i31-20020a0565123e1f00b00500daf63898mr566690lfv.26.1695411794619; Fri, 22 Sep
 2023 12:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
 <CAL_Jsq+WuYDU+yY98opTHr1PT-J9mFYJQBjVMnk+FSWLDUO33w@mail.gmail.com>
 <CAPnjgZ1pfxaMG1n5yOBhiOhsNrRjck1K92U7Ga=+VTY_jjjrVg@mail.gmail.com>
 <20230922174649.GA3320366-robh@kernel.org> <CAPnjgZ3ojfAv=BHqOhM=-NnYqCm81Ny=PsGKiNphKTmw++fk9w@mail.gmail.com>
In-Reply-To: <CAPnjgZ3ojfAv=BHqOhM=-NnYqCm81Ny=PsGKiNphKTmw++fk9w@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 22 Sep 2023 14:43:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJqvyP=c93DHDO8A5RXv7Lz_Z7eEHSbJQ=JCo+qPVhSfg@mail.gmail.com>
Message-ID: <CAL_JsqJqvyP=c93DHDO8A5RXv7Lz_Z7eEHSbJQ=JCo+qPVhSfg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
To: Simon Glass <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, U-Boot Mailing List <u-boot@lists.denx.de>, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_124318_966125_6C5F9E56 
X-CRM114-Status: GOOD (  40.20  )
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

T24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgMToxMuKAr1BNIFNpbW9uIEdsYXNzIDxzamdAY2hyb21p
dW0ub3JnPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IE9uIEZyaSwgMjIgU2VwdCAyMDIzIGF0IDEx
OjQ2LCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmks
IFNlcCAyMiwgMjAyMyBhdCAxMTowMToxOEFNIC0wNjAwLCBTaW1vbiBHbGFzcyB3cm90ZToKPiA+
ID4gSGkgUm9iLAo+ID4gPgo+ID4gPiBPbiBGcmksIDIyIFNlcHQgMjAyMyBhdCAxMDowMCwgUm9i
IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBUaHUs
IFNlcCAyMSwgMjAyMyBhdCAxOjQ14oCvUE0gU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+
IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IEJpbm1hblsxXSBpcyBhIHRvb2wgZm9yIGNyZWF0
aW5nIGZpcm13YXJlIGltYWdlcy4gSXQgYWxsb3dzIHlvdSB0bwo+ID4gPiA+ID4gY29tYmluZSB2
YXJpb3VzIGJpbmFyaWVzIGFuZCBwbGFjZSB0aGVtIGluIGFuIG91dHB1dCBmaWxlLgo+ID4gPiA+
ID4KPiA+ID4gPiA+IEJpbm1hbiB1c2VzIGEgRFQgc2NoZW1hIHRvIGRlc2NyaWJlIGFuIGltYWdl
LCBpbiBlbm91Z2ggZGV0YWlsIHRoYXQKPiA+ID4gPiA+IGl0IGNhbiBiZSBhdXRvbWF0aWNhbGx5
IGJ1aWx0IGZyb20gY29tcG9uZW50IHBhcnRzLCBkaXNhc3NlbWJsZWQsCj4gPiA+ID4gPiByZXBs
YWNlZCwgbGlzdGVkLCBldGMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSW1hZ2VzIGFyZSB0eXBpY2Fs
bHkgc3RvcmVkIGluIGZsYXNoLCB3aGljaCBpcyB3aHkgdGhpcyBiaW5kaW5nIGlzCj4gPiA+ID4g
PiB0YXJnZXRlZCBhdCBtdGQuIFByZXZpb3VzIGRpc2N1c3Npb24gaXMgYXQgWzJdIFszXS4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBbMV0gaHR0cHM6Ly91LWJvb3QucmVhZHRoZWRvY3MuaW8vZW4vc3Rh
YmxlL2RldmVsb3AvcGFja2FnZS9iaW5tYW4uaHRtbAo+ID4gPiA+ID4gWzJdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3UtYm9vdC8yMDIzMDgyMTE4MDIyMC4yNzI0MDgwLTMtc2pnQGNocm9taXVt
Lm9yZy8KPiA+ID4gPiA+IFszXSBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9kZXZpY2V0
cmVlL21zZzYyNjE0OS5odG1sCj4gPiA+ID4KPiA+ID4gPiBZb3UgbWlzc2VkOgo+ID4gPiA+Cj4g
PiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL2RldmljZXRyZWUtb3JnL2R0LXNjaGVtYS9wdWxsLzEx
MAo+ID4gPiA+Cj4gPiA+ID4gd2hlcmUgSSBzYWlkOiBXZSBjZXJ0YWlubHkgc2hvdWxkbid0IGR1
cGxpY2F0ZSB0aGUgZXhpc3RpbmcgcGFydGl0aW9ucwo+ID4gPiA+IGJpbmRpbmdzLiBXaGF0J3Mg
bWlzc2luZyBmcm9tIHRoZW0gKEkgYXNzdW1lIHdlJ3JlIG1vc3RseSB0YWxraW5nCj4gPiA+ID4g
YWJvdXQgImZpeGVkLXBhcnRpdGlvbnMiIHdoaWNoIGhhcyBiZWVuIGFyb3VuZCBmb3JldmVyIEkg
dGhpbmsgKGJlZm9yZQo+ID4gPiA+IG1lKSk/Cj4gPiA+ID4KPiA+ID4gPiBUbyByZXBlYXQsIHVu
bGVzcyB0aGVyZSBpcyBzb21lIHJlYXNvbiBiaW5tYW4gcGFydGl0aW9ucyBjb25mbGljdCB3aXRo
Cj4gPiA+ID4gZml4ZWQtcGFydGl0aW9ucywgeW91IG5lZWQgdG8gc3RhcnQgdGhlcmUgYW5kIGV4
dGVuZCBpdC4gRnJvbSB3aGF0J3MKPiA+ID4gPiBwb3N0ZWQgaGVyZSwgaXQgbmVpdGhlciBjb25m
bGljdHMgbm9yIG5lZWRzIGV4dGVuZGluZy4KPiA+ID4KPiA+ID4gSSB0aGluayBhdCB0aGlzIHBv
aW50IEkgYW0ganVzdCBob3BlbGVzc2x5IGNvbmZ1c2VkLiBIYXZlIHlvdSB0YWtlbiBhCj4gPiA+
IGxvb2sgYXQgdGhlIGJpbm1hbiBzY2hlbWE/IFsxXQo+ID4KPiA+IFdoeSBkbyBJIG5lZWQgdG8/
IFRoYXQncyB1c2VkIGZvciBzb21lIHRvb2wgYW5kIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggYQo+
ID4gZGV2aWNlJ3MgRFRCLiBIb3dldmVyLCBJIHRob3VnaHQgc29tZXdoZXJlIGluIHRoaXMgZGlz
Y3Vzc2lvbiB5b3Ugc2hvd2VkCj4gPiBpdCB1bmRlciBhIGZsYXNoIGRldmljZSBub2RlLgo+Cj4g
WWVzLCB0aGF0IGlzIHRoZSBpbnRlbnQgKHVuZGVyIGEgZmxhc2ggbm9kZSkuCj4KPiA+IFRoZW4g
SSBjYXJlIGJlY2F1c2UgdGhlbiBpdCBvdmVybGFwcyB3aXRoCj4gPiB3aGF0IHdlIGFscmVhZHkg
aGF2ZSBmb3IgcGFydGl0aW9ucy4gSWYgSSBtaXN1bmRlcnN0b29kIHRoYXQsIHRoZW4ganVzdAo+
ID4gcHV0IHlvdXIgc2NoZW1hIHdpdGggeW91ciB0b29sLiBPbmx5IHVzZXJzIG9mIHRoZSB0b29s
IHNob3VsZCBjYXJlIGFib3V0Cj4gPiB0aGUgdG9vbCdzIHNjaGVtYS4KPgo+IE9LLiBJIGJlbGll
dmUgdGhhdCBiaW5tYW4gd2lsbCBmaXQgaW50byBib3RoIGNhbXBzLCBzaW5jZSBpdHMgaW5wdXQg
aXMKPiBub3QgbmVjZXNzYXJpbHkgZnVsbHkgZm9ybWVkLiBFLmcuIGlmIHlvdSBkb24ndCBzcGVj
aWZ5IHRoZSBvZmZzZXQgb2YKPiBhbiBlbnRyeSwgdGhlbiBpdCB3aWxsIGJlIHBhY2tlZCBhdXRv
bWF0aWNhbGx5LiBCdXQgdGhlIG91dHB1dCBpcwo+IGZ1bGx5IGZvcm1lZCwgaW4gdGhhdCBCaW5t
YW4gbm93IGtub3dzIHRoZSBvZmZzZXQgc28gY2FuIHdyaXRlIGl0IHRvCj4gdGhlIERULgoKSSBz
dXBwb3NlIGl0IGNvdWxkIHRha2UgaXRzIG93biBmb3JtYXQgYXMgaW5wdXQgYW5kIHRoZW4gd3Jp
dGUgb3V0CnNvbWV0aGluZyBkaWZmZXJlbnQgZm9yIHRoZSAib24gdGhlIGRldmljZSIgZm9ybWF0
IChpLmUuCmZpeGVkLXBhcnRpdGlvbnMpLiBBdCBsZWFzdCBmb3IgdGhlIGR5bmFtaWMgb2Zmc2V0
cywgd2UgbWF5IG5lZWQKc29tZXRoaW5nIGFsbG93ZWQgZm9yIGJpbm1hbiBpbnB1dCwgYnV0IG5v
dCBhbGxvd2VkIG9uIGRldmljZS4gSW4KZ2VuZXJhbCwgdGhlcmUgaXMgc3VwcG9ydCBmb3IgcGFy
dGl0aW9ucyB3aXRob3V0IGFkZHJlc3Nlcy9vZmZzZXRzLApidXQgb25seSBmb3IgcGFydGl0aW9u
cyB0aGF0IGhhdmUgc29tZSBvdGhlciB3YXkgdG8gZmlndXJlIHRoYXQgb3V0CihvbiBkaXNrIHBh
cnRpdGlvbiBpbmZvKS4KClRoZXJlJ3MgYWxzbyB0aGUgaW1hZ2UgZmlsZW5hbWUgd2hpY2ggZG9l
c24ndCByZWFsbHkgYmVsb25nIGluIHRoZSBvbgpkZXZpY2UgcGFydGl0aW9ucy4gU28gbWF5YmUg
dGhlIGlucHV0IGFuZCBvdXRwdXQgc2NoZW1hcyBzaG91bGQgYmUKc2VwYXJhdGUuCgo+ID4gPiBJ
IHNhdyB0aGlzIGZpbGUsIHdoaWNoIHNlZW1zIHRvIGV4dGVuZCBhIHBhcnRpdGlvbi4KPiA+ID4K
PiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2Jy
Y20sYmNtNDkwOC1wYXJ0aXRpb25zLnlhbWwKPiA+Cj4gPiBJSVJDLCB0aGF0J3MgYSBkaWZmZXJl
bnQgdHlwZSB3aGVyZSBwYXJ0aXRpb24gbG9jYXRpb25zIGFyZSBzdG9yZWQgaW4KPiA+IHRoZSBm
bGFzaCwgc28gd2UgZG9uJ3QgbmVlZCBsb2NhdGlvbiBhbmQgc2l6ZSBpbiBEVC4KPgo+IE9LLgo+
Cj4gPgo+ID4gPgo+ID4gPiBJIHdhcyBhc3N1bWluZyB0aGF0IEkgc2hvdWxkIGNyZWF0ZSBhIHRv
cC1sZXZlbCBjb21wYXRpYmxlID0gImJpbm1hbiIKPiA+ID4gbm9kZSwgd2l0aCBzdWJub2RlcyBs
aWtlIGNvbXBhdGlibGUgPSAiYmlubWFuLGJsMzEtYXRmIiwgZm9yIGV4YW1wbGUuCj4gPiA+IEkg
c2hvdWxkIHVzZSB0aGUgY29tcGF0aWJsZSBzdHJpbmcgdG8gaW5kaWNhdGUgdGhlIGNvbnRlbnRz
LCByaWdodD8KPiA+Cj4gPiBZZXMgZm9yIHN1Ym5vZGVzLCBhbmQgd2UgYWxyZWFkeSBoYXZlIHNv
bWUgc29tZXdoYXQgc3RhbmRhcmQgb25lcyBmb3IKPiA+ICJ1LWJvb3QiIGFuZCAidS1ib290LWVu
diIuIFRob3VnaCBoaXN0b3JpY2FsbHksICJsYWJlbCIgd2FzIHVzZWQuCj4KPiBCaW5tYW4gaGFz
IGNvbW1vbiBwcm9wZXJ0aWVzIGZvciBhbGwgZW50cmllcywgaW5jbHVkaW5nICJjb21wcmVzcyIK
PiB3aGljaCBzZXRzIHRoZSBjb21wcmVzc2lvbiBhbGdvcml0aG0uCgpJIHNlZSBubyBpc3N1ZSB3
aXRoIGFkZGluZyB0aGF0LiBJdCBzZWVtcyB1c2VmdWwgYW5kIHNvbWV0aGluZyBtaXNzaW5nCmlu
IHRoZSBleGlzdGluZyBwYXJ0aXRpb24gc2NoZW1hcy4KCj4gU28gcGVyaGFwcyBJIHNob3VsZCBz
dGFydCBieSBkZWZpbmluZyBhIG5ldyBiaW5tYW4sYmwzMS1hdGYgd2hpY2ggaGFzCj4gY29tbW9u
IHByb3BlcnRpZXMgZnJvbSBhbiAiYmlubWFuLGVudHJ5IiBkZWZpbml0aW9uPwoKSSBkb24ndCB1
bmRlcnN0YW5kIHRoZSBiaW5tYW4gcHJlZml4LiBUaGUgY29udGVudHMgYXJlIEFURiAob3IgVEYt
QQpub3cpLiBXaG8gd3JvdGUgaXQgdG8gdGhlIGZsYXNoIGltYWdlIGlzIG5vdCByZWxldmFudC4K
CldlIGFscmVhZHkgaGF2ZSBzb21lIGNvbXBhdGlibGVzIGluIHVzZS4gV2Ugc2hvdWxkIHJldXNl
IHRoZW0gaWYKcG9zc2libGUuIE5vdCBzdXJlIGFib3V0IFRGLUEgdGhvdWdoLgoKUm9iCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
