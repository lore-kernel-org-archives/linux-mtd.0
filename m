Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C6FC04FFE
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2024 19:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YtGApqEQ+tGaMMRgQjk5Jo3QYQtMOa2ZT9YJEir1DD8=; b=meWSNywEPk1c36
	D00BxV8rc1EvTYQWnKdg5ElWMSXvx9pmJ9KXCxykxPAjN/lPDUQ9MGfbbp9qy5KUKGPnGuZL64erx
	tgYRE6+MedJGWAKZgPtvjmkL26QIM36rvUqYxQOV2fJdMDUJs6v+O2beLO5YjjTZCfK07hhnc9Zcm
	rJVhCM3tzSvRHSla8jiju3UW2eAD8gFjLIE1iXEPc5hWFGmKdPoC8vKCxe/SYPQNcHBNDJLQCnUMO
	FTvDVmuULxyVHisC+1rMTr2Dy/j9rT+H6Gub+RiUbP3fI+JCi2gaLV7duf1OOwE4GW0b6H79z2gd/
	6OTMH5a1pbEbLJBHgX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s83bf-00000008rSL-2v5k;
	Fri, 17 May 2024 19:51:07 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s83bb-00000008rR3-257p;
	Fri, 17 May 2024 19:51:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8C7BFF803;
	Fri, 17 May 2024 19:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715975460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QlP3PK23BxpttVUOU8FsAkJILKdtrU2gUyyrnf+ZS/Y=;
	b=QSFXmsaVERvB0isdMhxp1MzMnwr57OGNI00otZAQqzk95G1OG2DZXWOPdxN3iFj524NAss
	PXlV5t5b1+oiUzmJTq+BbMwM3+EsiR+tROgxM/A85pJVIktMj6XBepj31fJYqWcd2fw1fk
	3T2W9KCMu2URjBIkukDhMOtRrz/LWNCieQpkMlXZ0oTMe2TM7O0sdj/fXSMI7BsAJIC0wc
	oZE5/se95lpTcSDRUquO51JS4p18WZtgv8+8r60jO44Th8gL275xumbrT1DOz+xuR/4u4Y
	8+r9w/HXGdBDYX8i9YVRvSNRj+HcAvO23OIxBRg/UFkmLwSxJ+Ef1O/vfn8BnA==
Date: Fri, 17 May 2024 21:50:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Han Xu
 <han.xu@nxp.com>, Vinod Koul <vkoul@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: mtd: gpmi-nand: Add
 'fsl,imx8qxp-gpmi-nand' compatible string
Message-ID: <20240517215055.02622324@xps-13>
In-Reply-To: <Zkes3n6ZLjIFFQUK@lizhi-Precision-Tower-5810>
References: <20240517-gpmi_nand-v1-0-73bb8d2cd441@nxp.com>
	<20240517-gpmi_nand-v1-1-73bb8d2cd441@nxp.com>
	<20240517203621.72b8b9c7@xps-13>
	<Zkes3n6ZLjIFFQUK@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_125103_986230_4D6A2912 
X-CRM114-Status: GOOD (  16.28  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIEZyaSwgMTcgTWF5IDIwMjQgMTU6
MTU6NDIgLTA0MDA6Cgo+IE9uIEZyaSwgTWF5IDE3LCAyMDI0IGF0IDA4OjM2OjIxUE0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmFuaywKPiA+IAo+ID4gRnJhbmsuTGlAbnhw
LmNvbSB3cm90ZSBvbiBGcmksIDE3IE1heSAyMDI0IDE0OjA5OjQ4IC0wNDAwOgo+ID4gICAKPiA+
ID4gQWRkICdmc2wsaW14OHF4cC1ncG1pLW5hbmQnIGNvbXBhdGlibGUgc3RyaW5nIGFuZCBjbG9j
ay1uYW1lcyByZXN0cmljdGlvbi4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExp
IDxGcmFuay5MaUBueHAuY29tPgo+ID4gPiAtLS0KPiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9ncG1pLW5hbmQueWFtbCAgICAgICAgIHwgMjIgKysrKysrKysrKysrKysrKysrKysr
Kwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2dwbWktbmFu
ZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9ncG1pLW5hbmQu
eWFtbAo+ID4gPiBpbmRleCAwMjFjMGRhMGIwNzJmLi5mOWViMTg2OGNhMWY0IDEwMDY0NAo+ID4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2dwbWktbmFuZC55
YW1sCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvZ3Bt
aS1uYW5kLnlhbWwKPiA+ID4gQEAgLTI0LDYgKzI0LDcgQEAgcHJvcGVydGllczoKPiA+ID4gICAg
ICAgICAgICAtIGZzbCxpbXg2cS1ncG1pLW5hbmQKPiA+ID4gICAgICAgICAgICAtIGZzbCxpbXg2
c3gtZ3BtaS1uYW5kCj4gPiA+ICAgICAgICAgICAgLSBmc2wsaW14N2QtZ3BtaS1uYW5kCj4gPiA+
ICsgICAgICAgICAgLSBmc2wsaW14OHF4cC1ncG1pLW5hbmQKPiA+ID4gICAgICAgIC0gaXRlbXM6
Cj4gPiA+ICAgICAgICAgICAgLSBlbnVtOgo+ID4gPiAgICAgICAgICAgICAgICAtIGZzbCxpbXg4
bW0tZ3BtaS1uYW5kCj4gPiA+IEBAIC0xNTEsNiArMTUyLDI3IEBAIGFsbE9mOgo+ID4gPiAgICAg
ICAgICAgICAgLSBjb25zdDogZ3BtaV9pbwo+ID4gPiAgICAgICAgICAgICAgLSBjb25zdDogZ3Bt
aV9iY2hfYXBiCj4gPiA+ICAKPiA+ID4gKyAgLSBpZjoKPiA+ID4gKyAgICAgIHByb3BlcnRpZXM6
Cj4gPiA+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4gPiA+ICsgICAgICAgICAgY29udGFpbnM6Cj4g
PiA+ICsgICAgICAgICAgICBlbnVtOgo+ID4gPiArICAgICAgICAgICAgICAtIGZzbCxpbXg4cXhw
LWdwbWktbmFuZAo+ID4gPiArICAgIHRoZW46Cj4gPiA+ICsgICAgICBwcm9wZXJ0aWVzOgo+ID4g
PiArICAgICAgICBjbG9ja3M6Cj4gPiA+ICsgICAgICAgICAgaXRlbXM6Cj4gPiA+ICsgICAgICAg
ICAgICAtIGRlc2NyaXB0aW9uOiBTb0MgZ3BtaSBpbyBjbG9jawo+ID4gPiArICAgICAgICAgICAg
LSBkZXNjcmlwdGlvbjogU29DIGdwbWkgYXBiIGNsb2NrICAKPiA+IAo+ID4gSSBiZWxpZXZlIHRo
ZXNlIHR3byBjbG9ja3MgYXJlIG1hbmRhdG9yeT8gIAo+IAo+IG1pbkl0ZW1zIGRlZmF1bHQgaXMg
ZXF1YWwgdG8gaXRlbXMgbnVtYmVycywgaGVyZSBpcyA0LiBTbyBhbGwgNCBjbG9jayBhcmUKPiBt
YW5kYXRvcnkuCj4gCj4gQW55dGhpbmcgd3JvbmcgaGVyZT8KCkknZCBzYXkgdGhhdCB0aGUgdHdv
ICJiY2giIGNsb2NrcyBhcmUgb25seSB1c2VkIGlmIHlvdSBkZWNpZGUgdG8KY29uZmlndXJlIHRo
ZSBvbi1ob3N0IGhhcmR3YXJlIEVDQyBlbmdpbmUgYW5kIHRodXMgYXJlIG5vdCBuZWVkZWQgd2l0
aApzb2Z0d2FyZSBjb3JyZWN0aW9ucywgYnV0IEknbSBmaW5lIGtlZXBpbmcgdGhlIGZvdXJ0aCBk
ZXNjcmliZWQgaW4gYWxsCmNhc2VzIGlmIHRoYXQncyBzaW1wbGVyLgoKQWxzbyxoZXJlIHRoZSBk
aWZmIGp1c3Qgc2hvd3MgdGhhdCAiaWYgd2UgcHJvdmlkZSBhIGNsb2NrcyBwcm9wZXJ0eQp3aXRo
IHRoaXMgY29tcGF0aWJsZSwgdGhlbiB3ZSBuZWVkIHRvIHByb3ZpZGUgNCBtZW1iZXJzIiwgSSBi
ZWxpZXZlIHRoZQoicmVxdWlyZWQiIHByb3BlcnR5IGlzIGFscmVhZHkgZmlsbGVkIHNvbWV3aGVy
ZSB3aXRoIHRoZQpjbG9ja3MvY2xvY2stbmFtZXMgcHJvcGVydGllcz8KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
