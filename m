Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9698DC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 10:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJU4ikb9Md87joDBR3g+x6J/CjuuJSkHe15A8D1rWpA=; b=Cp4ppfmdchLzh8
	A0wdEnagCkl4SYLe+XtXn+EVtZ1uWsDnaWpC1lgoIi43nxj3Iu2Fl0LvUIaFamzPA2B+weEhc3LPB
	udbyGPiUiuvSpKVjf66n5Jh72IYn1/707HCyz3Mri2ZVR3cygN0cAEE5whIqvUvp7fe2/nZ8i2KiG
	1CINdNPNFfUTg/7087gPuzgRKE4nb3vI80DazhqdM49ypvGR5fl+WapUi0SCgF2HoSBqRl8zsjQ7X
	DShbBcUQwS93wDBkAOhVvmiOUSijVrduW9iWBVYfe75ARrcurZk3dYcq7iodns7cLsfxzlDF/rE8G
	2XthWs+lHWeEWyRa2tFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzFbY-0014nI-4r; Thu, 09 Jun 2022 10:41:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzFaZ-0013s4-7T
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 10:40:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8842D61D69;
	Thu,  9 Jun 2022 10:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D8DC34114;
	Thu,  9 Jun 2022 10:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654771230;
	bh=Wf1dhu5SQZfFcciS3upZkCwdHerc+NxnCZv0l+U13g8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLTslnYCa+oM6PAoLH8GepLVVcc/R2U8AJ6EJEvHCTiFddGWW/AjUau6qbWbXwezQ
	 2CRcan9QZd5dfHRgByYGdP9WNSFT6edd90LxCOIE/oWUWIbrzydsqj7Gio3ad5OyVW
	 2HFwrNBIyGMU5aaQI+rKk3iZ23PFEeqnGgEBxwhH5lMVt/3LVw3047oiHm+/GRVRqz
	 wvm/aQizoP19YBog/Hr2aIyv0LfdKViW6zMfGeUC1VDEQyDffKJTJjYzXOrYWD8vDY
	 wFMnMbSyuNSc6MREiqj7QLu1qTmCb4WjTzEBV+d3bleZ1iBjuuTHwjAS+xcP2BY9Y6
	 z/VKtPiEdYPIQ==
Date: Thu, 9 Jun 2022 16:09:44 +0530
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
Subject: Re: [PATCH v5 2/3] dt-bindings: mtd: qcom_nandc: document
 qcom,boot-partitions binding
Message-ID: <20220609103944.GD2758@thinkpad>
References: <20220608001030.18813-1-ansuelsmth@gmail.com>
 <20220608001030.18813-3-ansuelsmth@gmail.com>
 <20220609072029.GA2758@thinkpad>
 <62a1ca9a.1c69fb81.3b355.0b02@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62a1ca9a.1c69fb81.3b355.0b02@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_034031_407749_29FFCF6F 
X-CRM114-Status: GOOD (  25.38  )
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

T24gVGh1LCBKdW4gMDksIDIwMjIgYXQgMTI6MjU6MjdQTSArMDIwMCwgQW5zdWVsIFNtaXRoIHdy
b3RlOgo+IE9uIFRodSwgSnVuIDA5LCAyMDIyIGF0IDEyOjUwOjI5UE0gKzA1MzAsIE1hbml2YW5u
YW4gU2FkaGFzaXZhbSB3cm90ZToKPiA+IE9uIFdlZCwgSnVuIDA4LCAyMDIyIGF0IDAyOjEwOjI5
QU0gKzAyMDAsIEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+ID4gRG9jdW1lbnQgbmV3IHFjb20sYm9v
dC1wYXJ0aXRpb24gYmluZGluZyB1c2VkIHRvIGFwcGx5IHNwZWNpYWwKPiA+ID4gcmVhZC93cml0
ZSBsYXlvdXQgdG8gYm9vdCBwYXJ0aXRpb25zLgo+ID4gPiAKPiA+ID4gUUNPTSBhcHBseSBhIHNw
ZWNpYWwgbGF5b3V0IHdoZXJlIHNwYXJlIGRhdGEgaXMgbm90IHByb3RlY3RlZAo+ID4gPiBieSBF
Q0MgZm9yIHNvbWUgc3BlY2lhbCBwYWdlcyAodXNlZCBmb3IgYm9vdCBwYXJ0aXRpb24pLiBBZGQK
PiA+ID4gRG9jdW1lbnRhdGlvbiBvbiBob3cgdG8gZGVjbGFyZSB0aGVzZSBzcGVjaWFsIHBhZ2Vz
Lgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5zdWVsIFNtaXRoIDxhbnN1ZWxzbXRoQGdt
YWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNv
bSxuYW5kYy55YW1sICAgfCAyNiArKysrKysrKysrKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNvbSxuYW5kYy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwKPiA+ID4gaW5kZXgg
ODRhZDdmZjMwMTIxLi5hMDkxNGNjYjk1YjAgMTAwNjQ0Cj4gPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNvbSxuYW5kYy55YW1sCj4gPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNvbSxuYW5kYy55YW1sCj4gPiA+
IEBAIC0xMDIsNiArMTAyLDMwIEBAIGFsbE9mOgo+ID4gPiAgICAgICAgICAgICAgLSBjb25zdDog
cngKPiA+ID4gICAgICAgICAgICAgIC0gY29uc3Q6IGNtZAo+ID4gPiAgCj4gPiA+ICsgIC0gaWY6
Cj4gPiA+ICsgICAgICBwcm9wZXJ0aWVzOgo+ID4gPiArICAgICAgICBjb21wYXRpYmxlOgo+ID4g
PiArICAgICAgICAgIGNvbnRhaW5zOgo+ID4gPiArICAgICAgICAgICAgZW51bToKPiA+ID4gKyAg
ICAgICAgICAgICAgLSBxY29tLGlwcTgwNngtbmFuZAo+ID4gPiArCj4gPiA+ICsgICAgdGhlbjoK
PiA+ID4gKyAgICAgIHByb3BlcnRpZXM6Cj4gPiA+ICsgICAgICAgIHFjb20sYm9vdC1wYXJ0aXRp
b25zOgo+ID4gPiArICAgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRp
b25zL3VpbnQzMi1tYXRyaXgKPiA+IAo+ID4gV29uZGVyaW5nIGlmIHUzMiBpcyBlbm91Z2ggZm9y
IGNvdmVyaW5nIGFsbCByYW5nZXM/IE90aGVyIHRoYW4gdGhpcywKPiA+IAo+ID4gUmV2aWV3ZWQt
Ynk6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPgo+ID4gCj4gPiBUaGFu
a3MsCj4gPiBNYW5pCj4gPgo+IAo+IEkgbWVhbiB0aGV5IGFyZSBvZmZzZXQgYW5kIHNpemVzLi4u
IENvbnNpZGVyaW5nIGl0J3MgYW4gb2xkIFNvQyBhbmQgbWF4Cj4gbmFuZCBtb3VudGVkIGlzIDFn
IHdlIHNob3VsZCBiZSBzYWZlIHdpdGggdTMyLgo+IAoKSSB0aG91Z2h0IHNvIGJ1dCB3YW50ZWQg
dG8gY29uZmlybS4uLgoKVGhhbmtzLApNYW5pCgo+ID4gPiArICAgICAgICAgIGl0ZW1zOgo+ID4g
PiArICAgICAgICAgICAgaXRlbXM6Cj4gPiA+ICsgICAgICAgICAgICAgIC0gZGVzY3JpcHRpb246
IG9mZnNldAo+ID4gPiArICAgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBzaXplCj4gPiA+ICsg
ICAgICAgICAgZGVzY3JpcHRpb246Cj4gPiA+ICsgICAgICAgICAgICBCb290IHBhcnRpdGlvbiB1
c2UgYSBkaWZmZXJlbnQgbGF5b3V0IHdoZXJlIHRoZSA0IGJ5dGVzIG9mIHNwYXJlCj4gPiA+ICsg
ICAgICAgICAgICBkYXRhIGFyZSBub3QgcHJvdGVjdGVkIGJ5IEVDQy4gVXNlIHRoaXMgdG8gZGVj
bGFyZSB0aGVzZSBzcGVjaWFsCj4gPiA+ICsgICAgICAgICAgICBwYXJ0aXRpb25zIGJ5IGRlZmlu
aW5nIGZpcnN0IHRoZSBvZmZzZXQgYW5kIHRoZW4gdGhlIHNpemUuCj4gPiA+ICsKPiA+ID4gKyAg
ICAgICAgICAgIEl0J3MgaW4gdGhlIGZvcm0gb2YgPG9mZnNldDEgc2l6ZTEgb2Zmc2V0MiBzaXpl
MiBvZmZzZXQzIC4uLj4KPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgUmVmZXIgdG8gdGhlIGlw
cTgwNjQgZXhhbXBsZSBvbiBob3cgdG8gdXNlIHRoaXMgc3BlY2lhbCBiaW5kaW5nLgo+ID4gPiAr
Cj4gPiA+ICByZXF1aXJlZDoKPiA+ID4gICAgLSBjb21wYXRpYmxlCj4gPiA+ICAgIC0gcmVnCj4g
PiA+IEBAIC0xMzUsNiArMTU5LDggQEAgZXhhbXBsZXM6Cj4gPiA+ICAgICAgICAgIG5hbmQtZWNj
LXN0cmVuZ3RoID0gPDQ+Owo+ID4gPiAgICAgICAgICBuYW5kLWJ1cy13aWR0aCA9IDw4PjsKPiA+
ID4gIAo+ID4gPiArICAgICAgICBxY29tLGJvb3QtcGFydGl0aW9ucyA9IDwweDAgMHg1OGEwMDAw
PjsKPiA+ID4gKwo+ID4gPiAgICAgICAgICBwYXJ0aXRpb25zIHsKPiA+ID4gICAgICAgICAgICBj
b21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ID4gPiAgICAgICAgICAgICNhZGRyZXNz
LWNlbGxzID0gPDE+Owo+ID4gPiAtLSAKPiA+ID4gMi4zNi4xCj4gPiA+IAo+ID4gCj4gPiAtLSAK
PiA+IOCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40K
PiAKPiAtLSAKPiAJQW5zdWVsCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCu
pOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
