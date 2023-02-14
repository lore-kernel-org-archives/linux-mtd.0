Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA4BC61DA4
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Feb 2023 15:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kut6CgbK0IW83cPI5Qp6VDuozOO2oNo8D4L3op7gDuY=; b=a3xwcTM+D8XC3W
	cQ7Bvu3SIZMI6/hxpAB7gaOnPjajcT+hhtvY82B86l7wc15a4BE1GdBLR4Ehdp3y4qvIidvhBKiAN
	FcWRBqJY6uKRYfj75TOej2br4lwpXW6km5+ddGi3PjZmrOjL0D5NwGZlJkHkwZ0CSgZhkWDZQ3IyB
	6ihhLip57ye8KTeu7QM1tgbYE1n7UeGZufPp1ZImmBt0wtX+lGgmTga16iHjEzwux+JVD4Y7cBc05
	eb8HJKPV0aNWzEwF1PGO/Q5djoReyoS/qmJmKgqT6qAVCAODI2RP4HCxEUUecE+DDrNIKJLD4jaW0
	NirPOZASorGtjkME6fzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwsI-002OSI-Tl; Tue, 14 Feb 2023 15:05:43 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwY1-002GVA-H0
	for linux-mtd@lists.infradead.org; Tue, 14 Feb 2023 14:44:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E976E40009;
	Tue, 14 Feb 2023 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676385880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=spc8MwHpcjXgH4ztj2eiUqqTcn2TdRR+RZKvGct5U4M=;
	b=mLlalOBeJtNca5NZp/JfEJYC3gTbI74xNgXIKae64Y0pqN0RthdmJRJy92EjgKWDF2gIac
	0EIOt2l9hAGg9qptE6DnUPSV64dZQ/L7+C2zJtMxiBk5FGFkA0pEUPd7tIuGXrN3TpcI9P
	RFaLVQa4/j4nhJAG2TRkr9alGESGvYb1bYBZNCyRgSyr4QzFv9Z9zjvpmuRwfM2QcCyDpu
	jdVQrefBvkt5NYZb6pTRrxSNLOxY5HWul5OZAFOzlEg0OIZ7NnK7W2MMoEfeMNiRnFBzdX
	tM/P2+9u2Cicj58KMvIslKfbEp0mR85LNh6SQqvEPrjPKeKkgxuhoU/BXW6Jsg==
Date: Tue, 14 Feb 2023 15:44:33 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document CPOL/CPHA
 support
Message-ID: <20230214154433.6a421c51@xps-13>
In-Reply-To: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
References: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_064445_953189_B83CE1AC 
X-CRM114-Status: GOOD (  15.14  )
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

SGkgR2VlcnQsIEtyenlzenRvZiwgUm9iLAoKZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUgd3JvdGUg
b24gVHVlLCAxNCBGZWIgMjAyMyAxNToyNjo0MyArMDEwMDoKCj4gU1BJIEVFUFJPTXMgdHlwaWNh
bGx5IHN1cHBvcnQgYm90aCBTUEkgTW9kZSAwIChDUE9MPUNQSEE9MCkgYW5kIE1vZGUgMwo+IChD
UE9MPUNQSEE9MSkuICBIb3dldmVyLCB1c2luZyB0aGUgbGF0dGVyIGlzIGN1cnJlbnRseSBmbGFn
Z2VkIGFzIGFuCj4gZXJyb3IgYnkgIm1ha2UgZHRic19jaGVjayIsIGUuZy46Cj4gCj4gICAgIGFy
Y2gvYXJtL2Jvb3QvZHRzL3I4YTc3OTEta29lbHNjaC5kdGI6IGZsYXNoQDA6IFVuZXZhbHVhdGVk
IHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgnc3BpLWNwaGEnLCAnc3BpLWNwb2wnIHdlcmUg
dW5leHBlY3RlZCkKPiAJICAgIEZyb20gc2NoZW1hOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbAo+IAo+IEZpeCB0aGlzIGJ5IGRvY3VtZW50
aW5nIHN1cHBvcnQgZm9yIENQT0w9Q1BIQT0xLgo+IAo+IEZpeGVzOiAyMzMzNjNhYmE3MmFjNjM4
ICgic3BpL3BhbmVsOiBkdC1iaW5kaW5nczogZHJvcCBDUEhBIGFuZCBDUE9MIGZyb20gY29tbW9u
IHByb3BlcnRpZXMiKQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbAo+IGluZGV4IGY4NjI1NWNlMTNh
ZjA4NzEuLmJiNjJhYzQ1ODU4MjI5ODIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbAo+IEBAIC03Niw2
ICs3NiwxMyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICBJZiAiYnJva2VuLWZsYXNoLXJlc2V0IiBp
cyBwcmVzZW50IHRoZW4gaGF2aW5nIHRoaXMgcHJvcGVydHkgZG9lcyBub3QKPiAgICAgICAgbWFr
ZSBhbnkgZGlmZmVyZW5jZS4KPiAgCj4gKyAgc3BpLWNwb2w6IHRydWUKPiArICBzcGktY3BoYTog
dHJ1ZQoKSSBzZWUgdGhhdCBzcGktY3BvbCBhbmQgc3BpLWNwaGEgYXJlIGRlc2NyaWJlZCBpbiBz
cGktY29udHJvbGxlci55YW1sCndoaWNoIHJlZmVyZW5jZXMgc3BpLXBlcmlwaGVyYWwtcHJvcHMu
eWFtbCwgYnV0IGplZGVjLHNwaS1ub3IueWFtbApvbmx5IHJlZmVyZW5jZXMgc3BpLXBlcmlwaGVy
YWwtcHJvcHMueWFtbCBsZWFkaW5nIHRvIHNwaS1jcG9sIGFuZApzcGktY3BoYSBub3QgYmVpbmcg
cmVjb2duaXplZCBhcyB2YWxpZCBwcm9wZXJ0aWVzLgoKV291bGRuJ3QgaXQgYmUgY2xlYW5lciB0
byB0byBoYXZlIHRoZXNlIHR3byBwcm9wZXJ0aWVzIGRlZmluZWQgaW4Kc3BpLXBlcmlwaGVyYWwt
cHJvcHMueWFtbCBpbnN0ZWFkPwoKPiArCj4gK2RlcGVuZGVuY2llczoKPiArICBzcGktY3BvbDog
WyBzcGktY3BoYSBdCj4gKyAgc3BpLWNwaGE6IFsgc3BpLWNwb2wgXQo+ICsKPiAgdW5ldmFsdWF0
ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ICAKPiAgZXhhbXBsZXM6CgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
