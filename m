Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3847BC43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 15:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7dRXbWEqOysncB4wFBcO4yUGlVseWSw/iQwAgPrAlA=; b=sUryt0GsQBxfpX
	N7wxYLyutxTwpt2SweFHVEy5bLrwRW1B/3XkItqZNDjmf+wjbPf8+xDbOEdgGLcrMIFfzVB2fI5rL
	H8jJklK3YPPl3vHxT8Y5WNkGI2yyaQ3FmNPnbJAll0J4XXfLMdmMl4k1uO+vt3kCsE1hnce66szZl
	f2nqDW4c3lZBqyHlddVdOSjRSn1M11m5CJLrwDkI+dilYjDg5rfuc3plzK7G3B9j2mRI0WMmIIBcL
	1R96e12jxjVw7EZuJ2eUlS0XRJrzLlt5s5b90C4YXGjPy4lja5bl/GqPrZU9f2azvOXuVGu+0l/pk
	mnFYBRgiPKOQFBHmBkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx949-007yAB-PN; Fri, 03 Jun 2022 15:18:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx946-007y99-Mi
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 15:18:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DF00DB821BD;
	Fri,  3 Jun 2022 15:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C738C385A9;
	Fri,  3 Jun 2022 15:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654269493;
	bh=hNClHbaX1+sQTSTaqXz+J1yCu27oIJqVaL4omZjeK54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2oMiBOgWYmBEBlRga7OxxbRP3UqrCmg7Mq59zca+0d1GCzca1kUhd1lQU+R70V3V
	 54C4wxC2K1r0fb7JJnr1xZ91UQi1ctXyjwji+HThBdXPrzYlgStnmssRXiT+NcAz3m
	 anrotYH3mum+sJGPZNl6lxkqQX46h9gAEXjwLuyASa1hssTp3P1dfJdVWmd52AWL0O
	 5TS6ytnQHF+Abx5MMUbIcdh64OpojqM3OMAXt/svzSwjf1cCjIqrUsW7jkcd2CAKaC
	 RdIr4JlQwkjxpmKkh9haIYWjFZTwuA3AF0maoRCKAWRXBtmF21Pd9xhz1qT6/Nxp+O
	 TLaH9b9b9qpQg==
Date: Fri, 3 Jun 2022 20:48:06 +0530
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
Message-ID: <20220603151806.GB26696@thinkpad>
References: <20220519190112.6344-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519190112.6344-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_081819_070235_5D844DEC 
X-CRM114-Status: GOOD (  31.04  )
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

T24gVGh1LCBNYXkgMTksIDIwMjIgYXQgMDk6MDE6MTBQTSArMDIwMCwgQW5zdWVsIFNtaXRoIHdy
b3RlOgo+IFNvbWUgYmFja2dyb3VuZCBhYm91dCB0aGlzLgo+IE9uIG9yaWdpbmFsIHFzZGsgaXBx
ODA2NCBiYXNlZCBmaXJtd2FyZSB0aGVyZSB3YXMgYSBiaWcgc2VwYXJhdGlvbiBmcm9tCj4gYm9v
dCBwYXJ0aXRpb24gYW5kIHVzZXIgcGFydGl0aW9uLiBXaXRoIGJvb3QgcGFydGl0aW9uIHdlIHJl
ZmVyIHRvCj4gcGFydGl0aW9uIHVzZWQgdG8gaW5pdCB0aGUgcm91dGVyIChib290bG9hZGVyLCBz
cG0gZmlybXdhcmUgYW5kIG90aGVyCj4gaW50ZXJuYWwgc3R1ZmYpIFdpdGggdXNlciBwYXJ0aXRp
b24gd2UgcmVmZXIgdG8gbGludXggcGFydGl0aW9uIGFuZCBkYXRhCj4gcGFydGl0aW9uIG5vdCB1
c2VkIHRvIGluaXQgdGhlIHJvdXRlci4KPiBXaGVuIHNvbWVvbmUgaGFkIHRvIHdyaXRlIHRvIHRo
ZXNlIGJvb3QgcGFydGl0aW9uIGEgc3BlY2lhbCBtb2RlIHdhcwo+IG5lZWRlZCwgdG8gc3dpdGNo
IHRoZSBuYW5kIGRyaXZlciB0byB0aGlzIHNwZWNpYWwgY29uZmlndXJhdGlvbi4KPiAKPiBVcHN0
cmVhbSB2ZXJzaW9uIG9mIHRoZSBuYW5kYyBkcml2ZXIgdG90YWxseSBkcm9wcGVkIHRoaXMgYW5k
IHRoZSByZXN1bHQKPiBpcyB0aGF0IGlmIHNvbWVvbmUgdHJ5IHRvIHJlYWQgZGF0YSBmcm9tIHRo
ZXNlIHBhcnRpdGlvbiBhIENSQyB3YXJuaW5nCj4gaXMgcHJpbnRlZCBhbmQgaWYgc29tZW9uZSB0
cnkgdG8gd3JpdGUgdGhhdCAoaWYgZm9yIGV4YW1wbGUgc29tZW9uZQo+IHdhbnRzIHRvIHJlcGxh
Y2UgdGhlIGJvb3Rsb2FkZXIpIHJlc3VsdCBpcyBhIGJyb2tlbiBzeXN0ZW0gYXMgdGhlIGRhdGEK
PiBpcyBiYWRseSB3cml0dGVuLgo+IAoKQ2FuIHlvdSBwbGVhc2UgcG9pbnQgbWUgdG8gdGhlIGRv
d25zdHJlYW0vdmVuZG9yIGRyaXZlciB0aGF0IGhhcyB0aGlzCmltcGxlbWVudGF0aW9uPwoKVGhh
bmtzLApNYW5pCgo+IFRoaXMgc2VyaWVzIGNvbWVzIHRvIGZpeCB0aGlzLgo+IAo+IEEgdXNlciBj
YW4gZGVjbGFyZSBvZmZzZXQgYW5kIHNpemUgb2YgdGhlc2Ugc3BlY2lhbCBwYXJ0aXRpb24gdXNp
bmcgdGhlCj4gcWNvbSxib290LXBhZ2VzIGJpbmRpbmcuCj4gCj4gQW4gaW5pdGlhbCBpbXBsZW1l
bnRhdGlvbiBvZiB0aGlzIGFzc3VtZWQgdGhhdCB0aGUgYm9vdC1wYWdlcyBzdGFydGVkCj4gZnJv
bSB0aGUgc3RhcnQgb2YgdGhlIG5hbmQgYnV0IHdlIGRpc2NvdmVyIHRoYXQgc29tZSBkZXZpY2Ug
aGF2ZSBiYWNrdXAKPiBvZiB0aGVzZSBzcGVjaWFsIHBhcnRpdGlvbiBhbmQgd2UgY2FuIGhhdmUg
c2l0dWF0aW9uIHdoZXJlIHdlIGhhdmUgdGhpcwo+IHBhcnRpdGlvbiBzY2hlbWUKPiAtIEFQUFNC
TCAocmVxdWlyZSBzcGVjaWFsIG1vZGUpCj4gLSBBUFBTQkxFTlYgKGRvZXNuJ3QgcmVxdWlyZSBz
cGVjaWFsIG1vZGUpCj4gLSBBUlQKPiAtIEFQUFNCTEJLIChiYWNrIG9mIEFQUFNCTCByZXF1aXJl
IHNwZWNpYWwgbW9kZSkKPiAtIEFQUFNCTEVOVkJLIChiYWNrIG9mIEFQUFNCTEVOViBkb2Vzbid0
IHJlcXVpcmUgc3BlY2lhbCBtb2RlKQo+IFdpdGggdGhpcyBjb25maWd1cmF0aW9uIHdlIG5lZWQg
dG8gZGVjbGFyZSBzcGFyc2UgYm9vdCBwYWdlIGFuZCB3ZSBjYW4ndAo+IGFzc3VtZSBib290LXBh
Z2VzIGFsd2F5cyBzdGFydHMgZnJvbSB0aGUgc3RhcnQgb2YgdGhlIG5hbmQuCj4gCj4gQSB1c2Vy
IGNhbiB1c2UgdGhpcyBmb3JtIHRvIGRlY2xhcmUgc3BhcnNlIGJvb3QgcGFnZXMKPiBxY29tLGJv
b3QtcGFnZXMgPSA8MHgwIDB4MGM4MDAwMCAweDBjODAwMDAgMHgwNTAwMDAwPjsKPiAKPiBUaGUg
ZHJpdmVyIGludGVybmFsbHkgd2lsbCBwYXJzZSB0aGlzIGFycmF5LCBjb252ZXJ0IGl0IHRvIG5h
bmQgcGFnZXMKPiBhbmQgY2hlY2sgaW50ZXJuYWxseSBvbiBldmVyeSByZWFkL3dyaXRlIGlmIHRo
aXMgc3BlY2lhbCBjb25maWd1cmF0aW9uCj4gc2hvdWxkIHVzZWQgZm9yIHRoYXQgcGFnZSBvciB0
aGUgbm9ybWFsIG9uZS4KPiAKPiBUaGUgcmVhc29uIGZvciBhbGwgb2YgdGhpcyBpcyB0aGF0IHFj
b20gRk9SIFNPTUUgUkVBU09OLCBkaXNhYmxlIEVDQyBmb3IKPiBzcGFyZSBkYXRhIG9ubHkgZm9y
IHRoZXNlIGJvb3QgcGFydGl0aW9uIGFuZCB3ZSBuZWVkIHRvIHJlZmxlY3QgdGhpcwo+IHNwZWNp
YWwgY29uZmlndXJhdGlvbiB0byBtdXRlIHRoZXNlIHdhcm5pbmcgYW5kIHRvIHBlcm1pdCBhY3R1
YWxseQo+IHdyaXRpbmcgdG8gdGhlc2UgcGFnZXMuCj4gCj4gdjQ6Cj4gLSBGaXggd3JvbmcgY29t
cGF0aWJsZSBzZXQgZm9yIGJvb3QtcGFnZXMgKGlwcTgwNzQgaW5zdGVhZCBvZiBpcHE4MDZ4KQo+
IHYzOgo+IC0gRml4IHR5cG8gaW4gRG9jbXVuZXRhdGlvbiBjb21taXQgZGVzcmlwdGlvbgo+IC0g
QWRkIGl0ZW1zIGRlc2NyaXB0aW9uIGZvciB1aW50MzItbWF0cml4Cj4gdjI6Cj4gLSBBZGQgZml4
ZXMgZnJvbSBLcnp5c3p0b2YgaW4gRG9jdW1lbnRhdGlvbgo+IAo+IEFuc3VlbCBTbWl0aCAoMik6
Cj4gICBtdGQ6IG5hbmQ6IHJhdzogcWNvbV9uYW5kYzogYWRkIHN1cHBvcnQgZm9yIHVucHJvdGVj
dGVkIHNwYXJlIGRhdGEKPiAgICAgcGFnZXMKPiAgIGR0LWJpbmRpbmdzOiBtdGQ6IHFjb21fbmFu
ZGM6IGRvY3VtZW50IHFjb20sYm9vdC1wYWdlcyBiaW5kaW5nCj4gCj4gIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwgICB8ICAyNiArKysKPiAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvcWNvbV9uYW5kYy5jICAgICAgICAgICAgIHwgMTQ4ICsrKysrKysrKysrKysrKysr
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE2OSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+
IAo+IC0tIAo+IDIuMzQuMQo+IAoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprg
rqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
