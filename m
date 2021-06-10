Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10A8C47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 16:02:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B19A260FEA
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 16:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B19A260FEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBtoQaLlgrStfdMPp1T8kfhX2Gnj533OzRsYsEZpVAs=; b=zEPgL0KNqxli6m
	lHrZXBVCbkc3bf4qpBTW9R0Tuv7/Fv7+iCrqd9pWfIeABsIHOOuF7qfnXHtttCFlp4NtkBTgJMWD9
	ujWwuMM+LY7tab00ermrAxnKXVpTf+eQj0mL7mOLt3BJ9q83hqEFS6eAByz/MfrAO7hp0b0lqcy0z
	pkul2GT7+f412lm6G307C1ncMb8GlFdconKJFxzKYQnh0Fwi3iN1yLmPehDgnY52LRUBVtUCBwWN+
	4UKYkIpXcvviOi9l9HsFwiwH8PxK9qeEE2IO9SJxxwi0XdGFVHUiM2pK+wtwYjQ32SLSnsMKcUad3
	oTIPGMG3PcQyveJNHIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrN8U-001YBh-VL; Thu, 10 Jun 2021 16:02:27 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrN7K-001XmT-Pp; Thu, 10 Jun 2021 16:01:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B313C20010;
 Thu, 10 Jun 2021 16:01:08 +0000 (UTC)
Date: Thu, 10 Jun 2021 18:01:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@canonical.com>, Michal Simek
 <monstr@monstr.eu>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Amit
 Kumar Mahapatra <akumarma@xilinx.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, helmut.grohne@intenta.de, Srinivas Goud
 <sgoud@xilinx.com>, Siva Durga Prasad Paladugu <sivadur@xilinx.com>
Subject: Re: [PATCH v23 08/18] dt-binding: memory: pl353-smc: Enhance the
 description of the reg property
Message-ID: <20210610180107.1cc889f3@xps13>
In-Reply-To: <20210610155345.GA1873816@robh.at.kernel.org>
References: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
 <20210610082040.2075611-9-miquel.raynal@bootlin.com>
 <20210610155345.GA1873816@robh.at.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_090115_023535_3BFD3B20 
X-CRM114-Status: GOOD (  22.24  )
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

SGkgUm9iLCBLcnp5c3p0b2YsCgpSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZSBv
biBUaHUsIDEwIEp1biAyMDIxIDEwOjUzOjQ1IC0wNTAwOgoKPiBPbiBUaHUsIEp1biAxMCwgMjAy
MSBhdCAxMDoyMDozMEFNICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gVGhlIFNNQyBi
dXMgY29udHJvbGxlciBmZWF0dXJlcyBzZXZlcmFsIHJlZ2lzdGVyIHNldHMuIFRoZSBvbmUgcG9p
bnRlZAo+ID4gYnkgdGhlIHJlZyBwcm9wZXJ0eSBpcyBmb3IgdGhlIFNNQyBjb25maWd1cmF0aW9u
IChpbXBhY3RzIHRoZQo+ID4gc3ViLWNvbnRyb2xsZXJzIGNvbmZpZ3VyYXRpb24pLCB3aGlsZSB0
aGUgb3RoZXJzIGFyZSBtZWFudCB0byBiZSB1c2VkIHRvCj4gPiBzZW5kIHJlZ3VsYXIgY3ljbGVz
IG9uIHRoZSBtZW1vcnkgYnVzIChlZy4gQ01ELCBBRERSLCBEQVRBIGZvciBhIE5BTkQKPiA+IGRl
dmljZSkuIERldGFpbCB0aGlzIGEgbGl0dGxlIGJpdCBmb3IgdGhlIHNha2Ugb2YgY2xhcml0eS4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250
cm9sbGVycy9wbDM1My1zbWMudHh0ICAgICAgIHwgMyArKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3BsMzUzLXNt
Yy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xs
ZXJzL3BsMzUzLXNtYy50eHQKPiA+IGluZGV4IGVjZDQ2ODU2ZjEzOS4uYmE2YTU0MjZmNjJiIDEw
MDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1j
b250cm9sbGVycy9wbDM1My1zbWMudHh0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3BsMzUzLXNtYy50eHQKPiA+IEBAIC01LDcg
KzUsOCBAQCBvZiBtZW1vcnkgaW50ZXJmYWNlczogTkFORCBhbmQgbWVtb3J5IG1hcHBlZCBpbnRl
cmZhY2VzIChzdWNoIGFzIFNSQU0gb3IgTk9SKS4KPiA+ICAKPiA+ICBSZXF1aXJlZCBwcm9wZXJ0
aWVzOgo+ID4gIC0gY29tcGF0aWJsZQkJOiBTaG91bGQgYmUgImFybSxwbDM1My1zbWMtcjJwMSIs
ICJhcm0scHJpbWVjZWxsIi4KPiA+IC0tIHJlZwkJCTogQ29udHJvbGxlciByZWdpc3RlcnMgbWFw
IGFuZCBsZW5ndGguCj4gPiArLSByZWcJCQk6IFNNQyBjb250cm9sbGVyIGFuZCBzdWItY29udHJv
bGxlcnMgY29uZmlndXJhdGlvbgo+ID4gKwkJCSAgcmVnaXN0ZXJzLiAgCj4gCj4gSSB0aGluayB5
b3UgY291bGQganVzdCBkcm9wIHRoaXMgcGF0Y2guIE90aGVyd2lzZSwgdGhpcyBkb2Vzbid0IG1h
dGNoIAo+IHdoYXQncyBub3cgaW4gdGhlIHlhbWwgZmlsZS4KCkZpbmUuCgpLcnp5c3p0b2YsIGlm
IGl0J3Mgc3RpbGwgdGltZSB5b3UgY2FuIGp1c3QgdGFrZSBwYXRjaCA5IHdoaWNoIFJvYgpqdXN0
IGFja2VkIGFuZCBmb3JnZXQgYWJvdXQgdGhpcyBvbmUuIEkgdGhpbmsgd2UnbGwgYmUgZ29vZC4g
T3RoZXJ3aXNlCnRoYXQgd2lsbCBiZSBmb3IgdGhlIG5leHQgTVcgOykKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
