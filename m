Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E9EC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 09:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdXaFL8e9+6A6PgVF4Kzj/DKYJTRAM0qoTDvxQZH3zQ=; b=t1bg9PhaKDowkD
	Rt362OWzaLcNe9aNsyW+dDcT8kTpPYJQeia0lU3Vs1u8wHY+zegrwVzZthyNHTc+PbsVfSk5sngcL
	OjlDFTDzDsy1KkWBhclmVyq5xocivxJJpKcABP/3DTiLAwqvu1thlG+tJKa+pm/8EuSysT+bgJdON
	fMorvmdBTsXXzUr4ioVsObwh+X/ayWB5+tQlVrXkXgxc0VrW1xfZ1HR8EZEb5onG2vWl8F170ogsg
	K+JL2OwW8LbYe6VN01H9vgIeCr/m02Y2VbBRjGcdjZaE0ga5rLcZx42WsLoccgQSMAy3D9zM0TQZf
	gAzFSFvDXSznRF4C/WWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyV6S-00616G-Cu; Tue, 07 Jun 2022 09:02:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyV1e-005ynu-Pc
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 08:57:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8BC5C61778;
	Tue,  7 Jun 2022 08:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D838FC385A5;
	Tue,  7 Jun 2022 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654592241;
	bh=SriLGMk1BgEmrua1TDVNzRa6fB3h+Ll26QQJcP+HNDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aJWYGHBtNQdx0J7qIEpwO6vhrp/Tl0F1SJcNDkxO9NAzOwXogsbigd5F9Ks+5mvst
	 w1N5QtCnQKPDf2XFar2s3BHWAm1ASs6B2KVSVZbkaQsVjYNFXxNoNEuoLTQdh6Dgob
	 clk5qzOieQL4/SJFTnA51YM+Zgg+jgL5ZRZRp6oUGUTB9G4LEXFGDqZlDCgIkuWLAh
	 QplGjg5ZcDCLz6lrZN1kx0Tz98WU4D+oehvvI0J0/uiI3wJScLbnRpR+V3GcSx2rwO
	 YeESgAFTlpckJtqzydfeRjfeU5d77BJITMMOjQhNhgS1z6oJs1NEoOUfK9KczpYN0G
	 sUbOHW80AG+0Q==
Date: Tue, 7 Jun 2022 14:27:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Add support for unprotected spare data page
Message-ID: <20220607085714.GA5410@thinkpad>
References: <20220519190112.6344-1-ansuelsmth@gmail.com>
 <20220603151806.GB26696@thinkpad>
 <629a2806.1c69fb81.591ea.6012@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <629a2806.1c69fb81.591ea.6012@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_015722_949071_EF26EFEE 
X-CRM114-Status: GOOD (  40.03  )
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

T24gRnJpLCBKdW4gMDMsIDIwMjIgYXQgMDU6MjU6NTZQTSArMDIwMCwgQW5zdWVsIFNtaXRoIHdy
b3RlOgo+IE9uIEZyaSwgSnVuIDAzLCAyMDIyIGF0IDA4OjQ4OjA2UE0gKzA1MzAsIE1hbml2YW5u
YW4gU2FkaGFzaXZhbSB3cm90ZToKPiA+IE9uIFRodSwgTWF5IDE5LCAyMDIyIGF0IDA5OjAxOjEw
UE0gKzAyMDAsIEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+ID4gU29tZSBiYWNrZ3JvdW5kIGFib3V0
IHRoaXMuCj4gPiA+IE9uIG9yaWdpbmFsIHFzZGsgaXBxODA2NCBiYXNlZCBmaXJtd2FyZSB0aGVy
ZSB3YXMgYSBiaWcgc2VwYXJhdGlvbiBmcm9tCj4gPiA+IGJvb3QgcGFydGl0aW9uIGFuZCB1c2Vy
IHBhcnRpdGlvbi4gV2l0aCBib290IHBhcnRpdGlvbiB3ZSByZWZlciB0bwo+ID4gPiBwYXJ0aXRp
b24gdXNlZCB0byBpbml0IHRoZSByb3V0ZXIgKGJvb3Rsb2FkZXIsIHNwbSBmaXJtd2FyZSBhbmQg
b3RoZXIKPiA+ID4gaW50ZXJuYWwgc3R1ZmYpIFdpdGggdXNlciBwYXJ0aXRpb24gd2UgcmVmZXIg
dG8gbGludXggcGFydGl0aW9uIGFuZCBkYXRhCj4gPiA+IHBhcnRpdGlvbiBub3QgdXNlZCB0byBp
bml0IHRoZSByb3V0ZXIuCj4gPiA+IFdoZW4gc29tZW9uZSBoYWQgdG8gd3JpdGUgdG8gdGhlc2Ug
Ym9vdCBwYXJ0aXRpb24gYSBzcGVjaWFsIG1vZGUgd2FzCj4gPiA+IG5lZWRlZCwgdG8gc3dpdGNo
IHRoZSBuYW5kIGRyaXZlciB0byB0aGlzIHNwZWNpYWwgY29uZmlndXJhdGlvbi4KPiA+ID4gCj4g
PiA+IFVwc3RyZWFtIHZlcnNpb24gb2YgdGhlIG5hbmRjIGRyaXZlciB0b3RhbGx5IGRyb3BwZWQg
dGhpcyBhbmQgdGhlIHJlc3VsdAo+ID4gPiBpcyB0aGF0IGlmIHNvbWVvbmUgdHJ5IHRvIHJlYWQg
ZGF0YSBmcm9tIHRoZXNlIHBhcnRpdGlvbiBhIENSQyB3YXJuaW5nCj4gPiA+IGlzIHByaW50ZWQg
YW5kIGlmIHNvbWVvbmUgdHJ5IHRvIHdyaXRlIHRoYXQgKGlmIGZvciBleGFtcGxlIHNvbWVvbmUK
PiA+ID4gd2FudHMgdG8gcmVwbGFjZSB0aGUgYm9vdGxvYWRlcikgcmVzdWx0IGlzIGEgYnJva2Vu
IHN5c3RlbSBhcyB0aGUgZGF0YQo+ID4gPiBpcyBiYWRseSB3cml0dGVuLgo+ID4gPiAKPiA+IAo+
ID4gQ2FuIHlvdSBwbGVhc2UgcG9pbnQgbWUgdG8gdGhlIGRvd25zdHJlYW0vdmVuZG9yIGRyaXZl
ciB0aGF0IGhhcyB0aGlzCj4gPiBpbXBsZW1lbnRhdGlvbj8KPiA+IAo+ID4gVGhhbmtzLAo+ID4g
TWFuaQo+ID4KPiAKPiBBY3R1YWxseSBmb3VuZCB0aGUgcmVwby4uLlRoaXMgaXMgdGhlIGxpbmsg
WzFdLgo+IAo+IE15IGltcGxlbWVudGF0aW9uIGlzIGEgdmFyaWFudCBvZiB0aGlzIHNpbmNlIG9y
aWdpbmFsbHkgdGhleSB1c2VkIGEKPiBzeXNmcyBlbnRyeSB0byBzd2FwIHRoZSBlY2MgY29uZmln
dXJhdGlvbi4KPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL21hcnhmYW5nL2lwcTgwN3gtc3Bm
MTAwLWNzL2Jsb2IvbWFzdGVyL3FzZGsvcWNhL3NyYy9saW51eC00LjQvZHJpdmVycy9tdGQvbmFu
ZC9xY29tX25hbmRjLmMKPiAKClRoYW5rcyBmb3IgdGhlIGxpbmshIEFmdGVyIHRhbGtpbmcgaW50
ZXJuYWxseSB0byBRY29tIGZvbGtzLCBJIGNvbmZpcm1lZAp0aGF0IHRoaXMgcXVpcmsgaXMgb25s
eSBuZWVkZWQgb24gSVBRODA2NCBiYXNlZCBwbGF0Zm9ybXMuCgpNb3JlIGluIHRoZSBkcml2ZXIg
cGF0Y2guLi4KClRoYW5rcywKTWFuaQoKPiA+ID4gVGhpcyBzZXJpZXMgY29tZXMgdG8gZml4IHRo
aXMuCj4gPiA+IAo+ID4gPiBBIHVzZXIgY2FuIGRlY2xhcmUgb2Zmc2V0IGFuZCBzaXplIG9mIHRo
ZXNlIHNwZWNpYWwgcGFydGl0aW9uIHVzaW5nIHRoZQo+ID4gPiBxY29tLGJvb3QtcGFnZXMgYmlu
ZGluZy4KPiA+ID4gCj4gPiA+IEFuIGluaXRpYWwgaW1wbGVtZW50YXRpb24gb2YgdGhpcyBhc3N1
bWVkIHRoYXQgdGhlIGJvb3QtcGFnZXMgc3RhcnRlZAo+ID4gPiBmcm9tIHRoZSBzdGFydCBvZiB0
aGUgbmFuZCBidXQgd2UgZGlzY292ZXIgdGhhdCBzb21lIGRldmljZSBoYXZlIGJhY2t1cAo+ID4g
PiBvZiB0aGVzZSBzcGVjaWFsIHBhcnRpdGlvbiBhbmQgd2UgY2FuIGhhdmUgc2l0dWF0aW9uIHdo
ZXJlIHdlIGhhdmUgdGhpcwo+ID4gPiBwYXJ0aXRpb24gc2NoZW1lCj4gPiA+IC0gQVBQU0JMIChy
ZXF1aXJlIHNwZWNpYWwgbW9kZSkKPiA+ID4gLSBBUFBTQkxFTlYgKGRvZXNuJ3QgcmVxdWlyZSBz
cGVjaWFsIG1vZGUpCj4gPiA+IC0gQVJUCj4gPiA+IC0gQVBQU0JMQksgKGJhY2sgb2YgQVBQU0JM
IHJlcXVpcmUgc3BlY2lhbCBtb2RlKQo+ID4gPiAtIEFQUFNCTEVOVkJLIChiYWNrIG9mIEFQUFNC
TEVOViBkb2Vzbid0IHJlcXVpcmUgc3BlY2lhbCBtb2RlKQo+ID4gPiBXaXRoIHRoaXMgY29uZmln
dXJhdGlvbiB3ZSBuZWVkIHRvIGRlY2xhcmUgc3BhcnNlIGJvb3QgcGFnZSBhbmQgd2UgY2FuJ3QK
PiA+ID4gYXNzdW1lIGJvb3QtcGFnZXMgYWx3YXlzIHN0YXJ0cyBmcm9tIHRoZSBzdGFydCBvZiB0
aGUgbmFuZC4KPiA+ID4gCj4gPiA+IEEgdXNlciBjYW4gdXNlIHRoaXMgZm9ybSB0byBkZWNsYXJl
IHNwYXJzZSBib290IHBhZ2VzCj4gPiA+IHFjb20sYm9vdC1wYWdlcyA9IDwweDAgMHgwYzgwMDAw
IDB4MGM4MDAwMCAweDA1MDAwMDA+Owo+ID4gPiAKPiA+ID4gVGhlIGRyaXZlciBpbnRlcm5hbGx5
IHdpbGwgcGFyc2UgdGhpcyBhcnJheSwgY29udmVydCBpdCB0byBuYW5kIHBhZ2VzCj4gPiA+IGFu
ZCBjaGVjayBpbnRlcm5hbGx5IG9uIGV2ZXJ5IHJlYWQvd3JpdGUgaWYgdGhpcyBzcGVjaWFsIGNv
bmZpZ3VyYXRpb24KPiA+ID4gc2hvdWxkIHVzZWQgZm9yIHRoYXQgcGFnZSBvciB0aGUgbm9ybWFs
IG9uZS4KPiA+ID4gCj4gPiA+IFRoZSByZWFzb24gZm9yIGFsbCBvZiB0aGlzIGlzIHRoYXQgcWNv
bSBGT1IgU09NRSBSRUFTT04sIGRpc2FibGUgRUNDIGZvcgo+ID4gPiBzcGFyZSBkYXRhIG9ubHkg
Zm9yIHRoZXNlIGJvb3QgcGFydGl0aW9uIGFuZCB3ZSBuZWVkIHRvIHJlZmxlY3QgdGhpcwo+ID4g
PiBzcGVjaWFsIGNvbmZpZ3VyYXRpb24gdG8gbXV0ZSB0aGVzZSB3YXJuaW5nIGFuZCB0byBwZXJt
aXQgYWN0dWFsbHkKPiA+ID4gd3JpdGluZyB0byB0aGVzZSBwYWdlcy4KPiA+ID4gCj4gPiA+IHY0
Ogo+ID4gPiAtIEZpeCB3cm9uZyBjb21wYXRpYmxlIHNldCBmb3IgYm9vdC1wYWdlcyAoaXBxODA3
NCBpbnN0ZWFkIG9mIGlwcTgwNngpCj4gPiA+IHYzOgo+ID4gPiAtIEZpeCB0eXBvIGluIERvY211
bmV0YXRpb24gY29tbWl0IGRlc3JpcHRpb24KPiA+ID4gLSBBZGQgaXRlbXMgZGVzY3JpcHRpb24g
Zm9yIHVpbnQzMi1tYXRyaXgKPiA+ID4gdjI6Cj4gPiA+IC0gQWRkIGZpeGVzIGZyb20gS3J6eXN6
dG9mIGluIERvY3VtZW50YXRpb24KPiA+ID4gCj4gPiA+IEFuc3VlbCBTbWl0aCAoMik6Cj4gPiA+
ICAgbXRkOiBuYW5kOiByYXc6IHFjb21fbmFuZGM6IGFkZCBzdXBwb3J0IGZvciB1bnByb3RlY3Rl
ZCBzcGFyZSBkYXRhCj4gPiA+ICAgICBwYWdlcwo+ID4gPiAgIGR0LWJpbmRpbmdzOiBtdGQ6IHFj
b21fbmFuZGM6IGRvY3VtZW50IHFjb20sYm9vdC1wYWdlcyBiaW5kaW5nCj4gPiA+IAo+ID4gPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20sbmFuZGMueWFtbCAgIHwgIDI2ICsrKwo+
ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jICAgICAgICAgICAgIHwgMTQ4
ICsrKysrKysrKysrKysrKysrLQo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNjkgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IC0tIAo+ID4gPiAyLjM0LjEKPiA+ID4g
Cj4gPiAKPiA+IC0tIAo+ID4g4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCu
muCuv+CuteCuruCvjQo+IAo+IC0tIAo+IAlBbnN1ZWwKCi0tIArgrq7grqPgrr/grrXgrqPgr43g
rqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
