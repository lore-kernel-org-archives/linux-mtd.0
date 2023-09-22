Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F7CCD484A
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 17:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IfzbIDJBJXjwqtYEKVA1y36zsmhgmF7Cs80b4lITA7A=; b=yuRhEWZaTZ0uao
	n/EjOnrgbevlPeHYIE7Ar96jNQ8kLb2Jn6PGhfshsW3vBiBKvOIQCtp7tWXWxLoDOi80O+cFwT67r
	fKtj0TmkXQaln3qgTHfKGApGRVJpfO+njCJ8TFK9kcLl7Mj/3ge96piHnglhEj1N9izIKCO2XCp9B
	6ZTD6g5UsrD8CU1K50QyJoV0yU5CzbeI8+mPrPBBqNyBO1Cunp49lbrfV4/qGgTGW+NwMhA4KCIDZ
	Zt0DwHGGpE15AtyNqzeqN9zbRV76klJ1wHwHZtnmg73hCpIXX7pXCcxAIUnKGTDoPuECK2ilO8k2i
	+v+P60AwEdygBDbgPZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkF2-009Xp6-1N;
	Fri, 22 Sep 2023 17:47:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkEv-009Xnl-2f
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 17:46:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 301E7CE248A;
	Fri, 22 Sep 2023 17:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C83C433C7;
	Fri, 22 Sep 2023 17:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695404811;
	bh=fFQxg4Rz4GjFZugxozdndSgNXISpfnkbSpJ11bW+6OA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jRLqWf9mSuD59sCEiQszieC9KPYDD/iNV/2RGV4Xdqt0cnH/s/H9SYypt0yo2zgmO
	 54MLtIg6ulX/hGC1S3Xv9FTFWVZghM3zlLb3pj2VrFUF973M24PScMfpZaZX8UwzD5
	 9GSE7xii8ByH5bCW7cuXWGHHeFFj7AyeCtk58Wa2anrTS6sM87Qz9bOsleIEY79qB6
	 0oOTRZORaulf4T/SSst+w+JOaqe7Gt6ikwlqVKwq6mAYs6qP6QSjsu/Bl2X8d1vSES
	 MbbWluj4wLah3zEVzS5+WR7tDxrFrm1Y/achLiOkrdBYoDYtWkcqPJX0ZLZFHNFOvk
	 9fBtxjPpFgIBg==
Received: (nullmailer pid 3342355 invoked by uid 1000);
	Fri, 22 Sep 2023 17:46:49 -0000
Date: Fri, 22 Sep 2023 12:46:49 -0500
From: Rob Herring <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, U-Boot Mailing List <u-boot@lists.denx.de>, linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
Message-ID: <20230922174649.GA3320366-robh@kernel.org>
References: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
 <CAL_Jsq+WuYDU+yY98opTHr1PT-J9mFYJQBjVMnk+FSWLDUO33w@mail.gmail.com>
 <CAPnjgZ1pfxaMG1n5yOBhiOhsNrRjck1K92U7Ga=+VTY_jjjrVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1pfxaMG1n5yOBhiOhsNrRjck1K92U7Ga=+VTY_jjjrVg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_104654_205398_1A347DC1 
X-CRM114-Status: GOOD (  28.64  )
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

T24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgMTE6MDE6MThBTSAtMDYwMCwgU2ltb24gR2xhc3Mgd3Jv
dGU6Cj4gSGkgUm9iLAo+IAo+IE9uIEZyaSwgMjIgU2VwdCAyMDIzIGF0IDEwOjAwLCBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIFNlcCAyMSwgMjAy
MyBhdCAxOjQ14oCvUE0gU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBCaW5tYW5bMV0gaXMgYSB0b29sIGZvciBjcmVhdGluZyBmaXJtd2FyZSBpbWFnZXMu
IEl0IGFsbG93cyB5b3UgdG8KPiA+ID4gY29tYmluZSB2YXJpb3VzIGJpbmFyaWVzIGFuZCBwbGFj
ZSB0aGVtIGluIGFuIG91dHB1dCBmaWxlLgo+ID4gPgo+ID4gPiBCaW5tYW4gdXNlcyBhIERUIHNj
aGVtYSB0byBkZXNjcmliZSBhbiBpbWFnZSwgaW4gZW5vdWdoIGRldGFpbCB0aGF0Cj4gPiA+IGl0
IGNhbiBiZSBhdXRvbWF0aWNhbGx5IGJ1aWx0IGZyb20gY29tcG9uZW50IHBhcnRzLCBkaXNhc3Nl
bWJsZWQsCj4gPiA+IHJlcGxhY2VkLCBsaXN0ZWQsIGV0Yy4KPiA+ID4KPiA+ID4gSW1hZ2VzIGFy
ZSB0eXBpY2FsbHkgc3RvcmVkIGluIGZsYXNoLCB3aGljaCBpcyB3aHkgdGhpcyBiaW5kaW5nIGlz
Cj4gPiA+IHRhcmdldGVkIGF0IG10ZC4gUHJldmlvdXMgZGlzY3Vzc2lvbiBpcyBhdCBbMl0gWzNd
Lgo+ID4gPgo+ID4gPiBbMV0gaHR0cHM6Ly91LWJvb3QucmVhZHRoZWRvY3MuaW8vZW4vc3RhYmxl
L2RldmVsb3AvcGFja2FnZS9iaW5tYW4uaHRtbAo+ID4gPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvdS1ib290LzIwMjMwODIxMTgwMjIwLjI3MjQwODAtMy1zamdAY2hyb21pdW0ub3JnLwo+
ID4gPiBbM10gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZGV2aWNldHJlZS9tc2c2MjYx
NDkuaHRtbAo+ID4KPiA+IFlvdSBtaXNzZWQ6Cj4gPgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2Rl
dmljZXRyZWUtb3JnL2R0LXNjaGVtYS9wdWxsLzExMAo+ID4KPiA+IHdoZXJlIEkgc2FpZDogV2Ug
Y2VydGFpbmx5IHNob3VsZG4ndCBkdXBsaWNhdGUgdGhlIGV4aXN0aW5nIHBhcnRpdGlvbnMKPiA+
IGJpbmRpbmdzLiBXaGF0J3MgbWlzc2luZyBmcm9tIHRoZW0gKEkgYXNzdW1lIHdlJ3JlIG1vc3Rs
eSB0YWxraW5nCj4gPiBhYm91dCAiZml4ZWQtcGFydGl0aW9ucyIgd2hpY2ggaGFzIGJlZW4gYXJv
dW5kIGZvcmV2ZXIgSSB0aGluayAoYmVmb3JlCj4gPiBtZSkpPwo+ID4KPiA+IFRvIHJlcGVhdCwg
dW5sZXNzIHRoZXJlIGlzIHNvbWUgcmVhc29uIGJpbm1hbiBwYXJ0aXRpb25zIGNvbmZsaWN0IHdp
dGgKPiA+IGZpeGVkLXBhcnRpdGlvbnMsIHlvdSBuZWVkIHRvIHN0YXJ0IHRoZXJlIGFuZCBleHRl
bmQgaXQuIEZyb20gd2hhdCdzCj4gPiBwb3N0ZWQgaGVyZSwgaXQgbmVpdGhlciBjb25mbGljdHMg
bm9yIG5lZWRzIGV4dGVuZGluZy4KPiAKPiBJIHRoaW5rIGF0IHRoaXMgcG9pbnQgSSBhbSBqdXN0
IGhvcGVsZXNzbHkgY29uZnVzZWQuIEhhdmUgeW91IHRha2VuIGEKPiBsb29rIGF0IHRoZSBiaW5t
YW4gc2NoZW1hPyBbMV0KCldoeSBkbyBJIG5lZWQgdG8/IFRoYXQncyB1c2VkIGZvciBzb21lIHRv
b2wgYW5kIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggYSAKZGV2aWNlJ3MgRFRCLiBIb3dldmVyLCBJ
IHRob3VnaHQgc29tZXdoZXJlIGluIHRoaXMgZGlzY3Vzc2lvbiB5b3Ugc2hvd2VkIAppdCB1bmRl
ciBhIGZsYXNoIGRldmljZSBub2RlLiBUaGVuIEkgY2FyZSBiZWNhdXNlIHRoZW4gaXQgb3Zlcmxh
cHMgd2l0aCAKd2hhdCB3ZSBhbHJlYWR5IGhhdmUgZm9yIHBhcnRpdGlvbnMuIElmIEkgbWlzdW5k
ZXJzdG9vZCB0aGF0LCB0aGVuIGp1c3QgCnB1dCB5b3VyIHNjaGVtYSB3aXRoIHlvdXIgdG9vbC4g
T25seSB1c2VycyBvZiB0aGUgdG9vbCBzaG91bGQgY2FyZSBhYm91dCAKdGhlIHRvb2wncyBzY2hl
bWEuCgo+IAo+IEkgc2F3IHRoaXMgZmlsZSwgd2hpY2ggc2VlbXMgdG8gZXh0ZW5kIGEgcGFydGl0
aW9uLgo+IAo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9u
cy9icmNtLGJjbTQ5MDgtcGFydGl0aW9ucy55YW1sCgpJSVJDLCB0aGF0J3MgYSBkaWZmZXJlbnQg
dHlwZSB3aGVyZSBwYXJ0aXRpb24gbG9jYXRpb25zIGFyZSBzdG9yZWQgaW4gCnRoZSBmbGFzaCwg
c28gd2UgZG9uJ3QgbmVlZCBsb2NhdGlvbiBhbmQgc2l6ZSBpbiBEVC4gCgo+IAo+IEkgd2FzIGFz
c3VtaW5nIHRoYXQgSSBzaG91bGQgY3JlYXRlIGEgdG9wLWxldmVsIGNvbXBhdGlibGUgPSAiYmlu
bWFuIgo+IG5vZGUsIHdpdGggc3Vibm9kZXMgbGlrZSBjb21wYXRpYmxlID0gImJpbm1hbixibDMx
LWF0ZiIsIGZvciBleGFtcGxlLgo+IEkgc2hvdWxkIHVzZSB0aGUgY29tcGF0aWJsZSBzdHJpbmcg
dG8gaW5kaWNhdGUgdGhlIGNvbnRlbnRzLCByaWdodD8KClllcyBmb3Igc3Vibm9kZXMsIGFuZCB3
ZSBhbHJlYWR5IGhhdmUgc29tZSBzb21ld2hhdCBzdGFuZGFyZCBvbmVzIGZvciAKInUtYm9vdCIg
YW5kICJ1LWJvb3QtZW52Ii4gVGhvdWdoIGhpc3RvcmljYWxseSwgImxhYmVsIiB3YXMgdXNlZC4g
CgpUb3AtbGV2ZWwsIG1lYW5pbmcgdGhlIHJvb3Qgb2YgdGhlIERUPyBUaGF0IHNvdW5kIGxpa2Ug
anVzdCBzb21ldGhpbmcgCmZvciB0aGUgdG9vbCwgc28gSSBkb24ndCBjYXJlLCBidXQgaXQgZG9l
c24ndCBiZWxvbmcgaW4gdGhlIERUQi4KCj4gCj4gUmUgZXh0ZW5kaW5nLCB3aGF0IGlzIHRoZSBt
aW5pbXVtIEkgY2FuIGRvPyBBcmUgeW91IGxvb2tpbmcgZm9yCj4gc29tZXRoaW5nIGxpa2UgYSAi
Y29tcHJlc3MiIHByb3BlcnR5IHRoYXQgaW5kaWNhdGVzIHRoYXQgdGhlIGVudHJ5IGlzCj4gY29t
cHJlc3NlZD8KPiAKPiBJJ20gcmVhbGx5IGp1c3QgYSBiaXQgbG9zdC4KCk1lIHRvby4KClJvYgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
