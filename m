Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A59C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 14:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqcshLiPX16z6aVqH3uvEq7I225PeawJY4Pr4EXvMKI=; b=Km7Pa2BZIazC21
	Kps4Dy+2+gOAY3zng8RTVHZx+mrRV7YQ/sWn2b2DBOxWEJlKrLUofx2rX/GuTDthNl7vtdk+zy/e9
	rkPLf1CWueVMgwUWIHycHBpjGpRr14NhCYQMBc7qw9wr//Gzh+kTknIUruVPjr2nVqTt4qIbMpQsU
	2t77DkPFSZahEUi+mRIDXhIKwDjFRpHHZRRfQ/YsUg7GjA4hhoPbwCmPAdDcZAXWS4586bPTXO9zo
	GAerEO1EztRblI51NWPuZsnv7abqC9x5cldHKclve4IE1H4jR6nTL94GXAkPtrpDBrIPvTo4xryW2
	ITLSZPPOQn9Z19zGDy/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZx7-007yXa-Ax; Tue, 07 Jun 2022 14:13:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZx4-007yUs-83
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 14:12:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E73716157A;
	Tue,  7 Jun 2022 14:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15294C385A5;
	Tue,  7 Jun 2022 14:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654611175;
	bh=tOlTuXrCdHXR6tngcOYuj9xb6Z7sf9Xjv7iA3sFggYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KH4AWZwnRnDjxQDeZmq+Cmgtn6CDh5+jO2Zb7+EQMAhBVKoINQHyhMuThDfmevcBt
	 ZTDUUyjmeiOD4Tibu/IbzEYR2NAYUYA59os4W+XauvN7beQS/xos5AiLJDnwVrndUB
	 rM5amS1fGMBjy59vEfHyiqOmGRTu9UYaqMyg/YOisI7Va9vKbs3Qac9qJhRxKkexml
	 aU8UhPgCJH+avMFetQh4PoMZ0XdyT5aMEOm1EY4vsbeKaZ9Hwl8hfcWkqD8AjYVwK9
	 ukNPlmqK55f0NoRDtDaBQC0MTDoeqZPUvqzfB4UPasrcLeVxKToaglkKnnAk9WRCro
	 RPY6qgXxQqaTw==
Date: Tue, 7 Jun 2022 19:42:42 +0530
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
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: qcom_nandc: document
 qcom,boot-pages binding
Message-ID: <20220607141242.GA1882@thinkpad>
References: <20220519190112.6344-1-ansuelsmth@gmail.com>
 <20220519190112.6344-3-ansuelsmth@gmail.com>
 <20220607091522.GB5410@thinkpad>
 <629f3127.1c69fb81.2590d.39ac@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <629f3127.1c69fb81.2590d.39ac@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_071258_413082_D5B03A38 
X-CRM114-Status: GOOD (  29.73  )
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

T24gVHVlLCBKdW4gMDcsIDIwMjIgYXQgMDk6MDU6MTZBTSArMDIwMCwgQW5zdWVsIFNtaXRoIHdy
b3RlOgo+IE9uIFR1ZSwgSnVuIDA3LCAyMDIyIGF0IDAyOjQ1OjIyUE0gKzA1MzAsIE1hbml2YW5u
YW4gU2FkaGFzaXZhbSB3cm90ZToKPiA+IE9uIFRodSwgTWF5IDE5LCAyMDIyIGF0IDA5OjAxOjEy
UE0gKzAyMDAsIEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+ID4gRG9jdW1lbnQgbmV3IHFjb20sYm9v
dC1wYWdlcyBiaW5kaW5nIHVzZWQgdG8gYXBwbHkgc3BlY2lhbAo+ID4gPiByZWFkL3dyaXRlIGNv
bmZpZ3VyYXRpb24gdG8gYm9vdCBwYWdlcy4KPiA+ID4gCj4gPiA+IFFDT00gYXBwbHkgYSBzcGVj
aWFsIGNvbmZpZ3VyYXRpb24gd2hlcmUgc3BhcmUgZGF0YSBpcyBub3QgcHJvdGVjdGVkCj4gPiA+
IGJ5IEVDQyBmb3Igc29tZSBzcGVjaWFsIHBhZ2VzICh1c2VkIGZvciBib290IHBhcnRpdGlvbiku
IEFkZAo+ID4gPiBEb2N1bWVudGF0aW9uIG9uIGhvdyB0byBkZWNsYXJlIHRoZXNlIHNwZWNpYWwg
cGFnZXMuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbnN1ZWwgU21pdGggPGFuc3VlbHNt
dGhAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9xY29tLG5hbmRjLnlhbWwgICB8IDI2ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20sbmFuZGMueWFtbAo+ID4gPiBp
bmRleCA4NGFkN2ZmMzAxMjEuLmE1OWFlOTUyNWY0ZSAxMDA2NDQKPiA+ID4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwKPiA+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwK
PiA+ID4gQEAgLTEwMiw2ICsxMDIsMzAgQEAgYWxsT2Y6Cj4gPiA+ICAgICAgICAgICAgICAtIGNv
bnN0OiByeAo+ID4gPiAgICAgICAgICAgICAgLSBjb25zdDogY21kCj4gPiA+ICAKPiA+ID4gKyAg
LSBpZjoKPiA+ID4gKyAgICAgIHByb3BlcnRpZXM6Cj4gPiA+ICsgICAgICAgIGNvbXBhdGlibGU6
Cj4gPiA+ICsgICAgICAgICAgY29udGFpbnM6Cj4gPiA+ICsgICAgICAgICAgICBlbnVtOgo+ID4g
PiArICAgICAgICAgICAgICAtIHFjb20saXBxODA2eC1uYW5kCj4gPiA+ICsKPiA+ID4gKyAgICB0
aGVuOgo+ID4gPiArICAgICAgcHJvcGVydGllczoKPiA+ID4gKyAgICAgICAgcWNvbSxib290LXBh
Z2VzOgo+ID4gCj4gPiBFdmVudGhvdWdoIHRoZSBwYWdlIGxheW91dCBpcyB3aGF0IG1ha2luZyB0
aGUgZGlmZmVyZW5jZSwgaGVyZSB0aGUgYm9vdAo+ID4gcGFydGl0aW9uIG9mZnNldCBhbmQgc2l6
ZSBhcmUgZ2V0dGluZyBzcGVjaWZpZWQuIFNvIGhvdyBhYm91dCwgY2hhbmdpbmcgaXQKPiA+IHRv
ICJxY29tLGJvb3QtcGFydGl0aW9ucyI/Cj4gPiAKPiA+IFRoYW5rcywKPiA+IE1hbmkKPiA+Cj4g
Cj4gWWVwLCB5b3UgYXJlIGNvcnJlY3QgYW5kIHRoZSBuYW1pbmcgaXMgY29uZnVzaW5nLiBXaWxs
IGRvIHRoZSBjaGFuZ2UuCj4gRGlkIHlvdSBjaGVjayB0aGUgY29kZSBpZiB5b3Ugbm90aWNlIHNv
bWV0aGluZyB0byBpbXByb3ZlIC8gYW4gaWRlYSBvZiBhCj4gYmV0dGVyIGltcGxlbWVudGF0aW9u
IG9yIGJldHRlciBuYW1pbmc/Cj4gSnVzdCB0byBza2lwIHNlbmRpbmcgbXVsdGlwbGUgcmV2aXNp
b24gd2l0aCBzbWFsbCBjaGFuZ2VzLgo+IAoKWWVwLCBJIGRvIGhhdmUgc29tZSBjb21tZW50cy4g
V2lsbCBzaGFyZSB0aGVtLgoKVGhhbmtzLApNYW5pCgo+ID4gPiArICAgICAgICAgICRyZWY6IC9z
Y2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1tYXRyaXgKPiA+ID4gKyAgICAg
ICAgICBpdGVtczoKPiA+ID4gKyAgICAgICAgICAgIGl0ZW1zOgo+ID4gPiArICAgICAgICAgICAg
ICAtIGRlc2NyaXB0aW9uOiBvZmZzZXQKPiA+ID4gKyAgICAgICAgICAgICAgLSBkZXNjcmlwdGlv
bjogc2l6ZQo+ID4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ID4gPiArICAgICAgICAgICAg
U29tZSBzcGVjaWFsIHBhZ2UgdXNlZCBieSBib290IHBhcnRpdGlvbiBoYXZlIHNwYXJlIGRhdGEK
PiA+ID4gKyAgICAgICAgICAgIG5vdCBwcm90ZWN0ZWQgYnkgRUNDLiBVc2UgdGhpcyB0byBkZWNs
YXJlIHRoZXNlIHNwZWNpYWwgcGFnZQo+ID4gPiArICAgICAgICAgICAgYnkgZGVmaW5pbmcgZmly
c3QgdGhlIG9mZnNldCBhbmQgdGhlbiB0aGUgc2l6ZS4KPiA+ID4gKwo+ID4gPiArICAgICAgICAg
ICAgSXQncyBpbiB0aGUgZm9ybSBvZiA8b2Zmc2V0MSBzaXplMSBvZmZzZXQyIHNpemUyIG9mZnNl
dDMgLi4uPgo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICBSZWZlciB0byB0aGUgaXBxODA2NCBl
eGFtcGxlIG9uIGhvdyB0byB1c2UgdGhpcyBzcGVjaWFsIGJpbmRpbmcuCj4gPiA+ICsKPiA+ID4g
IHJlcXVpcmVkOgo+ID4gPiAgICAtIGNvbXBhdGlibGUKPiA+ID4gICAgLSByZWcKPiA+ID4gQEAg
LTEzNSw2ICsxNTksOCBAQCBleGFtcGxlczoKPiA+ID4gICAgICAgICAgbmFuZC1lY2Mtc3RyZW5n
dGggPSA8ND47Cj4gPiA+ICAgICAgICAgIG5hbmQtYnVzLXdpZHRoID0gPDg+Owo+ID4gPiAgCj4g
PiA+ICsgICAgICAgIHFjb20sYm9vdC1wYWdlcyA9IDwweDAgMHg1OGEwMDAwPjsKPiA+ID4gKwo+
ID4gPiAgICAgICAgICBwYXJ0aXRpb25zIHsKPiA+ID4gICAgICAgICAgICBjb21wYXRpYmxlID0g
ImZpeGVkLXBhcnRpdGlvbnMiOwo+ID4gPiAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
Owo+ID4gPiAtLSAKPiA+ID4gMi4zNC4xCj4gPiA+IAo+ID4gCj4gPiAtLSAKPiA+IOCuruCuo+Cu
v+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KPiAKPiAtLSAKPiAJ
QW5zdWVsCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+Cu
teCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
